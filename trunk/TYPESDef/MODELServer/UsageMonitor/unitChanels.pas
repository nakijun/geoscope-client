unit unitChanels;
Interface
Uses
  Classes, ExtCtrls, SyncObjs;

Type
  {TSelection}
  TSelection = record
    Value: smallint;
  end;


  {TChanelsSelections}
  TSelections = array of TSelection;


  TOnAddSelectionsEvent = procedure (const Selections: TSelections) of object;


  {TChanelCyclicBuffer}
  TChanelCyclicBuffer = class
  public
    BufferPtr: pointer;
    BufferSize: integer;
    BufferHeadOffset: integer;
    Capacity: integer; //. емкость буфера
    Count: integer; //. число выборок в буфере на данный момент

    Constructor Create;
    Destructor Destroy; override;
    procedure SetSize(const Size: integer);
    procedure Next(var Offset: integer);
    procedure Pred(var Offset: integer);
    procedure Insert(const Selection: TSelection);
    procedure ShiftBufferToOrigin(ShiftCount: integer);
  end;


  {TChanel}
  TChanelName = string[20];

  TChanelConfigStruc = packed record
    Name: TChanelName;
    Range: integer;
    ZeroLevel: integer;
    Enabled: boolean;
  end;

  TChanel = class
  public
    Name: TChanelName;
    Range: integer; //. макс значение сигнала (амплитуда)
    ZeroLevel: integer; //. посто€нна€ составл€юща€ сигнала
    Enabled: boolean;
    CyclicBuffer: TChanelCyclicBuffer;

    Constructor Create;
    Destructor Destroy; override;
  end;


  {TChanels}
  TOnBeforeAddSelectionsEvent = procedure of Object;
  TChanelsMask = array of boolean;

  TChanels = class(TList)
  private
    FLastChanels: TChanels;
    procedure setLastChanels(Chanels: TChanels);
  public
    Lock: TCriticalSection;
    FLastOnAddSelections: TOnAddSelectionsEvent;
    OnAddSelections: TOnAddSelectionsEvent;
    OnBeforeAddSelections: TOnBeforeAddSelectionsEvent;
    CyclicBuffersCount: integer;

    Constructor Create(pChanels: TChanels); virtual;
    Destructor Destroy; override;
    procedure Clear;
    procedure SetChanels(const ChanelsCount: integer);
    procedure ResizeCyclicBuffers(const NewSize: integer);
    function ROOTChanels: TChanels;
    procedure CopyChanelsFrom(Chanels: TChanels); virtual;
    procedure CopyChanelsFromROOT;
    procedure LoadFromStream(Stream: TStream);
    procedure DoOnAddSelections(const Selections: TSelections); virtual;
    property LastChanels: TChanels read FLastChanels write setLastChanels;
  end;


  {TLineFilter}
  TLineFilter = class(TChanels)
  private
    procedure DoOnAddSelections(const Selections: TSelections); override;
  public
    Factor: integer;
    Constructor Create(pChanels: TChanels); override;
  end;


  {TAverager}
  TAverager = class(TChanels)
  private
    procedure DoOnAddSelections(const Selections: TSelections); override;
  public
    CurrentCount: integer;
    AverageCount: integer;
    Constructor Create(pChanels: TChanels); override;
  end;


  {TSelectionsSaver}
  TSelectionsSaver = class(TChanels)
  private
    Lock: TCriticalSection;
    SelectionsFileStream: TFileStream;

    procedure DoOnAddSelections(const Selections: TSelections); override;
    procedure SaveSelectionsPortion;
  public
    CurrentCount: integer;
    SavingCount: integer;
    FileName: string;

    Constructor Create(pChanels: TChanels; const pFileName: string);
    Destructor Destroy; override;
    procedure SetSavingCount(const pSavingCount: integer);
  end;


  {TSelectionsShot}
  TOnBufferComplete = procedure (const BufferPtr: pointer; const BufferSize: integer) of object;
  TOnShotEnd = procedure of object;
  TSelectionsShot = class(TChanels)
  private
    Lock: TCriticalSection;

    procedure DoOnAddSelections(const Selections: TSelections); override;
    procedure ShotSelections;
  public
    ShotCount: integer;
    CurrentCount: integer;
    OnBufferComplete: TOnBufferComplete;
    OnShotEnd: TOnShotEnd;

    Constructor Create(pChanels: TChanels; const pShotCount: integer; pOnBufferComplete: TOnBufferComplete; pOnShotEnd: TOnShotEnd);
    Destructor Destroy; override;
  end;

  {TSelectionsAccumulator}
  TSelectionsAccumulator = class(TChanels)
  private
    Lock: TCriticalSection;
    FCapacity: integer;

    procedure DoOnAddSelections(const Selections: TSelections); override;
    procedure setCapacity(Value: integer);
  public
    Enabled: boolean;

    Constructor Create(pChanels: TChanels; const pCapacity: integer);
    Destructor Destroy; override;
    procedure GetSelectionsBuffer(const SelectionsCount: integer;  out SelectionsBufferPtr: pointer; out SelectionsBufferSize: integer);
    property Capacity: integer read FCapacity write setCapacity;
  end;

  {TSelectionsConverter8To12}
  TSelectionsConverter8To12 = class(TChanels)
  private
    ResultSelections: TSelections;

    procedure DoOnAddSelections(const Selections: TSelections); override;
  public
    ChanelsBufferPtr: pointer;

    Constructor Create(pChanels: TChanels); override;
    procedure CopyChanelsFrom(Chanels: TChanels); override;
  end;

Implementation
Uses
  SysUtils;


{TChanelCyclicBuffer}
Constructor TChanelCyclicBuffer.Create;
begin
Inherited Create;
BufferPtr:=nil;
BufferSize:=0;
BufferHeadOffset:=0;
Capacity:=0;
Count:=0;
end;

Destructor TChanelCyclicBuffer.Destroy;
begin
if BufferPtr <> nil then FreeMem(BufferPtr,BufferSize);
Inherited;
end;

procedure TChanelCyclicBuffer.SetSize(const Size: integer);
var
  NewBufferSize: integer;
begin
NewBufferSize:=Size*SizeOf(TSelection);
ReallocMem(BufferPtr,NewBufferSize);
if NewBufferSize > BufferSize
 then asm
  PUSH EDI
  MOV EAX,Self
  MOV EDI,TChanelCyclicBuffer[EAX].BufferPtr
  MOV EDX,TChanelCyclicBuffer[EAX].BufferSize
  ADD EDI,EDX
  MOV ECX,NewBufferSize
  SUB ECX,EDX
  XOR AL,AL
  CLD
  REP STOSB
  POP EDI
  end;
BufferSize:=NewBufferSize;
Capacity:=Size;
if Capacity < Count then Count:=Capacity;
if BufferHeadOffset >= NewBufferSize then BufferHeadOffset:=0;
end;

procedure TChanelCyclicBuffer.Next(var Offset: integer);
begin
Inc(Offset,SizeOf(TSelection));
if Offset = BufferSize then Offset:=0;
end;

procedure TChanelCyclicBuffer.Pred(var Offset: integer);
begin
if Offset = 0 then Offset:=BufferSize;
Dec(Offset,SizeOf(TSelection));
end;

procedure TChanelCyclicBuffer.Insert(const Selection: TSelection);
begin
if BufferSize = 0 then Exit; //. -> Raise Exception.Create('cyclic buffer is null length'); //. =>
if (Count < Capacity) AND (BufferHeadOffset = (Count*SizeOf(TSelection))) then Inc(Count);
TSelection(Pointer(Integer(BufferPtr)+BufferHeadOffset)^):=Selection;
Next(BufferHeadOffset);
end;

procedure TChanelCyclicBuffer.ShiftBufferToOrigin(ShiftCount: integer);
begin
if (ShiftCount <= 0) OR (ShiftCount > Capacity) then Exit; //. ->
asm
   PUSH ESI
   PUSH EDI
   MOV EAX,Self
   MOV ESI,TChanelCyclicBuffer[EAX].BufferPtr
   MOV ECX,TChanelCyclicBuffer[EAX].Capacity
   MOV EDI,ESI
   MOV EDX,ShiftCount
   ADD ESI,EDX
   ADD ESI,EDX
   SUB ECX,EDX
   CLD
   REP MOVSW
   MOV ECX,EDX
   XOR AX,AX
   REP STOSW
   POP EDI
   POP ESI
end;
Count:=Count-ShiftCount;
end;



{TChanel}
Constructor TChanel.Create;
begin
Inherited Create;
Name:='';
Range:=1;
ZeroLevel:=0;
Enabled:=true;
CyclicBuffer:=TChanelCyclicBuffer.Create;
end;

Destructor TChanel.Destroy;
begin
CyclicBuffer.Free;
Inherited;
end;




{TChanels}
Constructor TChanels.Create(pChanels: TChanels);
var
  I: integer;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
OnBeforeAddSelections:=nil;
OnAddSelections:=nil;
CyclicBuffersCount:=0;
SetLastChanels(pChanels);
end;

Destructor TChanels.Destroy;
begin
if FLastChanels <> nil then FLastChanels.OnAddSelections:=FLastOnAddSelections;
Clear;
Lock.Free;
Inherited;
end;


procedure TChanels.Clear;
var
  I: integer;
  DestroyChanel: TChanel;
begin
if Lock <> nil then Lock.Enter;
try
for I:=0 to Count-1 do begin
  DestroyChanel:=List[I];
  DestroyChanel.Destroy;
  end;
Inherited Clear;
finally
if Lock <> nil then Lock.Leave;
end;
end;

procedure TChanels.setLastChanels(Chanels: TChanels);
var
  I: integer;
begin
if Chanels <> nil
 then begin
  if FLastChanels <> nil then FLastChanels.OnAddSelections:=FLastOnAddSelections;
  FLastOnAddSelections:=Chanels.OnAddSelections;
  Chanels.OnAddSelections:=Self.DoOnAddSelections;
  SetChanels(Chanels.Count);
  //. set chanels params
  for I:=0 to Count-1 do with TChanel(List[I]) do begin
    Name:=TChanel(Chanels[I]).Name;
    Range:=TChanel(Chanels[I]).Range;
    ZeroLevel:=TChanel(Chanels[I]).ZeroLevel;
    Enabled:=TChanel(Chanels[I]).Enabled;
    end;
  FLastChanels:=Chanels;
  end
 else begin
  if FLastChanels <> nil then FLastChanels.OnAddSelections:=FLastOnAddSelections;
  FLastOnAddSelections:=nil;
  FLastChanels:=nil;
  end;
end;

procedure TChanels.SetChanels(const ChanelsCount: integer);
var
  I: integer;
  NewChanel: TChanel;
begin
if Lock <> nil then Lock.Enter;
try
Clear;
for I:=0 to ChanelsCount-1 do begin
  NewChanel:=TChanel.Create;
  Add(NewChanel);
  end;
ResizeCyclicBuffers(CyclicBuffersCount);
finally
if Lock <> nil then Lock.Leave;
end;
end;

procedure TChanels.ResizeCyclicBuffers(const NewSize: integer);
var
  I: integer;
begin
if Lock <> nil then Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.SetSize(NewSize);
CyclicBuffersCount:=NewSize;
finally
if Lock <> nil then Lock.Leave;
end;
end;

procedure TChanels.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
if Assigned(OnAddSelections) then OnAddSelections(Selections);
end;

function TChanels.ROOTChanels: TChanels;
var
  LC: TChanels;
begin
Result:=FLastChanels;
if Result = nil then Exit; //. ->
while Result.FLastChanels <> nil do Result:=Result.FLastChanels;
end;

procedure TChanels.CopyChanelsFrom(Chanels: TChanels);
var
  I: integer;
begin
if Count <> Chanels.Count then SetChanels(Chanels.Count);
for I:=0 to Count-1 do begin
  TChanel(List[I]).Name:=TChanel(Chanels[I]).Name;
  TChanel(List[I]).Range:=TChanel(Chanels[I]).Range;
  TChanel(List[I]).ZeroLevel:=TChanel(Chanels[I]).ZeroLevel;
  TChanel(List[I]).Enabled:=TChanel(Chanels[I]).Enabled;
  end;
end;

procedure TChanels.CopyChanelsFromROOT;

  procedure Process(Chanels: TChanels; var ROOT: TChanels);
  begin
  if Chanels.LastChanels <> nil
   then begin
    Process(Chanels.LastChanels, ROOT);
    Chanels.CopyChanelsFrom(ROOT);
    ROOT:=Chanels;
    end
   else
    ROOT:=Chanels;
  end;

var
  ROOT: TChanels;
begin
Lock.Enter;
try
Process(Self, ROOT);
finally
Lock.Leave;
end;
end;

procedure TChanels.LoadFromStream(Stream: TStream);
var
  ChanelsCount: word;
  I: integer;
  ChanelStruc: TChanelConfigStruc;
  Selections: TSelections;
begin
with Stream do begin
Position:=0;
//. read and set chanels count
Read(ChanelsCount,SizeOf(ChanelsCount));
SetChanels(ChanelsCount);
//. read chanels params
for I:=0 to ChanelsCount-1 do with TChanel(List[I]) do begin
  Read(ChanelStruc,SizeOf(ChanelStruc));
  Name:=ChanelStruc.Name;
  Range:=ChanelStruc.Range;
  ZeroLevel:=ChanelStruc.ZeroLevel;
  Enabled:=ChanelStruc.Enabled;
  end;
//. read body
SetLength(Selections,Count);
repeat
  for I:=0 to Count-1 do Read(Selections[I].Value,SizeOf(TSelection));
  DoOnAddSelections(Selections);
until Position >= Size;
//.
end;
end;




{TLineFilter}
Constructor TLineFilter.Create(pChanels: TChanels);
begin
Inherited Create(pChanels);
Factor:=10;
ResizeCyclicBuffers(Factor);
end;

procedure TLineFilter.DoOnAddSelections(const Selections: TSelections);
var
  I,J: integer;
  SelectionOffset: integer;
  Sum: Extended;
  _Selections: TSelections;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
if TChanel(List[0]).CyclicBuffer.Count >= Factor
 then begin
  SetLength(_Selections,Length(Selections));
  for I:=0 to Count-1 do with TChanel(List[I]).CyclicBuffer do begin
    SelectionOffset:=BufferHeadOffset;
    Sum:=0;
    for J:=0 to Factor-1 do begin
      Pred(SelectionOffset);
      Sum:=Sum+TSelection(Pointer(Integer(BufferPtr)+SelectionOffset)^).Value;
      end;
    _Selections[I].Value:=Round(Sum/Factor);
    end;
  //.
  if Assigned(OnAddSelections) then OnAddSelections(_Selections);
  end;
//.
end;


{TAverager}
Constructor TAverager.Create(pChanels: TChanels);
begin
Inherited Create(pChanels);
CurrentCount:=0;
AverageCount:=2;
ResizeCyclicBuffers(AverageCount);
end;

procedure TAverager.DoOnAddSelections(const Selections: TSelections);
var
  I,J: integer;
  SelectionOffset: integer;
  SelectionsAccumulator: array of integer;
  _Selections: TSelections;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
Inc(CurrentCount);
if CurrentCount >= AverageCount
 then begin
  //.
  SetLength(SelectionsAccumulator,Length(Selections));
  for I:=0 to Count-1 do SelectionsAccumulator[I]:=0;
  for I:=0 to Count-1 do with TChanel(List[I]).CyclicBuffer do begin
    SelectionOffset:=BufferHeadOffset;
    for J:=0 to Count-1 do begin
      SelectionsAccumulator[I]:=SelectionsAccumulator[I]+TSelection(Pointer(Integer(BufferPtr)+SelectionOffset)^).Value;
      Next(SelectionOffset);
      end;
    end;
  //.
  SetLength(_Selections,Length(SelectionsAccumulator));
  for I:=0 to Count-1 do _Selections[I].Value:=Round(SelectionsAccumulator[I]/CurrentCount);
  //. process selections
  if Assigned(OnAddSelections) then OnAddSelections(_Selections);
  //.
  CurrentCount:=0;
  end;
//.
end;


{TSelectionsSaver}
Constructor TSelectionsSaver.Create(pChanels: TChanels; const pFileName: string);
var
  ChanelsCount: word;
  I: integer;
  ChanelStruc: TChanelConfigStruc;
begin
Inherited Create(pChanels);
Lock:=TCriticalSection.Create;
FileName:=pFileName;
SelectionsFileStream:=TFileStream.Create(FileName,fmCreate);
//. making header
CopyChanelsFromROOT;
ChanelsCount:=Count;
with SelectionsFileStream do begin
//. save
Write(ChanelsCount,SizeOf(ChanelsCount));
//. save chanels params
for I:=0 to ChanelsCount-1 do with TChanel(List[I]) do begin
  ChanelStruc.Name:=Name;
  ChanelStruc.Range:=Range;
  ChanelStruc.ZeroLevel:=ZeroLevel;
  ChanelStruc.Enabled:=Enabled;
  Write(ChanelStruc,SizeOf(ChanelStruc));
  end;
end;
//.
SetSavingCount(1024{initial saving buffer size});
end;

Destructor TSelectionsSaver.Destroy;
begin
//. save riminder
if CurrentCount > 0 then SaveSelectionsPortion;
//.
SelectionsFileStream.Free;
Lock.Free;
Inherited;
end;

procedure TSelectionsSaver.SetSavingCount(const pSavingCount: integer);
begin
SavingCount:=pSavingCount;
ResizeCyclicBuffers(SavingCount);
CurrentCount:=0;
end;

procedure TSelectionsSaver.SaveSelectionsPortion;
var
  BufferPtr: pointer;
  BufferSize: integer;
  ChanelsCount: integer;
  CyclicBufferSize: integer;
  I: integer;
  OBP: pointer;
  ResultBufferPtr: pointer;
  ResultBufferSize: integer;
begin
Lock.Enter;
try
ChanelsCount:=Count;
CyclicBufferSize:=SavingCount*SizeOf(TSelection);
BufferSize:=ChanelsCount*2*SizeOf(Integer);
GetMem(BufferPtr,BufferSize);
try
OBP:=BufferPtr;
for I:=0 to ChanelsCount-1 do begin
  Pointer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferPtr;
  asm ADD OBP,4{SizeOf(Integer)} end;
  Integer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferHeadOffset;
  asm ADD OBP,4{SizeOf(Integer)} end;
  end;
//. rollback offsets by SaveCount
asm
      PUSH EBX
      PUSH EDI
      MOV ECX,ChanelsCount
      MOV EDI,BufferPtr
      MOV EAX,Self
      MOV EDX,TSelectionsSaver.[EAX].CurrentCount
      SHL EDX,1 //. extend to word from byte
      MOV EBX,CyclicBufferSize
      CLD
  @M1:  ADD EDI,4{SizeOf(Integer)}
        MOV EAX,[EDI]
        CMP EAX,EDX
        JAE @M2
        ADD EAX,EBX
  @M2:  SUB EAX,EDX
        STOSD
        LOOP @M1
      POP EDI
      POP EBX
end;
//. result prepearing
ResultBufferSize:=ChanelsCount*CurrentCount*SizeOf(TSelection);
GetMem(ResultBufferPtr,ResultBufferSize);
try
asm
      PUSH EBX
      PUSH ESI
      PUSH EDI
      MOV EAX,Self
      MOV ECX,TSelectionsSaver.[EAX].CurrentCount
      MOV ESI,BufferPtr
      MOV EDI,ResultBufferPtr
      CLD
  @M1:  PUSH ECX
        PUSH ESI
        MOV ECX,ChanelsCount
    @M2:  LODSD
          MOV EBX,EAX
          MOV EDX,[ESI]
          //. write selection
          MOV AX,[EBX+EDX]
          STOSW
          //.
          ADD EDX,2{SizeOf(TSelection)}
          CMP EDX,CyclicBufferSize
          JB @M3
          XOR EDX,EDX
    @M3:  MOV [ESI],EDX
          ADD ESI,4{SizeOf(Integer)}
          LOOP @M2
        POP ESI
        POP ECX
        LOOP @M1
      POP EDI
      POP ESI
      POP EBX
end;
SelectionsFileStream.WriteBuffer(ResultBufferPtr^,ResultBufferSize);
finally
FreeMem(ResultBufferPtr,ResultBufferSize);
end;
//.
finally
FreeMem(BufferPtr,BufferSize);
end;
CurrentCount:=0;
finally
Lock.Leave;
end;
end;

procedure TSelectionsSaver.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
Inc(CurrentCount);
if CurrentCount >= SavingCount then SaveSelectionsPortion;
//.
if Assigned(OnAddSelections) then OnAddSelections(Selections);
end;


{TSelectionsShot}
Constructor TSelectionsShot.Create(pChanels: TChanels; const pShotCount: integer; pOnBufferComplete: TOnBufferComplete; pOnShotEnd: TOnShotEnd);
begin
Inherited Create(pChanels);
Lock:=TCriticalSection.Create;
ShotCount:=pShotCount;
CurrentCount:=0;
OnBufferComplete:=pOnBufferComplete;
OnShotEnd:=pOnShotEnd;
ResizeCyclicBuffers(ShotCount);
end;

Destructor TSelectionsShot.Destroy;
begin
Lock.Free;
Inherited;
end;

procedure TSelectionsShot.ShotSelections; {исправь}
var
  BufferPtr: pointer;
  BufferSize: integer;
  ChanelsCount: integer;
  CyclicBufferSize: integer;
  I: integer;
  OBP: pointer;
  ResultBufferPtr: pointer;
  ResultBufferSize: integer;
begin
Lock.Enter;
try
ChanelsCount:=Count;
CyclicBufferSize:=ShotCount*SizeOf(TSelection);
BufferSize:=ChanelsCount*2*SizeOf(Integer);
GetMem(BufferPtr,BufferSize);
try
OBP:=BufferPtr;
for I:=0 to ChanelsCount-1 do begin
  Pointer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferPtr;
  asm ADD OBP,4{SizeOf(Integer)} end;
  Integer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferHeadOffset;
  asm ADD OBP,4{SizeOf(Integer)} end;
  end;
//. rollback offsets by SaveCount
asm
      PUSH EBX
      PUSH EDI
      MOV ECX,ChanelsCount
      MOV EDI,BufferPtr
      MOV EAX,Self
      MOV EDX,TSelectionsShot.[EAX].CurrentCount
      SHL EDX,1 //. extend to word from byte
      MOV EBX,CyclicBufferSize
      CLD
  @M1:  ADD EDI,4{SizeOf(Integer)}
        MOV EAX,[EDI]
        CMP EAX,EDX
        JAE @M2
        ADD EAX,EBX
  @M2:  SUB EAX,EDX
        STOSD
        LOOP @M1
      POP EDI
      POP EBX
end;
//. result prepearing
ResultBufferSize:=ChanelsCount*CurrentCount*SizeOf(TSelection);
GetMem(ResultBufferPtr,ResultBufferSize);
try
asm
      PUSH EBX
      PUSH ESI
      PUSH EDI
      MOV EAX,Self
      MOV ECX,TSelectionsShot.[EAX].CurrentCount
      MOV ESI,BufferPtr
      MOV EDI,ResultBufferPtr
      CLD
  @M1:  PUSH ECX
        PUSH ESI
        MOV ECX,ChanelsCount
    @M2:  LODSD
          MOV EBX,EAX
          MOV EDX,[ESI]
          //. write selection
          MOV AX,[EBX+EDX]
          STOSW
          //.
          ADD EDX,2{SizeOf(TSelection)}
          CMP EDX,CyclicBufferSize
          JB @M3
          XOR EDX,EDX
    @M3:  MOV [ESI],EDX
          ADD ESI,4{SizeOf(Integer)}
          LOOP @M2
        POP ESI
        POP ECX
        LOOP @M1
      POP EDI
      POP ESI
      POP EBX
end;
//. processing
if Assigned(OnBufferComplete) then OnBufferComplete(ResultBufferPtr,ResultBufferSize);
//.
finally
FreeMem(ResultBufferPtr,ResultBufferSize);
end;
//.
finally
FreeMem(BufferPtr,BufferSize);
end;
CurrentCount:=0;
finally
Lock.Leave;
end;
//.
if Assigned(OnShotEnd) then OnShotEnd;
end;

procedure TSelectionsShot.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
Inc(CurrentCount);
if CurrentCount >= ShotCount then ShotSelections;
//.
if Assigned(OnAddSelections) then OnAddSelections(Selections);
end;




{TSelectionsAccumulator}
Constructor TSelectionsAccumulator.Create(pChanels: TChanels; const pCapacity: integer);
begin
Inherited Create(pChanels);
Lock:=TCriticalSection.Create;
Enabled:=false;
Capacity:=pCapacity;
end;

Destructor TSelectionsAccumulator.Destroy;
begin
Lock.Free;
Inherited;
end;

procedure TSelectionsAccumulator.setCapacity(Value: integer);
begin
if FCapacity = Value then Exit; //. ->
ResizeCyclicBuffers(Value);
FCapacity:=Value;
end;

procedure TSelectionsAccumulator.GetSelectionsBuffer(const SelectionsCount: integer;  out SelectionsBufferPtr: pointer; out SelectionsBufferSize: integer);
var
  BufferPtr: pointer;
  BufferSize: integer;
  ChanelsCount: word;
  ChanelStruc: TChanelConfigStruc;
  CyclicBufferSize: integer;
  I: integer;
  OBP: pointer;
  SBP: pointer;
begin
if (Count > 0) AND (SelectionsCount > TChanel(List[0]).CyclicBuffer.Count) then Raise Exception.Create('SelectionsCount is above than accumulator have'); //. =>
if SelectionsCount > FCapacity then Raise Exception.Create('SelectionsCount is above than accumulator capacity'); //. =>
Lock.Enter;
try
ChanelsCount:=0;
for I:=0 to Count-1 do if TChanel(List[I]).Enabled then Inc(ChanelsCount);
CyclicBufferSize:=FCapacity*SizeOf(TSelection);
BufferSize:=ChanelsCount*2*SizeOf(Integer);
GetMem(BufferPtr,BufferSize);
try
OBP:=BufferPtr;
for I:=0 to ChanelsCount-1 do
  if TChanel(List[I]).Enabled
   then begin
    Pointer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferPtr;
    asm ADD OBP,4{SizeOf(Integer)} end;
    Integer(OBP^):=TChanel(List[I]).CyclicBuffer.BufferHeadOffset;
    asm ADD OBP,4{SizeOf(Integer)} end;
    end;
//. rollback offsets by SaveCount
asm
      PUSH EBX
      PUSH EDI
      XOR ECX,ECX
      MOV CX,ChanelsCount
      MOV EDI,BufferPtr
      MOV EDX,SelectionsCount
      SHL EDX,1 //. extend to word from byte
      MOV EBX,CyclicBufferSize
      CLD
  @M1:  ADD EDI,4{SizeOf(Integer)}
        MOV EAX,[EDI]
        CMP EAX,EDX
        JAE @M2
        ADD EAX,EBX
  @M2:  SUB EAX,EDX
        STOSD
        LOOP @M1
      POP EDI
      POP EBX
end;
//. result prepearing
SelectionsBufferSize:=SizeOf(ChanelsCount)+ChanelsCount*SizeOf(ChanelStruc)+ChanelsCount*SelectionsCount*SizeOf(TSelection);
GetMem(SelectionsBufferPtr,SelectionsBufferSize);
try
//. save chanels count
SBP:=SelectionsBufferPtr;
Word(SBP^):=ChanelsCount;
SBP:=Pointer(Integer(SBP)+SizeOf(ChanelsCount));
//. save chanels params
for I:=0 to Count-1 do if TChanel(List[I]).Enabled then with TChanel(List[I]) do begin
  ChanelStruc.Name:=Name;
  ChanelStruc.Range:=Range;
  ChanelStruc.ZeroLevel:=ZeroLevel;
  ChanelStruc.Enabled:=Enabled;
  TChanelConfigStruc(SBP^):=ChanelStruc;
  //. next
  SBP:=Pointer(Integer(SBP)+SizeOf(ChanelStruc));
  end;
//. save body
asm
      PUSH EBX
      PUSH ESI
      PUSH EDI
      MOV ECX,SelectionsCount
      MOV ESI,BufferPtr
      MOV EDI,SBP
      CLD
  @M1:  PUSH ECX
        PUSH ESI
        XOR ECX,ECX
        MOV CX,ChanelsCount
    @M2:  LODSD
          MOV EBX,EAX
          MOV EDX,[ESI]
          //. write selection
          MOV AX,[EBX+EDX]
          STOSW
          //.
          ADD EDX,2{SizeOf(TSelection)}
          CMP EDX,CyclicBufferSize
          JB @M3
          XOR EDX,EDX
    @M3:  MOV [ESI],EDX
          ADD ESI,4{SizeOf(Integer)}
          LOOP @M2
        POP ESI
        POP ECX
        LOOP @M1
      POP EDI
      POP ESI
      POP EBX
end;
//.
except
  FreeMem(SelectionsBufferPtr,SelectionsBufferSize);
  SelectionsBufferPtr:=nil;
  Raise; //. =>
  end;
//.
finally
FreeMem(BufferPtr,BufferSize);
end;
finally
Lock.Leave;
end;
end;

procedure TSelectionsAccumulator.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
if NOT Enabled then Exit; //. ->
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
if Assigned(OnAddSelections) then OnAddSelections(Selections);
end;




{TSelectionsConverter8To12}
Constructor TSelectionsConverter8To12.Create(pChanels: TChanels);
begin
Inherited Create(pChanels);
ResizeCyclicBuffers(1024);
SetLength(ResultSelections,12);
SetChanels(12);
//. chanels setting
with TChanel(List[0]) do begin
Name:='I';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[1]) do begin
Name:='II';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[6]) do begin
Name:='V1';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[7]) do begin
Name:='V2';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[8]) do begin
Name:='V3';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[9]) do begin
Name:='V4';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[10]) do begin
Name:='V5';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[11]) do begin
Name:='V6';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[2]) do begin
Name:='III';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[3]) do begin
Name:='aVr';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[4]) do begin
Name:='aVl';
ZeroLevel:=0;
Range:=200;
end;
with TChanel(List[5]) do begin
Name:='aVf';
ZeroLevel:=0;
Range:=200;
end;
//.
end;

procedure TSelectionsConverter8To12.DoOnAddSelections(const Selections: TSelections);
const
  kerr = 15;
var
  I: integer;
  InputBuffer: array[0..8-1] of word;
  OutputBuffer: array[0..12-1] of word;
  stan_bad: byte;
  fl_err: byte;
  fl_err_reset: byte;
  err_I: byte;
  err_II: byte;
  err_V1: byte;
  err_V2: byte;
  err_V3: byte;
  err_V4: byte;
  err_V5: byte;
  err_V6: byte;
  err_NR: byte;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. converting
if Length(Selections) <> 8 then Raise Exception.Create('wrong input selections number'); //. =>
{filling input buffer}
for I:=0 to 8-1 do InputBuffer[I]:=Selections[I].Value;
{processing}
asm
        PUSH EBX
        PUSH ESI
        PUSH EDI
        MOV EAX,Self
        MOV EBX,[EAX].TSelectionsConverter8To12.ChanelsBufferPtr
        LEA ESI,InputBuffer
        LEA EDI,OutputBuffer
        
	mov FL_ERR,0
	mov stan_bad,0
//. I
	mov ax,[ESI][0]
	mov err_I,0
	cmp WORD PTR [EBX+8],kerr
	jb @as1
	xor ax,ax
	mov stan_bad,1
	mov err_I,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as1:
	mov [EDI][0],ax
//. II
	mov ax,[ESI][2]
	mov err_II,0
	cmp WORD PTR [EBX+12],kerr
	jb @as2
	xor ax,ax
	mov stan_bad,1
	mov err_II,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as2:
	mov [EDI][2],ax
//. V1-V6
	mov ax,[ESI][2]
	add ax,[ESI][0]
	neg ax
	cwd
	mov cx,3
	Idiv cx
	mov cx,ax
	mov err_V1,0
	mov ax,[ESI][4]
	add ax,cx
	cmp WORD PTR [EBX+10],kerr
	jb @as3
	xor ax,ax
	mov err_V1,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as3:
	cmp stan_bad,1
	jne @qw10
	xor ax,ax
@qw10:
	mov [EDI][12],ax
	mov err_V2,0
	mov ax,[ESI][6]

	add ax,cx
	cmp WORD PTR [EBX+14],kerr
	jb @as4
	xor ax,ax
	mov err_V2,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as4:
	cmp stan_bad,1
	jne @qw11
	xor ax,ax
@qw11:
	mov [EDI][14],ax
	mov ax,[ESI][8]
	mov err_V3,0
	add ax,cx
	cmp WORD PTR [EBX+2],kerr
	jb @as5
	xor ax,ax
	mov err_V3,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as5:
	cmp stan_bad,1
	jne @qw12
	xor ax,ax
@qw12:
	mov [EDI][16],ax
	mov ax,[ESI][10]
	mov err_V4,0
	add ax,cx
	cmp WORD PTR [EBX+4],kerr
	jb @as6
	xor ax,ax
	mov err_V4,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as6:
	cmp stan_bad,1
	jne @qw7
	xor ax,ax
@qw7:
	mov [EDI][18],ax
	mov ax,[ESI][12]
	mov err_V5,0
	add ax,cx
	cmp WORD PTR [EBX+0],kerr
	jb @as7
	xor ax,ax
	mov err_V5,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as7:
	cmp stan_bad,1
	jne @qw8
	xor ax,ax
@qw8:
	mov [EDI][20],ax
	mov ax,[ESI][14]
	mov err_V6,0
	add ax,cx
	cmp WORD PTR [EBX+6],kerr
	jb @as8
	xor ax,ax
	mov err_V6,1
	mov FL_ERR,1
	mov fl_err_reset,1
@as8:

	cmp stan_bad,1
	jne @qw9
	xor ax,ax
@qw9:
	mov [EDI][22],ax
	mov ax,[EDI][2]
	sub ax,[EDI][0]
	cmp stan_bad,1
	jne @qw13
	xor ax,ax
@qw13:	mov [EDI][4],ax //. III

	mov ax,[EDI][2]
	add ax,[EDI][0]
	sar ax,1
	neg ax
	cmp stan_bad,1
	jne @qw14
	xor ax,ax
@qw14:	mov [EDI][6],ax //. aVr

	mov ax,[EDI][0]
	mov cx,[EDI][2]
	sar cx,1
	sub ax,cx
	cmp stan_bad,1
	jne @qw15
	xor ax,ax
@qw15:	mov [EDI][8],ax //. aVL

	mov ax,[EDI][2]
	mov cx,[EDI][0]
	sar cx,1
	sub ax,cx
	cmp stan_bad,1
	jne @qw16
	xor ax,ax
@qw16: 	mov [EDI][10],ax //. aVf

        POP EDI
        POP ESI
        POP EBX
end;
{filling result selections}
for I:=0 to Count-1 do ResultSelections[I].Value:=OutputBuffer[I];
//. procesing for chanels
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(ResultSelections[I]);
finally
Lock.Leave;
end;
//.
if Assigned(OnAddSelections) then OnAddSelections(ResultSelections);
end;

procedure TSelectionsConverter8To12.CopyChanelsFrom(Chanels: TChanels);
begin
end;





end.
