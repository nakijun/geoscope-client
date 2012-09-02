
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2004 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit unitIDsCach;

interface
Uses
  SyncObjs;

Const
  CachLevelCount = 8;
  IDByteSize = 32;
  TableMask = $F SHL 28;
  TableMaskSize = 4;
  FinalTableMask = $F;
  FinalTableMaskSize = 4;

Type
  TCachTable = packed record
    Size: integer;
    Ptr: pointer;
    Count: integer;
    Capacity: integer;
    flFinal: boolean;
  end;

  function TCachTable_Create(const pCapacity: integer; const pflFinal: boolean): pointer;
  procedure TCachTable_DestroyAndNil(var InstancePtr: pointer);

Type
  TIDsCach = class
  public
    Lock: TCriticalSection;
    TablePtr: pointer;
    
    Constructor Create;
    Destructor Destroy; override;
    function Get(pID: Integer): Pointer;
    procedure Put(pID: Integer; pPtr: Pointer);
    property Items[ID: Integer]: Pointer read Get write Put; default;
  end;

  TWIDsCach = class
  private
    TypeIDsCach: TIDsCach;
  public
    Constructor Create;
    Destructor Destroy; override;
    function Get(pTID: Integer; pID: Integer): Pointer;
    procedure Put(pTID: Integer; pID: Integer; pPtr: Pointer);
    property Items[TID: Integer;ID: Integer]: Pointer read Get write Put; default;
  end;

implementation


{TCachTable}
function TCachTable_Create(const pCapacity: integer; const pflFinal: boolean): pointer;
begin
GetMem(Result,SizeOf(TCachTable));
/// test Inc(TotalSize,SizeOf(TCachTable));
with TCachTable(Result^) do begin
Capacity:=pCapacity;
Size:=Capacity*SizeOf(Pointer);
GetMem(Ptr,Size);
FillChar(Ptr^,Size,0);
Count:=0;
flFinal:=pflFinal;
/// test Inc(TotalSize,Size);
end;
end;

procedure TCachTable_DestroyAndNil(var InstancePtr: pointer);
begin
with TCachTable(InstancePtr^) do FreeMem(Ptr,Size);
FreeMem(InstancePtr,SizeOf(TCachTable));
InstancePtr:=nil;
end;


{TIDsCach}
Constructor TIDsCach.Create;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
TablePtr:=nil;
end;

Destructor TIDsCach.Destroy;
begin
//. tables gone when application finished
/// ? ClearTables;
//.
Lock.Free;
Inherited;
end;

function TIDsCach.Get(pID: Integer): Pointer;
var
  I: integer;
  _TableMask: integer;
  ShiftCount: byte;
  DataIndex: integer;
  TableEntryPtr: pointer;
  ptrTable: pointer;
  PointerEntryPtr: pointer;
begin
Result:=nil;
Lock.Enter;
try
TableEntryPtr:=@TablePtr;
_TableMask:=TableMask;
ShiftCount:=IDByteSize;
for I:=CachLevelCount-1 downto 1 do begin
  //. getting table index
  asm
     PUSH EAX
     PUSH ECX
     PUSH EDX
     MOV EAX,pID
     MOV EDX,_TableMask
     AND EAX,EDX
     MOV CH,TableMaskSize
     MOV CL,ShiftCount
     SUB CL,CH
     SHR EAX,CL
     MOV DataIndex,EAX
     MOV ShiftCount,CL
     MOV CL,CH
     SHR EDX,CL
     MOV _TableMask,EDX
     POP EDX
     POP ECX
     POP EAX
  end;
  //. process table
  if Pointer(TableEntryPtr^) = nil then Exit; //. ->
  ptrTable:=Pointer(TableEntryPtr^);
  with TCachTable(ptrTable^) do TableEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
  end;
//. process final table
{getting table index}
asm
   PUSH EAX
   PUSH ECX
   PUSH EDX
   MOV EAX,pID
   MOV EDX,FinalTableMask
   AND EAX,EDX
   MOV DataIndex,EAX
   POP EDX
   POP ECX
   POP EAX
end;
{process table}
if Pointer(TableEntryPtr^) = nil then Exit; //. ->
with TCachTable(Pointer(TableEntryPtr^)^) do PointerEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
Result:=Pointer(PointerEntryPtr^);
finally
Lock.Leave;
end;
end;

procedure TIDsCach.Put(pID: Integer; pPtr: Pointer);
var
  I: integer;
  _TableMask: integer;
  ShiftCount: byte;
  DataIndex: integer;
  TableEntryPtr: pointer;
  ptrTable: pointer;
  PointerEntryPtr: pointer;
begin
Lock.Enter;
try
TableEntryPtr:=@TablePtr;
_TableMask:=TableMask;
ShiftCount:=IDByteSize;
for I:=CachLevelCount-1 downto 1 do begin
  //. getting table index
  asm
     PUSH EAX
     PUSH ECX
     PUSH EDX
     MOV EAX,pID
     MOV EDX,_TableMask
     AND EAX,EDX
     MOV CH,TableMaskSize
     MOV CL,ShiftCount
     SUB CL,CH
     SHR EAX,CL
     MOV DataIndex,EAX
     MOV ShiftCount,CL
     MOV CL,CH
     SHR EDX,CL
     MOV _TableMask,EDX
     POP EDX
     POP ECX
     POP EAX
  end;
  //. process table
  if Pointer(TableEntryPtr^) = nil
   then begin
    Pointer(TableEntryPtr^):=TCachTable_Create((1 SHL TableMaskSize),false);
    ptrTable:=Pointer(TableEntryPtr^);
    with TCachTable(ptrTable^) do begin
    TableEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
    Count:=1;
    end;
    end
   else begin
    ptrTable:=Pointer(TableEntryPtr^);
    with TCachTable(ptrTable^) do begin
    TableEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
    if Pointer(TableEntryPtr^) = nil then Inc(Count);
    end;
    end;
  end;
//. process final table
{getting table index}
asm
   PUSH EAX
   PUSH ECX
   PUSH EDX
   MOV EAX,pID
   MOV EDX,FinalTableMask
   AND EAX,EDX
   MOV DataIndex,EAX
   POP EDX
   POP ECX
   POP EAX
end;
{process table}
if Pointer(TableEntryPtr^) = nil
 then begin
  Pointer(TableEntryPtr^):=TCachTable_Create((1 SHL FinalTableMaskSize),true);
  with TCachTable(Pointer(TableEntryPtr^)^) do begin
  PointerEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
  Count:=1;
  end;
  end
 else with TCachTable(Pointer(TableEntryPtr^)^) do begin
  PointerEntryPtr:=Pointer(Integer(Ptr)+(DataIndex SHL 2));
  if pPtr <> nil
   then begin
    if Pointer(PointerEntryPtr^) = nil then Inc(Count);
    end
   else begin
    if Pointer(PointerEntryPtr^) <> nil then Dec(Count);
    end;
  end;
Pointer(PointerEntryPtr^):=pPtr;
finally
Lock.Leave;
end;
end;


{TWIDsCach}
Constructor TWIDsCach.Create;
begin
Inherited Create;
TypeIDsCach:=TIDsCach.Create;
end;

Destructor TWIDsCach.Destroy;
begin
TypeIDsCach.Free;
Inherited;
end;

function TWIDsCach.Get(pTID: Integer; pID: Integer): Pointer;
var
  IDsCach: TIDsCach;
begin
IDsCach:=TypeIDsCach[pTID];
if IDsCach <> nil
 then Result:=IDsCach[pID]
 else Result:=nil;
end;

procedure TWIDsCach.Put(pTID: Integer; pID: Integer; pPtr: Pointer);
var
  IDsCach: TIDsCach;
begin
IDsCach:=TypeIDsCach[pTID];
if IDsCach = nil
 then begin
  IDsCach:=TIDsCach.Create;
  TypeIDsCach[pTID]:=IDsCach;
  end;
IDsCach[pID]:=pPtr;
end;


end.
