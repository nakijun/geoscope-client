unit unitProgramStartPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons,
  OleCtrls, SHDocVw, Menus,
  unitBusinessModel,
  unitCoGeoMonitorObjectFunctionality;


const
  ConfigurationFile = 'SOAPClient.exe.cfg';
type
  TPanelConfiguration = class
  public
    FileName: string;
    //.
    AutoStartEnabled: boolean;
    TabIndex: integer;

    Constructor Create();
    Destructor Destroy(); override;
    procedure Load();
    procedure Save();
  end;

  TfmProgramStartPanel = class(TForm)
    PageControl: TPageControl;
    tsCreateObject: TTabSheet;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    cbNewObjectMap: TComboBox;
    Memo1: TMemo;
    Memo2: TMemo;
    btnCreateAndroidPersonGeologM2: TBitBtn;
    btnCreateAndroidPersonGeologM1: TBitBtn;
    Memo3: TMemo;
    btnCreatePersonPulsarM1: TBitBtn;
    Memo4: TMemo;
    btnEnforaPersonObjectTracker1: TBitBtn;
    Memo5: TMemo;
    btnNavixyPersonObjectMainTracker: TBitBtn;
    Memo6: TMemo;
    btnGSTraqPersonObjectMainTracker: TBitBtn;
    Panel1: TPanel;
    cbNotShowAtStart: TCheckBox;
    tsDescription: TTabSheet;
    wbDescription: TWebBrowser;
    Memo7: TMemo;
    btnCreateAutomobilePulsarM1Click: TBitBtn;
    Memo8: TMemo;
    btnCreateAndroidAutomobileGeologM2: TBitBtn;
    Memo9: TMemo;
    btnCreateAndroidAutomobileGeologM1: TBitBtn;
    Memo10: TMemo;
    btnEnforaAutomobileObjectTracker1: TBitBtn;
    Memo11: TMemo;
    btnNavixyAutomobileObjectMainTracker: TBitBtn;
    StaticText2: TStaticText;
    cbNewObjectSecurity: TComboBox;
    Memo12: TMemo;
    btnEnforaMT3000AutomobileTracker: TBitBtn;
    Memo13: TMemo;
    btnEnforaMiniMTAutomobileTracker: TBitBtn;
    procedure btnCreateAndroidPersonGeologM2Click(Sender: TObject);
    procedure btnCreateAndroidPersonGeologM1Click(Sender: TObject);
    procedure btnCreatePersonPulsarM1Click(Sender: TObject);
    procedure btnEnforaPersonObjectTracker1Click(Sender: TObject);
    procedure btnNavixyPersonObjectMainTrackerClick(Sender: TObject);
    procedure btnGSTraqPersonObjectMainTrackerClick(Sender: TObject);
    procedure cbNotShowAtStartClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure btnCreateAutomobilePulsarM1ClickClick(Sender: TObject);
    procedure btnCreateAndroidAutomobileGeologM2Click(Sender: TObject);
    procedure btnCreateAndroidAutomobileGeologM1Click(Sender: TObject);
    procedure btnEnforaAutomobileObjectTracker1Click(Sender: TObject);
    procedure btnNavixyAutomobileObjectMainTrackerClick(Sender: TObject);
    procedure btnEnforaMT3000AutomobileTrackerClick(Sender: TObject);
    procedure btnEnforaMiniMTAutomobileTrackerClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateObjectByModel(const BusinessModelClass: TBusinessModelClass; const pKind: TGeoMonitorObjectKind);
  public
    { Public declarations }
    class function IsAutoStartEnabled(): boolean;
    class function SetAutoStart(const Value: boolean): boolean;
    Constructor Create();
    procedure Update(); reintroduce;
  end;

  function GetProgramStartPanel(): TForm;
  procedure FreeProgramStartPanel();


var
  fmProgramStartPanel: TfmProgramStartPanel = nil;

implementation
Uses
  INIFiles,
  FunctionalityImport,
  TypesDefines,
  unitGMOTrackLogger1BusinessModel,
  unitGMOGeoLogAndroidBusinessModel,
  unitGMO1TrackLogger1BusinessModel,
  unitGMO1GeoLogAndroidBusinessModel,
  unitEnforaObjectTracker1BusinessModel,
  unitEnforaMT3000TrackerBusinessModel,
  unitEnforaMiniMTTrackerBusinessModel,
  unitNavixyObjectMainTrackerBusinessModel,
  unitGSTraqObjectMainTrackerBusinessModel,
  unitCoGeoMonitorObjectTreePanel,
  unitTextInputDialog,
  unitCoGeoMonitorObjectPanelProps;

{$R *.dfm}

function CreateCoGeoMonitorObject(const BusinessModelClass: TBusinessModelClass; const pName: string; const pKind: TGeoMonitorObjectKind; const pGeoSpaceID: integer; const SecurityIndex: integer): integer;
var
  idSecurityFile: integer;
  VisualizationType: integer;
  VisualizationID: integer;
  TreePanel: TfmCoGeoMonitorObjectTreePanel;
begin
ProxySpace__Log_OperationStarting('creating object ...');
try
Result:=ConstructCoGeoMonitorObject(BusinessModelClass,pName,pGeoSpaceID);
//. set security if not default
idSecurityFile:=0;
case (SecurityIndex) of
1: with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,ProxySpace_UserID())) do
  try
  idSecurityFile:=idSecurityFileForPrivate;
  finally
  Release();
  end;
end;
if (idSecurityFile <> 0)
 then with TComponentFunctionality_Create(idTCoComponent,Result) do
  try
  ChangeSecurity(idSecurityFile);
  finally
  Release();
  end;
//. add a new object dynamic hint
with TCoGeoMonitorObjectFunctionality.Create(Result) do
try
GetVisualizationComponent({out} VisualizationType,VisualizationID);
ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem(VisualizationType,VisualizationID,pName);
finally
Release();
end;
//. add new object into domain tree
TreePanel:=unitCoGeoMonitorObjectTreePanel.GetTreePanel();
TreePanel.AddNewObject(Result,Integer(pKind),pName,'',ProxySpace_UserName());
finally
ProxySpace__Log_OperationDone();
end;
//. add new object into current reflector elected objects
ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem(idTCoComponent,Result,pName);
//. show props panel of new object
with TCoGeoMonitorObjectFunctionality.Create(Result) do
try
with TPropsPanel_Create() do begin
Position:=poScreenCenter;
Show();
end;
finally
Release();
end;
end;


{TPanelConfiguration}
Constructor TPanelConfiguration.Create();
begin
Inherited Create();
//.
FileName:=ExtractFilePath(ParamStr(0))+ConfigurationFile;
//.
AutoStartEnabled:=true;
//.
Load();
end;

Destructor TPanelConfiguration.Destroy();
begin
Inherited;
end;

procedure TPanelConfiguration.Load();
begin
if (NOT FileExists(FileName)) then Exit; //. ->
with TINIFile.Create(FileName) do
try
AutoStartEnabled:=(ReadInteger('STARTPANEL','AutoStart',1) <> 0);
TabIndex:=ReadInteger('STARTPANEL','TabIndex',0);
finally
Destroy;
end;
end;

procedure TPanelConfiguration.Save();
var
  V: integer;
begin
with TINIFile.Create(FileName) do
try
if (AutoStartEnabled) then V:=1 else V:=0;
WriteInteger('STARTPANEL','AutoStart',V);
WriteInteger('STARTPANEL','TabIndex',TabIndex);
finally
Destroy;
end;
end;


{TfmProgramStartPanel}
class function TfmProgramStartPanel.IsAutoStartEnabled(): boolean;
begin
with TPanelConfiguration.Create() do
try
Result:=AutoStartEnabled;
finally
Destroy();
end;
end;

class function TfmProgramStartPanel.SetAutoStart(const Value: boolean): boolean;
begin
with TPanelConfiguration.Create() do
try
AutoStartEnabled:=Value;
Save();
finally
Destroy();
end;
end;

Constructor TfmProgramStartPanel.Create();
begin
Inherited Create(nil);
Update();
end;

procedure TfmProgramStartPanel.Update();
begin
with TPanelConfiguration.Create() do
try
with cbNewObjectMap do begin
Items.BeginUpdate();
try
Items.Clear();
Items.AddObject('Yandex.Maps',TObject(2){GeoSpaceID});
Items.AddObject('Native',TObject(88){GeoSpaceID});
Items.AddObject('OpenStreet.Maps',TObject(89){GeoSpaceID});
Items.AddObject('Google.Maps',TObject(90){GeoSpaceID});
Items.AddObject('Navitel.Maps',TObject(91){GeoSpaceID});
ItemIndex:=0;
finally
Items.EndUpdate();
end;
end;
with cbNewObjectSecurity do begin
Items.BeginUpdate();
try
Items.Clear();
Items.Add('By Default');
Items.Add('Private');
ItemIndex:=1;
finally
Items.EndUpdate();
end;
end;
//.
cbNotShowAtStart.OnClick:=nil;
cbNotShowAtStart.Checked:=(NOT AutoStartEnabled);
cbNotShowAtStart.OnClick:=cbNotShowAtStartClick;
//.
wbDescription.Navigate(ExtractFilePath(ParamStr(0))+'Lib\HTML\RU\Description\Description.htm');
//.
PageControl.TabIndex:=TabIndex;
finally
Destroy();
end;
end;

procedure TfmProgramStartPanel.CreateObjectByModel(const BusinessModelClass: TBusinessModelClass; const pKind: TGeoMonitorObjectKind);
var
  NewObjectName: string;
  Result: integer;
begin
with TfmTextInputDialog.Create('Enter new object name') do
try
if (NOT Dialog({out} NewObjectName)) then Exit; //. ->
finally
Destroy();
end;
if (NewObjectName = '') then Exit; //. ->
//.
Refresh();
//.
Result:=CreateCoGeoMonitorObject(BusinessModelClass,NewObjectName,pKind,Integer(cbNewObjectMap.Items.Objects[cbNewObjectMap.ItemIndex]),cbNewObjectSecurity.ItemIndex);
//. device initialization
if (MessageDlg('Do you want to initialize device of new object ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
 then TCoGeoMonitorObjectPanelProps.InitializeDevice(Result);
end;

procedure TfmProgramStartPanel.btnCreatePersonPulsarM1Click(Sender: TObject);
begin
CreateObjectByModel(TGMOTrackLogger1BusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnCreateAutomobilePulsarM1ClickClick(Sender: TObject);
begin
CreateObjectByModel(TGMOTrackLogger1BusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnCreateAndroidPersonGeologM2Click(Sender: TObject);
begin
CreateObjectByModel(TGMO1GeoLogAndroidBusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnCreateAndroidAutomobileGeologM2Click(Sender: TObject);
begin
CreateObjectByModel(TGMO1GeoLogAndroidBusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnCreateAndroidPersonGeologM1Click(Sender: TObject);
begin
CreateObjectByModel(TGMOGeoLogAndroidBusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnCreateAndroidAutomobileGeologM1Click(Sender: TObject);
begin
CreateObjectByModel(TGMOGeoLogAndroidBusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnEnforaPersonObjectTracker1Click(Sender: TObject);
begin
CreateObjectByModel(TEnforaObjectTracker1BusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnEnforaAutomobileObjectTracker1Click(Sender: TObject);
begin
CreateObjectByModel(TEnforaObjectTracker1BusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnEnforaMT3000AutomobileTrackerClick(Sender: TObject);
begin
CreateObjectByModel(TEnforaMT3000TrackerBusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnEnforaMiniMTAutomobileTrackerClick(Sender: TObject);
begin
CreateObjectByModel(TEnforaMiniMTTrackerBusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnNavixyPersonObjectMainTrackerClick(Sender: TObject);
begin
CreateObjectByModel(TNavixyObjectMainTrackerBusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.btnNavixyAutomobileObjectMainTrackerClick(Sender: TObject);
begin
CreateObjectByModel(TNavixyObjectMainTrackerBusinessModel,gmokAutomobile);
end;

procedure TfmProgramStartPanel.btnGSTraqPersonObjectMainTrackerClick(Sender: TObject);
begin
CreateObjectByModel(TGSTraqObjectMainTrackerBusinessModel,gmokPerson);
end;

procedure TfmProgramStartPanel.cbNotShowAtStartClick(Sender: TObject);
begin
SetAutoStart(NOT cbNotShowAtStart.Checked);
end;

procedure TfmProgramStartPanel.FormHide(Sender: TObject);
begin
with TPanelConfiguration.Create() do
try
TabIndex:=PageControl.TabIndex;
Save();
finally
Destroy();
end;
end;


function GetProgramStartPanel(): TForm;
begin
if (fmProgramStartPanel = nil) then fmProgramStartPanel:=TfmProgramStartPanel.Create();
Result:=fmProgramStartPanel;
end;

procedure FreeProgramStartPanel();
begin
FreeAndNil(fmProgramStartPanel);
end;


Initialization

Finalization
FreeProgramStartPanel();

end.
