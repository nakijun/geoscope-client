Unit TypesDefines;
Interface
Uses
  Classes,
  Graphics,
  JPeg;

//. ----------------------------------- built-in component types definitions ---------------------------------
CONST
//. 2.07.11
  nmTTileServerVisualization = 'Tile-Server-visualization';
  idTTileServerVisualization = 2085;
  tnTTileServerVisualization = 'TileServerVisualizations';

Type

  TTileServerVisualizationLevel = packed record
    id: integer;
    DivX: integer;
    DivY: integer;
    SegmentWidth: double;
    SegmentHeight: double;
    VisibleMinScale: double;
    VisibleMaxScale: double;
  end;

  TTileServerVisualizationLevelSegment = packed record
    id: integer;
    XIndex: integer;
    YIndex: integer;
    _DATA: TMemoryStream;
  end;

CONST
//. 20.03.11
  nmTMeasurementObject = 'Measurement Object';
  idTMeasurementObject = 2084;
  tnTMeasurementObject = 'MeasurementObjects';

//. 13.05.10
  nmTAreaNotificationServer = 'Area-Notification Server';
  idTAreaNotificationServer = 2083;
  tnTAreaNotificationServer = 'AreaNotificationServers';

//. 2.10.09
  nmTMODELServerVisualization = 'MODELServer-visualization';
  idTMODELServerVisualization = 2082;
  tnTMODELServerVisualization = 'MODELServerVisualizations';

//. 4.07.09
  nmTDoubleVar = 'Double variable';
  idTDoubleVar = 2081;
  tnTDoubleVar = 'DoubleVars';

  nmTInt32Var = 'Int32 variable';
  idTInt32Var = 2080;
  tnTInt32Var = 'Int32Vars';

//. 18.03.09
  nmTURL = 'URL';
  idTURL = 2079;
  tnTURL = 'URLs';

//. 8.01.09
  nmTPatternVisualization = 'Pattern-visualization';
  idTPatternVisualization = 2078;
  tnTPatternVisualization = 'PatternVisualizations';

//. 6.12.08
  nmTMapFormatObject = 'Map-format object';
  idTMapFormatObject = 2077;
  tnTMapFormatObject = 'MapFormatObjects';

  nmTMapFormatMap = 'Map-format map';
  idTMapFormatMap = 2076;
  tnTMapFormatMap = 'MapFormatMaps';

//. 24.10.08
  nmTSPLVisualization = 'Spline-visualization';
  idTSPLVisualization = 2075;
  tnTSPLVisualization = 'SPLVisualizations';
Type
  TSPLVisualizationType = (stSimple = 0);

CONST
//. 1.04.08
  nmTBoolVar = 'Boolean variable';
  idTBoolVar = 2074;
  tnTBoolVar = 'BoolVars';

//. 4.01.08
  nmTGeoGraphServerObject = 'Geo graph server object';
  idTGeoGraphServerObject = 2073;
  tnTGeoGraphServerObject = 'GeoGraphServerObjects';

//. 11.08.07
  nmTGeoSpace = 'GeoSpace';
  idTGeoSpace = 2072;
  tnTGeoSpace = 'GeoSpaces';

//. 16.02.07
  nmTUserAlert = 'User Alert';
  idTUserAlert = 2071;
  tnTUserAlert = 'UserAlerts';

CONST
//. 2.02.07
  nmTGeoGraphServer = 'Geo graph server';
  idTGeoGraphServer = 2070;
  tnTGeoGraphServer = 'GeoGraphServers';

CONST
//. 22.01.07
  nmTGeoCrdSystem = 'geo coordinate system';
  idTGeoCrdSystem = 2069;
  tnTGeoCrdSystem = 'GeoCrdSystems';

CONST
//. 10.02.06
  nmTFilterVisualization = 'Filter-visualization';
  idTFilterVisualization = 2068;
  tnTFilterVisualization = 'FilterVisualizations';

Type
  TFilterVisualizationType = (ftContrasting,ftFastContrasting,ftColorScaling,ftColorMixing,ftFastColorMixing,ftSimpleColorMixing);
Const
  FilterVisualizationTypeStrings: array [TFilterVisualizationType] of string = ('Contrasting','FastContrasting','ColorScaling','ColorMixing','FastColorMixing','SimpleColorMixing');

CONST
//. 10.01.06
  nmTHINTVisualization = 'Hint-visualization';
  idTHINTVisualization = 2067;
  tnTHINTVisualization = 'HINTVisualizations';

//. 19.12.05
  nmTDetailedPictureVisualization = 'Detailed picture visualization';
  idTDetailedPictureVisualization = 2065;
  tnTDetailedPictureVisualization = 'DetailedPictureVisualizations';

Type

  TDetailedPictureVisualizationLevel = packed record
    id: integer;
    DivX: integer;
    DivY: integer;
    SegmentWidth: double;
    SegmentHeight: double;
    VisibleMinScale: double;
    VisibleMaxScale: double;
  end;
  
  TDetailedPictureVisualizationLevelSegment = packed record
    id: integer;
    XIndex: integer;
    YIndex: integer;
    _DATA: TMemoryStream;
  end;

CONST
//. 8.08.05
  nmTCoVisualization = 'Co-visualization';
  idTCoVisualization = 2064;
  tnTCoVisualization = 'CoVisualizations';
//. 26.06.04
  nmTForumMessage = 'Users forum message';
  idTForumMessage = 2063;
  tnTForumMessage = 'ForumsMessages';
//. 26.06.04
  nmTForum = 'Users forum';
  idTForum = 2062;
  tnTForum = 'Forums';
//. 22.02.04
  nmTCUSTOMVisualization = 'CUSTOM-visualization';
  idTCUSTOMVisualization = 2061;
  tnTCUSTOMVisualization = 'CUSTOMVisualizations';
//. 26.01.04
  nmTOLEVisualization = 'OLE-visualization';
  idTOLEVisualization = 2059;
  tnTOLEVisualization = 'OLEVisualizations';
//. 24.01.04
  nmTHTMLVisualization = 'HTML-visualization';
  idTHTMLVisualization = 2058;
  tnTHTMLVisualization = 'HTMLVisualizations';
//. 23.01.04
  nmTBZRVisualization = 'PolyBezier-visualization';
  idTBZRVisualization = 2057;
  tnTBZRVisualization = 'BZRVisualizations';

  nmTAGIFVisualization = 'Animated-GIF-visualization';
  idTAGIFVisualization = 2056;
  tnTAGIFVisualization = 'AGIFVisualizations';

  nmTVIDEOVisualization = 'VIDEO-visualization';
  idTVIDEOVisualization = 2055;
  tnTVIDEOVisualization = 'VIDEOVisualizations';

  nmTOrientedVIDEOVisualization = 'OrientedVIDEO-visualization';
  idTOrientedVIDEOVisualization = 2054;
  tnTOrientedVIDEOVisualization = 'OrientedVIDEOVisualizations';

  nmTOPPVisualization = 'OPP-visualization';
  idTOPPVisualization = 2053;
  tnTOPPVisualization = 'OPPVisualizations';

  nmTMODELServer = 'MODEL-Server';
  idTMODELServer = 2052;
  tnTMODELServer = 'MODELServers';

  nmTCoReference = 'CoReference';
  idTCoReference = 2051;
  tnTCoReference = 'CoReferences';

  nmTPositioner = 'Positioner';
  idTPositioner = 2050;
  tnTPositioner = 'Positioners';

  nmTOrientedWMFVisualization = 'OrientedWMF-visualization';
  idTOrientedWMFVisualization = 2049;
  tnTOrientedWMFVisualization = 'OrientedWMFVisualizations';

  nmTCELLVisualization = 'CELL-visualization';
  idTCELLVisualization = 2048;
  tnTCELLVisualization = 'CELLVisualizations';

  nmTEllipseVisualization = 'Ellipse-visualization';
  idTEllipseVisualization = 2047;
  tnTEllipseVisualization = 'EllipseVisualizations';

  nmTWMFVisualization = 'WMF-visualization';
  idTWMFVisualization = 2046;
  tnTWMFVisualization = 'WMFVisualizations';

  nmTPictureVisualization = 'Picture-visualization';
  idTPictureVisualization = 2045;
  tnTPictureVisualization = 'PictureVisualizations';

  nmTRoundVisualization = 'Round-visualization';
  idTRoundVisualization = 2044;
  tnTRoundVisualization = 'RoundVisualizations';

  nmTGeodesyPoint = 'Geodesy Point';
  idTGeodesyPoint = 2043;
  tnTGeodesyPoint = 'GeodesyPoints';
Type
  TGeodesyPointStruct = packed record
    X: double;
    Y: double;
    Latitude: double;
    Longitude: double;
  end;

CONST
  nmTPrivateAreaVisualization = 'Private Area visualization';
  idTPrivateAreaVisualization = 2042;
  tnTPrivateAreaVisualization = 'PrivateAreaVisualizations';

  nmTHyperText = 'Hyper-text';
  idTHyperText = 2041;
  tnTHyperText = 'HyperTexts';

  nmTComponentsFindService = 'Objects service';
  idTComponentsFindService = 2040;
  tnTComponentsFindService = 'ComponentsFindServices';

  nmTUsersService = 'User service';
  idTUsersService = 2039;
  tnTUsersService = 'UsersServices';

  nmTTransportService = 'Transport service';
  idTTransportService = 2038;
  tnTTransportService = 'TransportServices';

  nmTMarketService = 'Goods service';
  idTMarketService = 2037;
  tnTMarketService = 'MarketServices';

  nmTTelecomService = 'Telephone service';
  idTTelecomService = 2036;
  tnTTelecomService = 'TelecomServices';

  nmTWNDVisualization = 'WND-visualization';
  idTWNDVisualization = 2035;
  tnTWNDVisualization = 'WNDVisualizations';

  nmTMRKVisualization = 'Mark-visualization';
  idTMRKVisualization = 2034;
  tnTMRKVisualization = 'MRKVisualizations';

  nmTOrientedPictureVisualization = 'OrientedPicture-visualization';
  idTOrientedPictureVisualization = 2033;
  tnTOrientedPictureVisualization = 'OrientedPictureVisualizations';

  nmTOrientedTTFVisualization = 'OrientedTTF-visualization';
  idTOrientedTTFVisualization = 2032;
  tnTOrientedTTFVisualization = 'OrientedTTFVisualizations';

CONST

  nmTIcon = 'Icon';
  idTIcon = 2031;
  tnTIcon = 'Icons';

  nmTMessageBoardMessage = 'Message-board message';
  idTMessageBoardMessage = 2030;
  tnTMessageBoardMessage = 'MessageBoardsMessages';

  nmTMessageBoard = 'User message board';
  idTMessageBoard = 2029;
  tnTMessageBoard = 'MessageBoards';

  nmTHREF = 'Hipertext reference';
  idTHREF = 2028;     
  tnTHREF = 'HREFs';

  nmTQDCVisualization = 'Quad components visualization';
  idTQDCVisualization = 2027;
  tnTQDCVisualization = 'QDCVisualizations';

  nmTOffersServer = 'Goods offers query server';
  idTOffersServer = 2026;
  tnTOffersServer = 'OffersServers';

  nmTSecurityComponentOperation = 'Security Component Operation';
  idTSecurityComponentOperation = 2025;
  tnTSecurityComponentOperation = 'SecurityComponentOperations';

  nmTSecurityKey = 'Security Key';
  idTSecurityKey = 2024;
  tnTSecurityKey = 'SecurityKeys';

  nmTSecurityFile = 'Security File';
  idTSecurityFile = 2023;
  tnTSecurityFile = 'SecurityFiles';

  nmTSecurityComponent = 'Security Component';
  idTSecurityComponent = 2022;
  tnTSecurityComponent = 'SecurityComponents';

  nmTTexture = 'Texture';
  idTTexture = 2021;
  tnTTexture = 'Textures';

  nmTBuffered3DVisualization = '3D buffered visualization';
  idTBuffered3DVisualization = 2020;
  tnTBuffered3DVisualization = 'Buffered3DVisualizations';

  nmTModelUser = 'MODEL-User';
  idTModelUser = 2019;
  tnTModelUser = 'MODELUsers';

  nmTDATAFile = 'DATA file';
  idTDATAFile = 2018;
  tnTDATAFile = 'DATAFiles';
  TDATAFile_idDBase = 2;

  nmTCoComponentTypeMarker = 'Co-type marker';
  idTCoComponentTypeMarker = 2017;
  tnTCoComponentTypeMarker = 'TypesMarkers';

  nmTCoComponentType = 'Co-type';
  idTCoComponentType = 2016;
  tnTCoComponentType = 'CoComponentsTypes';

  nmTCoComponent = 'Co-component';
  idTCoComponent = 2015;
  tnTCoComponent = 'CoComponents';

  nmTAddress = 'Address';
  idTAddress = 2014;
  tnTAddress = 'Addresses';

  nmTTransportRoute = 'Transport route';
  idTTransportRoute = 2013;
  tnTTransportRoute = 'Transport_Routes';

  nmTTransportNode = 'Transport node';
  idTTransportNode = 2012;
  tnTTransportNode = 'Transport_Nodes';

  nmTLay2DVisualization = '2D-visualization lay';
  idTLay2DVisualization = 2011; //. перенесено в GlobalSpaceDefines
  tnTLay2DVisualization = 'T2DVis_Lays';

  nmTOfferGoods = 'Offer goods';
  idTOfferGoods = 2010;
  tnTOfferGoods = 'OfferGoods';

  nmTTLFStationTMT = 'TLF table';
  idTTLFStationTMT = 2009;
  tnTTLFStationTMT = 'TLFStationTMTs';

  nmTProxyObject = 'Proxy'; //. не менять !!! (есть дубликат в Functionality unit)
  idTProxyObject = 2008;
  tnTProxyObject = 'ProxyObjects';

  nmTCollection = 'Collection';
  idTCollection = 2007;
  tnTCollection = 'Collections';

  idTMainLine = 1;
  nmTMainLine = 'Main-line';
  tnTMainLine = 'MLines';

  idTStation = 9;
  nmTStation = 'Station';
  tnTStation = 'Stations';

  idTCross = 10;
  nmTCross = 'Cross';
  tnTCross = 'Crosses';

  idTCommNode = 104;
  nmTCommNode = 'Comm node';
  tnTCommNode = 'CommNodes';
  TCommNode_ZID = 247;


  idTLabel = 107;
  nmTLabel = 'Label';
  tnTLabel = 'Labels';

  idTWell = 5;
  nmTWell = 'Well';
  tnTWell = 'Wells';

  idTTLF = 12;
  nmTTLF = 'Telephone';
  tnTTLF = 'Telephones';
Type
  TTLFType = (ttUnKnown,ttFone,ttModem,ttFax,ttTaxophone,ttRadioExpand);
  TTLFTypeIns = (ttiUnKnown,ttiMain,ttiPair);
  TTLFFunc = (tfUnknown,tfNone,tfADN,tfAutoAns,tfADNAutoAns);
  TTLFModeCall = (tmcUnKnown,tmcPulse,tmcTone);
  TTLFStatus = (tsUnKnown,tsNormal,tsCallsDenieded,tsCallsLocal);
  TTLFAdditionalServices = (tasUnKnown,tasNone,tasElLock);
  TLineDamage = (ldNone,ldUnknown,ldGND,ldBreak,ldStrayComm,ldSC,ldBreakGND,ldBreakStrayComm,ldSCGND);
Const
  sttUnknown = 'Unknown';
  sttFone = 'Telephone';
  sttModem = 'Modem';
  sttFax = 'Fax';
  sttTaxophone = 'Taxophone';
  sttRadioExpand = 'RadioTLF';

  sttiUnKnown = 'Unknown';
  sttiMain = 'Main';
  sttiPair = 'Spair';

  stfUnKnown = 'Unknown';
  stfNone = 'No';
  stfADN = 'AON';
  stfAutoAns = 'AutoAnswer';
  stfADNAutoAns = 'AON and AutoAnswer';

  stmcUnKnown = 'Unknown';
  stmcPulse = 'Pulsed';
  stmcTone = 'Tone';
  strTTLFStatus: Array[TTLFStatus] of string = (
    'Unknown','normal','Off','"8" Off'
    );
  strTTLFAdditionalServices: Array[TTLFAdditionalServices] of string = (
    'Unknown','no','el lock'
    );
Const
  idTClient = 103;
  nmTClient = 'Client';
  tnTClient = 'Clients';

  idTDistrLine = 2;
  nmTDistrLine = 'DistrLine';
  tnTDistrLine = 'DstrLines';

  idTCase = 3;
  nmTCase = 'Case';
  tnTCase = 'Cases';

  idTBox = 4;
  nmTBox = 'Box';
  tnTBox = 'Boxes';

  idTCableBox = 11;
  nmTCableBox = 'Cable box';
  tnTCableBox = 'CableBoxes';

  idTHouse = 102;
  nmTHouse = 'House';
  tnTHouse = 'Houses';

  idTStreet = 101;
  nmTStreet = 'Street';
  tnTStreet = 'Streets';

  idTOtherObj = -1;
  nmTOtherObj = 'Other object';
  tnTOtherObj = 'OtherObjs';

  idTSpan = 6;
  nmTSpan = 'Span';
  tnTSpan = 'Spans';

  idTChanel = 7;
  nmTChanel = 'Chanel';
  tnTChanel = 'Chanels';

  idTHandHold = 14;
  nmTHandHold = 'HandHold';
  tnTHandHold = 'HandHolds';

  idTLineDist = 1000001;
  nmTLineDist = 'Dist line';
  tnTLineDist = 'Distances';

  idTMuff = 8;
  nmTMuff = 'Muff';
  tnTMuff = 'Muffs';

  idTOffer = 105;
  nmTOffer = 'Offer';
  tnTOffer = 'Offers';

  idTDemand = 106;
  nmTDemand = 'Goods query';
  tnTDemand = 'Demands';

  idTObject = 1999;
  nmTObject = 'Object';
  tnTObject = 'Objects';

  nmTName = 'Name';
  idTName = 2000;
  tnTName = 'Names_';

  nmTDescription = 'Description';
  idTDescription = 2001;
  tnTDescription = 'Descriptions';

Const
  nmTImage = 'Image';
  idTImage = 2002;
  tnTImage = 'Images';

Const
  nmTCommLine = 'Comm-line';
  idTCommLine = 2003;
  tnTCommLine = 'CommLines';

  nmTVisualization = 'visualization';
  idTVisualization = 2004;
  tnTVisualization = 'Visualizations';

  nmTGoods = ' Goods ';
  idTGoods = 2005;
  tnTGoods = 'Goods';

  nmTTTFVisualization = 'TTF-visualization';
  idTTTFVisualization = 2006;
  tnTTTFVisualization = 'TTFVisualizations';

Const
//. 29.01.04
  nmTHREFVisualization = 'HREF-visualization';
  idTHREFVisualization = 2060;
  tnTHREFVisualization = tnTVisualization;

//. ---------------------------------------------------------------------------------------------

implementation
end.
