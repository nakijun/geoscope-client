unit unitProxySpaceSpaceWindowReflectingTesting;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, ActiveX, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, unitProxySpace, StdCtrls, ExtCtrls, Buttons;

const
  SpaceWindowReflectingTestingFile = 'SpaceWindowReflectingTesting.dat';
type
  TProcedureParams = packed record
    pUserName: shortstring;
    pUserPassword: shortstring;
    X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd;
    //. not needed HidedLaysArray: TByteArray;
    VisibleFactor: integer;
    DynamicHintVisibility: double;
    BitmapWidth,BitmapHeight: integer;
  end;

  TProcedureParamsRecorder = class
  private
    Lock: TCriticalSection;
    FS: TFileStream;
    _OperationsCount: integer;
  public
    Constructor Create();
    Destructor Destroy(); override;
    procedure AddParams(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; Bitmap: TBitmap);
    function OperationsCount(): integer;
  end;


  TTester = class;

  TTestingThread = class(TThread)
  private
    Lock: TCriticalSection;
    Space: TProxySpace;
    Tester: TTester;
    Index: integer; 
    ParametersStream: TMemoryStream;
    ParametersStream_Counter: integer;
    ParametersStream_Position: integer;
    CallInterval: integer;
    flInOperation: boolean;
    _OperationsCount: integer;
    _OperationsExceptionsCount: integer;
    _OperationSummaryTime: TDateTime;
    _OperationAvrTime: TDateTime;
    Bitmap: TBitmap;

    Constructor Create(const pSpace: TProxySpace; const pTester: TTester; const pIndex: integer; const pParametersStream: TMemoryStream; const pCallInterval: integer);
    Destructor Destroy(); override;
    procedure Execute(); override;
    function InOperation(): boolean;
    function OperationsCount(): integer;
    function OperationsExceptionsCount(): integer;
    function OperationAvrTime: TDateTime;
    procedure DrawBitmap();
  end;

  TTester = class
  private
    Space: TProxySpace;
    ThreadsCount: integer;
    CallInterval: integer;
    ParametersStream: TMemoryStream;
    Threads: array of TTestingThread;
    flRandomThreadAccess: boolean;
    flShowOutput: boolean;

    Constructor Create(const pSpace: TProxySpace; const pThreadsCount: integer; const pCallInterval: integer; const pflRandomThreadAccess: boolean; const pflShowOutput: boolean);
    Destructor Destroy(); override;
    procedure StartThreads();
    procedure StopThreads();
    function InOperationCount(): integer;
    function OperationsCount(): integer;
    function OperationsExceptionsCount(): integer;
    function OperationAvrTime: TDateTime;
  end;


  TfmProxySpaceSpaceWindowReflectingTesting = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    pnlRecording: TPanel;
    pnlTesting: TPanel;
    cbRecording: TCheckBox;
    rbRecording: TRadioButton;
    rbTesting: TRadioButton;
    Label1: TLabel;
    edThreadsCount: TEdit;
    Label2: TLabel;
    edCallInterval: TEdit;
    btnStartTesting: TBitBtn;
    btnStopTesting: TBitBtn;
    Bevel1: TBevel;
    lbRecordingOperationsCount: TLabel;
    Timer: TTimer;
    Bevel2: TBevel;
    lbInOperationCount: TLabel;
    lbOperationsCount: TLabel;
    lbOperationsExceptionsCount: TLabel;
    lbOperationsAvrTime: TLabel;
    Image: TImage;
    Bevel3: TBevel;
    cbRandomThreadAccess: TCheckBox;
    cbShowOutput: TCheckBox;
    procedure cbRecordingClick(Sender: TObject);
    procedure rbRecordingClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure btnStartTestingClick(Sender: TObject);
    procedure btnStopTestingClick(Sender: TObject);
    procedure cbShowOutputClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
  public
    { Public declarations }
    ProcedureParamsRecorder: TProcedureParamsRecorder;
    Tester: TTester;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy(); override;
  end;

var
  fmProxySpaceSpaceWindowReflectingTesting: TfmProxySpaceSpaceWindowReflectingTesting = nil;

implementation
uses
  GDIPOBJ, GDIPAPI; //. GDI+ support
  

{$R *.dfm}


{TProcedureParamsRecorder}
Constructor TProcedureParamsRecorder.Create();
begin
Inherited Create;
Lock:=TCriticalSection.Create();
_OperationsCount:=0;
FS:=TFileStream.Create(ExtractFilePath(ParamStr(0))+'\'+SpaceWindowReflectingTestingFile,fmCreate);
end;

Destructor TProcedureParamsRecorder.Destroy();
begin
FS.Free();
Lock.Free();
Inherited;
end;

procedure TProcedureParamsRecorder.AddParams(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; Bitmap: TBitmap);
var
  Prm: TProcedureParams;
begin
Prm.pUserName:=pUserName;
Prm.pUserPassword:=pUserPassword;
Prm.X0:=X0;
Prm.Y0:=Y0;
Prm.X1:=X1;
Prm.Y1:=Y1;
Prm.X2:=X2;
Prm.Y2:=Y2;
Prm.X3:=X3;
Prm.Y3:=Y3;
//. not needed HidedLaysArray: TByteArray;
Prm.VisibleFactor:=VisibleFactor;
Prm.DynamicHintVisibility:=DynamicHintVisibility;
Prm.BitmapWidth:=Bitmap.Width;
Prm.BitmapHeight:=Bitmap.Height;
//.
Lock.Enter();
try
FS.Write(Prm,SizeOf(Prm));
Inc(_OperationsCount);
finally
Lock.Leave();
end;
end;

function TProcedureParamsRecorder.OperationsCount(): integer;
begin
Lock.Enter();
try
Result:=_OperationsCount;
finally
Lock.Leave();
end;
end;


{TTestingThread}
Constructor TTestingThread.Create(const pSpace: TProxySpace; const pTester: TTester; const pIndex: integer; const pParametersStream: TMemoryStream; const pCallInterval: integer);
begin
Lock:=TCriticalSection.Create();
Space:=pSpace;
Tester:=pTester;
Index:=pIndex;
ParametersStream:=pParametersStream;
ParametersStream_Counter:=(ParametersStream.Size DIV SizeOf(TProcedureParams));
ParametersStream_Position:=0;
CallInterval:=pCallInterval*1000;
//.
flInOperation:=false;
_OperationsCount:=0;
_OperationsExceptionsCount:=0;
_OperationSummaryTime:=0.0;
_OperationAvrTime:=0.0;
//.
Inherited Create(true);
end;

Destructor TTestingThread.Destroy();
begin
Inherited;
Lock.Free();
end;

procedure TTestingThread.Execute();
const
  SpecialThread = 20;
  SpecialThreadDelay = 60*15{minutes};

  procedure CheckStack();
  var
    A: array[0..1*1024*1000] of byte;
  begin
  Sleep(Length(A)*0);
  end;

var
  StartupInput: TGDIPlusStartupInput;
  gdiplusToken: ULONG;
  I: integer;
  LastTime: TDateTime;
  dT: TDateTime;
  Prm: TProcedureParams;
  ActualityInterval: TComponentActualityInterval;
  DynamicHintData: TMemoryStream;
begin
if (Index = SpecialThread)
 then begin
  for I:=1 to SpecialThreadDelay do begin
    Sleep(1000);
    if (Terminated) then Exit; //. ->
    end;
  end;
if (Index = SpecialThread)
 then CheckStack();
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
//. init GDI+
StartupInput.DebugEventCallback := nil;
StartupInput.SuppressBackgroundThread := False;
StartupInput.SuppressExternalCodecs   := False;
StartupInput.GdiplusVersion := 1;
GdiplusStartup(gdiplusToken, @StartupInput, nil);
try
while (NOT Terminated) do begin
  for I:=0 to ParametersStream_Counter-1 do begin
    Lock.Enter();
    try
    flInOperation:=true;
    finally
    Lock.Leave();
    end;
    //.
    try
    LastTime:=Now;
    if (Tester.flRandomThreadAccess)
     then Prm:=TProcedureParams(Pointer(DWord(ParametersStream.Memory)+Random(ParametersStream_Counter-1)*SizeOf(TProcedureParams))^) //. random position
     else begin Prm:=TProcedureParams(Pointer(DWord(ParametersStream.Memory)+ParametersStream_Position)^); Inc(ParametersStream_Position,SizeOf(TProcedureParams)); end;
    //.
    with Prm do begin
    Bitmap:=TBitmap.Create();
    try
    Bitmap.Canvas.Lock();
    try
    Bitmap.Width:=Prm.BitmapWidth;
    Bitmap.Height:=Prm.BitmapHeight;
    //.
    ActualityInterval.BeginTimestamp:=NullTimestamp;
    ActualityInterval.EndTimestamp:=MaxTimestamp;
    //.
    Space.User_ReflectSpaceWindowOnBitmap(pUserName,pUserPassword, X0,Y0, X1,Y1, X2,Y2, X3,Y3, nil{HidedLaysArray}, VisibleFactor, DynamicHintVisibility, 0, nil, ActualityInterval, {out} Bitmap, {out} DynamicHintData);
    finally
    Bitmap.Canvas.Unlock();
    end;
    dT:=Now-LastTime;
    //.
    if (Tester.flShowOutput) then Synchronize(DrawBitmap);
    finally
    FreeAndNil(Bitmap);
    end;
    end;
    //.
    Lock.Enter();
    try
    Inc(_OperationsCount);
    _OperationSummaryTime:=_OperationSummaryTime+dT;
    _OperationAvrTime:=_OperationSummaryTime/OperationsCount;
    finally
    Lock.Leave();
    end;
    except
      Lock.Enter();
      try
      Inc(_OperationsExceptionsCount);
      finally
      Lock.Leave();
      end;
      end;
    //.
    Lock.Enter();
    try
    flInOperation:=false;
    finally
    Lock.Leave();
    end;
    //.
    if (CallInterval > 0) then Sleep(CallInterval);
    //.
    if (Terminated) then Exit; //. ->
    end;
  ParametersStream_Position:=0;
  end;
finally
GdiplusShutdown(gdiplusToken);
end;
finally
CoUnInitialize();
end;
end;

function TTestingThread.InOperation(): boolean;
begin
Lock.Enter();
try
Result:=flInOperation;
finally
Lock.Leave();
end;
end;

function TTestingThread.OperationsCount(): integer;
begin
Lock.Enter();
try
Result:=_OperationsCount;
finally
Lock.Leave();
end;
end;

function TTestingThread.OperationsExceptionsCount(): integer;
begin
Lock.Enter();
try
Result:=_OperationsExceptionsCount;
finally
Lock.Leave();
end;
end;

function TTestingThread.OperationAvrTime: TDateTime;
begin
Lock.Enter();
try
Result:=_OperationAvrTime;
finally
Lock.Leave();
end;
end;

procedure TTestingThread.DrawBitmap();
begin
if ((Bitmap <> nil) AND (fmProxySpaceSpaceWindowReflectingTesting <> nil))
 then begin
  fmProxySpaceSpaceWindowReflectingTesting.Image.Picture.Bitmap.Assign(Bitmap);
  fmProxySpaceSpaceWindowReflectingTesting.Image.Repaint();
  end;
end;


{TTester}
Constructor TTester.Create(const pSpace: TProxySpace; const pThreadsCount: integer; const pCallInterval: integer; const pflRandomThreadAccess: boolean;const pflShowOutput: boolean);
begin
Inherited Create();
Space:=pSpace;
//.
ThreadsCount:=pThreadsCount;
CallInterval:=pCallInterval;
flRandomThreadAccess:=pflRandomThreadAccess;
flShowOutput:=pflShowOutput;
//.
ParametersStream:=TMemoryStream.Create();
ParametersStream.LoadFromFile(ExtractFilePath(ParamStr(0))+'\'+SpaceWindowReflectingTestingFile);
//.
SetLength(Threads,0);
//.
StartThreads();
end;

Destructor TTester.Destroy();
begin
StopThreads();
//.
ParametersStream.Free();
Inherited;
end;

procedure TTester.StartThreads();
var
  I: integer;
begin
StopThreads();
SetLength(Threads,ThreadsCount);
for I:=0 to Length(Threads)-1 do Threads[I]:=TTestingThread.Create(Space,Self,I,ParametersStream,CallInterval);
for I:=0 to Length(Threads)-1 do TThread(Threads[I]).Resume();
end;

procedure TTester.StopThreads();
var
  I: integer;
begin
for I:=0 to Length(Threads)-1 do TThread(Threads[I]).Terminate();
for I:=0 to Length(Threads)-1 do TObject(Threads[I]).Destroy();
SetLength(Threads,0);
end;

function TTester.InOperationCount(): integer;
var
  I: integer;
begin
Result:=0;
for I:=0 to Length(Threads)-1 do if (Threads[I].InOperation()) then Inc(Result);
end;

function TTester.OperationsCount(): integer;
var
  I: integer;
begin
Result:=0;
for I:=0 to Length(Threads)-1 do Inc(Result,Threads[I].OperationsCount());
end;

function TTester.OperationsExceptionsCount(): integer;
var
  I: integer;
begin
Result:=0;
for I:=0 to Length(Threads)-1 do Inc(Result,Threads[I].OperationsExceptionsCount());
end;

function TTester.OperationAvrTime: TDateTime;
var
  I: integer;
begin
Result:=0;
if (Length(Threads) = 0) then Exit; //. ->
for I:=0 to Length(Threads)-1 do Result:=Result+Threads[I].OperationAvrTime();
Result:=Result/Length(Threads);
end;


{TfmProxySpaceSpaceWindowReflectingTesting}
Constructor TfmProxySpaceSpaceWindowReflectingTesting.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
//.
ProcedureParamsRecorder:=nil;
Tester:=nil;
//.
rbTesting.Checked:=true;
end;

Destructor TfmProxySpaceSpaceWindowReflectingTesting.Destroy();
begin
FreeAndNil(Tester);
FreeAndNil(ProcedureParamsRecorder);
Inherited;
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.rbRecordingClick(Sender: TObject);
begin
if (rbRecording.Checked)
 then begin
  FreeAndNil(Tester);
  //.
  pnlRecording.Show();
  pnlTesting.Hide();
  end
 else begin
  FreeAndNil(ProcedureParamsRecorder);
  //.
  pnlTesting.Show();
  pnlRecording.Hide();
  end;
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.cbRecordingClick(Sender: TObject);
begin
FreeAndNil(Tester);
//.
FreeAndNil(ProcedureParamsRecorder);
if (cbRecording.Checked)
 then begin
  FreeAndNil(Tester);
  ProcedureParamsRecorder:=TProcedureParamsRecorder.Create();
  end;
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.btnStartTestingClick(Sender: TObject);
begin
FreeAndNil(ProcedureParamsRecorder); cbRecording.Checked:=false;
//.
FreeAndNil(Tester);
Tester:=TTester.Create(Space,StrToInt(edThreadsCount.Text),StrToInt(edCallInterval.Text),cbRandomThreadAccess.Checked,cbShowOutput.Checked);
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.btnStopTestingClick(Sender: TObject);
begin
FreeAndNil(Tester);
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.TimerTimer(Sender: TObject);
begin
if (ProcedureParamsRecorder <> nil)
 then begin
  lbRecordingOperationsCount.Caption:='Operations recorded: '+IntToStr(ProcedureParamsRecorder.OperationsCount());
  end
 else begin
  lbRecordingOperationsCount.Caption:='';
  end;
if (Tester <> nil)
 then begin
  lbInOperationCount.Caption:='In operation: '+IntToStr(Tester.InOperationCount());
  lbOperationsCount.Caption:='Operation processed: '+IntToStr(Tester.OperationsCount());
  lbOperationsExceptionsCount.Caption:='Operations exceptions: '+IntToStr(Tester.OperationsExceptionsCount());
  lbOperationsAvrTime.Caption:='Operation avr time, ms: '+IntToStr(Trunc(Tester.OperationAvrTime*24*3600*1000));
  ///test
  {
  Timer.Interval:=10000;
  Application.ProcessMessages();
  btnStartTestingClick(nil);}
  end
 else begin
  lbInOperationCount.Caption:='';
  lbOperationsCount.Caption:='';
  lbOperationsExceptionsCount.Caption:='';
  lbOperationsAvrTime.Caption:='';
  end;
end;

procedure TfmProxySpaceSpaceWindowReflectingTesting.cbShowOutputClick(Sender: TObject);
begin
if (Tester <> nil) then Tester.flShowOutput:=cbShowOutput.Checked;
end;


Initialization

Finalization
fmProxySpaceSpaceWindowReflectingTesting.Free();

end.
