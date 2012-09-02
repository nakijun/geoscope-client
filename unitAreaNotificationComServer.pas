unit unitAreaNotificationComServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SOAPClient_TLB, StdVcl;

type
  TcoAreaNotificationServer = class(TAutoObject, IcoAreaNotificationServer)
  protected
    //. SpaceFunctionalServer
    procedure InitializeServer; safecall;
      procedure IcoAreaNotificationServer.Initialize = InitializeServer;
    procedure FinalizeServer; safecall;
      procedure IcoAreaNotificationServer.Finalize = FinalizeServer;
    procedure UI_ShowEventsProcessorPanel; safecall;
    function Check(Code: Integer): Integer; safecall;
  public
    procedure Initialize; override;
  end;

implementation
uses
  Windows,
  SysUtils,
  ComServ,
  GlobalSpaceDefines,
  unitProxySpace,
  unitAreaNotificationServer;


{TcoSpaceFunctionalServer}
procedure TcoAreaNotificationServer.Initialize;
begin
end;

procedure TcoAreaNotificationServer.InitializeServer; safecall;
begin
if (fmAreaNotificationServerPanel <> nil) then SendMessage(fmAreaNotificationServerPanel.Handle, WM_INITIALIZESERVER, 0,0);
end;

procedure TcoAreaNotificationServer.FinalizeServer; safecall;
begin
if (fmAreaNotificationServerPanel <> nil) then SendMessage(fmAreaNotificationServerPanel.Handle, WM_FINALIZESERVER, 0,0);
end;

procedure TcoAreaNotificationServer.UI_ShowEventsProcessorPanel; safecall;
const
  CODE_AREANOTIFICATIONSERVER_SHOWEVENTSPROCESSORPANEL = 1001; //. do not modify: defined in plugin
var
  Space: TProxySpace;
  OutData: TByteArray;
begin
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
Space.Plugins_Execute(CODE_AREANOTIFICATIONSERVER_SHOWEVENTSPROCESSORPANEL,nil,{out} OutData);
end;

function TcoAreaNotificationServer.Check(Code: Integer): Integer; 
begin
Result:=0;
case Code of
0: Exit; //. ->
end;
end;


procedure Initialize();
var
  R: HResult;
begin
CoInitializeEx(nil, COINIT_MULTITHREADED);
R:=CoInitializeSecurity(
            nil,
            -1,
            nil,
            nil,
            1,
            2,
            nil,
            0,
            nil
          );
//.
TAutoObjectFactory.Create(ComServer, TcoAreaNotificationServer, Class_coSpaceAreaNotificationServer, ciMultiInstance, tmFree);
end;

procedure Finalize();
var
  I: integer;
begin
CoUnInitialize();
end;


Initialization
ComServer.UIInteractive:=false;
Initialize();

Finalization
Finalize();


end.
