unit unitServerChecker;

interface

uses
  Windows, ActiveX, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, TypesDefines, unitProxySpace, Functionality, TypesFunctionality,
  StdCtrls, ExtCtrls;


const
  CLASS_coProxySpace: TGUID = '{D69D252F-E995-11D2-BB6A-00A0C960E57A}';
  IID_IRA3TKQ: TGUID = '{4631CC71-4F63-47A2-A632-D1E2EAC030E5}';
type
  IRA3TKQ = interface(IDispatch)
    ['{4631CC71-4F63-47A2-A632-D1E2EAC030E5}']
    procedure GetQSLCard(var Card: WideString); safecall;
    procedure SetQSLCard(const Card: WideString); safecall;
    procedure SetQSLCardEx(const Card: WideString); safecall;
  end;


Type  
  TServerChecking = class(TThread)
  private
    Space: TProxySpace;
    Count: integer;
    FailureCount: integer;
    Message: string;

    Constructor Create(const pSpace: TProxySpace);
    procedure Execute; override;
    procedure LogMessage;
  end;

  TfmServerChecker = class(TForm)
    lbCheckCount: TLabel;
    lbFailureCount: TLabel;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    ServerChecking: TServerChecking;
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy; override;
  end;

  procedure Initialize;
  
var
  fmServerChecker: TfmServerChecker = nil;

implementation
Uses
  {$IFDEF EmbeddedServer}
  SpaceInterfacesImport,
  {$ENDIF}
  SOAPHTTPTrans;

{$R *.dfm}


{TServerChecking}
Constructor TServerChecking.Create(const pSpace: TProxySpace);
begin
Space:=pSpace;
Count:=0;
FailureCount:=0;
Inherited Create(false);
end;

procedure TServerChecking.Execute;

  procedure Check;
  var
    flOk: boolean;
    Obj: TByteArray;
    hInstance: THandle;
    IUnk: IUnknown;
    RA3TKQ: IRA3TKQ;
    Card: WideString;
  begin
  try
  //. test for space response
  {$IFNDEF EmbeddedServer}
  Space.GlobalSpaceManagerLock.Enter();
  try
  Space.GlobalSpaceManager.SpacePackID();
  finally
  Space.GlobalSpaceManagerLock.Leave();
  end;
  {$ELSE}
  SpaceManager_SpacePackID();
  {$ENDIF}
  //. test for sql response
  with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUSer,Space.UserID)) do
  try
  Check;
  finally
  Release;
  end;
  //.
  flOk:=true;
  except
    on E: Exception do begin
      if E is ESOAPHTTPException
       then begin
        Message:=FormatDateTime('DD.MM HH:NN',Now)+' CHECKER: connection error - '+E.Message;
        Synchronize(LogMessage);
        flOk:=true;
        end
       else begin
        Message:=FormatDateTime('DD.MM HH:NN',Now)+' CHECKER: test failed - '+E.Message;
        Synchronize(LogMessage);
        flOk:=false;
        end;
      end;
    end;
  InterlockedIncrement(Count);
  if NOT flOk
   then begin
    InterlockedIncrement(FailureCount);
    //.
    hInstance:=OpenMutex(MUTEX_ALL_ACCESS,FALSE,'SpaceHTTPSOAPServerStarted');
    if hInstance = 0
     then begin
      Message:=FormatDateTime('DD.MM HH:NN',Now)+' CHECKER: Server not running';
      Synchronize(LogMessage);
      Exit; //. server not started then exit //. ->
      end;
    CloseHandle(hInstance);
    //. send crash command
    try
    GetActiveObject(CLASS_coProxySpace,0, IUnk);
    if IUnk = nil then Raise Exception.Create('could not get coProxySpace'); //. =>
    IUnk.QueryInterface(IID_IRA3TKQ, RA3TKQ);
    if RA3TKQ = nil then Raise Exception.Create('could not get RA3TKQ interface'); //. =>
    Card:='QRT';
    try RA3TKQ.GetQSLCard(Card); except end;
    except
      on E: Exception do begin
        Message:=FormatDateTime('DD.MM HH:NN',Now)+' CHECKER: Stopping server - '+E.Message;
        Synchronize(LogMessage);
        end;
      end;
    end;
  end;

var
  I: integer;
begin
CoInitializeEx(nil, COINIT_MULTITHREADED);
try
I:=1;
repeat
  if (I MOD (60*10)) = 0 then Check;
  Sleep(100);
  Inc(I);
until Terminated;
finally
CoUninitialize;
end;
end;

procedure TServerChecking.LogMessage;
begin
Space.Log.Log_Write(Message);
end;


{TfmServerChecker}
Constructor TfmServerChecker.Create;
begin
Inherited Create(nil);
ServerChecking:=TServerChecking.Create(ProxySpace);
Application.Title:='SOAP Server Checker';
end;

Destructor TfmServerChecker.Destroy;
begin
ServerChecking.Free;
Inherited;
end;


procedure TfmServerChecker.TimerTimer(Sender: TObject);
begin
lbCheckCount.Caption:='Check count: '+IntToStr(InterlockedDecrement(ServerChecking.Count)+1); InterlockedIncrement(ServerChecking.Count);
lbFailureCount.Caption:='Failure count: '+IntToStr(InterlockedDecrement(ServerChecking.FailureCount)+1); InterlockedIncrement(ServerChecking.FailureCount);
end;


var
  hInstanceMutex: THandle = 0;

procedure Initialize;
var
  LastError: DWord;
begin
hInstanceMutex:=CreateMutex(nil,TRUE,PChar('Global\SpaceHTTPSOAPServerChecker'));
LastError:=GetLastError();
if ((LastError = ERROR_ALREADY_EXISTS) OR (LastError = ERROR_ACCESS_DENIED))
 then begin
  if (hInstanceMutex <> 0) then CloseHandle(hInstanceMutex);
  Raise Exception.Create('SpaceHTTPSOAPServerChecker is already started here'); //. =>
  end;
end;

Initialization

Finalization
if (hInstanceMutex <> 0)
 then begin
  ReleaseMutex(hInstanceMutex);
  CloseHandle(hInstanceMutex);
  end;
FreeAndNil(fmServerChecker);
end.
