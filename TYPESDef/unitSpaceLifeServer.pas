unit unitSpaceLifeServer;
Interface
uses
  Classes,
  SyncObjs,
  Functionality,
  GlobalSpaceDefines,
  TypesFunctionality,
  TypesDefines;


Type
  TItemTypeLifeProcessCache = record
    ptrNext: pointer;
    idObj: integer;
  end;

  TItemUpdateProc = procedure(const ptrItem: pointer) of object;

  TTypeLifeProcessCache = class
  private
    Lock: TCriticalSection;
    FItems: pointer;
  public
    Constructor Create;
    Destructor Destroy; override;
    procedure Empty;
    procedure UpdateFromInstanceList(InstanceList: TList);
    function InsertItem(const pidObj: integer; ItemUpdateProc: TItemUpdateProc): pointer;
    procedure RemoveItem(const pidObj: integer);
    function GetItem(const pidObj: integer): pointer;
  end;

  TTypeLifeProcess = class(TThread)
  private
    TypeSystem: TTypeSystem;
    Cache: TTypeLifeProcessCache;
    Updater: TTypeSystemPresentUpdater;
    procedure Execute; override;
    function getIdType: integer; virtual;
    procedure CacheUpdate; virtual; abstract;
    procedure CacheItemUpdate(const ptrItem: pointer); virtual;
  public
    Constructor Create(pTypeSystem: TTypeSystem);
    Destructor Destroy; override;
    procedure Initialize;
    procedure Process; virtual; abstract;
    procedure DoOnComponentOperation(const idComponent: integer; const Operation: TComponentOperation);
    property IDType: integer read getIdType;
  end;


  TCoComponentLifeProcess = class(TTypeLifeProcess)
  private
    FidType: integer;
    function getIdType: integer; override;
  public
  end;

Const
  idTCoClock = 1111123;
Type
  TCoClockLifeProcess = class(TCoComponentLifeProcess)
  public
    Constructor Create;
    procedure CacheUpdate; override;
    procedure Process; override;
  end;


var
  flInitialized: boolean;

  procedure Initialize;
  procedure Finalize;

Implementation
Uses
  SysUtils,
  unitSpaceLifeServerForm;


var
  fmSpaceLifeServer: TfmSpaceLifeServer;



{TTypeLifeProcess}
Constructor TTypeLifeProcessCache.Create;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
FItems:=nil;
end;

Destructor TTypeLifeProcessCache.Destroy;
begin
Empty;
Lock.Free;
Inherited;
end;

procedure TTypeLifeProcessCache.Empty;
var
  ptrDestroyItem: pointer;
begin
while FItems <> nil do begin
  ptrDestroyItem:=FItems;
  FItems:=TItemTypeLifeProcessCache(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TItemTypeLifeProcessCache));
  end;
end;

procedure TTypeLifeProcessCache.UpdateFromInstanceList(InstanceList: TList);
var
  I: integer;
  ptrNewItem: pointer;
begin
Lock.Enter;
Empty;
try
for I:=0 to InstanceList.Count-1 do begin
  GetMem(ptrNewItem,SizeOf(TItemTypeLifeProcessCache));
  with TItemTypeLifeProcessCache(ptrNewItem^) do begin
  ptrNext:=FItems;
  idObj:=Integer(InstanceList[I]);
  end;
  FItems:=ptrNewItem;
  end;
finally
Lock.Leave;
end;
end;

function TTypeLifeProcessCache.InsertItem(const pidObj: integer; ItemUpdateProc: TItemUpdateProc): pointer;
begin
GetMem(Result,SizeOf(TItemTypeLifeProcessCache));
with TItemTypeLifeProcessCache(Result^) do begin
ptrNext:=FItems;
idObj:=pidObj;
end;
if Assigned(ItemUpdateProc) then ItemUpdateProc(Result);
FItems:=Result;
end;

procedure TTypeLifeProcessCache.RemoveItem(const pidObj: integer);
var
  ptrptrDestroyItem: pointer;
  ptrDestroyItem: pointer;
begin
ptrptrDestroyItem:=@FItems;
while Pointer(ptrptrDestroyItem^) <> nil do with TItemTypeLifeProcessCache(Pointer(ptrptrDestroyItem^)^) do begin
  if idObj = pidObj
   then begin
    ptrDestroyItem:=Pointer(ptrptrDestroyItem^);
    Pointer(ptrptrDestroyItem^):=TItemTypeLifeProcessCache(ptrDestroyItem^).ptrNext;
    FreeMem(ptrDestroyItem,SizeOf(TItemTypeLifeProcessCache));
    Exit; //. ->
    end
   else
    ptrptrDestroyItem:=@TItemTypeLifeProcessCache(Pointer(ptrptrDestroyItem^)^).ptrNext;
  end;
end;

function TTypeLifeProcessCache.GetItem(const pidObj: integer): pointer;
var
  ptrptrItem: pointer;
begin
Result:=nil;
ptrptrItem:=@FItems;
while Pointer(ptrptrItem^) <> nil do with TItemTypeLifeProcessCache(Pointer(ptrptrItem^)^) do begin
  if idObj = pidObj
   then begin
    Result:=Pointer(ptrptrItem^);
    Pointer(ptrptrItem^):=ptrNext;
    TItemTypeLifeProcessCache(Result^).ptrNext:=FItems;
    FItems:=Result;
    Exit; //. ->
    end;
  ptrptrItem:=@ptrNext;
  end;
{Result:=FItems;
while Result <> nil do with TItemTypeLifeProcessCache(Result^) do begin
  if idObj = pidObj then Exit; //. ->
  Result:=ptrNext;
  end;}
end;


{TTypeLifeProcess}
Constructor TTypeLifeProcess.Create(pTypeSystem: TTypeSystem);
begin
TypeSystem:=pTypeSystem;
Cache:=TTypeLifeProcessCache.Create;
Updater:=nil;
Inherited Create(true);
Initialize;
end;

Destructor TTypeLifeProcess.Destroy;
begin
Terminate;
Inherited;
Updater.Free;
Cache.Free;
end;

procedure TTypeLifeProcess.Initialize;
begin
CacheUpdate;
Updater:=TTypeSystemPresentUpdater.Create(TypeSystem, DoOnComponentOperation);
Resume;
end;

function TTypeLifeProcess.getIdType: integer;
begin
Result:=TypeSystem.idType;
end;

procedure TTypeLifeProcess.CacheItemUpdate(const ptrItem: pointer);
begin
end;

procedure TTypeLifeProcess.DoOnComponentOperation(const idComponent: integer; const Operation: TComponentOperation);
var
  ptrUpdateItem: pointer;
begin
case Operation of
opCreate: Cache.InsertItem(idComponent,CacheItemUpdate);
opUpdate: begin
  ptrUpdateItem:=Cache.GetItem(idComponent);
  if ptrUpdateItem <> nil then CacheItemUpdate(ptrUpdateItem);
  end;
opDestroy: Cache.RemoveItem(idComponent);
end;
end;

procedure TTypeLifeProcess.Execute;
begin
Process;
end;


{TCoComponentLifeProcess}
function TCoComponentLifeProcess.getIdType: integer;
begin
Result:=FidType;
end;






{TCoClockLifeProcess}
Constructor TCoClockLifeProcess.Create;
begin
Inherited Create(SystemTCoComponent);
FidType:=idTCoClock;
end;

procedure TCoClockLifeProcess.CacheUpdate;
var
  InstancesList: TList;
  ptrNewItem: pointer;
begin
with TTCoComponentFunctionality(TypeSystem.TypeFunctionalityClass.Create) do
try
GetInstanceListByCoType(idTCoClock, InstancesList);
try
Cache.UpdateFromInstanceList(InstancesList);
finally
InstancesList.Destroy;
end;
finally
Release;
end;
end;

procedure TCoClockLifeProcess.Process;
var
  ptrCacheItem: pointer;
  idTypeTTFVisualization,idTTFVisualization: integer;
begin
fmSpaceLifeServer.lbCoClock.Caption:='CoClock life in progress';
try
repeat
  ptrCacheItem:=Cache.FItems;
  while ptrCacheItem <> nil do with TItemTypeLifeProcessCache(ptrCacheItem^) do begin
    with TComponentFunctionality_Create(idTCoComponent,idObj) do
    try
    if QueryComponent(idTTTFVisualization, idTypeTTFVisualization,idTTFVisualization)
     then with TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTypeTTFVisualization,idTTFVisualization)) do
      try
      Str:=FormatDateTime('HH:NN:SS',Now);
      finally
      Release;
      end;
    finally
    Release;
    end;
    //. next object
    ptrCacheItem:=ptrNext;
    end;
  Sleep(1000);
until Terminated;
except
  on E: Exception do begin
    fmSpaceLifeServer.lbCoClock.Caption:='CoClock life abnormal terminated('+E.Message+')';
    Raise; //. =>
    end;
  end;
end;




var
  CoClockLifeProcess: TCoClockLifeProcess;

procedure Initialize;
begin
if flInitialized then Finalize;
fmSpaceLifeServer:=TfmSpaceLifeServer.Create(nil);
CoClockLifeProcess:=TCoClockLifeProcess.Create;
fmSpaceLifeServer.Show;
flInitialized:=true;
end;

procedure Finalize;
begin
if NOT flInitialized then Exit; //. ->
CoClockLifeProcess.Free;
CoClockLifeProcess:=nil;
fmSpaceLifeServer.Free;
fmSpaceLifeServer:=nil;
flInitialized:=false;
end;


Initialization
fmSpaceLifeServer:=nil;
CoClockLifeProcess:=nil;
flInitialized:=false;

Finalization
if flInitialized then Finalize;
end.

