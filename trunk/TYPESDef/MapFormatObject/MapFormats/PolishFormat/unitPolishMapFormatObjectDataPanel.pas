unit unitPolishMapFormatObjectDataPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GlobalSpaceDefines, Functionality, TypesDefines, TypesFunctionality, GeoTransformations, unitPolishMapFormatDefines,
  ExtCtrls;

type
  TfmPolishMapFormatObjectDataPanel = class(TMapFormatObjectDATAPanel)
    edType: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edLabel: TEdit;
    Label3: TLabel;
    memoData0: TMemo;
    btnSet: TBitBtn;
    btnCancel: TBitBtn;
    stData0Hint: TStaticText;
    btnCalculateData0FromCurrentPosition: TSpeedButton;
    Updater: TTimer;
    procedure btnSetClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCalculateData0FromCurrentPositionClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
  private
    { Private declarations }
    _idMap: integer;
    _FormatID: integer;
    _KindID: integer;
    _TypeID: integer;
    _Name: string;
    DATAParser: TMapFormatObjectDATAParser;
    DATAFileSectionParser: TPMFFileSectionParser;
    flAccepted: boolean;

    procedure GetObjectGeoCoordinates(out GeoCoordinates: TGeoCoordinatesArray);
    procedure CalculateData0FromCurrentPosition();
    procedure ValidateValues;
    procedure SetObject;
  public
    { Public declarations }
    Constructor Create(const pMapFormatObjectFunctionality: TMapFormatObjectFunctionality); override;
    Destructor Destroy; override;
    procedure UpdatePanel; override;
    function Dialog(): boolean; override;
  end;


implementation
uses
  unitPFMLoader;

{$R *.dfm}


{TfmPolishMapFormatObjectDataPanel}
Constructor TfmPolishMapFormatObjectDataPanel.Create(const pMapFormatObjectFunctionality: TMapFormatObjectFunctionality);
var
  DATA: TMemoryStream;
begin
Inherited Create(pMapFormatObjectFunctionality);
MapFormatObjectFunctionality.GetParams({out} _idMap,_FormatID,_KindID,_TypeID,_Name);
DATAParser:=TMapFormatObjectDATAParser.Create;
MapFormatObjectFunctionality.GetDATA(DATA);
try
DATAParser.LoadFromStream(DATA);
finally
DATA.Destroy;
end;
DATAFileSectionParser:=TPMFFileSectionParser.Create;
DATAFileSectionParser.LoadFromStr(DATAParser.FileSection);
//.
UpdatePanel();
end;

Destructor TfmPolishMapFormatObjectDataPanel.Destroy;
begin
DATAFileSectionParser.Free;
DATAParser.Free;
Inherited;
end;

procedure TfmPolishMapFormatObjectDataPanel.UpdatePanel;
begin
//. if TypeID is empty so override TypeID by object TypeID property
if (DATAFileSectionParser.TypeID = Word(-1)) then DATAFileSectionParser.TypeID:=_TypeID;
//.
edType.Text:=KIND_TYPES_GetNameByID(TPMFObjectKind(_KindID),DATAFileSectionParser.TypeID);
edLabel.Text:=DATAFileSectionParser.LabelName;
memoData0.Text:=DATAFileSectionParser.Data0ToString(DATAFileSectionParser.Data0);
if (memoData0.Text = '')
 then CalculateData0FromCurrentPosition()
 else stData0Hint.Hide();
end;

function TfmPolishMapFormatObjectDataPanel.Dialog(): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then Result:=true
 else Result:=false;
end;

procedure TfmPolishMapFormatObjectDataPanel.GetObjectGeoCoordinates(out GeoCoordinates: TGeoCoordinatesArray);
var
  CrdSysConvertor: TCrdSysConvertor;

  function ConvertXYToGeo(const idGeoSpace: integer; const X,Y: Extended; const DatumID: integer; out Lat,Long,Alt: Extended): boolean;
  var
    GeoSpaceDatumID: integer;
    _Lat,_Long,_Alt: Extended;
    idGeoCrdSystem: integer;
    flTransformPointsLoaded: boolean;
  begin
  Result:=false;
  //. get appropriate geo coordinate system
  with TTGeoCrdSystemFunctionality.Create do
  try
  GetInstanceByXYLocally(idGeoSpace, X,Y,  idGeoCrdSystem);
  finally
  Release;
  end;
  if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
   then begin
    FreeAndNil(CrdSysConvertor);
    //.
    if (idGeoCrdSystem <> 0)
     then begin
      CrdSysConvertor:=TCrdSysConvertor.Create(MapFormatObjectFunctionality.Space,idGeoCrdSystem);
      flTransformPointsLoaded:=false;
      end;
    end;
  if (CrdSysConvertor <> nil)
   then begin
    ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
    if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_XYIsOutOfApproximationZone(X,Y)))
     then begin
      CrdSysConvertor.XYToGeo_LoadPoints(X,Y);
      flTransformPointsLoaded:=true;
      end;
    //.
    Result:=CrdSysConvertor.ConvertXYToGeo(X,Y,{out} _Lat,_Long);
    //. datum transform
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do //. get GeoSpace Datum ID
    try
    GeoSpaceDatumID:=GetDatumIDLocally();
    finally
    Release;
    end;
    _Alt:=0; //. zero Altitude
    TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(GeoSpaceDatumID, _Lat,_Long,_Alt, DatumID,{out} Lat,Long,Alt);
    end;
  end;

var
  idGeoSpace: integer;
  MapDATA: TMemoryStream;
  FileSectionStr: ANSIString;
  NL: TStringList;
  DatumStr: ANSIString;
  MapDatumID: integer;
  CL: TComponentsList;
  VF: TBase2DVisualizationFunctionality;
  BA: TByteArray;
  BAPtr: pointer;
  NodesCount: integer;
  I: integer;
  X,Y: double;
  Lat,Long,Alt: Extended;
begin
//. get map properties
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,_idMap)) do
try
idGeoSpace:=GeoSpaceID;
GetDATA({out} MapDATA);
try
with TMapFormatObjectDATAParser.Create() do
try
LoadFromStream(MapDATA);
FileSectionStr:=FileSection;
finally
Destroy;
end;
finally
MapDATA.Destroy;
end;
//.
NL:=TStringList.Create;
try
NL.Text:=FileSectionStr;
if (TPFMParser.GetNodeValue(NL,'Datum', {out} DatumStr))
 then begin
  if (DatumStr = 'W84') then MapDatumID:=23{WGS-84} else Raise Exception.Create('unknown map Datum'); //. =>
  end
 else MapDatumID:=23; //. WGS-84
finally
NL.Destroy;
end;
finally
Release;
end;
//.
CrdSysConvertor:=nil;
try
if (MapFormatObjectFunctionality.QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
 then
  try
  VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
  with VF do
  try
  GetNodes({out} BA);
  if (Length(BA) = 0) then Raise Exception.Create('there are no visualization nodes'); //. =>
  BAPtr:=Pointer(@BA[0]);
  NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
  if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
  if (NodesCount > 2)
   then begin
    SetLength(GeoCoordinates,NodesCount);
    for I:=0 to NodesCount-1 do begin
      X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
      Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
      if (NOT ConvertXYToGeo(idGeoSpace,X,Y, MapDatumID, {out} Lat,Long,Alt)) then Raise Exception.Create('could not convert X,Y to latitude,longitude'); //. =>
      //.
      GeoCoordinates[I].Lat:=Lat;
      GeoCoordinates[I].Long:=Long;
      end;
    end
   else begin
    X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
    Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
    X:=X+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X));
    Y:=Y+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y));
    X:=X/2.0;
    Y:=Y/2.0;
    SetLength(GeoCoordinates,1);
    if (NOT ConvertXYToGeo(idGeoSpace,X,Y, MapDatumID, {out} Lat,Long,Alt)) then Raise Exception.Create('could not convert X,Y to latitude,longitude'); //. =>
    //.
    GeoCoordinates[0].Lat:=Lat;
    GeoCoordinates[0].Long:=Long;
    end;
  finally
  Release;
  end;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('Visualization component is not found'); //. =>
finally
CrdSysConvertor.Free;
end;
end;

procedure TfmPolishMapFormatObjectDataPanel.CalculateData0FromCurrentPosition();
var
  GeoCoordinates: TGeoCoordinatesArray;
begin
GetObjectGeoCoordinates({out} GeoCoordinates);
memoData0.Text:=DATAFileSectionParser.Data0ToString(GeoCoordinates);
stData0Hint.Caption:='coordinates are calculated using current object position';
stData0Hint.Show();
end;

procedure TfmPolishMapFormatObjectDataPanel.ValidateValues;
var
  Data0: TGeoCoordinatesArray;
begin
DATAFileSectionParser.ParseStringToData0(memoData0.Text,{out} Data0);
end;

procedure TfmPolishMapFormatObjectDataPanel.SetObject;
var
  DATA: TMemoryStream;
  SectionStr: ANSIString;
begin
ValidateValues();
//. save DATA of object first
DATAFileSectionParser.LabelName:=edLabel.Text;
DATAFileSectionParser.ParseStringToData0(memoData0.Text,{out} DATAFileSectionParser.Data0);
DATAFileSectionParser.SaveToStr(SectionStr);
DATAParser.FileSection:=SectionStr;  
DATA:=TMemoryStream.Create;
try
DATAParser.SaveToStream(DATA);
MapFormatObjectFunctionality.SetDATA(DATA);
finally
DATA.Destroy;
end;
//. set object properties
MapFormatObjectFunctionality.SetObjectByDATA();
end;

procedure TfmPolishMapFormatObjectDataPanel.btnCalculateData0FromCurrentPositionClick(Sender: TObject);
begin
CalculateData0FromCurrentPosition();
end;

procedure TfmPolishMapFormatObjectDataPanel.btnSetClick(Sender: TObject);
begin
SetObject();
//.
flAccepted:=true;
Close();
end;

procedure TfmPolishMapFormatObjectDataPanel.btnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmPolishMapFormatObjectDataPanel.UpdaterTimer(Sender: TObject);
begin
if (Visible AND NOT Focused)
 then begin //. to overlap Reflector.SPUTNIK.Panel
  BringToFront();
  end;
end;


end.
