unit UnitLinearMemory;

interface
Uses
  SysUtils, Windows, Classes, ActiveX, unitIDsCach;

type
  TAddress = type integer;
  
  TProcProvideData = procedure (const Address: TAddress; Size: integer;  ptrData: pointer) of object;

  TLinearMemory = class
  public
    procedure Clear; virtual; abstract;
    function Mem_Read(var Mem; Size: integer;const Address: TAddress): boolean; virtual; abstract;
    function Mem_Write(var Mem; Size: integer;var Address: TAddress): boolean; virtual; abstract;
    procedure Mem_WriteGroup(const ptrGroup: pointer; const ptrGroupDATA: pointer); virtual; register;
    function isMemNull(var Mem;Size: integer; Address: TAddress): boolean; virtual; abstract;
  end;

type
  TRealMemory = class (TLinearMemory)
  public
    ptrBuff: pointer;
    Size: integer;

    Constructor Create(const Origin: TAddress; pSize: integer; pflLoaded: boolean);
    destructor Destroy; override;
    procedure Clear; override;
    procedure Increase(const Delta: integer);
    function Mem_Read(var Mem; Size: integer;const Address: TAddress): boolean; override;
    function Mem_Write(var Mem; Size: integer;var Address: TAddress): boolean; override;
    function isMemNull(var Mem;Size: integer; Address: TAddress): boolean; override;
  end;

type
  TMemBlock = record
    ptrNext: pointer;

    cntLoading: integer;
    Address: TAddress;
    Size: word;
    ptrData: pointer;
  end;

  TVirtualMemory = class (TLinearMemory)
  private
    Blocks: pointer;

    procedure TMemBlock_Create(const pAddress: TAddress; pSize: integer; var ptrNewBlock: pointer);
    procedure TMemBlock_Destroy(var ptrBlock: pointer);
    procedure GetMemPointer(const pAddress: TAddress; pSize: integer;  var P: pointer);
  public
    Constructor Create();
    destructor Destroy; override;
    function Mem_Read(var Mem; Size: integer;const Address: TAddress): boolean; override;
    function Mem_Write(var Mem; Size: integer;var Address: TAddress): boolean; override;
    procedure Empty;
  end;

const
  TSegMemory_SegmentSizePowerOf2 = 7;
  TSegMemory_SegmentSize = (1 SHL TSegMemory_SegmentSizePowerOf2);
  TSegMemory_SegmentOffsetMask = $7F;
type
  TSegMemory = class (TLinearMemory)
  private
    function CreateNewSegment: pointer;
    procedure DestroySegment(var ptrSegment: pointer);
  public
    Segments: TIDsCach;

    Constructor Create;
    destructor Destroy; override;
    procedure Clear; override;
    function Mem_Read(var Mem; Size: integer; const Address: TAddress): boolean; override;
    function Mem_Write(var Mem; Size: integer; var Address: TAddress): boolean; override;
    function isMemNull(var Mem; Size: integer; Address: TAddress): boolean; override;
    procedure SaveToStream(out Stream: TMemoryStream);
    procedure LoadFromStream(const Stream: TMemoryStream);
  end;


implementation


{TLinearMemory}
procedure TLinearMemory.Mem_WriteGroup(const ptrGroup: pointer; const ptrGroupDATA: pointer); assembler;
asm
   PUSH EBX
   PUSH ESI
   PUSH EDI
   MOV ESI,EDX
   MOV EBX,ECX
   MOV EDI,[EAX].TRealMemory.ptrBuff
   CLD
   LODSD //. get ItemsCount
   MOV ECX,EAX
@M1: PUSH ECX
     LODSD //. get ptrObj
     PUSH EDI
     ADD EDI,EAX
     LODSB //. get SizeOf(Obj)
     XOR ECX,ECX
     MOV CL,AL
     XCHG EBX,ESI

     MOV EAX,ECX
     SHR ECX,1
     SHR ECX,1
     CLD
     REP MOVSD
     MOV ECX,EAX
     AND ECX,3
     REP MOVSB

     XCHG EBX,ESI
     POP EDI
     POP ECX
     LOOP @M1
   POP EDI
   POP ESI
   POP EBX
end;



{TRealMemory}
Constructor TRealMemory.Create(const Origin: TAddress; pSize: integer; pflLoaded: boolean);
begin
Inherited Create;
Size:=pSize;
GetMem(ptrBuff,Size);
//. пробуем фиксировать память в ОЗУ
/// ? VirtualLock(ptrBuff,Size);
Clear;
end;

destructor TRealMemory.Destroy;
begin
FreeMem(ptrBuff,Size);
Inherited;
end;

procedure TRealMemory.Clear;
begin
asm
   PUSH EDI
   MOV EAX,Self
   MOV EDI,[EAX].ptrBuff
   MOV ECX,[EAX].Size
   XOR AL,AL
   CLD
   REP STOSB
   POP EDI
end;
end;

procedure TRealMemory.Increase(const Delta: integer);
var
  NewSize: integer;
begin
NewSize:=Size+Delta;
ReAllocMem(ptrBuff,NewSize);
asm
   PUSH EDI
   MOV EAX,Self
   MOV EDI,[EAX].ptrBuff
   MOV EDX,[EAX].Size
   MOV ECX,NewSize
   ADD EDI,EDX
   SUB ECX,EDX
   XOR AL,AL
   CLD
   REP STOSB
   POP EDI
end;
Size:=NewSize;
end;

function TRealMemory.isMemNull(var Mem;Size: integer; Address: TAddress): boolean; assembler; register;
asm
         PUSH ESI
         PUSH EDI
         MOV ESI,[EAX].TRealMemory.ptrBuff
         ADD ESI,Address
@M0:     SHR ECX,1 //. there is enough one half of object for zero-checking
         MOV EAX,ECX
         SHR ECX,1
         SHR ECX,1
         JECXZ @M2
  @M1:     CMP DWord ptr [ESI],0
           JNE @MFalse
           ADD ESI,4
           LOOP @M1
@M2:     MOV ECX,EAX
         AND ECX,3
         JECXZ @MTrue
  @M3:     CMP Byte ptr [ESI],0
           JNE @MFalse
           INC ESI
           LOOP @M3

@MTrue:  MOV AL,true
         JMP @MExit

@MFalse: MOV AL,false

@MExit:  POP EDI
         POP ESI
end;

function TRealMemory.Mem_Read(var Mem; Size: integer;const Address: TAddress): boolean;
var
  p: pointer;
begin
Result:=false;
asm
   MOV EAX,Self
   MOV EAX,[EAX].ptrBuff
   ADD EAX,Address
   MOV p,EAX
end;
asm
         PUSH ESI
         PUSH EDI
         PUSH EAX
         MOV ESI,p
         MOV EDI,Mem
         MOV ECX,Size
         MOV EAX,ECX
         SHR ECX,1
         SHR ECX,1
         CLD
         REP MOVSD
         MOV ECX,EAX
         AND ECX,3
         REP MOVSB
         POP EAX
         POP EDI
         POP ESI
end;
Result:=true;
end;

function TRealMemory.Mem_Write(var Mem; Size: integer;var Address: TAddress): boolean; assembler; register;
asm
         PUSH EDI
         MOV EDI,SS:[Address]
         MOV EDI,[EDI]
         CMP EDI,[EAX].TRealMemory.Size
         JB @M1
           POP EDI
           MOV AL,false
           JMP @M3
@M1:     ADD EDI,[EAX].TRealMemory.ptrBuff
         PUSH ESI
         MOV ESI,EDX
         PUSH EAX
         MOV EAX,ECX
         SHR ECX,1
         SHR ECX,1
         CLD
         REP MOVSD
         MOV ECX,EAX
         AND ECX,3
         REP MOVSB
         POP EAX
         POP ESI
         SUB EDI,[EAX].TRealMemory.ptrBuff
         MOV EDX,SS:[Address]
         MOV [EDX],EDI
         POP EDI
         MOV AL,true
@M3:
end;


{TVirtualMemory}
Constructor TVirtualMemory.Create();
begin
Inherited Create;
Blocks:=nil;
end;

destructor TVirtualMemory.Destroy;
begin
Empty;
Inherited;
end;

procedure TVirtualMemory.TMemBlock_Create(const pAddress: TAddress; pSize: integer; var ptrNewBlock: pointer);
begin
GetMem(ptrNewBlock,SizeOf(TMemBlock));
with TMemBlock(ptrNewBlock^) do begin
ptrNext:=Blocks;
//.
cntLoading:=0;
Address:=pAddress;
Size:=pSize;
GetMem(ptrData,Size);
end;
Blocks:=ptrNewBlock;
end;

procedure TVirtualMemory.TMemBlock_Destroy(var ptrBlock: pointer);
var
  ptrDelBlock: pointer;
begin
ptrDelBlock:=ptrBlock;
ptrBlock:=TMemBlock(ptrBlock^).ptrNext;
with TMemBlock(ptrDelBlock^) do begin
ptrBlock:=ptrNext;
FreeMem(ptrData,Size);
end;
FreeMem(ptrDelBlock,SizeOf(TMemBlock));
end;

procedure TVirtualMemory.Empty;
begin
while Blocks <> nil do TMemBlock_Destroy(Blocks);
end;

procedure TVirtualMemory.GetMemPointer(const pAddress: TAddress; pSize: integer; var P: pointer);
var
  ptrBlock: pointer;
  Offset: integer;
begin
ptrBlock:=Blocks;
while ptrBlock <> nil do with TMemBlock(ptrBlock^) do begin
  Offset:=pAddress-Address;
  if (Offset >= 0) AND ((Offset+pSize) <= Size)
   then begin
    P:=Pointer(LongInt(ptrData)+Offset);
    Exit;
    end;
  ptrBlock:=ptrNext;
  end;
// создаем новый блок
TMemBlock_Create(pAddress,pSize, ptrBlock);
P:=TMemBlock(ptrBlock^).ptrData;
end;

function TVirtualMemory.Mem_Read(var Mem; Size: integer;const Address: TAddress): boolean;
var
  P: pointer;
begin
Result:=false;
GetMemPointer(Address,Size, P);
asm
         PUSH ESI
         PUSH EDI
         MOV ESI,P
         MOV EDI,Mem
         MOV ECX,Size
         PUSH EAX
         MOV EAX,ECX
         SHR ECX,1
         SHR ECX,1
         CLD
         REP MOVSD
         MOV ECX,EAX
         AND ECX,3
         REP MOVSB
         POP EAX
         POP EDI
         POP ESI
end;
Result:=true;
end;

function TVirtualMemory.Mem_Write(var Mem; Size: integer;var Address: TAddress): boolean;
var
  P: pointer;
begin
Result:=false;
GetMemPointer(Address,Size, P);
asm
         PUSH EDI
         PUSH ESI
         PUSH EAX
         MOV ESI,Mem
         MOV ECX,Size
         MOV EDI,P
         MOV EAX,ECX
         SHR ECX,1
         SHR ECX,1
         CLD
         REP MOVSD
         MOV ECX,EAX
         AND ECX,3
         REP MOVSB
         POP EAX
         POP ESI
         POP EDI
end;
Address:=Address+Size;
Result:=true;
end;


{TSegMemory}
Constructor TSegMemory.Create;
begin
Inherited Create();
Segments:=TIDsCach.Create;
end;

destructor TSegMemory.Destroy;
begin
Clear;
Segments.Free;
Inherited;
end;

procedure TSegMemory.Clear;

  procedure ProcessSegmentsTable(var TablePtr: pointer);
  var
    EntriesCount: integer;
    I: integer;
    ptrTable: pointer;
    ptrSegment: pointer;
  begin
  //. destroying own tables
  with TCachTable(TablePtr^) do begin
  if (NOT flFinal)
   then begin
    EntriesCount:=(1 SHL TableMaskSize);
    for I:=0 to EntriesCount-1 do begin
      ptrTable:=Pointer(Pointer(Integer(Ptr)+I*SizeOf(Pointer))^);
      if (ptrTable <> nil) then ProcessSegmentsTable(ptrTable);
      end;
    end
   else begin
    EntriesCount:=(1 SHL FinalTableMaskSize);
    for I:=0 to EntriesCount-1 do begin
      ptrSegment:=Pointer(Pointer(Integer(Ptr)+I*SizeOf(Pointer))^);
      if (ptrSegment <> nil) then DestroySegment(ptrSegment);
      end;
    end;
  end;
  //. destroying table
  TCachTable_DestroyAndNil(TablePtr);
  end;

begin
Segments.Lock.Enter;
try
if (Segments.TablePtr <> nil) then ProcessSegmentsTable(Segments.TablePtr);
finally
Segments.Lock.Leave;
end;
end;

function TSegMemory.Mem_Read(var Mem; Size: integer; const Address: TAddress): boolean;
var
  BegSegmentIndex,BegSegmentOffset: integer;
  EndSegmentIndex: integer;
  Segment: pointer;
  ptrSrc,ptrDist: pointer;
  _Size: integer;
begin
Result:=false;
//.
if (Size > TSegMemory_SegmentSize) then Raise Exception.Create('TSegMemory.Mem_Read failed: object too long'); //. =>
//.
BegSegmentIndex:=(Address SHR TSegMemory_SegmentSizePowerOf2);
BegSegmentOffset:=(Address AND TSegMemory_SegmentOffsetMask);
EndSegmentIndex:=((Address+Size-1) SHR TSegMemory_SegmentSizePowerOf2);
//. clear Mem first
asm
   PUSH EAX
   PUSH EDX
   PUSH EDI
   MOV EDI,Mem
   MOV ECX,Size
   XOR EAX,EAX
   MOV EDX,ECX
   SHR ECX,1
   SHR ECX,1
   CLD
   REP STOSD
   MOV ECX,EDX
   AND ECX,3
   REP STOSB
   POP EDI
   POP EDX
   POP EAX
end;
//.
if (BegSegmentIndex = EndSegmentIndex)
 then begin
  Segment:=Segments[BegSegmentIndex];
  if (Segment <> nil)
   then begin
    ptrSrc:=Pointer(Integer(Segment)+BegSegmentOffset);
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrc
       MOV EDI,Mem
       MOV ECX,Size
       PUSH EAX
       MOV EAX,ECX
       SHR ECX,1
       SHR ECX,1
       CLD
       REP MOVSD
       MOV ECX,EAX
       AND ECX,3
       REP MOVSB
       POP EAX
       POP EDI
       POP ESI
    end;
    end;
  end
 else begin
  Segment:=Segments[BegSegmentIndex];
  ptrDist:=@Mem;
  _Size:=(TSegMemory_SegmentSize-BegSegmentOffset);
  if (Segment <> nil)
   then begin
    ptrSrc:=Pointer(Integer(Segment)+BegSegmentOffset);
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrc
       MOV EDI,ptrDist
       MOV ECX,_Size
       PUSH EAX
       MOV EAX,ECX
       SHR ECX,1
       SHR ECX,1
       CLD
       REP MOVSD
       MOV ECX,EAX
       AND ECX,3
       REP MOVSB
       MOV ptrDist,EDI
       POP EAX
       POP EDI
       POP ESI
    end;
    end
   else ptrDist:=Pointer(Integer(ptrDist)+_Size);
  //.
  Segment:=Segments[EndSegmentIndex];
  if (Segment <> nil)
   then begin
    _Size:=(Size-_Size);
    ptrSrc:=Segment;
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrc
       MOV EDI,ptrDist
       MOV ECX,_Size
       PUSH EAX
       MOV EAX,ECX
       SHR ECX,1
       SHR ECX,1
       CLD
       REP MOVSD
       MOV ECX,EAX
       AND ECX,3
       REP MOVSB
       POP EAX
       POP EDI
       POP ESI
    end;
    end;
  end;
//.
Result:=true;
end;

function TSegMemory.Mem_Write(var Mem; Size: integer; var Address: TAddress): boolean;
var
  BegSegmentIndex,BegSegmentOffset: integer;
  EndSegmentIndex: integer;
  Segment: pointer;
  ptrSrc,ptrDist: pointer;
  _Size: integer;
begin
Result:=false;
//.
if (Size > TSegMemory_SegmentSize) then Raise Exception.Create('TSegMemory.Mem_Write failed: object too long'); //. =>
//.
BegSegmentIndex:=(Address SHR TSegMemory_SegmentSizePowerOf2);
BegSegmentOffset:=(Address AND TSegMemory_SegmentOffsetMask);
EndSegmentIndex:=((Address+Size-1) SHR TSegMemory_SegmentSizePowerOf2);
//.
if (BegSegmentIndex = EndSegmentIndex)
 then begin
  Segment:=Segments[BegSegmentIndex];
  if (Segment = nil)
   then begin
    Segment:=CreateNewSegment();
    Segments[BegSegmentIndex]:=Segment;
    end;
  ptrDist:=Pointer(Integer(Segment)+BegSegmentOffset);
  asm
     PUSH EDI
     PUSH ESI
     PUSH EAX
     MOV ESI,Mem
     MOV EDI,ptrDist
     MOV ECX,Size
     MOV EAX,ECX
     SHR ECX,1
     SHR ECX,1
     CLD
     REP MOVSD
     MOV ECX,EAX
     AND ECX,3
     REP MOVSB
     POP EAX
     POP ESI
     POP EDI
  end;
  end
 else begin
  Segment:=Segments[BegSegmentIndex];
  if (Segment = nil)
   then begin
    Segment:=CreateNewSegment();
    Segments[BegSegmentIndex]:=Segment;
    end;
  ptrSrc:=@Mem;
  ptrDist:=Pointer(Integer(Segment)+BegSegmentOffset);
  _Size:=(TSegMemory_SegmentSize-BegSegmentOffset);
  asm
     PUSH EDI
     PUSH ESI
     PUSH EAX
     MOV ESI,ptrSrc
     MOV EDI,ptrDist
     MOV ECX,_Size
     MOV EAX,ECX
     SHR ECX,1
     SHR ECX,1
     CLD
     REP MOVSD
     MOV ECX,EAX
     AND ECX,3
     REP MOVSB
     MOV ptrSrc,ESI
     POP EAX
     POP ESI
     POP EDI
  end;
  //.
  Segment:=Segments[EndSegmentIndex];
  if (Segment = nil)
   then begin
    Segment:=CreateNewSegment();
    Segments[EndSegmentIndex]:=Segment;
    end;
  ptrDist:=Segment;
  _Size:=(Size-_Size);
  asm
     PUSH EDI
     PUSH ESI
     PUSH EAX
     MOV ESI,ptrSrc
     MOV EDI,ptrDist
     MOV ECX,_Size
     MOV EAX,ECX
     SHR ECX,1
     SHR ECX,1
     CLD
     REP MOVSD
     MOV ECX,EAX
     AND ECX,3
     REP MOVSB
     POP EAX
     POP ESI
     POP EDI
  end;
  end;
//.
Result:=true;
end;

function TSegMemory.isMemNull(var Mem;Size: integer; Address: TAddress): boolean;
begin
Raise Exception.Create('TSegMemory.isMemNull not supported'); //. =>
end;

Type
  TMyMemoryStream = class(TMemoryStream)
  public
    property Capacity;
  end;

procedure TSegMemory.SaveToStream(out Stream: TMemoryStream);
const
  InitialStreamCapacity = 30*1024*1024;
type
  TItem = record
    StartIndex: integer;
    Count: integer;
    Segments: TMemoryStream;
  end;

  procedure ProcessSegmentsTable(const TablePtr: pointer; TableID: integer; const Stream: TMemoryStream; var ItemToSave: TItem);
  var
    EntriesCount: integer;
    I: integer;
    ptrTable: pointer;
    ptrSegment: pointer;
  begin
  TableID:=(TableID SHL TableMaskSize);
  //.
  with TCachTable(TablePtr^) do begin
  if (NOT flFinal)
   then begin
    EntriesCount:=(1 SHL TableMaskSize);
    for I:=0 to EntriesCount-1 do begin
      ptrTable:=Pointer(Pointer(Integer(Ptr)+I*SizeOf(Pointer))^);
      if (ptrTable <> nil)
       then
        ProcessSegmentsTable(ptrTable, TableID+I, Stream,ItemToSave)
       else begin //. save item
        if (ItemToSave.Count > 0)
         then begin
          Stream.Write(ItemToSave.StartIndex,SizeOf(ItemToSave.StartIndex));
          Stream.Write(ItemToSave.Count,SizeOf(ItemToSave.Count));
          Stream.Write(ItemToSave.Segments.Memory^,ItemToSave.Segments.Size);
          //. clear item
          ItemToSave.Count:=0;
          ItemToSave.Segments.Size:=0;
          end;
        end;
      end;
    end
   else begin
    EntriesCount:=(1 SHL FinalTableMaskSize);
    for I:=0 to EntriesCount-1 do begin
      ptrSegment:=Pointer(Pointer(Integer(Ptr)+I*SizeOf(Pointer))^);
      if (ptrSegment <> nil)
       then
        if (ItemToSave.Count = 0)
         then begin
          ItemToSave.StartIndex:=TableID+I;
          ItemToSave.Count:=1;
          ItemToSave.Segments.Write(ptrSegment^,TSegMemory_SegmentSize);
          end
         else begin
          Inc(ItemToSave.Count);
          ItemToSave.Segments.Write(ptrSegment^,TSegMemory_SegmentSize);
          end
       else begin //. save item
        if (ItemToSave.Count > 0)
         then begin
          Stream.Write(ItemToSave.StartIndex,SizeOf(ItemToSave.StartIndex));
          Stream.Write(ItemToSave.Count,SizeOf(ItemToSave.Count));
          Stream.Write(ItemToSave.Segments.Memory^,ItemToSave.Segments.Size);
          //. clear item
          ItemToSave.Count:=0;
          ItemToSave.Segments.Size:=0;
          end;
        end;
      end;
    end;
  end;
  end;

var
  ItemToSave: TItem;
begin
Stream:=TMemoryStream.Create;
try
TMyMemoryStream(Stream).Capacity:=InitialStreamCapacity;
with ItemToSave do begin
StartIndex:=0;
Count:=0;
Segments:=TMemoryStream.Create;
end;
try
Segments.Lock.Enter;
try
if (Segments.TablePtr <> nil)
 then begin
  ProcessSegmentsTable(Segments.TablePtr, 0, Stream,ItemToSave);
  //. save item
  if (ItemToSave.Count > 0)
   then begin
    Stream.Write(ItemToSave.StartIndex,SizeOf(ItemToSave.StartIndex));
    Stream.Write(ItemToSave.Count,SizeOf(ItemToSave.Count));
    Stream.Write(ItemToSave.Segments.Memory^,ItemToSave.Segments.Size);
    end;
  end;
finally
Segments.Lock.Leave;
end;
finally
ItemToSave.Segments.Destroy;
end;
except
  FreeAndNil(Stream);
  Raise; //. =>
  end;
end;

procedure TSegMemory.LoadFromStream(const Stream: TMemoryStream);
type
  TItem = record
    StartIndex: integer;
    Count: integer;
    Segments: TMemoryStream;
  end;

  function LoadItem(const Stream: TMemoryStream; var Item: TItem): boolean;
  begin
  Result:=false;
  if (Stream.Position >= Stream.Size) then Exit; //. ->
  Stream.Read(Item.StartIndex,SizeOf(Item.StartIndex));
  Stream.Read(Item.Count,SizeOf(Item.Count));
  Item.Segments.Size:=0;
  Item.Segments.CopyFrom(Stream,Item.Count*TSegMemory_SegmentSize);
  Item.Segments.Position:=0;
  Result:=true;
  end;

var
  ItemToLoad: TItem;
  NewSegment: pointer;
begin
Stream.Position:=0;
with ItemToLoad do begin
StartIndex:=0;
Count:=0;
Segments:=TMemoryStream.Create;
end;
try
Segments.Lock.Enter;
try
while LoadItem(Stream, ItemToLoad) do with ItemToLoad do
  while (Count > 0) do begin
    NewSegment:=CreateNewSegment();
    Segments.Read(NewSegment^,TSegMemory_SegmentSize);
    Self.Segments[StartIndex]:=NewSegment;
    //. next segment
    Inc(StartIndex);
    Dec(Count);
    end;
finally
Segments.Lock.Leave;
end;
finally
ItemToLoad.Segments.Destroy;
end;
end;

function TSegMemory.CreateNewSegment: pointer;
begin
GetMem(Result,TSegMemory_SegmentSize);
asm
   PUSH EDI
   MOV EDI,Result
   MOV ECX,TSegMemory_SegmentSize
   XOR AL,AL
   CLD
   REP STOSB
   POP EDI
end;
end;

procedure TSegMemory.DestroySegment(var ptrSegment: pointer);
begin
FreeMem(ptrSegment,TSegMemory_SegmentSize);
ptrSegment:=nil;
end;


end.

