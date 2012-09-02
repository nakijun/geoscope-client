unit unitDetailedPictureWrapper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, GlobalSpaceDefines;

type
  TWrapPair = record
    X,Y: double;
    Xwrap,Ywrap: double;
    L: double;
    A: double;
    Lwrap: double;
    Awrap: double;
  end;

  TWrapPairs = record
    Pairs: array of TWrapPair;
    X_avr: double;
    Y_avr: double;
    Scale_avr: double;
    Angle_avr: double;
    Xwrap_avr: double;
    Ywrap_avr: double;
    ScaleWrap_avr: double;
    AngleWrap_avr: double;
  end;

  TfmDetailedPictureWrapper = class(TForm)
    memoMyPoints: TMemo;
    Label1: TLabel;
    memoTargetPoints: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    sbProcess: TSpeedButton;
    sbPrepareFromContainer: TSpeedButton;
    sbPreparefromClipboardVisualizationContainer: TSpeedButton;
    procedure sbProcessClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPreparefromClipboardVisualizationContainerClick(
      Sender: TObject);
    procedure sbPrepareFromContainerClick(Sender: TObject);
  private
    idPictureVisualization: integer;
    { Private declarations }
    procedure Process;
    procedure PreparePointsListFromSpaceObj(const idTVisualization,idVisualization: integer; const List: TStrings);
  public
    { Public declarations }
    Constructor Create(const pidPictureVisualization: integer);
  end;

implementation
Uses
  Math,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality;

{$R *.dfm}


procedure ParseCrdString(const S: string; out X,Y: double);
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
if I = Length(S) then Raise Exception.Create('Y not found'); //. =>
Inc(I);
NS:='';
for I:=I to Length(S) do NS:=NS+S[I];
try
Y:=StrToFloat(NS);
except
  Raise Exception.Create('could not recognize Y'); //. =>
  end;
end;

Constructor TfmDetailedPictureWrapper.Create(const pidPictureVisualization: integer);
begin
Inherited Create(nil);
idPictureVisualization:=pidPictureVisualization;
end;

procedure TfmDetailedPictureWrapper.Process;

  procedure ValidateLines(const Lines: TStrings);
  var
    I: integer;
  begin
  I:=0;
  while (I < Lines.Count) do if (Lines[I] = '') then Lines.Delete(I) else Inc(I);
  end;

var
  WrapPairs: TWrapPairs;
  WC: integer;
  I: integer;
  S: string;
  X,Y: double;
  dX,dY: double;
  TranslateX,TranslateY: double;
  _Scale: double;
  Angle: double;
  idTRoot,idRoot: integer;
begin
ValidateLines(memoMyPoints.Lines);
ValidateLines(memoTargetPoints.Lines);
//.
WC:=memoMyPoints.Lines.Count;
if (memoTargetPoints.Lines.Count <> WC) then Raise Exception.Create('wrap counters are differ'); //. =>
//.
FillChar(WrapPairs, SizeOf(WrapPairs), 0);
SetLength(WrapPairs.Pairs,WC);
for I:=0 to WC-1 do begin
  S:=memoMyPoints.Lines[I];
  ParseCrdString(S, X,Y);
  WrapPairs.Pairs[I].X:=X; WrapPairs.Pairs[I].Y:=Y;
  S:=memoTargetPoints.Lines[I];
  ParseCrdString(S, X,Y);
  WrapPairs.Pairs[I].Xwrap:=X; WrapPairs.Pairs[I].Ywrap:=Y;
  end;
//. average coordinate
WrapPairs.X_avr:=0;
WrapPairs.Y_avr:=0;
WrapPairs.Xwrap_avr:=0;
WrapPairs.Ywrap_avr:=0;
for I:=0 to WC-1 do begin
  WrapPairs.X_avr:=WrapPairs.X_avr+WrapPairs.Pairs[I].X;
  WrapPairs.Y_avr:=WrapPairs.Y_avr+WrapPairs.Pairs[I].Y;
  WrapPairs.Xwrap_avr:=WrapPairs.Xwrap_avr+WrapPairs.Pairs[I].Xwrap;
  WrapPairs.Ywrap_avr:=WrapPairs.Ywrap_avr+WrapPairs.Pairs[I].Ywrap;
  end;
WrapPairs.X_avr:=WrapPairs.X_avr/WC;
WrapPairs.Y_avr:=WrapPairs.Y_avr/WC;
WrapPairs.Xwrap_avr:=WrapPairs.Xwrap_avr/WC;
WrapPairs.Ywrap_avr:=WrapPairs.Ywrap_avr/WC;
//. calculating lengths
for I:=0 to WC-1 do with WrapPairs.Pairs[I] do begin
  L:=Sqrt(sqr(X-WrapPairs.X_avr)+sqr(Y-WrapPairs.Y_avr));
  Lwrap:=Sqrt(sqr(Xwrap-WrapPairs.Xwrap_avr)+sqr(Ywrap-WrapPairs.Ywrap_avr));
  end;
//. calculating angles
for I:=0 to WC-1 do with WrapPairs.Pairs[I] do begin
  dX:=(X-WrapPairs.X_avr);
  dY:=(Y-WrapPairs.Y_avr);
  if (dX <> 0)
   then begin
    A:=Arctan(dY/dX);
    if (dX < 0) then A:=A+PI;
    end
   else
    if (dY >= 0)
     then A:=PI/2
     else A:=-PI/2;
  dX:=(Xwrap-WrapPairs.Xwrap_avr);
  dY:=(Ywrap-WrapPairs.Ywrap_avr);
  if (dX <> 0)
   then begin
    Awrap:=Arctan(dY/dX);
    if (dX < 0) then Awrap:=Awrap+PI;
    end
   else
    if (dY >= 0)
     then Awrap:=PI/2
     else Awrap:=-PI/2;
  end;
//. translating
TranslateX:=WrapPairs.Xwrap_avr-WrapPairs.X_avr;
TranslateY:=WrapPairs.Ywrap_avr-WrapPairs.Y_avr;
//. scaling
_Scale:=0;
for I:=0 to WC-1 do with WrapPairs.Pairs[I] do _Scale:=_Scale+(Lwrap/L);
_Scale:=_Scale/WC;
//. rotation
Angle:=0;
for I:=0 to WC-1 do with WrapPairs.Pairs[I] do Angle:=Angle+(Awrap-A);
Angle:=Angle/WC;
//. transforming
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idPictureVisualization)) do
try
Space.Obj_GetRoot(idTObj,idObj, idTRoot,idRoot);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTRoot,idRoot)) do
try
Transform(WrapPairs.X_avr,WrapPairs.Y_avr,_Scale,Angle,TranslateX,TranslateY);
finally
Release;
end;
finally
Release;
end;
//.
memoMyPoints.Lines.Clear;
memoTargetPoints.Lines.Clear;
end;

procedure TfmDetailedPictureWrapper.PreparePointsListFromSpaceObj(const idTVisualization,idVisualization: integer; const List: TStrings);
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
begin
List.Clear;
with (TComponentFunctionality_Create(idTVisualization,idVisualization) as TBase2DVisualizationFunctionality) do
try
Space.ReadObj(Obj,SizeOf(Obj), Ptr);
ptrPoint:=Obj.ptrFirstPoint;
while (ptrPoint <> nilPtr) do begin
  Space.ReadObj(Point,SizeOf(TPoint), ptrPoint);
  List.Add(FloatToStr(Point.X)+'; '+FloatToStr(Point.Y));
  //.
  ptrPoint:=Point.ptrNextObj;
  end;
finally
Release;
end;
end;

procedure TfmDetailedPictureWrapper.sbProcessClick(Sender: TObject);
begin
Process;
end;

procedure TfmDetailedPictureWrapper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmDetailedPictureWrapper.sbPrepareFromContainerClick(Sender: TObject);
begin
PreparePointsListFromSpaceObj(idTDetailedPictureVisualization,idPictureVisualization, memoMyPoints.Lines);
end;

procedure TfmDetailedPictureWrapper.sbPreparefromClipboardVisualizationContainerClick(Sender: TObject);
begin
with TypesSystem do begin
if (NOT ClipBoard_flExist) then Raise Exception.Create('clipboard object is not exist'); //. =>
PreparePointsListFromSpaceObj(Clipboard_Instance_idTObj,Clipboard_Instance_idObj, memoTargetPoints.Lines);
end;
end;


end.
