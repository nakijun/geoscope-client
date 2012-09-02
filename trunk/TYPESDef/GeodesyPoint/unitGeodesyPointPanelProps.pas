unit unitGeodesyPointPanelProps;

interface

uses
  GlobalSpaceDefines, unitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TGeodesyPointPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    meLatitude: TMaskEdit;
    Label1: TLabel;
    Image: TImage;
    Label2: TLabel;
    meLongitude: TMaskEdit;
    Label3: TLabel;
    edXY: TEdit;
    Label4: TLabel;
    edCrdSys: TEdit;
    bbSetParams: TBitBtn;
    lbXYHint: TLabel;
    sbCrdSysPropsPanel: TSpeedButton;
    sbSelectCrdSystem: TSpeedButton;
    procedure bbSetParamsClick(Sender: TObject);
    procedure sbCrdSysPropsPanelClick(Sender: TObject);
    procedure sbSelectCrdSystemClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    function GetRealXY(out X,Y: double): boolean;
    procedure SetParams;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  unitGEOCrdSystemGeodesyPointsPanel,
  unitTGeoCrdSystemInstanceSelector;

{$R *.DFM}

Constructor TGeodesyPointPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TGeodesyPointPanelProps.Destroy;
begin
Inherited;
end;

procedure TGeodesyPointPanelProps._Update;
const
  MaxFactor = 0.000000001;
var
  _idCrdSys: integer;
  _X,_Y,RX,RY: double;
  Lat: double;
  Long: double;
  C: Char;
begin
Inherited;
with TGeodesyPointFunctionality(ObjFunctionality) do begin
GetParams(_idCrdSys, _X,_Y, Lat,Long);
C:=DecimalSeparator;DecimalSeparator:='.';
try
edCrdSys.Text:=IntToStr(_idCrdSys);
edXY.Text:=FormatFloat('',_X)+'; '+FormatFloat('',_Y);
if (GetRealXY(RX,RY))
 then
  if ((Abs(RX-_X) < MaxFactor) AND (Abs(RY-_Y) < MaxFactor))
   then begin
    lbXYHint.Font.Color:=clBtnFace;
    lbXYHint.Caption:='';
    end
   else begin
    lbXYHint.Font.Color:=clRed;
    lbXYHint.Caption:='real x,y are differ';
    end
 else begin
  lbXYHint.Font.Color:=clBtnFace;
  lbXYHint.Caption:='';
  end;
meLatitude.Text:=FormatFloat('0.00000',Lat); //. IntToStr(Trunc(Lat))+'.'+IntToStr(Trunc(60*Frac(Lat)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Lat))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Lat))));
meLongitude.Text:=FormatFloat('0.000000',Long); //. IntToStr(Trunc(Long))+'.'+IntToStr(Trunc(60*Frac(Long)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Long))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Long))));
finally
DecimalSeparator:=C;
end;
end;
end;

procedure GetValue(const ValueStr: string; out Value: double);
var
  NS: string;
  I: integer;
  C: Char;
begin
Value:=0;
//. degree
NS:='';
I:=1;
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> '.'
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+StrToInt(NS);
//. minuts
Inc(I); //. skip [.]
NS:='';
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> ''''
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+StrToInt(NS)/60;
//. seconds
Inc(I); //. skip [']
NS:='';
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> ''''
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+(StrToInt(NS)/60)/60;
//. frac of seconds
Inc(I,3); //. skip [''.]
NS:='';
while I <= Length(ValueStr) do begin
  if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] else NS:=NS+'0';
  Inc(I);
  end;
C:=DecimalSeparator;DecimalSeparator:='.';
try
if NS <> '' then Value:=Value+((1/60)/60)*(StrToFloat('0.'+NS));
finally
DecimalSeparator:=C;
end;
//.
end;

function TGeodesyPointPanelProps.GetRealXY(out X,Y: double): boolean;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TVisualizationFunctionality;
  Obj: TSpaceObj;
  Point: GlobalSpaceDefines.TPoint;
begin
Result:=false;
if ObjFunctionality.QueryComponent(idTVisualization, idTComponent,idComponent)
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

procedure ParseCoordinates(const S: string; out X,Y: double);
var
  NS: String;
  I: integer;
begin
I:=1;
NS:='';
for I:=1 to Length(S) do
  if S[I] <> ';'
   then NS:=NS+S[I]
   else Break;
try
X:=StrToFloat(NS);
except
  Raise Exception.Create('could not recognize X'); //. =>
  end;
if I = Length(S) then Raise Exception.Create('X not found'); //. =>
Inc(I);
NS:='';
for I:=I to Length(S) do NS:=NS+S[I];
try
Y:=StrToFloat(NS);
except
  Raise Exception.Create('could not recognize Y'); //. =>
  end;
end;

procedure TGeodesyPointPanelProps.SetParams;
var
  _idCrdSys: integer;
  _X,_Y: double;
  Lat,Long: double;
begin
_idCrdSys:=StrToInt(edCrdSys.Text);
ParseCoordinates(edXY.Text, _X,_Y);
Lat:=StrToFloat(meLatitude.Text); //. GetValue(meLatitude.Text,Lat);
Long:=StrToFloat(meLongitude.Text); //. GetValue(meLongitude.Text,Long);
//.
TGeodesyPointFunctionality(ObjFunctionality).SetParams(_idCrdSys, _X,_Y, Lat,Long);
TGeodesyPointFunctionality(ObjFunctionality).ValidateByVisualizationComponent();
end;

procedure TGeodesyPointPanelProps.bbSetParamsClick(Sender: TObject);
begin
SetParams;
end;

procedure TGeodesyPointPanelProps.sbCrdSysPropsPanelClick(Sender: TObject);
var
  idCrdSys: integer;
begin
idCrdSys:=StrToInt(edCrdSys.Text);
try
with TComponentFunctionality_Create(idTGeoCrdSystem,idCrdSys) do
try
Check();
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show;
end;
finally
Release;
end;
except
  with TfmGEOCrdSystemGeodesyPointsPanel.Create(idCrdSys) do Show;
  end;
end;

procedure TGeodesyPointPanelProps.sbSelectCrdSystemClick(Sender: TObject);
var
  idCrdSys: integer;
begin
with TfmTGeoCrdSystemInstanceSelector.Create do
try
if (Select(idCrdSys)) then edCrdSys.Text:=IntToStr(idCrdSys);
finally
Destroy;
end;
end;

procedure TGeodesyPointPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TMaskEdit) then TControl(Components[I]).Enabled:=false;
end;

procedure TGeodesyPointPanelProps.Controls_ClearPropData;
begin
edCrdSys.Text:='';
edXY.Text:='';
lbXYHint.Font.Color:=clBtnFace;
lbXYHint.Caption:='';
meLatitude.Text:='';
meLongitude.Text:='';
end;


end.
