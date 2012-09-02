unit unitProxySpaceCfg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, GlobalSpaceDefines, unitProxySpace, Functionality, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  Menus,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmProxySpaceCfg = class(TForm)
    GroupBox1: TGroupBox;
    rgStatus: TRadioGroup;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    sbAcceptServerSideConfiguration: TSpeedButton;
    cbComponentsPanelsHistroryOn: TCheckBox;
    cbShowUserComponentsAtStart: TCheckBox;
    cbUserMessagesChecking: TCheckBox;
    Label1: TLabel;
    Bevel3: TBevel;
    edVisualizationMaxSize: TEdit;
    cbUseComponentsManager: TCheckBox;
    lbRemoteStatusLoadingComponentMaxSize: TLabel;
    edRemoteStatusLoadingComponentMaxSize: TEdit;
    Label2: TLabel;
    edReflectingObjPortion: TEdit;
    Label3: TLabel;
    edUpdateInterval: TEdit;
    sbAcceptLocalSideConfiguration: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    lvEnabledTypes: TListView;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    LocalConfig_edContextSize: TEdit;
    LocalConfig_cbUpdateUsingContext: TCheckBox;
    LocalConfig_cbActionsGroupCall: TCheckBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    LocalConfig_edNotificationServerHost: TEdit;
    Label8: TLabel;
    LocalConfig_edNotificationServerPort: TEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    LocalConfig_edNotificationServerProxyHost: TEdit;
    Label10: TLabel;
    LocalConfig_edNotificationServerProxyPort: TEdit;
    Label11: TLabel;
    LocalConfig_edNotificationServerProxyUserName: TEdit;
    Label12: TLabel;
    LocalConfig_edNotificationServerProxyUserPassword: TEdit;
    LocalConfig_cbNotificationServerAlwaysUseProxy: TCheckBox;
    procedure sbAcceptServerSideConfigurationClick(Sender: TObject);
    procedure rgStatusClick(Sender: TObject);
    procedure cbComponentsPanelsHistroryOnClick(Sender: TObject);
    procedure cbShowUserComponentsAtStartClick(Sender: TObject);
    procedure cbUserMessagesCheckingClick(Sender: TObject);
    procedure edVisualizationMaxSizeChange(Sender: TObject);
    procedure edVisualizationMaxSizeKeyPress(Sender: TObject;
      var Key: Char);
    procedure cbUseComponentsManagerClick(Sender: TObject);
    procedure edRemoteStatusLoadingComponentMaxSizeChange(Sender: TObject);
    procedure edRemoteStatusLoadingComponentMaxSizeKeyPress(
      Sender: TObject; var Key: Char);
    procedure edUpdateIntervalChange(Sender: TObject);
    procedure edUpdateIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure edReflectingObjPortionChange(Sender: TObject);
    procedure edReflectingObjPortionKeyPress(Sender: TObject;
      var Key: Char);
    procedure LocalConfig_edContextSizeChange(Sender: TObject);
    procedure LocalConfig_edNotificationServerHostChange(Sender: TObject);
    procedure LocalConfig_edNotificationServerPortChange(Sender: TObject);
    procedure LocalConfig_edNotificationServerProxyHostChange(
      Sender: TObject);
    procedure LocalConfig_edNotificationServerProxyPortChange(
      Sender: TObject);
    procedure LocalConfig_edNotificationServerProxyUserNameChange(
      Sender: TObject);
    procedure LocalConfig_edNotificationServerProxyUserPasswordChange(
      Sender: TObject);
    procedure LocalConfig_cbUpdateUsingContextClick(Sender: TObject);
    procedure LocalConfig_cbActionsGroupCallClick(Sender: TObject);
    procedure LocalConfig_cbNotificationServerAlwaysUseProxyClick(
      Sender: TObject);
    procedure LocalConfig_edContextSizeKeyPress(Sender: TObject;
      var Key: Char);
    procedure LocalConfig_edNotificationServerHostKeyPress(Sender: TObject;
      var Key: Char);
    procedure LocalConfig_edNotificationServerPortKeyPress(Sender: TObject;
      var Key: Char);
    procedure LocalConfig_edNotificationServerProxyHostKeyPress(
      Sender: TObject; var Key: Char);
    procedure LocalConfig_edNotificationServerProxyPortKeyPress(
      Sender: TObject; var Key: Char);
    procedure LocalConfig_edNotificationServerProxyUserNameKeyPress(
      Sender: TObject; var Key: Char);
    procedure LocalConfig_edNotificationServerProxyUserPasswordKeyPress(
      Sender: TObject; var Key: Char);
    procedure sbAcceptLocalSideConfigurationClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
  public
    { Public declarations }
    flServerConfigChanged: boolean;
    flLocalConfigChanged: boolean;

    Constructor Create(pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Update;
    procedure Edit;
    procedure Save;
    //.
    procedure ServerConfig_Update;
    procedure ServerConfig_Save;
    procedure ServerConfig__lvEnabledTypes_Clear;
    procedure ServerConfig__lvEnabledTypes_Update;
    procedure ServerConfig__lvEnabledTypes_Save;
    //.
    procedure LocalConfig_Update;
    procedure LocalConfig_Save;
  end;

implementation
Uses
  INIFiles,
  unitReflector;

{$R *.DFM}

Constructor TfmProxySpaceCfg.Create(pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
///? lvEnabledTypes.SmallImages:=TypesImageList;
Update;
end;

Destructor TfmProxySpaceCfg.Destroy;
begin
ServerConfig__lvEnabledTypes_Clear;
Inherited;
end;

procedure TfmProxySpaceCfg.ServerConfig__lvEnabledTypes_Clear;
begin
lvEnabledTypes.Items.Clear;
end;

procedure TfmProxySpaceCfg.ServerConfig__lvEnabledTypes_Update;
var
  I: integer;
  TypeFunctionality: TTypeFunctionality;
begin
with lvEnabledTypes do begin
for I:=0 to TypesSystem.Count-1 do with Items.Add do begin
  TypeFunctionality:=TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create;
  with TypeFunctionality do begin
  Data:=Pointer(idType);
  Caption:=Name;
  ImageIndex:=-1; ///? ImageList_Index;
  Checked:=TTypeSystem(TypesSystem[I]).Enabled;
  Release;
  end;
  end;
end;
end;

procedure TfmProxySpaceCfg.ServerConfig__lvEnabledTypes_Save;
var
  I,J: integer;
  TypeSystem: TTypeSystem;
  flChanged: boolean;
begin
flChanged:=false;
with lvEnabledTypes do begin
for I:=0 to Items.Count-1 do
  for J:=0 to TypesSystem.Count-1 do
    if (TTypeSystem(TypesSystem[J]).idType = Integer(Items[I].Data)) AND (TTypeSystem(TypesSystem[J]).Enabled <> Items[I].Checked)
     then begin
      TTypeSystem(TypesSystem[J]).Enabled:=Items[I].Checked;
      flChanged:=true;
      Break;
      end;
end;
if (flChanged) then TypesSystem.Configuration.DisabledTypes.Save;
end;

procedure TfmProxySpaceCfg.ServerConfig_Update;
begin
with rgStatus do
case Space.Status of
pssNormal: ItemIndex:=0;
pssNormalDisconnected: ItemIndex:=1;
pssRemoted: ItemIndex:=2;
pssRemotedBrief: ItemIndex:=3;
end;
cbComponentsPanelsHistroryOn.Checked:=Space.Configuration.flComponentsPanelsHistoryOn;
cbShowUserComponentsAtStart.Checked:=Space.Configuration.flShowUserComponentAfterStart;
cbUserMessagesChecking.Checked:=Space.Configuration.flUserMessagesChecking;
//.
if Space.Configuration.VisualizationMaxSize <> -1
 then edVisualizationMaxSize.Text:=IntToStr(Round(Space.Configuration.VisualizationMaxSize/1000))
 else edVisualizationMaxSize.Text:='';
edVisualizationMaxSize.Font.Color:=clBlack;
cbUseComponentsManager.Checked:=Space.Configuration.flUseComponentsManager;
if Space.Configuration.RemoteStatusLoadingComponentMaxSize <> -1
 then edRemoteStatusLoadingComponentMaxSize.Text:=IntToStr(Round(Space.Configuration.RemoteStatusLoadingComponentMaxSize/1000))
 else edRemoteStatusLoadingComponentMaxSize.Text:='';
edRemoteStatusLoadingComponentMaxSize.Font.Color:=clBlack;
edReflectingObjPortion.Text:=IntToStr(Space.Configuration.ReflectingObjPortion);
edReflectingObjPortion.Font.Color:=clBlack;
edUpdateInterval.Text:=IntToStr(Round(Space.Configuration.UpdateInterval));
edUpdateInterval.Font.Color:=clBlack;
//.
ServerConfig__lvEnabledTypes_Update;
flServerConfigChanged:=false;
end;

procedure TfmProxySpaceCfg.ServerConfig_Save;
begin
ServerConfig__lvEnabledTypes_Save;
if (NOT flServerConfigChanged) then Exit; //. ->
with rgStatus do
case ItemIndex of
0: Space.Status:=pssNormal;
1: Space.Status:=pssNormalDisconnected;
2: Space.Status:=pssRemoted; 
3: Space.Status:=pssRemotedBrief;
end;
with Space.Configuration do begin
flComponentsPanelsHistoryOn:=cbComponentsPanelsHistroryOn.Checked;
Space.Configuration.flShowUserComponentAfterStart:=cbShowUserComponentsAtStart.Checked;
Space.Configuration.flUserMessagesChecking:=cbUserMessagesChecking.Checked;
if NOT ((edVisualizationMaxSize.Text = '') OR (edVisualizationMaxSize.Text = '-1'))
 then Space.Configuration.VisualizationMaxSize:=StrToInt(edVisualizationMaxSize.Text)*1000
 else Space.Configuration.VisualizationMaxSize:=-1;
Space.Configuration.flUseComponentsManager:=cbUseComponentsManager.Checked;
if NOT ((edRemoteStatusLoadingComponentMaxSize.Text = '') OR (edRemoteStatusLoadingComponentMaxSize.Text = '-1'))
 then Space.Configuration.RemoteStatusLoadingComponentMaxSize:=StrToInt(edRemoteStatusLoadingComponentMaxSize.Text)*1000
 else Space.Configuration.RemoteStatusLoadingComponentMaxSize:=-1;
Space.Configuration.ReflectingObjPortion:=StrToInt(edReflectingObjPortion.Text);
Space.Configuration.UpdateInterval:=StrToInt(edUpdateInterval.Text);
Save;
end;
//.
flServerConfigChanged:=false;
ShowMessage('ProxySpace configuration was changed (to validate it restart the program).');
end;

procedure TfmProxySpaceCfg.Update;
begin
ServerConfig_Update;
LocalConfig_Update;
end;

procedure TfmProxySpaceCfg.Save;
begin
if Space.idUserProxySpace = 0 then Exit; //. ->
ServerConfig_Save;
LocalConfig_Save;
end;

procedure TfmProxySpaceCfg.Edit;
begin
if Space.idUserProxySpace = 0 then ShowMessage('There is no user defined proxyspace. '#$0D#$0A'All configuration changes you made will lost.');
ShowModal;
Save;
end;

procedure TfmProxySpaceCfg.sbAcceptServerSideConfigurationClick(Sender: TObject);
begin
ServerConfig_Save;
end;

procedure TfmProxySpaceCfg.rgStatusClick(Sender: TObject);
begin
flServerConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.cbComponentsPanelsHistroryOnClick(Sender: TObject);
begin
flServerConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.cbShowUserComponentsAtStartClick(Sender: TObject);
begin
flServerConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.cbUserMessagesCheckingClick(Sender: TObject);
begin
flServerConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.edVisualizationMaxSizeChange(Sender: TObject);
begin
edVisualizationMaxSize.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.edVisualizationMaxSizeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  if edVisualizationMaxSize.Text <> '' then StrToInt(edVisualizationMaxSize.Text);
  edVisualizationMaxSize.Font.Color:=clBlack;
  flServerConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.cbUseComponentsManagerClick(Sender: TObject);
begin
flServerConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.edRemoteStatusLoadingComponentMaxSizeChange(Sender: TObject);
begin
edRemoteStatusLoadingComponentMaxSize.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.edRemoteStatusLoadingComponentMaxSizeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  if edRemoteStatusLoadingComponentMaxSize.Text <> '' then StrToInt(edRemoteStatusLoadingComponentMaxSize.Text);
  edRemoteStatusLoadingComponentMaxSize.Font.Color:=clBlack;
  flServerConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.edReflectingObjPortionChange(Sender: TObject);
begin
edReflectingObjPortion.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.edReflectingObjPortionKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  if edReflectingObjPortion.Text <> '' then StrToInt(edReflectingObjPortion.Text);
  edReflectingObjPortion.Font.Color:=clBlack;
  flServerConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.edUpdateIntervalChange(Sender: TObject);
begin
edUpdateInterval.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.edUpdateIntervalKeyPress(Sender: TObject; var Key: Char);
var
  I: integer;
begin
if Key = #$0D
 then begin
  I:=StrToInt(edUpdateInterval.Text);
  if (I > 0) AND (I < 10) then Raise Exception.Create('update interval is too short'); //. =>
  edUpdateInterval.Font.Color:=clBlack;
  flServerConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_Update;
var
  ContextItemsMaxCount: integer;
  flNoComponentsContext,flActionsGroupCall: boolean;
  NotificationServerHost: string;
  NotificationServerPort: integer;
  NotificationServerProxyHost: string;
  NotificationServerProxyPort: integer;
  NotificationServerProxyUserName,NotificationServerProxyUserPassword: string;
  NotificationServerAlwaysUseProxy: boolean;
begin
//. read user proxy space local settings
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile('UserProxySpace.cfg');
with TINIFile.Create(ProfileFile) do
try
ContextItemsMaxCount:=ReadInteger('ProxySpace','CachedObjectsMaxCount',0);
flNoComponentsContext:=(ReadInteger('ProxySpace','NoComponentsContextForUpdateFlag',0) = 1);
flActionsGroupCall:=(ReadInteger('Other','UseActionsGroupCall',1) = 1);
//. notification server settings
NotificationServerHost:=ReadString('SpaceNotificationServer','HostAddress','');
NotificationServerPort:=ReadInteger('SpaceNotificationServer','Port',0);
NotificationServerProxyHost:=ReadString('SpaceNotificationServer','Proxy_Host','');
NotificationServerProxyPort:=ReadInteger('SpaceNotificationServer','Proxy_Port',0);
NotificationServerProxyUserName:=ReadString('SpaceNotificationServer','Proxy_UserName','Anonymous');
NotificationServerProxyUserPassword:=ReadString('SpaceNotificationServer','Proxy_UserPassword','');
NotificationServerAlwaysUseProxy:=(ReadInteger('SpaceNotificationServer','Proxy_AlwaysUseProxy',0) = 1);
finally
Destroy;
end;
finally
Destroy;
end;
LocalConfig_edContextSize.Text:=IntToStr(ContextItemsMaxCount);
LocalConfig_edContextSize.Font.Color:=clBlack;
LocalConfig_cbUpdateUsingContext.Checked:=(NOT flNoComponentsContext);
LocalConfig_cbActionsGroupCall.Checked:=flActionsGroupCall;
//.
LocalConfig_edNotificationServerHost.Text:=NotificationServerHost;
LocalConfig_edNotificationServerHost.Font.Color:=clBlack;
if (NotificationServerPort <> 0) then LocalConfig_edNotificationServerPort.Text:=IntToStr(NotificationServerPort) else LocalConfig_edNotificationServerPort.Text:='';
LocalConfig_edNotificationServerPort.Font.Color:=clBlack;
LocalConfig_edNotificationServerProxyHost.Text:=NotificationServerProxyHost;
LocalConfig_edNotificationServerProxyHost.Font.Color:=clBlack;
if (NotificationServerProxyPort <> 0) then LocalConfig_edNotificationServerProxyPort.Text:=IntToStr(NotificationServerProxyPort) else LocalConfig_edNotificationServerProxyPort.Text:='';
LocalConfig_edNotificationServerProxyPort.Font.Color:=clBlack;
LocalConfig_edNotificationServerProxyUserName.Text:=NotificationServerProxyUserName;
LocalConfig_edNotificationServerProxyUserName.Font.Color:=clBlack;
LocalConfig_edNotificationServerProxyUserPassword.Text:=NotificationServerProxyUserPassword;
LocalConfig_edNotificationServerProxyUserPassword.Font.Color:=clBlack;
LocalConfig_cbNotificationServerAlwaysUseProxy.Checked:=NotificationServerAlwaysUseProxy;
//.
flLocalConfigChanged:=false;
end;

procedure TfmProxySpaceCfg.LocalConfig_Save;
begin
if (NOT flLocalConfigChanged) then Exit; //. -> 
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile('UserProxySpace.cfg');
with TINIFile.Create(ProfileFile) do
try
WriteInteger('ProxySpace','CachedObjectsMaxCount',StrToInt(LocalConfig_edContextSize.Text));
if (LocalConfig_cbUpdateUsingContext.Checked) then WriteInteger('ProxySpace','NoComponentsContextForUpdateFlag',0) else WriteInteger('ProxySpace','NoComponentsContextForUpdateFlag',1); 
if (LocalConfig_cbActionsGroupCall.Checked) then WriteInteger('Other','UseActionsGroupCall',1) else WriteInteger('Other','UseActionsGroupCall',0); 
//. notification server settings
WriteString('SpaceNotificationServer','HostAddress',LocalConfig_edNotificationServerHost.Text);
if (LocalConfig_edNotificationServerPort.Text <> '') then WriteInteger('SpaceNotificationServer','Port',StrToInt(LocalConfig_edNotificationServerPort.Text)) else WriteInteger('SpaceNotificationServer','Port',0);
WriteString('SpaceNotificationServer','Proxy_Host',LocalConfig_edNotificationServerProxyHost.Text);
if (LocalConfig_edNotificationServerProxyPort.Text <> '') then WriteInteger('SpaceNotificationServer','Proxy_Port',StrToInt(LocalConfig_edNotificationServerProxyPort.Text)) else WriteInteger('SpaceNotificationServer','Proxy_Port',0); 
WriteString('SpaceNotificationServer','Proxy_UserName',LocalConfig_edNotificationServerProxyUserName.Text);
WriteString('SpaceNotificationServer','Proxy_UserPassword',LocalConfig_edNotificationServerProxyUserPassword.Text);
if (LocalConfig_cbNotificationServerAlwaysUseProxy.Checked) then WriteInteger('SpaceNotificationServer','Proxy_AlwaysUseProxy',1) else WriteInteger('SpaceNotificationServer','Proxy_AlwaysUseProxy',0);  
finally
Destroy;
end;
finally
Destroy;
end;
flLocalConfigChanged:=false;
ShowMessage('ProxySpace configuration was changed (to validate it restart the program).');
end;


procedure TfmProxySpaceCfg.LocalConfig_edContextSizeChange(Sender: TObject);
begin
LocalConfig_edContextSize.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerHostChange(Sender: TObject);
begin
LocalConfig_edNotificationServerHost.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerPortChange(Sender: TObject);
begin
LocalConfig_edNotificationServerPort.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyHostChange(Sender: TObject);
begin
LocalConfig_edNotificationServerProxyHost.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyPortChange(Sender: TObject);
begin
LocalConfig_edNotificationServerProxyPort.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyUserNameChange(Sender: TObject);
begin
LocalConfig_edNotificationServerProxyUserName.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyUserPasswordChange(Sender: TObject);
begin
LocalConfig_edNotificationServerProxyUserPassword.Font.Color:=clGreen;
end;

procedure TfmProxySpaceCfg.LocalConfig_cbUpdateUsingContextClick(Sender: TObject);
begin
flLocalConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.LocalConfig_cbActionsGroupCallClick(Sender: TObject);
begin
flLocalConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.LocalConfig_cbNotificationServerAlwaysUseProxyClick(Sender: TObject);
begin
flLocalConfigChanged:=true;
end;

procedure TfmProxySpaceCfg.LocalConfig_edContextSizeKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  StrToInt(LocalConfig_edContextSize.Text);
  LocalConfig_edContextSize.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerHostKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  LocalConfig_edNotificationServerHost.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerPortKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  if (LocalConfig_edNotificationServerPort.Text <> '') then StrToInt(LocalConfig_edNotificationServerPort.Text);
  LocalConfig_edNotificationServerPort.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyHostKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  LocalConfig_edNotificationServerProxyHost.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyPortKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  if (LocalConfig_edNotificationServerProxyPort.Text <> '') then StrToInt(LocalConfig_edNotificationServerProxyPort.Text);
  LocalConfig_edNotificationServerProxyPort.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyUserNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  LocalConfig_edNotificationServerProxyUserName.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.LocalConfig_edNotificationServerProxyUserPasswordKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  LocalConfig_edNotificationServerProxyUserPassword.Font.Color:=clBlack;
  flLocalConfigChanged:=true;
  end;
end;

procedure TfmProxySpaceCfg.sbAcceptLocalSideConfigurationClick(Sender: TObject);
begin
LocalConfig_Save;
end;

end.
