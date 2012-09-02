unit unitSpline;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes;

type
  TAprNode = packed record
    X: Extended;
    Y: Extended;
  end;

  TAprNodes = array of TAprNode;

  TSPLCoef = record
    A1,A2,A3: Extended;
  end;

  TSPLCoefs = array of TSPLCoef;

  TExpSPLCoefs = record
    Adiff: Extended;
    Bdiff: Extended;
    ALFA: Extended;
    K: array of Extended;
  end;


  function SPL(const SPLCoef: TSPLCoef; const X0,Y0: Extended; const X: Extended): Extended;
  function ExpSPL(const ALFA: Extended; const K0,K1: Extended; const X0,Y0, X1,Y1: Extended; const X: Extended): Extended;
  procedure GetQubeSPLCoefficients(const AprNodes: TAprNodes; const LAMBDA0,MUN: Extended; const Adiff,Bdiff: Extended;  out SPLCoefs: TSPLCoefs);
  procedure GetExpSPLCoefficients(const AprNodes: TAprNodes; const ALFA: Extended; const Adiff,Bdiff: Extended;  out ExpSPLCoefs: TExpSPLCoefs);


implementation
Uses
  Math;


function SPL(const SPLCoef: TSPLCoef; const X0,Y0: Extended; const X: Extended): Extended;
begin
Result:=Y0+SPLCoef.A1*(X-X0)+SPLCoef.A2*(X-X0)*(X-X0)+SPLCoef.A3*(X-X0)*(X-X0)*(X-X0);
end;

function ExpSPL(const ALFA: Extended; const K0,K1: Extended; const X0,Y0, X1,Y1: Extended; const X: Extended): Extended;
begin
Result:=
  (K0/ALFA)*SinH(Sqrt(ALFA)*(X1-X))/SinH(Sqrt(ALFA)*(X1-X0))+
  (K1/ALFA)*SinH(Sqrt(ALFA)*(X-X0))/SinH(Sqrt(ALFA)*(X1-X0))+
  (Y0-K0/ALFA)*((X1-X)/(X1-X0))+
  (Y1-K1/ALFA)*((X-X0)/(X1-X0));
end;


procedure GetQubeSPLCoefficients(const AprNodes: TAprNodes; const LAMBDA0,MUN: Extended; const Adiff,Bdiff: Extended;  out SPLCoefs: TSPLCoefs);
var
  h: array of Extended;
  X: Extended;
  I: integer;
  LAMBDA: array of Extended;
  MU: array of Extended;
  d: array of Extended;
  p: array of Extended;
  z: array of Extended;
  K: array of Extended;
begin
//. "h" calculating
SetLength(h,Length(AprNodes)-1);
X:=AprNodes[0].X;
for I:=1 to Length(AprNodes)-1 do begin
  h[I-1]:=AprNodes[I].X-X;
  X:=AprNodes[I].X;
  end;
//. "LAMBDA","MU" calculating
SetLength(LAMBDA,Length(h));
LAMBDA[0]:=LAMBDA0;
for I:=1 to Length(h)-1 do LAMBDA[I]:=h[I]/(h[I]+H[I-1]);
SetLength(MU,Length(h));
for I:=0 to (Length(h)-1)-1 do MU[I]:=h[I]/(h[I]+H[I+1]);
MU[Length(h)-1]:=MUN; 
//. "d" calculating
SetLength(d,Length(AprNodes));
d[0]:=(6/h[0])*((AprNodes[1].Y-AprNodes[0].Y)/h[0]-Adiff);
d[Length(d)-1]:=(6/h[Length(h)-1])*(Bdiff-(AprNodes[Length(AprNodes)-1].Y-AprNodes[Length(AprNodes)-2].Y)/h[Length(h)-1]);
for I:=1 to (Length(d)-1)-1 do d[I]:=(6/(h[I-1]+h[I]))*(((AprNodes[I+1].Y-AprNodes[I].Y)/h[I])-((AprNodes[I].Y-AprNodes[I-1].Y)/h[I-1]));
//. "p","z" calculating
SetLength(p,Length(AprNodes));
SetLength(z,Length(AprNodes));
p[0]:=2;
for I:=1 to Length(p)-1 do p[I]:=2-(LAMBDA[I-1]/p[I-1])*MU[I-1];
z[0]:=d[0];
for I:=1 to Length(z)-1 do z[I]:=d[I]-(z[I-1]/p[I-1])*MU[I-1];
//. "K" calculating
SetLength(K,Length(AprNodes));
K[Length(K)-1]:=z[Length(z)-1]/p[Length(p)-1];
for I:=(Length(K)-1)-1 downto 0 do K[I]:=(z[I]-LAMBDA[I]*K[I+1])/p[I];
//. finally "A1","A2","A3" calculating
SetLength(SPLCoefs,Length(AprNodes)-1);
for I:=0 to Length(SPLCoefs)-1 do with SPLCoefs[I] do begin
  A1:=(AprNodes[I+1].Y-AprNodes[I].Y)/h[I]-h[I]*(K[I+1]/6+K[I]/3);
  A2:=K[I]/2;
  A3:=(K[I+1]-K[I])/(6*h[I]);
  end;
//.
end;

procedure GetExpSPLCoefficients(const AprNodes: TAprNodes; const ALFA: Extended; const Adiff,Bdiff: Extended;  out ExpSPLCoefs: TExpSPLCoefs);
var
  h: array of Extended;
  X: Extended;
  I: integer;
  d: array of Extended;
  a: array of Extended;
  b: array of Extended;
  c: array of Extended;
  p: array of Extended;
  z: array of Extended;
begin
//. "h" calculating
SetLength(h,Length(AprNodes)-1);
X:=AprNodes[0].X;
for I:=1 to Length(AprNodes)-1 do begin
  h[I-1]:=AprNodes[I].X-X;
  X:=AprNodes[I].X;
  end;
//. "d" calculating
SetLength(d,Length(AprNodes));
d[0]:=Adiff-(AprNodes[1].Y-AprNodes[0].Y)/h[0];
d[Length(d)-1]:=Bdiff-(AprNodes[Length(AprNodes)-1].Y-AprNodes[Length(AprNodes)-2].Y)/h[Length(h)-1];
for I:=1 to (Length(d)-1)-1 do d[I]:=(AprNodes[I+1].Y-AprNodes[I].Y)/h[I]-(AprNodes[I].Y-AprNodes[I-1].Y)/h[I-1];
//. "a","b","c" calculating
SetLength(a,Length(AprNodes)-1);
SetLength(b,Length(AprNodes));
SetLength(c,Length(AprNodes)-1);
for I:=0 to Length(a)-1 do a[I]:=(1/(ALFA*h[I])-1/(Sqrt(ALFA)*SinH(Sqrt(ALFA)*h[I])));
b[0]:=(-1/(ALFA*h[0])-CosH(Sqrt(ALFA)*h[0])/SinH(Sqrt(ALFA)*h[0]));
for I:=1 to (Length(b)-1)-1 do b[I]:=(CosH(Sqrt(ALFA)*h[I-1])/SinH(Sqrt(ALFA)*h[I-1])+CosH(Sqrt(ALFA)*h[I])/SinH(Sqrt(ALFA)*h[I]))*(1/Sqrt(ALFA))-(1/ALFA)*(1/h[I-1]+1/h[I]);
b[Length(b)-1]:=CosH(Sqrt(ALFA)*h[Length(h)-1])/(Sqrt(ALFA)*SinH(Sqrt(ALFA)*h[Length(h)-1]))-1/(ALFA*h[Length(h)-1]);
c[0]:=(1/(ALFA*h[0])+1/(Sqrt(ALFA)*SinH(Sqrt(ALFA)*h[0])));
for I:=1 to Length(c)-1 do c[I]:=1/(ALFA*h[I])-1/(Sqrt(ALFA)*SinH(Sqrt(ALFA)*h[I]));
//. "p","z" calculating
SetLength(p,Length(AprNodes));
SetLength(z,Length(AprNodes));
p[0]:=b[0];
for I:=1 to Length(p)-1 do p[I]:=b[i]-(c[I-1]/p[I-1])*a[I-1];
z[0]:=d[0];
for I:=1 to Length(z)-1 do z[I]:=d[I]-(z[I-1]/p[I-1])*a[I-1];
//. "K" calculating
ExpSPLCoefs.Adiff:=Adiff;
ExpSPLCoefs.Bdiff:=Bdiff;
ExpSPLCoefs.ALFA:=ALFA;
with ExpSPLCoefs do begin
SetLength(K,Length(AprNodes));
K[Length(K)-1]:=z[Length(z)-1]/p[Length(p)-1];
for I:=(Length(K)-1)-1 downto 0 do K[I]:=(z[I]-c[I]*K[I+1])/p[I];
end;
//.
end;


end.
