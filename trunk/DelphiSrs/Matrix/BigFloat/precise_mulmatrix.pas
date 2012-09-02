unit precise_mulmatrix;
interface
uses Math, BigFloat, precise_ap, Sysutils;

procedure Precise_MultiplyMatrixes(const n : Integer;
     const m : Integer;
     const k : Integer;
     const A : TPreciseReal2DArray;
     const B : TPreciseReal2DArray;
     var C : TPreciseReal2DArray);

implementation

(*************************************************************************
Умножение матриц A (array [1.n, 1..m] of Real) и
матрицы B (array [1..m, 1..k] of Real).
*************************************************************************)
procedure Precise_MultiplyMatrixes(const n : Integer;
     const m : Integer;
     const k : Integer;
     const A : TPreciseReal2DArray;
     const B : TPreciseReal2DArray;
     var C : TPreciseReal2DArray);
var
    I : Integer;
    J : Integer;
    L : Integer;
begin
    SetLength(C, n+1, k+1);
    i:=1;
    while i<=n do
    begin
        j:=1;
        while j<=k do
        begin
            c[i,j] := bfZero();
            l:=1;
            while l<=m do
            begin
                c[i,j] := bfAdd(c[i,j],bfMul(a[i,l],b[l,j]));
                Inc(l);
            end;
            Inc(j);
        end;
        Inc(i);
    end;
end;


end.