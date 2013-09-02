//. types functionalities soap-interfaces

Type
  {TTTileServerVisualizationFunctionality-soap-interface}
  ITTTileServerVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{20E9E342-B8AD-45E8-A9D6-828A696B106B}']
  end;
  //. "get interface" routine
  function GetITTTileServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTileServerVisualizationSOAPFunctionality;

Type
  {TTileServerVisualizationFunctionality-soap-interface}
  ITTileServerVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{4651961A-1D39-45C3-8764-0875BFA032A2}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oWidth: integer; out oHeight: integer); stdcall;
    procedure GetParams1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall;
    procedure SetServerType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Value: integer); stdcall;
    procedure SetServerURL(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Value: string); stdcall;
    procedure SetServerData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Data: TByteArray); stdcall;
    procedure GenerateFromImage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    procedure GenerateFromTiles(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TilesFolder: string; const SizePowerOf2: integer); stdcall;
    procedure RegenerateRegionFromLevel(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
    procedure RegenerateRegion(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
    procedure AddNewLevelAndRegenerate(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetLevelsInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Info: TByteArray); stdcall;
    procedure Level_GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
    procedure Level_SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
    procedure Level_GetSegments(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
    procedure Level_GetSegmentsByIDs(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
    procedure Level_GetSegmentsHashes(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
    procedure Level_SetSegments(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
    procedure GetCoordinates(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITTileServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTileServerVisualizationSOAPFunctionality;

Type
  {TTMeasurementObjectFunctionality-soap-interface}
  ITTMeasurementObjectSOAPFunctionality = Interface(IInvokable)
    ['{A9504839-0540-4735-9A85-019D8700C0F2}']
    function CreateNewInstance(const pUserName,pUserPassword: WideString;  const pName: string; const pDomains: string): integer; stdcall;
    function CreateInstanceByGUID(const pUserName,pUserPassword: WideString;  const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
    function CheckCreateInstanceByGUID(const pUserName,pUserPassword: WideString;  const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
    procedure GetInstanceListByNameContext(const pUserName,pUserPassword: WideString;  const pName: string; out List: TByteArray); stdcall;
    procedure GetInstanceDataByNameContext(const pUserName,pUserPassword: WideString;  const pName: string; const Version: integer; out oData: TByteArray); stdcall;
    function GetInstanceByGUID(const pUserName,pUserPassword: WideString;  const pGUID: string): integer; stdcall;
    function GetInstanceByGSOMeasurement(const pUserName,pUserPassword: WideString;  const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITTMeasurementObjectSOAPFunctionality(const ServerURL: WideString): ITTMeasurementObjectSOAPFunctionality;

Type
  {TMeasurementObjectFunctionality-soap-interface}
  ITMeasurementObjectSOAPFunctionality = Interface(IInvokable)
    ['{19448DC5-535F-4ECE-85AA-C23F4426F784}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getGUID(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall;
    procedure GSOMeasurements_GetList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure GSOMeasurements_GetData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Version: integer; out oData: TByteArray); stdcall;
    procedure GSOMeasurements_Item_GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
    procedure GSOMeasurements_Item_GetParams1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
    procedure GSOMeasurements_Item_GetData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idMeasurement: integer; out oData: TByteArray); stdcall;
    procedure GSOMeasurements_Item_GetData1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TimeID: Double; out oData: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITMeasurementObjectSOAPFunctionality(const ServerURL: WideString): ITMeasurementObjectSOAPFunctionality;

Type
  {TTAreaNotificationServerFunctionality-soap-interface}
  ITTAreaNotificationServerSOAPFunctionality = Interface(IInvokable)
    ['{0737C13F-4E01-48E0-B4A3-BD715E0C94F5}']
  end;
  //. "get interface" routine
  function GetITTAreaNotificationServerSOAPFunctionality(const ServerURL: WideString): ITTAreaNotificationServerSOAPFunctionality;

Type
  {TAreaNotificationServerFunctionality-soap-interface}
  ITAreaNotificationServerSOAPFunctionality = Interface(IInvokable)
    ['{8DE3A33C-6325-4ABF-87AA-72D0F45357C8}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITAreaNotificationServerSOAPFunctionality(const ServerURL: WideString): ITAreaNotificationServerSOAPFunctionality;

Type
  {TTMODELServerVisualizationFunctionality-soap-interface}
  ITTMODELServerVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{BE6B08E9-4E85-40A7-AF63-863498563A13}']
  end;
  //. "get interface" routine
  function GetITTMODELServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITTMODELServerVisualizationSOAPFunctionality;

Type
  {TMODELServerVisualizationFunctionality-soap-interface}
  ITMODELServerVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{C0AA96D1-723C-4449-BC79-7E8CF32BE8B8}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getServerURL(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setServerURL(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITMODELServerVisualizationSOAPFunctionality(const ServerURL: WideString): ITMODELServerVisualizationSOAPFunctionality;

Type
  {TTDoubleVarFunctionality-soap-interface}
  ITTDoubleVarSOAPFunctionality = Interface(IInvokable)
    ['{7BCD1EA6-EF07-4CCD-BC1B-425AD79802E9}']
  end;
  //. "get interface" routine
  function GetITTDoubleVarSOAPFunctionality(const ServerURL: WideString): ITTDoubleVarSOAPFunctionality;

Type
  {TDoubleVarFunctionality-soap-interface}
  ITDoubleVarSOAPFunctionality = Interface(IInvokable)
    ['{D5A1CBD2-AF18-4FD1-80C3-4D7825B4DE63}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getValue(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  _Value: Double); stdcall;
    function getSetTimeStamp(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
  end;
  //. "get interface" routine
  function GetITDoubleVarSOAPFunctionality(const ServerURL: WideString): ITDoubleVarSOAPFunctionality;

Type
  {TTInt32VarFunctionality-soap-interface}
  ITTInt32VarSOAPFunctionality = Interface(IInvokable)
    ['{AE1E28D6-F2D0-4BF2-A69C-198FE14AB5BC}']
  end;
  //. "get interface" routine
  function GetITTInt32VarSOAPFunctionality(const ServerURL: WideString): ITTInt32VarSOAPFunctionality;

Type
  {TInt32VarFunctionality-soap-interface}
  ITInt32VarSOAPFunctionality = Interface(IInvokable)
    ['{D26B814F-11FA-45D0-B141-6CF447F29591}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getValue(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  _Value: integer); stdcall;
    function getSetTimeStamp(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
  end;
  //. "get interface" routine
  function GetITInt32VarSOAPFunctionality(const ServerURL: WideString): ITInt32VarSOAPFunctionality;

Type
  {TTURLFunctionality-soap-interface}
  ITTURLSOAPFunctionality = Interface(IInvokable)
    ['{1B0C6E3A-2699-4192-9108-0F16907D1773}']
  end;
  //. "get interface" routine
  function GetITTURLSOAPFunctionality(const ServerURL: WideString): ITTURLSOAPFunctionality;

Type
  {TURLFunctionality-soap-interface}
  ITURLSOAPFunctionality = Interface(IInvokable)
    ['{CEF83ACD-F2E2-45A5-8661-8FFAD86CB196}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getURL(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setURL(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getURLName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setURLName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getflPanelBrowser(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setflPanelBrowser(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall;
  end;
  //. "get interface" routine
  function GetITURLSOAPFunctionality(const ServerURL: WideString): ITURLSOAPFunctionality;

Type
  {TTPatternVisualizationFunctionality-soap-interface}
  ITTPatternVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{BAAFF5D2-6A79-4729-A436-59858AED4277}']
  end;
  //. "get interface" routine
  function GetITTPatternVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPatternVisualizationSOAPFunctionality;

Type
  {TPatternVisualizationFunctionality-soap-interface}
  ITPatternVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{BA1758AB-56B1-48DD-9D14-9B909399DA39}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITPatternVisualizationSOAPFunctionality(const ServerURL: WideString): ITPatternVisualizationSOAPFunctionality;

Type
  {TTMapFormatObjectFunctionality-soap-interface}
  ITTMapFormatObjectSOAPFunctionality = Interface(IInvokable)
    ['{DB69B514-EBED-4516-8450-D34A0083D832}']
    function GetDATAHash(const pUserName,pUserPassword: WideString;  DATAStream: TByteArray): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITTMapFormatObjectSOAPFunctionality(const ServerURL: WideString): ITTMapFormatObjectSOAPFunctionality;

Type
  {TMapFormatObjectFunctionality-soap-interface}
  ITMapFormatObjectSOAPFunctionality = Interface(IInvokable)
    ['{18A4394D-2441-4F12-ADB5-F9625CDFEB7F}']
    function GetHintInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;
    function getidMap(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidMap(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getFormatID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setFormatID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getKindID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setKindID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getTypeID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setTypeID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    function getDATAHash(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAHash(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall;
    procedure SetObjectByDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure UpdateDATAHash(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure Compile(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure Build(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const flUsePrototype: boolean); stdcall;
  end;
  //. "get interface" routine
  function GetITMapFormatObjectSOAPFunctionality(const ServerURL: WideString): ITMapFormatObjectSOAPFunctionality;

Type
  {TTMapFormatMapFunctionality-soap-interface}
  ITTMapFormatMapSOAPFunctionality = Interface(IInvokable)
    ['{4DA78D89-200C-4D7A-A4DA-4162CB567C33}']
    procedure GetInstanceListByGeoSpace(const pUserName,pUserPassword: WideString;  const idGeoSpace: integer; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTMapFormatMapSOAPFunctionality(const ServerURL: WideString): ITTMapFormatMapSOAPFunctionality;

Type
  {TMapFormatMapFunctionality-soap-interface}
  ITMapFormatMapSOAPFunctionality = Interface(IInvokable)
    ['{AE421A00-5D0D-4496-B837-BA72C9AFDF78}']
    function getGeoSpaceID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setGeoSpaceID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getFormatID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setFormatID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    procedure GetObjectPrototypesDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure SetObjectPrototypesDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    function GetObjectPrototype(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall;
    function ObjectsCounter(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetObjectsList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure GetObjectsList1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; out List: TByteArray); stdcall;
    procedure GetObjectsList2(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall;
    procedure GetObjectsList3(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
    function GetObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
    function GetObject1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
    procedure ExportMap(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pFormatID: integer; out ZipData: TByteArray); stdcall;
    procedure RemoveObjects(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure RemoveObjects1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const KindID: integer; const TypeID: integer); stdcall;
    procedure UpdateObjectDATAHashes(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure RecalculateMapArea(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure RemoveIrrelevantObjectsInMapArea(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITMapFormatMapSOAPFunctionality(const ServerURL: WideString): ITMapFormatMapSOAPFunctionality;

Type
  {TTSPLVisualizationFunctionality-soap-interface}
  ITTSPLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{199AE1C3-AF39-4CCB-A248-33540600CA16}']
  end;
  //. "get interface" routine
  function GetITTSPLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTSPLVisualizationSOAPFunctionality;

Type
  {TSPLVisualizationFunctionality-soap-interface}
  ITSPLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{BAC15186-97BC-4B12-B758-E7E623FD9685}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out SPLType: integer; out SPLDATA: TByteArray); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const SPLType: integer; const SPLDATA: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITSPLVisualizationSOAPFunctionality(const ServerURL: WideString): ITSPLVisualizationSOAPFunctionality;

Type
  {TTBoolVarFunctionality-soap-interface}
  ITTBoolVarSOAPFunctionality = Interface(IInvokable)
    ['{23E4861A-C063-4831-AAC9-22E92811A6A0}']
  end;
  //. "get interface" routine
  function GetITTBoolVarSOAPFunctionality(const ServerURL: WideString): ITTBoolVarSOAPFunctionality;

Type
  {TBoolVarFunctionality-soap-interface}
  ITBoolVarSOAPFunctionality = Interface(IInvokable)
    ['{4E8FF0E6-1F1B-4EEF-9B8E-39384DFECE6A}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getValue(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  _Value: boolean); stdcall;
    function getSetTimeStamp(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
  end;
  //. "get interface" routine
  function GetITBoolVarSOAPFunctionality(const ServerURL: WideString): ITBoolVarSOAPFunctionality;

Type
  {TTGeoSpaceFunctionality-soap-interface}
  ITTGeoSpaceSOAPFunctionality = Interface(IInvokable)
    ['{24C903AD-F0E3-46B4-913B-EE69A5A64346}']
  end;
  //. "get interface" routine
  function GetITTGeoSpaceSOAPFunctionality(const ServerURL: WideString): ITTGeoSpaceSOAPFunctionality;

Type
  {TGeoSpaceFunctionality-soap-interface}
  ITGeoSpaceSOAPFunctionality = Interface(IInvokable)
    ['{15712C49-2008-44E0-BE56-5DD1CE6DF201}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getDatumID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDatumID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getProjectionID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setProjectionID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function ConvertXYToLatLong(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall;
    function ConvertXYToDatumLatLong(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall;
    function ConvertLatLongToXY(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
    function ConvertDatumLatLongToXY(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
    procedure GetGeoCrdSystemList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure GetMapFormatMapList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure GetMapFormatMapObjectsByNameContext(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITGeoSpaceSOAPFunctionality(const ServerURL: WideString): ITGeoSpaceSOAPFunctionality;

Type
  {TTUserAlertFunctionality-soap-interface}
  ITTUserAlertSOAPFunctionality = Interface(IInvokable)
    ['{5E696097-E296-4B5E-A3DE-63046ECC5DCA}']
    procedure GetActiveInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTUserAlertSOAPFunctionality(const ServerURL: WideString): ITTUserAlertSOAPFunctionality;

Type
  {TUserAlertFunctionality-soap-interface}
  ITUserAlertSOAPFunctionality = Interface(IInvokable)
    ['{1279B7D7-92E2-4DD2-8CA7-02E7F3045F93}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getUserID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setUserID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getTimeStamp(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setTimeStamp(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    function getActive(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setActive(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    function getAlertID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setAlertID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getSeverity(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setSeverity(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getDescription(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDescription(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITUserAlertSOAPFunctionality(const ServerURL: WideString): ITUserAlertSOAPFunctionality;

Type
  {TTGeoGraphServerObjectFunctionality-soap-interface}
  ITTGeoGraphServerObjectSOAPFunctionality = Interface(IInvokable)
    ['{0E4419F8-8D0A-4CD9-804E-17064C0B4E09}']
    function GetInstanceByServerObject(const pUserName,pUserPassword: WideString;  const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTGeoGraphServerObjectSOAPFunctionality(const ServerURL: WideString): ITTGeoGraphServerObjectSOAPFunctionality;

Type
  {TGeoGraphServerObjectFunctionality-soap-interface}
  ITGeoGraphServerObjectSOAPFunctionality = Interface(IInvokable)
    ['{4CAAB1BE-5B84-46BC-A372-5C5E93B1263D}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getGeoGraphServerID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setGeoGraphServerID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getBusinessModelID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setBusinessModelID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall;
    procedure ExecuteOperation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const InData: TByteArray; out OutData: TByteArray); stdcall;
    function GetVisualizationComponent(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTVisualization,idVisualization: integer): boolean; stdcall;
    function GetNearestMapFormatObjects(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const MaxDistance: double; out List: TByteArray): boolean; stdcall;
    function GetNearestMapFormatObjectsNames(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const MaxDistance: double; out Names: WideString): boolean; stdcall;
    function Measurements_AddNew(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall;
    function Measurements_AddNew1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall;
    procedure Measurements_Remove(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidMeasurement: integer); stdcall;
    procedure Measurements_Item_UpdateData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pTimeID: Double; const pData: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITGeoGraphServerObjectSOAPFunctionality(const ServerURL: WideString): ITGeoGraphServerObjectSOAPFunctionality;

Type
  {TTGeoGraphServerFunctionality-soap-interface}
  ITTGeoGraphServerSOAPFunctionality = Interface(IInvokable)
    ['{7F2AA937-1411-4B5A-95D9-1DF13681CC53}']
    procedure GetActiveInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
    function GetInstanceForRegistration(const pUserName,pUserPassword: WideString): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITTGeoGraphServerSOAPFunctionality(const ServerURL: WideString): ITTGeoGraphServerSOAPFunctionality;

Type
  {TGeoGraphServerFunctionality-soap-interface}
  ITGeoGraphServerSOAPFunctionality = Interface(IInvokable)
    ['{5262AAE6-23A9-43F9-BAE3-D4FD7A869FBB}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getInternalAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setInternalAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    function RegisterObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
    function RegisterObject1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
    function RegisterObject2(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall;
    procedure UnRegisterObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer); stdcall;
    function ObjectCounter(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure ExecuteOperation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const InData: TByteArray; out OutData: TByteArray); stdcall;
    procedure Object_GetProperties(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall;
    procedure Object_GetProperties1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall;
    procedure Object_SetProperties(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall;
    procedure Object_SetProperties1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall;
    function Object_GetObjectType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer): integer; stdcall;
    procedure Object_SetObjectType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer; const ObjectType: integer); stdcall;
    function Object_GetBusinessType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer): integer; stdcall;
    procedure Object_SetBusinessType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer; const BusinessType: integer); stdcall;
    function Object_GetComponentID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer): integer; stdcall;
    procedure Object_SetComponentID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer; const ObjectComponentID: integer); stdcall;
    procedure Object_ExecuteOperation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;
    function DataID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITGeoGraphServerSOAPFunctionality(const ServerURL: WideString): ITGeoGraphServerSOAPFunctionality;

Type
  {TTGeoCrdSystemFunctionality-soap-interface}
  ITTGeoCrdSystemSOAPFunctionality = Interface(IInvokable)
    ['{F1DCC92A-625E-4B69-BB87-101DB8960704}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
    procedure GetInstanceByLatLong(const pUserName,pUserPassword: WideString;  const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
    procedure GetInstanceByXY(const pUserName,pUserPassword: WideString;  const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITTGeoCrdSystemSOAPFunctionality(const ServerURL: WideString): ITTGeoCrdSystemSOAPFunctionality;

Type
  {TGeoCrdSystemFunctionality-soap-interface}
  ITGeoCrdSystemSOAPFunctionality = Interface(IInvokable)
    ['{DEF2D5F0-E7A4-42BB-9033-6D970627A45F}']
    function getGeoSpaceID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setGeoSpaceID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getDatum(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDatum(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getProjection(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setProjection(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetProjectionDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure SetProjectionDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    procedure GetGeodesyPoints(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Points: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITGeoCrdSystemSOAPFunctionality(const ServerURL: WideString): ITGeoCrdSystemSOAPFunctionality;

Type
  {TTFilterVisualizationFunctionality-soap-interface}
  ITTFilterVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{E5891983-5D76-493B-87D7-55726B102469}']
  end;
  //. "get interface" routine
  function GetITTFilterVisualizationSOAPFunctionality(const ServerURL: WideString): ITTFilterVisualizationSOAPFunctionality;

Type
  {TFilterVisualizationFunctionality-soap-interface}
  ITFilterVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{B9E727E0-4642-480C-A350-5845DE540B3F}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out FilterType: integer; out FilterDATA: TByteArray); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const FilterType: integer; const FilterDATA: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITFilterVisualizationSOAPFunctionality(const ServerURL: WideString): ITFilterVisualizationSOAPFunctionality;

Type
  {TTHINTVisualizationFunctionality-soap-interface}
  ITTHINTVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{78A21998-D9A7-4485-B834-46B016C95FDC}']
    procedure GetInstanceParams(const pUserName,pUserPassword: WideString;  const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
    procedure GetInstanceParams1(const pUserName,pUserPassword: WideString;  const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
    procedure GetInstanceOwnerDatasAndParams(const pUserName,pUserPassword: WideString;  const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTHINTVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHINTVisualizationSOAPFunctionality;

Type
  {THINTVisualizationFunctionality-soap-interface}
  ITHINTVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{84D2D4BC-5DF1-46B4-9552-284EE760BD01}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    procedure GetPrivateDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure GetPrivateDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; const MaxSize: integer); stdcall;
    procedure SetPrivateDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITHINTVisualizationSOAPFunctionality(const ServerURL: WideString): ITHINTVisualizationSOAPFunctionality;

Type
  {TTDetailedPictureVisualizationFunctionality-soap-interface}
  ITTDetailedPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{72538F29-2A4B-4CF3-A7A3-05878A263076}']
  end;
  //. "get interface" routine
  function GetITTDetailedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTDetailedPictureVisualizationSOAPFunctionality;

Type
  {TDetailedPictureVisualizationFunctionality-soap-interface}
  ITDetailedPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{252F25E0-F977-422E-85CE-3F63255F50A4}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GenerateFromImage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    procedure GenerateFromTiles(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TilesFolder: string; const SizePowerOf2: integer); stdcall;
    procedure RegenerateRegionFromLevel(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
    procedure RegenerateRegion(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
    procedure AddNewLevelAndRegenerate(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetLevelsInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Info: TByteArray); stdcall;
    procedure Level_GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
    procedure Level_SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
    procedure Level_GetSegments(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
    procedure Level_GetSegmentsByIDs(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
    procedure Level_GetSegmentsHashes(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
    procedure Level_SetSegments(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oWidth: integer; out oHeight: integer); stdcall;
    procedure GetCoordinates(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITDetailedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITDetailedPictureVisualizationSOAPFunctionality;

Type
  {TTCoVisualizationFunctionality-soap-interface}
  ITTCoVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{6B6F7F22-E092-4595-941A-8643384D4ED0}']
  end;
  //. "get interface" routine
  function GetITTCoVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCoVisualizationSOAPFunctionality;

Type
  {TCoVisualizationFunctionality-soap-interface}
  ITCoVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{2C68539B-7F1C-4420-9168-C087502ABBD4}']
    procedure ToClone(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idClone: integer); stdcall;
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetSpace(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray); stdcall;
    procedure GetSpace1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; const MaxSize: integer); stdcall;
    procedure SetSpace(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    function GetOwnSpaceHINTVisualization(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idHINTVisualization: integer): boolean; stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure Pack(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure UnPack(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function IsPacked(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITCoVisualizationSOAPFunctionality(const ServerURL: WideString): ITCoVisualizationSOAPFunctionality;

Type
  {TTForumMessageFunctionality-soap-interface}
  ITTForumMessageSOAPFunctionality = Interface(IInvokable)
    ['{83585CDD-ABDB-4DE6-B999-BB2E2F1FE354}']
  end;
  //. "get interface" routine
  function GetITTForumMessageSOAPFunctionality(const ServerURL: WideString): ITTForumMessageSOAPFunctionality;

Type
  {TForumMessageFunctionality-soap-interface}
  ITForumMessageSOAPFunctionality = Interface(IInvokable)
    ['{F829315A-0F32-4018-B0DA-F865274CE6AC}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getidForum(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidForum(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function idUser(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure Send(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function SentTime(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    function getidForMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidForMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function LastModified(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure GetMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Message: TByteArray); stdcall;
    procedure SetMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Message: TByteArray); stdcall;
    function ReplyMessageCount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetReplyMessageList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out MessageList: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITForumMessageSOAPFunctionality(const ServerURL: WideString): ITForumMessageSOAPFunctionality;

Type
  {TTForumFunctionality-soap-interface}
  ITTForumSOAPFunctionality = Interface(IInvokable)
    ['{52401D6C-89F9-4D6D-A740-4A43BE38A473}']
  end;
  //. "get interface" routine
  function GetITTForumSOAPFunctionality(const ServerURL: WideString): ITTForumSOAPFunctionality;

Type
  {TForumFunctionality-soap-interface}
  ITForumSOAPFunctionality = Interface(IInvokable)
    ['{4BF7F3A4-2F39-4A66-AF29-67964FB22E11}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getMessageLifeTime(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setMessageLifeTime(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function RootMessageCount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetRootMessageList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out MessageList: TByteArray); stdcall;
    function MessageCount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetMessageList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out MessageList: TByteArray); stdcall;
    function AddMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidUser: integer; const pidForMessage: integer): integer; stdcall;
    procedure DestroyMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidMessage: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITForumSOAPFunctionality(const ServerURL: WideString): ITForumSOAPFunctionality;

Type
  {TTCUSTOMVisualizationFunctionality-soap-interface}
  ITTCUSTOMVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{C0345E02-9548-41BB-877E-E7D5D9EB9BCC}']
  end;
  //. "get interface" routine
  function GetITTCUSTOMVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCUSTOMVisualizationSOAPFunctionality;

Type
  {TCUSTOMVisualizationFunctionality-soap-interface}
  ITCUSTOMVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{4ACE721E-60B4-43C4-9903-4FD8C6DADE1D}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getMODULEName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setMODULEName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getFunctionName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setFunctionName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getFunctionVersion(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setFunctionVersion(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITCUSTOMVisualizationSOAPFunctionality(const ServerURL: WideString): ITCUSTOMVisualizationSOAPFunctionality;

Type
  {TTOLEVisualizationFunctionality-soap-interface}
  ITTOLEVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{A14DD52E-E71D-4B68-829D-F22303C7FA11}']
  end;
  //. "get interface" routine
  function GetITTOLEVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOLEVisualizationSOAPFunctionality;

Type
  {TOLEVisualizationFunctionality-soap-interface}
  ITOLEVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{B29925BA-1E48-4693-AEBC-A4ACFD2D68A4}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITOLEVisualizationSOAPFunctionality(const ServerURL: WideString): ITOLEVisualizationSOAPFunctionality;

Type
  {TTHTMLVisualizationFunctionality-soap-interface}
  ITTHTMLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{99975037-5A31-4CFC-991E-9452EF92E681}']
  end;
  //. "get interface" routine
  function GetITTHTMLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHTMLVisualizationSOAPFunctionality;

Type
  {THTMLVisualizationFunctionality-soap-interface}
  ITHTMLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{21191014-D013-4B76-B2AC-73706160029E}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITHTMLVisualizationSOAPFunctionality(const ServerURL: WideString): ITHTMLVisualizationSOAPFunctionality;

Type
  {TTBZRVisualizationFunctionality-soap-interface}
  ITTBZRVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{504B10FC-BF13-4836-BB91-C12639C6DAC8}']
  end;
  //. "get interface" routine
  function GetITTBZRVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBZRVisualizationSOAPFunctionality;

Type
  {TBZRVisualizationFunctionality-soap-interface}
  ITBZRVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{27F32E09-6B26-4453-8A5D-666AC9631ECE}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITBZRVisualizationSOAPFunctionality(const ServerURL: WideString): ITBZRVisualizationSOAPFunctionality;

Type
  {TTAGIFVisualizationFunctionality-soap-interface}
  ITTAGIFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{1397AC08-7385-4DC5-ADA6-35FAED0DB327}']
  end;
  //. "get interface" routine
  function GetITTAGIFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTAGIFVisualizationSOAPFunctionality;

Type
  {TAGIFVisualizationFunctionality-soap-interface}
  ITAGIFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{9648D435-A1EE-4A68-8DE9-C2FE9A7860D4}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITAGIFVisualizationSOAPFunctionality(const ServerURL: WideString): ITAGIFVisualizationSOAPFunctionality;

Type
  {TTOrientedVIDEOVisualizationFunctionality-soap-interface}
  ITTOrientedVIDEOVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{69EAE84A-1126-4D35-B83A-0FB9156755AD}']
  end;
  //. "get interface" routine
  function GetITTOrientedVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedVIDEOVisualizationSOAPFunctionality;

Type
  {TOrientedVIDEOVisualizationFunctionality-soap-interface}
  ITOrientedVIDEOVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{0E4938A2-A7C0-4E3D-A22B-A32F42C8F110}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getDataServer(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDataServer(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITOrientedVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedVIDEOVisualizationSOAPFunctionality;

Type
  {TTVIDEOVisualizationFunctionality-soap-interface}
  ITTVIDEOVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{F37FD5FC-C8B2-4667-95B8-6DB5D37CFAFD}']
  end;
  //. "get interface" routine
  function GetITTVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITTVIDEOVisualizationSOAPFunctionality;

Type
  {TVIDEOVisualizationFunctionality-soap-interface}
  ITVIDEOVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{E72623EB-F739-4BDA-AE8A-F0F735A34F71}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getDataServer(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDataServer(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setObjectID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITVIDEOVisualizationSOAPFunctionality(const ServerURL: WideString): ITVIDEOVisualizationSOAPFunctionality;

Type
  {TTOPPVisualizationFunctionality-soap-interface}
  ITTOPPVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{9E8AD193-1C74-4515-BB28-BD03C01C49DB}']
  end;
  //. "get interface" routine
  function GetITTOPPVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOPPVisualizationSOAPFunctionality;

Type
  {TOPPVisualizationFunctionality-soap-interface}
  ITOPPVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{51829DE4-A09B-477D-AB30-EC8F05EE5378}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getPropsPanel_idTObj(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setPropsPanel_idTObj(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getPropsPanel_idObj(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setPropsPanel_idObj(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITOPPVisualizationSOAPFunctionality(const ServerURL: WideString): ITOPPVisualizationSOAPFunctionality;

Type
  {TTMODELServerFunctionality-soap-interface}
  ITTMODELServerSOAPFunctionality = Interface(IInvokable)
    ['{390278B3-8A51-4B5F-B7A9-C0C3155B6BBE}']
    function GetInstanceByIPAddress(const pUserName,pUserPassword: WideString;  const IPAddress: string;  out id: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTMODELServerSOAPFunctionality(const ServerURL: WideString): ITTMODELServerSOAPFunctionality;

Type
  {TMODELServerFunctionality-soap-interface}
  ITMODELServerSOAPFunctionality = Interface(IInvokable)
    ['{14D52BA7-19B9-4D61-A2F4-072BB88B4C76}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getIPAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setIPAddress(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function IsUserExist(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const _UserName,_UserPassword: string): boolean; stdcall;
    function GetUserID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const _UserName,_UserPassword: string): integer; stdcall;
    function IsOnLine(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    function Info(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetLicense(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out License: WideString); stdcall;
    procedure CreateNewUserByDefaultPrototype(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall;
    procedure CreateNewUserByDefaultPrototype1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITMODELServerSOAPFunctionality(const ServerURL: WideString): ITMODELServerSOAPFunctionality;

Type
  {TTCoReferenceFunctionality-soap-interface}
  ITTCoReferenceSOAPFunctionality = Interface(IInvokable)
    ['{C003EC22-40D8-4322-88A9-208DB4ACF2BA}']
  end;
  //. "get interface" routine
  function GetITTCoReferenceSOAPFunctionality(const ServerURL: WideString): ITTCoReferenceSOAPFunctionality;

Type
  {TCoReferenceFunctionality-soap-interface}
  ITCoReferenceSOAPFunctionality = Interface(IInvokable)
    ['{6D4F65F2-56CD-4FF4-B5B3-164E0B776EFA}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetReferencedObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTReferencedObject,idReferencedObject: integer); stdcall;
    procedure SetReferencedObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTReferencedObject,idReferencedObject: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITCoReferenceSOAPFunctionality(const ServerURL: WideString): ITCoReferenceSOAPFunctionality;

Type
  {TTPositionerFunctionality-soap-interface}
  ITTPositionerSOAPFunctionality = Interface(IInvokable)
    ['{4A07F375-D0AB-4D29-A7B2-E3CD511B36AC}']
  end;
  //. "get interface" routine
  function GetITTPositionerSOAPFunctionality(const ServerURL: WideString): ITTPositionerSOAPFunctionality;

Type
  {TPositionerFunctionality-soap-interface}
  ITPositionerSOAPFunctionality = Interface(IInvokable)
    ['{74771D66-72EE-48D0-9915-220EFAF1EC90}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure Get2DPosition(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
    procedure Save2DPosition(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
    function getPositionName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setPositionName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITPositionerSOAPFunctionality(const ServerURL: WideString): ITPositionerSOAPFunctionality;

Type
  {TTOrientedWMFVisualizationFunctionality-soap-interface}
  ITTOrientedWMFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{7416B8A7-50B4-4875-9889-871A971EE7F4}']
  end;
  //. "get interface" routine
  function GetITTOrientedWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedWMFVisualizationSOAPFunctionality;

Type
  {TOrientedWMFVisualizationFunctionality-soap-interface}
  ITOrientedWMFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{8478FD8C-6412-4D19-9B86-67B38D7ADD95}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure GetJPEGDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getHeight(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setHeight(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure ChangeScale(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ScaleFactor: Double); stdcall;
    procedure UpdateContainer(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function IsNewContainerAcceptable(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITOrientedWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedWMFVisualizationSOAPFunctionality;

Type
  {TTCELLVisualizationFunctionality-soap-interface}
  ITTCELLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{7F496F54-7FBF-47D4-8F46-370D48E14A77}']
  end;
  //. "get interface" routine
  function GetITTCELLVisualizationSOAPFunctionality(const ServerURL: WideString): ITTCELLVisualizationSOAPFunctionality;

Type
  {TCELLVisualizationFunctionality-soap-interface}
  ITCELLVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{B7DB3FC0-E2F5-4DD7-B8B3-D0B38E57C651}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetCoordinates(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
    procedure Change(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;
    function GetFormatNodes(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall;
    procedure DoQuad(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetInsideObjectsList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall;
    function getColCount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setColCount(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getRowCount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setRowCount(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getLineWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setLineWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getColSize(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    function getRowSize(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITCELLVisualizationSOAPFunctionality(const ServerURL: WideString): ITCELLVisualizationSOAPFunctionality;

Type
  {TTEllipseVisualizationFunctionality-soap-interface}
  ITTEllipseVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{419595CE-FE59-4091-905F-1AB38E11DBA3}']
  end;
  //. "get interface" routine
  function GetITTEllipseVisualizationSOAPFunctionality(const ServerURL: WideString): ITTEllipseVisualizationSOAPFunctionality;

Type
  {TEllipseVisualizationFunctionality-soap-interface}
  ITEllipseVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{CED723B9-3B6D-4739-842F-F08925D34018}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getColor(const pUserName,pUserPassword: WideString; const pidObj: Int64): TColor; stdcall;
    procedure setColor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TColor); stdcall;
    function getBorderColor(const pUserName,pUserPassword: WideString; const pidObj: Int64): TColor; stdcall;
    procedure setBorderColor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TColor); stdcall;
    function getBorderWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setBorderWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITEllipseVisualizationSOAPFunctionality(const ServerURL: WideString): ITEllipseVisualizationSOAPFunctionality;

Type
  {TTWMFVisualizationFunctionality-soap-interface}
  ITTWMFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{389268CA-1FE2-4F19-B1D7-271AEEEA820D}']
  end;
  //. "get interface" routine
  function GetITTWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTWMFVisualizationSOAPFunctionality;

Type
  {TWMFVisualizationFunctionality-soap-interface}
  ITWMFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{E6E85601-305B-406A-971D-728AA46018AE}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure GetJPEGDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure SetProportion(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITWMFVisualizationSOAPFunctionality(const ServerURL: WideString): ITWMFVisualizationSOAPFunctionality;

Type
  {TTPictureVisualizationFunctionality-soap-interface}
  ITTPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{C59F55AC-2CEF-498E-9C70-7BB29F0B86CC}']
  end;
  //. "get interface" routine
  function GetITTPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPictureVisualizationSOAPFunctionality;

Type
  {TPictureVisualizationFunctionality-soap-interface}
  ITPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{4F868306-F95C-4857-96FC-9571FE32803D}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    procedure GetBMP(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out BMP: TByteArray); stdcall;
    procedure SetProportion(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
  end;
  //. "get interface" routine
  function GetITPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITPictureVisualizationSOAPFunctionality;

Type
  {TTRoundVisualizationFunctionality-soap-interface}
  ITTRoundVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{6BC40D46-0278-4F97-B323-0359044C6B33}']
  end;
  //. "get interface" routine
  function GetITTRoundVisualizationSOAPFunctionality(const ServerURL: WideString): ITTRoundVisualizationSOAPFunctionality;

Type
  {TRoundVisualizationFunctionality-soap-interface}
  ITRoundVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{0B87EB5E-B980-4AD7-8EB8-5A22909617F9}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getColor(const pUserName,pUserPassword: WideString; const pidObj: Int64): TColor; stdcall;
    procedure setColor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TColor); stdcall;
    function getBorderColor(const pUserName,pUserPassword: WideString; const pidObj: Int64): TColor; stdcall;
    procedure setBorderColor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TColor); stdcall;
    function getBorderWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setBorderWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITRoundVisualizationSOAPFunctionality(const ServerURL: WideString): ITRoundVisualizationSOAPFunctionality;

Type
  {TTGeodesyPointFunctionality-soap-interface}
  ITTGeodesyPointSOAPFunctionality = Interface(IInvokable)
    ['{2FB54B81-C2C1-42F9-87D2-C34C65A6FC61}']
    function ConvertSpaceCRDToGeoCRD(const pUserName,pUserPassword: WideString;  const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall;
    function ConvertGeoCRDToSpaceCRD(const pUserName,pUserPassword: WideString;  const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall;
    procedure GetNearestCrdSys(const pUserName,pUserPassword: WideString;  const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
    procedure GetInstanceListByCrdSys(const pUserName,pUserPassword: WideString;  const idCrdSys: integer; out List: TByteArray); stdcall;
    function CrdSys_GetNearestGeoPoints(const pUserName,pUserPassword: WideString;  const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
    function CrdSys_GetNearestXYPoints(const pUserName,pUserPassword: WideString;  const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTGeodesyPointSOAPFunctionality(const ServerURL: WideString): ITTGeodesyPointSOAPFunctionality;

Type
  {TGeodesyPointFunctionality-soap-interface}
  ITGeodesyPointSOAPFunctionality = Interface(IInvokable)
    ['{A9674129-25BA-4329-A665-E747A2435993}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getidCrdSys(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidCrdSys(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getX(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setX(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getY(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setY(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getLatitude(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setLatitude(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getLongitude(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setLongitude(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall;
    procedure ValidateByVisualizationComponent(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITGeodesyPointSOAPFunctionality(const ServerURL: WideString): ITGeodesyPointSOAPFunctionality;

Type
  {TTPrivateAreaVisualizationFunctionality-soap-interface}
  ITTPrivateAreaVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{C4877789-989A-4074-95B2-DDBC87EE5641}']
    function CanCreateAsDetail(const pUserName,pUserPassword: WideString): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTPrivateAreaVisualizationSOAPFunctionality(const ServerURL: WideString): ITTPrivateAreaVisualizationSOAPFunctionality;

Type
  {TPrivateAreaVisualizationFunctionality-soap-interface}
  ITPrivateAreaVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{19E8A339-9405-4695-B6BA-8D898B395523}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getAcquireObjectsInside(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setAcquireObjectsInside(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
  end;
  //. "get interface" routine
  function GetITPrivateAreaVisualizationSOAPFunctionality(const ServerURL: WideString): ITPrivateAreaVisualizationSOAPFunctionality;

Type
  {TTHyperTextFunctionality-soap-interface}
  ITTHyperTextSOAPFunctionality = Interface(IInvokable)
    ['{810A25DC-4955-4D8A-9B6A-49CAA73510D8}']
  end;
  //. "get interface" routine
  function GetITTHyperTextSOAPFunctionality(const ServerURL: WideString): ITTHyperTextSOAPFunctionality;

Type
  {THyperTextFunctionality-soap-interface}
  ITHyperTextSOAPFunctionality = Interface(IInvokable)
    ['{500E780A-89F6-4E24-A035-365D5872459E}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITHyperTextSOAPFunctionality(const ServerURL: WideString): ITHyperTextSOAPFunctionality;

Type
  {TTComponentsFindServiceFunctionality-soap-interface}
  ITTComponentsFindServiceSOAPFunctionality = Interface(IInvokable)
    ['{34F68C47-B110-4F95-85AF-EC9BFE328D8E}']
  end;
  //. "get interface" routine
  function GetITTComponentsFindServiceSOAPFunctionality(const ServerURL: WideString): ITTComponentsFindServiceSOAPFunctionality;

Type
  {TComponentsFindServiceFunctionality-soap-interface}
  ITComponentsFindServiceSOAPFunctionality = Interface(IInvokable)
    ['{EC4B5B13-E0B3-47BC-B807-E0FCF07250F4}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITComponentsFindServiceSOAPFunctionality(const ServerURL: WideString): ITComponentsFindServiceSOAPFunctionality;

Type
  {TTUsersServiceFunctionality-soap-interface}
  ITTUsersServiceSOAPFunctionality = Interface(IInvokable)
    ['{D7BC9F90-52E7-450B-A25E-D9B55D1A8043}']
  end;
  //. "get interface" routine
  function GetITTUsersServiceSOAPFunctionality(const ServerURL: WideString): ITTUsersServiceSOAPFunctionality;

Type
  {TUsersServiceFunctionality-soap-interface}
  ITUsersServiceSOAPFunctionality = Interface(IInvokable)
    ['{B4F969B7-4DE7-4B00-AB7E-71DFF57507F3}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITUsersServiceSOAPFunctionality(const ServerURL: WideString): ITUsersServiceSOAPFunctionality;

Type
  {TTTransportServiceFunctionality-soap-interface}
  ITTTransportServiceSOAPFunctionality = Interface(IInvokable)
    ['{7E4B03C6-60F9-4CC5-A3FA-713675C107B7}']
  end;
  //. "get interface" routine
  function GetITTTransportServiceSOAPFunctionality(const ServerURL: WideString): ITTTransportServiceSOAPFunctionality;

Type
  {TTransportServiceFunctionality-soap-interface}
  ITTransportServiceSOAPFunctionality = Interface(IInvokable)
    ['{CDD08FC1-9EF8-436B-B8FA-9D40588EAAB7}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITTransportServiceSOAPFunctionality(const ServerURL: WideString): ITTransportServiceSOAPFunctionality;

Type
  {TTMarketServiceFunctionality-soap-interface}
  ITTMarketServiceSOAPFunctionality = Interface(IInvokable)
    ['{089AEA01-94DA-4FCC-B4C0-2A333FBDD0CA}']
  end;
  //. "get interface" routine
  function GetITTMarketServiceSOAPFunctionality(const ServerURL: WideString): ITTMarketServiceSOAPFunctionality;

Type
  {TMarketServiceFunctionality-soap-interface}
  ITMarketServiceSOAPFunctionality = Interface(IInvokable)
    ['{095B9B71-E9D1-4411-A659-DB0B2702D641}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITMarketServiceSOAPFunctionality(const ServerURL: WideString): ITMarketServiceSOAPFunctionality;

Type
  {TTTelecomServiceFunctionality-soap-interface}
  ITTTelecomServiceSOAPFunctionality = Interface(IInvokable)
    ['{495E5EBC-1BB6-48A5-8EDD-8906BC7D0BCA}']
  end;
  //. "get interface" routine
  function GetITTTelecomServiceSOAPFunctionality(const ServerURL: WideString): ITTTelecomServiceSOAPFunctionality;

Type
  {TTelecomServiceFunctionality-soap-interface}
  ITTelecomServiceSOAPFunctionality = Interface(IInvokable)
    ['{0AD4D9D1-7DAC-4894-8CC6-C962C6B5E2CA}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITTelecomServiceSOAPFunctionality(const ServerURL: WideString): ITTelecomServiceSOAPFunctionality;

Type
  {TTWNDVisualizationFunctionality-soap-interface}
  ITTWNDVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{98634A86-C627-4C94-9716-285E9484A7E4}']
  end;
  //. "get interface" routine
  function GetITTWNDVisualizationSOAPFunctionality(const ServerURL: WideString): ITTWNDVisualizationSOAPFunctionality;

Type
  {TWNDVisualizationFunctionality-soap-interface}
  ITWNDVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{6B2C787D-AF69-4E6B-B281-5A41D3F382D6}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITWNDVisualizationSOAPFunctionality(const ServerURL: WideString): ITWNDVisualizationSOAPFunctionality;

Type
  {TTMRKVisualizationFunctionality-soap-interface}
  ITTMRKVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{422AA1ED-0F4E-4884-9EE8-FE831EF2A8F4}']
  end;
  //. "get interface" routine
  function GetITTMRKVisualizationSOAPFunctionality(const ServerURL: WideString): ITTMRKVisualizationSOAPFunctionality;

Type
  {TMRKVisualizationFunctionality-soap-interface}
  ITMRKVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{AA5AB1F6-8308-4BBE-8C49-DEB4F023B707}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getBindingPointIndex(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setBindingPointIndex(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getAlign1(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setAlign1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oAlign: integer; out oBindingPointIndex: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITMRKVisualizationSOAPFunctionality(const ServerURL: WideString): ITMRKVisualizationSOAPFunctionality;

Type
  {TTOrientedPictureVisualizationFunctionality-soap-interface}
  ITTOrientedPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{5DC028CA-6C15-4538-8708-B6B2B2221A06}']
  end;
  //. "get interface" routine
  function GetITTOrientedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedPictureVisualizationSOAPFunctionality;

Type
  {TOrientedPictureVisualizationFunctionality-soap-interface}
  ITOrientedPictureVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{B5DEEEB4-5253-45DF-91FC-E904ACF6AFC3}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure GetDATA1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    function getWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setWidth(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getHeight(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setHeight(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure ChangeScale(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ScaleFactor: Double); stdcall;
    procedure UpdateContainer(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function IsNewContainerAcceptable(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITOrientedPictureVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedPictureVisualizationSOAPFunctionality;

Type
  {TTOrientedTTFVisualizationFunctionality-soap-interface}
  ITTOrientedTTFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{38B418E8-51FE-460C-B55D-5076E2DF3216}']
  end;
  //. "get interface" routine
  function GetITTOrientedTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTOrientedTTFVisualizationSOAPFunctionality;

Type
  {TOrientedTTFVisualizationFunctionality-soap-interface}
  ITOrientedTTFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{75286D46-D42C-4A7C-824F-284D5BCF1755}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getStr(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setStr(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Value: string); stdcall;
    function getColor(const pUserName,pUserPassword: WideString; const pidObj: Int64): TColor; stdcall;
    procedure setColor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TColor); stdcall;
    function getFont_Name(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setFont_Name(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getFont_Width(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setFont_Width(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getFont_Height(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setFont_Height(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getCharInterval(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setCharInterval(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setOrientation(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure UpdateContainer(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function IsNewContainerAcceptable(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITOrientedTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITOrientedTTFVisualizationSOAPFunctionality;

Type
  {TTIconFunctionality-soap-interface}
  ITTIconSOAPFunctionality = Interface(IInvokable)
    ['{66B79E7D-A924-4C3C-920F-0489DBF6C6B0}']
  end;
  //. "get interface" routine
  function GetITTIconSOAPFunctionality(const ServerURL: WideString): ITTIconSOAPFunctionality;

Type
  {TIconFunctionality-soap-interface}
  ITIconSOAPFunctionality = Interface(IInvokable)
    ['{5E080403-8480-4EDC-BF2B-F1978AEFF96E}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: Integer); stdcall;
    procedure GetBitmapDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out BMPDATAStream: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITIconSOAPFunctionality(const ServerURL: WideString): ITIconSOAPFunctionality;

Type
  {TTMessageBoardMessageFunctionality-soap-interface}
  ITTMessageBoardMessageSOAPFunctionality = Interface(IInvokable)
    ['{4736BA85-537B-44D6-A63A-C20056C939D4}']
  end;
  //. "get interface" routine
  function GetITTMessageBoardMessageSOAPFunctionality(const ServerURL: WideString): ITTMessageBoardMessageSOAPFunctionality;

Type
  {TMessageBoardMessageFunctionality-soap-interface}
  ITMessageBoardMessageSOAPFunctionality = Interface(IInvokable)
    ['{B8B4F3C3-6003-48ED-AEBB-0A1555BE8417}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getIdMessageBoard(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdMessageBoard(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getIdSenderMessageBoard(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdSenderMessageBoard(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function DateCreated(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    function getSubject(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setSubject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetBody(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure SetBody(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
    function getFlRead(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setFlRead(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    function IsEmpty(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    function IsCreatedByUser(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pidUser: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITMessageBoardMessageSOAPFunctionality(const ServerURL: WideString): ITMessageBoardMessageSOAPFunctionality;

Type
  {TTMessageBoardFunctionality-soap-interface}
  ITTMessageBoardSOAPFunctionality = Interface(IInvokable)
    ['{04591CD0-2282-44FA-9289-A1C60A0596FA}']
  end;
  //. "get interface" routine
  function GetITTMessageBoardSOAPFunctionality(const ServerURL: WideString): ITTMessageBoardSOAPFunctionality;

Type
  {TMessageBoardFunctionality-soap-interface}
  ITMessageBoardSOAPFunctionality = Interface(IInvokable)
    ['{63F39A96-E7E0-4436-A22D-2A92B38201F3}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function IsUnreadMessageExist(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure GetMessagesList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    function CreateNewMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure SendMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idMessage: integer); stdcall;
    function getIdUser(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdUser(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITMessageBoardSOAPFunctionality(const ServerURL: WideString): ITMessageBoardSOAPFunctionality;

Type
  {TTHREFFunctionality-soap-interface}
  ITTHREFSOAPFunctionality = Interface(IInvokable)
    ['{979ED6A9-34F2-4CB4-9671-07F41B4689A6}']
  end;
  //. "get interface" routine
  function GetITTHREFSOAPFunctionality(const ServerURL: WideString): ITTHREFSOAPFunctionality;

Type
  {THREFFunctionality-soap-interface}
  ITHREFSOAPFunctionality = Interface(IInvokable)
    ['{D505061D-B855-4434-940E-D6B0BFC357A0}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getURL(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setURL(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getAutoStart(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setAutoStart(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
  end;
  //. "get interface" routine
  function GetITHREFSOAPFunctionality(const ServerURL: WideString): ITHREFSOAPFunctionality;

Type
  {TTQDCVisualizationFunctionality-soap-interface}
  ITTQDCVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{24B1B0BE-5EE4-4F2E-8D28-358FE5C88657}']
  end;
  //. "get interface" routine
  function GetITTQDCVisualizationSOAPFunctionality(const ServerURL: WideString): ITTQDCVisualizationSOAPFunctionality;

Type
  {TQDCVisualizationFunctionality-soap-interface}
  ITQDCVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{86FA318D-F388-4A5E-AAD4-E6B9872AD800}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray); stdcall;
    procedure LoadFromBitmap(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Bitmap: TByteArray); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITQDCVisualizationSOAPFunctionality(const ServerURL: WideString): ITQDCVisualizationSOAPFunctionality;

Type
  {TTOffersServerFunctionality-soap-interface}
  ITTOffersServerSOAPFunctionality = Interface(IInvokable)
    ['{27FE77E0-7845-46CE-8C34-F0C845B9EF2A}']
  end;
  //. "get interface" routine
  function GetITTOffersServerSOAPFunctionality(const ServerURL: WideString): ITTOffersServerSOAPFunctionality;

Type
  {TOffersServerFunctionality-soap-interface}
  ITOffersServerSOAPFunctionality = Interface(IInvokable)
    ['{DE6A23B4-B575-4A5A-826C-A00215093435}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getMailROBOT_Inbox(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setMailROBOT_Inbox(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getMailROBOT_User(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setMailROBOT_User(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getMailROBOT_Password(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setMailROBOT_Password(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITOffersServerSOAPFunctionality(const ServerURL: WideString): ITOffersServerSOAPFunctionality;

Type
  {TTSecurityComponentOperationFunctionality-soap-interface}
  ITTSecurityComponentOperationSOAPFunctionality = Interface(IInvokable)
    ['{F9671CC6-0EBC-47F9-A07B-67DBEB49DAD9}']
    procedure GetInstanceListByContext(const pUserName,pUserPassword: WideString;  const Context: WideString; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTSecurityComponentOperationSOAPFunctionality(const ServerURL: WideString): ITTSecurityComponentOperationSOAPFunctionality;

Type
  {TSecurityComponentOperationFunctionality-soap-interface}
  ITSecurityComponentOperationSOAPFunctionality = Interface(IInvokable)
    ['{3C2022E1-D258-4D9B-AA04-4BE9F036CC06}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getSQLInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setSQLInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITSecurityComponentOperationSOAPFunctionality(const ServerURL: WideString): ITSecurityComponentOperationSOAPFunctionality;

Type
  {TTSecurityKeyFunctionality-soap-interface}
  ITTSecurityKeySOAPFunctionality = Interface(IInvokable)
    ['{3E584642-E2D6-4864-8EF8-7D8C8BF3F0FA}']
    function GetInstanceByCode(const pUserName,pUserPassword: WideString;  const Code: string;  out idInstance: integer): boolean; stdcall;
    procedure GetInstanceListByContext(const pUserName,pUserPassword: WideString;  const Context: WideString; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTSecurityKeySOAPFunctionality(const ServerURL: WideString): ITTSecurityKeySOAPFunctionality;

Type
  {TSecurityKeyFunctionality-soap-interface}
  ITSecurityKeySOAPFunctionality = Interface(IInvokable)
    ['{F353908C-CBFD-4AD9-96AB-0D77D7737A8D}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure GetAssotiatedUsers(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Users: TByteArray); stdcall;
    procedure GenerateCode(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function Code(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITSecurityKeySOAPFunctionality(const ServerURL: WideString): ITSecurityKeySOAPFunctionality;

Type
  {TTSecurityFileFunctionality-soap-interface}
  ITTSecurityFileSOAPFunctionality = Interface(IInvokable)
    ['{C92B396E-1305-4D51-BAA4-A82607544C5E}']
    procedure GetInstanceListByContext(const pUserName,pUserPassword: WideString;  const Context: WideString;out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTSecurityFileSOAPFunctionality(const ServerURL: WideString): ITTSecurityFileSOAPFunctionality;

Type
  {TSecurityFileFunctionality-soap-interface}
  ITSecurityFileSOAPFunctionality = Interface(IInvokable)
    ['{37783B17-AE2F-4AFA-A41F-29D4CCACA184}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray): boolean; stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
    function AddOperationSecurityKey(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
    function RemoveOperationSecurityKey(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
    procedure GetAssotiatedSecurityComponents(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out SecurityComponents: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITSecurityFileSOAPFunctionality(const ServerURL: WideString): ITSecurityFileSOAPFunctionality;

Type
  {TTSecurityComponentFunctionality-soap-interface}
  ITTSecurityComponentSOAPFunctionality = Interface(IInvokable)
    ['{DE412C8A-55E0-47DC-93CD-1DF44D97749B}']
    procedure DestroyInstance(const pUserName,pUserPassword: WideString;  const idObj: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITTSecurityComponentSOAPFunctionality(const ServerURL: WideString): ITTSecurityComponentSOAPFunctionality;

Type
  {TSecurityComponentFunctionality-soap-interface}
  ITSecurityComponentSOAPFunctionality = Interface(IInvokable)
    ['{BC1BE8E7-598C-4703-B970-2B354115903C}']
    procedure ToClone(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idClone: integer); stdcall;
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getIdSecurityFile(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdSecurityFile(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITSecurityComponentSOAPFunctionality(const ServerURL: WideString): ITSecurityComponentSOAPFunctionality;

Type
  {TTMODELUserFunctionality-soap-interface}
  ITTMODELUserSOAPFunctionality = Interface(IInvokable)
    ['{FB810279-6CCE-459F-9690-B8F88CE77C58}']
    function IsUserExist(const pUserName,pUserPassword: WideString;  const UserName: string; out idUser: integer): boolean; stdcall;
    procedure GetInstanceListByContext(const pUserName,pUserPassword: WideString;  const Context: WideString; out List: TByteArray); stdcall;
    procedure GetOnlineUsersForDomains(const pUserName,pUserPassword: WideString;  const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
    procedure GetOnlineExpertsForDomains(const pUserName,pUserPassword: WideString;  const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTMODELUserSOAPFunctionality(const ServerURL: WideString): ITTMODELUserSOAPFunctionality;

Type
  {TMODELUserFunctionality-soap-interface}
  ITMODELUserSOAPFunctionality = Interface(IInvokable)
    ['{B36F13BE-35A0-4DA7-8480-3668FB110AC0}']
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function GetActiveStateInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;
    function IsUserOnLine(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const MaxDelay: Double): boolean; stdcall;
    procedure Logout(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetSecurityKeysList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out SecurityKeys: TByteArray); stdcall;
    function SecurityKeys_IsKeyExist(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idSecurityKey: integer): boolean; stdcall;
    procedure SecurityKeys_Insert(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idSecurityKey: integer); stdcall;
    procedure SecurityKeys_Delete(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idSecurityKey: integer); stdcall;
    procedure SecurityKeys_AddKeyByCode(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Code: WideString); stdcall;
    procedure SecurityKeys_RemoveKeyByCode(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Code: WideString); stdcall;
    function SecurityKeys_CreateAndAddNewKey(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall;
    procedure GetMessageBoards(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    function HaveUnreadMessages(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure GetMessages(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall;
    procedure IncomingMessages_SendNew(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Message: TByteArray; const SenderID: integer); stdcall;
    function IncomingMessages_GetUnread(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out MessageList: TByteArray): boolean; stdcall;
    procedure IncomingMessages_GetMessagesSince(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall;
    procedure IncomingMessages_GetMessage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall;
    procedure IncomingMessages_DeleteTo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const TimeStamp: TDateTime); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getFullName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setFullName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getContactInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setContactInfo(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getPassword(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setPassword(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getIdSecurityFileForClone(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdSecurityFileForClone(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getidSecurityFileForPrivate(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidSecurityFileForPrivate(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getMaxDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setMaxDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getMaxSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setMaxSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getMaxSpaceSquarePerObject(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setMaxSpaceSquarePerObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getDisabled(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setDisabled(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    procedure GetStartObj(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTStartObj,idStartObj: integer); stdcall;
    procedure SetStartObj(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTStartObj,idStartObj: integer); stdcall;
    function getDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDomains(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getTaskEnabled(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setTaskEnabled(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    function getBillingType(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setBillingType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure CheckDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pAddDATASize: integer); stdcall;
    procedure AddDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pAddDATASize: integer); stdcall;
    procedure SubDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pSubDATASize: integer); stdcall;
    procedure CheckSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pAddSpaceSquare: Double); stdcall;
    procedure AddSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pAddSpaceSquare: Double); stdcall;
    procedure SubSpaceSquare(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pSubSpaceSquare: Double); stdcall;
    procedure CheckMaxSpaceSquarePerObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pObjectSpaceSquare: Double); stdcall;
    procedure ServerFolder_GetSubFoldersList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; out List: WideString); stdcall;
    procedure ServerFolder_GetFilesList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; out List: WideString); stdcall;
    function ServerFolder_AddFile(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall;
    function ServerFolder_RemoveFile(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const FileName: WideString): boolean; stdcall;
    function ServerFolder_ReadFile(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall;
    function ServerFolder_AddSubFolder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
    function ServerFolder_AddSubFolder1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall;
    function ServerFolder_RemoveSubFolder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
    function ServerFolder_ReadSubFolder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall;
    function ServerFolder_ExchangeSubFolder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall;
    function Tasks_AddNew(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall;
    procedure Tasks_RemoveItem(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer); stdcall;
    procedure Tasks_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure Tasks_GetData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall;
    procedure Tasks_Item_GetTaskData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; out oTaskData: TByteArray); stdcall;
    procedure Tasks_Item_SetPriority(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pPriority: integer); stdcall;
    procedure Tasks_Item_GetStatus(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall;
    procedure Tasks_Item_SetStatus(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall;
    procedure Tasks_Item_SetStatus1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall;
    procedure Tasks_Item_GetResultData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; out oResultData: TByteArray); stdcall;
    procedure Tasks_Item_SetResult(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall;
    procedure Tasks_Item_SetResult1(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall;
    procedure Tasks_Item_SetResult2(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
    procedure Tasks_Item_SetResult3(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
    function Billing_Account(const pUserName,pUserPassword: WideString; const pidObj: Int64): double; stdcall;
    function Billing_Transactions_AddNew(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pReason: integer; const pDelta: double; const pComment: string): integer; stdcall;
    procedure Billing_Transactions_Remove(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTransaction: integer); stdcall;
    procedure Billing_Transactions_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure Billing_Transactions_GetData(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Version: integer; out oData: TByteArray); stdcall;
    procedure ClientProgram_GetReleases(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITMODELUserSOAPFunctionality(const ServerURL: WideString): ITMODELUserSOAPFunctionality;

Type
  {TTTextureFunctionality-soap-interface}
  ITTTextureSOAPFunctionality = Interface(IInvokable)
    ['{71F33587-A1B4-4774-816F-0ED994FD4540}']
    procedure GetInstanceListMatchingBy(const pUserName,pUserPassword: WideString;  const NameContext: string; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTTextureSOAPFunctionality(const ServerURL: WideString): ITTTextureSOAPFunctionality;

Type
  {TTextureFunctionality-soap-interface}
  ITTextureSOAPFunctionality = Interface(IInvokable)
    ['{D20D0488-DDFB-4123-85F4-FF5BD9FB003B}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: Integer); stdcall;
    procedure GetBitmapDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out BMPDATAStream: TByteArray); stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITTextureSOAPFunctionality(const ServerURL: WideString): ITTextureSOAPFunctionality;

Type
  {TTBuffered3DVisualizationFunctionality-soap-interface}
  ITTBuffered3DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{B1DBA13F-6E71-4A00-99C9-2AC700EA1D6B}']
  end;
  //. "get interface" routine
  function GetITTBuffered3DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBuffered3DVisualizationSOAPFunctionality;

Type
  {TBuffered3DVisualizationFunctionality-soap-interface}
  ITBuffered3DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{4A53171C-18E1-4C81-9D32-7AE01A1A6B85}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure LoadFromStream(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: integer); stdcall;
    procedure Get__Translate_XY(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out vTranslate_X,vTranslate_Y: Double); stdcall;
    procedure SetPropertiesLocal(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;
    procedure UpdateXOYProjection(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setDATAFileID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    procedure DATAFile_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITBuffered3DVisualizationSOAPFunctionality(const ServerURL: WideString): ITBuffered3DVisualizationSOAPFunctionality;

Type
  {TTDATAFileFunctionality-soap-interface}
  ITTDATAFileSOAPFunctionality = Interface(IInvokable)
    ['{24A613AA-4918-45CC-83AB-CA710A888C61}']
  end;
  //. "get interface" routine
  function GetITTDATAFileSOAPFunctionality(const ServerURL: WideString): ITTDATAFileSOAPFunctionality;

Type
  {TDATAFileFunctionality-soap-interface}
  ITDATAFileSOAPFunctionality = Interface(IInvokable)
    ['{20E17188-005A-48DA-BDE5-CD06A45E46A8}']
    procedure Check(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function IsNull(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure Empty(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function getDATASize(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
    function getDATAType(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDATAType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure SetDATAByFileName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const FileName: string); stdcall;
    function getStorageType(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITDATAFileSOAPFunctionality(const ServerURL: WideString): ITDATAFileSOAPFunctionality;

Type
  {TTCoComponentFunctionality-soap-interface}
  ITTCoComponentSOAPFunctionality = Interface(IInvokable)
    ['{7DCD9C18-A829-4867-BA74-19FA683A9EBC}']
    procedure GetInstanceListByCoType(const pUserName,pUserPassword: WideString;  const idCoType: integer; out InstanceList: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTCoComponentSOAPFunctionality(const ServerURL: WideString): ITTCoComponentSOAPFunctionality;

Type
  {TCoComponentFunctionality-soap-interface}
  ITCoComponentSOAPFunctionality = Interface(IInvokable)
    ['{16A913CF-3D4C-4F68-94BE-45265009BFF7}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function idCoType(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function GetIconImage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oImage: TByteArray): boolean; stdcall;
    function GetVisualizationComponent(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTVisualization,idVisualization: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITCoComponentSOAPFunctionality(const ServerURL: WideString): ITCoComponentSOAPFunctionality;

Type
  {TTCoComponentTypeMarkerFunctionality-soap-interface}
  ITTCoComponentTypeMarkerSOAPFunctionality = Interface(IInvokable)
    ['{3D4FBD70-2522-4CAC-8C5C-FDBF42794686}']
  end;
  //. "get interface" routine
  function GetITTCoComponentTypeMarkerSOAPFunctionality(const ServerURL: WideString): ITTCoComponentTypeMarkerSOAPFunctionality;

Type
  {TCoComponentTypeMarkerFunctionality-soap-interface}
  ITCoComponentTypeMarkerSOAPFunctionality = Interface(IInvokable)
    ['{D747564A-1BC1-4398-A6A8-D80FBE9CABB0}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function GetTypeIconImage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oImage: TByteArray): boolean; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getIDCoComponentType(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
  end;
  //. "get interface" routine
  function GetITCoComponentTypeMarkerSOAPFunctionality(const ServerURL: WideString): ITCoComponentTypeMarkerSOAPFunctionality;

Type
  {TTCoComponentTypeFunctionality-soap-interface}
  ITTCoComponentTypeSOAPFunctionality = Interface(IInvokable)
    ['{404DBDD1-2D94-413A-BEFC-921F7529DD27}']
    procedure GetInstanceListByFileType(const pUserName,pUserPassword: WideString;  const FileType: WideString; out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTCoComponentTypeSOAPFunctionality(const ServerURL: WideString): ITTCoComponentTypeSOAPFunctionality;

Type
  {TCoComponentTypeFunctionality-soap-interface}
  ITCoComponentTypeSOAPFunctionality = Interface(IInvokable)
    ['{69754687-61E0-453F-854B-A5CA8D41D172}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetDescription(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: TByteArray); stdcall;
    procedure SetDescription(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TByteArray); stdcall;
    procedure GetMarkersList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    function GetIconImage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oImage: TByteArray): boolean; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getUID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function getDateCreated(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    function getFileType(const pUserName,pUserPassword: WideString; const pidObj: Int64): shortstring; stdcall;
    procedure setFileType(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: shortstring); stdcall;
    function getCoComponentPrototypeID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setCoComponentPrototypeID(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITCoComponentTypeSOAPFunctionality(const ServerURL: WideString): ITCoComponentTypeSOAPFunctionality;

Type
  {TTAddressFunctionality-soap-interface}
  ITTAddressSOAPFunctionality = Interface(IInvokable)
    ['{10497027-4DD6-420B-88D8-1F255A55B724}']
    procedure Points_GetTypeNames(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
    procedure Streets_GetTypeNames(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTAddressSOAPFunctionality(const ServerURL: WideString): ITTAddressSOAPFunctionality;

Type
  {TAddressFunctionality-soap-interface}
  ITAddressSOAPFunctionality = Interface(IInvokable)
    ['{CB728CC5-1E30-4986-B115-60B54E46EFAC}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getIdPoint(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdPoint(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getPoint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getIdStreet(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdStreet(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getStreet(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHouse(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setHouse(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getCorps(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setCorps(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getApartment(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setApartment(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getEntrance(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setEntrance(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITAddressSOAPFunctionality(const ServerURL: WideString): ITAddressSOAPFunctionality;

Type
  {TTTransportRouteFunctionality-soap-interface}
  ITTTransportRouteSOAPFunctionality = Interface(IInvokable)
    ['{0370B539-FA72-4F0A-A2C9-A11138EF4AE6}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTTransportRouteSOAPFunctionality(const ServerURL: WideString): ITTTransportRouteSOAPFunctionality;

Type
  {TTransportRouteFunctionality-soap-interface}
  ITTransportRouteSOAPFunctionality = Interface(IInvokable)
    ['{628C85C7-A0B7-4982-B727-80A1AD8CC8FF}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getidTTransport(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setidTTransport(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getValid(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure setValid(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: boolean); stdcall;
    function getRemarks(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setRemarks(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function IsNodesExist(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    procedure Nodes_GetList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    function Nodes_IsNodeExist(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idNode: integer): boolean; stdcall;
    procedure Nodes_ChangeNodeOrder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer; const Order: integer); stdcall;
    function Nodes__Node_DistanceBefore(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer): integer; stdcall;
    procedure Nodes__Node_SetDistanceBefore(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer; const D: integer); stdcall;
    function Nodes__Node_OrderPrice(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer): string; stdcall;
    procedure Nodes__Node_SetOrderPrice(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer; const Price: string); stdcall;
    function Nodes_Insert(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idNode: integer): integer; stdcall;
    procedure Nodes_Remove(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idItem: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITTransportRouteSOAPFunctionality(const ServerURL: WideString): ITTransportRouteSOAPFunctionality;

Type
  {TTTransportNodeFunctionality-soap-interface}
  ITTTransportNodeSOAPFunctionality = Interface(IInvokable)
    ['{D6E99FF2-8E79-4A7A-A59D-D2354F3790AD}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTTransportNodeSOAPFunctionality(const ServerURL: WideString): ITTTransportNodeSOAPFunctionality;

Type
  {TTransportNodeFunctionality-soap-interface}
  ITTransportNodeSOAPFunctionality = Interface(IInvokable)
    ['{C06DFA67-CFF2-4F19-9E3C-F2D36FCE75F4}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function IsRoutesExist(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTransportNodeSOAPFunctionality(const ServerURL: WideString): ITTransportNodeSOAPFunctionality;

Type
  {TTOfferGoodsFunctionality-soap-interface}
  ITTOfferGoodsSOAPFunctionality = Interface(IInvokable)
    ['{07279C88-7A7D-4046-8758-C98664BEAE9F}']
  end;
  //. "get interface" routine
  function GetITTOfferGoodsSOAPFunctionality(const ServerURL: WideString): ITTOfferGoodsSOAPFunctionality;

Type
  {TOfferGoodsFunctionality-soap-interface}
  ITOfferGoodsSOAPFunctionality = Interface(IInvokable)
    ['{46717ED0-7672-406E-825D-0B19F437D10A}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function idOffer(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function getIdGoods(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdGoods(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getAmount(const pUserName,pUserPassword: WideString; const pidObj: Int64): Double; stdcall;
    procedure setAmount(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Double); stdcall;
    function getIdMeasureUnit(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setIdMeasureUnit(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getMeasureUnit(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getMinPrice(const pUserName,pUserPassword: WideString; const pidObj: Int64): Currency; stdcall;
    procedure setMinPrice(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: Currency); stdcall;
    function getMisc(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setMisc(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITOfferGoodsSOAPFunctionality(const ServerURL: WideString): ITOfferGoodsSOAPFunctionality;

Type
  {TTTLFStationTMTFunctionality-soap-interface}
  ITTTLFStationTMTSOAPFunctionality = Interface(IInvokable)
    ['{E1C14EDE-5AE0-4222-9B53-BC8F8E451D0B}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTTLFStationTMTSOAPFunctionality(const ServerURL: WideString): ITTTLFStationTMTSOAPFunctionality;

Type
  {TTLFStationTMTFunctionality-soap-interface}
  ITTLFStationTMTSOAPFunctionality = Interface(IInvokable)
    ['{3E74F2CA-854F-44D8-B08F-23D45243C3D1}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHostName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setHostName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getTestChanel(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setTestChanel(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
  end;
  //. "get interface" routine
  function GetITTLFStationTMTSOAPFunctionality(const ServerURL: WideString): ITTLFStationTMTSOAPFunctionality;

Type
  {TTNameFunctionality-soap-interface}
  ITTNameSOAPFunctionality = Interface(IInvokable)
    ['{5E8A317F-A592-467D-B92E-3CF647EB057F}']
  end;
  //. "get interface" routine
  function GetITTNameSOAPFunctionality(const ServerURL: WideString): ITTNameSOAPFunctionality;

Type
  {TNameFunctionality-soap-interface}
  ITNameSOAPFunctionality = Interface(IInvokable)
    ['{10B25A7D-68F8-4B6F-AF13-3A94041F10F1}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function Value(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure SetValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const NewValue: string); stdcall;
  end;
  //. "get interface" routine
  function GetITNameSOAPFunctionality(const ServerURL: WideString): ITNameSOAPFunctionality;

Type
  {TTVisualizationFunctionality-soap-interface}
  ITTVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{1E0FA3DF-FA12-4EEE-BFBB-7BDED6B35FB5}']
  end;
  //. "get interface" routine
  function GetITTVisualizationSOAPFunctionality(const ServerURL: WideString): ITTVisualizationSOAPFunctionality;

Type
  {TVisualizationFunctionality-soap-interface}
  ITVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{FF72B5D7-FB8D-4A3D-8BF3-4AD70F97465F}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITVisualizationSOAPFunctionality(const ServerURL: WideString): ITVisualizationSOAPFunctionality;

Type
  {TTHREFVisualizationFunctionality-soap-interface}
  ITTHREFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{92CBF156-8F21-48ED-8E63-BEE05D32229F}']
  end;
  //. "get interface" routine
  function GetITTHREFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTHREFVisualizationSOAPFunctionality;

Type
  {THREFVisualizationFunctionality-soap-interface}
  ITHREFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{AB8FC8F8-08CB-4ED8-BE1B-E146DE95B8DC}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITHREFVisualizationSOAPFunctionality(const ServerURL: WideString): ITHREFVisualizationSOAPFunctionality;

Type
  {TTTTFVisualizationFunctionality-soap-interface}
  ITTTTFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{E207EE56-2E35-445B-91DD-DF450BA150D1}']
  end;
  //. "get interface" routine
  function GetITTTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTTFVisualizationSOAPFunctionality;

Type
  {TTTFVisualizationFunctionality-soap-interface}
  ITTTFVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{2C892471-B416-4B20-8CCD-C05A1446966B}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getStr(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setStr(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Value: string); stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall;
  end;
  //. "get interface" routine
  function GetITTTFVisualizationSOAPFunctionality(const ServerURL: WideString): ITTTFVisualizationSOAPFunctionality;

Type
  {TTObjectFunctionality-soap-interface}
  ITTObjectSOAPFunctionality = Interface(IInvokable)
    ['{BC096C9C-2D7D-45FE-AF3B-EDCB9839985B}']
  end;
  //. "get interface" routine
  function GetITTObjectSOAPFunctionality(const ServerURL: WideString): ITTObjectSOAPFunctionality;

Type
  {TObjectFunctionality-soap-interface}
  ITObjectSOAPFunctionality = Interface(IInvokable)
    ['{ED1F3B6F-285A-4BA7-8D15-6E2D9A8A05ED}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITObjectSOAPFunctionality(const ServerURL: WideString): ITObjectSOAPFunctionality;

Type
  {TTLabelFunctionality-soap-interface}
  ITTLabelSOAPFunctionality = Interface(IInvokable)
    ['{E57B524C-B692-4F23-8978-6AEAFECA21DB}']
  end;
  //. "get interface" routine
  function GetITTLabelSOAPFunctionality(const ServerURL: WideString): ITTLabelSOAPFunctionality;

Type
  {TLabelFunctionality-soap-interface}
  ITLabelSOAPFunctionality = Interface(IInvokable)
    ['{49FBF9BB-1D31-4BFB-94CC-EB535F1906FF}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITLabelSOAPFunctionality(const ServerURL: WideString): ITLabelSOAPFunctionality;

Type
  {TTStationFunctionality-soap-interface}
  ITTStationSOAPFunctionality = Interface(IInvokable)
    ['{ED94FEAA-8351-4182-A4EA-82489D49B8C2}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTStationSOAPFunctionality(const ServerURL: WideString): ITTStationSOAPFunctionality;

Type
  {TStationFunctionality-soap-interface}
  ITStationSOAPFunctionality = Interface(IInvokable)
    ['{73B49263-6562-420F-A2BC-C0C1336A3B50}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetNumbersBound(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out BegNumber,EndNumber: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITStationSOAPFunctionality(const ServerURL: WideString): ITStationSOAPFunctionality;

Type
  {TTMainLineFunctionality-soap-interface}
  ITTMainLineSOAPFunctionality = Interface(IInvokable)
    ['{C76ECAE3-D155-42F1-8782-68647C0D203C}']
  end;
  //. "get interface" routine
  function GetITTMainLineSOAPFunctionality(const ServerURL: WideString): ITTMainLineSOAPFunctionality;

Type
  {TMainLineFunctionality-soap-interface}
  ITMainLineSOAPFunctionality = Interface(IInvokable)
    ['{4EF5A8EC-6378-4792-BCF3-0532B2B74606}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function GetSTNOwner(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITMainLineSOAPFunctionality(const ServerURL: WideString): ITMainLineSOAPFunctionality;

Type
  {TTDescriptionFunctionality-soap-interface}
  ITTDescriptionSOAPFunctionality = Interface(IInvokable)
    ['{97661EA6-AF1B-4B38-8A1C-7287AFC73D32}']
  end;
  //. "get interface" routine
  function GetITTDescriptionSOAPFunctionality(const ServerURL: WideString): ITTDescriptionSOAPFunctionality;

Type
  {TDescriptionFunctionality-soap-interface}
  ITDescriptionSOAPFunctionality = Interface(IInvokable)
    ['{887D0DC0-81EC-4D2E-A1E1-9EE9FE3DC566}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure GetValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out vText: TByteArray); stdcall;
    procedure SetValue(const pUserName,pUserPassword: WideString; const pidObj: Int64;  NewValue: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITDescriptionSOAPFunctionality(const ServerURL: WideString): ITDescriptionSOAPFunctionality;

Type
  {TTImageFunctionality-soap-interface}
  ITTImageSOAPFunctionality = Interface(IInvokable)
    ['{24B3EDDA-8449-4E50-BF29-5167E0C29BE3}']
  end;
  //. "get interface" routine
  function GetITTImageSOAPFunctionality(const ServerURL: WideString): ITTImageSOAPFunctionality;

Type
  {TImageFunctionality-soap-interface}
  ITImageSOAPFunctionality = Interface(IInvokable)
    ['{35B0EFBF-ECB6-45F3-AF11-82F33B0289D9}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function GetDATAType1(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure GetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out DATAStream: TByteArray; out DATAType: Integer); stdcall;
    procedure SetDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  DATAStream: TByteArray; const DATAType: Integer); stdcall;
    procedure GetBitmapDATA(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out BMPDATAStream: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITImageSOAPFunctionality(const ServerURL: WideString): ITImageSOAPFunctionality;

Type
  {TTWellFunctionality-soap-interface}
  ITTWellSOAPFunctionality = Interface(IInvokable)
    ['{1A8C3D09-F12B-493E-AAF0-46CD9BC06C82}']
  end;
  //. "get interface" routine
  function GetITTWellSOAPFunctionality(const ServerURL: WideString): ITTWellSOAPFunctionality;

Type
  {TWellFunctionality-soap-interface}
  ITWellSOAPFunctionality = Interface(IInvokable)
    ['{80686889-EC1F-4071-AE59-D18F40596105}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITWellSOAPFunctionality(const ServerURL: WideString): ITWellSOAPFunctionality;

Type
  {TTTLFFunctionality-soap-interface}
  ITTTLFSOAPFunctionality = Interface(IInvokable)
    ['{08F4AFC6-BFC5-4F5B-A1C4-60F6626B45FA}']
    procedure GetIDInstanceByNumber(const pUserName,pUserPassword: WideString;  out ID: integer; const Number: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITTTLFSOAPFunctionality(const ServerURL: WideString): ITTTLFSOAPFunctionality;

Type
  {TTLFFunctionality-soap-interface}
  ITTLFSOAPFunctionality = Interface(IInvokable)
    ['{AA7BF63A-74CB-4101-AD70-DF0C3552031A}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function Number(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function LocalELockExist(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    function GlobalELockExist(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    function GetFinishDevice(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out vidTObj,vidObj: integer): boolean; stdcall;
    function IsDamaged(const pUserName,pUserPassword: WideString; const pidObj: Int64): boolean; stdcall;
    function idDamage(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function getDamage_TimeNote(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setDamage_TimeNote(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    function getDamage_Note(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Note(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getDamage_Measured(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Measured(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getDamage_Acceptor(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Acceptor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getDamage_TimeBegRepair(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setDamage_TimeBegRepair(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    function getDamage_TimeEndRepair(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setDamage_TimeEndRepair(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    function getDamage_Damage(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Damage(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getDamage_Executor(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Executor(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getDamage_Remarks(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setDamage_Remarks(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    procedure WriteEvent(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Event: string; const EventTime: TDateTime); stdcall;
  end;
  //. "get interface" routine
  function GetITTLFSOAPFunctionality(const ServerURL: WideString): ITTLFSOAPFunctionality;

Type
  {TTBoxFunctionality-soap-interface}
  ITTBoxSOAPFunctionality = Interface(IInvokable)
    ['{39DF23D3-CFB0-4247-9FF0-D08F09A0472C}']
  end;
  //. "get interface" routine
  function GetITTBoxSOAPFunctionality(const ServerURL: WideString): ITTBoxSOAPFunctionality;

Type
  {TBoxFunctionality-soap-interface}
  ITBoxSOAPFunctionality = Interface(IInvokable)
    ['{297CE31C-0F6A-4E22-BDD7-8CDBACDBEA81}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITBoxSOAPFunctionality(const ServerURL: WideString): ITBoxSOAPFunctionality;

Type
  {TTCableBoxFunctionality-soap-interface}
  ITTCableBoxSOAPFunctionality = Interface(IInvokable)
    ['{6C2D2A54-90C8-4BB6-9F44-076DC306DB66}']
  end;
  //. "get interface" routine
  function GetITTCableBoxSOAPFunctionality(const ServerURL: WideString): ITTCableBoxSOAPFunctionality;

Type
  {TCableBoxFunctionality-soap-interface}
  ITCableBoxSOAPFunctionality = Interface(IInvokable)
    ['{59485C44-F38A-4437-891A-1FC41EE55996}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITCableBoxSOAPFunctionality(const ServerURL: WideString): ITCableBoxSOAPFunctionality;

Type
  {TTDistrLineFunctionality-soap-interface}
  ITTDistrLineSOAPFunctionality = Interface(IInvokable)
    ['{7E1717AE-8085-47F7-8A16-CCE646C72212}']
  end;
  //. "get interface" routine
  function GetITTDistrLineSOAPFunctionality(const ServerURL: WideString): ITTDistrLineSOAPFunctionality;

Type
  {TDistrLineFunctionality-soap-interface}
  ITDistrLineSOAPFunctionality = Interface(IInvokable)
    ['{EEF76DF9-69AF-41C3-AC13-99F79DF51DA8}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITDistrLineSOAPFunctionality(const ServerURL: WideString): ITDistrLineSOAPFunctionality;

Type
  {TTClientFunctionality-soap-interface}
  ITTClientSOAPFunctionality = Interface(IInvokable)
    ['{CE001C27-2FE3-4785-9EAB-EF607C450A65}']
    procedure GetInstanceList(const pUserName,pUserPassword: WideString;  out List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTClientSOAPFunctionality(const ServerURL: WideString): ITTClientSOAPFunctionality;

Type
  {TClientFunctionality-soap-interface}
  ITClientSOAPFunctionality = Interface(IInvokable)
    ['{E04C9B6E-0B3E-4F09-9E61-94941B25DC3B}']
    function GetDebet(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out Value: Double): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITClientSOAPFunctionality(const ServerURL: WideString): ITClientSOAPFunctionality;

Type
  {TTHouseFunctionality-soap-interface}
  ITTHouseSOAPFunctionality = Interface(IInvokable)
    ['{CD236C3D-5A88-4F45-B853-189DC93C1096}']
  end;
  //. "get interface" routine
  function GetITTHouseSOAPFunctionality(const ServerURL: WideString): ITTHouseSOAPFunctionality;

Type
  {THouseFunctionality-soap-interface}
  ITHouseSOAPFunctionality = Interface(IInvokable)
    ['{C4CE5C35-F959-43AE-B45B-13966A2298E2}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITHouseSOAPFunctionality(const ServerURL: WideString): ITHouseSOAPFunctionality;

Type
  {TTCommNodeFunctionality-soap-interface}
  ITTCommNodeSOAPFunctionality = Interface(IInvokable)
    ['{8E813FA3-8794-4143-846F-D85FBDE980F6}']
  end;
  //. "get interface" routine
  function GetITTCommNodeSOAPFunctionality(const ServerURL: WideString): ITTCommNodeSOAPFunctionality;

Type
  {TCommNodeFunctionality-soap-interface}
  ITCommNodeSOAPFunctionality = Interface(IInvokable)
    ['{81AF839A-6C90-44AE-ABF5-02076851A945}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITCommNodeSOAPFunctionality(const ServerURL: WideString): ITCommNodeSOAPFunctionality;

Type
  {TTCrossFunctionality-soap-interface}
  ITTCrossSOAPFunctionality = Interface(IInvokable)
    ['{9BC03EDF-1374-438A-B1E4-EBE42CF88BFD}']
  end;
  //. "get interface" routine
  function GetITTCrossSOAPFunctionality(const ServerURL: WideString): ITTCrossSOAPFunctionality;

Type
  {TCrossFunctionality-soap-interface}
  ITCrossSOAPFunctionality = Interface(IInvokable)
    ['{64017967-5BE7-49A8-B8D5-5ABE94E75686}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITCrossSOAPFunctionality(const ServerURL: WideString): ITCrossSOAPFunctionality;

Type
  {TTCaseFunctionality-soap-interface}
  ITTCaseSOAPFunctionality = Interface(IInvokable)
    ['{4EF792BE-2E5A-4EED-96D8-E458B679198D}']
  end;
  //. "get interface" routine
  function GetITTCaseSOAPFunctionality(const ServerURL: WideString): ITTCaseSOAPFunctionality;

Type
  {TCaseFunctionality-soap-interface}
  ITCaseSOAPFunctionality = Interface(IInvokable)
    ['{87ED074A-0035-4443-B1CE-316B64476A16}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITCaseSOAPFunctionality(const ServerURL: WideString): ITCaseSOAPFunctionality;

Type
  {TTStreetFunctionality-soap-interface}
  ITTStreetSOAPFunctionality = Interface(IInvokable)
    ['{39819777-7224-483E-A458-21C852EA32A7}']
  end;
  //. "get interface" routine
  function GetITTStreetSOAPFunctionality(const ServerURL: WideString): ITTStreetSOAPFunctionality;

Type
  {TStreetFunctionality-soap-interface}
  ITStreetSOAPFunctionality = Interface(IInvokable)
    ['{C481425F-B17D-43CF-9343-09152F79C56C}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITStreetSOAPFunctionality(const ServerURL: WideString): ITStreetSOAPFunctionality;

Type
  {TTOtherObjFunctionality-soap-interface}
  ITTOtherObjSOAPFunctionality = Interface(IInvokable)
    ['{FCB8379D-7E27-4946-BE9D-D3019410D972}']
  end;
  //. "get interface" routine
  function GetITTOtherObjSOAPFunctionality(const ServerURL: WideString): ITTOtherObjSOAPFunctionality;

Type
  {TOtherObjFunctionality-soap-interface}
  ITOtherObjSOAPFunctionality = Interface(IInvokable)
    ['{D375D7DE-2CA1-4221-9618-FE7D923FA528}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITOtherObjSOAPFunctionality(const ServerURL: WideString): ITOtherObjSOAPFunctionality;

Type
  {TTSpanFunctionality-soap-interface}
  ITTSpanSOAPFunctionality = Interface(IInvokable)
    ['{90AC2471-0D1D-489D-AE77-4BFEDC514604}']
  end;
  //. "get interface" routine
  function GetITTSpanSOAPFunctionality(const ServerURL: WideString): ITTSpanSOAPFunctionality;

Type
  {TSpanFunctionality-soap-interface}
  ITSpanSOAPFunctionality = Interface(IInvokable)
    ['{4BD70B63-89E0-422F-ABCE-5043A06BA69C}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITSpanSOAPFunctionality(const ServerURL: WideString): ITSpanSOAPFunctionality;

Type
  {TTChanelFunctionality-soap-interface}
  ITTChanelSOAPFunctionality = Interface(IInvokable)
    ['{C722EB01-86C0-4657-AB9E-40F22FC1E311}']
  end;
  //. "get interface" routine
  function GetITTChanelSOAPFunctionality(const ServerURL: WideString): ITTChanelSOAPFunctionality;

Type
  {TChanelFunctionality-soap-interface}
  ITChanelSOAPFunctionality = Interface(IInvokable)
    ['{4F81656F-9E1B-461F-A791-76882AA89825}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITChanelSOAPFunctionality(const ServerURL: WideString): ITChanelSOAPFunctionality;

Type
  {TTHandHoldFunctionality-soap-interface}
  ITTHandHoldSOAPFunctionality = Interface(IInvokable)
    ['{352A14E6-2292-4F09-8A70-C57B255B354A}']
  end;
  //. "get interface" routine
  function GetITTHandHoldSOAPFunctionality(const ServerURL: WideString): ITTHandHoldSOAPFunctionality;

Type
  {THandHoldFunctionality-soap-interface}
  ITHandHoldSOAPFunctionality = Interface(IInvokable)
    ['{9A31E8E4-5E30-461C-A755-EC3DEC3CD8A5}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITHandHoldSOAPFunctionality(const ServerURL: WideString): ITHandHoldSOAPFunctionality;

Type
  {TTLineDistFunctionality-soap-interface}
  ITTLineDistSOAPFunctionality = Interface(IInvokable)
    ['{5B227127-B215-45C1-9D3B-917C860B34EE}']
  end;
  //. "get interface" routine
  function GetITTLineDistSOAPFunctionality(const ServerURL: WideString): ITTLineDistSOAPFunctionality;

Type
  {TLineDistFunctionality-soap-interface}
  ITLineDistSOAPFunctionality = Interface(IInvokable)
    ['{BB1E2BB0-D97C-4EB5-ADAF-D163F3464346}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITLineDistSOAPFunctionality(const ServerURL: WideString): ITLineDistSOAPFunctionality;

Type
  {TTMuffFunctionality-soap-interface}
  ITTMuffSOAPFunctionality = Interface(IInvokable)
    ['{53F4334D-85AB-49E7-9B76-E1607D60688E}']
  end;
  //. "get interface" routine
  function GetITTMuffSOAPFunctionality(const ServerURL: WideString): ITTMuffSOAPFunctionality;

Type
  {TMuffFunctionality-soap-interface}
  ITMuffSOAPFunctionality = Interface(IInvokable)
    ['{8A69E16A-7098-4DB4-A026-A4B1E2817BAB}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITMuffSOAPFunctionality(const ServerURL: WideString): ITMuffSOAPFunctionality;

Type
  {TTOfferFunctionality-soap-interface}
  ITTOfferSOAPFunctionality = Interface(IInvokable)
    ['{28E527DE-9D7F-459D-9CE8-B78DD1C8F26B}']
    function GetOfferByHumanID(const pUserName,pUserPassword: WideString;  const HumanID: integer; out idOffer: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTOfferSOAPFunctionality(const ServerURL: WideString): ITTOfferSOAPFunctionality;

Type
  {TOfferFunctionality-soap-interface}
  ITOfferSOAPFunctionality = Interface(IInvokable)
    ['{63BFF508-F863-4148-9ADF-907F6C55195C}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getSchedule(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setSchedule(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getPassword(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setPassword(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getContactTLF(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure setContactTLF(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: integer); stdcall;
    function getLastUpdated(const pUserName,pUserPassword: WideString; const pidObj: Int64): TDateTime; stdcall;
    procedure setLastUpdated(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: TDateTime); stdcall;
    procedure LoadDATAFromStream(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Stream: TByteArray); stdcall;
    function UserID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function UID(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function AddressStr(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function Goods_Insert(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    procedure Goods_GetList(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure Goods_Remove(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idOfferGoods: integer); stdcall;
    procedure Goods_Clear(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
  end;
  //. "get interface" routine
  function GetITOfferSOAPFunctionality(const ServerURL: WideString): ITOfferSOAPFunctionality;

Type
  {TTDemandFunctionality-soap-interface}
  ITTDemandSOAPFunctionality = Interface(IInvokable)
    ['{A5CCDA81-9EC6-4FC5-A8DD-5FE8C2BFE8D4}']
  end;
  //. "get interface" routine
  function GetITTDemandSOAPFunctionality(const ServerURL: WideString): ITTDemandSOAPFunctionality;

Type
  {TDemandFunctionality-soap-interface}
  ITDemandSOAPFunctionality = Interface(IInvokable)
    ['{21BE28FE-E5DB-4533-BC74-23C6623E1C7F}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITDemandSOAPFunctionality(const ServerURL: WideString): ITDemandSOAPFunctionality;

Type
  {TTCommLineFunctionality-soap-interface}
  ITTCommLineSOAPFunctionality = Interface(IInvokable)
    ['{52E566C7-E8E6-4ED5-9693-B09590FEE659}']
  end;
  //. "get interface" routine
  function GetITTCommLineSOAPFunctionality(const ServerURL: WideString): ITTCommLineSOAPFunctionality;

Type
  {TCommLineFunctionality-soap-interface}
  ITCommLineSOAPFunctionality = Interface(IInvokable)
    ['{A88D62ED-68D2-44FE-BD42-C15D22A9A7E1}']
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITCommLineSOAPFunctionality(const ServerURL: WideString): ITCommLineSOAPFunctionality;

Type
  {TTGoodsFunctionality-soap-interface}
  ITTGoodsSOAPFunctionality = Interface(IInvokable)
    ['{6010AB41-00CC-4E64-B4C5-DE216CB25E25}']
    procedure GetInstanceListContainingContext(const pUserName,pUserPassword: WideString;  const Context: string; out List: TByteArray); stdcall;
    function IsInstanceExist(const pUserName,pUserPassword: WideString;  const pName: string; out idGoods: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTGoodsSOAPFunctionality(const ServerURL: WideString): ITTGoodsSOAPFunctionality;

Type
  {TGoodsFunctionality-soap-interface}
  ITGoodsSOAPFunctionality = Interface(IInvokable)
    ['{AF9C8DC9-BFF5-4FDB-BD98-F1C4D22CCE18}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function StdAmount(const pUserName,pUserPassword: WideString; const pidObj: Int64): integer; stdcall;
    function StdMeasureUnit(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITGoodsSOAPFunctionality(const ServerURL: WideString): ITGoodsSOAPFunctionality;

Type
  {TTCollectionFunctionality-soap-interface}
  ITTCollectionSOAPFunctionality = Interface(IInvokable)
    ['{4CDD3AE3-116D-4492-AEC0-967EF8AF61D7}']
  end;
  //. "get interface" routine
  function GetITTCollectionSOAPFunctionality(const ServerURL: WideString): ITTCollectionSOAPFunctionality;

Type
  {TCollectionFunctionality-soap-interface}
  ITCollectionSOAPFunctionality = Interface(IInvokable)
    ['{9E65767A-B420-41E7-963B-1B49525B32D2}']
    function getName(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidObj: Int64): string; stdcall;
    function InsertItem(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;
    procedure RemoveItem(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const id: integer); stdcall;
    procedure Item_ChangeAlias(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const id: integer; const pAlias: string); stdcall;
    procedure Item_ChangeListOrder(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const id: integer; const Order: integer); stdcall;
    procedure RemoveItems(const pUserName,pUserPassword: WideString; const pidObj: Int64); stdcall;
    function IsItemExist(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const idTItem,idItem: integer): boolean; stdcall;
    procedure GetListItems(const pUserName,pUserPassword: WideString; const pidObj: Int64;  out List: TByteArray); stdcall;
    procedure SaveListItems(const pUserName,pUserPassword: WideString; const pidObj: Int64;  const List: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITCollectionSOAPFunctionality(const ServerURL: WideString): ITCollectionSOAPFunctionality;

