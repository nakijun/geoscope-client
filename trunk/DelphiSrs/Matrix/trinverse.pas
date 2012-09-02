(*************************************************************************
Copyright (c) 1992-2007 The University of Tennessee.  All rights reserved.

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
unit trinverse;
interface
uses Math, Ap, Sysutils;

function InvTriangular(var A : TReal2DArray;
     N : Integer;
     IsUpper : Boolean;
     IsUnitTriangular : Boolean):Boolean;

implementation

(*************************************************************************
Обращение треугольной матрицы

Подпрограмма обращает следующие типы матриц:
    * верхнетреугольные
    * верхнетреугольные с единичной диагональю
    * нижнетреугольные
    * нижнетреугольные с единичной диагональю
    
В случае, если матрица верхне(нижне)треугольная, то  матрица,  обратная  к
ней, тоже верхне(нижне)треугольная, и после  завершения  работы  алгоритма
обратная матрица замещает переданную. При этом элементы расположенные ниже
(выше) диагонали не меняются в ходе работы алгоритма.

Если матрица с единичной  диагональю, то обратная к  ней  матрица  тоже  с
единичной  диагональю.  В  алгоритм  передаются  только    внедиагональные
элементы. При этом в результате работы алгоритма диагональные элементы  не
меняются.

Входные параметры:
    A           -   матрица. Массив с нумерацией элементов [1..N,1..N]
    N           -   размер матрицы
    IsUpper     -   True, если матрица верхнетреугольная
    IsUnitTriangular-   True, если матрица с единичной диагональю.
    
Выходные параметры:
    A           -   матрица, обратная к входной, если задача не вырождена.
    
Результат:
    True, если матрица не вырождена
    False, если матрица вырождена

  -- LAPACK routine (version 3.0) --
     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
     Courant Institute, Argonne National Lab, and Rice University
     February 29, 1992
*************************************************************************)
function InvTriangular(var A : TReal2DArray;
     N : Integer;
     IsUpper : Boolean;
     IsUnitTriangular : Boolean):Boolean;
var
    NOUNIT : Boolean;
    I : Integer;
    J : Integer;
    NMJ : Integer;
    JM1 : Integer;
    JP1 : Integer;
    V : Extended;
    AJJ : Extended;
    T : TReal1DArray;
    i_ : Integer;
begin
    Result := True;
    SetLength(T, N+1);
    
    //
    // Test the input parameters.
    //
    NOUNIT :=  not IsUnitTriangular;
    if IsUpper then
    begin
        
        //
        // Compute inverse of upper triangular matrix.
        //
        J:=1;
        while J<=N do
        begin
            if NOUNIT then
            begin
                if A[J,J]=0 then
                begin
                    Result := False;
                    Exit;
                end;
                A[J,J] := 1/A[J,J];
                AJJ := -A[J,J];
            end
            else
            begin
                AJJ := -1;
            end;
            
            //
            // Compute elements 1:j-1 of j-th column.
            //
            if J>1 then
            begin
                JM1 := J-1;
                for i_ := 1 to JM1 do
                begin
                    T[i_] := A[i_,J];
                end;
                I:=1;
                while I<=J-1 do
                begin
                    if I<J-1 then
                    begin
                        V := 0.0;
                        for i_ := I+1 to JM1 do
                        begin
                            V := V + A[I,i_]*T[i_];
                        end;
                    end
                    else
                    begin
                        V := 0;
                    end;
                    if NOUNIT then
                    begin
                        A[I,J] := V+A[I,I]*T[I];
                    end
                    else
                    begin
                        A[I,J] := V+T[I];
                    end;
                    Inc(I);
                end;
                for i_ := 1 to JM1 do
                begin
                    A[i_,J] := AJJ*A[i_,J];
                end;
            end;
            Inc(J);
        end;
    end
    else
    begin
        
        //
        // Compute inverse of lower triangular matrix.
        //
        J:=N;
        while J>=1 do
        begin
            if NOUNIT then
            begin
                if A[J,J]=0 then
                begin
                    Result := False;
                    Exit;
                end;
                A[J,J] := 1/A[J,J];
                AJJ := -A[J,J];
            end
            else
            begin
                AJJ := -1;
            end;
            if J<N then
            begin
                
                //
                // Compute elements j+1:n of j-th column.
                //
                NMJ := N-J;
                JP1 := J+1;
                for i_ := JP1 to N do
                begin
                    T[i_] := A[i_,J];
                end;
                I:=J+1;
                while I<=N do
                begin
                    if I>J+1 then
                    begin
                        V := 0.0;
                        for i_ := JP1 to I-1 do
                        begin
                            V := V + A[I,i_]*T[i_];
                        end;
                    end
                    else
                    begin
                        V := 0;
                    end;
                    if NOUNIT then
                    begin
                        A[I,J] := V+A[I,I]*T[I];
                    end
                    else
                    begin
                        A[I,J] := V+T[I];
                    end;
                    Inc(I);
                end;
                for i_ := JP1 to N do
                begin
                    A[i_,J] := AJJ*A[i_,J];
                end;
            end;
            Dec(J);
        end;
    end;
end;


end.