unit unitGEOCrdSystemGeodesyPointsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ImgList, ComCtrls;

type
  TfmGeoCrdSystemGeodesyPointsPanel = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    lvPointsList: TListView;
    lvPointsList_ImageList: TImageList;
    Label2: TLabel;
    sbValidatePoints: TSpeedButton;
    sbDeletePoints: TSpeedButton;
    sbAnalizePoints: TSpeedButton;
    procedure sbValidatePointsClick(Sender: TObject);
    procedure lvPointsListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbDeletePointsClick(Sender: TObject);
    procedure edIDKeyPress(Sender: TObject; var Key: Char);
    procedure sbAnalizePointsClick(Sender: TObject);
  private
    { Private declarations }
    idCrdSys: integer;

    procedure lvPoints_Update;
    function Point_GetRealXY(idPoint: integer; out oX,oY: double): boolean;
  public
    { Public declarations }

    Constructor Create(const pidCrdSys: integer);
    procedure Update;
    procedure ValidatePoints;
    procedure DeletePoints;
  end;

implementation
Uses
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality,
  GeoTransformations,
  unitLineApprGEOCrdSystem_CheckGeodesyPointsPanel;

{$R *.dfm}


Constructor TfmGeoCrdSystemGeodesyPointsPanel.Create(const pidCrdSys: integer);
begin
Inherited Create(nil);
idCrdSys:=pidCrdSys;
Update();
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.Update;
begin
edID.Text:=IntToStr(idCrdSys);
lvPoints_Update;
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.lvPoints_Update;
const
  MaxFactor = 0.000000001;
var
  IL: TByteArray;
  I: integer;
  idInstance: integer;
  _idCrdSys: integer;
  _X,_Y,RX,RY: double;
  Lat: double;
  Long: double;
begin
lvPointsList.Clear;
lvPointsList.Items.BeginUpdate;
try
with TTGeodesyPointFunctionality.Create do
try
GetInstanceListByCrdSys(idCrdSys, IL);
for I:=0 to (Length(IL) DIV SizeOf(Integer))-1 do begin
  idInstance:=Integer(Pointer(Integer(@IL[0])+I*SizeOf(Integer))^);
  with lvPointsList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TGeodesyPointFunctionality(TComponentFunctionality_Create(idInstance)) do
  try
  GetParams(_idCrdSys, _X,_Y, Lat,Long);
  Caption:=IntToStr(idObj);
  ImageIndex:=0;
  SubItems.Add(IntToStr(Trunc(Lat))+'.'+IntToStr(Trunc(60*Frac(Lat)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Lat))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Lat)))));
  SubItems.Add(IntToStr(Trunc(Long))+'.'+IntToStr(Trunc(60*Frac(Long)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Long))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Long)))));
  if (Point_GetRealXY(idObj, RX,RY))
   then
    if ((Abs(RX-_X) < MaxFactor) AND (Abs(RY-_Y) < MaxFactor))
     then SubItems.Add('valid')
     else SubItems.Add('invalid')
   else SubItems.Add('no visual component');
  finally
  Release;
  end;
  end;
  end;
finally
Release;
end;
finally
lvPointsList.Items.EndUpdate;
end;
end;

function TfmGeoCrdSystemGeodesyPointsPanel.Point_GetRealXY(idPoint: integer; out oX,oY: double): boolean;

  function GetVisualizationXY(const GPF: TGeodesyPointFunctionality; out X,Y: double): boolean;
  var
    idTComponent,idComponent: integer;
    VisualizationFunctionality: TVisualizationFunctionality;
    Obj: TSpaceObj;
    Point: GlobalSpaceDefines.TPoint;
  begin
  Result:=false;
  if (GPF.QueryComponent(idTVisualization, idTComponent,idComponent))
   then begin
    VisualizationFunctionality:=TVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with VisualizationFunctionality do
    try
    Space.ReadObj(Obj,SizeOf(Obj),Ptr);
    if (Obj.ptrFirstPoint = nilPtr) then Exit; //. ->
    Space.ReadObj(Point,SizeOf(Point),Obj.ptrFirstPoint);
    X:=Point.X;
    Y:=Point.Y;
    Result:=true;
    finally
    Release;
    end;
    end;
  end;

  function GetTTFVisualizationXY(const GPF: TGeodesyPointFunctionality; out X,Y: double): boolean;
  var
    idTComponent,idComponent: integer;
    TTFVisualizationFunctionality: TTTFVisualizationFunctionality;
    Obj: TSpaceObj;
    P0,P1: GlobalSpaceDefines.TPoint;
  begin
  Result:=false;
  if (GPF.QueryComponent(idTTTFVisualization, idTComponent,idComponent))
   then begin
    TTFVisualizationFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with TTFVisualizationFunctionality do
    try
    Space.ReadObj(Obj,SizeOf(Obj),Ptr);
    if (Obj.ptrFirstPoint = nilPtr) then Exit; //. ->
    Space.ReadObj(P0,SizeOf(P0),Obj.ptrFirstPoint);
    if (P0.ptrNextObj = nilPtr) then Exit; //. ->
    Space.ReadObj(P1,SizeOf(P1),P0.ptrNextObj);
    X:=((P0.X+P1.X)/2.0);
    Y:=((P0.Y+P1.Y)/2.0);
    Result:=true;
    finally
    Release;
    end;
    end;
  end;

var
  GPF: TGeodesyPointFunctionality;
  VX,VY: double;
  idTOwner,idOwner: integer;
  Obj: TSpaceObj;
  BA: TByteArray;
  N0,N1,N3: TNodeSpaceObjPolyLinePolygon;
  Divider: integer;
  SegmentSize: double;
  PixX,PixY: Extended;

  procedure ConvertXYToPixPos(const X,Y: Extended; out PixX,PixY: Extended);

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
  PixX:=Xfactor*(Divider*SegmentSize);
  PixY:=Yfactor*(Divider*SegmentSize); //. same as for X
  end;

begin
Result:=false;
GPF:=TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,idPoint));
try
if (GetVisualizationXY(GPF,VX,VY))
 then begin
  oX:=VX;
  oY:=VY;
  Result:=true;
  end
 else
  if (GetTTFVisualizationXY(GPF,VX,VY))
   then begin //. setting using projection visualization
    if (NOT GPF.GetOwner(idTOwner,idOwner) OR NOT ((idTOwner = idTGeoCrdSystem) OR (idTOwner = idTDetailedPictureVisualization))) then Raise Exception.Create('could not get GeoCrdSystem owner component'); //. =>
    if (idTOwner <> idTDetailedPictureVisualization)
     then with TComponentFunctionality_Create(idTOwner,idOwner) do
      try
      if (NOT GetOwner(idTOwner,idOwner) OR (idTOwner <> idTDetailedPictureVisualization)) then Raise Exception.Create('could not get DetailedPictureVisualization owner component'); //. =>
      finally
      Release;
      end;
    with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
    try
    Space.ReadObj(Obj,SizeOf(Obj), Ptr);
    with TSpaceObjPolyLinePolygon.Create(Space, Obj) do
    try
    if (Count <> 4) then Raise Exception.Create('DetailedPictureVisualization has wrong number of nodes'); //. =>
    N0:=Nodes[0]; N1:=Nodes[1]; N3:=Nodes[3];
    finally
    Destroy;
    end;
    GetLevelsInfo(BA);
    if (Length(BA) = 0) then Raise Exception.Create('DetailedPictureVisualization has no levels'); //. =>
    with TDetailedPictureVisualizationLevel(Pointer(@BA[0])^) do begin
    if ((DivX <> DivY) OR (SegmentWidth <> SegmentHeight)) then Raise Exception.Create('DetailedPictureVisualization has wrong level parameters'); //. =>
    Divider:=DivX;
    SegmentSize:=SegmentWidth;
    end;
    finally
    Release;
    end;
    //. convert X,Y to projection relative PixX,PixY
    ConvertXYToPixPos(VX,VY, PixX,PixY);
    //.
    oX:=PixX;
    oY:=PixY;
    Result:=true;
    end;
finally
GPF.Release;
end;
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.ValidatePoints;
var
  I: integer;
  id: integer;
begin
with lvPointsList do
for I:=0 to Items.Count-1 do begin
  id:=Integer(Items[I].Data);
  try
  with TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,id)) do
  try
  ValidateByVisualizationComponent;
  finally
  Release;
  end;
  except
    end;
  end;
//. update geo crd system if exists
with TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys) do
try
try
Check();
NotifyOnComponentUpdate();
except
  end;
finally
Release;
end;
//.
lvPoints_Update;  
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.DeletePoints;
var
  I: integer;
  id: integer;
begin
with lvPointsList do
for I:=0 to Items.Count-1 do begin
  id:=Integer(Items[I].Data);
  try
  with TGeodesyPointFunctionality(TComponentFunctionality_Create(idTGeodesyPoint,id)) do
  try
  TypeFunctionality.DestroyInstance(id);
  finally
  Release;
  end;
  except
    end;
  end;
lvPoints_Update;
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.sbValidatePointsClick(Sender: TObject);
begin
ValidatePoints();
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.sbDeletePointsClick(Sender: TObject);
begin
if (MessageDlg('Do you really want to destroy all geodesy points of this coordinate system ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
then DeletePoints();
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.lvPointsListDblClick(Sender: TObject);
begin
if (lvPointsList.Selected <> nil)
 then with TComponentFunctionality_Create(idTGeodesyPoint,Integer(lvPointsList.Selected.Data)) do
  try
  with TPanelProps_Create(false,0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
end;


procedure TfmGeoCrdSystemGeodesyPointsPanel.sbAnalizePointsClick(Sender: TObject);
var
  flLineAppr: boolean;
  ProjectionID: TProjectionID;
begin
//. check crd system to be a line approximation
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys)) do
try
try
Check();
ProjectionID:=Projections_GetItemByName(Projection);
case ProjectionID of
pidTM,pidUTM: flLineAppr:=true;
else
  flLineAppr:=false;
end;
except
  flLineAppr:=true;
  end;
finally
Release;
end;
//.
if (NOT flLineAppr) then Raise Exception.Create('coordinate system is not a line approximation'); // =>
//.
with TfmCheckGeodesyPoints.Create(idCrdSys) do Show();
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmGeoCrdSystemGeodesyPointsPanel.edIDKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  idCrdSys:=StrToInt(edID.Text);
  Update();
  end;
end;


end.
