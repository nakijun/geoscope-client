{  Name of the unit:  BigFloat.pas
   Author: Alex Fihman, alex_fihman@mail.ru
   Version:  0.02
   Purpose: arithmetical operations on large status floating point values
   Status:   alpha
   Licence:  GPL
   Disclaimer: no warranty, use at your own risk

   version 0.02:
      - Read/write variable to XML
   version 0.01:
      - improved precision of bfVal for extended values,
      - Faster PI calculation - based on
        pi=176·arctan(1/57)+28·arctan(1/239)-48·arctan(1/682)+96·arctan(1/12943)
      - faster bfLn
      - on-spot constants re-calculation
      thanx to: Sasa Zeman (public@szutils.net, www.szutils.net)
   version 0.0: first version available...
}
unit BigFloat;
{$O-}  // optimizer doesn't work properly with inline assembler

interface

uses SysUtils,SysConst, math;

type arc = array of cardinal;

// main type
type TBigFloat = record
       sign: byte;
       data: arc;
       power: integer;
     end;

// precision is in 32 bit words, about 9.6 decimal digits per 1,
// default precision is 10, about 96 decimal digits
procedure SetPrecision(precision: integer); // call this procedure before using precision > 10
procedure CalcConstants(precision: integer);

function  DefaultPrecision: integer;
// math. constants used in calculations
var
    cPi:    TBigFloat; // pi = 3.1415926...
    cE:     TBigFloat; //  e = 2.7182818..
    cPi2:   TBigFloat; // 2*pi
    cPid2:  TBigFloat; // pi/2
    cPid4:  TBigFloat; // pi/4
    cAtan05,             // atan(0.5)
    cAtan32:  TBigFloat; // atan(1.5)
    cSqrt2:   TBigFloat; // sqrt(2)
    cSqrt0_5: TBigFloat; // sqrt(0.5)
    cLnR2:    TBigFloat; // ln(2)/2
    constants_precision: integer = -1;
// constants
function  bfOne: TBigFloat;
function  bfZero: TBigFloat;
function  bfPi(precision: integer): TBigFloat;overload;

// internal routines
procedure Normalize(var x: TBigFloat; precision: integer); overload;
function  realpower(x: TBigFloat): integer;
function  BigIntToStr(x: arc; pow: integer): string;
function CardinalToStr(x: cardinal; TrailingZeroes: boolean): string;
// internal approximate fast routines
function  ApproxDiv(x,y: TBigFloat): TBigFloat; // approximate division
function  ApproxLN(x: TBigFloat): extended;
function  ApproxLN10(x: TBigFloat): extended;

// input/output routines
function  bfToStr(const x: TBigFloat; digits: integer = 8): string;
function  bfToXML(const x: TBigFloat): string;
function  bfToFloat(const x: TBigFloat): extended;

function  bfVal(x: string; precision: integer): TBigFloat;overload;
function  bfVal(x: string): TBigFloat;overload;

// warning! using of following functions may result in loss of precision,
// as extended type is not precise enough. Use string argument instead, i.e. bfVal(x: string)
function  bfVal(x: extended): TBigFloat;overload;
function  bfVal(x: int64): TBigFloat;overload;
function  bfXMLVal(xml: string): TBigFloat;
// arithmetic routines
function  bfMul(x,y: TBigFloat; precision: integer): TBigFloat; overload;
function  bfMul(x,y: TBigFloat): TBigFloat; overload;
function  bfMultInt(x: TBigFloat; y: cardinal; precision: integer): TBigFloat; overload;
function  bfMultInt(x: TBigFloat; y: cardinal): TBigFloat; overload;

function  bfAdd(x,y: TBigFloat; precision: integer): TBigFloat; overload;
function  bfAdd(x,y: TBigFloat): TBigFloat; overload;
function  bfSub(x,y: TBigFloat; precision: integer): TBigFloat; overload;
function  bfSub(x,y: TBigFloat): TBigFloat; overload;


function  bfDivInt(x: TBigFloat;y: cardinal; precision: integer): TBigFloat; overload;
function  bfDivInt(x: TBigFloat;y: cardinal): TBigFloat; overload;
function  bfReciprocal(x: TBigFloat; precision: integer): TBigFloat; overload;  // 1/x
function  bfReciprocal(x: TBigFloat): TBigFloat; overload;  // 1/x
function  bfDiv(x,y: TBigFloat; precision: integer): TBigFloat; overload;
function  bfDiv(x,y: TBigFloat): TBigFloat; overload;

// comparison routines
function  bfMin(x,y: TBigFloat): TBigFloat;
function  bfMax(x,y: TBigFloat): TBigFloat;
function  Compare(x,y: TBigFloat): integer; // x<y -> -1, x=y -> 0, x>y -> 1
function  bfAbs(x: TBigFloat): TBigFloat;
function  bfIsZero(x: TBigFloat): boolean;

// square root, integer power
function  bfSqr(x: TBigFloat; precision: integer): TBigFloat; overload;
function  bfSqr(x: TBigFloat): TBigFloat; overload;

function  bfSqrt(x: TBigFloat;precision: integer): TBigFloat; overload;
function  bfSqrt(x: TBigFloat): TBigFloat; overload;
function  bfPow(x: TBigFloat; power: integer; precision: integer): TBigFloat; overload;
function  bfPow(x: TBigFloat; power: integer): TBigFloat; overload;

//trigonometric routines
function  SinRange(x: TBigFloat; precision: integer): TBigFloat; overload;
function  CosRange(x: TBigFloat; precision: integer): TBigFloat; overload;
function  bfSin(x: TBigFloat; precision: integer): TBigFloat; overload;
function  bfSin(x: TBigFloat): TBigFloat; overload;

function  bfCos(x: TBigFloat; precision: integer): TBigFloat; overload;
function  bfCos(x: TBigFloat): TBigFloat; overload;

function  bfTan(x: TBigFloat; precision: integer): TBigFloat; overload;
function  bfTan(x: TBigFloat): TBigFloat; overload;

function ArcSinRange(x: TBigFloat; precision: integer): TBigFloat;
function bfArcSin(x: TBigFloat; precision: integer): TBigFloat;overload;
function bfArcSin(x: TBigFloat): TBigFloat;overload;

function bfArcCos(x: TBigFloat; precision: integer): TBigFloat;overload;
function bfArcCos(x: TBigFloat): TBigFloat;overload;

function AtanRange(x: TBigFloat; precision: integer): TBigFloat;
function bfArcTan(x: TBigFloat; precision: integer): TBigFloat;overload;
function bfArcTan(x: TBigFloat): TBigFloat;overload;

function LnRange(x: TBigFloat;precision: integer): TBigFloat;
function bfLn(x: TBigFloat;precision: integer): TBigFloat; overload;
function bfLn(x: TBigFloat): TBigFloat; overload;

function ExpRange(x: TBigFloat;precision: integer): TBigFloat;
function bfExp(x: TBigFloat;precision: integer): TBigFloat; overload;
function bfExp(x: TBigFloat): TBigFloat; overload;

function bfFact(x: integer; precision: integer): TBigFloat; overload;
function bfFact(x: integer): TBigFloat; overload;

// integer conversion
function  bfFloor(x: TBigFloat): TBigFloat;
function  bfTrunc(x: TBigFloat): TBigFloat;


implementation

var fDefaultPrecision: integer = -100; // number of digits = (precicion-1) * 9.63 (log10(2^32))

{$IFNDEF VER150}
function sign(x: extended): integer;
begin
  result := 0;
  if x<0
  then
    result :=-1
  else
    if x>0 then result := 1;
end;
{$ENDIF}

procedure Normalize(var x: TBigFloat; precision: integer); overload;
var i,new_len: integer;
    tmp_data: arc;
begin
  // clear leading zeros
  new_len := length(x.data)-1;
  while (new_len>0) and (x.data[new_len]=0) do dec(new_len);

  new_len := new_len+1;
  SetLength(x.data,new_len);

  // truncate fixed part
  if new_len > precision  then
  begin
    SetLength(tmp_data, precision);

    for i:=0 to precision-1 do tmp_data[i]:=0;

    for i:=1 to min(precision,new_len) do
    tmp_data[precision-i] := x.data[new_len-i];

    x.data := tmp_data;
    x.power := x.power + new_len -  precision;
  end;
  // check for zero
  if length(x.data)=1 then
    if x.data[0]=0 then
    begin
      x.power := 0;
      x.sign  := 0;
    end;
end;

//parsing XML. doesn't work properly with &lt; and other characters, but it's enough for now...
function ParseVal(Xml: string; FieldName: string): string;
var
    p: integer;
    substr: string;
begin
  Result:='';
  p:=pos('<'+FieldName+'>',Xml);
  if p=0 then exit;
  substr:=copy(Xml,p+Length(FieldName)+2,length(Xml));
  p:=pos('<',Substr);
  if p=0 then exit;
  Result:=copy(substr,1,p-1);
end;


function  bfToStr(const x: TBigFloat; digits: integer = 8): string;
var p: integer;
    y,z: TBigFloat;
    l: integer;
    s: string;
    PrecNeeded: integer;
begin
  if bfIsZero(x) then
  begin
    result := '0.0';
    exit;
  end;

  PrecNeeded := 2 + floor(ln(10) * digits / ln(2) / 32);

  p := trunc(ApproxLN10(x));
  y := bfPow(bfVal(10),p-digits,PrecNeeded);
  if x.sign=1
  then
    result :='-'
  else
    result :='';
  z := bfDiv(x,y,PrecNeeded);
  z := bfAbs(z);
  y := bfVal('0.5',1);
  z := bfAdd(z,y,PrecNeeded);
  s:= BigIntToStr(z.data,-z.power);
  l := length(s);
  s := copy(s,1,1)+DecimalSeparator+copy(s,2,digits-1);
  while (pos(DecimalSeparator,s)<(length(s)-1)) and (s[Length(s)]='0') do
  SetLength(s,Length(s)-1);

  result := result + s;
  if (p-digits+l-1)<>0 then
    result := result + 'E'+IntToStr(p-digits+l-1);
end;

function  bfToXML(const x: TBigFloat): string;
var s: string;
    dt: string;
    dLength,i: integer;
begin
  s := '<BF><SIGN>'+IntToStr(x.sign)+'</SIGN>';
  s := s + '<POWER>'+IntToStr(x.power)+'</POWER>';
  dLength := Length(x.data);
  s := s + '<LENGTH>'+IntToStr(dLength)+'</LENGTH>';

  dt := '';
  for i:=dLength-1 downto 0 do
  begin
    dt := dt+IntToStr(x.data[i]);
    if i<>0 then dt := dt +';';
  end;
  s := s + '<DATA>' + dt + '</DATA></BF>';
  result := s;
end;

function  bfToFloat(const x: TBigFloat): extended;
var x1,x2: extended;
    i: integer;
begin
  x1 := power(4294967296,x.power);

  i := length(x.data)-1;

  x2 := 0;
  while i>=0 do
  begin
    x2 := x2 * 4294967296 + x.data[i];
    dec(i);
  end;
  result := x1 * x2;
  if x.sign=1 then result := - result;
end;

function  bfVal(x: string; precision: integer): TBigFloat;overload;
var ps,len,sign: integer;
    exp: string;
    e_pow: integer;
    PointFound: boolean;
    AfterPoint: integer;
begin
  x := UpperCase(x);
  ps := 1;
  len := length(x);

  result := bfZero;

  sign := 0;
  if x[ps] ='-' then
  begin
    sign := 1;
    inc(ps);
  end;

  PointFound := false;
  AfterPoint := 0;

  if pos('E',x)>0 then len := pos('E',x)-1;

  while ps<=len do
  begin
    if x[ps]=DecimalSeparator
    then
    if PointFound
      then
        raise EConvertError.CreateResFmt(@SInvalidFloat, [x])
      else begin
        PointFound := true;
        inc(ps);
      end
    else
    begin
      if not ((ord(x[ps])-$30) in [0..9])
      then
        raise EConvertError.CreateResFmt(@SInvalidFloat, [x]);
      result := bfMultInt(result,10,precision+2);
      result := bfAdd(result,bfVal(ord(x[ps])-$30),precision+2);
      inc(ps);
      if PointFound then inc(AfterPoint);
    end;
  end;

  e_pow := 0;
  if pos('E',x)>0
  then begin
    exp := copy(x,pos('E',x)+1,length(x));
    try
      e_pow := StrToInt(exp);
    except
      raise EConvertError.CreateResFmt(@SInvalidFloat, [x])
    end;
  end;

  result := bfMul(result,bfPow(bfVal(10),e_pow-AfterPoint,precision+2),precision+2);
  result.sign := sign;
  normalize(result,precision);
end;

function  bfVal(x: string): TBigFloat;overload;
begin
  result := bfVal(x,fDefaultPrecision);
end;

function  bfVal(x: extended): TBigFloat;overload;
type ext= packed record
       val0: cardinal;
       val1: cardinal;
       pow: word;
     end;
var x1: ext absolute x;
    x2: smallint absolute x1;
    shift  : integer;
    p1 : integer;
begin
  result.sign :=x1.pow shr 15;
  SetLength(result.data,2);
  p1 := x1.pow and $7FFF;
  result.data[0] := x1.val0;
  result.data[1] := x1.val1;
  result.power   := floor((p1-16446)/32);
  shift := p1-16446 - result.power*32;
  result := bfMultInt(result,1 shl shift,3);
end;

function  bfVal(x: int64): TBigFloat;overload;
begin
  result.sign  := 0;
  if x<0 then result.sign := 1;
  x := abs(x);

  result.power := 0;
  SetLength(result.data,2);

  result.data[0] := x and (4294967296-1);
  result.data[1] := x shr 32;
  normalize(result,2);
end;

function  bfXMLVal(xml: string): TBigFloat;
var data: string;
    pos1: integer;
    i: integer;
    s: string;
begin
  result.Sign := StrToInt(ParseVal(xml,'SIGN'));
  result.power := StrToInt(ParseVal(xml,'POWER'));
  SetLength(result.data,StrToInt(ParseVal(xml,'LENGTH')));
  data := ParseVal(xml,'DATA');
  i := length(result.data)-1;
  while data<>'' do
  begin
    pos1 := pos(';',data);
    if pos1=0 then pos1 := length(data)+1;
    s := copy(data,1,pos1-1);
    data := copy(data,pos1+1,length(data));
    result.data[i] := StrToInt64(s);
    dec(i);
  end;
end;

function  bfMul(x,y: TBigFloat; precision: integer): TBigFloat; overload;
var l1,l2: integer;
    i,j,pos: integer;
    s1,s2,s3: cardinal;
    x1,x2: cardinal;
begin
  l1 := length(x.data);
  l2 := length(y.data);
  result.sign := x.sign xor y.sign;
  SetLength(result.data,l1+l2+1);

  for i:=0 to l1+l2 do result.data[i] := 0;

  for pos:=0 to L1+L2-2 do
  begin
    s1 := result.data[pos];
    s2 := result.data[pos+1];
    s3 := result.data[pos+2];

    for i:=max(pos-L2+1,0) to min(pos,L1-1) do
    begin
      j := pos-i;
      x1 := x.data[i];
      x2 := y.data[j];

      asm
        mov eax,x1;
        mul x2;
        add s1,eax
        adc s2,edx
        adc s3,0
      end;
    end;

    result.data[pos]   := s1;
    result.data[pos+1] := s2;
    result.data[pos+2] := s3;
  end;

  result.power := x.power + y.power;
  Normalize(result,precision);
end;

function  bfMul(x,y: TBigFloat): TBigFloat; overload;
begin
  result := bfMul(x,y,fDefaultPrecision);
end;

function  bfMultInt(x: TBigFloat; y: cardinal; precision: integer): TBigFloat;
var i: integer;
    x0: Int64;
    y1: int64;
begin
  result.sign := x.sign;

  SetLength(result.data,length(x.data)+1);
  for i:=0 to length(result.data)-1 do
    result.data[i] := 0;

  result.power := x.power;

  y1 := y;

  for i:=0 to length(x.data)-1 do
  begin
    x0 := x.data[i] * y1 + result.data[i];
    result.data[i] := x0 and (4294967296 - 1);
    result.data[i+1] := x0 shr 32;
  end;
  normalize(result,precision);
end;

function  bfMultInt(x: TBigFloat; y: cardinal): TBigFloat;
begin
  result := bfMultInt(x,y,fDefaultPrecision);
end;

function  bfAdd(x,y: TBigFloat; precision: integer): TBigFloat; overload;
var x0,y0: cardinal;
    z0: int64;
    i: integer;
    px,py: integer;
    rpx,rpy: integer;
begin
  if bfIsZero(x) then
  begin
    result := y;
    normalize(result,precision);
    exit;
  end;

  if bfIsZero(y) then
  begin
    result := x;
    normalize(result,precision);
    exit;
  end;

  if y.sign <> x.sign then
  begin
    y.sign := x.sign;
    result := bfSub(x,y,precision);
    exit;
  end;

  rpx := RealPower(x);
  rpy := RealPower(y);

  SetLength(result.data,precision + 1);
  result.power := max(rpx,rpy) - precision  + 1;

  result.sign  := x.sign;
  z0 := 0;
  for i:=0 to precision do
  begin
    px := result.power-x.power + i;
    py := result.power-y.power + i;
    if (px>=0) and (px<length(x.data))
    then
      x0 := x.data[px]
    else
      x0 := 0;
    if (py>=0) and (py<length(y.data))
    then
      y0 := y.data[py]
    else
      y0 := 0;
    z0 := z0 + x0 + y0;
    result.data[i] := z0 and  (4294967296-1);
    z0 := z0 shr 32;
  end;

  normalize(result, precision);
end;

function  bfAdd(x,y: TBigFloat): TBigFloat; overload;
begin
  result := bfAdd(x,y,fDefaultPrecision);
end;

function  bfSub(x,y: TBigFloat; precision: integer): TBigFloat; overload;
var rpx,px,py,i: integer;
    x0,y0,z0,z1: int64;
    precision_tmp: integer;
begin
  if bfIsZero(x) then
  begin
    result := y;
    result.sign := result.sign xor 1;
    normalize(result,precision);
    exit;
  end;

  if bfIsZero(y) then
  begin
    result := x;
    normalize(result,precision);
    exit;
  end;

  if x.sign <> y.sign then
  begin
    y.sign := x.sign;
    result := bfAdd(x,y,precision);
    exit;
  end;

  z0 := 0;

  // x < y -> result := - (y-x)
  if Compare(bfAbs(x),bfAbs(y))<0 then
  begin
    result := bfSub(y,x,precision);
    result.sign := x.sign xor 1;
    exit;
  end;


  // x>y, x<>0, y<>0
  rpx := RealPower(x);

  precision_tmp := precision + 1;

  if length(x.data)>precision_tmp
    then precision_tmp:= length(x.data);
  if length(y.data)>precision_tmp
    then precision_tmp:= length(y.data);

  SetLength(result.data,precision_tmp);

  result.power := rpx - length(result.data) + 1;
  result.sign  := x.sign;

  for i:=0 to precision_tmp-1 do
  begin
    px := result.power-x.power + i;
    py := result.power-y.power + i;
    if (px>=0) and (px<length(x.data))
    then
      x0 := x.data[px]
    else
      x0 := 0;
    if (py>=0) and (py<length(y.data))
    then
      y0 := y.data[py]
    else
      y0 := 0;
    z0 := z0 - y0 + x0;
    z1 := floor(z0/4294967296);
    result.data[i] := z0 - (z1 * 4294967296);
    z0 := z1;
  end;

  normalize(result, precision);
end;

function  bfSub(x,y: TBigFloat): TBigFloat; overload;
begin
  result := bfSub(x,y,fDefaultPrecision);
end;

function  ApproxDiv(x,y: TBigFloat): TBigFloat;
var x1,x2: extended;
    i,rpx,rpy: integer;
begin
  if bfIsZero(y) then raise EZeroDivide.Create(SZeroDivide);
  
  rpx := RealPower(x);
  rpy := RealPower(y);

  i := length(x.data)-1;
  x1 := x.data[i];
  if i>0 then   x1 := x1 + x.data[i-1]/4294967296;

  i := length(y.data)-1;
  x2 := y.data[i];
  if i>0 then   x2 := x2 + y.data[i-1]/4294967296;

  x1 := x1/x2;

  result := bfVal(x1);
  result.sign := x.sign xor y.sign;
  result.power := result.power + rpx-rpy;

  normalize(result,2);
end;

function  bfDivInt(x: TBigFloat;y: cardinal; precision: integer): TBigFloat;
var i,l: integer;
    x1: int64;
begin
  SetLength(result.data, precision + 2);

  x1 := 0;
  l := length(x.data);
  for i:= 0 to precision+1 do
  begin
    if i< l then x1 := x1 + x.data[l-1-i];
    result.data[precision+1-i] := x1 div y;
    x1 :=(x1 mod y) * 4294967296;
  end;

  result.sign := x.sign;

  result.power := x.power + length(x.data)-precision-2;

  normalize(result,precision);
end;

function  bfDivInt(x: TBigFloat;y: cardinal): TBigFloat;
begin
  result := bfDivInt(x,y,fDefaultPrecision);
end;

function bfReciprocal(x: TBigFloat; precision: integer): TBigFloat;
var y1,y2,y3,b2: TBigFloat;
begin
  //yn+1 = yn(2 - xyn)
  b2 := bfOne;
  b2.data[0] := 2; // b2 := 2;
  y1 := ApproxDiv(bfOne,x);
  repeat
    y2 := bfMul(x,y1,precision+2);
    y2 := bfSub(b2,y2,precision+2);
    y2 := bfMul(y1,y2,precision+2);
    y3 := bfSub(y1,y2,precision+2);
    y1 := y2;
  until bfIsZero(y3) or (realpower(y3)<realpower(y1)-precision);
  result := y1;
  normalize(result,precision);
end;

function bfReciprocal(x: TBigFloat): TBigFloat;
begin
Result:=bfReciprocal(x,fDefaultPrecision);
end;

function  bfDiv(x,y: TBigFloat; precision: integer): TBigFloat; overload;
var z: TBigFloat;
begin
  z := bfReciprocal(y,precision+2);
  result := bfMul(x,z,precision);
end;

function  bfDiv(x,y: TBigFloat): TBigFloat; overload;
begin
  result := bfDiv(x,y,fDefaultPrecision);
end;

function  bfMin(x,y: TBigFloat): TBigFloat;
begin
  if compare(x,y)<0
  then result := x
  else result := y;
end;

function  bfMax(x,y: TBigFloat): TBigFloat;
begin
  if compare(x,y)<0
  then result := y
  else result := x;
end;

function  Compare(x,y: TBigFloat): integer;
var px,py,px1,py1: integer;
    i,l: integer;
    x0,y0: int64;
begin
  if x.sign<>y.sign then // different sign
  begin
    if x.sign=1
    then result := -1
    else result := 1;
    exit;
  end;

  // same sign, both negative
  if x.sign=1 then
  begin
    result := - compare(bfAbs(x),bfAbs(y)); // negative -> positive
    exit;
  end;

  if bfIsZero(x) and bfIsZero(y) then // x,y is zero
  begin
    result := 0;
    exit;
  end;

  if bfIsZero(x) then // x is zero
  begin
    result := -1;
    exit;
  end;

  if bfIsZero(y) then // y is zero
  begin
    result := 1;
    exit;
  end;

  // both positive, not zero


  px := RealPower(x);
  py := RealPower(y);
  if px>py then
  begin
    result := 1;
    exit;
  end;

  if px<py then
  begin
    result := -1;
    exit;
  end;

  l := max(length(x.data),length(y.data));
  result := 0;
  for i:=0 to l-1 do
  begin
    px1 := px - i - x.power;
    if (px1>=0) and (px1<length(x.data)) then
      x0 := x.data[px1] else x0 :=0;

    py1 := py - i - y.power;
    if (py1>=0) and (py1<length(y.data)) then
      y0 := y.data[py1] else y0 :=0;
    result := sign(x0-y0);
    if result <>0 then break;
  end;
end;

function  bfAbs(x: TBigFloat): TBigFloat;
begin
  result.sign := 0;
  result.data := x.data;
  result.power := x.power;
end;

function  bfSqr(x: TBigFloat; precision: integer): TBigFloat; overload;
begin
  result := bfMul(x,x,precision);
end;

function  bfSqr(x: TBigFloat): TBigFloat;
begin
  result := bfMul(x,x);
end;

function bfSqrt(x: TBigFloat; precision: integer): TBigFloat;
var y1,y2,y3: TBigFloat;
    rp,len: integer;
    x0: extended;
    b3: TBigFloat;
begin
  if bfIsZero(x) then
  begin
    result := bfZero;
    exit;
  end;

  if x.sign=1 then raise EInvalidOp.Create(SInvalidOp);

  // approx data
  rp := RealPower(x);
  len := length(x.data);
  x0 := x.data[len-1];
  if len>1
  then
    x0 := x0 + x.data[len-2]*(1/4294967296);
  if odd(rp)
  then
    x0 := x0 * 4294967296;
  y1 := bfVal(sqrt(x0));
  y1.power := y1.power + floor(rp/2);
  y1 := bfReciprocal(y1,2);

  // const
  b3 := bfOne;
  b3.data[0] := 3;
  // Newton method
  repeat
    y2 := bfSqr(y1,precision+2);
    y2 := bfMul(x,y2,precision+2);
    y2 := bfSub(b3,y2,precision+2);
    y2 := bfMul(y1,y2,precision+2);
    // y2 := y2/2
    y2 := bfMultInt(y2,2147483648,precision+2);
    y2.power := y2.power-1;

    y3 := bfSub(y1,y2,precision+2);
    y1 := y2;
  until bfIsZero(y3) or (realpower(y3)<realpower(y1)-precision);
  result := bfReciprocal(y1,precision);
end;


function  bfSqrt(x: TBigFloat): TBigFloat; overload;
begin
  result := bfSqrt(x,fDefaultPrecision);
end;

function  bfOne: TBigFloat;
begin
  result.sign :=0;
  result.power :=0;
  SetLength(result.data,1);
  result.data[0] := 1;
end;

function  bfZero: TBigFloat;
begin
  result.sign :=0;
  result.power :=0;
  SetLength(result.data,1);
  result.data[0] := 0;
end;

function  bfPow(x: TBigFloat; power: integer; precision: integer): TBigFloat; overload;
var t,r: TBigFloat;
    p1: cardinal;
begin
  t := x;
  r := bfOne;
  p1 := abs(power);
  while p1>0 do
  begin
    if odd(p1) then
      r := bfMul(r,t,precision);

    p1 := p1 shr 1;

    if p1<>0 then
      t := bfSqr(t,precision + 2);
  end;
  if power>=0
  then
    result := r
  else
    result := bfReciprocal(r, precision+2);
  Normalize(result,precision);
end;

function  bfPow(x: TBigFloat; power: integer): TBigFloat; overload;
begin
  result := bfPow(x,power,fDefaultPrecision);
end;

function  SinRange(x: TBigFloat; precision: integer): TBigFloat; overload;
var x_2, delta: TBigFloat;
    n: integer;
begin
  Result := x;
  Delta := x;
  x_2 := bfSqr(x,precision+2);
  n:=1;
  repeat
    Delta := bfMul(Delta,x_2,precision+2);
    n := n+1;
    Delta := bfDivInt(Delta,n,precision+2);
    n := n+1;
    Delta := bfDivInt(Delta,n,precision+2);
    Delta.sign := Delta.sign xor 1;
    Result := bfAdd(Result,delta,precision+2);
  until realpower(delta) < realpower(x)-(precision+2);
  normalize(result,precision);
end;

function  CosRange(x: TBigFloat; precision: integer): TBigFloat; overload;
var x_2, delta: TBigFloat;
    n: integer;
begin
  result := bfOne;
  Delta := bfOne;
  x_2 := bfSqr(x,precision+2);
  n:=0;
  repeat
    Delta := bfMul(Delta,x_2,precision+2);
    n := n+1;
    Delta := bfDivInt(Delta,n,precision+2);
    n := n+1;
    Delta := bfDivInt(Delta,n,precision+2);
    Delta.sign := Delta.sign xor 1;
    Result := bfAdd(Result,delta,precision+2);
  until realpower(delta) < realpower(x)-(precision+2);
  normalize(result,precision);
end;

function  bfSin(x: TBigFloat; precision: integer): TBigFloat; overload;
var x1:    TBigFloat;
    sign:  integer;
    PrecRequired: integer;
begin
  PrecRequired := max(RealPower(x),0) + precision +2;
  x1 := bfDiv(x,cPi2,PrecRequired);
  x1 := bfFloor(x1);
  x1 := bfSub(x,bfMul(x1,cPi2,PrecRequired),PrecRequired); // x1 in 0..2pi

  if Compare(x1,cPi) = 1   // x1 > pi -> x1 := x1-pi
  then begin
    sign := 1; // change sign of the result
    x1 := bfSub(x1,cPi,precision+2);
  end
  else
    sign := 0;  // x1 in 0..pi

  if Compare(x1,cPid2) = 1
  then
    x1 := bfSub(cPi,x1,precision+2); // x1 in 0..pi/2

  if Compare(x1,cPid4) = 1 then
  begin
    x1 := bfSub(cPid2,x1,precision+2); // x1 in 0..pi/4
    result := CosRange(x1,precision);
  end
  else
    result := SinRange(x1,precision);

  result.sign :=result.sign xor sign;
end;

function  bfSin(x: TBigFloat): TBigFloat; overload;
begin
  result := bfSin(x,fDefaultPrecision);
end;

function  bfCos(x: TBigFloat; precision: integer): TBigFloat; overload;
var x1:    TBigFloat;
    sign:  integer;
    PrecRequired: integer;
begin
  PrecRequired := max(RealPower(x),0) + precision +2;
  CalcConstants(PrecRequired);
  
  x1 := bfDiv(x,cPi2,PrecRequired);
  x1 := bfFloor(x1);
  x1 := bfSub(x,bfMul(x1,cPi2,PrecRequired),PrecRequired); // x1 in 0..2pi

  if Compare(x1,cPi) = 1   // x1 > pi -> x1 := x1-pi
  then begin
    sign := 1; // change sign of the result
    x1 := bfSub(x1,cPi,precision+2);
  end
  else
    sign := 0;  // x1 in 0..pi

  if Compare(x1,cPid2) = 1
  then begin
    x1 := bfSub(cPi,x1,precision+2); // x1 in 0..pi/2
    sign := sign xor 1;
  end;

  if Compare(x1,cPid4) = 1 then
  begin
    x1 := bfSub(cPid2,x1,precision+2); // x1 in 0..pi/4
    result := SinRange(x1,precision);
  end
  else
    result := CosRange(x1,precision);

  result.sign :=result.sign xor sign;
end;


function  bfCos(x: TBigFloat): TBigFloat; overload;
begin
  result := bfCos(x,fDefaultPrecision);
end;

function  bfTan(x: TBigFloat; precision: integer): TBigFloat; overload;
var x1, sn, cs: TBigFloat;
    PrecRequired: integer;
    sgn: integer;
begin
  //result := bfDiv(bfSin(x,precision+2),bfCos(x,precision+2),precision+2);
  //normalize(result,precision);
  sgn := 0;
  PrecRequired := max(RealPower(x),0) + precision +2;
  CalcConstants(PrecRequired);

  x1 := bfDiv(x,cPi,PrecRequired);
  x1 := bfFloor(x1);
  x1 := bfSub(x,bfMul(x1,cPi,PrecRequired),PrecRequired); // x1 in 0..2pi

  if Compare(x1,cPid2) = 1   // x1 > pi -> x1 := x1-pi
  then begin
    x1 := bfSub(cPi,x1,precision+2);
    sgn := 1;
  end;

  sn := bfSin(x1,precision+2);
  if Compare(bfAbs(sn),bfVal(0.99))>0   // cos(x) =(+/-) sqrt(1-sin^2(x))
  then
    cs := bfCos(x)
  else
    cs := bfSqrt(bfSub(bfOne,bfSqr(sn,precision+2),precision+2),precision+2);
  result := bfDiv(sn,cs,precision);
  result.sign := sgn;
end;

function  bfTan(x: TBigFloat): TBigFloat; overload;
begin
  result := bfTan(x,fDefaultPrecision);
end;

// x in [-0.5 .. 0.5]
// arcsin(x) = x + 1/2 (x^3/3) + (1/2)(3/4)(x^5/5) +
//                 (1/2)(3/4)(5/6)(x^7/7) + ...
function ArcSinRange(x: TBigFloat; precision: integer): TBigFloat;
var nn: integer;
    sq, delta,d2: TBigFloat;
begin
  result := x;
  sq := bfSqr(x,precision+2);
  delta := x;
  nn := 1;
  repeat
    delta := bfMul(delta,sq,precision+2);
    if nn>1 then
      delta := bfMultInt(delta,nn,precision+2);
    inc(nn);
    delta := bfDivInt(delta,nn,precision+2);
    inc(nn);
    d2 := bfDivInt(delta,nn,precision+2);
    result := bfAdd(result,d2,precision+2);
  until RealPower(delta)<RealPower(Result)-precision-2;
  normalize(result, precision);
end;

function bfArcSin(x: TBigFloat; precision: integer): TBigFloat;overload;
var z,t1: TBigFloat;
begin
  CalcConstants(precision);
  z := bfAbs(x);
  if Compare(z,bfVal(0.5))<0 then
  begin
    result := ArcSinRange(x,precision);
  end else
  begin
    t1 := bfSub(bfOne,z,precision+2);
    t1 := bfDivInt(t1,2,precision+2);
    t1 := bfSqrt(t1,precision+2);
    t1 := ArcSinRange(t1,precision+2);
    t1 := bfMultInt(t1,2,precision+2);
    result := bfSub(cPid2,t1,precision+2);
    result.sign := x.sign;
  end;
end;

function bfArcSin(x: TBigFloat): TBigFloat;overload;
begin
  result := bfArcSin(x,fDefaultPrecision);
end;

//  acos(x)  = pi/2 - asin(x)
function bfArcCos(x: TBigFloat; precision: integer): TBigFloat;overload;
begin
  result := bfSub(cPid2,bfArcSin(x,precision+2),precision);
end;

function bfArcCos(x: TBigFloat): TBigFloat;overload;
begin
  result := bfArcCos(x,fDefaultPrecision);
end;

// arctan(x) = x - x^3/3 + x^5/5 .... x in [-1..1]
function AtanRange(x: TBigFloat; precision: integer): TBigFloat;
var nn: integer;
    sq, delta,d2: TBigFloat;
begin
  result := x;
  delta  := x;
  sq := bfSqr(x,precision+2);
  nn := 1;
  repeat
    delta := bfMul(delta,sq,precision+2);
    inc(nn,2);
    delta.sign := delta.sign xor 1;
    d2 := bfDivInt(delta,nn,precision+2);
    result := bfAdd(result,d2,precision+2);
  until RealPower(delta)<RealPower(Result)-precision-2;
  normalize(result,precision);
end;

{* atan(x)
 * Method
 *   1. Reduce x to positive by atan(x) = -atan(-x).
 *   2. According to the integer k=4t+0.25 chopped, t=x, the argument
 *      is further reduced to one of the following intervals and the
 *      arctangent of t is evaluated by the corresponding formula:
 *
 *      [0,7/16]      atan(x) = t-t^3*(a1+t^2*(a2+...(a10+t^2*a11)...)
 *      [7/16,11/16]  atan(x) = atan(1/2) + atan( (t-0.5)/(1+t/2) )
 *      [11/16.19/16] atan(x) = atan( 1 ) + atan( (t-1)/(1+t) )
 *      [19/16,39/16] atan(x) = atan(3/2) + atan( (t-1.5)/(1+1.5t) )
 *      [39/16,INF]   atan(x) = atan(INF) + atan( -1/t )
 *
 *}
function bfArcTan(x: TBigFloat; precision: integer): TBigFloat;overload;
var z: TBigFloat;
    t1,t2: TBigFloat;
begin
  CalcConstants(precision);
  z := bfAbs(x);
  if Compare(z,bfVal(7/16)) < 0 then // 0..7/16
  begin
    result := AtanRange(z,precision);
  end else
  if Compare(z,bfVal(11/16)) < 0 then // 7/16..11/16
  begin
    // atan(x) = atan(1/2) + atan( (t-0.5)/(1+t/2) )
    t1 := bfSub(z,bfVal('0.5',precision+2),precision+2);
    t2 := bfAdd(bfDivInt(z,2,precision+2),bfOne,precision+2);
    t2 := bfDiv(t1,t2,precision+2);
    result := bfAdd(cAtan05,AtanRange(t2,precision+2),precision+2);
  end else // [11/16..19/16]
  if Compare(z,bfVal(19/16)) < 0 then // 11/16..19/16
  begin
    // tan(x) = atan( 1 ) + atan( (t-1)/(1+t) )
    t1 := bfSub(z,bfOne,precision+2);
    t2 := bfAdd(z,bfOne,precision+2);
    t2 := bfDiv(t1,t2,precision+2);
    result := bfAdd(cPid4,AtanRange(t2,precision+2),precision+2);
  end else // [19/16,39/16]
  if Compare(z,bfVal(39/16))<0 then
  begin
    // atan(x) = atan(3/2) + atan( (t-1.5)/(1+1.5t) )
    t1 := bfSub(z,bfVal('1.5',precision+2),precision+2);
    t2 := bfMul(z,bfVal('1.5',precision+2),precision+2);
    t2 := bfAdd(t2,bfOne,precision+2);
    t2 := bfDiv(t1,t2,precision+2);
    result := bfAdd(cAtan32,AtanRange(t2,precision+2),precision+2);
  end else //[39/16,INF]
  begin
    //       atan(x) = atan(INF) + atan( -1/t )
    t1 := bfReciprocal(z,precision+2);
    t1 := AtanRange(t1,precision+2);
    result := bfSub(cPid2,t1,precision+2);
  end;
  normalize(result,precision);
  result.sign := x.sign;
end;

function bfArcTan(x: TBigFloat): TBigFloat;overload;
begin
  result := bfArcTan(x,fDefaultPrecision);
end;

// Ln(x+1), x in [-0.5 .. 0.5]
function LnRange(x: TBigFloat;precision: integer): TBigFloat;
var Delta,y : TBigFloat;
    nn: integer;
begin
  if bfIsZero(x) then
  begin
    result := bfZero;
    exit;
  end;
  
  result := x;
  Delta := x;
  nn := 1;
  repeat
    Delta :=  bfMul(Delta,x,precision+2);
    Delta.sign := Delta.sign xor 1;
    inc(nn);
    y := bfDivInt(Delta,nn,precision+2);
    result := bfAdd(Result,y,precision+2);
  until RealPower(Delta)<RealPower(Result)-precision-2;
  normalize(result,precision);
end;

function bfLn(x: TBigFloat;precision: integer): TBigFloat;
var x1,y,c1,c2:   TBigFloat;
    appln2: int64;
    d,coeff: cardinal;
begin
  CalcConstants(precision);
  if compare(x,bfZero)<=0 then
    raise EInvalidOp.Create(SInvalidOp);

  y := x;
  y.power := y.power - RealPower(x);

  appln2 := RealPower(x)*32;
  d := x.data[length(x.data)-1];
  coeff := 1;
  while d>=2 do
  begin
    inc(appln2);
    d := d shr 1;
    coeff := coeff shl 1;
  end;

  if coeff>1 then
    x1 := bfDivInt(y,coeff,precision+2)
  else
    x1 := y;

  coeff := 1;
  c1 := bfVal(1.0000105766425497202348486284206);
  c2 := bfVal(0.99998942346931446424221059225372);
  while (compare(x1,c1)>0) or  // 2^(1/65536)
        (compare(x1,c2)<0) do // 2^(-1/65536)
  begin
    x1 := bfSqrt(x1,precision+2);
    coeff := coeff * 2;
  end;
  x1 := bfSub(x1,bfOne,precision+2);
  result := LnRange(x1,precision+2);
  result := bfMultInt(result,coeff,precision+2);
  if appln2<>0 then
  begin
    y := bfMul(cLnR2,bfVal(appln2*2),precision+2);
    result := bfAdd(result,y,precision+2);
  end;
  normalize(result,precision);
end;

function bfLn(x: TBigFloat): TBigFloat; overload;
begin
  result := bfLn(x,fDefaultPrecision);
end;

function ExpRange(x: TBigFloat;precision: integer): TBigFloat;
var Delta: TBigFloat;
    nn: integer;
begin
  result := bfOne;
  Delta := x;
  nn := 1;
  while RealPower(Delta) > RealPower(Result) - precision do
  begin
    Result := bfAdd(Result,Delta,precision);
    Delta := bfMul(Delta,x,precision);
    nn := nn + 1;
    Delta := bfDivInt(Delta,nn,precision);
  end;
end;

function bfExp(x: TBigFloat;precision: integer): TBigFloat; overload;
var x0: TBigFloat;
    //e: TBigFloat;
begin
  CalcConstants(precision);
  // x between -2..2 -> calc direct
  if (Compare(x,bfVal( 2)) =-1) and
     (Compare(x,bfVal(-2)) = 1) then
  begin
    result := ExpRange(x,precision);
    Exit;
  end;
  x0 := bfFloor(x);
  Result := bfPow(cE,trunc(bfToFloat(x0)),precision+2);
  x0 := bfSub(x,x0,precision+2);
  x0 := ExpRange(x0, precision+2);
  Result := bfMul(Result,x0,precision+2);
  normalize(result,precision);
end;

function bfExp(x: TBigFloat): TBigFloat; overload;
begin
  result := bfExp(x,fDefaultPrecision);
end;

function  realpower(x: TBigFloat): integer;
begin
  if bfIsZero(x)
  then
    result := -2147483647-1 // bug: Delphi doesn't understand -2147483648
  else
    result := x.power + length(x.data) - 1;
end;

//pi=176·arctan(1/57)+28·arctan(1/239)-48·arctan(1/682)+96·arctan(1/12943)
function  bfPi(precision: integer): TBigFloat;
var t1,t2,t3,t4: TBigFloat;
begin
  t1 := AtanRange(bfDivInt(bfOne,57,precision+1),precision+1);
  t1 := bfMultInt(t1,176,precision+1);
  t2 := AtanRange(bfDivInt(bfOne,239,precision+1),precision+1);
  t2 := bfMultInt(t2,28,precision+1);
  result := bfAdd(t1,t2,precision+1);
  t3 := AtanRange(bfDivInt(bfOne,682,precision+1),precision+1);
  t3 := bfMultInt(t3,48,precision+1);
  result := bfSub(result,t3,precision+1);
  t4 := AtanRange(bfDivInt(bfOne,12943,precision+1),precision+1);
  t4 := bfMultInt(t4,96,precision+1);
  result := bfAdd(result,t4,precision);
end;

function bfFact(x: integer; precision: integer): TBigFloat; overload;
var i: integer;
begin
  Result := bfOne;
  for i:=2 to x do
    Result := bfMultInt(result,i,precision);
end;

function bfFact(x: integer): TBigFloat; overload;
begin
  result := bfFact(x,fDefaultPrecision);
end;

function  bfFloor(x: TBigFloat): TBigFloat;
var i: integer;
    FracChanged: boolean;
begin

  if RealPower(x)<0
  then
    if compare(x,bfZero) < 0
    then
      result := bfVal('-1')
    else
      result := bfZero
  else begin
    result := x;
    FracChanged := false;    
    for i:=0 to -1-x.power do
    if i<length(result.data) then
      if result.data[i]<>0 then
      begin
        result.data[i] := 0;
        FracChanged := true;
      end;
    if (x.sign=1) and FracChanged then
      result := bfSub(result,bfOne);
  end;

end;

function  bfTrunc(x: TBigFloat): TBigFloat;
var i: integer;
begin
  if RealPower(x)<0
  then
    result := bfZero
  else begin
    result := x;
    for i:=0 to -1-x.power do
    if i<length(result.data) then
    result.data[i] := 0;
  end;
end;

function  bfIsZero(x: TBigFloat): boolean;
var l: integer;
begin
  l := length(x.data);
  result := (x.data[l-1] = 0);
end;

function  ApproxLN(x: TBigFloat): extended;
var l: integer;
    t: extended;
begin
  l := length(x.data);
  t := x.data[l-1];
  if l>1 then
  t := t + x.data[l-2]/4294967296;
  result := ln(t) + RealPower(x)*ln(2)*32;
end;

function  ApproxLN10(x: TBigFloat): extended;
var l: integer;
    t: extended;
begin
  l := length(x.data);
  t := x.data[l-1];
  if l>1 then
  t := t + x.data[l-2]/4294967296;
  result := ln(t)/ln(10) + RealPower(x)*ln(2)*32/ln(10);
end;

// x in range 0.. 999 999 999
function CardinalToStr(x: cardinal; TrailingZeroes: boolean): string;
var i: integer;
    m: byte;
begin
  if not TrailingZeroes
  then begin
    result := IntToStr(x);
    exit;
  end;

  SetLength(result,9);

  for i:=0 to 8 do
  begin
    m := x mod 10;
    x := x div 10;
    result[9-i] := chr($30+m);
  end;
end;

function  BigIntToStr(x: arc; pow: integer): string;
var i: integer;
    y: arc;
    l,r: integer;
    r0: int64;
    inarr,outarr,p: ^arc;
begin
  l := length(x);
  SetLength(y,l);
  r := l-1;
  inarr := @x;
  outarr := @y;

  result := '';
  while r>=pow do
  begin
    r0:=0;
    for i := r downto pow do
    begin
      r0 := r0 * 4294967296 + inarr^[i];
      outarr^[i] := r0 div 1000000000;
      r0 := r0 mod 1000000000;
    end;
    result := CardinalToStr(r0,r<>pow) + result;

    if r>=pow then
      if outarr^[r]=0 then dec(r);

    p := outarr;
    outarr := inarr;
    inarr  := p;
  end;
end;

procedure SetPrecision(precision: integer);
begin
  fDefaultPrecision := precision;
end;

procedure CalcConstants(precision: integer);
var t: TBigFloat;
    i: integer;
begin
  if constants_precision >= precision then exit;

  constants_precision := precision;
  cPi      := bfPi(precision+2);
  cPi2     := bfMultInt(cPi,2,precision+2);
  cPid2    := bfDivInt(cPi,2,precision+2);
  cPid4    := bfDivInt(cPi,4,precision+2);
  cAtan05  := AtanRange(bfVal('0.5',precision+2),precision+2);

  cAtan32  := bfSub(cPid2,AtanRange(bfDivInt(bfVal('2',precision+2),3,precision+2),precision+2),precision+2);
  cSqrt2   := bfSqrt(bfVal('2',precision+2),precision+2);
  cSqrt0_5 := bfSqrt(bfVal('0.5',precision+2),precision+2);
  t := bfVal(2);
  for i:=1 to 16 do t := bfSqrt(t,precision+4);
  t := bfSub(t,bfOne,precision+4);
  t := LnRange(t,precision+4);
  //cLnR2    := LnRange(bfSub(cSqrt2,bfOne,precision+2),precision+2);
  cLnR2 := bfMultInt(t,32768,precision+2);
  ce       := ExpRange(bfOne,precision+2);
end;

function  DefaultPrecision: integer;
begin
  result := fDefaultPrecision;
end;

initialization
  SetPrecision(10);
  CalcConstants(10);
end.
