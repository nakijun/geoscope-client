
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

unit unitSignalChanels;
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


  {Line Approximation}
  TPrmApr = record
    N: integer;
    SumI,SumQdI, SumY,SumIYi: Extended;
    A: Extended;
    B: Extended;
  end;

  procedure ResetSumAndN(var PA: TPrmApr);
  procedure IncSumLineApr(const X,Y: Extended; var PA: TPrmApr);
  procedure DecSumLineApr(const X,Y: Extended; var PA: TPrmApr);
  procedure GetAB(var Par: TPrmApr);
  function CheckBigErr(Y: integer; LimErr: real; var PA: TPrmApr): boolean;
  function GetFLnApr(X: integer;PA: TPrmApr): integer;

Type
  TSignalDetector = class(TChanels)
  public
    ChanelsLA: array of TPrmApr;
    AnalizeInterval: integer;
    X: integer;
    P: Extended;

    Constructor Create(pChanels: TChanels); override;
    procedure Reset;
    procedure SetParams(const ChanelsCount: integer; const pAnalizeInterval: integer);
    procedure CopyChanelsFrom(Chanels: TChanels); override;
    procedure DoOnAddSelections(const Selections: TSelections); override;
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


{Line Approximation}
procedure ResetSumAndN(var PA: TPrmApr);
begin
PA.N:=0;
PA.SumI:=0;
PA.SumQdI:=0;
PA.SumY:=0;
PA.SumIYi:=0;
end;

procedure IncSumLineApr(const X,Y: Extended; var PA: TPrmApr);
begin
with PA do begin
SumI:=SumI+X;
SumQdI:=SumQdI+sqr(X);
SumY:=SumY+Y;
SumIYi:=SumIYi+X*Y;
end;
end;

procedure DecSumLineApr(const X,Y: Extended; var PA: TPrmApr);
begin
with PA do begin
SumI:=SumI-X;
SumQdI:=SumQdI-sqr(X);
SumY:=SumY-Y;
SumIYi:=SumIYi-X*Y;
end;
end;

procedure GetAB(var Par: TPrmApr);
begin
with Par do begin
A:=(SumI*SumY-N*SumIYi)/(SumI*SumI-N*SumQdI);
B:=(SumY-SumI*A)/N;
end;
end;

function CheckBigErr(Y: integer; LimErr: real; var PA: TPrmApr): boolean;
var
   Err: real;
begin
GetAB(PA);
Err:=abs(Y-(PA.N*PA.A+PA.B));
if Err < LimErr
 then Result:=false
 else Result:=true;
end;

function GetFLnApr(X: integer;PA: TPrmApr): integer;
begin
GetFLnApr:=round(PA.A*X+PA.B);
end;




{TPauseDetector}
Constructor TSignalDetector.Create(pChanels: TChanels);
begin
Inherited Create(pChanels);
AnalizeInterval:=10;
Reset;
X:=0;
end;

procedure TSignalDetector.Reset;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Count:=0;
finally
Lock.Leave;
end;
end;

procedure TSignalDetector.CopyChanelsFrom(Chanels: TChanels);
begin
Inherited;
//.
SetParams(Chanels.Count, AnalizeInterval);
end;

procedure TSignalDetector.SetParams(const ChanelsCount: integer; const pAnalizeInterval: integer);
var
  I: integer;
begin
Lock.Enter;
try
SetChanels(ChanelsCount);
AnalizeInterval:=pAnalizeInterval;
SetLength(ChanelsLA,Count);
for I:=0 to Count-1 do begin
  ResetSumAndN(ChanelsLA[I]);
  ChanelsLA[I].N:=AnalizeInterval;
  end;
ResizeCyclicBuffers(AnalizeInterval);
Reset;
finally
Lock.Leave;
end;
end;

procedure TSignalDetector.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
  Xs,Ys: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//.
Lock.Enter;
try
//. remove last selection
if TChanel(List[0]).CyclicBuffer.Count >= TChanel(List[0]).CyclicBuffer.Capacity
 then begin //. decreasing LA summs
  Xs:=X-TChanel(List[0]).CyclicBuffer.Capacity;
  for I:=0 to Count-1 do with TChanel(List[I]).CyclicBuffer do begin
    Ys:=TSelection(Pointer(Integer(BufferPtr)+BufferHeadOffset)^).Value;
    DecSumLineApr(Xs,Ys, ChanelsLA[I]);
    end;
  end;
//. procesing for chanels
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
//. insert new selection
for I:=0 to Count-1 do IncSumLineApr(X,Selections[I].Value, ChanelsLA[I]);
//. 
if TChanel(List[0]).CyclicBuffer.Count = TChanel(List[0]).CyclicBuffer.Capacity
 then begin
  for I:=0 to Count-1 do GetAB(ChanelsLA[I]);
  P:=1;
  for I:=0 to Count-1 do P:=P*Abs(ChanelsLA[I].A);
  if Count > 1
   then
    if Count = 2
     then P:=Sqrt(P)
     else Raise Exception.Create('operation is not implemented'); //. =>
  end
 else
  P:=0;
Inc(X);
//.
finally
Lock.Leave;
end;
//.
if Assigned(OnAddSelections) then OnAddSelections(Selections);
//.
end;



end.
