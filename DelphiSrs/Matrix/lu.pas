(*************************************************************************
Copyright (c) 1992-2007 The University of Tennessee. All rights reserved.

Contributors:
    * Sergey Bochkanov (ALGLIB project). Translation from FORTRAN to
      pseudocode.

See subroutines comments for additional copyrights.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

- Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

- Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer listed
  in this license in the documentation and/or other materials
  provided with the distribution.

- Neither the name of the copyright holders nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*************************************************************************)
unit lu;
interface
uses Math, Ap, Sysutils;

procedure LUDecomposition(var A : TReal2DArray;
     M : Integer;
     N : Integer;
     var Pivots : TInteger1DArray);
procedure LUDecompositionUnpacked(A : TReal2DArray;
     M : Integer;
     N : Integer;
     var L : TReal2DArray;
     var U : TReal2DArray;
     var Pivots : TInteger1DArray);

implementation

(*************************************************************************
LU-разложение матрицы общего вида размера M x N

Подпрограмма вычисляет LU-разложение прямоугольной матрицы общего  вида  с
частичным выбором ведущего элемента (с перестановками строк).

Входные параметры:
    A       -   матрица A. Нумерация элементов: [1..M, 1..N]
    M       -   число строк в матрице A
    N       -   число столбцов в матрице A

Выходные параметры:
    A       -   матрицы L и U в компактной форме (см. ниже).
                Нумерация элементов: [1..M, 1..N]
    Pivots  -   матрица перестановок в компактной форме (см. ниже).
                Нумерация элементов: [1..Min(M,N)]
                
Матрица A представляется, как A = P * L * U, где P - матрица перестановок,
матрица L - нижнетреугольная (или нижнетрапецоидальная, если M>N) матрица,
U - верхнетреугольная (или верхнетрапецоидальная, если M<N) матрица.

Рассмотрим разложение более подробно на примере при M=4, N=3:

                   (  1          )    ( U11 U12 U13  )
A = P1 * P2 * P3 * ( L21  1      )  * (     U22 U23  )
                   ( L31 L32  1  )    (         U33  )
                   ( L41 L42 L43 )
                   
Здесь матрица L  имеет  размер  M  x  Min(M,N),  матрица  U  имеет  размер
Min(M,N) x N, матрица  P(i)  получается  путем  перестановки  в  единичной
матрице размером M x M строк с номерами I и Pivots[I]

Результатом работы алгоритма являются массив Pivots  и  следующая матрица,
замещающая  матрицу  A,  и  сохраняющая  в компактной форме матрицы L и U
(пример приведен для M=4, N=3):

 ( U11 U12 U13 )
 ( L21 U22 U23 )
 ( L31 L32 U33 )
 ( L41 L42 L43 )

Как видно, единичная диагональ матрицы L  не  сохраняется.
Если N>M, то соответственно меняются размеры матриц и расположение
элементов.

  -- LAPACK routine (version 3.0) --
     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
     Courant Institute, Argonne National Lab, and Rice University
     June 30, 1992
*************************************************************************)
procedure LUDecomposition(var A : TReal2DArray;
     M : Integer;
     N : Integer;
     var Pivots : TInteger1DArray);
var
    I : Integer;
    J : Integer;
    JP : Integer;
    T1 : TReal1DArray;
    s : Extended;
    i_ : Integer;
begin
    SetLength(Pivots, Min(M, N)+1);
    SetLength(T1, Max(M, N)+1);
    Assert((M>=0) and (N>=0), 'Error in LUDecomposition: incorrect function arguments');
    
    //
    // Quick return if possible
    //
    if (M=0) or (N=0) then
    begin
        Exit;
    end;
    J:=1;
    while J<=Min(M, N) do
    begin
        
        //
        // Find pivot and test for singularity.
        //
        JP := J;
        I:=J+1;
        while I<=M do
        begin
            if AbsReal(A[I,J])>AbsReal(A[JP,J]) then
            begin
                JP := I;
            end;
            Inc(I);
        end;
        Pivots[J] := JP;
        if A[JP,J]<>0 then
        begin
            
            //
            //Apply the interchange to rows
            //
            if JP<>J then
            begin
                for i_ := 1 to N do
                begin
                    T1[i_] := A[J,i_];
                end;
                for i_ := 1 to N do
                begin
                    A[J,i_] := A[JP,i_];
                end;
                for i_ := 1 to N do
                begin
                    A[JP,i_] := T1[i_];
                end;
            end;
            
            //
            //Compute elements J+1:M of J-th column.
            //
            if J<M then
            begin
                
                //
                // CALL DSCAL( M-J, ONE / A( J, J ), A( J+1, J ), 1 )
                //
                JP := J+1;
                S := 1/A[J,J];
                for i_ := JP to M do
                begin
                    A[i_,J] := S*A[i_,J];
                end;
            end;
        end;
        if J<Min(M, N) then
        begin
            
            //
            //Update trailing submatrix.
            //CALL DGER( M-J, N-J, -ONE, A( J+1, J ), 1, A( J, J+1 ), LDA,A( J+1, J+1 ), LDA )
            //
            JP := J+1;
            I:=J+1;
            while I<=M do
            begin
                S := A[I,J];
                for i_ := JP to N do
                begin
                    A[I,i_] := A[I,i_] - S*A[J,i_];
                end;
                Inc(I);
            end;
        end;
        Inc(J);
    end;
end;


(*************************************************************************
LU-разложение матрицы общего вида размера M x N

Использует  LUDecomposition.   По  функциональности  отличается  тем,  что
выводит  матрицы  L  и  U не в компактной форме, а в виде отдельных матриц
общего вида, заполненных в соответствующих местах нулевыми элементами.

Подпрограмма приведена исключительно для демонстрации того, как
"распаковывается" результат работы подпрограммы LUDecomposition

  -- ALGLIB --
     Copyright 2005 by Bochkanov Sergey
*************************************************************************)
procedure LUDecompositionUnpacked(A : TReal2DArray;
     M : Integer;
     N : Integer;
     var L : TReal2DArray;
     var U : TReal2DArray;
     var Pivots : TInteger1DArray);
var
    I : Integer;
    J : Integer;
    MinMN : Integer;
begin
    A := DynamicArrayCopy(A);
    if (M=0) or (N=0) then
    begin
        Exit;
    end;
    MinMN := Min(M, N);
    SetLength(L, M+1, MinMN+1);
    SetLength(U, MinMN+1, N+1);
    LUDecomposition(A, M, N, Pivots);
    I:=1;
    while I<=M do
    begin
        J:=1;
        while J<=MinMN do
        begin
            if J>I then
            begin
                L[I,J] := 0;
            end;
            if J=I then
            begin
                L[I,J] := 1;
            end;
            if J<I then
            begin
                L[I,J] := A[I,J];
            end;
            Inc(J);
        end;
        Inc(I);
    end;
    I:=1;
    while I<=MinMN do
    begin
        J:=1;
        while J<=N do
        begin
            if J<I then
            begin
                U[I,J] := 0;
            end;
            if J>=I then
            begin
                U[I,J] := A[I,J];
            end;
            Inc(J);
        end;
        Inc(I);
    end;
end;


end.