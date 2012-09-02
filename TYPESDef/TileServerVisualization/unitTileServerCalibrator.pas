unit unitTileServerCalibrator;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls, GlobalSpaceDefines, Menus;

const
  CalibrationFileName = 'C:\ImageCalibration.ini';
type
  TfmTileServerCalibrator = class(TForm)
    memoParameters: TMemo;
    Label1: TLabel;
    sbCalibrate: TSpeedButton;
    Bevel1: TBevel;
    cbDeleteOldGeodesyPoints: TCheckBox;
    cbCreateNewGeodesyPoints: TCheckBox;
    procedure memoParametersChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbCalibrateClick(Sender: TObject);
  private
    { Private declarations }
    Space: TproxySpace;
    idDetailedImage: integer;
    flParametersChanged: boolean;

    procedure Google_ConvertPixXYtoLatLong(const PixX,PixY: double; const Zoom: integer; out Lat,Long: double);
  public
    { Public declarations }
    Constructor Create(const pSpace: TproxySpace; const pidDetailedImage: integer);
    Destructor Destroy; override;
    procedure Google_Calibrate;
  end;

implementation
Uses
  INIFiles;

{$R *.dfm}

Constructor TfmTileServerCalibrator.Create(const pSpace: TproxySpace; const pidDetailedImage: integer);
begin
Inherited Create(nil);
Space:=pSpace;
idDetailedImage:=pidDetailedImage;
if (FileExists(CalibrationFileName)) then memoParameters.Lines.LoadFromFile(CalibrationFileName);
flParametersChanged:=false;
end;

Destructor TfmTileServerCalibrator.Destroy;
begin
if (flParametersChanged) then memoParameters.Lines.SaveToFile(CalibrationFileName);
Inherited;
end;

procedure TfmTileServerCalibrator.Google_ConvertPixXYtoLatLong(const PixX,PixY: double; const Zoom: integer; out Lat,Long: double);
begin
Long:=(PixX*360.0)/(256.0*(1 SHL (17-Zoom)));
Long:=Long-180.0;
Lat:=(360.0*ArcTan(Exp(PI*(1-PixY/(1 SHL (24-Zoom))))))/PI-90.0;
end;

procedure TfmTileServerCalibrator.Google_Calibrate;

  procedure Image_GetInsideObjectsList(const VF: TBase2DVisualizationFunctionality; out List: TComponentsList);

    procedure ProcessObj(const ptrObj: TPtr);
    var
      Obj: TSpaceObj;
    begin
    with Space do begin
    ReadObj(Obj,SizeOf(Obj), ptrObj);
    List.AddComponent(Obj.idTObj,Obj.idObj,0);
    end;
    end;

  var
    ptrObj: TPtr;
    LayNumber,SubLayNumber: integer;
    Lays: pointer;
    ptrLay: pointer;
    ptrItem: pointer;
    ptrDestroyLay: pointer;
    ptrDestroyItem: pointer;
  begin
  ptrObj:=VF.Ptr;
  VF.Space.Obj_GetLayInfo(ptrObj, LayNumber,SubLayNumber);
  List:=TComponentsList.Create;
  try
  VF.Space.Obj_GetLaysOfVisibleObjectsInside(ptrObj, Lays);
  try
  //.
  ptrLay:=Lays;
  while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      ProcessObj(ptrObject);
      ptrItem:=ptrNext;
      end;
    ptrLay:=ptrNext;
    end;
  //.
  finally
  //. lays destroying
  while Lays <> nil do begin
    ptrDestroyLay:=Lays;
    Lays:=TLayReflect(ptrDestroyLay^).ptrNext;
    //. lay destroying
    with TLayReflect(ptrDestroyLay^) do
    while Objects <> nil do begin
      ptrDestroyItem:=Objects;
      Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
      //. item of lay destroying
      FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
      end;
    FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
    end;
  end;
  except
    List.Destroy;
    Raise; //. =>
    end;
  end;


var
  CoordinateSystemID: integer;
  ImageLevelID: integer;

  GeodesyPointPrototype: integer;

  GeodesyPoint0PixPosX: integer;
  GeodesyPoint0PixPosY: integer;

  GeodesyPointPixStep: integer;
  GeodesyPointCount: integer;

  GoogleTile0X: integer;
  GoogleTile0Y: integer;
  GoogleZoom: integer;
  GoogleProcessZoom: integer;

  S: string;
  DetailedImageFunctionality: TTileServerVisualizationFunctionality;
  DivX: integer;
  DivY: integer;
  SegmentWidth: double;
  SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
  LevelSize: integer;
  PixBaseX,PixBaseY: integer;
  InsideObjectsList: TComponentsList;
  idTOwner,idOwner: integer;
  J,I: integer;
  X,Y: integer;
  GeodesyPointPrototypeFunctionality,NewGeodesyPointFunctionality: TGeodesyPointFunctionality;
  idNewGeodesyPoint: integer;
  idTV,idV: integer;
  NewGeodesyPointVisualizationFunctionality: TBase2DVisualizationFunctionality;
  Lat,Long: double;
  Xr,Yr: double;
begin
if (flParametersChanged) then memoParameters.Lines.SaveToFile(CalibrationFileName);
with TINIFile.Create(CalibrationFileName) do
try
S:=ReadString('CALIBRATION','CoordinateSystemID','');
if (S = '') then Raise Exception.Create('could not read CoordinateSystemID'); //. =>
CoordinateSystemID:=StrToInt(S);
if (cbCreateNewGeodesyPoints.Checked)
 then begin
  S:=ReadString('CALIBRATION','ImageLevelID','');
  if (S = '') then Raise Exception.Create('could not read ImageLevelID'); //. =>
  ImageLevelID:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GeodesyPointPrototype','');
  if (S = '') then Raise Exception.Create('could not read GeodesyPointPrototype'); //. =>
  GeodesyPointPrototype:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GeodesyPoint0PixPosX','');
  if (S = '') then Raise Exception.Create('could not read GeodesyPoint0PixPosX'); //. =>
  GeodesyPoint0PixPosX:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GeodesyPoint0PixPosY','');
  if (S = '') then Raise Exception.Create('could not read GeodesyPoint0PixPosY'); //. =>
  GeodesyPoint0PixPosY:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GeodesyPointPixStep','');
  if (S = '') then Raise Exception.Create('could not read GeodesyPointPixStep'); //. =>
  GeodesyPointPixStep:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GeodesyPointCount','');
  if (S = '') then Raise Exception.Create('could not read GeodesyPointCount'); //. =>
  GeodesyPointCount:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GoogleTile0X','');
  if (S = '') then Raise Exception.Create('could not read GoogleTile0X'); //. =>
  GoogleTile0X:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GoogleTile0Y','');
  if (S = '') then Raise Exception.Create('could not read GoogleTile0Y'); //. =>
  GoogleTile0Y:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GoogleZoom','');
  if (S = '') then Raise Exception.Create('could not read GoogleZoom'); //. =>
  GoogleZoom:=StrToInt(S);
  //.
  S:=ReadString('CALIBRATION','GoogleProcessZoom','');
  if (S = '') then Raise Exception.Create('could not read GoogleProcessZoom'); //. =>
  GoogleProcessZoom:=StrToInt(S);
  end;
finally
Destroy;
end;
//.
if (GoogleProcessZoom <= GoogleZoom)
 then begin
  GoogleTile0X:=(GoogleTile0X SHL (GoogleZoom-GoogleProcessZoom));
  GoogleTile0Y:=(GoogleTile0Y SHL (GoogleZoom-GoogleProcessZoom));
  end
 else begin
  GoogleTile0X:=(GoogleTile0X SHR (GoogleProcessZoom-GoogleZoom));
  GoogleTile0Y:=(GoogleTile0Y SHR (GoogleProcessZoom-GoogleZoom));
  end;
GoogleZoom:=GoogleProcessZoom;
//.
PixBaseX:=GoogleTile0X*256;
PixBaseY:=GoogleTile0Y*256;
//.
DetailedImageFunctionality:=TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idDetailedImage));
with DetailedImageFunctionality do
try
Level_GetParams(ImageLevelID, DivX, DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
if (NOT ((DivX = DivY) AND (SegmentWidth = SegmentHeight) AND (SegmentWidth = 256))) then Raise Exception.Create('wrong image level parameters'); //. =>
LevelSize:=Trunc(DivX*SegmentWidth);
//. destroy the old geodesy points inside of image that has the same CoordinateSystemID
if (cbDeleteOldGeodesyPoints.Checked)
 then begin
  Image_GetInsideObjectsList(DetailedImageFunctionality, InsideObjectsList);
  try
  for I:=0 to InsideObjectsList.Count-1 do
    try
    with TComponentFunctionality_Create(TItemComponentsList(InsideObjectsList[I]^).idTComponent,TItemComponentsList(InsideObjectsList[I]^).idComponent) do
    try
    if ((idTObj = idTVisualization) AND (GetOwner(idTOwner,idOwner)) AND (idTOwner = idTGeodesyPoint))
     then with TGeodesyPointFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
      try
      if (idCrdSys = CoordinateSystemID) then TypeFunctionality.DestroyInstance(idObj);
      finally
      Release;
      end;
    finally
    Release;
    end;
    except
      end;
  finally
  InsideObjectsList.Destroy;
  end;
  end;
//. preparing a calibration geodesy points
if (cbCreateNewGeodesyPoints.Checked)
 then begin
  GeodesyPointPrototypeFunctionality:=TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,GeodesyPointPrototype));
  try
  for I:=0 to GeodesyPointCount-1 do begin
    Y:=GeodesyPoint0PixPosY+I*GeodesyPointPixStep;
    if (Y >= LevelSize) then Break; //. >
    for J:=0 to GeodesyPointCount-1 do begin
      X:=GeodesyPoint0PixPosX+J*GeodesyPointPixStep;
      if (X >= LevelSize) then Break; //. >
      //.
      Google_ConvertPixXYtoLatLong(PixBaseX+X,PixBaseY+Y,GoogleZoom, Lat,Long);
      Level_ConvertPixPosToXY(ImageLevelID, X,Y, Xr,Yr);
      //. create new geodesy point
      GeodesyPointPrototypeFunctionality.ToClone(idNewGeodesyPoint);
      //. set up geodesy point
      NewGeodesyPointFunctionality:=TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,idNewGeodesyPoint));
      try
      if (NOT NewGeodesyPointFunctionality.QueryComponent(idTVisualization, idTV,idV)) then Raise Exception.Create('could not query a visualization from new geodesy point'); //. =>
      NewGeodesyPointVisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTV,idV));
      try
      NewGeodesyPointVisualizationFunctionality.SetPosition(Xr,Yr,0);
      finally
      NewGeodesyPointVisualizationFunctionality.Release;
      end;
      NewGeodesyPointFunctionality.SetParams(CoordinateSystemID, Xr,Yr, Lat,Long);
      NewGeodesyPointFunctionality.ValidateByVisualizationComponent();
      finally
      NewGeodesyPointFunctionality.Release;
      end;
      end;
    end;
  finally
  GeodesyPointPrototypeFunctionality.Release;
  end;
  end;
finally
Release;
end;
end;

procedure TfmTileServerCalibrator.memoParametersChange(Sender: TObject);
begin
flParametersChanged:=true;
end;

procedure TfmTileServerCalibrator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmTileServerCalibrator.sbCalibrateClick(Sender: TObject);
begin
Google_Calibrate;
ShowMessage('Detailed image is calibrated successfully using Google Maps(c) method');
end;

end.
