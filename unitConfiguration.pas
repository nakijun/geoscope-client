unit unitConfiguration;
interface
uses
  Forms;

Type
  TProgramConfiguration = class
  private
    FileName: string;
    FProxySpace_flSynchronizeUserProfileWithServer: boolean;
    Panel: TForm;

    procedure Load();
    procedure setProxySpace_flSynchronizeUserProfileWithServer(Value: boolean);
  public
    Constructor Create();
    Destructor Destroy(); override;
    function GetPanel(): TForm;
    property ProxySpace_flSynchronizeUserProfileWithServer: boolean read FProxySpace_flSynchronizeUserProfileWithServer write setProxySpace_flSynchronizeUserProfileWithServer;
  end;

var
  ProgramConfiguration: TProgramConfiguration;

implementation
uses
  SysUtils,
  INIFiles,
  unitConfigurationPanel;

{TProgramConfiguration}
Constructor TProgramConfiguration.Create();
begin
Inherited Create;
FileName:=GetModuleName(HInstance)+'.'+'cfg';
Load();
Panel:=nil;
end;

Destructor TProgramConfiguration.Destroy();
begin
Panel.Free;
Inherited;
end;

procedure TProgramConfiguration.Load();
begin
FProxySpace_flSynchronizeUserProfileWithServer:=false;
//.
if (FileExists(FileName))
 then with TINIFile.Create(FileName) do
  try
  FProxySpace_flSynchronizeUserProfileWithServer:=(ReadInteger('ProxySpace','ProxySpace_flSynchronizeUserProfileWithServer',0) = 1);
  finally
  Destroy;
  end;
end;

function TProgramConfiguration.GetPanel(): TForm;
begin
if (Panel = nil) then Panel:=TfmProgramConfigurationPanel.Create(Self);
Result:=Panel;
end;

procedure TProgramConfiguration.setProxySpace_flSynchronizeUserProfileWithServer(Value: boolean);
var
  V: integer;
begin
FProxySpace_flSynchronizeUserProfileWithServer:=Value;
if (FProxySpace_flSynchronizeUserProfileWithServer) then V:=1 else V:=0;
with TINIFile.Create(FileName) do
try
WriteInteger('ProxySpace','ProxySpace_flSynchronizeUserProfileWithServer',V);
finally
Destroy;
end;
end;


Initialization
ProgramConfiguration:=TProgramConfiguration.Create();

Finalization
ProgramConfiguration.Free();


end.
