unit MySysUtils;

{$H+}
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  SysUtils,
  Windows,
  Types,
  SyncObjs,
  SysConst;

type
  //. Delphi native
  TMultiReadExclusiveWriteSynchronizer = class(TInterfacedObject, IReadWriteSync)
  private
    FSentinel: Integer;
    FReadSignal: THandle;
    FWriteSignal: THandle;
    FWaitRecycle: Cardinal;
    FWriteRecursionCount: Cardinal;
    tls: TThreadLocalCounter;
    FWriterID: Cardinal;
    FRevisionLevel: Cardinal;
    ReadingCount: integer;
    WritingCount: integer;

    procedure BlockReaders;
    procedure UnblockReaders;
    procedure UnblockOneWriter;
    procedure WaitForReadSignal;
    procedure WaitForWriteSignal;
  public
    constructor Create;
    destructor Destroy; override;
    procedure BeginRead;
    procedure EndRead;
    function BeginWrite: Boolean;
    procedure EndWrite;
    property RevisionLevel: Cardinal read FRevisionLevel;
  end;

type
  TMREWSync = TMultiReadExclusiveWriteSynchronizer;  // short form

type
  //. J.Richter port
  TMultiReadExclusiveWriteSynchronizerByRichter = class(TInterfacedObject, IReadWriteSync)
  private
    m_nWaitingReaders: integer;
    m_nWaitingWriters: integer;
    m_nActive: integer;
    m_hsemReaders: THandle;
    m_hsemWriters: THandle;
    m_cs: TCriticalSection;

    procedure Unlock;
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure BeginRead;
    procedure EndRead;
    function BeginWrite: Boolean;
    procedure EndWrite;
  end;

implementation

{ TMultiReadExclusiveWriteSynchronizer }
const
  mrWriteRequest = $FFFF; // 65535 concurrent read requests (threads)
                          // 32768 concurrent write requests (threads)
                          // only one write lock at a time
                          // 2^32 lock recursions per thread (read and write combined)

{TMultiReadExclusiveWriteSynchronizer}                          
constructor TMultiReadExclusiveWriteSynchronizer.Create;
begin
  inherited Create;
  FSentinel := mrWriteRequest;
  FReadSignal := CreateEvent(nil, True, True, nil);  // manual reset, start signaled
  FWriteSignal := CreateEvent(nil, False, False, nil); // auto reset, start blocked
  ReadingCount:=0;
  WritingCount:=0;
  FWaitRecycle := INFINITE;
  tls := TThreadLocalCounter.Create;
end;

destructor TMultiReadExclusiveWriteSynchronizer.Destroy;
begin
  BeginWrite;
  inherited Destroy;
  CloseHandle(FReadSignal);
  CloseHandle(FWriteSignal);
  tls.Free;
end;

procedure TMultiReadExclusiveWriteSynchronizer.BlockReaders;
begin
  ResetEvent(FReadSignal);
end;

procedure TMultiReadExclusiveWriteSynchronizer.UnblockReaders;
begin
  SetEvent(FReadSignal);
end;

procedure TMultiReadExclusiveWriteSynchronizer.UnblockOneWriter;
begin
  SetEvent(FWriteSignal);
end;

procedure TMultiReadExclusiveWriteSynchronizer.WaitForReadSignal;
begin
  WaitForSingleObject(FReadSignal, FWaitRecycle);
end;

procedure TMultiReadExclusiveWriteSynchronizer.WaitForWriteSignal;
begin
  WaitForSingleObject(FWriteSignal, FWaitRecycle);
end;

function TMultiReadExclusiveWriteSynchronizer.BeginWrite: Boolean;
var
  Thread: PThreadInfo;
  HasReadLock: Boolean;
  ThreadID: Cardinal;
  Test: Integer;
  OldRevisionLevel: Cardinal;
begin
  {
    States of FSentinel (roughly - during inc/dec's, the states may not be exactly what is said here):
    mrWriteRequest:         A reader or a writer can get the lock
    1 - (mrWriteRequest-1): A reader (possibly more than one) has the lock
    0:                      A writer (possibly) just got the lock, if returned from the main write While loop
    < 0, but not a multiple of mrWriteRequest: Writer(s) want the lock, but reader(s) have it.
          New readers should be blocked, but current readers should be able to call BeginRead     
    < 0, but a multiple of mrWriteRequest: Writer(s) waiting for a writer to finish
  }

  Result := True;
  ThreadID := GetCurrentThreadID;
  if FWriterID <> ThreadID then  // somebody or nobody has a write lock
  begin
    // Prevent new readers from entering while we wait for the existing readers
    // to exit.
    //. commented by PAV BlockReaders;

    OldRevisionLevel := FRevisionLevel;

    tls.Open(Thread);
    // We have another lock already. It must be a read lock, because if it
    // were a write lock, FWriterID would be our threadid.
    HasReadLock := Thread.RecursionCount > 0;

    if HasReadLock then    // acquiring a write lock requires releasing read locks
      InterlockedIncrement(FSentinel);

    // InterlockedExchangeAdd returns prev value
    while InterlockedExchangeAdd(FSentinel, -mrWriteRequest) <> mrWriteRequest do
    begin
      // Undo what we did, since we didn't get the lock
      Test := InterlockedExchangeAdd(FSentinel, mrWriteRequest);
      // If the old value (in Test) was 0, then we may be able to
      // get the lock (because it will now be mrWriteRequest). So,
      // we continue the loop to find out. Otherwise, we go to sleep,
      // waiting for a reader or writer to signal us.
      if (Test <> 0) then
      begin
        WaitForWriteSignal;
      end;
    end;

    // At the EndWrite, first Writers are awoken, and then Readers are awoken.
    // If a Writer got the lock, we don't want the readers to do busy
    // waiting. This Block resets the event in case the situation happened.
    BlockReaders;

    // Put our read lock marker back before we lose track of it
    if HasReadLock then
      InterlockedDecrement(FSentinel);

    FWriterID := ThreadID;

    Result := Integer(OldRevisionLevel) = (InterlockedIncrement(Integer(FRevisionLevel)) - 1);
    //.
    //. check
    { иногда созникает состояние когда условие выполняется,
      но долго тестировав, ошибок синхронизации не обнаружено
      if (NOT HasReadLock AND (ReadingCount > 0))
     then Windows.Beep(1000,50); ///testing }
  end;

  Inc(FWriteRecursionCount);
  Inc(WritingCount);
end;

procedure TMultiReadExclusiveWriteSynchronizer.EndWrite;
var
  Thread: PThreadInfo;
begin
  tls.Open(Thread);
  Dec(WritingCount);
  Dec(FWriteRecursionCount); 
  if FWriteRecursionCount = 0 then
  begin
    FWriterID := 0;
    InterlockedExchangeAdd(FSentinel, mrWriteRequest);
    UnblockOneWriter;
    UnblockReaders;
  end;
  if Thread.RecursionCount = 0 then
    tls.Delete(Thread);
end;

procedure TMultiReadExclusiveWriteSynchronizer.BeginRead;
var
  Thread: PThreadInfo;
  WasRecursive: Boolean;
  SentValue: Integer;
begin
  tls.Open(Thread);
  Inc(Thread.RecursionCount);
  WasRecursive := Thread.RecursionCount > 1;

  if FWriterID <> GetCurrentThreadID then
  begin
    // In order to prevent recursive Reads from causing deadlock,
    // we need to always WaitForReadSignal if not recursive.
    // This prevents unnecessarily decrementing the FSentinel, and
    // then immediately incrementing it again.
    if not WasRecursive then
    begin
      // Make sure we don't starve writers. A writer will
      // always set the read signal when it is done, and it is initially on.
      WaitForReadSignal;
      while (InterlockedDecrement(FSentinel) <= 0) do
      begin
        // Because the InterlockedDecrement happened, it is possible that
        // other threads "think" we have the read lock,
        // even though we really don't. If we are the last reader to do this,
        // then SentValue will become mrWriteRequest
        SentValue := InterlockedIncrement(FSentinel);
        // So, if we did inc it to mrWriteRequest at this point,
        // we need to signal the writer.
        if SentValue = mrWriteRequest then
          UnblockOneWriter;

        // This sleep below prevents starvation of writers
        Sleep(0);

        WaitForReadSignal;
      end;
    end;
  end;
  //.
  Inc(ReadingCount);
end;

procedure TMultiReadExclusiveWriteSynchronizer.EndRead;
var
  Thread: PThreadInfo;
  Test: Integer;
begin
  tls.Open(Thread);
  Dec(ReadingCount); 
  Dec(Thread.RecursionCount);
  if (Thread.RecursionCount = 0) then
  begin
     tls.Delete(Thread);

    // original code below commented out
    if (FWriterID <> GetCurrentThreadID) then
    begin
      Test := InterlockedIncrement(FSentinel);
      // It is possible for Test to be mrWriteRequest
      // or, it can be = 0, if the write loops:
      // Test := InterlockedExchangeAdd(FSentinel, mrWriteRequest) + mrWriteRequest;
      // Did not get executed before this has called (the sleep debug makes it happen faster)
      if Test = mrWriteRequest then
        UnblockOneWriter
      else if Test <= 0 then // We may have some writers waiting
      begin
        if (Test mod mrWriteRequest) = 0 then
          UnblockOneWriter; // No more readers left (only writers) so signal one of them
      end;
    end;
  end;
end;



{TMultiReadExclusiveWriteSynchronizerByRichter}
Constructor TMultiReadExclusiveWriteSynchronizerByRichter.Create;
begin
Inherited Create;
m_nWaitingReaders:=0;
m_nWaitingWriters:=0;
m_nActive:=0;
m_hsemReaders:=CreateSemaphore(nil, 0, MaxInt, nil);
m_hsemWriters:=CreateSemaphore(nil, 0, MaxInt, nil);
m_cs:=TCriticalSection.Create;
end;

Destructor TMultiReadExclusiveWriteSynchronizerByRichter.Destroy;
begin
m_cs.Free;
if (m_hsemWriters <> 0) then CloseHandle(m_hsemWriters);
if (m_hsemReaders <> 0) then CloseHandle(m_hsemReaders);
Inherited;
end;

procedure TMultiReadExclusiveWriteSynchronizerByRichter.BeginRead;
var
  fResourceWritePending: boolean;
begin
// Ensure exclusive access to the member variables
m_cs.Enter;
try
// Are there writers waiting or is a writer writing?
fResourceWritePending:=((m_nActive < 0) {//. avoid readers waiting OR (m_nWaitingWriters > 0)});
if (fResourceWritePending)
  then Inc(m_nWaitingReaders) // This reader must wait, increment the count of waiting readers
  else Inc(m_nActive); // This reader can read, increment the count of active readers
finally
// Allow other threads to attempt reading/writing
m_cs.Leave;
end;
//.
if (fResourceWritePending)
 then WaitForSingleObject(m_hsemReaders, INFINITE); // This thread must wait
end;

procedure TMultiReadExclusiveWriteSynchronizerByRichter.EndRead;
begin
UnLock;
end;

function TMultiReadExclusiveWriteSynchronizerByRichter.BeginWrite: Boolean;
var
  fResourceOwned: boolean;
begin
// Ensure exclusive access to the member variables
m_cs.Enter;
try
// Are there any threads accessing the resource?
fResourceOwned:=(m_nActive <> 0);
if (fResourceOwned)
 then Inc(m_nWaitingWriters) // This writer must wait, increment the count of waiting writers
 else m_nActive:=-1; // This writer can write, decrement the count of active writers
finally
// Allow other threads to attempt reading/writing
m_cs.Leave;
end;
//.
if (fResourceOwned)
 then WaitForSingleObject(m_hsemWriters, INFINITE); // This thread must wait
//.
Result:=true;
end;

procedure TMultiReadExclusiveWriteSynchronizerByRichter.EndWrite;
begin
UnLock;
end;

procedure TMultiReadExclusiveWriteSynchronizerByRichter.UnLock;
var
  hsem: THandle;
  lCount: cardinal;
begin
// Ensure exclusive access to the member variables
m_cs.Enter;
try
if (m_nActive > 0)
 then Dec(m_nActive) // Readers have control so a reader must be done
 else Inc(m_nActive); // Writers have control so a writer must be done
//.
hsem:=0; // Assume no threads are waiting
lCount:=1; // Assume only 1 waiter wakes; always true for writers
//.
if (m_nActive = 0)
 then begin
  // No thread has access, who should wake up?
  // NOTE: It is possible that readers could never get access
  //       if there are always writers wanting to write
  if (m_nWaitingWriters > 0)
   then begin
    // Writers are waiting and they take priority over readers
    m_nActive:=-1; // A writer will get access
    Dec(m_nWaitingWriters); // One less writer will be waiting
    hsem:=m_hsemWriters; // Writers wait on this semaphore
    // NOTE: The semaphore will release only 1 writer thread
    end
   else
    if (m_nWaitingReaders > 0)
     then begin
      // Readers are waiting and no writers are waiting
      m_nActive:=m_nWaitingReaders; // All readers will get access
      m_nWaitingReaders:=0; // No readers will be waiting
      hsem:=m_hsemReaders; // Readers wait on this semaphore
      lCount:=m_nActive; // Semaphore releases all readers
      end
     else begin
      // There are no threads waiting at all; no semaphore gets released
      end;
  end;
finally
// Allow other threads to attempt reading/writing
m_cs.Leave;
end;
//.
if (hsem <> 0)
 then ReleaseSemaphore(hsem, lCount, nil); // Some threads are to be released
end;


initialization

finalization

end.


