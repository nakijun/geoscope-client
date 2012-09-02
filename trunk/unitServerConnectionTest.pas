unit unitServerConnectionTest;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitProxySpace, ExtCtrls, StdCtrls, Buttons;


const
  TestArraySize = 50;
  TestException = -2;
  TestExceptionColor = clBlack;

type
  TfmServerConnectionTest = class;

  TServerConnectionTesting = class(TThread)
  private
    fmTest: TfmServerConnectionTest;
    TestArrayLock: TCriticalSection;
    TestArray: array[0..TestArraySize-1] of integer;
    TestArrayIndex: integer;
    TestInterval: integer;
    flActive: boolean;

    Constructor Create(const pfmServerConnectionTest: TfmServerConnectionTest);
    Destructor Destroy; override;
    procedure Execute; override;
    function WaitFor: boolean;
    function TestArray_GetMax: integer;
 end;

  TfmServerConnectionTest = class(TForm)
    PaintBox: TPaintBox;
    Bevel1: TBevel;
    stCurrent: TStaticText;
    lbLog: TListBox;
    Timer: TTimer;
    stAnalize: TStaticText;
    procedure PaintBoxPaint(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ServerURL: string;
    Testing: TServerConnectionTesting;
    LogString: string;

    function RectangleColor(const Value: Integer): TColor;
    procedure DrawTest;
    procedure Log_WriteString;
    function AnalizeString: string;
  public
    { Public declarations }
    Constructor Create(const pServerURL: string);
    Destructor Destroy; override;
  end;



implementation
Uses
  ActiveX, FunctionalitySOAPInterface;

{$R *.dfm}



{TServerConnectionTesting}
Constructor TServerConnectionTesting.Create(const pfmServerConnectionTest: TfmServerConnectionTest);
var
  I: integer;
begin
fmTest:=pfmServerConnectionTest;
TestArrayLock:=TCriticalSection.Create;
for I:=0 to TestArraySize-1 do TestArray[I]:=-1;
TestArrayIndex:=0;
TestInterval:=1000;
flActive:=true;
Inherited Create(false);
end;

Destructor TServerConnectionTesting.Destroy;
var
  EC: dword;
begin
Terminate;
if (NOT WaitFor)
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else Inherited;
TestArrayLock.Free;
end;

function TServerConnectionTesting.TestArray_GetMax: integer;
var
  I: integer;
begin
Result:=0;
TestArrayLock.Enter;
try
for I:=0 to TestArraySize-1 do begin
  if TestArray[TestArrayIndex] > Result then Result:=TestArray[TestArrayIndex];
  Inc(TestArrayIndex);
  if TestArrayIndex >= TestArraySize then TestArrayIndex:=0;
  end;
finally
TestArrayLock.Leave;
end;
end;

procedure TServerConnectionTesting.Execute;
var
  SpaceManager: ISpaceManager;

  procedure TestIt;
  var
    LT: TDateTime;
    RequestTime: integer;
  begin
  try
  LT:=Now;
  SpaceManager.SpaceSize;
  RequestTime:=Round((Now-LT)*24*3600*1000);
  fmTest.LogString:='request time - '+IntToStr(RequestTime)+' ms.';
  except
    on E: Exception do begin
      RequestTime:=TestException;
      fmTest.LogString:=ANSIUpperCase('REQUEST ERROR - '+E.Message);
      end;
    end;
  //.
  Synchronize(fmTest.Log_WriteString);
  //.
  TestArrayLock.Enter;
  try
  TestArray[TestArrayIndex]:=RequestTime;
  Inc(TestArrayIndex);
  if TestArrayIndex >= TestArraySize then TestArrayIndex:=0;
  finally
  TestArrayLock.Leave;
  end;
  end;

begin
CoInitializeEx(nil, COINIT_MULTITHREADED);
try
SpaceManager:=GetISpaceManager(fmTest.ServerURL);
repeat
  if flActive
   then begin
    TestIt;
    Synchronize(fmTest.DrawTest);
    end;
  Sleep(TestInterval);
until Terminated;
finally
CoUnInitialize;
end;
end;

function TServerConnectionTesting.WaitFor: boolean;
const
  MaxWaitTime = 3;
var
  H: array[0..1] of THandle;
  WaitResult: Cardinal;
  I: integer;
  Msg: TMsg;
begin
  Result:=false;
  H[0] := Handle;
  if GetCurrentThreadID = MainThreadID then
  begin
    WaitResult := 0;
    H[1] := SyncEvent;
    I:=0;
    repeat
      { This prevents a potential deadlock if the background thread
        does a SendMessage to the foreground thread }
      if WaitResult = WAIT_OBJECT_0 + 2 then
        PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
      WaitResult := MsgWaitForMultipleObjects(2, H, False, 1000, QS_SENDMESSAGE);
      if WaitResult = WAIT_OBJECT_0
       then begin
        Result:=true;
        Exit; //. ->
        end;
      CheckThreadError(WaitResult <> WAIT_FAILED);
      if WaitResult = WAIT_OBJECT_0 + 1 then
        CheckSynchronize;
      if (WaitResult = WAIT_TIMEOUT) then Inc(I);
    until I >= MaxWaitTime;
  end else begin
    for I:=0 to MaxWaitTime-1 do 
      if WaitForSingleObject(H[0], 1000) = WAIT_OBJECT_0
       then begin
        Result:=true;
        Exit; //. ->
        end;
  end
end;


{TfmServerConnectionTest}
Constructor TfmServerConnectionTest.Create(const pServerURL: string);
begin
Inherited Create(nil);
ServerURL:=pServerURL;
Testing:=TServerConnectionTesting.Create(Self);
end;

Destructor TfmServerConnectionTest.Destroy;
begin
Testing.Free;
Inherited;
end;

function TfmServerConnectionTest.RectangleColor(const Value: Integer): TColor;
begin
case Value of
0..100: Result:=$0000B700;
101..333: Result:=$0000C1C1;
334..High(Value): Result:=$000000BB;
end;
end;

function TfmServerConnectionTest.AnalizeString: string;
const
  MinTimeCount = 10;
var
  EmptyCount: integer;
  TimeCount: integer;
  TimeSummary: integer;
  flException: boolean;
  I: integer;
  idx: integer;
  AvrTime: integer;
begin
EmptyCount:=0;
TimeCount:=0;
TimeSummary:=0;
flException:=false;
with Testing do begin
TestArrayLock.Enter;
try
idx:=TestArrayIndex;
for I:=0 to TestArraySize-1 do begin
  if TestArray[idx] = -2
   then begin
    flException:=true;
    Break; //. >
    end;
  if TestArray[idx] <> -1
   then begin
    Inc(TimeSummary,TestArray[idx]);
    Inc(TimeCount);
    end
   else Inc(EmptyCount);
  //.
  Inc(idx);
  if idx >= TestArraySize then idx:=0;
  end;
finally
TestArrayLock.Leave;
end;
if flException
 then begin
  Result:='connection is errored';
  Exit; //. ->
  end;
if TimeCount >= MinTimeCount
 then begin
  AvrTime:=Round(TimeSummary/TimeCount);
  case AvrTime of
  0..100: Result:='connection is fast';
  101..333: Result:='connection is normal';
  334..1000: Result:='connection is slow';
  1001..High(AvrTime): Result:='connection is too slow';
  end;
  end
 else Result:='analize interval too short';
end;
end;

procedure TfmServerConnectionTest.DrawTest;

  procedure DrawMesh(const Range: Extended);
  const
    StepYTime = 100;
  var
    I,J: integer;
    StepX,StepY: Extended;
    CountX: integer;
    CountY: integer;
  begin
  with PaintBox do begin
  CountX:=TestArraySize;
  StepX:=Width/CountX;
  CountY:=Round(Range/StepYTime);
  StepY:=StepYTime*(Height/Range);
  for I:=0 to CountY do
    for J:=0 to CountX do Canvas.Pixels[Round(J*StepX),Height-Round(I*StepY)]:=clBlack;
  end;
  end;

var
  I: integer;
  Value: integer;
  Y: integer;
  Step: Extended;
  TestMaxValue: integer;
begin
with PaintBox,Testing do begin
Canvas.Lock;
try
TestArrayLock.Enter;
try
Step:=Width/TestArraySize;
Canvas.Pen.Color:=TColor($00DDDDDD);
Canvas.Brush.Color:=Canvas.Pen.Color;
Canvas.Rectangle(0,0,Width,Height);
TestMaxValue:=TestArray_GetMax;
if TestMaxValue = 0 then TestMaxValue:=1000;
for I:=0 to TestArraySize-1 do begin
  Value:=TestArray[TestArrayIndex];
  Inc(TestArrayIndex);
  if TestArrayIndex >= TestArraySize then TestArrayIndex:=0;
  //. draw value
  if Value <> -1
   then
    if Value <> -2
     then begin
      Y:=Round(Height*(1-Value/TestMaxValue));
      if Y < 0
       then Y:=0
       else if (Height-Y) < 3 then Y:=Height-3;
      Canvas.Pen.Color:=clGray;
      Canvas.Brush.Color:=RectangleColor(Value);
      Canvas.Rectangle(Round(I*Step),Height,Round((I+1)*Step),Y);
      end
     else begin
      Y:=0;
      Canvas.Pen.Color:=clGray;
      Canvas.Brush.Color:=TestExceptionColor;
      Canvas.Rectangle(Round(I*Step),Height,Round((I+1)*Step),Y);
      end;
  end;
if TestArrayIndex > 0 then I:=TestArrayIndex-1 else I:=TestArraySize-1;
if TestArray[I] <> -1
 then
  if TestArray[I] <> -2
   then begin
    Value:=TestArray[I];
    stCurrent.Font.Color:=clBlack;
    stCurrent.Color:=RectangleColor(Value);
    stCurrent.Caption:=IntToStr(Value)+' ms.';
    end
   else begin
    stCurrent.Font.Color:=clWhite;
    stCurrent.Color:=clRed;
    stCurrent.Caption:='error ';
    end
 else begin
  stCurrent.Font.Color:=clBlack;
  stCurrent.Color:=Self.Color;
  stCurrent.Caption:='?';
  end;
finally
TestArrayLock.Leave;
end;
DrawMesh(TestMaxValue);
finally
Canvas.Unlock;
end;
end;
end;

procedure TfmServerConnectionTest.PaintBoxPaint(Sender: TObject);
begin
DrawTest;
end;

procedure TfmServerConnectionTest.Log_WriteString;
begin
lbLog.ItemIndex:=lbLog.Items.Add(LogString);
lbLog.Refresh;
end;


procedure TfmServerConnectionTest.TimerTimer(Sender: TObject);
begin
if Testing.flActive
 then begin                   
  stAnalize.Caption:=AnalizeString;
  end;
Timer.Tag:=Timer.Tag+1;
if Timer.Tag > 300 then Close;
end;

procedure TfmServerConnectionTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
