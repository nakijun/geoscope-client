unit mulmatrix;
interface
uses Math, Ap, Sysutils;

procedure MultiplyMatrixes(const n : Integer;
     const m : Integer;
     const k : Integer;
     const A : TReal2DArray;
     const B : TReal2DArray;
     var C : TReal2DArray);

implementation

(*************************************************************************
Умножение матриц A (array [1.n, 1..m] of Real) и
матрицы B (array [1..m, 1..k] of Real).
*************************************************************************)
procedure MultiplyMatrixes(const n : Integer;
     const m : Integer;
     const k : Integer;
     const A : TReal2DArray;
     const B : TReal2DArray;
     var C : TReal2DArray);
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
            c[i,j] := 0;
            l:=1;
            while l<=m do
            begin
                c[i,j] := c[i,j]+a[i,l]*b[l,j];
                Inc(l);
            end;
            Inc(j);
        end;
        Inc(i);
    end;
end;


end.