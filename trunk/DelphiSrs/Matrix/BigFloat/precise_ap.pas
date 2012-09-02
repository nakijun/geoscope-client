unit precise_ap;

interface

uses Math,BigFloat;

/////////////////////////////////////////////////////////////////////////
// constants
/////////////////////////////////////////////////////////////////////////
const
    MachineEpsilon = 5E-16;
    MaxRealNumber = 1E300;
    MinRealNumber = 1E-300;

/////////////////////////////////////////////////////////////////////////
// arrays
/////////////////////////////////////////////////////////////////////////
type
    TInteger1DArray     = array of LongInt;
    TPreciseReal1DArray = array of TBigFloat;
    TBoolean1DArray     = array of Boolean;

    TInteger2DArray     = array of array of LongInt;
    TPreciseReal2DArray = array of array of TBigFloat;
    TBoolean2DArray     = array of array of Boolean;


/////////////////////////////////////////////////////////////////////////
// Functions/procedures
/////////////////////////////////////////////////////////////////////////
function RandomReal():Extended;
function RandomInteger(I : Integer):Integer;

function DynamicArrayCopy(const A: TInteger1DArray):TInteger1DArray;overload;
function DynamicArrayCopy(const A: TPreciseReal1DArray): TPreciseReal1DArray;overload;
function DynamicArrayCopy(const A: TBoolean1DArray):TBoolean1DArray;overload;

function DynamicArrayCopy(const A: TInteger2DArray):TInteger2DArray;overload;
function DynamicArrayCopy(const A: TPreciseReal2DArray): TPreciseReal2DArray;overload;
function DynamicArrayCopy(const A: TBoolean2DArray):TBoolean2DArray;overload;

implementation

/////////////////////////////////////////////////////////////////////////
// Functions/procedures
/////////////////////////////////////////////////////////////////////////
function AbsReal(X : Extended):Extended;
begin
    Result := Abs(X);
end;

function AbsInt (I : Integer):Integer;
begin
    Result := Abs(I);
end;

function RandomReal():Extended;
begin
    Result := Random;
end;

function RandomInteger(I : Integer):Integer;
begin
    Result := Random(I);
end;

function Sign(X:Extended):Integer;
begin
    if X>0 then
        Result := 1
    else if X<0 then
        Result := -1
    else
        Result := 0;
end;

/////////////////////////////////////////////////////////////////////////
// dynamical arrays copying
/////////////////////////////////////////////////////////////////////////
function DynamicArrayCopy(const A: TInteger1DArray):TInteger1DArray;overload;
var
    I:  Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
        Result[I]:=A[I];
end;

function DynamicArrayCopy(const A: TPreciseReal1DArray): TPreciseReal1DArray;overload;
var
    I:  Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
        Result[I]:=A[I];
end;

function DynamicArrayCopy(const A: TBoolean1DArray):TBoolean1DArray;overload;
var
    I:  Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
        Result[I]:=A[I];
end;

function DynamicArrayCopy(const A: TInteger2DArray):TInteger2DArray;overload;
var
    I,J:    Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
    begin
        SetLength(Result[I], High(A[I])+1);
        for J:=Low(A[I]) to High(A[I]) do
            Result[I,J]:=A[I,J];
    end;
end;

function DynamicArrayCopy(const A: TPreciseReal2DArray): TPreciseReal2DArray;overload;
var
    I,J:    Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
    begin
        SetLength(Result[I], High(A[I])+1);
        for J:=Low(A[I]) to High(A[I]) do
            Result[I,J]:=A[I,J];
    end;
end;

function DynamicArrayCopy(const A: TBoolean2DArray):TBoolean2DArray;overload;
var
    I,J:    Integer;
begin
    SetLength(Result, High(A)+1);
    for I:=Low(A) to High(A) do
    begin
        SetLength(Result[I], High(A[I])+1);
        for J:=Low(A[I]) to High(A[I]) do
            Result[I,J]:=A[I,J];
    end;
end;


end.
