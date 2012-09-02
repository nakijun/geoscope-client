unit unitCRC;
{Копирайт (c) 2003 Сергей Парунов. Частичный копирайт (предок функции
CRC32Stream и пара идей) Андрей Рубин.}
interface
uses Classes;


  function  CRC32Stream(const Source: TStream; Count: Integer; const BufSize: Cardinal = 1024): Cardinal;
  function MODULE_CRC(const MODULEName: string; const Position: integer; Size: integer): Cardinal;


implementation

function  CRC32Stream(const Source: TStream; Count: Integer; const BufSize: Cardinal = 1024): Cardinal;
var
  T: array [Byte] of Cardinal;
  I, D, J: Cardinal;

  procedure CRC32Next(const Data; const Count: Cardinal; var CRC32: Cardinal);
  var
    MyCRC32, I: Cardinal;           
    PData: ^Byte;
  begin
  PData:=@Data;
  MyCRC32:=CRC32; {в цикле - не var-переменная: так быстрее}
  for I:=1 to Count do begin
    MyCRC32:=MyCRC32 shr 8 xor T[MyCRC32 and $FF xor PData^];
    Inc(PData);
    end;
  CRC32:= MyCRC32;
  end;

var
  N: Cardinal;
  Buffer: Pointer;
begin
for I:=0 to 255 do begin
  D:=I;
  for J:= 1 to 8 do
    if Odd(D)
      then D:=D shr 1 xor $EDB88320 {образующий полином}
      else D:=D shr 1;
  T[I]:= D;
  end;
if Count < 0 then Count:=Source.Size;
GetMem(Buffer, BufSize);
try
Result:=Cardinal(not 0);
while Count <> 0 do begin
  if Cardinal(Count) > BufSize
    then N:= BufSize
    else N:= Count;
    Source.ReadBuffer(Buffer^, N);
    CRC32Next(Buffer^, N, Result);
    Dec(Count, N);
    end;
finally
FreeMem(Buffer);
end;
Result:=not Result;
end;

function MODULE_CRC(const MODULEName: string; const Position: integer; Size: integer): Cardinal;
var
  S: TMemoryStream;
begin
S:=TMemoryStream.Create;
try
S.LoadFromFile(MODULEName);
S.Position:=Position;
if Size = -1 then Size:=S.Size;
Result:=CRC32Stream(S,Size);
finally
S.Destroy;
end;
end;


end.
