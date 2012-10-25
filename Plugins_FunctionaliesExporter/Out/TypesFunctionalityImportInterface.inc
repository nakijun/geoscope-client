//. import types functionality routines

const TypesDLL = 'SOAPClient.exe';

//. TTTileServerVisualizationFunctionality
Type
  TTTileServerVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TTileServerVisualizationFunctionality
Type
  TTileServerVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    procedure SetParams(const pWidth: integer; const pHeight: integer);
    procedure SetProportion(const Value: double);
    procedure Clear;
    function GetSegmentsStorageType: integer;
    procedure SetSegmentsStorageType(Value: integer);
    function ContainerFilled: boolean;
    procedure GetLevelsInfoLocally(out Info: TByteArray);
    function TLevelsPropsPanel_Create: TForm;
    procedure Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
    procedure Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
    function UserData_GetTileProviderID(out oTileProviderID: integer): boolean;
    procedure UserData_SetTileProviderID(const pTileProviderID: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out oWidth: integer; out oHeight: integer);
    procedure GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
    procedure SetServerType(const Value: integer);
    procedure SetServerURL(const Value: string);
    procedure SetServerData(const Data: TByteArray);
    procedure SetServerData1(const pData: TMemoryStream);
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
    property   Name: string read getName;
  end;

//. TTMeasurementObjectFunctionality
Type
  TTMeasurementObjectFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function CreateNewInstance(const pName: string; const pDomains: string): integer;
    function CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    function CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    procedure GetInstanceListByNameContext(const pName: string; out List: TByteArray);
    procedure GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
    function GetInstanceByGUID(const pGUID: string): integer;
    function GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
    property   Name: string read getName;
  end;

//. TMeasurementObjectFunctionality
Type
  TMeasurementObjectFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName write setName;
    property   GUID: string read getGUID;
    property   Domains: string read getDomains write setDomains;
  end;

//. TTAreaNotificationServerFunctionality
Type
  TTAreaNotificationServerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TAreaNotificationServerFunctionality
Type
  TAreaNotificationServerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
    property   Name: string read getName write setName;
    property   Info: string read getInfo write setInfo;
  end;

//. TTMODELServerVisualizationFunctionality
Type
  TTMODELServerVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TMODELServerVisualizationFunctionality
Type
  TMODELServerVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getServerURL: string;
    procedure setServerURL(Value: string);
    property   Name: string read getName;
    property   ServerURL: string read getServerURL write setServerURL;
  end;

//. TTDoubleVarFunctionality
Type
  TTDoubleVarFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TDoubleVarFunctionality
Type
  TDoubleVarFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function getValue: Double;
    procedure setValue(_Value: Double);
    function getSetTimeStamp: TDateTime;
    property   Name: string read getName;
    property   Value: Double read getValue write setValue;
    property   SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

//. TTInt32VarFunctionality
Type
  TTInt32VarFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TInt32VarFunctionality
Type
  TInt32VarFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function getValue: integer;
    procedure setValue(_Value: integer);
    function getSetTimeStamp: TDateTime;
    property   Name: string read getName;
    property   Value: integer read getValue write setValue;
    property   SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

//. TTURLFunctionality
Type
  TTURLFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TURLFunctionality
Type
  TURLFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName;
    property   URL: string read getURL write setURL;
    property   URLName: string read getURLName write setURLName;
    property   flPanelBrowser: boolean read getflPanelBrowser write setflPanelBrowser;
  end;

//. TTPatternVisualizationFunctionality
Type
  TTPatternVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TPatternVisualizationFunctionality
Type
  TPatternVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTMapFormatObjectFunctionality
Type
  TTMapFormatObjectFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
    function GetDATAHash(DATAStream: TByteArray): integer;
    function GetDATAHash1(DATAStream: TMemoryStream): integer;
    property   Name: string read getName;
  end;

//. TMapFormatObjectFunctionality
Type
  TMapFormatObjectFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATAPanel_Create: TForm;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
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
    procedure GetDATA1(out DATAStream: TMemoryStream);
    procedure SetDATA(DATAStream: TByteArray);
    procedure SetDATA1(DATAStream: TMemoryStream);
    function getDATAHash: integer;
    procedure setDATAHash(Value: integer);
    procedure GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
    procedure SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
    procedure SetObjectByDATA;
    procedure UpdateDATAHash;
    procedure Compile;
    procedure Build(const flUsePrototype: boolean);
    property   idMap: integer read getidMap write setidMap;
    property   FormatID: integer read getFormatID write setFormatID;
    property   KindID: integer read getKindID write setKindID;
    property   TypeID: integer read getTypeID write setTypeID;
    property   DATAHash: integer read getDATAHash write setDATAHash;
    property   Name: string read getName write setName;
  end;

//. TTMapFormatMapFunctionality
Type
  TTMapFormatMapFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
    property   Name: string read getName;
  end;

//. TMapFormatMapFunctionality
Type
  TMapFormatMapFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getGeoSpaceID: integer;
    procedure setGeoSpaceID(Value: integer);
    function getFormatID: integer;
    procedure setFormatID(Value: integer);
    function getName: string;
    procedure setName(Value: string);
    procedure GetDATA(out DATAStream: TByteArray);
    procedure GetDATA1(out DATAStream: TMemoryStream);
    procedure SetDATA(DATAStream: TByteArray);
    procedure SetDATA1(DATAStream: TMemoryStream);
    procedure GetObjectPrototypesDATA(out DATAStream: TByteArray);
    procedure GetObjectPrototypesDATA1(out DATAStream: TMemoryStream);
    procedure SetObjectPrototypesDATA(DATAStream: TByteArray);
    procedure SetObjectPrototypesDATA1(DATAStream: TMemoryStream);
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
    property   GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property   FormatID: integer read getFormatID write setFormatID;
    property   Name: string read getName write setName;
  end;

//. TTSPLVisualizationFunctionality
Type
  TTSPLVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TSPLVisualizationFunctionality
Type
  TSPLVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out SPLType: integer; out SPLDATA: TByteArray);
    procedure SetParams(const SPLType: integer; const SPLDATA: TByteArray);
    property   Name: string read getName;
  end;

//. TTBoolVarFunctionality
Type
  TTBoolVarFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TBoolVarFunctionality
Type
  TBoolVarFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function getValue: boolean;
    procedure setValue(_Value: boolean);
    function getSetTimeStamp: TDateTime;
    property   Name: string read getName;
    property   Value: boolean read getValue write setValue;
    property   SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

//. TTGeoSpaceFunctionality
Type
  TTGeoSpaceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TGeoSpaceFunctionality
Type
  TGeoSpaceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetDatumIDLocally: integer;
    function ConvertGeoToXYLocally(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
    function ConvertXYToGeoLocally(const X,Y: Extended; out Lat,Long: Extended): boolean;
    function GetDistanceBetweenTwoXYPointsLocally(const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean;
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
    procedure GetGeoCrdSystemList1(out List: TList);
    procedure GetMapFormatMapList(out List: TByteArray);
    procedure GetMapFormatMapList1(out List: TList);
    procedure GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
    procedure GetMapFormatMapObjectsByNameContext1(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList);
    property   Name: string read getName write setName;
    property   DatumID: integer read getDatumID write setDatumID;
    property   ProjectionID: integer read getProjectionID write setProjectionID;
  end;

//. TTUserAlertFunctionality
Type
  TTUserAlertFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetActiveInstanceList(out List: TByteArray);
    procedure GetActiveInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TUserAlertFunctionality
Type
  TUserAlertFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    procedure GetDATA1(out DATAStream: TMemoryStream);
    procedure SetDATA(DATAStream: TByteArray);
    procedure SetDATA1(DATAStream: TMemoryStream);
    property   Name: string read getName;
    property   UserID: integer read getUserID write setUserID;
    property   TimeStamp: TDateTime read getTimeStamp write setTimeStamp;
    property   Active: boolean read getActive write setActive;
    property   AlertID: integer read getAlertID write setAlertID;
    property   Severity: integer read getSeverity write setSeverity;
    property   Description: string read getDescription write setDescription;
  end;

//. TTGeoGraphServerObjectFunctionality
Type
  TTGeoGraphServerObjectFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
    property   Name: string read getName;
  end;

//. TGeoGraphServerObjectFunctionality
Type
  TGeoGraphServerObjectFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure AttachObject;
    procedure DetachObject;
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
    property   Name: string read getName;
    property   GeoGraphServerID: integer read getGeoGraphServerID write setGeoGraphServerID;
    property   ObjectID: integer read getObjectID write setObjectID;
    property   BusinessModelID: integer read getBusinessModelID write setBusinessModelID;
    property   Domains: string read getDomains write setDomains;
  end;

//. TTGeoGraphServerFunctionality
Type
  TTGeoGraphServerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetActiveInstanceList(out List: TByteArray);
    procedure GetActiveInstanceList1(out List: TList);
    function GetInstanceForRegistration: integer;
    property   Name: string read getName;
  end;

//. TGeoGraphServerFunctionality
Type
  TGeoGraphServerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure SetData(DATAStream: TMemoryStream);
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
    procedure GetData1(out DATAStream: TMemoryStream);
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
    property   Name: string read getName write setName;
    property   Address: string read getAddress write setAddress;
    property   InternalAddress: string read getInternalAddress write setInternalAddress;
    property   Info: string read getInfo write setInfo;
  end;

//. TTGeoCrdSystemFunctionality
Type
  TTGeoCrdSystemFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceByLatLongLocally(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceByLatLongLocally1(const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer);
    procedure GetInstanceByXYLocally(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
    procedure GetInstanceByXYLocally1(const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer);
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    procedure GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
    property   Name: string read getName;
  end;

//. TGeoCrdSystemFunctionality
Type
  TGeoCrdSystemFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure GetDataLocally(out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream);
    procedure GetGeodesyPointsLocally(out Points: TByteArray);
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
    procedure GetProjectionDATA1(out DATAStream: TMemoryStream);
    procedure SetProjectionDATA(DATAStream: TByteArray);
    procedure SetProjectionDATA1(DATAStream: TMemoryStream);
    procedure GetGeodesyPoints(out Points: TByteArray);
    property   GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property   Name: string read getName write setName;
    property   Datum: string read getDatum write setDatum;
    property   Projection: string read getProjection write setProjection;
  end;

//. TTFilterVisualizationFunctionality
Type
  TTFilterVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TFilterVisualizationFunctionality
Type
  TFilterVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out FilterType: integer; out FilterDATA: TByteArray);
    procedure SetParams(const FilterType: integer; const FilterDATA: TByteArray);
    property   Name: string read getName;
  end;

//. TTHINTVisualizationFunctionality
Type
  TTHINTVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    procedure GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
    property   Name: string read getName;
  end;

//. THINTVisualizationFunctionality
Type
  THINTVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    procedure GetPrivateDATA(out DATAStream: TByteArray);
    procedure GetPrivateDATA1(out DATAStream: TByteArray; const MaxSize: integer);
    procedure GetPrivateDATA2(out DATAStream: TMemoryStream);
    procedure GetPrivateDATA3(out DATAStream: TMemoryStream; const MaxSize: integer);
    procedure SetPrivateDATA(DATAStream: TByteArray);
    procedure SetPrivateDATA1(DATAStream: TMemoryStream);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTDetailedPictureVisualizationFunctionality
Type
  TTDetailedPictureVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TDetailedPictureVisualizationFunctionality
Type
  TDetailedPictureVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    procedure SetParams(const pWidth: integer; const pHeight: integer);
    procedure SetProportion(const Value: double);
    procedure Clear;
    function GetSegmentsStorageType: integer;
    procedure SetSegmentsStorageType(Value: integer);
    function ContainerFilled: boolean;
    procedure GetLevelsInfoLocally(out Info: TByteArray);
    function TLevelsPropsPanel_Create: TForm;
    procedure Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
    procedure Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
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
    property   Name: string read getName;
  end;

//. TTCoVisualizationFunctionality
Type
  TTCoVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TCoVisualizationFunctionality
Type
  TCoVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    procedure UpdateContainer(out oContainer: TExtendedContainerCoord);
    procedure DATAFile_Clear;
    function GetOwnSpaceHINTVisualizationLocally(out idHINTVisualization: integer): boolean;
    procedure ToClone(out idClone: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetSpace(out DATAStream: TByteArray);
    procedure GetSpace1(out DATAStream: TByteArray; const MaxSize: integer);
    procedure GetSpace2(out DATAStream: TMemoryStream);
    procedure GetSpace3(out DATAStream: TMemoryStream; const MaxSize: integer);
    procedure SetSpace(DATAStream: TByteArray);
    procedure SetSpace1(DATAStream: TMemoryStream);
    function GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure Pack;
    procedure UnPack;
    function IsPacked: boolean;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTForumMessageFunctionality
Type
  TTForumMessageFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TForumMessageFunctionality
Type
  TForumMessageFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function FunctionalityUserID: integer;
    procedure setidUser(Value: integer);
    procedure Modified;
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
    procedure GetMessage1(out Message: TMemoryStream);
    procedure SetMessage(const Message: TByteArray);
    procedure SetMessage1(const Message: TMemoryStream);
    function ReplyMessageCount: integer;
    procedure GetReplyMessageList(out MessageList: TByteArray);
    procedure GetReplyMessageList1(out MessageList: TList);
    property   Name: string read getName;
    property   idForum: integer read getidForum write setidForum;
    property   idForMessage: integer read getidForMessage write setidForMessage;
  end;

//. TTForumFunctionality
Type
  TTForumFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TForumFunctionality
Type
  TForumFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure DeleteOldMessages(const pMessageLifeTime: TDateTime);
    function getName: string;
    procedure setName(Value: string);
    function getMessageLifeTime: TDateTime;
    procedure setMessageLifeTime(Value: TDateTime);
    function getHint: string;
    function RootMessageCount: integer;
    procedure GetRootMessageList(out MessageList: TByteArray);
    procedure GetRootMessageList1(out MessageList: TList);
    function MessageCount: integer;
    procedure GetMessageList(out MessageList: TByteArray);
    procedure GetMessageList1(out MessageList: TList);
    function AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
    procedure DestroyMessage(const pidMessage: integer);
    property   Name: string read getName write setName;
    property   MessageLifeTime: TDateTime read getMessageLifeTime write setMessageLifeTime;
  end;

//. TTCUSTOMVisualizationFunctionality
Type
  TTCUSTOMVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TCUSTOMVisualizationFunctionality
Type
  TCUSTOMVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function ContainerFilled: boolean;
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
    property   Name: string read getName;
    property   MODULEName: string read getMODULEName write setMODULEName;
    property   FunctionName: string read getFunctionName write setFunctionName;
    property   FunctionVersion: integer read getFunctionVersion write setFunctionVersion;
  end;

//. TTOLEVisualizationFunctionality
Type
  TTOLEVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOLEVisualizationFunctionality
Type
  TOLEVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    procedure EditDATA;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure GetDATA2(out Value: TClientBlobStream);
    procedure GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    property   Name: string read getName;
  end;

//. TTHTMLVisualizationFunctionality
Type
  TTHTMLVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. THTMLVisualizationFunctionality
Type
  THTMLVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    procedure EditDATA;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getWidth: integer;
    procedure setWidth(Value: integer);
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure GetDATA2(out Value: TClientBlobStream);
    procedure GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    property   Name: string read getName;
    property   Width: integer read getWidth write setWidth;
  end;

//. TTBZRVisualizationFunctionality
Type
  TTBZRVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TBZRVisualizationFunctionality
Type
  TBZRVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTAGIFVisualizationFunctionality
Type
  TTAGIFVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TAGIFVisualizationFunctionality
Type
  TAGIFVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure GetDATA2(out Value: TClientBlobStream);
    procedure GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    property   Name: string read getName;
  end;

//. TTOrientedVIDEOVisualizationFunctionality
Type
  TTOrientedVIDEOVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOrientedVIDEOVisualizationFunctionality
Type
  TOrientedVIDEOVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
    property   Name: string read getName;
    property   DataServer: string read getDataServer write setDataServer;
    property   ObjectID: integer read getObjectID write setObjectID;
  end;

//. TTVIDEOVisualizationFunctionality
Type
  TTVIDEOVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TVIDEOVisualizationFunctionality
Type
  TVIDEOVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
    property   Name: string read getName;
    property   DataServer: string read getDataServer write setDataServer;
    property   ObjectID: integer read getObjectID write setObjectID;
  end;

//. TTOPPVisualizationFunctionality
Type
  TTOPPVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOPPVisualizationFunctionality
Type
  TOPPVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getPropsPanel_idTObj: integer;
    procedure setPropsPanel_idTObj(Value: integer);
    function getPropsPanel_idObj: integer;
    procedure setPropsPanel_idObj(Value: integer);
    procedure GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
    property   Name: string read getName;
    property   PropsPanel_idTObj: integer read getPropsPanel_idTObj write setPropsPanel_idTObj;
    property   PropsPanel_idObj: integer read getPropsPanel_idObj write setPropsPanel_idObj;
  end;

//. TTMODELServerFunctionality
Type
  TTMODELServerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
    property   Name: string read getName;
  end;

//. TMODELServerFunctionality
Type
  TMODELServerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName write setName;
    property   IPAddress: string read getIPAddress write setIPAddress;
  end;

//. TTCoReferenceFunctionality
Type
  TTCoReferenceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCoReferenceFunctionality
Type
  TCoReferenceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure ShowReferencedObjectPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    procedure GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
    procedure SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
    property   Name: string read getName write setName;
  end;

//. TTPositionerFunctionality
Type
  TTPositionerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TPositionerFunctionality
Type
  TPositionerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure SetPosition;
    function getName: string;
    function getHint: string;
    procedure Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Save2DPosition1(Reflector: TReflector);
    function getPositionName: string;
    procedure setPositionName(Value: string);
    property   Name: string read getName;
    property   PositionName: string read getPositionName write setPositionName;
  end;

//. TTOrientedWMFVisualizationFunctionality
Type
  TTOrientedWMFVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOrientedWMFVisualizationFunctionality
Type
  TOrientedWMFVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure GetJPEGDATA1(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
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
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
    property   Width: Double read getWidth write setWidth;
    property   Height: Double read getHeight write setHeight;
    property   Orientation: integer read getOrientation write setOrientation;
  end;

//. TTCELLVisualizationFunctionality
Type
  TTCELLVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TCELLVisualizationFunctionality
Type
  TCELLVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure SetReflectorView;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
    function GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
    function GetFormatNodes1(out NodesList: TList; out SizeX,SizeY: integer): boolean;
    procedure DoQuad;
    procedure GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
    procedure GetInsideObjectsList1(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList);
    function getColCount: integer;
    procedure setColCount(Value: integer);
    function getRowCount: integer;
    procedure setRowCount(Value: integer);
    function getLineWidth: Double;
    procedure setLineWidth(Value: Double);
    function getColSize: Double;
    function getRowSize: Double;
    procedure GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
    property   Name: string read getName;
    property   ColCount: integer read getColCount write setColCount;
    property   RowCount: integer read getRowCount write setRowCount;
    property   LineWidth: Double read getLineWidth write setLineWidth;
    property   ColSize: Double read getColSize;
    property   RowSize: Double read getRowSize;
  end;

//. TTEllipseVisualizationFunctionality
Type
  TTEllipseVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TEllipseVisualizationFunctionality
Type
  TEllipseVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
    property   Name: string read getName;
    property   Color: TColor read getColor write setColor;
    property   BorderColor: TColor read getBorderColor write setBorderColor;
    property   BorderWidth: Double read getBorderWidth write setBorderWidth;
  end;

//. TTWMFVisualizationFunctionality
Type
  TTWMFVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TWMFVisualizationFunctionality
Type
  TWMFVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure GetJPEGDATA1(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure SetProportion;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTPictureVisualizationFunctionality
Type
  TTPictureVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TPictureVisualizationFunctionality
Type
  TPictureVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    procedure GetBMP(out BMP: TByteArray);
    procedure GetBMP1(out BMP: TBitmap);
    procedure SetProportion;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
    procedure SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTRoundVisualizationFunctionality
Type
  TTRoundVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TRoundVisualizationFunctionality
Type
  TRoundVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
    property   Name: string read getName;
    property   Color: TColor read getColor write setColor;
    property   BorderColor: TColor read getBorderColor write setBorderColor;
    property   BorderWidth: Double read getBorderWidth write setBorderWidth;
  end;

//. TTGeodesyPointFunctionality
Type
  TTGeodesyPointFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
    function ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
    procedure GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
    function CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
    function CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
    property   Name: string read getName;
  end;

//. TGeodesyPointFunctionality
Type
  TGeodesyPointFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName;
    property   idCrdSys: integer read getidCrdSys write setidCrdSys;
    property   X: Double read getX write setX;
    property   Y: Double read getY write setY;
    property   Latitude: Double read getLatitude write setLatitude;
    property   Longitude: Double read getLongitude write setLongitude;
  end;

//. TTPrivateAreaVisualizationFunctionality
Type
  TTPrivateAreaVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function CanCreateAsDetail: boolean;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TPrivateAreaVisualizationFunctionality
Type
  TPrivateAreaVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getAcquireObjectsInside: boolean;
    procedure setAcquireObjectsInside(Value: boolean);
    property   Name: string read getName;
    property   AcquireObjectsInside: boolean read getAcquireObjectsInside write setAcquireObjectsInside;
  end;

//. TTHyperTextFunctionality
Type
  TTHyperTextFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. THyperTextFunctionality
Type
  THyperTextFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure ClearDATA;
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(const FileName: string);
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TClientBlobStream);
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    property   Name: string read getName;
  end;

//. TTComponentsFindServiceFunctionality
Type
  TTComponentsFindServiceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TComponentsFindServiceFunctionality
Type
  TComponentsFindServiceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTUsersServiceFunctionality
Type
  TTUsersServiceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TUsersServiceFunctionality
Type
  TUsersServiceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTTransportServiceFunctionality
Type
  TTTransportServiceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TTransportServiceFunctionality
Type
  TTransportServiceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTMarketServiceFunctionality
Type
  TTMarketServiceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TMarketServiceFunctionality
Type
  TMarketServiceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTTelecomServiceFunctionality
Type
  TTTelecomServiceFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TTelecomServiceFunctionality
Type
  TTelecomServiceFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTWNDVisualizationFunctionality
Type
  TTWNDVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TWNDVisualizationFunctionality
Type
  TWNDVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTMRKVisualizationFunctionality
Type
  TTMRKVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TMRKVisualizationFunctionality
Type
  TMRKVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    procedure DoOnComponentUpdate;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
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
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
    property   BindingPointIndex: integer read getBindingPointIndex write setBindingPointIndex;
    property   Align: TMRKVisualizationAlign read getAlign write setAlign;
  end;

//. TTOrientedPictureVisualizationFunctionality
Type
  TTOrientedPictureVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOrientedPictureVisualizationFunctionality
Type
  TOrientedPictureVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
    procedure GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
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
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
    property   Width: Double read getWidth write setWidth;
    property   Height: Double read getHeight write setHeight;
    property   Orientation: integer read getOrientation write setOrientation;
  end;

//. TTOrientedTTFVisualizationFunctionality
Type
  TTOrientedTTFVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TOrientedTTFVisualizationFunctionality
Type
  TOrientedTTFVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName;
    property   Str: string read getStr write setStr;
    property   Color: TColor read getColor write setColor;
    property   Font_Name: string read getFont_Name write setFont_Name;
    property   Font_Width: Double read getFont_Width write setFont_Width;
    property   Font_Height: Double read getFont_Height write setFont_Height;
    property   CharInterval: Double read getCharInterval write setCharInterval;
    property   Orientation: integer read getOrientation write setOrientation;
  end;

//. TTIconFunctionality
Type
  TTIconFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TIconFunctionality
Type
  TIconFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
    procedure GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
    property   Name: string read getName;
  end;

//. TTMessageBoardMessageFunctionality
Type
  TTMessageBoardMessageFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TMessageBoardMessageFunctionality
Type
  TMessageBoardMessageFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    procedure GetBody1(Value: TStringList);
    procedure SetBody(Value: TByteArray);
    procedure SetBody1(Value: TStringList);
    function getFlRead: boolean;
    procedure setFlRead(Value: boolean);
    function IsEmpty: boolean;
    function IsCreatedByUser(const pidUser: integer): boolean;
    property   Name: string read getName;
    property   idMessageBoard: integer read getIdMessageBoard write setIdMessageBoard;
    property   idSenderMessageBoard: integer read getIdSenderMessageBoard write setIdSenderMessageBoard;
    property   Subject: string read getSubject write setSubject;
    property   flRead: boolean read getFlRead write setFlRead;
  end;

//. TTMessageBoardFunctionality
Type
  TTMessageBoardFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TMessageBoardFunctionality
Type
  TMessageBoardFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function IsUnreadMessageExist: boolean;
    procedure GetMessagesList(out List: TByteArray);
    procedure GetMessagesList1(out List: TList);
    function CreateNewMessage: integer;
    procedure SendMessage(const idMessage: integer);
    function getIdUser: integer;
    procedure setIdUser(Value: integer);
    property   Name: string read getName write setName;
    property   idUser: integer read getIdUser write setIdUSer;
  end;

//. TTHREFFunctionality
Type
  TTHREFFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. THREFFunctionality
Type
  THREFFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    procedure Activate;
    function getName: string;
    function getHint: string;
    function getURL: string;
    procedure setURL(Value: string);
    function getAutoStart: boolean;
    procedure setAutoStart(Value: boolean);
    property   Name: string read getName;
    property   URL: string read getURL write setURL;
    property   AutoStart: boolean read getAutoStart write setAutoStart;
  end;

//. TTQDCVisualizationFunctionality
Type
  TTQDCVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TQDCVisualizationFunctionality
Type
  TQDCVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function GetDATA(out DATAPtr: pointer): boolean;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure SetDATA(DATAStream: TByteArray);
    procedure SetDATA1(DATAStream: TMemoryStream);
    procedure LoadFromBitmap(Bitmap: TByteArray);
    procedure LoadFromBitmap1(Bitmap: TBitmap);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTOffersServerFunctionality
Type
  TTOffersServerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TOffersServerFunctionality
Type
  TOffersServerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function getMailROBOT_Inbox: string;
    procedure setMailROBOT_Inbox(Value: string);
    function getMailROBOT_User: string;
    procedure setMailROBOT_User(Value: string);
    function getMailROBOT_Password: string;
    procedure setMailROBOT_Password(Value: string);
    property   Name: string read getName;
    property   MailROBOT_Inbox: string read getMailROBOT_Inbox write setMailROBOT_Inbox;
    property   MailROBOT_User: string read getMailROBOT_User write setMailROBOT_User;
    property   MailROBOT_Password: string read getMailROBOT_Password write setMailROBOT_Password;
  end;

//. TTSecurityComponentOperationFunctionality
Type
  TTSecurityComponentOperationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
    procedure GetInstanceListByContext1(const Context: WideString; out List: TList);
    property   Name: string read getName;
  end;

//. TSecurityComponentOperationFunctionality
Type
  TSecurityComponentOperationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getSQLInfo: string;
    procedure setSQLInfo(Value: string);
    property   Name: string read getName write setName;
    property   SQLInfo: string read getSQLInfo write setSQLInfo;
  end;

//. TTSecurityKeyFunctionality
Type
  TTSecurityKeyFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
    procedure GetInstanceListByContext1(const Context: WideString; out List: TList);
    property   Name: string read getName;
  end;

//. TSecurityKeyFunctionality
Type
  TSecurityKeyFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure GetAssotiatedUsers(out Users: TByteArray);
    procedure GetAssotiatedUsers1(out Users: TList);
    procedure GenerateCode;
    function Code: string;
    property   Name: string read getName write setName;
    property   Info: string read getInfo write setInfo;
  end;

//. TTSecurityFileFunctionality
Type
  TTSecurityFileFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListByContext(const Context: WideString;out List: TByteArray);
    procedure GetInstanceListByContext1(const Context: WideString; out List: TList);
    property   Name: string read getName;
  end;

//. TSecurityFileFunctionality
Type
  TSecurityFileFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
    function GetDATA(out Value: TByteArray): boolean;
    function GetDATA1(out Value: TClientBlobStream): boolean;
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    function AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    function RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    procedure GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
    procedure GetAssotiatedSecurityComponents1(out SecurityComponents: TList);
    property   Name: string read getName write setName;
    property   Info: string read getInfo write setInfo;
  end;

//. TTSecurityComponentFunctionality
Type
  TTSecurityComponentFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure DestroyInstance(const idObj: integer);
    property   Name: string read getName;
  end;

//. TSecurityComponentFunctionality
Type
  TSecurityComponentFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    procedure ToClone(out idClone: integer);
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function getIdSecurityFile: integer;
    procedure setIdSecurityFile(Value: integer);
    property   Name: string read getName;
    property   idSecurityFile: integer read getIdSecurityFile write setIdSecurityFile;
  end;

//. TTMODELUserFunctionality
Type
  TTMODELUserFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function IsUserExist(const UserName: string; out idUser: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
    procedure GetInstanceListByContext1(const Context: WideString; out List: TList);
    procedure GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
    procedure GetOnlineUsersForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
    procedure GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
    procedure GetOnlineExpertsForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
    property   Name: string read getName;
  end;

//. TMODELUserFunctionality
Type
  TMODELUserFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getHint: string;
    function GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
    function IsUserOnLine(const MaxDelay: Double): boolean;
    procedure Logout;
    procedure GetSecurityKeysList(out SecurityKeys: TByteArray);
    procedure GetSecurityKeysList1(out SecurityKeys: TList);
    function SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
    procedure SecurityKeys_Insert(const idSecurityKey: integer);
    procedure SecurityKeys_Delete(const idSecurityKey: integer);
    procedure SecurityKeys_AddKeyByCode(const Code: WideString);
    procedure SecurityKeys_RemoveKeyByCode(const Code: WideString);
    function SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
    procedure GetMessageBoards(out List: TByteArray);
    procedure GetMessageBoards1(out List: TList);
    function HaveUnreadMessages: boolean;
    procedure GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
    procedure GetMessages1(const flUnreadOnly: boolean; out MessageList: TList);
    procedure IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
    procedure IncomingMessages_SendNew1(const Message: TMemoryStream; const SenderID: integer);
    function IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
    function IncomingMessages_GetUnread1(out MessageList: TList): boolean;
    procedure IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
    procedure IncomingMessages_GetMessagesSince1(const TimeStamp: TDateTime; out MessageList: TList);
    procedure IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
    procedure IncomingMessages_GetMessage1(const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer);
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
    property   Name: string read getName write setName;
    property   FullName: string read getFullName write setFullName;
    property   ContactInfo: string read getContactInfo write setContactInfo;
    property   Password: string read getPassword write setPassword;
    property   idSecurityFileForClone: integer read getIdSecurityFileForClone write setIdSecurityFileForClone;
    property   idSecurityFileForPrivate: integer read getidSecurityFileForPrivate write setidSecurityFileForPrivate;
    property   DATASize: integer read getDATASize write setDATASize;
    property   MaxDATASize: integer read getMaxDATASize write setMaxDATASize;
    property   SpaceSquare: Double read getSpaceSquare write setSpaceSquare;
    property   MaxSpaceSquare: integer read getMaxSpaceSquare write setMaxSpaceSquare;
    property   MaxSpaceSquarePerObject: integer read getMaxSpaceSquarePerObject write setMaxSpaceSquarePerObject;
    property   Disabled: boolean read getDisabled write setDisabled;
    property   Domains: string read getDomains write setDomains;
    property   TaskEnabled: boolean read getTaskEnabled write setTaskEnabled;
    property   BillingType: integer read getBillingType write setBillingType;
  end;

//. TTTextureFunctionality
Type
  TTTextureFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
    procedure GetInstanceListMatchingBy1(const NameContext: string; out List: TList);
    property   Name: string read getName;
  end;

//. TTextureFunctionality
Type
  TTextureFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TTextureDATAType);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
    procedure GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
    procedure setName(Value: string);
    property   Name: string read getName write setName;
  end;

//. TTBuffered3DVisualizationFunctionality
Type
  TTBuffered3DVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TBuffered3DVisualizationFunctionality
Type
  TBuffered3DVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    procedure UpdateDATA;
    procedure GetData(out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    procedure ReflectInScene(Scene: TScene);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
    procedure LoadFromStream1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
    procedure Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
    function GetMinMax(const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean;
    procedure UpdateXOYProjection;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    function GetMeshesNodesApproximator(const TransforMatrix: TTransforMatrix): TNodesApproximator;
    procedure GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
    property   Name: string read getName;
    property   DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

//. TTDATAFileFunctionality
Type
  TTDATAFileFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TDATAFileFunctionality
Type
  TDATAFileFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(var FileName: string);
    procedure Activate;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
    procedure Check;
    function getName: string;
    function getHint: string;
    function IsNull: boolean;
    procedure Empty;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TClientBlobStream);
    procedure SetDATA(Value: TByteArray);
    procedure SetDATA1(Value: TMemoryStream);
    function getDATAType: string;
    procedure setDATAType(Value: string);
    property   Name: string read getName;
    property   DATAType: string read getDATAType write setDATAType;
  end;

//. TTCoComponentFunctionality
Type
  TTCoComponentFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
    procedure GetInstanceListByCoType1(const idCoType: integer; out InstanceList: TList);
    property   Name: string read getName;
  end;

//. TCoComponentFunctionality
Type
  TCoComponentFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function idCoType: integer;
    function GetIconImage(out oImage: TByteArray): boolean;
    function GetIconImage1(out Image: TBitmap): boolean;
    function GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
    property   Name: string read getName;
  end;

//. TTCoComponentTypeMarkerFunctionality
Type
  TTCoComponentTypeMarkerFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCoComponentTypeMarkerFunctionality
Type
  TCoComponentTypeMarkerFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function GetTypeIconImage(out oImage: TByteArray): boolean;
    function GetTypeIconImage1(out Image: TBitmap): boolean;
    procedure setName(Value: string);
    function getIDCoComponentType: integer;
    property   Name: string read getName write setName;
    property   idCoComponentType: integer read getIDCoComponentType;
  end;

//. TTCoComponentTypeFunctionality
Type
  TTCoComponentTypeFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
    procedure GetInstanceListByFileType1(const FileType: shortstring; out List: TList);
    property   Name: string read getName;
  end;

//. TCoComponentTypeFunctionality
Type
  TCoComponentTypeFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    procedure GetDescription(out Value: TByteArray);
    procedure GetDescription1(Value: TStringList);
    procedure SetDescription(Value: TByteArray);
    procedure SetDescription1(Value: TStringList);
    procedure GetMarkersList(out List: TByteArray);
    procedure GetMarkersList1(out List: TList);
    function GetIconImage(out oImage: TByteArray): boolean;
    function GetIconImage1(out Image: TBitmap): boolean;
    procedure setName(Value: string);
    function getUID: integer;
    function getDateCreated: TDateTime;
    function getFileType: shortstring;
    procedure setFileType(Value: shortstring);
    function getCoComponentPrototypeID: integer;
    procedure setCoComponentPrototypeID(Value: integer);
    property   Name: string read getName write setName;
    property   UID: integer read getUID;
    property   DateCreated: TDateTime read getDateCreated;
    property   FileType: shortstring read getFileType write setFileType;
    property   CoComponentPrototypeID: integer read getCoComponentPrototypeID write setCoComponentPrototypeID;
  end;

//. TTAddressFunctionality
Type
  TTAddressFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure Points_GetTypeNames(out List: TByteArray);
    procedure Points_GetTypeNames1(out List: TStringList);
    procedure Streets_GetTypeNames(out List: TByteArray);
    procedure Streets_GetTypeNames1(out List: TStringList);
    property   Name: string read getName;
  end;

//. TAddressFunctionality
Type
  TAddressFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName;
    property   idPoint: integer read getIdPoint write setIdPoint;
    property   Point: string read getPoint;
    property   idStreet: integer read getIdStreet write setIdStreet;
    property   Street: string read getStreet;
    property   House: string read getHouse write setHouse;
    property   Corps: integer read getCorps write setCorps;
    property   Apartment: string read getApartment write setApartment;
    property   Entrance: integer read getEntrance write setEntrance;
  end;

//. TTTransportRouteFunctionality
Type
  TTTransportRouteFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TTransportRouteFunctionality
Type
  TTransportRouteFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    procedure Nodes_GetList1(out List: TRouteNodesList);
    function Nodes_IsNodeExist(const idNode: integer): boolean;
    procedure Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
    function Nodes__Node_DistanceBefore(const idItem: integer): integer;
    procedure Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
    function Nodes__Node_OrderPrice(const idItem: integer): string;
    procedure Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
    function Nodes_Insert(const idNode: integer): integer;
    procedure Nodes_Remove(const idItem: integer);
    property   Name: string read getName write setName;
    property   idTTransport: integer read getidTTransport write setidTTransport;
    property   Valid: boolean read getValid write setValid;
    property   Remarks: string read getRemarks write setRemarks;
  end;

//. TTTransportNodeFunctionality
Type
  TTTransportNodeFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TTransportNodeFunctionality
Type
  TTransportNodeFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function IsRoutesExist: boolean;
    property   Name: string read getName write setName;
  end;

//. TTOfferGoodsFunctionality
Type
  TTOfferGoodsFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TOfferGoodsFunctionality
Type
  TOfferGoodsFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    property   Name: string read getName;
    property   idGoods: integer read getIdGoods write setIdGoods;
    property   Amount: Double read getAmount write setAmount;
    property   idMeasureUnit: integer read getIdMeasureUnit write setIdMeasureUnit;
    property   MeasureUnit: string read getMeasureUnit;
    property   MinPrice: Currency read getMinPrice write setMinPrice;
    property   Misc: string read getMisc write setMisc;
  end;

//. TTTLFStationTMTFunctionality
Type
  TTTLFStationTMTFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TTLFStationTMTFunctionality
Type
  TTLFStationTMTFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function getHostName: string;
    procedure setHostName(Value: string);
    function getTestChanel: string;
    procedure setTestChanel(Value: string);
    property   Name: string read getName;
    property   HostName: string read getHostName write setHostName;
    property   TestChanel: string read getTestChanel write setTestChanel;
  end;

//. TTNameFunctionality
Type
  TTNameFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TNameFunctionality
Type
  TNameFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    function Value: string;
    procedure SetValue(const NewValue: string);
    property   Name: string read getName;
  end;

//. TTVisualizationFunctionality
Type
  TTVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TVisualizationFunctionality
Type
  TVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function ContainerFilled: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTHREFVisualizationFunctionality
Type
  TTHREFVisualizationFunctionality = class(TFunctionality)
  public
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
  end;

//. THREFVisualizationFunctionality
Type
  THREFVisualizationFunctionality = class(TFunctionality)
  public
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function DoOnOver: boolean;
    function DoOnClick: boolean;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTTTFVisualizationFunctionality
Type
  TTTTFVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function StdObjectVisualization: TObjectVisualization;
    property   Name: string read getName;
  end;

//. TTTFVisualizationFunctionality
Type
  TTTFVisualizationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getStr: string;
    procedure setStr(const Value: string);
    procedure GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
    procedure SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
    property   Name: string read getName;
    property   Str: string read getStr write setStr;
  end;

//. TTObjectFunctionality
Type
  TTObjectFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TObjectFunctionality
Type
  TObjectFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTLabelFunctionality
Type
  TTLabelFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TLabelFunctionality
Type
  TLabelFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTStationFunctionality
Type
  TTStationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function getName: string;
    function getImage: TTypeImage;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TStationFunctionality
Type
  TStationFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetNumbersBound(out BegNumber,EndNumber: integer);
    property   Name: string read getName;
  end;

//. TTMainLineFunctionality
Type
  TTMainLineFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TMainLineFunctionality
Type
  TMainLineFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function GetSTNOwner(out idTOwner,idOwner: integer): boolean;
    property   Name: string read getName;
  end;

//. TTDescriptionFunctionality
Type
  TTDescriptionFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TDescriptionFunctionality
Type
  TDescriptionFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure ClearDATA;
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
    function getName: string;
    function getHint: string;
    procedure GetValue(out vText: TByteArray);
    procedure GetValue1(vText: TStringList);
    procedure SetValue(NewValue: TByteArray);
    procedure SetValue1(NewValue: TStringList);
    property   Name: string read getName;
  end;

//. TTImageFunctionality
Type
  TTImageFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TImageFunctionality
Type
  TImageFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure ClearDATA;
    procedure _ToClone(out idClone: integer);
    procedure LoadFromFile(const FileName: string);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
    function getName: string;
    function getHint: string;
    function GetDATAType: TImageDATAType;
    function GetDATAType1: integer;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure SetDATA1(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
    procedure GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
    property   Name: string read getName;
  end;

//. TTWellFunctionality
Type
  TTWellFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TWellFunctionality
Type
  TWellFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTTLFFunctionality
Type
  TTTLFFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetIDInstanceByNumber(out ID: integer; const Number: integer);
    property   Name: string read getName;
  end;

//. TTLFFunctionality
Type
  TTLFFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
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
    property   Name: string read getName;
    property   Damage_TimeNote: TDateTime read getDamage_TimeNote write setDamage_TimeNote;
    property   Damage_Note: string read getDamage_Note write setDamage_Note;
    property   Damage_Measured: string read getDamage_Measured write setDamage_Measured;
    property   Damage_Acceptor: string read getDamage_Acceptor write setDamage_Acceptor;
    property   Damage_TimeBegRepair: TDateTime read getDamage_TimeBegRepair write setDamage_TimeBegRepair;
    property   Damage_TimeEndRepair: TDateTime read getDamage_TimeEndRepair write setDamage_TimeEndRepair;
    property   Damage_Damage: string read getDamage_Damage write setDamage_Damage;
    property   Damage_Executor: string read getDamage_Executor write setDamage_Executor;
    property   Damage_Remarks: string read getDamage_Remarks write setDamage_Remarks;
  end;

//. TTBoxFunctionality
Type
  TTBoxFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TBoxFunctionality
Type
  TBoxFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTCableBoxFunctionality
Type
  TTCableBoxFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCableBoxFunctionality
Type
  TCableBoxFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTDistrLineFunctionality
Type
  TTDistrLineFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TDistrLineFunctionality
Type
  TDistrLineFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTClientFunctionality
Type
  TTClientFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function getName: string;
    function getImage: TTypeImage;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceList1(out List: TList);
    property   Name: string read getName;
  end;

//. TClientFunctionality
Type
  TClientFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetDebet(out Value: Double): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTHouseFunctionality
Type
  TTHouseFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. THouseFunctionality
Type
  THouseFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTCommNodeFunctionality
Type
  TTCommNodeFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCommNodeFunctionality
Type
  TCommNodeFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTCrossFunctionality
Type
  TTCrossFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCrossFunctionality
Type
  TCrossFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTCaseFunctionality
Type
  TTCaseFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCaseFunctionality
Type
  TCaseFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTStreetFunctionality
Type
  TTStreetFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TStreetFunctionality
Type
  TStreetFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTOtherObjFunctionality
Type
  TTOtherObjFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TOtherObjFunctionality
Type
  TOtherObjFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTSpanFunctionality
Type
  TTSpanFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TSpanFunctionality
Type
  TSpanFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTChanelFunctionality
Type
  TTChanelFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TChanelFunctionality
Type
  TChanelFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTHandHoldFunctionality
Type
  TTHandHoldFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. THandHoldFunctionality
Type
  THandHoldFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTLineDistFunctionality
Type
  TTLineDistFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TLineDistFunctionality
Type
  TLineDistFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTMuffFunctionality
Type
  TTMuffFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TMuffFunctionality
Type
  TMuffFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTOfferFunctionality
Type
  TTOfferFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    function GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
    property   Name: string read getName;
  end;

//. TOfferFunctionality
Type
  TOfferFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    procedure LoadDATAFromStream1(Stream: TStream);
    function UserID: integer;
    function UID: integer;
    function AddressStr: string;
    function Goods_Insert: integer;
    procedure Goods_GetList(out List: TByteArray);
    procedure Goods_GetList1(out List: TList);
    procedure Goods_Remove(const idOfferGoods: integer);
    procedure Goods_Clear;
    property   Name: string read getName write setName;
    property   Schedule: string read getSchedule write setSchedule;
    property   Password: string read getPassword write setPassword;
    property   ContactTLF: integer read getContactTLF write setContactTLF;
    property   LastUpdated: TDateTime read getLastUpdated write setLastUpdated;
  end;

//. TTDemandFunctionality
Type
  TTDemandFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TDemandFunctionality
Type
  TDemandFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTCommLineFunctionality
Type
  TTCommLineFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCommLineFunctionality
Type
  TCommLineFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    property   Name: string read getName;
  end;

//. TTGoodsFunctionality
Type
  TTGoodsFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    procedure GetInstanceListContainingContext(const Context: string; out List: TByteArray);
    procedure GetInstanceListContainingContext1(const Context: string; out List: TStringList);
    function IsInstanceExist(const pName: string; out idGoods: integer): boolean;
    property   Name: string read getName;
  end;

//. TGoodsFunctionality
Type
  TGoodsFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function StdAmount: integer;
    function StdMeasureUnit: string;
    property   Name: string read getName write setName;
  end;

//. TTCollectionFunctionality
Type
  TTCollectionFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property   Name: string read getName;
  end;

//. TCollectionFunctionality
Type
  TCollectionFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
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
    procedure GetListItems1(out List: TList);
    procedure SaveListItems(const List: TByteArray);
    procedure SaveListItems1(List: TList);
    property   Name: string read getName;
  end;

