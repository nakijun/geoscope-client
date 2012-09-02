unit unitSelectionsProvider;
Interface
Uses
  Windows, Classes, ExtCtrls, unitChanels, SyncObjs;

Type
  {TProvidingThread}
  TSelectionsProvider = class;

  TCyclicBuffersReadOffsets = array of Integer;

  TProvidingThread = class(TThread)
  private
    SelectionsProvider: TSelectionsProvider;
    evtSelectionsInserted: THandle;
    BuffersReadOffsets: TCyclicBuffersReadOffsets;
    Selections: TSelections;
    ProcessDoOnChangeStatusCount: integer;

    procedure ProcessDoOnAddSelections;
    procedure ProcessDoOnChangeStatus;
  public
    Constructor Create(pSelectionsProvider: TSelectionsProvider);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure DoOnAddSelections(const Selections: TSelections);
  end;


  {TSelectionsProvider}
  TOnChangeStatus = TNotifyEvent;
  TInvalidChanels = array of Integer;

  TSelectionsProvider = class(TChanels)
  private
    Lock: TCriticalSection;
    Providing: TProvidingThread;
  public
    OnChangeStatus: TNotifyEvent;
    Active: boolean;
    flTimeout: boolean;
    flValidData: boolean;

    Constructor Create;
    Destructor Destroy; override;
    procedure DoOnAddSelections(const Selections: TSelections); override;
    procedure AfterConstruction; override;
  end;

type
  TCPUUsageSelectionsProvider = class;

  TCPUUsageSelectionsProviderReading = class(TThread)
  public
    CPUUsageSelectionsProvider: TCPUUsageSelectionsProvider;

    Constructor Create(pCPUUsageSelectionsProvider: TCPUUsageSelectionsProvider);
    procedure Execute; override;
  end;

  TCPUUsageSelectionsProvider = class(TSelectionsProvider)
  public
    Reading: TCPUUsageSelectionsProviderReading;
    CPUUsage: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Update(Sender: TObject);
  end;


var
  flConfigurable: boolean = false;

Implementation
Uses
  SysUtils, Forms, adCPUUsage;



{TProvidingThread}
Constructor TProvidingThread.Create(pSelectionsProvider: TSelectionsProvider);
var
  I: integer;
begin
SelectionsProvider:=pSelectionsProvider;
//.
//. set chanels cyclic buffers offsets
SetLength(BuffersReadOffsets,SelectionsProvider.Count);
for I:=0 to SelectionsProvider.Count-1 do BuffersReadOffsets[I]:=TChanel(SelectionsProvider[I]).CyclicBuffer.BufferHeadOffset;
//.
SetLength(Selections,SelectionsProvider.Count);
//.
evtSelectionsInserted:=CreateEvent(nil,false,false,nil);
//.
ProcessDoOnChangeStatusCount:=1;
//.
Inherited Create(false);
end;

Destructor TProvidingThread.Destroy;
begin
//. terminating
Terminate;
Inherited;
//.
CloseHandle(evtSelectionsInserted);
//.
end;

procedure TProvidingThread.Execute;
const
  Interval = 2000;
var
  R: DWord;
  I: integer;
  SelectionsChanelsPrepared: integer;
  SC: integer;
begin
SC:=0;
with SelectionsProvider do
repeat
  R:=WaitForSingleObject(evtSelectionsInserted, Interval);
  if R = WAIT_OBJECT_0
   then begin //. selections processing
    flTimeout:=false;
    try
    repeat
      SelectionsChanelsPrepared:=0;
      Lock.Enter;
      try
      for I:=0 to Count-1 do with TChanel(SelectionsProvider[I]).CyclicBuffer do
        if BuffersReadOffsets[I] <> BufferHeadOffset
         then begin
          Selections[I]:=TSelection(Pointer(Integer(BufferPtr)+BuffersReadOffsets[I])^);
          Next(BuffersReadOffsets[I]);
          Inc(SelectionsChanelsPrepared);
          end;
      finally
      Lock.Leave;
      end;
      if SelectionsChanelsPrepared = 0 then Break; //. >
      if SelectionsChanelsPrepared = Count
       then begin
        /// - if Assigned(SelectionsProvider.OnAddSelections) then SelectionsProvider.OnAddSelections(Selections);
        //. process selections in main thread
        Synchronize(ProcessDoOnAddSelections);
        end
       else
        Raise Exception.Create('wrong read selections number'); //. =>
      //.
      Inc(SC);
      if SC = ProcessDoOnChangeStatusCount
       then begin
        Synchronize(ProcessDoOnChangeStatus);
        SC:=0;
        end;
      //.
    until false;
    except
      Sleep(0);
      end;
    end
   else
    if Active
     then begin
      flTimeout:=true;
      flValidData:=flValidData AND (NOT flTimeout);
      try
      Synchronize(ProcessDoOnChangeStatus);
      except
        end;
      //. zeroing prepeared selections
      for I:=0 to SelectionsProvider.Count-1 do Selections[I].Value:=0;
      //. process zero-selections in main thread
      try
      Synchronize(ProcessDoOnAddSelections);
      except
        end;
      end
     else
      flTimeout:=false;
until Terminated;
end;

procedure TProvidingThread.ProcessDoOnAddSelections;
begin
try
if Assigned(SelectionsProvider.OnAddSelections) then SelectionsProvider.OnAddSelections(Selections);
except
  end;
end;

procedure TProvidingThread.ProcessDoOnChangeStatus;
begin
try
if Assigned(SelectionsProvider.OnChangeStatus) then SelectionsProvider.OnChangeStatus(SelectionsProvider);
except
  end;
end;

procedure TProvidingThread.DoOnAddSelections(const Selections: TSelections);
begin
//. set Event
SetEvent(evtSelectionsInserted);
//.
end;


{TSelectionsProvider}
Constructor TSelectionsProvider.Create;
begin
Inherited Create(nil);
Lock:=TCriticalSection.Create;
ResizeCyclicBuffers(1024);
Active:=false;
Providing:=TProvidingThread.Create(Self);
OnChangeStatus:=nil;
end;

Destructor TSelectionsProvider.Destroy;
begin
Providing.Free;
Lock.Free;
Inherited;
end;

procedure TSelectionsProvider.AfterConstruction;
begin
Inherited;
if Assigned(OnChangeStatus) then OnChangeStatus(Self);
end;

procedure TSelectionsProvider.DoOnAddSelections(const Selections: TSelections);
var
  I: integer;
begin
//. processing last handler
if Assigned(FLastOnAddSelections) then FLastOnAddSelections(Selections);
//.
if NOT Active then Exit; //. ->
//.
if Assigned(OnBeforeAddSelections) then OnBeforeAddSelections;
//. procesing for chanels cyclic buffers
Lock.Enter;
try
for I:=0 to Count-1 do TChanel(List[I]).CyclicBuffer.Insert(Selections[I]);
finally
Lock.Leave;
end;
//.
Providing.DoOnAddSelections(Selections);
end;



{TCPUUsageSelectionsProvider}
Constructor TCPUUsageSelectionsProvider.Create;
var
  I: integer;
begin
CollectCPUData;
SetChanels(GetCPUCount);
for I:=0 to Count-1 do with TChanel(Self[I]) do begin
  ZeroLevel:=0;
  Range:=100;
  end;
Inherited Create;
Reading:=TCPUUsageSelectionsProviderReading.Create(Self);
end;

Destructor TCPUUsageSelectionsProvider.Destroy;
begin
Reading.Terminate;
Sleep(300);
Reading.Free;
Inherited;
end;

procedure TCPUUsageSelectionsProvider.Update(Sender: TObject);
var
  Selections: TSelections;
  I: integer;
begin
SetLength(Selections,Count);
for I:=0 to Count-1 do Selections[I].Value:=Round(GetCPUUsage(I)*100);
/// -- Selections[0].Value:=GetHDDUsage;
DoOnAddSelections(Selections);
//.
CollectCPUData;
end;


Constructor TCPUUsageSelectionsProviderReading.Create(pCPUUsageSelectionsProvider: TCPUUsageSelectionsProvider);
begin
CPUUsageSelectionsProvider:=pCPUUsageSelectionsProvider;
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

procedure TCPUUsageSelectionsProviderReading.Execute;
var
  Selections: TSelections;
  I: integer;
begin
SetLength(Selections,CPUUsageSelectionsProvider.Count);
repeat
  //.
  for I:=0 to CPUUsageSelectionsProvider.Count-1 do Selections[I].Value:=Round(GetCPUUsage(I)*100);
  //.
  with CPUUsageSelectionsProvider do begin
  CPUUsage:=0;
  for I:=0 to CPUUsageSelectionsProvider.Count-1 do CPUUsage:=CPUUsage+Selections[I].Value;
  end;
  //.
  CPUUsageSelectionsProvider.DoOnAddSelections(Selections);
  //.
  CollectCPUData;
  //.
  Sleep(200);
until Terminated;
end;

end.
