unit unitSpaceFunctionalServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TServerProfile = record
    GUID: string;
    Name: string;
    flEnabled: boolean;
    ComponentServerURL: string;
    UserName: string;
    UserPassword: string;
    UserProxySpaceIndex: integer;
  end;
const
  WM_INITIALIZESERVER = WM_USER+1;
  WM_FINALIZESERVER = WM_USER+2;

type
  TfmSpaceFunctionalServerPanel = class(TForm)
  private
    { Private declarations }
    procedure wmInitializeServer(var Message: TMessage); message WM_INITIALIZESERVER;
    procedure wmFinalizeServer(var Message: TMessage); message WM_FINALIZESERVER;
  public
    { Public declarations }
    procedure InitializeServer();
    procedure FinalizeServer();
  end;

var
  flYes: boolean = false;
  ServerInstanceName: string = '';
  ServerProfileFileName: string = '';
  ServerProfile: TServerProfile;
  fmSpaceFunctionalServerPanel: TfmSpaceFunctionalServerPanel = nil;

  function Yes(): boolean;
  procedure Initialize();
  procedure Finalize();
  function IsPresent(): boolean;


implementation
Uses
  INIFiles,
  unitSpaceFunctionalComServer,
  unitEventLog,
  unitProxySpace;

{$R *.dfm}

var
  hInstanceMutex: THandle = 0;


function Yes(): boolean;
var
  ServerProfileFileName: string;
begin
ServerProfileFileName:=ExtractFileDir(Application.ExeName)+'\'+'SpaceFunctionalServer.ini';
Result:=FileExists(ServerProfileFileName);
end;


{TfmSpaceFunctionalServerPanel}
procedure TfmSpaceFunctionalServerPanel.wmInitializeServer(var Message: TMessage);
begin
InitializeServer();
end;

procedure TfmSpaceFunctionalServerPanel.wmFinalizeServer(var Message: TMessage); 
begin
FinalizeServer();
end;

procedure TfmSpaceFunctionalServerPanel.InitializeServer();
begin
ProxySpace_Initialize(ServerProfile.ComponentServerURL, ServerProfile.UserName,ServerProfile.UserPassword, ServerProfile.UserProxySpaceIndex);
end;

procedure TfmSpaceFunctionalServerPanel.FinalizeServer();
begin
ProxySpace_Finalize();
end;

procedure GetServerProfile();
begin
if (NOT flYes) then Raise Exception.Create('there is no functional server'); //. =>
with TINIFile.Create(ServerProfileFileName) do //. load functional server defines if it is exist
try
ServerProfile.GUID:=ReadString('PROFILE','ServerGUID','');
ServerProfile.Name:=ExtractFileName(ExtractFileDir(Application.ExeName));
ServerProfile.flEnabled:=(ReadInteger('PROFILE','Enabled',0) = 1);
ServerProfile.ComponentServerURL:=ReadString('PROFILE','ComponentServerURL','');
ServerProfile.UserName:=ReadString('PROFILE','UserName','');
ServerProfile.UserPassword:=ReadString('PROFILE','UserPassword','');
ServerProfile.UserProxySpaceIndex:=ReadInteger('PROFILE','UserProxySpaceIndex',-1);
finally
Destroy;
end;
end;

procedure Initialize();
var
  ServerInstanceName: string;
  LastError: DWord;
begin
ServerInstanceName:=ExtractFileName(ExtractFileDir(Application.ExeName));
if (ServerInstanceName = '0') then ServerInstanceName:='';
//.
Application.Title:='SpaceFunctionalServer'+ServerInstanceName;
//.
hInstanceMutex:=CreateMutex(nil,TRUE,PChar('Global\SpaceFunctionalServer'+ServerInstanceName));
LastError:=GetLastError();
if ((LastError = ERROR_ALREADY_EXISTS) OR (LastError = ERROR_ACCESS_DENIED))
 then begin
  if (hInstanceMutex <> 0) then CloseHandle(hInstanceMutex);
  Raise Exception.Create('SpaceFunctionalServer is already started here'); //. =>
  end;
//.
EventLog.WriteInfoEvent('initialization','Functional server:'+ServerInstanceName+' is initialized.');
end;

procedure Finalize();
begin
if (hInstanceMutex <> 0)
 then begin
  ReleaseMutex(hInstanceMutex);
  CloseHandle(hInstanceMutex);
  hInstanceMutex:=0;
  end;
//.
EventLog.WriteInfoEvent('finalization','Functional server:'+ServerInstanceName+' is finalized.');
end;

function IsPresent(): boolean;
begin
Result:=(hInstanceMutex <> 0);
end;


Initialization
ServerProfileFileName:=ExtractFileDir(Application.ExeName)+'\'+'SpaceFunctionalServer.ini';
flYes:=Yes();
if (flYes)
 then begin
  GetServerProfile();
  ServerInstanceName:='SpaceFunctionalServer'+ExtractFileName(ExtractFileDir(Application.ExeName));
  SetCurrentDir(ExtractFileDir(Application.ExeName));
  fmSpaceFunctionalServerPanel:=TfmSpaceFunctionalServerPanel.Create(nil);
  end;

Finalization
//.
FreeAndNil(fmSpaceFunctionalServerPanel);
end.
