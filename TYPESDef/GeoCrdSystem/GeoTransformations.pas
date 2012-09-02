{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2011 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit GeoTransformations;
Interface
Uses
  SysUtils,
  Classes,
  Windows,
  Math,
  BigFloat,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines;


//. Datums
Type
  TEllipsoid = record
    ID: integer;
    DatumName: string;
    Ellipsoide_EquatorialRadius: Extended;
    Ellipsoid_EccentricitySquared: Extended;
  end;

Const
  EquatorLength = 40075016.685578488;
  EquatorLengthHalf = EquatorLength/2.0;
  //. well-known Datums definition
  DatumsCount = 24;
  Datums: array[0..DatumsCount-1] of TEllipsoid = (
    (ID: -1;    DatumName: 'Placeholder';           Ellipsoide_EquatorialRadius: 0;            Ellipsoid_EccentricitySquared: 0), //. to allow array indices to match id numbers
    (ID: 1;     DatumName: 'Airy';                  Ellipsoide_EquatorialRadius: 6377563.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 2;     DatumName: 'Australian National';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 3;     DatumName: 'Bessel 1841';           Ellipsoide_EquatorialRadius: 6377397.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 4;     DatumName: 'Bessel 1841 (Nambia)';  Ellipsoide_EquatorialRadius: 6377484.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 5;     DatumName: 'Clarke 1866';           Ellipsoide_EquatorialRadius: 6378206.0;    Ellipsoid_EccentricitySquared: 0.006768658),
    (ID: 6;     DatumName: 'Clarke 1880';           Ellipsoide_EquatorialRadius: 6378249.0;    Ellipsoid_EccentricitySquared: 0.006803511),
    (ID: 7;     DatumName: 'Everest';               Ellipsoide_EquatorialRadius: 6377276.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 8;     DatumName: 'Fischer 1960 (Mercury)';Ellipsoide_EquatorialRadius: 6378166.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 9;     DatumName: 'Fischer 1968';          Ellipsoide_EquatorialRadius: 6378150.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 10;    DatumName: 'GRS-1967';              Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694605),
    (ID: 11;    DatumName: 'GRS-1980';              Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438),
    (ID: 12;    DatumName: 'Helmert 1906';          Ellipsoide_EquatorialRadius: 6378200.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 13;    DatumName: 'Hough';                 Ellipsoide_EquatorialRadius: 6378270.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 14;    DatumName: 'International';         Ellipsoide_EquatorialRadius: 6378388.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 15;    DatumName: 'SK-42';                 Ellipsoide_EquatorialRadius: 6378245.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 16;    DatumName: 'Modified Airy';         Ellipsoide_EquatorialRadius: 6377340.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 17;    DatumName: 'Modified Everest';      Ellipsoide_EquatorialRadius: 6377304.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 18;    DatumName: 'Modified Fischer 1960'; Ellipsoide_EquatorialRadius: 6378155.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 19;    DatumName: 'South American 1969';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 20;    DatumName: 'WGS-60';                Ellipsoide_EquatorialRadius: 6378165.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 21;    DatumName: 'WGS-66';                Ellipsoide_EquatorialRadius: 6378145.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 22;    DatumName: 'WGS-72';                Ellipsoide_EquatorialRadius: 6378135.0;    Ellipsoid_EccentricitySquared: 0.006694318),
    (ID: 23;    DatumName: 'WGS-84';                Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438)
  );

  function Datums_GetItemByName(const pName: string): integer;

Type
  TGeoDatumConverter = class
  private
    class function dB(const Bd, Ld, H: Extended): Extended;
    class function dL(const Bd, Ld, H: Extended): Extended;
    class procedure WGS84ToPulkovo42(const wgsLat,wgsLong,wgsAlt: Extended; out pulkovoLat,pulkovoLong,pulkovoAlt: Extended);
    class procedure Pulkovo42ToWGS84(const pulkovoLat,pulkovoLong,pulkovoAlt: Extended; out wgsLat,wgsLong,wgsAlt: Extended);
  public
    class procedure Datum_ConvertCoordinatesToAnotherDatum(const DatumID: integer; const pLat,pLong,pAlt: Extended; const ADatumID: integer;  out oLat,oLong,oAlt: Extended);
  end;


//. Projections
Type
  TProjectionID = (pidUnknown, pidLatLong, pidTM, pidUTM, pidLCC, pidEQC, pidMEP{Mercator on Ellipsoide}, pidMSP{Mercator on sphere});

  TProjection = record
    Name: string;
    ID: TProjectionID;
  end;

Const
  ProjectionsCount = 7;
  Projections: array[0..ProjectionsCount-1] of TProjection = (
    (Name: 'LatLong';                   ID: pidLatLong),
    (Name: 'TM';                        ID: pidTM),
    (Name: 'UTM';                       ID: pidUTM),
    (Name: 'LCC';                       ID: pidLCC),
    (Name: 'EQC';                       ID: pidEQC),
    (Name: 'MEP';                       ID: pidMEP),
    (Name: 'MSP';                       ID: pidMSP)
  );

  function Projections_GetItemByName(const pName: string): TProjectionID;
  function Projections_GetItemByID(const pID: TProjectionID): string;

//. Projection DATAs
type
  TTMProjectionDATA = class(TMemoryStream)
  public
    LatitudeOrigin: Extended;
    CentralMeridian: Extended;
    ScaleFactor: Extended;
    FalseEasting: Extended;
    FalseNorthing: Extended;

    Constructor Create(const AStream: TStream = nil);
    destructor Destroy; override;
    procedure GetDefaultProperties;
    procedure GetProperties;
    procedure SetProperties;
  end;

  TLCCProjectionDATA = class(TMemoryStream)
  public
    LatOfOrigin: Extended;
    LongOfOrigin: Extended;
    FirstStdParallel: Extended;
    SecondStdParallel: Extended;
    FalseEasting: Extended;
    FalseNorthing: Extended;

    Constructor Create(const AStream: TStream = nil);
    destructor Destroy; override;
    procedure GetDefaultProperties;
    procedure GetProperties;
    procedure SetProperties;
  end;

  TEQCProjectionDATA = class(TMemoryStream)
  public
    LatOfOrigin: Extended;
    LongOfOrigin: Extended;
    FirstStdParallel: Extended;
    SecondStdParallel: Extended;
    FalseEasting: Extended;
    FalseNorthing: Extended;

    Constructor Create(const AStream: TStream = nil);
    destructor Destroy; override;
    procedure GetDefaultProperties;
    procedure GetProperties;
    procedure SetProperties;
  end;

  TMPProjectionDATA = class(TMemoryStream)
  public
    LatOfOrigin: Extended;
    LongOfOrigin: Extended;

    Constructor Create(const AStream: TStream = nil);
    destructor Destroy; override;
    procedure GetDefaultProperties;
    procedure GetProperties;
    procedure SetProperties;
  end;

//. Projections transformations
Type
  TMeridianDistanceData = record
    nb: integer;
    es: Extended;
    E: Extended;
    b: array of Extended;
  end;

  TUTMZone = string[30];

Const
  MeridianDistance_IterationsCount = 20;
  //.
  GEOCODER_YANDEXMAPS = 1;
  GEOCODER_GOOGLEMAPS = 2;
  
Type
  TGeoCrdConverter = class
  private
    MeridianDistanceData: TMeridianDistanceData;
    MeridianDistanceData_flInitialized: boolean;

    procedure MeridianDistance_InitData;
    function MeridianDistance_Calculate(const phi: Extended; const sinphi: Extended; const cosphi: Extended): Extended;
    function MeridianDistance_CalculateInverse(const Dist: Extended): Extended;
    //.
    function UTMLetterDesignator(const Lat: Extended): Char;
  public
    DatumID: integer;

    Constructor Create(const pDatumID: integer);
    function GetDistance(const StartLat,StartLong: Extended; const EndLat,EndLong: Extended): Extended;
    //. GeoCoder converter (Yandex.Maps,Google.Maps)
    procedure GeoCoder_LatLongToNearestObjects(const GeoCoderID: integer; const Lat,Long: Extended; out ObjectsNames: string);
    //. TM transformations
    procedure LatLongToTM(const Lat,Long: Extended; const Scale: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended; out Zone: TUTMZone);
    procedure TMToLatLong(const Easting,Northing: Extended; const Zone: TUTMZone; const Scale: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
    //. UTM transformations
    procedure LatLongToUTM(const Lat,Long: Extended; out Easting,Northing: Extended; out Zone: TUTMZone);
    procedure UTMToLatLong(const Easting,Northing: Extended; const Zone: TUTMZone; out Lat,Long: Extended);
    //. LCC transformations (LambertConicConformal)
    procedure LatLongToLCC(const Lat,Long: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended);
    procedure LCCToLatLong(const Easting,Northing: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
    //. EQC transformations (EquidistantConic)
    procedure LatLongToEQC(const Lat,Long: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended);
    procedure EQCToLatLong(const Easting,Northing: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
    //. MP transformations (Mercator on ellipsoide)
    procedure LatLongToMP(const Lat,Long: Extended; out Easting,Northing: Extended);
    procedure MPToLatLong(const Easting,Northing: Extended; out Lat,Long: Extended);
    //. MP transformations (Mercator on sphere)
    procedure LatLongToSphereMP(const Lat,Long: Extended; out Easting,Northing: Extended);
    procedure SphereMPToLatLong(const Easting,Northing: Extended; out Lat,Long: Extended);
  end;

const
  UTMLetters_Count = 20;
  UTMLetters: array[0..UTMLetters_Count-1] of char = (
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    'M',
    'N',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X'
  );

  function UTMLetters_LetterToNumber(const Letter: char): integer;


Type
    TMapInfo = class
    private
      N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
      Divider: integer;
      SegmentSize: Extended;
      Size: Extended;

      class function GetMapInfo(const idTVisualization: integer; const idVisualization: integer): TMapInfo;

      procedure ConvertPixPosToXY(const PixX,PixY: Extended; out X,Y: Extended); virtual; abstract;
      procedure ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended); virtual; abstract;
    end;

    TDPVMapInfo = class(TMapInfo)
    private
      idDetailedPicture: integer;

      Constructor Create(const pidDetailedPicture: integer);
      procedure ConvertPixPosToXY(const PixX,PixY: Extended; out X,Y: Extended); override;
      procedure ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended); override;
    end;

    TTSVMapInfo = class(TMapInfo)
    private
      idTileServerVisualization: integer;

      Constructor Create(const pidTileServerVisualization: integer);
      procedure ConvertPixPosToXY(const PixX,PixY: Extended; out X,Y: Extended); override;
      procedure ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended); override;
    end;

    TViewTransformatorControlPoint = record
      E,N: Extended;
      X,Y: Extended;
    end;

    TViewTransformatorControlPoints = array of TViewTransformatorControlPoint;

    TViewTransformatorAlgorithm = (vtaNone,vtaLinear,vtaPolynom1,vtaPolynom2,vtaPolynom3,vtaPolynom1RMS,vtaPolynom2RMS,vtaPolynom3RMS,vtaPolynom1RMSPrecise,vtaPolynom2RMSPrecise,vtaPolynom3RMSPrecise);

    TViewTransformatorParams = record
      Algorithm: TViewTransformatorAlgorithm;
      X: array of Extended;
      Y: array of Extended;
      E: array of Extended;
      N: array of Extended;
      Precise_X: array of TBigFloat;
      Precise_Y: array of TBigFloat;
      Precise_E: array of TBigFloat;
      Precise_N: array of TBigFloat;
    end;

    TViewTransformator = class
    private
      ControlPoints: TViewTransformatorControlPoints;
      Params: TViewTransformatorParams;

      Constructor Create(const pControlPoints: TViewTransformatorControlPoints);
      function IsControlPointsTheSame(const pControlPoints: TViewTransformatorControlPoints): boolean;
      procedure SetControlPoints(const pControlPoints: TViewTransformatorControlPoints);
      procedure Linear_UpdateParams();
      procedure Linear_Transform(const E,N: Extended; out X,Y: Extended); 
      procedure Linear_InverseTransform(const X,Y: Extended; out E,N: Extended); 
      procedure Polynom1_UpdateParams();
      procedure Polynom1_Transform(const E,N: Extended; out X,Y: Extended); //. affine transformation
      procedure Polynom1_InverseTransform(const X,Y: Extended; out E,N: Extended); //. affine transformation
      procedure Polynom2_UpdateParams();
      procedure Polynom2_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom2_InverseTransform(const X,Y: Extended; out E,N: Extended);
      procedure Polynom3_UpdateParams();
      procedure Polynom3_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom3_InverseTransform(const X,Y: Extended; out E,N: Extended);
      procedure Polynom1RMS_UpdateParams();
      procedure Polynom1RMS_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom1RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
      procedure Polynom2RMS_UpdateParams();
      procedure Polynom2RMS_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom2RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
      procedure Polynom3RMS_UpdateParams();
      procedure Polynom3RMS_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom3RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
      procedure Polynom3RMS_InverseTransformWithCorrection(X,Y: Extended; out E,N: Extended);
      procedure Polynom3RMSPrecise_UpdateParams();
      procedure Polynom3RMSPrecise_Transform(const E,N: Extended; out X,Y: Extended);
      procedure Polynom3RMSPrecise_InverseTransform(const X,Y: Extended; out E,N: Extended);
    end;

    TCrdSysConvertor = class
    private
      Space: TProxySpace;
      MapInfo: TMapInfo;
      ViewTransformator: TViewTransformator;

      procedure RotateByAngleFrom0(var X,Y: Extended; const Angle: Extended);
    public
      idCrdSys: integer;
      flLinearApproximationCrdSys: boolean;
      DatumID: integer;
      ProjectionID: TProjectionID;
      ProjectionDATA: TMemoryStream;

      PointsCount: integer;
      GeoToXY_Points: TByteArray;
      GeoToXY_Points_Lat: Extended;
      GeoToXY_Points_Long: Extended;
      XYToGeo_Points: TByteArray;
      XYToGeo_Points_X: Extended;
      XYToGeo_Points_Y: Extended;

      Constructor Create(const pSpace: TProxySpace; const pidCrdSys: integer; const pPointsCount: integer = 2);
      Destructor Destroy; override;
      function ConvertGeoToXY(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
      function ConvertXYToGeo(const X,Y: Extended; out Lat,Long: Extended): boolean;
      function GeoToXY_LoadPoints(const pLat,pLong: double): boolean;
      function XYToGeo_LoadPoints(const pX,pY: double): boolean;
      function LinearApproximationCrdSys_XYIsOutOfApproximationZone(const pX,pY: Extended): boolean;
      function LinearApproximationCrdSys_LLIsOutOfApproximationZone(const pLat,pLong: Extended): boolean;
      function GetDistance(const StartLat,StartLong: Extended; const EndLat,EndLong: Extended): Extended;
    end;


Implementation
Uses
  ActiveX,
  MSXML,
  //. Matrix routines
  Ap,
  Inv,
  mulmatrix,
  //. Matrix routines with high precision
  precise_ap,
  precise_inv,
  precise_mulmatrix,
  //.
  IdHTTP,
  //.
  TypesFunctionality;


{Datums}
function Datums_GetItemByName(const pName: string): integer;
var
  I: integer;
begin
Result:=-1;
for I:=0 to DatumsCount-1 do
  if (ANSIUpperCase(Datums[I].DatumName) = ANSIUpperCase(pName))
   then begin
    Result:=Datums[I].ID;
    Exit; //. ->
    end;
end;


{TGeoDatumConverter}
Const
  ro = 206264.8062; //. number angle seconds in radian
  Pulkovo42WGS84_dx = 23.92;
  Pulkovo42WGS84_dy = -141.27;
  Pulkovo42WGS84_dz = -80.9;
  Pulkovo42WGS84_wx = 0;
  Pulkovo42WGS84_wy = 0;
  Pulkovo42WGS84_wz = 0;
  Pulkovo42WGS84_ms = 0;

{mr. Molodensky datum transformations}
class function TGeoDatumConverter.dB(const Bd, Ld, H: Extended): Extended;
var
  aP,e2P: Extended;
  aW,e2W: Extended;
  a,e2,da,de2: Extended;
  B, L, M, N: Extended;
begin
aP:=Datums[15].Ellipsoide_EquatorialRadius; //. Krassovsky
e2P:=Datums[15].Ellipsoid_EccentricitySquared;
aW:=Datums[23].Ellipsoide_EquatorialRadius; //. WGS-84
e2W:=Datums[23].Ellipsoid_EccentricitySquared;
//.
a:=(aP+aW)/2.0;
e2:=(e2P+e2W)/2.0;
da:=(aW-aP);
de2:=(e2W-e2P);
//.
B:=Bd*PI/180.0;
L:=Ld*PI/180.0;
M:=a*(1-e2)/Power((1-e2*Sqr(Sin(B))),1.5);
N:=a*Power((1-e2*Sqr(Sin(B))),-0.5);
Result:=ro/(M+H)*(N/a*e2*Sin(B)*Cos(B)*da+(Sqr(N)/Sqr(a)+1)*N*Sin(B)*Cos(B)*de2/2.0-(Pulkovo42WGS84_dx*Cos(L)+Pulkovo42WGS84_dy*Sin(L))*Sin(B)+Pulkovo42WGS84_dz*Cos(B))-Pulkovo42WGS84_wx*Sin(L)*(1.0+e2*Cos(2*B))+Pulkovo42WGS84_wy*Cos(L)*(1+e2*Cos(2*B))-ro*Pulkovo42WGS84_ms*e2*Sin(B)*Cos(B);
end;

class function TGeoDatumConverter.dL(const Bd, Ld, H: Extended): Extended;
var
  aP,e2P: Extended;
  aW,e2W: Extended;
  a,e2,da,de2: Extended;
  B,L,M,N: Extended;
begin
aP:=Datums[15].Ellipsoide_EquatorialRadius; //. Krassovsky
e2P:=Datums[15].Ellipsoid_EccentricitySquared;
aW:=Datums[23].Ellipsoide_EquatorialRadius; //. WGS-84
e2W:=Datums[23].Ellipsoid_EccentricitySquared;
//.
a:=(aP+aW)/2.0;
e2:=(e2P+e2W)/2.0;
da:=(aW-aP);
de2:=(e2W-e2P);
//.
B:=Bd*PI/180.0;
L:=Ld*PI/180.0;
N:=a*Power((1.0-e2*Sqr(Sin(B))),-0.5);
Result:=ro/((N+H)*Cos(B))*(-Pulkovo42WGS84_dx*Sin(L)+Pulkovo42WGS84_dy*Cos(L))+ Tan(B)*(1.0-e2)*(Pulkovo42WGS84_wx*Cos(L)+Pulkovo42WGS84_wy*Sin(L))-Pulkovo42WGS84_wz;
end;

class procedure TGeoDatumConverter.WGS84ToPulkovo42(const wgsLat,wgsLong,wgsAlt: Extended; out pulkovoLat,pulkovoLong,pulkovoAlt: Extended);
var
  aP,e2P: Extended;
  aW,e2W: Extended;
  a,e2,da,de2: Extended;
  B,L,N,dH: Extended;
begin
pulkovoLat:=wgsLat-dB(wgsLat,wgsLong,wgsAlt)/3600.0;
pulkovoLong:=wgsLong-dL(wgsLat,wgsLong,wgsAlt)/3600.0;
//. converting altitude
aP:=Datums[15].Ellipsoide_EquatorialRadius; //. Krassovsky
e2P:=Datums[15].Ellipsoid_EccentricitySquared;
aW:=Datums[23].Ellipsoide_EquatorialRadius; //. WGS-84
e2W:=Datums[23].Ellipsoid_EccentricitySquared;
//.
a:=(aP+aW)/2.0;
e2:=(e2P+e2W)/2.0;
da:=(aW-aP);
de2:=(e2W-e2P);
//.
B:=wgsLat*PI/180.0;
L:=wgsLong*PI/180.0;
N:=a*Power((1-e2*Sqr(Sin(B))),-0.5);
dH:=-a/N*da+N*Sqr(Sin(B))*de2/2.0+(Pulkovo42WGS84_dx*Cos(L)+Pulkovo42WGS84_dy*Sin(L))*Cos(B)+Pulkovo42WGS84_dz*Sin(B)-N*e2*Sin(B)*Cos(B)*(Pulkovo42WGS84_wx/ro*Sin(L)-Pulkovo42WGS84_wy/ro*Cos(L))+(Sqr(a)/N+wgsAlt)*Pulkovo42WGS84_ms;
pulkovoAlt:=wgsAlt-dH;
end;

class procedure TGeoDatumConverter.Pulkovo42ToWGS84(const pulkovoLat,pulkovoLong,pulkovoAlt: Extended; out wgsLat,wgsLong,wgsAlt: Extended);
var
  aP,e2P: Extended;
  aW,e2W: Extended;
  a,e2,da,de2: Extended;
  B,L,N,dH: Extended;
begin
wgsLat:=pulkovoLat+dB(pulkovoLat,pulkovoLong,pulkovoAlt)/3600.0;
wgsLong:=pulkovoLong+dL(pulkovoLat,pulkovoLong,pulkovoAlt)/3600.0;
//. converting altitude
aP:=Datums[15].Ellipsoide_EquatorialRadius; //. Krassovsky
e2P:=Datums[15].Ellipsoid_EccentricitySquared;
aW:=Datums[23].Ellipsoide_EquatorialRadius; //. WGS-84
e2W:=Datums[23].Ellipsoid_EccentricitySquared;
//.
a:=(aP+aW)/2.0;
e2:=(e2P+e2W)/2.0;
da:=(aW-aP);
de2:=(e2W-e2P);
//.
B:=pulkovoLat*PI/180.0;
L:=pulkovoLong*PI/180.0;
N:=a*Power((1-e2*Sqr(Sin(B))),-0.5);
dH:=-a/N*da+N*Sqr(Sin(B))*de2/2.0+(Pulkovo42WGS84_dx*Cos(L)+Pulkovo42WGS84_dy*Sin(L))*Cos(B)+Pulkovo42WGS84_dz*Sin(B)-N*e2*Sin(B)*Cos(B)*(Pulkovo42WGS84_wx/ro*Sin(L)-Pulkovo42WGS84_wy/ro*Cos(L))+(Sqr(a)/N+pulkovoAlt)*Pulkovo42WGS84_ms;
wgsAlt:=pulkovoAlt+dH;
end;

class procedure TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(const DatumID: integer; const pLat,pLong,pAlt: Extended; const ADatumID: integer;  out oLat,oLong,oAlt: Extended);
var
  _Lat,_Long,_Alt: Extended;
begin
case DatumID of
15: {Pulkovo-42}
  case ADatumID of
  15: {Pulkovo-42} begin //. just return incoming params
    oLat:=pLat;
    oLong:=pLong;
    oAlt:=pAlt;
    end;
  23: {WGS-84} begin
    Pulkovo42ToWGS84(pLat,pLong,pAlt, _Lat,_Long,_Alt);
    oLat:=_Lat;
    oLong:=_Long;
    oAlt:=_Alt;
    end;
  else
    Raise Exception.Create('unsupported datum conversion'); //. =>
  end;
23: {WGS-84}
  case ADatumID of
  23: {WGS-84} begin //. just return incoming params
    oLat:=pLat;
    oLong:=pLong;
    oAlt:=pAlt;
    end;
  15: {Pulkovo-42} begin
    WGS84ToPulkovo42(pLat,pLong,pAlt, _Lat,_Long,_Alt);
    oLat:=_Lat;
    oLong:=_Long;
    oAlt:=_Alt;
    end;
  else
    Raise Exception.Create('unsupported datum conversion'); //. =>
  end;
else
  Raise Exception.Create('unsupported datum conversion'); //. =>
end;
end;


{Projections}
function Projections_GetItemByName(const pName: string): TProjectionID;
var
  I: integer;
begin
Result:=pidUnknown;
for I:=0 to ProjectionsCount-1 do
  if (ANSIUpperCase(Projections[I].Name) = ANSIUpperCase(pName))
   then begin
    Result:=Projections[I].ID;
    Exit; //. ->
    end;
end;

function Projections_GetItemByID(const pID: TProjectionID): string;
var
  I: integer;
begin
Result:='';
for I:=0 to ProjectionsCount-1 do
  if (Projections[I].ID = pID)
   then begin
    Result:=Projections[I].Name;
    Exit; //. ->
    end;
end;

//. Projection DATAs

{TTMProjectionDATA}
Constructor TTMProjectionDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
//.
GetDefaultProperties();
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties();
  end;
end;

destructor TTMProjectionDATA.Destroy;
begin
Inherited;
end;

procedure TTMProjectionDATA.GetDefaultProperties;
begin
LatitudeOrigin:=0.0;
CentralMeridian:=0.0;
ScaleFactor:=1.0;
FalseEasting:=500000.0;
FalseNorthing:=0.0;
end;

procedure TTMProjectionDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ParamsNode: IXMLDOMNode;
  Node: IXMLDOMNode;
begin
GetDefaultProperties();
if (Size > 0)
 then begin
  Self.Position:=0;
  OLEStream:=TStreamAdapter.Create(Self);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  ParamsNode:=RootNode.selectSingleNode('Parameters');
  Node:=ParamsNode.selectSingleNode('LatitudeOrigin');
  if (Node <> nil) then LatitudeOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('CentralMeridian');
  if (Node <> nil) then CentralMeridian:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('ScaleFactor');
  if (Node <> nil) then ScaleFactor:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseEasting');
  if (Node <> nil) then FalseEasting:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseNorthing');
  if (Node <> nil) then FalseNorthing:=Node.nodeTypedValue;
  end;
end;

procedure TTMProjectionDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ParamsNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
ParamsNode:=Doc.createElement('Parameters');
Node:=Doc.createElement('LatitudeOrigin');
Node.nodeTypedValue:=LatitudeOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('CentralMeridian');
Node.nodeTypedValue:=CentralMeridian;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('ScaleFactor');
Node.nodeTypedValue:=ScaleFactor;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseEasting');
Node.nodeTypedValue:=FalseEasting;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseNorthing');
Node.nodeTypedValue:=FalseNorthing;
ParamsNode.appendChild(Node);
Root.appendChild(ParamsNode);
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


{TLCCProjectionDATA}
Constructor TLCCProjectionDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
//.
GetDefaultProperties();
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties();
  end;
end;

destructor TLCCProjectionDATA.Destroy;
begin
Inherited;
end;

procedure TLCCProjectionDATA.GetDefaultProperties;
begin
LatOfOrigin:=0.0;
LongOfOrigin:=0.0;
FirstStdParallel:=0.0;
SecondStdParallel:=0.0;
FalseEasting:=0.0;
FalseNorthing:=0.0;
end;

procedure TLCCProjectionDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ParamsNode: IXMLDOMNode;
  Node: IXMLDOMNode;
begin
GetDefaultProperties();
if (Size > 0)
 then begin
  Self.Position:=0;
  OLEStream:=TStreamAdapter.Create(Self);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  ParamsNode:=RootNode.selectSingleNode('Parameters');
  Node:=ParamsNode.selectSingleNode('LatOfOrigin');
  if (Node <> nil) then LatOfOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('LongOfOrigin');
  if (Node <> nil) then LongOfOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FirstStdParallel');
  if (Node <> nil) then FirstStdParallel:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('SecondStdParallel');
  if (Node <> nil) then SecondStdParallel:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseEasting');
  if (Node <> nil) then FalseEasting:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseNorthing');
  if (Node <> nil) then FalseNorthing:=Node.nodeTypedValue;
  end;
end;

procedure TLCCProjectionDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ParamsNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
ParamsNode:=Doc.createElement('Parameters');
Node:=Doc.createElement('LatOfOrigin');
Node.nodeTypedValue:=LatOfOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('LongOfOrigin');
Node.nodeTypedValue:=LongOfOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FirstStdParallel');
Node.nodeTypedValue:=FirstStdParallel;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('SecondStdParallel');
Node.nodeTypedValue:=SecondStdParallel;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseEasting');
Node.nodeTypedValue:=FalseEasting;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseNorthing');
Node.nodeTypedValue:=FalseNorthing;
ParamsNode.appendChild(Node);
Root.appendChild(ParamsNode);
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


{TEQCProjectionDATA}
Constructor TEQCProjectionDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
//.
GetDefaultProperties();
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties();
  end;
end;

destructor TEQCProjectionDATA.Destroy;
begin
Inherited;
end;

procedure TEQCProjectionDATA.GetDefaultProperties;
begin
LatOfOrigin:=0.0;
LongOfOrigin:=0.0;
FirstStdParallel:=0.0;
SecondStdParallel:=0.0;
FalseEasting:=0.0;
FalseNorthing:=0.0;
end;

procedure TEQCProjectionDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ParamsNode: IXMLDOMNode;
  Node: IXMLDOMNode;
begin
GetDefaultProperties();
if (Size > 0)
 then begin
  Self.Position:=0;
  OLEStream:=TStreamAdapter.Create(Self);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  ParamsNode:=RootNode.selectSingleNode('Parameters');
  Node:=ParamsNode.selectSingleNode('LatOfOrigin');
  if (Node <> nil) then LatOfOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('LongOfOrigin');
  if (Node <> nil) then LongOfOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FirstStdParallel');
  if (Node <> nil) then FirstStdParallel:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('SecondStdParallel');
  if (Node <> nil) then SecondStdParallel:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseEasting');
  if (Node <> nil) then FalseEasting:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('FalseNorthing');
  if (Node <> nil) then FalseNorthing:=Node.nodeTypedValue;
  end;
end;

procedure TEQCProjectionDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ParamsNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
ParamsNode:=Doc.createElement('Parameters');
Node:=Doc.createElement('LatOfOrigin');
Node.nodeTypedValue:=LatOfOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('LongOfOrigin');
Node.nodeTypedValue:=LongOfOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FirstStdParallel');
Node.nodeTypedValue:=FirstStdParallel;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('SecondStdParallel');
Node.nodeTypedValue:=SecondStdParallel;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseEasting');
Node.nodeTypedValue:=FalseEasting;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('FalseNorthing');
Node.nodeTypedValue:=FalseNorthing;
ParamsNode.appendChild(Node);
Root.appendChild(ParamsNode);
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


{TMPProjectionDATA}
Constructor TMPProjectionDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
//.
GetDefaultProperties();
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties();
  end;
end;

destructor TMPProjectionDATA.Destroy;
begin
Inherited;
end;

procedure TMPProjectionDATA.GetDefaultProperties;
begin
LatOfOrigin:=0.0;
LongOfOrigin:=0.0;
end;

procedure TMPProjectionDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ParamsNode: IXMLDOMNode;
  Node: IXMLDOMNode;
begin
GetDefaultProperties();
if (Size > 0)
 then begin
  Self.Position:=0;
  OLEStream:=TStreamAdapter.Create(Self);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  ParamsNode:=RootNode.selectSingleNode('Parameters');
  Node:=ParamsNode.selectSingleNode('LatOfOrigin');
  if (Node <> nil) then LatOfOrigin:=Node.nodeTypedValue;
  Node:=ParamsNode.selectSingleNode('LongOfOrigin');
  if (Node <> nil) then LongOfOrigin:=Node.nodeTypedValue;
  end;
end;

procedure TMPProjectionDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ParamsNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
ParamsNode:=Doc.createElement('Parameters');
Node:=Doc.createElement('LatOfOrigin');
Node.nodeTypedValue:=LatOfOrigin;
ParamsNode.appendChild(Node);
Node:=Doc.createElement('LongOfOrigin');
Node.nodeTypedValue:=LongOfOrigin;
ParamsNode.appendChild(Node);
Root.appendChild(ParamsNode);
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


{UTMLetters}
function UTMLetters_LetterToNumber(const Letter: char): integer;
var
  I: integer;
begin
Result:=-1;
for I:=0 to UTMLetters_Count-1 do
  if (UTMLetters[I] = Letter)
   then begin
    Result:=I;
    Exit; //. ->
    end;
end;

{TMZoneNumber}
function TMZoneNumber(Zone: string): integer;
begin
SetLength(Zone,Length(Zone)-1);
StrToInt(Zone);
end;

Const
  FOURTHPI  = PI/4.0;
  deg2rad = PI/180.0;
  rad2deg = 180.0/PI;

{TGeoCrdConverter}
Constructor TGeoCrdConverter.Create(const pDatumID: integer);
begin
Inherited Create;
DatumID:=pDatumID;
MeridianDistanceData_flInitialized:=false;
end;

procedure TGeoCrdConverter.MeridianDistance_InitData;
var
  numf, numfi, twon1, denf, denfi, ens, T, twon: Extended;
  den, El, Es: Extended;
  E: array of Extended;
  I,IC: integer;
begin
SetLength(E,MeridianDistance_IterationsCount);
//. generate E(e^2) and its terms E[]
ens:=Datums[DatumID].Ellipsoid_EccentricitySquared;
numf:=1.0;
twon1:=1.0;
denfi:=1.0;
denf:=1.0;
twon:=4.0;
Es:=1.0;
El:=1.0;
E[0]:=1.0;
IC:=0;
for I:=1 to MeridianDistance_IterationsCount-1 do begin
  numf:=numf*(twon1*twon1);
  den:=twon*denf*denf*twon1;
  T:=numf/den;
  E[I]:=T*ens;
  Es:=Es-E[I];
  ens:=ens*Datums[DatumID].Ellipsoid_EccentricitySquared;
  twon:=twon*4.0;
  denfi:=denfi+2.0;
  denf:=denf*denfi;
  twon1:=twon1+2.0;
  Inc(IC);
  //.
  if (Es = El) {jump out if no change} then Break; //. >
  //.
  El:=Es;
  end;
SetLength(MeridianDistanceData.b,MeridianDistance_IterationsCount);
MeridianDistanceData.nb:=IC-1;
MeridianDistanceData.es:=Datums[DatumID].Ellipsoid_EccentricitySquared;
MeridianDistanceData.E:=Es;
//. generate b_n coefficients--note: collapse with prefix ratios
Es:=1.0-Es; 
MeridianDistanceData.b[0]:=Es;
denf:=1.0;
numf:=1.0;
numfi:=2.0;
denfi:=3.0;
for I:=1 to MeridianDistance_IterationsCount-1 do begin
  Es:=Es-E[I];
  numf:=numf*numfi;
  denf:=denf*denfi;
  MeridianDistanceData.b[I]:=Es*numf/denf;
  numfi:=numfi+2.0;
  denfi:=denfi+2.0;
  end;
//.
MeridianDistanceData_flInitialized:=true;
end;

function TGeoCrdConverter.MeridianDistance_Calculate(const phi: Extended; const sinphi: Extended; const cosphi: Extended): Extended;
var
  sc, sum, sphi2, D: Extended;
  I: integer;
begin
if (NOT MeridianDistanceData_flInitialized) then MeridianDistance_InitData();
sc:=sinphi*cosphi;
sphi2:=sinphi*sinphi;
D:=phi*MeridianDistanceData.E-MeridianDistanceData.es*sc/Sqrt(1.0-MeridianDistanceData.es*sphi2);
I:=MeridianDistanceData.nb;
sum:=MeridianDistanceData.b[I];
while (I > 0) do begin
  Dec(I);
  sum:=MeridianDistanceData.b[I]+sphi2*sum;
  end;
Result:=(D+sc*sum);
end;

function TGeoCrdConverter.MeridianDistance_CalculateInverse(const Dist: Extended): Extended;
const
  TOL = 1e-14;
var
  s, t, phi, k: Extended;
  I: integer;
begin
if (NOT MeridianDistanceData_flInitialized) then MeridianDistance_InitData();
k:=1.0/(1.0-MeridianDistanceData.es);
phi:=dist;
for I:=MeridianDistance_IterationsCount-1 downto 0 do begin
  s:=Sin(phi);
  t:=1.0-MeridianDistanceData.es*s*s;
  t:=(MeridianDistance_Calculate(phi,s,cos(phi))-Dist)*(t*Sqrt(t))*k;
  phi:=phi-t;
  if (Abs(t) < TOL) {that is no change}
  then begin
   Result:=phi;
   Exit; //. ->
   end;
  end;
//. convergence failed 
Result:=phi;
end;

function TGeoCrdConverter.GetDistance(const StartLat,StartLong: Extended; const EndLat,EndLong: Extended): Extended;
var
  // Переменные, используемые для вычисления смещения и расстояния
  a: Extended; // Основные полуоси эллипсоида
  eccSquared: Extended; // квадрат эксцентриситета эллипсоида
  e2: Extended; // Квадрат эксцентричности эллипсоида
  fPhimean: Extended; // Средняя широта
  fdLambda: Extended; // Разница между двумя значениями долготы
  fdPhi: Extended; // Разница между двумя значениями широты
  fAlpha: Extended; // Смещение
  fRho: Extended; // Меридианский радиус кривизны
  fNu: Extended; // Поперечный радиус кривизны
  fR: Extended; // Радиус сферы Земли
  fz: Extended; // Угловое расстояние от центра сфероида
  fTemp: Extended; // Временная переменная, использующаяся в вычислениях
  Distance: Extended; // Вычисленное расстояния в метрах
  Bearing: Extended; // Вычисленное от и до смещение
const
  // Константы, используемые для вычисления смещения и расстояния
  D2R: Extended = PI/180.0; // Константа для преобразования градусов в радианы
  R2D: Extended = 180.0/PI; // Константа для преобразования радиан в градусы
begin
if (IsNAN(StartLat) OR IsNAN(StartLong) OR IsNAN(EndLat) OR IsNAN(EndLong))
 then begin
  Result:=NAN;
  Exit; //. ->
  end;
//.
a:=Datums[DatumID].Ellipsoide_EquatorialRadius;
eccSquared:=Datums[DatumID].Ellipsoid_EccentricitySquared;
e2:=(eccSquared)/(1.0-eccSquared);
// Вычисляем разницу между двумя долготами и широтами и получаем среднюю широту
fdLambda := (StartLong - EndLong) * D2R;
fdPhi := (StartLat - EndLat) * D2R;
if ((fdLambda = 0.0) AND (fdPhi = 0.0))
 then begin
  Result:=0.0;
  Exit; //. ->
  end;
fPhimean := ((StartLat + EndLat) / 2.0) * D2R;
// Вычисляем меридианные и поперечные радиусы кривизны средней широты
fTemp := 1 - e2 * (Power(Sin(fPhimean), 2));
fRho := (a * (1 - e2)) / Power(fTemp, 1.5);
fNu := a / (Sqrt(1 - e2 * (Sin(fPhimean) * Sin(fPhimean))));
// Вычисляем угловое расстояние
fz :=Sqrt(Power(Sin(fdPhi / 2.0), 2) + Cos(EndLat * D2R) * Cos(StartLat * D2R) * Power(Sin(fdLambda / 2.0), 2));
fz := 2 * ArcSin(fz);
// Вычисляем смещение
fAlpha := Cos(EndLat * D2R) * Sin(fdLambda) * 1 / Sin(fz);
if (Abs(fAlpha) > 1) then fAlpha:=Sign(fAlpha)*1.0;
fAlpha := ArcSin(fAlpha);
// Вычисляем радиус Земли
fR := (fRho * fNu) / ((fRho * Power(Sin(fAlpha), 2)) + (fNu * Power(Cos(fAlpha), 2)));
// Получаем смещение и расстояние
Distance := (fz * fR);
if ((StartLat < EndLat) and (StartLong < EndLong)) then
  Bearing := Abs(fAlpha * R2D)
else if ((StartLat < EndLat) and (StartLong > EndLong)) then
  Bearing := 360 - Abs(fAlpha * R2D)
else if ((StartLat > EndLat) and (StartLong > EndLong)) then
  Bearing := 180 + Abs(fAlpha * R2D)
else if ((StartLat > EndLat) and (StartLong < EndLong)) then
  Bearing := 180 - Abs(fAlpha * R2D);
Result:=Distance;
end;

procedure TGeoCrdConverter.GeoCoder_LatLongToNearestObjects(const GeoCoderID: integer; const Lat,Long: Extended; out ObjectsNames: string);

  procedure YandexMaps_Process();
  var
    URL: string;
    IdHTTP: TIdHTTP;
    MS: TMemoryStream;
    OLEStream: IStream;
    Doc: IXMLDOMDocument;
    RootNode,CollectionNode,Node: IXMLDOMNode;
    ObjectType: string;
    ObjectName: string;
    ObjectTypeName: string;
    I: integer;
  begin
  if (DatumID <> 23{WGS-84}) then Raise Exception.Create('TGeoCrdConverter.GeoCoder_LatLongToNearestObjects: Datum is not supported, ID: '+IntToStr(DatumID));
  //.
  ObjectsNames:='';
  URL:='http://geocode-maps.yandex.ru/1.x/?geocode='+FloatToStr(Long)+','+FloatToStr(Lat)+'&key=AHhaek0BAAAAeIQxKAIAug5TEqsNtod3IPpUfBs_AoQUM3MAAAAAAAAAAADlrrinFsYwcNyXnEMhXLtTb-KPew==';
  IdHTTP:=TIdHTTP.Create(nil);
  try
  MS:=TMemoryStream.Create();
  try
  IdHTTP.Get(URL,MS);
  MS.Position:=0;
  //. parsing response
  OLEStream:=TStreamAdapter.Create(MS);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ymaps');
  CollectionNode:=RootNode.selectSingleNode('GeoObjectCollection');
  for I:=0 to CollectionNode.childNodes.length-1 do begin
    Node:=CollectionNode.childNodes[I];
    if (Node.nodeName = 'featureMember')
     then begin
      Node:=Node.selectSingleNode('GeoObject/metaDataProperty/GeocoderMetaData');
      if (Node <> nil)
       then begin
        ObjectType:=Node.selectSingleNode('kind').nodeTypedValue;
        ObjectName:=Node.selectSingleNode('text').nodeTypedValue;
        //.
        ObjectTypeName:='';
        if (ObjectType = 'house') then ObjectTypeName:='Дом: ' else
        if (ObjectType = 'street') then ObjectTypeName:='Дом: ' else
        if (ObjectType = 'locality') then ObjectTypeName:='Место: ';
        //.
        if (ObjectTypeName <> '')
         then begin
          ObjectsNames:=ObjectsNames+ObjectTypeName+' '+ObjectName{+#$0D#$0A};
          Exit; //. ->
          end;
        end;
      end;
    end;
  finally
  MS.Destroy();
  end;
  finally
  IdHTTP.Destroy();
  end;
  end;

begin
case GeoCoderID of
GEOCODER_YANDEXMAPS:    YandexMaps_Process();
else
  Raise Exception.Create('GeoCoder is not supported, ID: '+IntToStr(GeoCoderID));
end;
end;

procedure TGeoCrdConverter.LatLongToTM(const Lat,Long: Extended; const Scale: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended; out Zone: TUTMZone);
var
  ER: Extended;
  eccSquared: Extended;
  k0: Extended;
  LongOrigin: Extended;
  eccPrimeSquared: Extended;
  N,T,C,A,M: Extended;
  LongTemp: Extended;
  LatRad,LongRad,LongOriginRad: Extended;
  ZoneNumber: integer;
begin
ER:=Datums[DatumID].Ellipsoide_EquatorialRadius;
eccSquared:=Datums[DatumID].Ellipsoid_EccentricitySquared;
k0:=Scale;
//Make sure the longitude is between -180.00 .. 179.9
LongTemp:=(Long+180)-Trunc((Long+180)/360.0)*360.0-180; // -180.00 .. 179.9;
LatRad:=Lat*deg2rad;
LongRad:=LongTemp*deg2rad;
ZoneNumber:=Trunc((LongTemp + 180)/6.0) + 1;
//.
if ((Lat >= 56.0) AND (Lat < 64.0) AND (LongTemp >= 3.0) AND (LongTemp < 12.0)) then ZoneNumber:=32;
// Special zones for Svalbard
if ((Lat >= 72.0) AND (Lat < 84.0))
 then begin
  if ((LongTemp >= 0.0) AND (LongTemp <  9.0)) then ZoneNumber:=31 else
  if ((LongTemp >= 9.0) AND (LongTemp < 21.0)) then ZoneNumber:=33 else
  if ((LongTemp >= 21.0) AND (LongTemp < 33.0)) then ZoneNumber:=35 else
  if ((LongTemp >= 33.0) AND (LongTemp < 42.0)) then ZoneNumber:=37;
  end;
LongOrigin:=(ZoneNumber - 1)*6.0-180+3;  //. +3 puts origin in middle of zone
LongOriginRad:=LongOrigin*deg2rad;
//. compute the UTM Zone from the latitude and longitude
Zone:=IntToStr(ZoneNumber)+UTMLetterDesignator(Lat);
//.
eccPrimeSquared:=(eccSquared)/(1.0-eccSquared);
//.
N:=ER/Sqrt(1-eccSquared*Sin(LatRad)*Sin(LatRad));
T:=Tan(LatRad)*Tan(LatRad);
C:=eccPrimeSquared*Cos(LatRad)*Cos(LatRad);
A:=cos(LatRad)*(LongRad-LongOriginRad);
M:=ER*((1.0-eccSquared/4.0-3.0*eccSquared*eccSquared/64.0-5.0*eccSquared*eccSquared*eccSquared/256.0)*LatRad-
       (3.0*eccSquared/8.0+3.0*eccSquared*eccSquared/32.0+45.0*eccSquared*eccSquared*eccSquared/1024.0)*Sin(2.0*LatRad)+
       (15.0*eccSquared*eccSquared/256.0+45.0*eccSquared*eccSquared*eccSquared/1024.0)*Sin(4.0*LatRad)-
       (35.0*eccSquared*eccSquared*eccSquared/3072.0)*Sin(6.0*LatRad));
//.
Easting:=(k0*N*(A+(1.0-T+C)*A*A*A/6.0+(5.0-18.0*T+T*T+72.0*C-58.0*eccPrimeSquared)*A*A*A*A*A/120.0)+FalseEasting);
Northing:=(k0*(M+N*Tan(LatRad)*(A*A/2.0+(5.0-T+9.0*C+4*C*C)*A*A*A*A/24.0+(61.0-58.0*T+T*T+600.0*C-330.0*eccPrimeSquared)*A*A*A*A*A*A/720.0)));
//.
if (Northing < 0) then Northing:=Northing+FalseNorthing;
end;

procedure TGeoCrdConverter.TMToLatLong(const Easting,Northing: Extended; const Zone: TUTMZone; const Scale: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
var
  ER: Extended;
  eccSquared: Extended;
  k0: Extended;
  eccPrimeSquared: Extended;
  e1: Extended;
  N1,T1,C1,R1,D,M: Extended;
  LongOrigin: Extended;
  mu,phi1,phi1Rad: Extended;
  x,y: Extended;
  ZoneNumber: integer;
  _Zone: string;
  ZoneLetter: char;
  NorthernHemisphere: integer; //. 1 for northern hemispher, 0 for southern
begin
ER:=Datums[DatumID].Ellipsoide_EquatorialRadius;
k0:=Scale;
eccSquared:=Datums[DatumID].Ellipsoid_EccentricitySquared;
e1:=(1.0-Sqrt(1.0-eccSquared))/(1.0+sqrt(1.0-eccSquared));
//.
x:=Easting-FalseEasting; //remove offset(false Easting) for longitude
y:=Northing;
//.
_Zone:=Zone;
ZoneLetter:=Zone[Length(_Zone)];
SetLength(_Zone,Length(_Zone)-1);
ZoneNumber:=StrToInt(_Zone);
//.
if ((Ord(ZoneLetter) - Ord('N')) >= 0)
 then NorthernHemisphere:=1 //. point is in northern hemisphere
 else begin
  NorthernHemisphere:=0; //. point is in southern hemisphere
  y:=y-FalseNorthing; //remove offset used for southern hemisphere
  end;
//.
LongOrigin:=(ZoneNumber-1.0)*6.0-180.0+3; //. +3 puts origin in middle of zone
eccPrimeSquared:=(eccSquared)/(1.0-eccSquared);
M:=y/k0;
mu:=M/(ER*(1.0-eccSquared/4.0-3.0*eccSquared*eccSquared/64.0-5.0*eccSquared*eccSquared*eccSquared/256.0));
phi1Rad:=mu+(3.0*e1/2.0-27.0*e1*e1*e1/32.0)*Sin(2.0*mu)+(21.0*e1*e1/16.0-55.0*e1*e1*e1*e1/32.0)*Sin(4.0*mu)+(151.0*e1*e1*e1/96.0)*Sin(6.0*mu);
phi1:=phi1Rad*rad2deg;
N1:=ER/Sqrt(1.0-eccSquared*Sin(phi1Rad)*Sin(phi1Rad));
T1:=Tan(phi1Rad)*Tan(phi1Rad);
C1:=eccPrimeSquared*Cos(phi1Rad)*Cos(phi1Rad);
R1:=ER*(1.0-eccSquared)/Math.Power(1.0-eccSquared*Sin(phi1Rad)*Sin(phi1Rad),1.5);
D:=x/(N1*k0);
//.
Lat:=phi1Rad-(N1*Tan(phi1Rad)/R1)*(D*D/2.0-(5.0+3.0*T1+10.0*C1-4.0*C1*C1-9.0*eccPrimeSquared)*D*D*D*D/24.0+
     (61.0+90.0*T1+298.0*C1+45.0*T1*T1-252.0*eccPrimeSquared-3.0*C1*C1)*D*D*D*D*D*D/720.0);
Lat:=Lat*rad2deg;
Long:=(D-(1.0+2.0*T1+C1)*D*D*D/6.0+(5.0-2.0*C1+28.0*T1-3.0*C1*C1+8.0*eccPrimeSquared+24.0*T1*T1)*D*D*D*D*D/120.0)/Cos(phi1Rad);
Long:=LongOrigin+Long*rad2deg;
end;

procedure TGeoCrdConverter.LatLongToUTM(const Lat,Long: Extended; out Easting,Northing: Extended; out Zone: TUTMZone);
var
  ER: Extended;
  eccSquared: Extended;
  k0: Extended;
  LongOrigin: Extended;
  eccPrimeSquared: Extended;
  N,T,C,A,M: Extended;
  LongTemp: Extended;
  LatRad,LongRad,LongOriginRad: Extended;
  ZoneNumber: integer;
begin
ER:=Datums[DatumID].Ellipsoide_EquatorialRadius;
eccSquared:=Datums[DatumID].Ellipsoid_EccentricitySquared;
k0:=0.9996;
//Make sure the longitude is between -180.00 .. 179.9
LongTemp:=(Long+180)-Trunc((Long+180)/360.0)*360.0-180; // -180.00 .. 179.9;
LatRad:=Lat*deg2rad;
LongRad:=LongTemp*deg2rad;
ZoneNumber:=Trunc((LongTemp + 180)/6.0) + 1;
//.
if ((Lat >= 56.0) AND (Lat < 64.0) AND (LongTemp >= 3.0) AND (LongTemp < 12.0)) then ZoneNumber:=32;
// Special zones for Svalbard
if ((Lat >= 72.0) AND (Lat < 84.0))
 then begin
  if ((LongTemp >= 0.0) AND (LongTemp <  9.0)) then ZoneNumber:=31 else
  if ((LongTemp >= 9.0) AND (LongTemp < 21.0)) then ZoneNumber:=33 else
  if ((LongTemp >= 21.0) AND (LongTemp < 33.0)) then ZoneNumber:=35 else
  if ((LongTemp >= 33.0) AND (LongTemp < 42.0)) then ZoneNumber:=37;
  end;
LongOrigin:=(ZoneNumber - 1)*6.0-180+3;  //. +3 puts origin in middle of zone
LongOriginRad:=LongOrigin*deg2rad;
//. compute the UTM Zone from the latitude and longitude
Zone:=IntToStr(ZoneNumber)+UTMLetterDesignator(Lat);
//.
eccPrimeSquared:=(eccSquared)/(1.0-eccSquared);
//.
N:=ER/Sqrt(1-eccSquared*Sin(LatRad)*Sin(LatRad));
T:=Tan(LatRad)*Tan(LatRad);
C:=eccPrimeSquared*Cos(LatRad)*Cos(LatRad);
A:=cos(LatRad)*(LongRad-LongOriginRad);
M:=ER*((1.0-eccSquared/4.0-3.0*eccSquared*eccSquared/64.0-5.0*eccSquared*eccSquared*eccSquared/256.0)*LatRad-
       (3.0*eccSquared/8.0+3.0*eccSquared*eccSquared/32.0+45.0*eccSquared*eccSquared*eccSquared/1024.0)*Sin(2.0*LatRad)+
       (15.0*eccSquared*eccSquared/256.0+45.0*eccSquared*eccSquared*eccSquared/1024.0)*Sin(4.0*LatRad)-
       (35.0*eccSquared*eccSquared*eccSquared/3072.0)*Sin(6.0*LatRad));
//.
Easting:=(k0*N*(A+(1.0-T+C)*A*A*A/6.0+(5.0-18.0*T+T*T+72.0*C-58.0*eccPrimeSquared)*A*A*A*A*A/120.0)+500000.0);
Northing:=(k0*(M+N*Tan(LatRad)*(A*A/2.0+(5.0-T+9.0*C+4*C*C)*A*A*A*A/24.0+(61.0-58.0*T+T*T+600.0*C-330.0*eccPrimeSquared)*A*A*A*A*A*A/720.0)));
//.
if (Lat < 0) then Northing:=Northing+10000000.0; //10000000 meter offset for southern hemisphere
end;

//. This routine determines the correct UTM letter designator for the given latitude
//. returns 'Z' if latitude is outside the UTM limits of 84N to 80S
function TGeoCrdConverter.UTMLetterDesignator(const Lat: Extended): Char;
begin
if ((84.0 >= Lat) AND (Lat >= 72.0)) then Result:='X' else
if ((72.0 > Lat) AND (Lat >= 64.0)) then Result:='W' else
if ((64.0 > Lat) AND (Lat >= 56.0)) then Result:='V' else
if ((56.0 > Lat) AND (Lat >= 48.0)) then Result:='U' else
if ((48.0 > Lat) AND (Lat >= 40.0)) then Result:='T' else
if ((40.0 > Lat) AND (Lat >= 32.0)) then Result:='S' else
if ((32.0 > Lat) AND (Lat >= 24.0)) then Result:='R' else
if ((24.0 > Lat) AND (Lat >= 16.0)) then Result:='Q' else
if ((16.0 > Lat) AND (Lat >= 8.0)) then Result:='P' else
if (( 8.0 > Lat) AND (Lat >= 0.0)) then Result:='N' else
if (( 0.0 > Lat) AND (Lat >= -8.0)) then Result:='M' else
if ((-8.0 > Lat) AND (Lat >= -16.0)) then Result:='L' else
if ((-16.0 > Lat) AND (Lat >= -24.0)) then Result:='K' else
if ((-24.0 > Lat) AND (Lat >= -32.0)) then Result:='J' else
if ((-32.0 > Lat) AND (Lat >= -40.0)) then Result:='H' else
if ((-40.0 > Lat) AND (Lat >= -48.0)) then Result:='G' else
if ((-48.0 > Lat) AND (Lat >= -56.0)) then Result:='F' else
if ((-56.0 > Lat) AND (Lat >= -64.0)) then Result:='E' else
if ((-64.0 > Lat) AND (Lat >= -72.0)) then Result:='D' else
if ((-72.0 > Lat) AND (Lat >= -80.0)) then Result:='C'
else Result:='Z'; //. this is here as an error flag to show that the Latitude is outside the UTM limits
end;

procedure TGeoCrdConverter.UTMToLatLong(const Easting,Northing: Extended; const Zone: TUTMZone; out Lat,Long: Extended);
var
  ER: Extended;
  eccSquared: Extended;
  k0: Extended;
  eccPrimeSquared: Extended;
  e1: Extended;
  N1,T1,C1,R1,D,M: Extended;
  LongOrigin: Extended;
  mu,phi1,phi1Rad: Extended;
  x,y: Extended;
  ZoneNumber: integer;
  _Zone: string;
  ZoneLetter: char;
  NorthernHemisphere: integer; //. 1 for northern hemispher, 0 for southern
begin
ER:=Datums[DatumID].Ellipsoide_EquatorialRadius;
k0:=0.9996;
eccSquared:=Datums[DatumID].Ellipsoid_EccentricitySquared;
e1:=(1.0-Sqrt(1.0-eccSquared))/(1.0+sqrt(1.0-eccSquared));
//.
x:=Easting-500000.0; //remove 500,000 meter offset(false Easting) for longitude
y:=Northing;
//.
_Zone:=Zone;
ZoneLetter:=Zone[Length(_Zone)];
SetLength(_Zone,Length(_Zone)-1);
ZoneNumber:=StrToInt(_Zone);
//.
if ((Ord(ZoneLetter) - Ord('N')) >= 0)
 then NorthernHemisphere:=1 //. point is in northern hemisphere
 else begin
  NorthernHemisphere:=0; //. point is in southern hemisphere
  y:=y-10000000.0; //remove 10,000,000 meter offset used for southern hemisphere
  end;
//.
LongOrigin:=(ZoneNumber-1.0)*6.0-180.0+3; //. +3 puts origin in middle of zone
eccPrimeSquared:=(eccSquared)/(1.0-eccSquared);
M:=y/k0;
mu:=M/(ER*(1.0-eccSquared/4.0-3.0*eccSquared*eccSquared/64.0-5.0*eccSquared*eccSquared*eccSquared/256.0));
phi1Rad:=mu+(3.0*e1/2.0-27.0*e1*e1*e1/32.0)*Sin(2.0*mu)+(21.0*e1*e1/16.0-55.0*e1*e1*e1*e1/32.0)*Sin(4.0*mu)+(151.0*e1*e1*e1/96.0)*Sin(6.0*mu);
phi1:=phi1Rad*rad2deg;
N1:=ER/Sqrt(1.0-eccSquared*Sin(phi1Rad)*Sin(phi1Rad));
T1:=Tan(phi1Rad)*Tan(phi1Rad);
C1:=eccPrimeSquared*Cos(phi1Rad)*Cos(phi1Rad);
R1:=ER*(1.0-eccSquared)/Math.Power(1.0-eccSquared*Sin(phi1Rad)*Sin(phi1Rad),1.5);
D:=x/(N1*k0);
//.
Lat:=phi1Rad-(N1*Tan(phi1Rad)/R1)*(D*D/2.0-(5.0+3.0*T1+10.0*C1-4.0*C1*C1-9.0*eccPrimeSquared)*D*D*D*D/24.0+
     (61.0+90.0*T1+298.0*C1+45.0*T1*T1-252.0*eccPrimeSquared-3.0*C1*C1)*D*D*D*D*D*D/720.0);
Lat:=Lat*rad2deg;
Long:=(D-(1.0+2.0*T1+C1)*D*D*D/6.0+(5.0-2.0*C1+28.0*T1-3.0*C1*C1+8.0*eccPrimeSquared+24.0*T1*T1)*D*D*D*D*D/120.0)/Cos(phi1Rad);
Long:=LongOrigin+Long*rad2deg;
end;

procedure TGeoCrdConverter.LatLongToLCC(const Lat,Long: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
var
  e: Extended;
  phi,phi1,phi2,phio: Extended;
  SinPhi1,CosPhi1: Extended;
  SinPhi2,CosPhi2: Extended;
  lamda,lamdao: Extended;
  m1,m2: Extended;
  t,t0,t1,t2: Extended;
  n: Extended;
  F: Extended;
  r,rf: Extended;
  theta: Extended;
begin
e:=Sqrt(Datums[DatumID].Ellipsoid_EccentricitySquared);
//.
phi:=Lat*D2R; //. Latitude to convert
phi1:=FirstStdParallel*D2R; //. Latitude of 1st std parallel
phi2:=SecondStdParallel*D2R; //. Latitude of 2nd std parallel
lamda:=Long*D2R; //. Longitude to convert
phio:=LatOfOrigin*D2R; //. Latitude of  Origin
lamdao:=LongOfOrigin*D2R; //. Longitude of  Origin
//.
SinPhi1:=Sin(phi1);
CosPhi1:=Cos(phi1);
SinPhi2:=Sin(phi2);
CosPhi2:=Cos(phi2);
//.
m1:=CosPhi1/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi1*SinPhi1);
m2:=CosPhi2/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi2*SinPhi2);
t1:=Tan((PI/4.0)-(phi1/2.0))/Power(((1.0 - e*SinPhi1)/(1.0 + e*SinPhi1)),e/2.0);
t2:=Tan((PI/4.0)-(phi2/2.0))/Power(((1.0 - e*SinPhi2)/(1.0 + e*SinPhi2)),e/2.0);
t0:=Tan((PI/4.0)-(phio/2.0))/Power(((1.0 - e*Sin(phio))/(1.0 + e*Sin(phio))),e/2.0);
t :=Tan((PI/4.0)-(phi /2.0))/Power(((1.0 - e*Sin(phi) )/(1.0 + e*Sin(phi ))),e/2.0);
if (phi2 <> phi1)
 then n:=(Ln(m1)-Ln(m2))/(Ln(t1)-Ln(t2))
 else n:=SinPhi1;
F:=m1/(n*Power(t1,n));
rf:=Datums[DatumID].Ellipsoide_EquatorialRadius*F*Power(t0,n);
r:=Datums[DatumID].Ellipsoide_EquatorialRadius*F*Power(t,n);
theta:=n*(lamda - lamdao);
//.
Easting:=FalseEasting + r*Sin(theta);
Northing:=FalseNorthing + (rf - r*cos(theta));
end;

procedure TGeoCrdConverter.LCCToLatLong(const Easting,Northing: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
  R2D: Extended = 180.0/PI; // radians to degree constant
var
  e: Extended;
  phi,phi0,phi1,phi2,phio: Extended;
  lamda,lamdao: Extended;
  SinPhi1,CosPhi1: Extended;
  SinPhi2,CosPhi2: Extended;
  m1,m2: Extended;
  t_,t0,t1,t2: Extended;
  n: Extended;
  F: Extended;
  r_,rf: Extended;
  theta_: Extended;
begin
e:=Sqrt(Datums[DatumID].Ellipsoid_EccentricitySquared);
//.
phi1:=FirstStdParallel*D2R; //. Latitude of 1st std parallel
phi2:=SecondStdParallel*D2R; //. Latitude of 2nd std parallel
lamda:=Long*D2R; //. Longitude to convert
phio:=LatOfOrigin*D2R; //. Latitude of  Origin
lamdao:=LongOfOrigin*D2R; //. Longitude of  Origin
//.
SinPhi1:=Sin(phi1);
CosPhi1:=Cos(phi1);
SinPhi2:=Sin(phi2);
CosPhi2:=Cos(phi2);
//.
m1:=CosPhi1/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi1*SinPhi1);
m2:=CosPhi2/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi2*SinPhi2);
t1:=Tan((PI/4.0)-(phi1/2.0))/Power(((1.0 - e*SinPhi1)/(1.0 + e*SinPhi1)),e/2.0);
t2:=Tan((PI/4.0)-(phi2/2.0))/Power(((1.0 - e*SinPhi2)/(1.0 + e*SinPhi2)),e/2.0);
t0:=Tan((PI/4.0)-(phio/2.0))/Power(((1.0 - e*Sin(phio))/(1.0 + e*Sin(phio))),e/2.0);
if (phi2 <> phi1)
 then n:=(Ln(m1)-Ln(m2))/(Ln(t1)-Ln(t2))
 else n:=SinPhi1;
F:=m1/(n*Power(t1,n));
rf:=Datums[DatumID].Ellipsoide_EquatorialRadius*F*Power(t0,n);
r_:=Sqrt(Power((Easting-FalseEasting),2) + Power((rf-(Northing-FalseNorthing)),2));
t_:=Power(r_/(Datums[DatumID].Ellipsoide_EquatorialRadius*F),(1.0/n));
theta_:=ArcTan((Easting-FalseEasting)/(rf-(Northing-FalseNorthing)));
//.
lamda:=theta_/n + lamdao;
phi0:=(PI/2.0) - 2.0*ArcTan(t_);
phi1:=(PI/2.0) - 2.0*ArcTan(t_*Power(((1.0-e*Sin(phi0))/(1.0+e*Sin(phi0))),e/2.0));
phi2:=(PI/2.0) - 2.0*ArcTan(t_*Power(((1.0-e*Sin(phi1))/(1.0+e*Sin(phi1))),e/2.0));
phi :=(PI/2.0) - 2.0*ArcTan(t_*Power(((1.0-e*Sin(phi2))/(1.0+e*Sin(phi2))),e/2.0));
//.
Lat:=phi*R2D;
Long:=lamda*R2D;
end;

procedure TGeoCrdConverter.LatLongToEQC(const Lat,Long: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Easting,Northing: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
var
  phi,phi1,phi2,phio: Extended;
  lamda,lamdao: Extended;
  SinPhi1,CosPhi1: Extended;
  SinPhi2,CosPhi2: Extended;
  m1,m2: Extended;
  n: Extended;
  G: Extended;
  r,rf: Extended;
  theta: Extended;
begin
phi:=Lat*D2R; //. Latitude to convert
phi1:=FirstStdParallel*D2R; //. Latitude of 1st std parallel
phi2:=SecondStdParallel*D2R; //. Latitude of 2nd std parallel
lamda:=Long*D2R; //. Longitude to convert
phio:=LatOfOrigin*D2R; //. Latitude of  Origin
lamdao:=LongOfOrigin*D2R; //. Longitude of  Origin
//.
SinPhi1:=Sin(phi1);
CosPhi1:=Cos(phi1);
SinPhi2:=Sin(phi2);
CosPhi2:=Cos(phi2);
//.
m1:=CosPhi1/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi1*SinPhi1);
m2:=CosPhi2/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi2*SinPhi2);
if (phi2 <> phi1)
 then n:=(m1-m2)/(MeridianDistance_Calculate(phi2,SinPhi2,CosPhi2)-MeridianDistance_Calculate(phi1,SinPhi1,CosPhi1))
 else n:=SinPhi1;
G:=m1/n+MeridianDistance_Calculate(phi1,SinPhi1,CosPhi1);
rf:=G-MeridianDistance_Calculate(phio,Sin(phio),Cos(phio));
r:=G-MeridianDistance_Calculate(phi,Sin(phi),Cos(phi));
theta:=n*(lamda - lamdao);
//.
Easting:=FalseEasting + r*Sin(theta);
Northing:=FalseNorthing + (rf - r*cos(theta));
end;

procedure TGeoCrdConverter.EQCToLatLong(const Easting,Northing: Extended; const LatOfOrigin,LongOfOrigin: Extended; const FirstStdParallel,SecondStdParallel: Extended; const FalseEasting,FalseNorthing: Extended; out Lat,Long: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
  R2D: Extended = 180.0/PI; // radians to degree constant
var
  phi,phi0,phi1,phi2,phio: Extended;
  lamda,lamdao: Extended;
  SinPhi1,CosPhi1: Extended;
  SinPhi2,CosPhi2: Extended;
  m1,m2: Extended;
  n: Extended;
  G: Extended;
  r_,rf: Extended;
  theta_: Extended;
  D: Extended;
begin
phi1:=FirstStdParallel*D2R; //. Latitude of 1st std parallel
phi2:=SecondStdParallel*D2R; //. Latitude of 2nd std parallel
lamda:=Long*D2R; //. Longitude to convert
phio:=LatOfOrigin*D2R; //. Latitude of  Origin
lamdao:=LongOfOrigin*D2R; //. Longitude of  Origin
//.
SinPhi1:=Sin(phi1);
CosPhi1:=Cos(phi1);
SinPhi2:=Sin(phi2);
CosPhi2:=Cos(phi2);
//.
m1:=CosPhi1/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi1*SinPhi1);
m2:=CosPhi2/Sqrt(1.0 - Datums[DatumID].Ellipsoid_EccentricitySquared*SinPhi2*SinPhi2);
if (phi2 <> phi1)
 then n:=(m1-m2)/(MeridianDistance_Calculate(phi2,SinPhi2,CosPhi2)-MeridianDistance_Calculate(phi1,SinPhi1,CosPhi1))
 else n:=SinPhi1;
G:=m1/n+MeridianDistance_Calculate(phi1,SinPhi1,CosPhi1);
rf:=G-MeridianDistance_Calculate(phio,Sin(phio),Cos(phio));
r_:=Sqrt(Power((Easting-FalseEasting),2) + Power((rf-(Northing-FalseNorthing)),2));
theta_:=ArcTan((Easting-FalseEasting)/(rf-(Northing-FalseNorthing)));
//.
lamda:=theta_/n+lamdao;
D:=(G-r_);
phi:=MeridianDistance_CalculateInverse(D);
//.
Lat:=phi*R2D;
Long:=lamda*R2D;
end;

procedure TGeoCrdConverter.LatLongToMP(const Lat,Long: Extended; out Easting,Northing: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
var
  Latitude,Longitude: Extended;
  Rn: Extended;
  e: Extended;
  esinLat: Extended;
  tan_temp: Extended;
  pow_temp: Extended;
  U: Extended;
begin
Latitude:=Lat*D2R;
Longitude:=Long*D2R;
Rn:=Datums[DatumID].Ellipsoide_EquatorialRadius;
e:=Sqrt(Datums[DatumID].Ellipsoid_EccentricitySquared);
esinLat:=e*Sin(Latitude);
tan_temp:=Math.Tan(PI/4.0+Latitude/2.0);
pow_temp:=Math.Power(Math.Tan(PI/4.0+Math.ArcSin(esinLat)/2),e);
U:=tan_temp/pow_temp;
Easting:=Rn*Longitude;
Northing:=Rn*Ln(U);
end;

procedure TGeoCrdConverter.MPToLatLong(const Easting,Northing: Extended; out Lat,Long: Extended);
const
  R2D: Extended = 180.0/PI; // radians to degree constant
var
  Rn: Extended;
  ab,bb,cb,db: Extended;
  xphi: Extended;
  Latitude,Longitude: Extended;
begin
if (DatumID <> 23) then Raise Exception.Create('Datum is not supported, DatumID: '+IntToStr(DatumID));
Rn:=Datums[DatumID].Ellipsoide_EquatorialRadius;
ab:=0.00335655146887969400;
bb:=0.00000657187271079536;
cb:=0.00000001764564338702;
db:=0.00000000005328478445;
xphi:=PI/2.0-2.0*ArcTan(1.0/Exp(Northing/Rn));
Latitude:=xphi+ab*Sin(2.0*xphi)+bb*Sin(4.0*xphi)+cb*Sin(6.0*xphi)+db*Sin(8.0*xphi);
Longitude:=Easting/Rn;
Lat:=Latitude*R2D;
Long:=Longitude*R2D;
end;

procedure TGeoCrdConverter.LatLongToSphereMP(const Lat,Long: Extended; out Easting,Northing: Extended);
const
  D2R: Extended = PI/180.0; // degree to radians constant
var
  Latitude: Extended;
begin
Latitude:=Lat*D2R;
Easting:=EquatorLengthHalf*(Long/180.0);
Northing:=EquatorLengthHalf*((Ln(Tan(Latitude)+1.0/Cos(Latitude)))/PI);
end;

procedure TGeoCrdConverter.SphereMPToLatLong(const Easting,Northing: Extended; out Lat,Long: Extended);
const
  R2D: Extended = 180.0/PI; // radians to degree constant
begin
Lat:=ArcTan(SinH(PI*(Northing/EquatorLengthHalf)))*R2D;
Long:=(Easting/EquatorLengthHalf)*180.0;
end;


{TMapInfo}
class function TMapInfo.GetMapInfo(const idTVisualization: integer; const idVisualization: integer): TMapInfo;
begin
case idTVisualization of
idTDetailedPictureVisualization:        Result:=TDPVMapInfo.Create(idVisualization);
idTTileServerVisualization:             Result:=TTSVMapInfo.Create(idVisualization);
else
  Result:=nil;
end;
end;

{TDPVMapInfo}
Constructor TDPVMapInfo.Create(const pidDetailedPicture: integer);
var
  Obj: TSpaceObj;
  BA: TByteArray;
begin
Inherited Create();
idDetailedPicture:=pidDetailedPicture;
with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idDetailedPicture)) do
try
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('TDPVMapInfo.Create error: wrong map'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
finally
Destroy();
end;
GetLevelsInfoLocally(BA);
if (Length(BA) = 0) then Raise Exception.Create('TDPVMapInfo.Create error: no map parameters'); //. =>
with TDetailedPictureVisualizationLevel(Pointer(@BA[0])^) do begin
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('TDPVMapInfo.Create error: wrong map parameters'); //. =>
Divider:=DivX;
SegmentSize:=SegmentWidth;
end;
finally
Release();
end;
Size:=Divider*SegmentSize;
end;

procedure TDPVMapInfo.ConvertPixPosToXY(const PixX,PixY: Extended; out X,Y: Extended);
var
  Col_dX,Col_dY: Extended;
  Row_dX,Row_dY: Extended;
  Col_Factor,Row_Factor: Extended;
begin
Col_dX:=(N1.X-N0.X); Col_dY:=(N1.Y-N0.Y);
Row_dX:=(N3.X-N0.X); Row_dY:=(N3.Y-N0.Y);
Col_Factor:=PixX/Size;
Row_Factor:=PixY/Size; //. PixLength the same as for X
X:=N0.X+Col_dX*Col_Factor+Row_dX*Row_Factor;
Y:=N0.Y+Col_dY*Col_Factor+Row_dY*Row_Factor;
end;

procedure TDPVMapInfo.ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended);

  procedure ProcessPoint(const X0,Y0,X1,Y1,X3,Y3: Extended; const X,Y: Extended; out Xfactor,Yfactor: Extended);
  var
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  //.
  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
  //.
  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
  //.
  Xfactor:=X_A1/X_C;
  Yfactor:=Y_A1/Y_C;
  end;

var
  Xfactor,Yfactor: Extended;
begin
ProcessPoint(N0.X,N0.Y,N1.X,N1.Y,N3.X,N3.Y, X,Y,  Xfactor,Yfactor);
//.
PixX:=Xfactor*Size;
PixY:=Yfactor*Size; //. same as for X
end;


{TTSVMapInfo}
Constructor TTSVMapInfo.Create(const pidTileServerVisualization: integer);
var
  Obj: TSpaceObj;
  BA: TByteArray;
begin
Inherited Create();
idTileServerVisualization:=pidTileServerVisualization;
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
try
if (Count <> 4) then Raise Exception.Create('TTSVMapInfo.Create error: wrong map'); //. =>
N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
finally
Destroy();
end;
GetLevelsInfoLocally(BA);
if (Length(BA) = 0) then Raise Exception.Create('TTSVMapInfo.Create error: no map parameters'); //. =>
with TTileServerVisualizationLevel(Pointer(@BA[0])^) do begin
if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('TTSVMapInfo.Create error: wrong map parameters'); //. =>
Divider:=DivX;
SegmentSize:=SegmentWidth;
end;
finally
Release();
end;
Size:=Divider*SegmentSize;
end;

procedure TTSVMapInfo.ConvertPixPosToXY(const PixX,PixY: Extended; out X,Y: Extended);
var
  Col_dX,Col_dY: Extended;
  Row_dX,Row_dY: Extended;
  Col_Factor,Row_Factor: Extended;
begin
Col_dX:=(N1.X-N0.X); Col_dY:=(N1.Y-N0.Y);
Row_dX:=(N3.X-N0.X); Row_dY:=(N3.Y-N0.Y);
Col_Factor:=PixX/Size;
Row_Factor:=PixY/Size; //. PixLength the same as for X
X:=N0.X+Col_dX*Col_Factor+Row_dX*Row_Factor;
Y:=N0.Y+Col_dY*Col_Factor+Row_dY*Row_Factor;
end;

procedure TTSVMapInfo.ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended);

  procedure ProcessPoint(const X0,Y0,X1,Y1,X3,Y3: Extended; const X,Y: Extended; out Xfactor,Yfactor: Extended);
  var
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
  begin
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  //.
  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
  //.
  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
  //.
  Xfactor:=X_A1/X_C;
  Yfactor:=Y_A1/Y_C;
  end;

var
  Xfactor,Yfactor: Extended;
begin
ProcessPoint(N0.X,N0.Y,N1.X,N1.Y,N3.X,N3.Y, X,Y,  Xfactor,Yfactor);
//.
PixX:=Xfactor*Size;
PixY:=Yfactor*Size; //. same as for X
end;


{TViewTransformator}
Constructor TViewTransformator.Create(const pControlPoints: TViewTransformatorControlPoints);
begin
Inherited Create;
ControlPoints:=pControlPoints;
Params.Algorithm:=vtaNone;
end;

function TViewTransformator.IsControlPointsTheSame(const pControlPoints: TViewTransformatorControlPoints): boolean;
var
  I: integer;
begin
Result:=false;
if (Length(pControlPoints) <> Length(ControlPoints)) then Exit; //. ->
for I:=0 to Length(pControlPoints)-1 do
  if (NOT ((pControlPoints[I].E = ControlPoints[I].E) AND (pControlPoints[I].N = ControlPoints[I].N) AND (pControlPoints[I].X = ControlPoints[I].X) AND (pControlPoints[I].Y = ControlPoints[I].Y))) then Exit; //. ->
Result:=true;
end;

procedure TViewTransformator.SetControlPoints(const pControlPoints: TViewTransformatorControlPoints);
begin
ControlPoints:=pControlPoints;
Params.Algorithm:=vtaNone;
end;

procedure TViewTransformator.Linear_UpdateParams();
begin
if (Params.Algorithm = vtaLinear) then Exit; //. ->
//.
if (Length(ControlPoints) <> 2) then Raise Exception.Create('TViewTransformator.Linear_UpdateParams(): wrong number of control points'); //. =>
//.
Params.Algorithm:=vtaLinear;
end;

procedure TViewTransformator.Linear_Transform(const E,N: Extended; out X,Y: Extended);
begin
Linear_UpdateParams();
//.
end;

procedure TViewTransformator.Linear_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Linear_UpdateParams();
//.
end;

procedure TViewTransformator.Polynom1_UpdateParams();
{GIS-Lab.info}
var
  AA: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom1) then Exit; //. ->
//.
if (Length(ControlPoints) < 3) then Raise Exception.Create('TViewTransformator.Polynom1_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение обратной матрицы
SetLength(AA,4,4);
for I:=1 to 3 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].E;
  AA[3,I]:=ControlPoints[I-1].N;
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,3)) then Raise Exception.Create('TViewTransformator.Polynom1_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.X,4); for I:=1 to 3 do Params.X[I]:=0;
for I:=1 to 3 do
  for J:=1 to 3 do Params.X[I]:=Params.X[I]+AA[J,I]*ControlPoints[J-1].X;
//. умножение с обратной матрицей Y
SetLength(Params.Y,4); for I:=1 to 3 do Params.Y[I]:=0;
for I:=1 to 3 do
  for J:=1 to 3 do Params.Y[I]:=Params.Y[I]+AA[J,I]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение обратной матрицы
SetLength(AA,4,4);
for I:=1 to 3 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].X;
  AA[3,I]:=ControlPoints[I-1].Y;
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,3)) then Raise Exception.Create('TViewTransformator.Polynom1_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.E,4); for I:=1 to 3 do Params.E[I]:=0;
for I:=1 to 3 do
  for J:=1 to 3 do Params.E[I]:=Params.E[I]+AA[J,I]*ControlPoints[J-1].E;
//. умножение с обратной матрицей Y
SetLength(Params.N,4); for I:=1 to 3 do Params.N[I]:=0;
for I:=1 to 3 do
  for J:=1 to 3 do Params.N[I]:=Params.N[I]+AA[J,I]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom1;
end;

procedure TViewTransformator.Polynom1_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom1_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N;
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N;
end;

procedure TViewTransformator.Polynom1_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom1_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y;
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y;
end;

procedure TViewTransformator.Polynom2_UpdateParams();
{GIS-Lab.info}
var
  AA: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom2) then Exit; //. ->
if (Length(ControlPoints) < 6) then Raise Exception.Create('TViewTransformator.Polynom2_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение обратной матрицы
SetLength(AA,7,7);
for I:=1 to 6 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].E;
  AA[3,I]:=ControlPoints[I-1].N;
  AA[4,I]:=sqr(ControlPoints[I-1].E);
  AA[5,I]:=ControlPoints[I-1].E*ControlPoints[I-1].N;
  AA[6,I]:=sqr(ControlPoints[I-1].N);
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,6)) then Raise Exception.Create('TViewTransformator.Polynom2_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.X,7); for I:=1 to 6 do Params.X[I]:=0;
for I:=1 to 6 do
  for J:=1 to 6 do Params.X[I]:=Params.X[I]+AA[J,I]*ControlPoints[J-1].X;
//. умножение с обратной матрицей Y
SetLength(Params.Y,7); for I:=1 to 6 do Params.Y[I]:=0;
for I:=1 to 6 do
  for J:=1 to 6 do Params.Y[I]:=Params.Y[I]+AA[J,I]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение обратной матрицы
SetLength(AA,7,7);
for I:=1 to 6 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].X;
  AA[3,I]:=ControlPoints[I-1].Y;
  AA[4,I]:=sqr(ControlPoints[I-1].X);
  AA[5,I]:=ControlPoints[I-1].X*ControlPoints[I-1].Y;
  AA[6,I]:=sqr(ControlPoints[I-1].Y);
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,6)) then Raise Exception.Create('TViewTransformator.Polynom2_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.E,7); for I:=1 to 6 do Params.E[I]:=0;
for I:=1 to 6 do
  for J:=1 to 6 do Params.E[I]:=Params.E[I]+AA[J,I]*ControlPoints[J-1].E;
//. умножение с обратной матрицей Y
SetLength(Params.N,7); for I:=1 to 6 do Params.N[I]:=0;
for I:=1 to 6 do
  for J:=1 to 6 do Params.N[I]:=Params.N[I]+AA[J,I]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom2;
end;

procedure TViewTransformator.Polynom2_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom2_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N+Params.X[4]*sqr(E)+Params.X[5]*E*N+Params.X[6]*sqr(N);
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N+Params.Y[4]*sqr(E)+Params.Y[5]*E*N+Params.Y[6]*sqr(N);
end;

procedure TViewTransformator.Polynom2_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom2_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y+Params.E[4]*sqr(X)+Params.E[5]*X*Y+Params.E[6]*sqr(Y);
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y+Params.N[4]*sqr(X)+Params.N[5]*X*Y+Params.N[6]*sqr(Y);
end;

procedure TViewTransformator.Polynom3_UpdateParams();
{GIS-Lab.info}
var
  AA: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom3) then Exit; //. ->
if (Length(ControlPoints) < 10) then Raise Exception.Create('TViewTransformator.Polynom3_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение обратной матрицы
SetLength(AA,11,11);
for I:=1 to 10 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].E;
  AA[3,I]:=ControlPoints[I-1].N;
  AA[4,I]:=sqr(ControlPoints[I-1].E);
  AA[5,I]:=ControlPoints[I-1].E*ControlPoints[I-1].N;
  AA[6,I]:=sqr(ControlPoints[I-1].N);
  AA[7,I]:=Power(ControlPoints[I-1].E,3);
  AA[8,I]:=sqr(ControlPoints[I-1].E)*ControlPoints[I-1].N;
  AA[9,I]:=ControlPoints[I-1].E*sqr(ControlPoints[I-1].N);
  AA[10,I]:=Power(ControlPoints[I-1].N,3);
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,10)) then Raise Exception.Create('TViewTransformator.Polynom3_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.X,11); for I:=1 to 10 do Params.X[I]:=0;
for I:=1 to 10 do
  for J:=1 to 10 do Params.X[I]:=Params.X[I]+AA[J,I]*ControlPoints[J-1].X;
//. умножение с обратной матрицей Y
SetLength(Params.Y,11); for I:=1 to 10 do Params.Y[I]:=0;
for I:=1 to 10 do
  for J:=1 to 10 do Params.Y[I]:=Params.Y[I]+AA[J,I]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение обратной матрицы
SetLength(AA,11,11);
for I:=1 to 10 do begin
  AA[1,I]:=1;
  AA[2,I]:=ControlPoints[I-1].X;
  AA[3,I]:=ControlPoints[I-1].Y;
  AA[4,I]:=sqr(ControlPoints[I-1].X);
  AA[5,I]:=ControlPoints[I-1].X*ControlPoints[I-1].Y;
  AA[6,I]:=sqr(ControlPoints[I-1].Y);
  AA[7,I]:=Power(ControlPoints[I-1].X,3);
  AA[8,I]:=sqr(ControlPoints[I-1].X)*ControlPoints[I-1].Y;
  AA[9,I]:=ControlPoints[I-1].X*sqr(ControlPoints[I-1].Y);
  AA[10,I]:=Power(ControlPoints[I-1].Y,3);
  end;
//. вычисление обратной матрицы
if (NOT Inverse(AA,10)) then Raise Exception.Create('TViewTransformator.Polynom3_UpdateParams(): invalid control points'); //. =>
//. умножение с обратной матрицей X
Setlength(Params.E,11); for I:=1 to 10 do Params.E[I]:=0;
for I:=1 to 10 do
  for J:=1 to 10 do Params.E[I]:=Params.E[I]+AA[J,I]*ControlPoints[J-1].E;
//. умножение с обратной матрицей Y
SetLength(Params.N,11); for I:=1 to 10 do Params.N[I]:=0;
for I:=1 to 10 do
  for J:=1 to 10 do Params.N[I]:=Params.N[I]+AA[J,I]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom3;
end;

procedure TViewTransformator.Polynom3_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom3_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N+Params.X[4]*sqr(E)+Params.X[5]*E*N+Params.X[6]*sqr(N)+Params.X[7]*Power(E,3)+Params.X[8]*sqr(E)*N+Params.X[9]*E*sqr(N)+Params.X[10]*Power(N,3);
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N+Params.Y[4]*sqr(E)+Params.Y[5]*E*N+Params.Y[6]*sqr(N)+Params.Y[7]*Power(E,3)+Params.Y[8]*sqr(E)*N+Params.Y[9]*E*sqr(N)+Params.Y[10]*Power(N,3);
end;

procedure TViewTransformator.Polynom3_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom3_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y+Params.E[4]*sqr(X)+Params.E[5]*X*Y+Params.E[6]*sqr(Y)+Params.E[7]*Power(X,3)+Params.E[8]*sqr(X)*Y+Params.E[9]*X*sqr(Y)+Params.E[10]*Power(Y,3);
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y+Params.N[4]*sqr(X)+Params.N[5]*X*Y+Params.N[6]*sqr(Y)+Params.N[7]*Power(X,3)+Params.N[8]*sqr(X)*Y+Params.N[9]*X*sqr(Y)+Params.N[10]*Power(Y,3);
end;

procedure TViewTransformator.Polynom1RMS_UpdateParams();
{GIS-Lab.info}
var
  PointsNumber: integer;
  XMT,XM,XMM,XMR: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom1RMS) then Exit; //. ->
PointsNumber:=Length(ControlPoints);
if (PointsNumber < 3) then Raise Exception.Create('TViewTransformator.Polynom1RMS_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,4);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].E;
  XM[I,3]:=ControlPoints[I-1].N;
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,4,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 3 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (3 x 3)
MultiplyMatrixes(3,PointsNumber,3, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,3)) then Raise Exception.Create('TViewTransformator.Polynom1RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (3 x PointsNumber)
MultiplyMatrixes(3,3,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.X,4); for I:=1 to 3 do Params.X[I]:=0;
for I:=1 to 3 do
  for J:=1 to PointsNumber do Params.X[I]:=Params.X[I]+XMR[I,J]*ControlPoints[J-1].X;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Y,4); for I:=1 to 3 do Params.Y[I]:=0;
for I:=1 to 3 do
  for J:=1 to PointsNumber do Params.Y[I]:=Params.Y[I]+XMR[I,J]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,4);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].X;
  XM[I,3]:=ControlPoints[I-1].Y;
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,4,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 3 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (3 x 3)
MultiplyMatrixes(3,PointsNumber,3, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,3)) then Raise Exception.Create('TViewTransformator.Polynom1RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (3 x PointsNumber)
MultiplyMatrixes(3,3,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.E,4); for I:=1 to 3 do Params.E[I]:=0;
for I:=1 to 3 do
  for J:=1 to PointsNumber do Params.E[I]:=Params.E[I]+XMR[I,J]*ControlPoints[J-1].E;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.N,4); for I:=1 to 3 do Params.N[I]:=0;
for I:=1 to 3 do
  for J:=1 to PointsNumber do Params.N[I]:=Params.N[I]+XMR[I,J]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom1RMS;
end;

procedure TViewTransformator.Polynom1RMS_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom1RMS_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N;
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N;
end;

procedure TViewTransformator.Polynom1RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom1RMS_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y;
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y;
end;

procedure TViewTransformator.Polynom2RMS_UpdateParams();
{GIS-Lab.info}
var
  PointsNumber: integer;
  XMT,XM,XMM,XMR: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom2RMS) then Exit; //. ->
PointsNumber:=Length(ControlPoints);
if (PointsNumber < 6) then Raise Exception.Create('TViewTransformator.Polynom2RMS_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,7);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].E;
  XM[I,3]:=ControlPoints[I-1].N;
  XM[I,4]:=sqr(ControlPoints[I-1].E);
  XM[I,5]:=ControlPoints[I-1].E*ControlPoints[I-1].N;
  XM[I,6]:=sqr(ControlPoints[I-1].N);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,7,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 6 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (6 x 6)
MultiplyMatrixes(6,PointsNumber,6, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,6)) then Raise Exception.Create('TViewTransformator.Polynom2RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (6 x PointsNumber)
MultiplyMatrixes(6,6,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.X,7); for I:=1 to 6 do Params.X[I]:=0;
for I:=1 to 6 do
  for J:=1 to PointsNumber do Params.X[I]:=Params.X[I]+XMR[I,J]*ControlPoints[J-1].X;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Y,7); for I:=1 to 6 do Params.Y[I]:=0;
for I:=1 to 6 do
  for J:=1 to PointsNumber do Params.Y[I]:=Params.Y[I]+XMR[I,J]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,7);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].X;
  XM[I,3]:=ControlPoints[I-1].Y;
  XM[I,4]:=sqr(ControlPoints[I-1].X);
  XM[I,5]:=ControlPoints[I-1].X*ControlPoints[I-1].Y;
  XM[I,6]:=sqr(ControlPoints[I-1].Y);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,7,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 6 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (6 x 6)
MultiplyMatrixes(6,PointsNumber,6, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,6)) then Raise Exception.Create('TViewTransformator.Polynom2RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (6 x PointsNumber)
MultiplyMatrixes(6,6,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.E,7); for I:=1 to 6 do Params.E[I]:=0;
for I:=1 to 6 do
  for J:=1 to PointsNumber do Params.E[I]:=Params.E[I]+XMR[I,J]*ControlPoints[J-1].E;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.N,7); for I:=1 to 6 do Params.N[I]:=0;
for I:=1 to 6 do
  for J:=1 to PointsNumber do Params.N[I]:=Params.N[I]+XMR[I,J]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom2RMS;
end;

procedure TViewTransformator.Polynom2RMS_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom2RMS_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N+Params.X[4]*sqr(E)+Params.X[5]*E*N+Params.X[6]*sqr(N);
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N+Params.Y[4]*sqr(E)+Params.Y[5]*E*N+Params.Y[6]*sqr(N);
end;

procedure TViewTransformator.Polynom2RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom2RMS_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y+Params.E[4]*sqr(X)+Params.E[5]*X*Y+Params.E[6]*sqr(Y);
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y+Params.N[4]*sqr(X)+Params.N[5]*X*Y+Params.N[6]*sqr(Y);
end;

procedure TViewTransformator.Polynom3RMS_UpdateParams();
{GIS-Lab.info}
var
  PointsNumber: integer;
  XMT,XM,XMM,XMR: TReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom3RMS) then Exit; //. ->
PointsNumber:=Length(ControlPoints);
if (PointsNumber < 10) then Raise Exception.Create('TViewTransformator.Polynom3RMS_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,11);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].E;
  XM[I,3]:=ControlPoints[I-1].N;
  XM[I,4]:=sqr(ControlPoints[I-1].E);
  XM[I,5]:=ControlPoints[I-1].E*ControlPoints[I-1].N;
  XM[I,6]:=sqr(ControlPoints[I-1].N);
  XM[I,7]:=Power(ControlPoints[I-1].E,3);
  XM[I,8]:=sqr(ControlPoints[I-1].E)*ControlPoints[I-1].N;
  XM[I,9]:=ControlPoints[I-1].E*sqr(ControlPoints[I-1].N);
  XM[I,10]:=Power(ControlPoints[I-1].N,3);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,11,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 10 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (10 x 10)
MultiplyMatrixes(10,PointsNumber,10, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,10)) then Raise Exception.Create('TViewTransformator.Polynom3RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (10 x PointsNumber)
MultiplyMatrixes(10,10,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.X,11); for I:=1 to 10 do Params.X[I]:=0;
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.X[I]:=Params.X[I]+XMR[I,J]*ControlPoints[J-1].X;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Y,11); for I:=1 to 10 do Params.Y[I]:=0;
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.Y[I]:=Params.Y[I]+XMR[I,J]*ControlPoints[J-1].Y;
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,11);
for I:=1 to PointsNumber do begin
  XM[I,1]:=1;
  XM[I,2]:=ControlPoints[I-1].X;
  XM[I,3]:=ControlPoints[I-1].Y;
  XM[I,4]:=sqr(ControlPoints[I-1].X);
  XM[I,5]:=ControlPoints[I-1].X*ControlPoints[I-1].Y;
  XM[I,6]:=sqr(ControlPoints[I-1].Y);
  XM[I,7]:=Power(ControlPoints[I-1].X,3);
  XM[I,8]:=sqr(ControlPoints[I-1].X)*ControlPoints[I-1].Y;
  XM[I,9]:=ControlPoints[I-1].X*sqr(ControlPoints[I-1].Y);
  XM[I,10]:=Power(ControlPoints[I-1].Y,3);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,11,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 10 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (10 x 10)
MultiplyMatrixes(10,PointsNumber,10, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Inverse(XMM,10)) then Raise Exception.Create('TViewTransformator.Polynom3RMS_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (10 x PointsNumber)
MultiplyMatrixes(10,10,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.E,11); for I:=1 to 10 do Params.E[I]:=0;
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.E[I]:=Params.E[I]+XMR[I,J]*ControlPoints[J-1].E;
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.N,11); for I:=1 to 10 do Params.N[I]:=0;
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.N[I]:=Params.N[I]+XMR[I,J]*ControlPoints[J-1].N;
//.
Params.Algorithm:=vtaPolynom3RMS;
end;

procedure TViewTransformator.Polynom3RMS_Transform(const E,N: Extended; out X,Y: Extended);
begin
Polynom3RMS_UpdateParams();
//.
X:=Params.X[1]+Params.X[2]*E+Params.X[3]*N+Params.X[4]*sqr(E)+Params.X[5]*E*N+Params.X[6]*sqr(N)+Params.X[7]*Power(E,3)+Params.X[8]*sqr(E)*N+Params.X[9]*E*sqr(N)+Params.X[10]*Power(N,3);
Y:=Params.Y[1]+Params.Y[2]*E+Params.Y[3]*N+Params.Y[4]*sqr(E)+Params.Y[5]*E*N+Params.Y[6]*sqr(N)+Params.Y[7]*Power(E,3)+Params.Y[8]*sqr(E)*N+Params.Y[9]*E*sqr(N)+Params.Y[10]*Power(N,3);
end;

procedure TViewTransformator.Polynom3RMS_InverseTransform(const X,Y: Extended; out E,N: Extended);
begin
Polynom3RMS_UpdateParams();
//.
E:=Params.E[1]+Params.E[2]*X+Params.E[3]*Y+Params.E[4]*sqr(X)+Params.E[5]*X*Y+Params.E[6]*sqr(Y)+Params.E[7]*Power(X,3)+Params.E[8]*sqr(X)*Y+Params.E[9]*X*sqr(Y)+Params.E[10]*Power(Y,3);
N:=Params.N[1]+Params.N[2]*X+Params.N[3]*Y+Params.N[4]*sqr(X)+Params.N[5]*X*Y+Params.N[6]*sqr(Y)+Params.N[7]*Power(X,3)+Params.N[8]*sqr(X)*Y+Params.N[9]*X*sqr(Y)+Params.N[10]*Power(Y,3);
end;

procedure TViewTransformator.Polynom3RMS_InverseTransformWithCorrection(X,Y: Extended; out E,N: Extended);
var
  _X,_Y: Extended;
begin
Polynom3RMS_InverseTransform(X,Y,{out} E,N);
Polynom3RMS_Transform(E,N,{out} _X,_Y);
X:=X+(X-_X);
Y:=Y+(Y-_Y);
Polynom3RMS_InverseTransform(X,Y,{out} E,N); 
end;

procedure TViewTransformator.Polynom3RMSPrecise_UpdateParams();
{GIS-Lab.info}
var
  PointsNumber: integer;
  XMT,XM,XMM,XMR: TPreciseReal2DArray;
  I,J:byte;
begin
if (Params.Algorithm = vtaPolynom3RMSPrecise) then Exit; //. ->
PointsNumber:=Length(ControlPoints);
if (PointsNumber < 10) then Raise Exception.Create('TViewTransformator.Polynom3RMSPrecise_UpdateParams(): wrong number of control points'); //. =>
{вычисление коэффициентов полинома преобразования E,N => X,Y}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,11);
for I:=1 to PointsNumber do begin
  XM[I,1]:=bfOne();
  XM[I,2]:=bfVal(ControlPoints[I-1].E);
  XM[I,3]:=bfVal(ControlPoints[I-1].N);
  XM[I,4]:=bfSqr(XM[I,2]);
  XM[I,5]:=bfMul(XM[I,2],XM[I,3]);
  XM[I,6]:=bfSqr(XM[I,3]);
  XM[I,7]:=bfPow(XM[I,2],3);
  XM[I,8]:=bfMul(XM[I,4],XM[I,3]);
  XM[I,9]:=bfMul(XM[I,2],XM[I,6]);
  XM[I,10]:=bfPow(XM[I,3],3);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,11,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 10 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (10 x 10)
Precise_MultiplyMatrixes(10,PointsNumber,10, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Precise_Inverse(XMM,10)) then Raise Exception.Create('TViewTransformator.Polynom3RMSPrecise_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (10 x PointsNumber)
Precise_MultiplyMatrixes(10,10,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Precise_X,11); for I:=1 to 10 do Params.Precise_X[I]:=bfZero();
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.Precise_X[I]:=bfAdd(Params.Precise_X[I],bfMul(XMR[I,J],bfVal(ControlPoints[J-1].X)));
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Precise_Y,11); for I:=1 to 10 do Params.Precise_Y[I]:=bfZero();
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.Precise_Y[I]:=bfAdd(Params.Precise_Y[I],bfMul(XMR[I,J],bfVal(ControlPoints[J-1].Y)));
{вычисление коэффициентов полинома преобразования X,Y = > E,N}
//. заполнение матрицы XM
SetLength(XM,PointsNumber+1,11);
for I:=1 to PointsNumber do begin
  XM[I,1]:=bfOne();
  XM[I,2]:=bfVal(ControlPoints[I-1].X);
  XM[I,3]:=bfVal(ControlPoints[I-1].Y);
  XM[I,4]:=bfSqr(XM[I,2]);
  XM[I,5]:=bfMul(XM[I,2],XM[I,3]);
  XM[I,6]:=bfSqr(XM[I,3]);
  XM[I,7]:=bfPow(XM[I,2],3);
  XM[I,8]:=bfMul(XM[I,4],XM[I,3]);
  XM[I,9]:=bfMul(XM[I,2],XM[I,6]);
  XM[I,10]:=bfPow(XM[I,3],3);
  end;
//. заполнение транспонированной матрицы XMT
SetLength(XMT,11,PointsNumber+1);
for I:=1 to PointsNumber do
  for J:=1 to 10 do XMT[J,I]:=XM[I,J];
//. вычисление произведения матриц XMT и XM -> результат матрица XMM размером (10 x 10)
Precise_MultiplyMatrixes(10,PointsNumber,10, XMT,XM,{out} XMM);
//. вычисление обратной матрицы XMM
if (NOT Precise_Inverse(XMM,10)) then Raise Exception.Create('TViewTransformator.Polynom3RMSPrecise_UpdateParams(): invalid control points'); //. =>
//. вычисление произведения матриц XMM и XMT -> результат матрица XMR размером (10 x PointsNumber)
Precise_MultiplyMatrixes(10,10,PointsNumber, XMM,XMT,{out} XMR);
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Precise_E,11); for I:=1 to 10 do Params.Precise_E[I]:=bfZero();
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.Precise_E[I]:=bfAdd(Params.Precise_E[I],bfMul(XMR[I,J],bfVal(ControlPoints[J-1].E)));
//. умножение вектора с результирующей матрицей XMR
SetLength(Params.Precise_N,11); for I:=1 to 10 do Params.Precise_N[I]:=bfZero();
for I:=1 to 10 do
  for J:=1 to PointsNumber do Params.Precise_N[I]:=bfAdd(Params.Precise_N[I],bfMul(XMR[I,J],bfVal(ControlPoints[J-1].N)));
//.
Params.Algorithm:=vtaPolynom3RMSPrecise;
end;

procedure TViewTransformator.Polynom3RMSPrecise_Transform(const E,N: Extended; out X,Y: Extended);
var
  BE,BN: TBigFloat;
  BEP2,BNP2: TBigFloat;
  BEP3,BNP3: TBigFloat;
  BEmulBN: TBigFloat;
  BEP2mulBN: TBigFloat;
  BEmulBNP2: TBigFloat;
begin
Polynom3RMSPrecise_UpdateParams();
//.
BE:=bfVal(E); BN:=bfVal(N);
BEP2:=bfSqr(BE); BNP2:=bfSqr(BN);
BEP3:=bfPow(BE,3); BNP3:=bfPow(BN,3);
BEmulBN:=bfMul(BE,BN);
BEP2mulBN:=bfMul(BEP2,BN);
BEmulBNP2:=bfMul(BE,BNP2);
//.
X:=bfToFloat(Params.Precise_X[1])+bfToFloat(bfMul(Params.Precise_X[2],BE))+bfToFloat(bfMul(Params.Precise_X[3],BN))+bfToFloat(bfMul(Params.Precise_X[4],BEP2))+bfToFloat(bfMul(Params.Precise_X[5],BEmulBN))+bfToFloat(bfMul(Params.Precise_X[6],BNP2))+bfToFloat(bfMul(Params.Precise_X[7],BEP3))+bfToFloat(bfMul(Params.Precise_X[8],BEP2mulBN))+bfToFloat(bfMul(Params.Precise_X[9],BEmulBNP2))+bfToFloat(bfMul(Params.Precise_X[10],BNP3));
Y:=bfToFloat(Params.Precise_Y[1])+bfToFloat(bfMul(Params.Precise_Y[2],BE))+bfToFloat(bfMul(Params.Precise_Y[3],BN))+bfToFloat(bfMul(Params.Precise_Y[4],BEP2))+bfToFloat(bfMul(Params.Precise_Y[5],BEmulBN))+bfToFloat(bfMul(Params.Precise_Y[6],BNP2))+bfToFloat(bfMul(Params.Precise_Y[7],BEP3))+bfToFloat(bfMul(Params.Precise_Y[8],BEP2mulBN))+bfToFloat(bfMul(Params.Precise_Y[9],BEmulBNP2))+bfToFloat(bfMul(Params.Precise_Y[10],BNP3));
end;

procedure TViewTransformator.Polynom3RMSPrecise_InverseTransform(const X,Y: Extended; out E,N: Extended);
var
  BX,BY: TBigFloat;
  BXP2,BYP2: TBigFloat;
  BXP3,BYP3: TBigFloat;
  BXmulBY: TBigFloat;
  BXP2mulBY: TBigFloat;
  BXmulBYP2: TBigFloat;
begin
Polynom3RMSPrecise_UpdateParams();
//.
BX:=bfVal(X); BY:=bfVal(Y);
BXP2:=bfSqr(BX); BYP2:=bfSqr(BY);
BXP3:=bfPow(BX,3); BYP3:=bfPow(BY,3);
BXmulBY:=bfMul(BX,BY);
BXP2mulBY:=bfMul(BXP2,BY);
BXmulBYP2:=bfMul(BX,BYP2);
//.
E:=bfToFloat(Params.Precise_E[1])+bfToFloat(bfMul(Params.Precise_E[2],BX))+bfToFloat(bfMul(Params.Precise_E[3],BY))+bfToFloat(bfMul(Params.Precise_E[4],BXP2))+bfToFloat(bfMul(Params.Precise_E[5],BXmulBY))+bfToFloat(bfMul(Params.Precise_E[6],BYP2))+bfToFloat(bfMul(Params.Precise_E[7],BXP3))+bfToFloat(bfMul(Params.Precise_E[8],BXP2mulBY))+bfToFloat(bfMul(Params.Precise_E[9],BXmulBYP2))+bfToFloat(bfMul(Params.Precise_E[10],BYP3));
N:=bfToFloat(Params.Precise_N[1])+bfToFloat(bfMul(Params.Precise_N[2],BX))+bfToFloat(bfMul(Params.Precise_N[3],BY))+bfToFloat(bfMul(Params.Precise_N[4],BXP2))+bfToFloat(bfMul(Params.Precise_N[5],BXmulBY))+bfToFloat(bfMul(Params.Precise_N[6],BYP2))+bfToFloat(bfMul(Params.Precise_N[7],BXP3))+bfToFloat(bfMul(Params.Precise_N[8],BXP2mulBY))+bfToFloat(bfMul(Params.Precise_N[9],BXmulBYP2))+bfToFloat(bfMul(Params.Precise_N[10],BYP3));
end;


{TCrdSysConvertor}
Constructor TCrdSysConvertor.Create(const pSpace: TProxySpace; const pidCrdSys: integer; const pPointsCount: integer = 2);
var
  flCrdSysInstanceExists: boolean;
  GeoCrdSystemGeoSpaceID: integer;
  GeoCrdSystemName,GeoCrdSystemDatum,GeoCrdSystemProjection: string;
  GeoCrdSystemProjectionData: TMemoryStream;
  idTOwner,idOwner: integer;
begin
Inherited Create;
Space:=pSpace;
idCrdSys:=pidCrdSys;
DatumID:=23; //. WGS-84
ProjectionDATA:=nil;
ViewTransformator:=nil;
MapInfo:=nil;
//. assigning GeoCrdSystem properties
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys)) do
try
try
Check();
flCrdSysInstanceExists:=true;
except
  flCrdSysInstanceExists:=false;
  end;
if (flCrdSysInstanceExists)
 then begin
  //. get working datum
  GetDataLocally(GeoCrdSystemGeoSpaceID,GeoCrdSystemName,GeoCrdSystemDatum,GeoCrdSystemProjection,GeoCrdSystemProjectionData);
  try
  DatumID:=Datums_GetItemByName(GeoCrdSystemDatum);
  if (DatumID = -1) then DatumID:=23; //. WGS-84 ///- Raise Exception.Create('TCrdSysConvertor.Create error: unknown datum'); //. =>
  ProjectionID:=Projections_GetItemByName(GeoCrdSystemProjection);
  if (ProjectionID <> pidUnknown)
   then //. assigning map info
    if (GetOwner(idTOwner,idOwner))
     then begin
      MapInfo:=TMapInfo.GetMapInfo(idTOwner,idOwner);
      if (MapInfo <> nil)
       then begin
        if (GeoCrdSystemProjectionData <> nil)
         then
          case ProjectionID of
          pidTM:        ProjectionDATA:=TTMProjectionDATA.Create(GeoCrdSystemProjectionData);
          pidLCC:       ProjectionDATA:=TLCCProjectionDATA.Create(GeoCrdSystemProjectionData);
          pidEQC:       ProjectionDATA:=TEQCProjectionDATA.Create(GeoCrdSystemProjectionData);
          pidMEP:       ProjectionDATA:=TMPProjectionDATA.Create(GeoCrdSystemProjectionData);
          pidMSP:       ProjectionDATA:=TMPProjectionDATA.Create(GeoCrdSystemProjectionData);
          else
            ProjectionDATA:=nil;
          end
        else ProjectionDATA:=nil;
        //.
        flLinearApproximationCrdSys:=false;
        end
       else flLinearApproximationCrdSys:=true
      end
     else flLinearApproximationCrdSys:=true
   else flLinearApproximationCrdSys:=true;
  finally
  FreeAndNil(GeoCrdSystemProjectionData);
  end;
  end
 else flLinearApproximationCrdSys:=true;
finally
Release;
end;
//.
if (flLinearApproximationCrdSys AND (pPointsCount <> 2)) then Raise Exception.Create('TCrdSysConvertor.Create: wrong number of points for linear approximation'); //. ->
//.
PointsCount:=pPointsCount;
SetLength(GeoToXY_Points,0);
SetLength(XYToGeo_Points,0);
//.
if (NOT flLinearApproximationCrdSys)
 then begin
  GeoToXY_LoadPoints(0,0);
  XYToGeo_LoadPoints(0,0);
  end;
end;

Destructor TCrdSysConvertor.Destroy;
begin
MapInfo.Free;
ViewTransformator.Free;
ProjectionDATA.Free;
Inherited;
end;

function TCrdSysConvertor.ConvertGeoToXY(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;

  procedure ProcessAsDefault(); //. default processing (crd-system not defined - linear approximation crd system)

    procedure ConvertGeoToXY(P0,P1: TGeodesyPointStruct; Lat,Long: Extended;  out Xr,Yr: Extended);
    var
      LatD,LongD: Extended;
      Aspect: Extended;
      dX,dY: Extended;
      dLat,dLong: Extended;
      L,LL: Extended;
      Scale: Extended;
      Alpha,Betta: Extended;
      Angle: Extended;
      TranslateX,TranslateY: Extended;
    begin
    //. get sector aspect
    LatD:=GetDistance(Lat,Long,Lat+1/60{1 minute},Long);
    LongD:=GetDistance(Lat,Long,Lat,Long+1/60{1 minute});
    Aspect:=(LongD/LatD);
    //. do linear geo coordinates
    P0.Longitude:=P0.Longitude*Aspect;
    P1.Longitude:=P1.Longitude*Aspect;
    Long:=Long*Aspect;
    //.
    dX:=(P1.X-P0.X)*cfTransMeter; dY:=(P1.Y-P0.Y)*cfTransMeter;
    dLong:=(P1.Longitude-P0.Longitude); dLat:=(P1.Latitude-P0.Latitude);
    //. transform scale
    L:=sqr(dX)+sqr(dY);
    LL:=sqr(dLong)+sqr(dLat);
    Scale:=Sqrt(L/LL);
    //. transform angle
    if (dX <> 0)
     then begin
      Alpha:=Arctan(dY/dX);
      if (dX < 0)
       then Alpha:=Alpha+PI;
      end
     else
      if (dY >= 0)
       then Alpha:=PI/2
       else Alpha:=-PI/2;
    if (dLong <> 0)
     then begin
      Betta:=Arctan(dLat/dLong);
      if (dLong < 0)
       then Betta:=Betta+PI;
      end
     else
      if (dLat >= 0)
       then Betta:=PI/2
       else Betta:=-PI/2;
    Angle:=(Alpha-Betta);
    //. transform translate
    TranslateX:=P0.X*cfTransMeter; TranslateY:=P0.Y*cfTransMeter;
    RotateByAngleFrom0(TranslateX,TranslateY, (-Angle));
    TranslateX:=(TranslateX-P0.Longitude*Scale); TranslateY:=(TranslateY-P0.Latitude*Scale);
    //. transforming from (Lat;Long) to (X;Y)
    Xr:=TranslateX+Long*Scale; Yr:=TranslateY+Lat*Scale;
    RotateByAngleFrom0(Xr,Yr, Angle);
    Xr:=Xr/cfTransMeter; Yr:=Yr/cfTransMeter;
    end;

  var
    ptrPoint: pointer;
    PC: integer;
    P0,P1: TGeodesyPointStruct;
  begin
  Result:=false;
  if (Length(GeoToXY_Points) > 0)
   then begin
    ptrPoint:=@GeoToXY_Points[0];
    PC:=Integer(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(Integer));
    if (PC <> 2) then Raise Exception.Create('TCrdSysConvertor.ConvertGeoToXY: wrong number of approximation points'); //. =>
    P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
    P1:=TGeodesyPointStruct(ptrPoint^);
    ConvertGeoToXY(P0,P1, Lat,Long, Xr,Yr);
    Result:=true;
    end;
  end;

  procedure ProcessWithMapInfo();

    function GetConversionContainerPoints(const pLat,pLong: Extended; out P0,P1: TGeodesyPointStruct): boolean;
    var
      ptrPoint: pointer;
      PC: integer;
      I: integer;
      P: TGeodesyPointStruct;
      dX,dY: Extended;
      _MaxExtended: Extended;
      Factor,V0__P0_MinFactor,V0__P1_MinFactor,V1__P0_MinFactor,V1__P1_MinFactor: Extended;
      V0_P0,V0_P1,V1_P0,V1_P1: TGeodesyPointStruct;
      V0_Factor,V1_Factor: Extended;
    begin
    Result:=false; 
    if (Length(GeoToXY_Points) > 0)
     then begin
      ptrPoint:=@GeoToXY_Points[0];
      PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
      _MaxExtended:=MaxExtended;
      V0__P0_MinFactor:=_MaxExtended; V0__P1_MinFactor:=_MaxExtended;
      V1__P0_MinFactor:=_MaxExtended; V1__P1_MinFactor:=_MaxExtended;
      for I:=0 to PC-1 do begin
        P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        dX:=(P.Longitude-pLong);
        dY:=(P.Latitude-pLat);
        Factor:=(Sqr(dX)+Sqr(dY));
        if ((dX <= 0) AND (dY <= 0))
         then begin
          if (Factor < V0__P0_MinFactor)
           then begin
            V0__P0_MinFactor:=Factor;
            V0_P0:=P;
            end;
          end
         else
          if ((dX >= 0) AND (dY >= 0))
           then begin
            if (Factor < V0__P1_MinFactor)
             then begin
              V0__P1_MinFactor:=Factor;
              V0_P1:=P;
              end;
            end
           else
            if ((dX <= 0) AND (dY >= 0))
             then begin
              if (Factor < V1__P0_MinFactor)
               then begin
                V1__P0_MinFactor:=Factor;
                V1_P0:=P;
                end;
              end
             else
              if ((dX >= 0) AND (dY <= 0))
               then begin
                if (Factor < V1__P1_MinFactor)
                 then begin
                  V1__P1_MinFactor:=Factor;
                  V1_P1:=P;
                  end;
                end;
        end;
      //.
      if ((V0__P0_MinFactor <> _MaxExtended) AND (V0__P1_MinFactor <> _MaxExtended))
       then V0_Factor:=Sqr(V0_P1.Longitude-V0_P0.Longitude)+Sqr(V0_P1.Latitude-V0_P0.Latitude)
       else V0_Factor:=_MaxExtended;
      if ((V1__P0_MinFactor <> _MaxExtended) AND (V1__P1_MinFactor <> _MaxExtended))
       then V1_Factor:=Sqr(V1_P1.Longitude-V1_P0.Longitude)+Sqr(V1_P1.Latitude-V1_P0.Latitude)
       else V1_Factor:=_MaxExtended;
      if (V1_Factor <= V0_Factor)
       then begin
        if (V1_Factor = _MaxExtended) then Exit; //. ->
        P0:=V1_P0;
        P1:=V1_P1;
        end
       else begin
        P0:=V0_P0;
        P1:=V0_P1;
        end;
      Result:=true;
      end;
    end;

    function GetConversionPoints(const pLat,pLong: Extended; out oP0,oP1: TGeodesyPointStruct): boolean;
    var
      ptrPoint,ptrPairPoint: pointer;
      PC: integer;
      I,J: integer;
      P0,P1: TGeodesyPointStruct;
      dX,dY: Extended;
      flMinFactorIsFound: boolean;
      MinFactor,Factor: Extended;
      MinFactor_P0,MinFactor_P1: TGeodesyPointStruct;
    begin
    Result:=false;
    if (Length(GeoToXY_Points) > 0)
     then begin
      flMinFactorIsFound:=false;
      ptrPoint:=@GeoToXY_Points[0];
      PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
      for I:=0 to PC-1 do begin
        P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        ptrPairPoint:=ptrPoint;
        for J:=I+1 to PC-1 do begin
          P1:=TGeodesyPointStruct(ptrPairPoint^); Inc(DWord(ptrPairPoint),SizeOf(TGeodesyPointStruct));
          dX:=(P1.Longitude-P0.Longitude);
          dY:=(P1.Latitude-P0.Latitude);
          if ((dX*dY) <> 0)
           then begin
            Factor:=(Sqrt(sqr(P0.Longitude-pLong)+sqr(P0.Latitude-pLat))+Sqrt(sqr(P1.Longitude-pLong)+sqr(P1.Latitude-pLat)));
            if ((NOT flMinFactorIsFound) OR (Factor < MinFactor))
             then begin
              MinFactor:=Factor;
              MinFactor_P0:=P0;
              MinFactor_P1:=P1;
              flMinFactorIsFound:=true;
              end;
            end;
          end;
        end;
      if (flMinFactorIsFound)
       then begin
        oP0:=MinFactor_P0;
        oP1:=MinFactor_P1;
        Result:=true;
        end;
      end;
    end;

    procedure ConvertGeoToXY(const P0,P1: TGeodesyPointStruct; const pEasting,pNorthing: Extended;  out Xr,Yr: Extended);
    var
      dX,dY: Extended;
      dNorthing,dEasting: Extended;
      L,LL: Extended;
      Scale: Extended;
      Alpha,Betta: Extended;
      Angle: Extended;
      TranslateX,TranslateY: Extended;
    begin
    dX:=(P1.X-P0.X); dY:=(P0.Y-P1.Y);
    dEasting:=(P1.Longitude-P0.Longitude); dNorthing:=(P1.Latitude-P0.Latitude);
    //. transform scale
    L:=sqr(dX)+sqr(dY);
    LL:=sqr(dEasting)+sqr(dNorthing);
    Scale:=Sqrt(L/LL);
    //. transform angle
    if (dX <> 0)
     then begin
      Alpha:=Arctan(dY/dX);
      if (dX < 0)
       then Alpha:=Alpha+PI;
      end
     else
      if (dY >= 0)
       then Alpha:=PI/2
       else Alpha:=-PI/2;
    if (dEasting <> 0)
     then begin
      Betta:=Arctan(dNorthing/dEasting);
      if (dEasting < 0)
       then Betta:=Betta+PI;
      end
     else
      if (dNorthing >= 0)
       then Betta:=PI/2
       else Betta:=-PI/2;
    Angle:=(Alpha-Betta);
    //. transform translate
    TranslateX:=P0.X; TranslateY:=-P0.Y;
    RotateByAngleFrom0(TranslateX,TranslateY, (-Angle));
    TranslateX:=(TranslateX-P0.Longitude*Scale); TranslateY:=(TranslateY-P0.Latitude*Scale);
    //. transforming from (Northing;Easting) to (X;Y)
    Xr:=TranslateX+pEasting*Scale; Yr:=TranslateY+pNorthing*Scale;
    RotateByAngleFrom0(Xr,Yr, Angle);
    Yr:=-Yr;
    end;

    procedure ProcessAsLatLongProjection(); //. LatLong
    var
      P0,P1: TGeodesyPointStruct;
      PixX,PixY: Extended;
    begin
    Result:=false;
    if (GetConversionContainerPoints(Lat,Long, P0,P1) OR GetConversionPoints(Lat,Long, P0,P1))
     then begin
      PixY:=P0.Y+(Lat-P0.Latitude)*((P1.Y-P0.Y)/(P1.Latitude-P0.Latitude));
      PixX:=P0.X+(Long-P0.Longitude)*((P1.X-P0.X)/(P1.Longitude-P0.Longitude));
      MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
      Result:=true;
      end;
    end;

    procedure ProcessAsTMProjection(); //. TM
    var
      CentralMeridian__TM_Zone: TUTMZone;
      TM_Zone: TUTMZone;
      TM_Easting: Extended;
      TM_Northing: Extended;
      P0,P1: TGeodesyPointStruct;
      PixX,PixY: Extended;
    begin
    Result:=false;
    with TTMProjectionDATA(ProjectionDATA) do
    with TGeoCrdConverter.Create(DatumID) do
    try
    //. get central meridian zone
    LatLongToTM(LatitudeOrigin,CentralMeridian, ScaleFactor,FalseEasting,FalseNorthing,  TM_Easting,TM_Northing,CentralMeridian__TM_Zone);
    //.
    LatLongToTM(Lat,Long, ScaleFactor,FalseEasting,FalseNorthing,  TM_Easting,TM_Northing,TM_Zone);
    finally
    Destroy;
    end;
    //.
    if (TMZoneNumber(CentralMeridian__TM_Zone) <> TMZoneNumber(TM_Zone)) then Exit; //. ->
    //.
    if ((NOT GetConversionContainerPoints(TM_Northing,TM_Easting, P0,P1)) AND (NOT GetConversionPoints(TM_Northing,TM_Easting, P0,P1))) then Exit; //. ->
    ConvertGeoToXY(P0,P1, TM_Easting,TM_Northing,  PixX,PixY);
    MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
    Result:=true;
    end;

    procedure ProcessAsLCCProjection(); //. LCC
    var
      LCC_Easting,LCC_Easting1: Extended;
      LCC_Northing,LCC_Northing1: Extended;
      P0,P1: TGeodesyPointStruct;
      PixX,PixY: Extended;
    begin
    Result:=false;
    with TLCCProjectionDATA(ProjectionDATA) do
    with TGeoCrdConverter.Create(DatumID) do
    try
    LatLongToLCC(Lat,Long, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  LCC_Easting,LCC_Northing);
    //.
    if ((NOT GetConversionContainerPoints(Lat,Long, P0,P1)) AND (NOT GetConversionPoints(Lat,Long, P0,P1))) then Exit; //. ->
    //. convert points to LCC Easting,Northing
    LatLongToLCC(P0.Latitude,P0.Longitude, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  LCC_Easting1,LCC_Northing1);
    P0.Longitude:=LCC_Easting1;
    P0.Latitude:=LCC_Northing1;
    LatLongToLCC(P1.Latitude,P1.Longitude, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  LCC_Easting1,LCC_Northing1);
    P1.Longitude:=LCC_Easting1;
    P1.Latitude:=LCC_Northing1;
    //.
    ConvertGeoToXY(P0,P1, LCC_Easting,LCC_Northing,  PixX,PixY);
    finally
    Destroy;
    end;
    MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
    Result:=true;
    end;

    procedure ProcessAsEQCProjection(); //. EQC

      function GetViewTransformatorControlPoints(const EQCProjectionDATA: TEQCProjectionDATA; const GeoCrdConverter: TGeoCrdConverter; out ControlPoints: TViewTransformatorControlPoints): boolean;
      var
        ptrPoint: pointer;
        PC: integer;
        I: integer;
        P: TGeodesyPointStruct;
        P_Easting,P_Northing: Extended;
      begin
      Result:=false;
      if (Length(GeoToXY_Points) > 0)
       then begin
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        SetLength(ControlPoints,PC);
        for I:=0 to PC-1 do begin
          P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
          GeoCrdConverter.LatLongToEQC(P.Latitude,P.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
          ControlPoints[I].E:=P_Easting; ControlPoints[I].N:=P_Northing;
          ControlPoints[I].X:=P.X; ControlPoints[I].Y:=P.Y;
          end;
        Result:=true;
        end;
      end;

      function GetViewTransformatorControlPointsHexagon(const EQCProjectionDATA: TEQCProjectionDATA; const GeoCrdConverter: TGeoCrdConverter; const Lat,Long: Extended; out ControlPoints: TViewTransformatorControlPoints): boolean;
      type
        TRVectorItem = record
          Dmin: Extended;
          P: TGeodesyPointStruct;
        end;
      var
        ptrPoint: pointer;
        PC: integer;
        I,J,K: integer;
        P,P0: TGeodesyPointStruct;
        D,Dmin: Extended;
        Imin: integer;
        P_Easting,P_Northing: Extended;
        RVector: array [0..4] of TRVectorItem;
      begin
      Result:=false;
      if (Length(GeoToXY_Points) >= 6)
       then begin
        if (Length(GeoToXY_Points) = 6)
         then begin
          Result:=GetViewTransformatorControlPoints(EQCProjectionDATA,GeoCrdConverter,{out} ControlPoints);
          Exit; //. ->
          end;
        SetLength(ControlPoints,6);
        //. находим точку самую ближнюю по угловому расстоянию к данной точке(Lat;Long). Это будет первая точка привязки.
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        Dmin:=MaxExtended;
        for I:=0 to PC-1 do begin
          P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
          D:=sqr(P.Latitude-Lat)+sqr(P.Longitude-Long);
          if (D < Dmin)
           then begin
            Dmin:=D;
            Imin:=I;
            end;
          end;
        //.
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        //.
        P0:=TGeodesyPointStruct(Pointer(Integer(ptrPoint)+Imin*SizeOf(TGeodesyPointStruct))^);
        GeoCrdConverter.LatLongToEQC(P0.Latitude,P0.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
        ControlPoints[0].E:=P_Easting; ControlPoints[0].N:=P_Northing;
        ControlPoints[0].X:=P0.X; ControlPoints[0].Y:=P0.Y;
        //. далее выбираем пять точек ближних к первой точки привязки.
        for I:=0 to Length(RVector)-1 do RVector[I].Dmin:=MaxExtended;
        for I:=0 to PC-1 do
          if (I <> Imin)
           then begin
            P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
            D:=sqr(P.Latitude-P0.Latitude)+sqr(P.Longitude-P0.Longitude);
            for J:=0 to Length(RVector)-1 do
              if (D < RVector[J].Dmin)
               then begin
                for K:=Length(RVector)-2 downto J do RVector[K+1]:=RVector[K];
                RVector[J].Dmin:=D;
                RVector[J].P:=P;
                Break; //. >
                end;
            end
           else Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        for I:=0 to Length(RVector)-1 do begin
          GeoCrdConverter.LatLongToEQC(RVector[I].P.Latitude,RVector[I].P.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
          ControlPoints[I+1].E:=P_Easting; ControlPoints[I+1].N:=P_Northing;
          ControlPoints[I+1].X:=RVector[I].P.X; ControlPoints[I+1].Y:=RVector[I].P.Y;
          end;
        Result:=true;
        end;
      end;

    var
      GeoCrdConverter: TGeoCrdConverter;
      ViewTransformatorControlPoints: TViewTransformatorControlPoints;
      EQC_Easting,EQC_Northing: Extended;
      PixX,PixY: Extended;
    begin
    Result:=false;
    with TEQCProjectionDATA(ProjectionDATA) do begin
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    if (NOT ((ViewTransformator <> nil) AND (ViewTransformator.Params.Algorithm = vtaPolynom3RMS)))
     then begin
      if (NOT GetViewTransformatorControlPoints(TEQCProjectionDATA(ProjectionDATA),GeoCrdConverter,{out} ViewTransformatorControlPoints)) then Exit; //. ->
      FreeAndNil(ViewTransformator);
      ViewTransformator:=TViewTransformator.Create(ViewTransformatorControlPoints);
      end;
    //.
    GeoCrdConverter.LatLongToEQC(Lat,Long, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  EQC_Easting,EQC_Northing);
    //.
    ViewTransformator.Polynom3RMS_Transform(EQC_Easting,EQC_Northing,{out} PixX,PixY);
    finally
    GeoCrdConverter.Destroy;
    end;
    end;
    //.
    MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
    //.
    Result:=true;
    end;

    procedure ProcessAsMEPProjection(); //. MEP
    var
      GeoCrdConverter: TGeoCrdConverter;
      MP_Easting,MP_Northing: Extended;
      a,b: Extended;
      PixX,PixY: Extended;
    begin
    Result:=false;
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    //.
    GeoCrdConverter.LatLongToMP(Lat,Long,{out} MP_Easting,MP_Northing);
    //.
    a:=MapInfo.Size/EquatorLength;
    b:=EquatorLength/2.0;
    PixX:=(b+MP_Easting)*a;
    PixY:=(b-MP_Northing)*a;
    finally
    GeoCrdConverter.Destroy;
    end;
    //.
    MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
    //.
    Result:=true;
    end;

    procedure ProcessAsMSPProjection(); //. MEP
    var
      GeoCrdConverter: TGeoCrdConverter;
      MP_Easting,MP_Northing: Extended;
      a,b: Extended;
      PixX,PixY: Extended;
    begin
    Result:=false;
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    //.
    GeoCrdConverter.LatLongToSphereMP(Lat,Long,{out} MP_Easting,MP_Northing);
    //.
    a:=MapInfo.Size/EquatorLength;
    b:=EquatorLength/2.0;
    PixX:=(b+MP_Easting)*a;
    PixY:=(b-MP_Northing)*a;
    finally
    GeoCrdConverter.Destroy;
    end;
    //.
    MapInfo.ConvertPixPosToXY(PixX,PixY, Xr,Yr);
    //.
    Result:=true;
    end;

  begin
  case ProjectionID of
  pidLatLong:   ProcessAsLatLongProjection();
  pidTM:        ProcessAsTMProjection();
  pidLCC:       ProcessAsLCCProjection();
  pidEQC:       ProcessAsEQCProjection();
  pidMEP:       ProcessAsMEPProjection();
  pidMSP:       ProcessAsMSPProjection();
  end;
  end;

begin
if (flLinearApproximationCrdSys)
 then ProcessAsDefault()
 else ProcessWithMapInfo();
end;

function TCrdSysConvertor.ConvertXYToGeo(const X,Y: Extended; out Lat,Long: Extended): boolean;

  procedure ProcessAsDefault(); //. default processing (crd-system not defined - linear approximation crd system)

    procedure ConvertXYToGeo(P0,P1: TGeodesyPointStruct; X,Y: Extended; out Lat,Long: Extended);
    var
      LatD,LongD: Extended;
      Aspect: Extended;
      dX,dY: Extended;
      dLat,dLong: Extended;
      L,LL: Extended;
      Scale: Extended;
      Alpha,Betta: Extended;
      Angle: Extended;
      TranslateX,TranslateY: Extended;
    begin
    //. get sector aspect
    LatD:=GetDistance(P0.Latitude,P0.Longitude,P0.Latitude+1/60{1 minute},P0.Longitude);
    LongD:=GetDistance(P0.Latitude,P0.Longitude,P0.Latitude,P0.Longitude+1/60{1 minute});
    Aspect:=(LongD/LatD);
    //. do linear geo coordinates
    P0.Longitude:=P0.Longitude*Aspect;
    P1.Longitude:=P1.Longitude*Aspect;
    //.
    dX:=(P1.X-P0.X)*cfTransMeter; dY:=(P1.Y-P0.Y)*cfTransMeter;
    dLong:=(P1.Longitude-P0.Longitude); dLat:=(P1.Latitude-P0.Latitude);
    //. transform scale
    L:=sqr(dX)+sqr(dY);
    LL:=sqr(dLong)+sqr(dLat);
    Scale:=Sqrt(LL/L);
    //. transform angle
    if (dX <> 0)
     then begin
      Alpha:=Arctan(dY/dX);
      if (dX < 0)
       then Alpha:=Alpha+PI;
      end
     else
      if (dY >= 0)
       then Alpha:=PI/2
       else Alpha:=-PI/2;
    if (dLong <> 0)
     then begin
      Betta:=Arctan(dLat/dLong);
      if (dLong < 0)
       then Betta:=Betta+PI;
      end
     else
      if (dLat >= 0)
       then Betta:=PI/2
       else Betta:=-PI/2;
    Angle:=(Betta-Alpha);
    //. transform translate
    TranslateX:=P0.Longitude; TranslateY:=P0.Latitude;
    RotateByAngleFrom0(TranslateX,TranslateY, (-Angle));
    TranslateX:=(TranslateX-(P0.X*cfTransMeter)*Scale); TranslateY:=(TranslateY-(P0.Y*cfTransMeter)*Scale);
    //. transforming from (Lat;Long) to (X;Y)
    X:=X*cfTransMeter; Y:=Y*cfTransMeter;
    Long:=TranslateX+X*Scale; Lat:=TranslateY+Y*Scale;
    RotateByAngleFrom0(Long,Lat, Angle);
    Long:=Long/Aspect; 
    end;

  var
    ptrPoint: pointer;
    PC: integer;
    P0,P1: TGeodesyPointStruct;
  begin
  Result:=false;
  if (Length(XYToGeo_Points) > 0)
   then begin
    ptrPoint:=@XYToGeo_Points[0];
    PC:=Integer(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(Integer));
    if (PC <> 2) then Raise Exception.Create('TCrdSysConvertor.ConvertXYToGeo: wrong number of approximation points'); //. =>
    P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
    P1:=TGeodesyPointStruct(ptrPoint^);
    ConvertXYToGeo(P0,P1, X,Y, Lat,Long);
    Result:=true;
    end;
  end;

  procedure ProcessWithMapInfo();

    function GetConversionContainerPoints(const pX,pY: Extended; out P0,P1: TGeodesyPointStruct): boolean;
    var
      ptrPoint: pointer;
      PC: integer;
      I: integer;
      P: TGeodesyPointStruct;
      dX,dY: Extended;
      _MaxExtended: Extended;
      Factor,V0__P0_MinFactor,V0__P1_MinFactor,V1__P0_MinFactor,V1__P1_MinFactor: Extended;
      V0_P0,V0_P1,V1_P0,V1_P1: TGeodesyPointStruct;
      V0_Factor,V1_Factor: Extended;
    begin
    Result:=false;
    if (Length(GeoToXY_Points) > 0)
     then begin
      ptrPoint:=@GeoToXY_Points[0];
      PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
      _MaxExtended:=MaxExtended;
      V0__P0_MinFactor:=_MaxExtended; V0__P1_MinFactor:=_MaxExtended;
      V1__P0_MinFactor:=_MaxExtended; V1__P1_MinFactor:=_MaxExtended;
      for I:=0 to PC-1 do begin
        P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        dX:=(P.X-pX);
        dY:=(P.Y-pY);
        Factor:=(Sqr(dX)+Sqr(dY));
        if ((dX <= 0) AND (dY <= 0))
         then begin
          if (Factor < V0__P0_MinFactor)
           then begin
            V0__P0_MinFactor:=Factor;
            V0_P0:=P;
            end;
          end
         else
          if ((dX >= 0) AND (dY >= 0))
           then begin
            if (Factor < V0__P1_MinFactor)
             then begin
              V0__P1_MinFactor:=Factor;
              V0_P1:=P;
              end;
            end
           else
            if ((dX <= 0) AND (dY >= 0))
             then begin
              if (Factor < V1__P0_MinFactor)
               then begin
                V1__P0_MinFactor:=Factor;
                V1_P0:=P;
                end;
              end
             else
              if ((dX >= 0) AND (dY <= 0))
               then begin
                if (Factor < V1__P1_MinFactor)
                 then begin
                  V1__P1_MinFactor:=Factor;
                  V1_P1:=P;
                  end;
                end;
        end;
      //.
      if ((V0__P0_MinFactor <> _MaxExtended) AND (V0__P1_MinFactor <> _MaxExtended))
       then V0_Factor:=Sqr(V0_P1.X-V0_P0.X)+Sqr(V0_P1.Y-V0_P0.Y)
       else V0_Factor:=_MaxExtended;
      if ((V1__P0_MinFactor <> _MaxExtended) AND (V1__P1_MinFactor <> _MaxExtended))
       then V1_Factor:=Sqr(V1_P1.X-V1_P0.X)+Sqr(V1_P1.Y-V1_P0.Y)
       else V1_Factor:=_MaxExtended;
      if (V0_Factor <= V1_Factor)
       then begin
        if (V0_Factor = _MaxExtended) then Exit; //. ->
        P0:=V0_P0;
        P1:=V0_P1;
        end
       else begin
        P0:=V1_P0;
        P1:=V1_P1;
        end;
      Result:=true;
      end;
    end;

    function GetConversionPoints(const pX,pY: Extended; out oP0,oP1: TGeodesyPointStruct): boolean;
    var
      ptrPoint,ptrPairPoint: pointer;
      PC: integer;
      I,J: integer;
      P0,P1: TGeodesyPointStruct;
      dX,dY: Extended;
      flMinFactorIsFound: boolean;
      MinFactor,Factor: Extended;
      MinFactor_P0,MinFactor_P1: TGeodesyPointStruct;
    begin
    Result:=false;
    if (Length(XYToGeo_Points) > 0)
     then begin
      flMinFactorIsFound:=false;
      ptrPoint:=@XYToGeo_Points[0];
      PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
      for I:=0 to PC-1 do begin
        P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        ptrPairPoint:=ptrPoint;
        for J:=I+1 to PC-1 do begin
          P1:=TGeodesyPointStruct(ptrPairPoint^); Inc(DWord(ptrPairPoint),SizeOf(TGeodesyPointStruct));
          dX:=(P1.X-P0.X);
          dY:=(P1.Y-P0.Y);
          if ((dX*dY) <> 0)
           then begin
            Factor:=(Sqrt(sqr(P0.X-pX)+sqr(P0.Y-pY))+Sqrt(sqr(P1.X-pX)+sqr(P1.Y-pY)));
            if ((NOT flMinFactorIsFound) OR (Factor < MinFactor))
             then begin
              MinFactor:=Factor;
              MinFactor_P0:=P0;
              MinFactor_P1:=P1;
              flMinFactorIsFound:=true;
              end;
            end;
          end;
        end;
      if (flMinFactorIsFound)
       then begin
        oP0:=MinFactor_P0;
        oP1:=MinFactor_P1;
        Result:=true;
        end;
      end;
    end;

    procedure ConvertXYToGeo(const P0,P1: TGeodesyPointStruct; const pX,pY: Extended;  out Easting,Northing: Extended);
    var
      dX,dY: Extended;
      dNorthing,dEasting: Extended;
      L,LL: Extended;
      Scale: Extended;
      Alpha,Betta: Extended;
      Angle: Extended;
      TranslateX,TranslateY: Extended;
    begin
    dX:=(P1.X-P0.X); dY:=(P0.Y-P1.Y);
    dEasting:=(P1.Longitude-P0.Longitude); dNorthing:=(P1.Latitude-P0.Latitude);
    //. transform scale
    L:=sqr(dX)+sqr(dY);
    LL:=sqr(dEasting)+sqr(dNorthing);
    Scale:=Sqrt(LL/L);
    //. transform angle
    if (dX <> 0)
     then begin
      Alpha:=Arctan(dY/dX);
      if (dX < 0)
       then Alpha:=Alpha+PI;
      end
     else
      if (dY >= 0)
       then Alpha:=PI/2
       else Alpha:=-PI/2;
    if (dEasting <> 0)
     then begin
      Betta:=Arctan(dNorthing/dEasting);
      if (dEasting < 0)
       then Betta:=Betta+PI;
      end
     else
      if (dNorthing >= 0)
       then Betta:=PI/2
       else Betta:=-PI/2;
    Angle:=(Betta-Alpha);
    //. transform translate
    TranslateX:=P0.Longitude; TranslateY:=P0.Latitude;
    RotateByAngleFrom0(TranslateX,TranslateY, (-Angle));
    TranslateX:=(TranslateX-P0.X*Scale); TranslateY:=(TranslateY+P0.Y*Scale);
    //. transforming from (X;Y) to (Northing;Easting)
    Easting:=TranslateX+pX*Scale; Northing:=TranslateY-pY*Scale;
    RotateByAngleFrom0(Easting,Northing, Angle);
    end;


    procedure ProcessAsLatLongProjection(); //. LatLong
    var
      PixX,PixY: Extended;
      P0,P1: TGeodesyPointStruct;
    begin
    Result:=false;
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    if (GetConversionContainerPoints(PixX,PixY, P0,P1) OR GetConversionPoints(PixX,PixY, P0,P1))
     then begin
      Lat:=P0.Latitude+(PixY-P0.Y)*((P1.Latitude-P0.Latitude)/(P1.Y-P0.Y));
      Long:=P0.Longitude+(PixX-P0.X)*((P1.Longitude-P0.Longitude)/(P1.X-P0.X));
      Result:=true;
      end;
    end;

    procedure ProcessAsTMProjection(); //. TM
    var
      TM_Zone: TUTMZone;
      TM_Easting: Extended;
      TM_Northing: Extended;
      CentralMeridian__TM_Easting: Extended;
      CentralMeridian__TM_Northing: Extended;
      P0,P1: TGeodesyPointStruct;
      PixX,PixY: Extended;
    begin
    Result:=false;
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    if ((NOT GetConversionContainerPoints(PixX,PixY, P0,P1)) AND (NOT GetConversionPoints(PixX,PixY, P0,P1))) then Exit; //. ->
    ConvertXYToGeo(P0,P1, PixX,PixY, TM_Easting,TM_Northing);
    //.
    with TTMProjectionDATA(ProjectionDATA) do
    with TGeoCrdConverter.Create(DatumID) do
    try
    //. get central meridian zone
    LatLongToTM(LatitudeOrigin,CentralMeridian, ScaleFactor,FalseEasting,FalseNorthing,  CentralMeridian__TM_Easting,CentralMeridian__TM_Northing,TM_Zone);
    //.
    TMToLatLong(TM_Easting,TM_Northing,TM_Zone, ScaleFactor,FalseEasting,FalseNorthing,  Lat,Long);
    finally
    Destroy;
    end;
    //.
    //.
    Result:=true;
    end;

    procedure ProcessAsLCCProjection(); //. LCC
    var
      LCC_Easting: Extended;
      LCC_Northing: Extended;
      P0,P1: TGeodesyPointStruct;
      PixX,PixY: Extended;
    begin
    Result:=false;
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    if ((NOT GetConversionContainerPoints(PixX,PixY, P0,P1)) AND (NOT GetConversionPoints(PixX,PixY, P0,P1))) then Exit; //. ->
    //.
    with TLCCProjectionDATA(ProjectionDATA) do
    with TGeoCrdConverter.Create(DatumID) do
    try
    //. convert points to LCC Easting,Northing
    LatLongToLCC(P0.Latitude,P0.Longitude, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  LCC_Easting,LCC_Northing);
    P0.Longitude:=LCC_Easting;
    P0.Latitude:=LCC_Northing;
    LatLongToLCC(P1.Latitude,P1.Longitude, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  LCC_Easting,LCC_Northing);
    P1.Longitude:=LCC_Easting;
    P1.Latitude:=LCC_Northing;
    //.
    ConvertXYToGeo(P0,P1, PixX,PixY, LCC_Easting,LCC_Northing);
    //.
    LCCToLatLong(LCC_Easting,LCC_Northing, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  Lat,Long);
    finally
    Destroy;
    end;
    //.
    //.
    Result:=true;
    end;

    procedure ProcessAsEQCProjection(); //. EQC

      function GetViewTransformatorControlPoints(const EQCProjectionDATA: TEQCProjectionDATA; const GeoCrdConverter: TGeoCrdConverter; out ControlPoints: TViewTransformatorControlPoints): boolean;
      var
        ptrPoint: pointer;
        PC: integer;
        I: integer;
        P: TGeodesyPointStruct;
        P_Easting,P_Northing: Extended;
      begin
      Result:=false;
      if (Length(GeoToXY_Points) > 0)
       then begin
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        SetLength(ControlPoints,PC);
        for I:=0 to PC-1 do begin
          P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
          GeoCrdConverter.LatLongToEQC(P.Latitude,P.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
          ControlPoints[I].E:=P_Easting; ControlPoints[I].N:=P_Northing;
          ControlPoints[I].X:=P.X; ControlPoints[I].Y:=P.Y;
          end;
        Result:=true;
        end;
      end;

      function GetViewTransformatorControlPointsHexagon(const EQCProjectionDATA: TEQCProjectionDATA; const GeoCrdConverter: TGeoCrdConverter; const X,Y: Extended; out ControlPoints: TViewTransformatorControlPoints): boolean;
      type
        TRVectorItem = record
          Dmin: Extended;
          P: TGeodesyPointStruct;
        end;
      var
        ptrPoint: pointer;
        PC: integer;
        I,J,K: integer;
        P,P0: TGeodesyPointStruct;
        D,Dmin: Extended;
        Imin: integer;
        P_Easting,P_Northing: Extended;
        RVector: array [0..4] of TRVectorItem;
      begin
      Result:=false;
      if (Length(GeoToXY_Points) >= 6)
       then begin
        if (Length(GeoToXY_Points) = 6)
         then begin
          Result:=GetViewTransformatorControlPoints(EQCProjectionDATA,GeoCrdConverter,{out} ControlPoints);
          Exit; //. ->
          end;
        SetLength(ControlPoints,6);
        //. находим точку самую ближнюю по угловому расстоянию к данной точке(X;Y). Это будет первая точка привязки.
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        Dmin:=MaxExtended;
        for I:=0 to PC-1 do begin
          P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
          D:=sqr(P.X-X)+sqr(P.Y-Y);
          if (D < Dmin)
           then begin
            Dmin:=D;
            Imin:=I;
            end;
          end;
        //.
        ptrPoint:=@GeoToXY_Points[0];
        PC:=Integer(ptrPoint^); Inc(Integer(ptrPoint),SizeOf(PC));
        //.
        P0:=TGeodesyPointStruct(Pointer(Integer(ptrPoint)+Imin*SizeOf(TGeodesyPointStruct))^);
        GeoCrdConverter.LatLongToEQC(P0.Latitude,P0.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
        ControlPoints[0].E:=P_Easting; ControlPoints[0].N:=P_Northing;
        ControlPoints[0].X:=P0.X; ControlPoints[0].Y:=P0.Y;
        //. далее выбираем пять точек ближних к первой точки привязки.
        for I:=0 to Length(RVector)-1 do RVector[I].Dmin:=MaxExtended;
        for I:=0 to PC-1 do
          if (I <> Imin)
           then begin
            P:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
            D:=sqr(P.X-P0.X)+sqr(P.Y-P0.Y);
            for J:=0 to Length(RVector)-1 do
              if (D < RVector[J].Dmin)
               then begin
                for K:=Length(RVector)-2 downto J do RVector[K+1]:=RVector[K];
                RVector[J].Dmin:=D;
                RVector[J].P:=P;
                Break; //. >
                end;
            end
           else Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
        for I:=0 to Length(RVector)-1 do begin
          GeoCrdConverter.LatLongToEQC(RVector[I].P.Latitude,RVector[I].P.Longitude, EQCProjectionDATA.LatOfOrigin,EQCProjectionDATA.LongOfOrigin,EQCProjectionDATA.FirstStdParallel,EQCProjectionDATA.SecondStdParallel,EQCProjectionDATA.FalseEasting,EQCProjectionDATA.FalseNorthing,{out} P_Easting,P_Northing);
          ControlPoints[I+1].E:=P_Easting; ControlPoints[I+1].N:=P_Northing;
          ControlPoints[I+1].X:=RVector[I].P.X; ControlPoints[I+1].Y:=RVector[I].P.Y;
          end;
        Result:=true;
        end;
      end;

    var
      GeoCrdConverter: TGeoCrdConverter;
      ViewTransformatorControlPoints: TViewTransformatorControlPoints;
      EQC_Easting,EQC_Northing: Extended;
      PixX,PixY: Extended;
    begin
    Result:=false;
    //.
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    //.
    with TEQCProjectionDATA(ProjectionDATA) do begin
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    if (NOT ((ViewTransformator <> nil) AND (ViewTransformator.Params.Algorithm = vtaPolynom3RMS)))
     then begin
      if (NOT GetViewTransformatorControlPoints(TEQCProjectionDATA(ProjectionDATA),GeoCrdConverter,{out} ViewTransformatorControlPoints)) then Exit; //. ->
      FreeAndNil(ViewTransformator);
      ViewTransformator:=TViewTransformator.Create(ViewTransformatorControlPoints);
      end;
    //.
    ViewTransformator.Polynom3RMS_InverseTransformWithCorrection(PixX,PixY,{out} EQC_Easting,EQC_Northing);
    //.
    GeoCrdConverter.EQCToLatLong(EQC_Easting,EQC_Northing, LatOfOrigin,LongOfOrigin,FirstStdParallel,SecondStdParallel,FalseEasting,FalseNorthing,  Lat,Long);
    finally
    GeoCrdConverter.Destroy;
    end;
    end;
    //.
    Result:=true;
    end;

    procedure ProcessAsMEPProjection(); //. MEP
    var
      GeoCrdConverter: TGeoCrdConverter;
      PixX,PixY: Extended;
      a,b: Extended;
      MP_Easting,MP_Northing: Extended;
    begin
    Result:=false;
    //.
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    //.
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    a:=MapInfo.Size/EquatorLength;
    b:=EquatorLength/2.0;
    MP_Easting:=PixX/a-b;
    MP_Northing:=b-PixY/a;
    //.
    GeoCrdConverter.MPToLatLong(MP_Easting,MP_Northing, {out} Lat,Long);
    finally
    GeoCrdConverter.Destroy;
    end;
    //.
    Result:=true;
    end;

    procedure ProcessAsMSPProjection(); //. MSP
    var
      GeoCrdConverter: TGeoCrdConverter;
      PixX,PixY: Extended;
      a,b: Extended;
      MP_Easting,MP_Northing: Extended;
    begin
    Result:=false;
    //.
    MapInfo.ConvertXYToPixPos(X,Y, PixX,PixY);
    //.
    GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
    try
    a:=MapInfo.Size/EquatorLength;
    b:=EquatorLength/2.0;
    MP_Easting:=PixX/a-b;
    MP_Northing:=b-PixY/a;
    //.
    GeoCrdConverter.SphereMPToLatLong(MP_Easting,MP_Northing, {out} Lat,Long);
    finally
    GeoCrdConverter.Destroy;
    end;
    //.
    Result:=true;
    end;

  begin
  case ProjectionID of
  pidLatLong:   ProcessAsLatLongProjection();
  pidTM:        ProcessAsTMProjection();
  pidLCC:       ProcessAsLCCProjection();
  pidEQC:       ProcessAsEQCProjection();
  pidMEP:       ProcessAsMEPProjection();
  pidMSP:       ProcessAsMSPProjection();
  end;
  end;

begin
if (flLinearApproximationCrdSys)
 then ProcessAsDefault()
 else ProcessWithMapInfo();
end;

function TCrdSysConvertor.GeoToXY_LoadPoints(const pLat,pLong: double): boolean;

  procedure ProcessAsDefault(); //. default processing (crd-system not defined - linear approximation crd system)
  var
    BA: TByteArray;
  begin
  Result:=false;
  with TTGeodesyPointFunctionality.Create do
  try
  if (NOT CrdSys_GetNearestGeoPoints(idCrdSys, pLat,pLong, PointsCount, BA)) then Exit; //. ->
  GeoToXY_Points:=BA;
  GeoToXY_Points_Lat:=pLat;
  GeoToXY_Points_Long:=pLong;
  Result:=true;
  finally
  Release;
  end;
  end;

  procedure ProcessWithMapInfo(); 
  begin
  Result:=false;
  if (Length(GeoToXY_Points) > 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys)) do
  try
  GetGeodesyPointsLocally(GeoToXY_Points);
  GeoToXY_Points_Lat:=pLat;
  GeoToXY_Points_Long:=pLong;
  Result:=true;
  finally
  Release;
  end;
  end;

begin
if (flLinearApproximationCrdSys)
 then ProcessAsDefault()
 else ProcessWithMapInfo();
end;                                        

function TCrdSysConvertor.XYToGeo_LoadPoints(const pX,pY: double): boolean;

  procedure ProcessAsDefault(); //. default processing (crd-system not defined - linear approximation crd system)
  var
    BA: TByteArray;
  begin
  Result:=false;
  with TTGeodesyPointFunctionality.Create do
  try
  if (NOT CrdSys_GetNearestXYPoints(idCrdSys, pX,pY, PointsCount, BA)) then Exit; //. ->
  XYToGeo_Points:=BA;
  XYToGeo_Points_X:=pX;
  XYToGeo_Points_Y:=pY;
  Result:=true;
  finally
  Release;
  end;
  end;

  procedure ProcessWithMapInfo();
  begin
  Result:=false;
  if (Length(XYToGeo_Points) > 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys)) do
  try
  GetGeodesyPointsLocally(XYToGeo_Points);
  XYToGeo_Points_X:=pX;
  XYToGeo_Points_Y:=pY;
  Result:=true;
  finally
  Release;
  end;
  end;

begin
if (flLinearApproximationCrdSys)
 then ProcessAsDefault()
 else ProcessWithMapInfo();
end;

function TCrdSysConvertor.LinearApproximationCrdSys_XYIsOutOfApproximationZone(const pX,pY: Extended): boolean;
var
  ptrPoint: pointer;
  PC: integer;
  P0,P1: TGeodesyPointStruct;
begin
if (NOT flLinearApproximationCrdSys) then Raise Exception.Create('XYIsOutOfApproximationZone: crd system is not a linear approximation'); //. =>
if (Length(XYToGeo_Points) = 0) then Raise Exception.Create('XYIsOutOfApproximationZone: processing points are not loaded'); //. =>
ptrPoint:=@XYToGeo_Points[0];
PC:=Integer(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(Integer));
if (PC <> 2) then Raise Exception.Create('XYIsOutOfApproximationZone: number of approximation points are not equal to 2'); //. =>
P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
P1:=TGeodesyPointStruct(ptrPoint^);
Result:=(NOT ((((pX-P0.X)*(pX-P1.X)) <= 0) AND (((pY-P0.Y)*(pY-P1.Y)) <= 0)));
end;

function TCrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(const pLat,pLong: Extended): boolean;
var
  ptrPoint: pointer;
  PC: integer;
  P0,P1: TGeodesyPointStruct;
begin
if (NOT flLinearApproximationCrdSys) then Raise Exception.Create('LLIsOutOfApproximationZone: crd system is not a linear approximation'); //. =>
if (Length(GeoToXY_Points) = 0) then Raise Exception.Create('LLIsOutOfApproximationZone: processing points are not loaded'); //. =>
ptrPoint:=@GeoToXY_Points[0];
PC:=Integer(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(Integer));
if (PC <> 2) then Raise Exception.Create('LLIsOutOfApproximationZone: number of approximation points are not equal to 2'); //. =>
P0:=TGeodesyPointStruct(ptrPoint^); Inc(DWord(ptrPoint),SizeOf(TGeodesyPointStruct));
P1:=TGeodesyPointStruct(ptrPoint^);
Result:=(NOT ((((pLat-P0.Latitude)*(pLat-P1.Latitude)) <= 0) AND (((pLong-P0.Longitude)*(pLong-P1.Longitude)) <= 0)));
end;

function TCrdSysConvertor.GetDistance(const StartLat,StartLong: Extended; const EndLat,EndLong: Extended): Extended;
begin
//. calculate distance on ellipsoide
with TGeoCrdConverter.Create(DatumID) do
try
Result:=GetDistance(StartLat,StartLong, EndLat,EndLong);
finally
Destroy;
end;
end;

procedure TCrdSysConvertor.RotateByAngleFrom0(var X,Y: Extended; const Angle: Extended);
var
  Xbind,Ybind: Extended;
  _X,_Y: Extended;
begin
Xbind:=0; Ybind:=0;
_X:=Xbind+(X-Xbind)*Cos(Angle)+(Y-Ybind)*(-Sin(Angle));
_Y:=Ybind+(X-Xbind)*Sin(Angle)+(Y-Ybind)*Cos(Angle);
X:=_X; Y:=_Y;
end;

Initialization
//. set BigFloat precision to 10*9.6 ~= 96 digits
BigFloat.SetPrecision(10);

Finalization

end.
