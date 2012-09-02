unit unitEnforaMiniMTTrackerBusinessModelControlPanel;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaMiniMTObjectModel,
  unitEnforaMiniMTTrackerBusinessModel,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,
  Menus;

type
  TEnforaMiniMTTrackerBusinessModelControlPanel = class(TBusinessModelControlPanel)
    pnlHeader: TPanel;
    lbConnectionStatus: TLabel;
    stConnectionStatus: TStaticText;
    lbConnectionLastCheckpointTime: TLabel;
    bbObjectModel: TBitBtn;
    Updater: TTimer;
    gbDayLogTracks: TGroupBox;
    Label2: TLabel;
    bbAddDayTrackToTheCurrentReflector: TBitBtn;
    stNewTrackColor: TStaticText;
    ColorDialog: TColorDialog;
    stChangeNewTrackColor: TSpeedButton;
    Label4: TLabel;
    stDayTracksTableOrigin: TStaticText;
    cbAddObjectModelTrackEvents: TCheckBox;
    cbAddBusinessModelTrackEvents: TCheckBox;
    TrackBeginDayPicker: TDateTimePicker;
    Label3: TLabel;
    TrackEndDayPicker: TDateTimePicker;
    bbAddDayTrackToTheCurrentReflectorM1: TBitBtn;
    bbAddDayTrackToTheCurrentReflectorM2: TBitBtn;
    PopupMenu: TPopupMenu;
    properties1: TMenuItem;
    edBatteryVoltage: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label9: TLabel;
    Label11: TLabel;
    Bevel6: TBevel;
    edAlert: TEdit;
    edConnectionServiceProviderAccount: TEdit;
    edBatteryCharge: TEdit;
    cbDisableObjectMoving: TCheckBox;
    cbDisableObject: TCheckBox;
    bbGetCurrentPosition: TBitBtn;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    cbBatteryModuleIsExternalPower: TCheckBox;
    cbBatteryModuleIsLowPowerMode: TCheckBox;
    edConnectionServiceProviderSignal: TEdit;
    stStatusModuleIsStop: TStaticText;
    stStatusModuleIsMotion: TStaticText;
    StaticText6: TStaticText;
    stAlarmStatusModuleIsBatteryAlarm: TStaticText;
    Label15: TLabel;
    Label45: TLabel;
    stGPSModuleIsActive: TStaticText;
    Label18: TLabel;
    StateBlinker: TTimer;
    stAlarmStatusModuleIsButtonAlarm: TStaticText;
    Label10: TLabel;
    stAlarmStatusModuleIsSpeedAlarm: TStaticText;
    Label12: TLabel;
    procedure UpdaterTimer(Sender: TObject);
    procedure cbDisableObjectMovingClick(Sender: TObject);
    procedure cbDisableObjectClick(Sender: TObject);
    procedure bbObjectModelClick(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
    procedure stNewTrackColorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbGetCurrentPositionClick(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
    procedure properties1Click(Sender: TObject);
    procedure cbBatteryModuleIsExternalPowerClick(Sender: TObject);
    procedure StateBlinkerTimer(Sender: TObject);
  private
    { Private declarations }
    Model: TEnforaMiniMTTrackerBusinessModel;
    DeviceRootComponent: TEnforaMiniMTObjectDeviceComponent;
    TracksPanel: TForm;
    TracksPanel_ReflectorID: integer;
  public
    { Public declarations }
    Constructor Create(const pModel: TEnforaMiniMTTrackerBusinessModel);
    Destructor Destroy(); override;
    procedure PostUpdate(); override;
    procedure Update(); override;
    procedure GetCurrentPosition();
    procedure AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
  end;


implementation
uses
  FileCtrl,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitGEOGraphServerController;

{$R *.dfm}


{TEnforaMiniMTTrackerBusinessModelControlPanel}
Constructor TEnforaMiniMTTrackerBusinessModelControlPanel.Create(const pModel: TEnforaMiniMTTrackerBusinessModel);
begin
Inherited Create(pModel);
Model:=pModel;
DeviceRootComponent:=TEnforaMiniMTObjectDeviceComponent(Model.ObjectModel.ObjectDeviceSchema.RootComponent);
//.
TrackBeginDayPicker.DateTime:=Now;
TrackEndDayPicker.DateTime:=Now;
end;

Destructor TEnforaMiniMTTrackerBusinessModelControlPanel.Destroy();
begin
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
Inherited;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.PostUpdate();
begin
Inherited;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.Update();
var
  flUpdatingOld: boolean;
begin
flUpdatingOld:=flUpdating;
try
flUpdating:=true;
//.
edConnectionServiceProviderSignal.Text:=IntToStr(Model.DeviceConnectionServiceProviderSignal)+' %';
edConnectionServiceProviderAccount.Text:=IntToStr(Model.DeviceConnectionServiceProviderAccount);
edBatteryVoltage.Text:=IntToStr(Model.DeviceBatteryVoltage);
edBatteryCharge.Text:=IntToStr(Model.DeviceBatteryCharge)+' %';
//. in
edAlert.Text:=TrackerAlertSeverityStrings[Model.AlertSeverity];
edAlert.Color:=TrackerAlertSeverityColors[Model.AlertSeverity];
//. out
cbDisableObjectMoving.Checked:=Model.DisableObjectMoving;
cbDisableObject.Checked:=Model.DisableObject;
//.
Model.ObjectModel.Lock.Enter();
try
cbBatteryModuleIsExternalPower.Checked:=Model.DeviceRootComponent.BatteryModule.IsExternalPower.BoolValue.Value;
cbBatteryModuleIsLowPowerMode.Checked:=Model.DeviceRootComponent.BatteryModule.IsLowPowerMode.BoolValue.Value;
//.
if (DeviceRootComponent.StatusModule.IsStop.BoolValue.Value) then stStatusModuleIsStop.Color:=clGreen else stStatusModuleIsStop.Color:=clSilver;
if (DeviceRootComponent.StatusModule.IsStop.BoolValue.Timestamp > 0.0) then stStatusModuleIsStop.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.StatusModule.IsStop.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.StatusModule.IsMotion.BoolValue.Value) then stStatusModuleIsMotion.Color:=clGreen else stStatusModuleIsMotion.Color:=clSilver;
if (DeviceRootComponent.StatusModule.IsMotion.BoolValue.Timestamp > 0.0) then stStatusModuleIsMotion.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.StatusModule.IsMotion.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.GPSModule.IsActive.BoolValue.Value)
 then begin
  stGPSModuleIsActive.Tag:=0;
  stGPSModuleIsActive.Color:=clGreen;
  end
 else begin
  stGPSModuleIsActive.Tag:=1;
  stGPSModuleIsActive.Color:=clYellow;
  end;
if (DeviceRootComponent.GPSModule.IsActive.BoolValue.Timestamp > 0.0) then stGPSModuleIsActive.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.IsActive.BoolValue.Timestamp+TimeZoneDelta);
//.
if (DeviceRootComponent.AlarmStatusModule.IsBatteryAlarm.BoolValue.Value)
 then begin
  stAlarmStatusModuleIsBatteryAlarm.Tag:=1;
  stAlarmStatusModuleIsBatteryAlarm.Color:=clRed;
  end
 else begin
  stAlarmStatusModuleIsBatteryAlarm.Tag:=0;
  stAlarmStatusModuleIsBatteryAlarm.Color:=clSilver;
  end;
if (DeviceRootComponent.AlarmStatusModule.IsBatteryAlarm.BoolValue.Timestamp > 0.0) then stAlarmStatusModuleIsBatteryAlarm.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.IsActive.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.AlarmStatusModule.IsButtonAlarm.BoolValue.Value)
 then begin
  stAlarmStatusModuleIsButtonAlarm.Tag:=1;
  stAlarmStatusModuleIsButtonAlarm.Color:=clRed;
  end
 else begin
  stAlarmStatusModuleIsButtonAlarm.Tag:=0;
  stAlarmStatusModuleIsButtonAlarm.Color:=clSilver;
  end;
if (DeviceRootComponent.AlarmStatusModule.IsButtonAlarm.BoolValue.Timestamp > 0.0) then stAlarmStatusModuleIsButtonAlarm.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.IsActive.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.AlarmStatusModule.IsSpeedAlarm.BoolValue.Value)
 then begin
  stAlarmStatusModuleIsSpeedAlarm.Tag:=1;
  stAlarmStatusModuleIsSpeedAlarm.Color:=clRed;
  end
 else begin
  stAlarmStatusModuleIsSpeedAlarm.Tag:=0;
  stAlarmStatusModuleIsSpeedAlarm.Color:=clSilver;
  end;
if (DeviceRootComponent.AlarmStatusModule.IsSpeedAlarm.BoolValue.Timestamp > 0.0) then stAlarmStatusModuleIsSpeedAlarm.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.IsActive.BoolValue.Timestamp+TimeZoneDelta);
finally
Model.ObjectModel.Lock.Leave();
end;
//.
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
TracksPanel:=ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_CreatePanel(Self.ObjectCoComponentID,gbDayLogTracks);
if (TracksPanel <> nil)
 then begin
  TracksPanel_ReflectorID:=ProxySpace___TypesSystem__Reflector_ID();
  //.
  ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel(TracksPanel);
  TracksPanel.Left:=stDayTracksTableOrigin.Left;
  TracksPanel.Top:=stDayTracksTableOrigin.Top+stDayTracksTableOrigin.Height+2;
  TracksPanel.Width:=stDayTracksTableOrigin.Width;
  TracksPanel.Height:=gbDayLogTracks.Height-TracksPanel.Top-TracksPanel.Left;
  TracksPanel.Show;
  end;
//.
Inherited;
finally
flUpdating:=flUpdatingOld;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.GetCurrentPosition();
var
  ptrObj: TPtr;
  Visualization: TObjectDescriptor;
begin
if (NOT Model.ObjectModel.IsObjectOnline) then Raise Exception.Create('Cannot get current position: object is offline'); //. =>
//. read device gps fix
Model.DeviceRootComponent.GPSModule.GPSFixData.ReadDeviceCUAC();
//. set object at current reflector center
Model.ObjectModel.Lock.Enter;
try
Visualization:=Model.ObjectRootComponent.Visualization.Descriptor.Value;
finally
Model.ObjectModel.Lock.Leave;
end;
//.
ProxySpace_StayUpToDate();
//.
ptrObj:=ProxySpace__Obj_Ptr(Visualization.idTObj,Visualization.idObj);
ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(ptrObj);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
var
  DaysCount: integer;
  TrackName: string;
  CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc;
  CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc;
  ptrNewTrack: pointer;
begin
DaysCount:=Trunc(EndDate)-Trunc(BeginDate)+1;
if (DaysCount < 1) then Raise Exception.Create('invalid date interval'); //. =>
//.
TrackName:=ObjectName+'('+FormatDateTime('DD.MM.YY',BeginDate)+'-'+FormatDateTime('DD.MM.YY',EndDate)+')';
if (cbAddObjectModelTrackEvents.Checked) then CreateObjectModelTrackEventFunc:=Model.ObjectModel.CreateTrackEvent else CreateObjectModelTrackEventFunc:=nil;
if (cbAddBusinessModelTrackEvents.Checked) then CreateBusinessModelTrackEventFunc:=Model.CreateTrackEvent else CreateBusinessModelTrackEventFunc:=nil;
ProxySpace__Log_OperationStarting('loading track from the server ...');
try
ptrNewTrack:=Model.ObjectModel.Log_CreateTrackByDays(BeginDate,DaysCount,TrackName,stNewTrackColor.Color,Self.ObjectCoComponentID,CreateObjectModelTrackEventFunc,CreateBusinessModelTrackEventFunc);
finally
ProxySpace__Log_OperationDone;
end;
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack(ptrNewTrack);
ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel();
//.
if (TracksPanel <> nil)
 then ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel(TracksPanel);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.bbObjectModelClick(Sender: TObject);
var
  W,H: integer;
begin
with Model.ObjectModel.GetControlPanel() do begin
Caption:='Object Model';
W:=ClientWidth;
H:=ClientHeight;
BorderStyle:=bsDialog;
FormStyle:=fsStayOnTop;
ClientWidth:=W;
ClientHeight:=H;
Position:=poScreenCenter;
Show();
end;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.properties1Click(Sender: TObject);
begin
bbObjectModelClick(nil);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.StateBlinkerTimer(Sender: TObject);
begin
if (stGPSModuleIsActive.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stGPSModuleIsActive.Color:=clYellow
   else stGPSModuleIsActive.Color:=clSilver; 
  end;
if (stAlarmStatusModuleIsBatteryAlarm.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stAlarmStatusModuleIsBatteryAlarm.Color:=clRed
   else stAlarmStatusModuleIsBatteryAlarm.Color:=clSilver;
  end;
if (stAlarmStatusModuleIsButtonAlarm.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stAlarmStatusModuleIsButtonAlarm.Color:=clRed
   else stAlarmStatusModuleIsButtonAlarm.Color:=clSilver;
  end;
if (stAlarmStatusModuleIsSpeedAlarm.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stAlarmStatusModuleIsSpeedAlarm.Color:=clRed
   else stAlarmStatusModuleIsSpeedAlarm.Color:=clSilver; 
  end;
//.
StateBlinker.Tag:=StateBlinker.Tag+1;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.cbDisableObjectMovingClick(Sender: TObject);
var
  flUpdatingOld: boolean;
  SC: TCursor;
begin
if (flUpdating) then Exit; //. ->
if (Application.MessageBox('Confirm operation','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES)
 then begin
  flUpdatingOld:=flUpdating;
  try
  flUpdating:=true;
  cbDisableObjectMoving.Checked:=(NOT cbDisableObjectMoving.Checked);
  finally
  flUpdating:=flUpdatingOld;
  end;
  Exit; //. ->
  end;
try
SC:=Screen.Cursor;
try
Repaint();
Screen.Cursor:=crHourGlass;
Model.DisableObjectMoving:=cbDisableObjectMoving.Checked;
finally
Screen.Cursor:=SC;
end;
except
  flUpdatingOld:=flUpdating;
  try
  flUpdating:=true;
  cbDisableObjectMoving.Checked:=(NOT cbDisableObjectMoving.Checked);
  finally
  flUpdating:=flUpdatingOld;
  end;
  Raise; //. =>
  end;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.cbDisableObjectClick(Sender: TObject);
var
  flUpdatingOld: boolean;
  SC: TCursor;
begin
if (flUpdating) then Exit; //. ->
if (Application.MessageBox('Confirm operation','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES)
 then begin
  flUpdatingOld:=flUpdating;
  try
  flUpdating:=true;
  cbDisableObject.Checked:=(NOT cbDisableObject.Checked);
  finally
  flUpdating:=flUpdatingOld;
  end;
  Exit; //. ->
  end;
try
SC:=Screen.Cursor;
try
Repaint();
Screen.Cursor:=crHourGlass;
Model.DisableObject:=cbDisableObject.Checked;
finally
Screen.Cursor:=SC;
end;
except
  flUpdatingOld:=flUpdating;
  try
  flUpdating:=true;
  cbDisableObject.Checked:=(NOT cbDisableObject.Checked);
  finally
  flUpdating:=flUpdatingOld;
  end;
  Raise; //. =>
  end;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.UpdaterTimer(Sender: TObject);
begin
if (Model.IsObjectOnline())
 then begin
  lbConnectionStatus.Caption:='Online';
  stConnectionStatus.Color:=clGreen;
  end
 else begin
  lbConnectionStatus.Caption:='offline';
  stConnectionStatus.Color:=clGray;
  end;
lbConnectionLastCheckpointTime.Caption:='Last checkpoint time at: '+FormatDateTime('DD.MM.YY HH:NN:SS',TDateTime(Model.DeviceRootComponent.ConnectionModule.LastCheckpointTime.Value)+TimeZoneDelta);
//.
if ((TracksPanel <> nil) AND (ProxySpace___TypesSystem__Reflector_ID() <> TracksPanel_ReflectorID))
 then Update();
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.stNewTrackColorClick(Sender: TObject);
begin
ColorDialog.Color:=stNewTrackColor.Color;
if (ColorDialog.Execute) then stNewTrackColor.Color:=ColorDialog.Color;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime,TrackEndDayPicker.DateTime);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-1.0,TrackEndDayPicker.DateTime-1.0);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-2.0,TrackEndDayPicker.DateTime-2.0);
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.bbGetCurrentPositionClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
GetCurrentPosition();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModelControlPanel.cbBatteryModuleIsExternalPowerClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
flUpdating:=true;
try
TCheckBox(Sender).Checked:=(NOT TCheckBox(Sender).Checked);
finally
flUpdating:=false;
end;
end;


end.
