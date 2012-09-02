unit unitTrackCalibration;
Interface
Uses
  SysUtils,
  Classes,
  Graphics;

//. Datums
Type
  TEllipsoid = record
    ID: integer;
    ellipsoidName: string;
    EquatorialRadius: Extended;
    eccentricitySquared: Extended;
  end;

Const //. well-known ellipsoids definition
  EllipsoidsCount = 23;
  Ellipsoids: array[0..EllipsoidsCount-1] of TEllipsoid = (
    (ID: 1;     ellipsoidName: 'Airy';                  EquatorialRadius: 6377563.0;    eccentricitySquared: 0.00667054),
    (ID: 2;     ellipsoidName: 'Australian National';   EquatorialRadius: 6378160.0;    eccentricitySquared: 0.006694542),
    (ID: 3;     ellipsoidName: 'Bessel 1841';           EquatorialRadius: 6377397.0;    eccentricitySquared: 0.006674372),
    (ID: 4;     ellipsoidName: 'Bessel 1841 (Nambia)';  EquatorialRadius: 6377484.0;    eccentricitySquared: 0.006674372),
    (ID: 5;     ellipsoidName: 'Clarke 1866';           EquatorialRadius: 6378206.0;    eccentricitySquared: 0.006768658),
    (ID: 6;     ellipsoidName: 'Clarke 1880';           EquatorialRadius: 6378249.0;    eccentricitySquared: 0.006803511),
    (ID: 7;     ellipsoidName: 'Everest';               EquatorialRadius: 6377276.0;    eccentricitySquared: 0.006637847),
    (ID: 8;     ellipsoidName: 'Fischer 1960 (Mercury)';EquatorialRadius: 6378166.0;    eccentricitySquared: 0.006693422),
    (ID: 9;     ellipsoidName: 'Fischer 1968';          EquatorialRadius: 6378150.0;    eccentricitySquared: 0.006693422),
    (ID: 10;    ellipsoidName: 'GRS 1967';              EquatorialRadius: 6378160.0;    eccentricitySquared: 0.006694605),
    (ID: 11;    ellipsoidName: 'GRS 1980';              EquatorialRadius: 6378137.0;    eccentricitySquared: 0.00669438),
    (ID: 12;    ellipsoidName: 'Helmert 1906';          EquatorialRadius: 6378200.0;    eccentricitySquared: 0.006693422),
    (ID: 13;    ellipsoidName: 'Hough';                 EquatorialRadius: 6378270.0;    eccentricitySquared: 0.00672267),
    (ID: 14;    ellipsoidName: 'International';         EquatorialRadius: 6378388.0;    eccentricitySquared: 0.00672267),
    (ID: 15;    ellipsoidName: 'Krassovsky';            EquatorialRadius: 6378245.0;    eccentricitySquared: 0.006693422),
    (ID: 16;    ellipsoidName: 'Modified Airy';         EquatorialRadius: 6377340.0;    eccentricitySquared: 0.00667054),
    (ID: 17;    ellipsoidName: 'Modified Everest';      EquatorialRadius: 6377304.0;    eccentricitySquared: 0.006637847),
    (ID: 18;    ellipsoidName: 'Modified Fischer 1960'; EquatorialRadius: 6378155.0;    eccentricitySquared: 0.006693422),
    (ID: 19;    ellipsoidName: 'South American 1969';   EquatorialRadius: 6378160.0;    eccentricitySquared: 0.006694542),
    (ID: 20;    ellipsoidName: 'WGS 60';                EquatorialRadius: 6378165.0;    eccentricitySquared: 0.006693422),
    (ID: 21;    ellipsoidName: 'WGS 66';                EquatorialRadius: 6378145.0;    eccentricitySquared: 0.006694542),
    (ID: 22;    ellipsoidName: 'WGS-72';                EquatorialRadius: 6378135.0;    eccentricitySquared: 0.006694318),
    (ID: 23;    ellipsoidName: 'WGS-84';                EquatorialRadius: 6378137.0;    eccentricitySquared: 0.00669438)
  );

  
type
  TTrackItem = packed record
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Precision: double;
  end;

  TTrackCalibration = class
  public
    Track: array of TTrackItem;
    CalibrationVisualization_idTVisualization: integer;
    CalibrationVisualization_idVisualization: integer;
    CalibrationVisualizationPoint_Index: integer;
    CalibrationGeodesyEllipsoid: integer;
    CalibrationGeodesyPointPrototypeID: integer;
    CalibrationCrdSystemID: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure LoadTrackFromFile(const FileName: string);
    procedure SetVisualization(const idTVisualization,idVisualization: integer);
    procedure GetTrackMinMax(out minLong,minLat: double; out maxLong,maxLat: double);
    procedure GetTrackLength(out TrackLength: double);
    procedure DoCalibrate;
  end;

Implementation
Uses
  Math,
  GlobalSpaceDefines,
  FunctionalityImport;


{get distance between 2 geo points at zero altitude}
function Geo_GetDistance(const EllipsoidID: integer; const StartLat,StartLong: Extended; const EndLat,EndLong: Extended): Extended;
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
  Result:=MaxExtended;
  Exit; //. =>
  end;
//.
a:=Ellipsoids[EllipsoidID].EquatorialRadius;
eccSquared:=Ellipsoids[EllipsoidID].eccentricitySquared;
e2:=(eccSquared)/(1.0-eccSquared);
// Вычисляем разницу между двумя долготами и широтами и получаем среднюю широту
fdLambda := (StartLong - EndLong) * D2R;
fdPhi := (StartLat - EndLat) * D2R;
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


{TTrackCalibration}
Constructor TTrackCalibration.Create;
begin
Inherited Create;
Track:=nil;
CalibrationVisualization_idTVisualization:=0;
CalibrationVisualization_idVisualization:=0;
CalibrationVisualizationPoint_Index:=-1;
CalibrationGeodesyEllipsoid:=-1;
CalibrationGeodesyPointPrototypeID:=0;
CalibrationCrdSystemID:=0;
end;

Destructor TTrackCalibration.Destroy;
begin
Inherited;
end;

procedure TTrackCalibration.Clear;
begin
SetLength(Track,0);
CalibrationVisualization_idTVisualization:=0;
CalibrationVisualization_idVisualization:=0;
CalibrationVisualizationPoint_Index:=-1;
CalibrationGeodesyPointPrototypeID:=0;
CalibrationCrdSystemID:=0;
end;

procedure TTrackCalibration.LoadTrackFromFile(const FileName: string);
var
  MS: TMemoryStream;
  ItemsCount: integer;
  I: integer;
  TrackItem: TTrackItem;
begin
Clear;
MS:=TMemoryStream.Create;
try
MS.LoadFromFile(FileName);
ItemsCount:=(MS.Size DIV SizeOf(TTrackItem));
SetLength(Track,ItemsCount);
for I:=0 to (ItemsCount-1) do begin
  MS.Read(TrackItem,SizeOf(TrackItem));
  Track[I]:=TrackItem;
  end;
finally
MS.Destroy;
end;
end;

procedure TTrackCalibration.SetVisualization(const idTVisualization,idVisualization: integer);
var
  BA: TByteArray;
  VF: TBase2DVisualizationFunctionality;
  NodesCount: integer;
  X,Y: double;
  BAPtr: pointer;
  I: integer;
  LastLength: double;
  X1,Y1: double;
  NewLength: double;
  minLatitude,minLongitude: double;
  LatD,LongD: Extended;
  Aspect: Extended;
  flagLoop: boolean;
  Color: TColor;
  Width: Double;
  flagFill: boolean;
  ColorFill: TColor;
begin
if (CalibrationGeodesyEllipsoid = -1) then Raise Exception.Create('TTrackCalibration.DoCalibrate: calibration datum ellipsoid is not set'); //. =>
if (Length(Track) < 2) then Raise Exception.Create('TTrackCalibration.SetVisualization: track points number are less than 2'); //. =>
//.
VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTVisualization,idVisualization));
try
//. calculating visualization length
VF.GetNodes(BA);
BAPtr:=Pointer(@BA[0]);
NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
if (NodesCount < 2) then Raise Exception.Create('TTrackCalibration.SetVisualization: visualization nodes number are less than 2'); //. =>
LastLength:=0;
X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
for I:=1 to NodesCount-1 do begin
  X1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X1));
  Y1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y1));
  LastLength:=LastLength+Sqrt(sqr(X1-X)+sqr(Y1-Y));
  X:=X1;
  Y:=Y1;
  end;
GetTrackLength(NewLength);
//.
minLatitude:=MaxDouble;
minLongitude:=MaxDouble;
for I:=0 to Length(Track)-1 do with Track[I] do begin
  if (Latitude < minLatitude) then minLatitude:=Latitude;
  if (Longitude < minLongitude) then minLongitude:=Longitude;
  end;
//.
LatD:=Geo_GetDistance(CalibrationGeodesyEllipsoid, minLatitude,minLongitude,minLatitude+1/60.0{1 minute},minLongitude);
LongD:=Geo_GetDistance(CalibrationGeodesyEllipsoid, minLatitude,minLongitude,minLatitude,minLongitude+1/60.0{1 minute});
Aspect:=(LongD/LatD);
//.
NodesCount:=Length(Track);
SetLength(BA,SizeOf(NodesCount)+NodesCount*(SizeOf(X)+SizeOf(Y)));
BAPtr:=Pointer(@BA[0]);
Integer(BAPtr^):=NodesCount; Inc(Integer(BAPtr),SizeOf(NodesCount));
for I:=0 to NodesCount-1 do with Track[I] do begin
  X:=(Longitude-minLongitude)*Aspect;
  Y:=Latitude-minLatitude;
  Double(BAPtr^):=X; Inc(Integer(BAPtr),SizeOf(X));
  Double(BAPtr^):=Y; Inc(Integer(BAPtr),SizeOf(Y));
  end;
//.
VF.GetProps(flagLoop,Color,Width,flagFill,ColorFill);
VF.SetNodes(BA,Width*(NewLength/LastLength));
finally
VF.Release;
end;
CalibrationVisualization_idTVisualization:=idTVisualization;
CalibrationVisualization_idVisualization:=idVisualization;
end;

procedure TTrackCalibration.GetTrackMinMax(out minLong,minLat: double; out maxLong,maxLat: double);
var
  I: integer;
begin
minLong:=MaxDouble;
minLat:=MaxDouble;
maxLong:=-MaxDouble;
maxLat:=-MaxDouble;
for I:=0 to Length(Track)-1 do with Track[I] do begin
  if (Longitude < minLong) then minLong:=Longitude;
  if (Longitude > maxLong) then maxLong:=Longitude;
  if (Latitude < minLat) then minLat:=Latitude;
  if (Latitude > maxLat) then maxLat:=Latitude;
  end;
end;

procedure TTrackCalibration.GetTrackLength(out TrackLength: double);
var
  I: integer;
begin
TrackLength:=0;
for I:=0 to Length(Track)-2 do TrackLength:=TrackLength+Sqrt(sqr(Track[I+1].Longitude-Track[I].Longitude)+sqr(Track[I+1].Latitude-Track[I].Latitude));
end;

procedure TTrackCalibration.DoCalibrate;
var
  BA,BA1: TByteArray;
  BAPtr,BAPtr1: pointer;
  NodesCount: integer;
  CF: TComponentFunctionality;
  CL: TComponentsList;
  VisualizationType,VisualizationID: integer;
  idNewGeodesypoint: integer;
  GPF: TGeodesyPointFunctionality;
  X,Y: double;
  X1,Y1: double;
  dX,dY: double;
begin
if (Length(Track) < 2) then Raise Exception.Create('TTrackCalibration.DoCalibrate: track size is less than 2 points'); //. =>
if ((CalibrationVisualization_idTVisualization = 0) OR (CalibrationVisualization_idVisualization = 0)) then Raise Exception.Create('TTrackCalibration.DoCalibrate: calibration track visualization is not defined'); //. =>
if (CalibrationVisualizationPoint_Index >= Length(Track)) then Raise Exception.Create('TTrackCalibration.DoCalibrate: calibration point is out of Track scope'); //. =>
if (CalibrationGeodesyPointPrototypeID = 0) then Raise Exception.Create('TTrackCalibration.DoCalibrate: calibration GeodesyPoint prototype ID is not set'); //. =>
if (CalibrationCrdSystemID = 0) then Raise Exception.Create('TTrackCalibration.DoCalibrate: calibration CrdSystem ID is not set'); //. =>
//.
//. get track visualization nodes
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(CalibrationVisualization_idTVisualization,CalibrationVisualization_idVisualization)) do
try
GetNodes(BA);
finally
Release;
end;
BAPtr:=Pointer(@BA[0]);
NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
if (NodesCount <> Length(Track)) then Raise Exception.Create('TTrackCalibration.DoCalibrate: track size and track visualization size is not equal'); //. =>
//.
CF:=TComponentFunctionality_Create(idTGeodesyPoint,CalibrationGeodesyPointPrototypeID);
try
if (CF.QueryComponents(TBase2DVisualizationFunctionality,CL))
 then
  try
  VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
  VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('visualization-component is not found in the GeodesyPoint prototype'); //. =>
//. create point
CF.ToClone(idNewGeodesypoint);
GPF:=TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,idNewGeodesypoint));
try
if (TComponentFunctionality(GPF).QueryComponents(TBase2DVisualizationFunctionality,CL))
 then
  try
  VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
  VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('visualization-component is not found in the cloned GeodesyPoint'); //. =>
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
GetNodes(BA1);
BAPtr1:=Pointer(@BA1[0]);
NodesCount:=Integer(BAPtr1^); Inc(Integer(BAPtr1),SizeOf(NodesCount));
if (NodesCount < 2) then Raise Exception.Create('TTrackCalibration.SetVisualization: Geodesy-Point visualization nodes number are less than 2'); //. =>
X:=Double(BAPtr1^); Inc(Integer(BAPtr1),SizeOf(X));
Y:=Double(BAPtr1^); Inc(Integer(BAPtr1),SizeOf(Y));
X1:=Double(BAPtr1^); Inc(Integer(BAPtr1),SizeOf(X1));
Y1:=Double(BAPtr1^); Inc(Integer(BAPtr1),SizeOf(Y1));
dX:=(X1-X)/2.0; dY:=(Y1-Y)/2.0;
SetPosition(Double(Pointer(Integer(BAPtr)+CalibrationVisualizationPoint_Index*(2*SizeOf(Double)))^)-dX{X},Double(Pointer(Integer(BAPtr)+CalibrationVisualizationPoint_Index*(2*SizeOf(Double))+SizeOf(Double))^)-dY{Y},0{Z});
finally
Release;
end;
GPF.Latitude:=Track[CalibrationVisualizationPoint_Index].Latitude;
GPF.Longitude:=Track[CalibrationVisualizationPoint_Index].Longitude;
GPF.idCrdSys:=CalibrationCrdSystemID;
GPF.ValidateByVisualizationComponent();
finally
GPF.Release;
end;
finally
CF.Release;
end;
//. clear calibrated points
CalibrationVisualizationPoint_Index:=-1;
end;

end.
