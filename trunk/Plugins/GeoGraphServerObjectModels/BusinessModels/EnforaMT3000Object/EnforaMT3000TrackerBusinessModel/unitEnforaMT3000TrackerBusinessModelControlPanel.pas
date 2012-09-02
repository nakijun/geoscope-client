unit unitEnforaMT3000TrackerBusinessModelControlPanel;

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
  unitEnforaMT3000ObjectModel,
  unitEnforaMT3000TrackerBusinessModel,
  StdCtrls, ExtCtrls, Buttons, ComCtrls,
  Menus;

type
  TEnforaMT3000TrackerBusinessModelControlPanel = class(TBusinessModelControlPanel)
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
    Label37: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
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
    gbOBDIIModule: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    edOBDIIModuleBatteryModuleValue: TEdit;
    edOBDIIModuleFuelModuleValue: TEdit;
    stStatusModuleIsStop: TStaticText;
    stStatusModuleIsIdle: TStaticText;
    stStatusModuleIsMotion: TStaticText;
    stStatusModuleIsMIL: TStaticText;
    edOBDIIModuleMILAlertModuleAlertCodes: TEdit;
    stOBDIIModuleBatteryModuleIsLow: TStaticText;
    stOBDIIModuleFuelModuleIsLow: TStaticText;
    StaticText6: TStaticText;
    stIgnitionModuleValue: TStaticText;
    Label15: TLabel;
    stTowAlertModuleValue: TStaticText;
    Label16: TLabel;
    Label45: TLabel;
    edOBDIIModuleStateModuleVIN: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label17: TLabel;
    edOBDIIModuleSpeedometerModuleValue: TMemo;
    edOBDIIModuleTachometerModuleValue: TMemo;
    edOBDIIModuleOdometerModuleValue: TMemo;
    edAccelerometerModuleValue: TMemo;
    stGPSModuleIsActive: TStaticText;
    Label18: TLabel;
    StateBlinker: TTimer;
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
    Model: TEnforaMT3000TrackerBusinessModel;
    DeviceRootComponent: TEnforaMT3000ObjectDeviceComponent;
    TracksPanel: TForm;
    TracksPanel_ReflectorID: integer;
  public
    { Public declarations }
    Constructor Create(const pModel: TEnforaMT3000TrackerBusinessModel);
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


{TEnforaMT3000TrackerBusinessModelControlPanel}
Constructor TEnforaMT3000TrackerBusinessModelControlPanel.Create(const pModel: TEnforaMT3000TrackerBusinessModel);
begin
Inherited Create(pModel);
Model:=pModel;
DeviceRootComponent:=TEnforaMT3000ObjectDeviceComponent(Model.ObjectModel.ObjectDeviceSchema.RootComponent);
//.
TrackBeginDayPicker.DateTime:=Now;
TrackEndDayPicker.DateTime:=Now;
end;

Destructor TEnforaMT3000TrackerBusinessModelControlPanel.Destroy();
begin
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
Inherited;
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.PostUpdate();
begin
Inherited;
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.Update();
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
if (DeviceRootComponent.StatusModule.IsIdle.BoolValue.Value) then stStatusModuleIsIdle.Color:=clGreen else stStatusModuleIsIdle.Color:=clSilver;
if (DeviceRootComponent.StatusModule.IsIdle.BoolValue.Timestamp > 0.0) then stStatusModuleIsIdle.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.StatusModule.IsIdle.BoolValue.Timestamp+TimeZoneDelta);
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
if (DeviceRootComponent.StatusModule.IsMIL.BoolValue.Value)
 then begin
  stStatusModuleIsMIL.Tag:=1;
  stStatusModuleIsMIL.Color:=clYellow;
  end
 else begin
  stStatusModuleIsMIL.Tag:=0;
  stStatusModuleIsMIL.Color:=clSilver;
  end;
if (DeviceRootComponent.StatusModule.IsMIL.BoolValue.Timestamp > 0.0) then stStatusModuleIsMIL.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.StatusModule.IsMIL.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.OBDIIModule.FuelModule.IsLow.BoolValue.Value)
 then begin
  stOBDIIModuleFuelModuleIsLow.Tag:=1;
  stOBDIIModuleFuelModuleIsLow.Color:=clYellow;
  end
 else begin
  stOBDIIModuleFuelModuleIsLow.Tag:=0;
  stOBDIIModuleFuelModuleIsLow.Color:=clSilver;
  end;
if (DeviceRootComponent.OBDIIModule.FuelModule.IsLow.BoolValue.Timestamp > 0.0) then stOBDIIModuleFuelModuleIsLow.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.OBDIIModule.FuelModule.IsLow.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.OBDIIModule.BatteryModule.IsLow.BoolValue.Value)
 then begin
  stOBDIIModuleBatteryModuleIsLow.Tag:=1;
  stOBDIIModuleBatteryModuleIsLow.Color:=clYellow;
  end
 else begin
  stOBDIIModuleBatteryModuleIsLow.Tag:=0;
  stOBDIIModuleBatteryModuleIsLow.Color:=clSilver;
  end;
if (DeviceRootComponent.OBDIIModule.BatteryModule.IsLow.BoolValue.Timestamp > 0.0) then stOBDIIModuleBatteryModuleIsLow.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.OBDIIModule.BatteryModule.IsLow.BoolValue.Timestamp+TimeZoneDelta);
//.
if (DeviceRootComponent.IgnitionModule.Value.BoolValue.Value) then stIgnitionModuleValue.Color:=clGreen else stIgnitionModuleValue.Color:=clSilver;
if (DeviceRootComponent.IgnitionModule.Value.BoolValue.Timestamp > 0.0) then stIgnitionModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.IgnitionModule.Value.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.TowAlertModule.Value.BoolValue.Value) then stTowAlertModuleValue.Color:=clRed else stTowAlertModuleValue.Color:=clSilver;
if (DeviceRootComponent.TowAlertModule.Value.BoolValue.Timestamp > 0.0) then stTowAlertModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.TowAlertModule.Value.BoolValue.Timestamp+TimeZoneDelta);
if (DeviceRootComponent.AccelerometerModule.Value.Value.Value > 0.0)
 then edAccelerometerModuleValue.Text:='>= '+FormatFloat('0.0',DeviceRootComponent.AccelerometerModule.Value.Value.Value)
 else
  if (DeviceRootComponent.AccelerometerModule.Value.Value.Value < 0.0)
   then edAccelerometerModuleValue.Text:='<= '+FormatFloat('0.0',DeviceRootComponent.AccelerometerModule.Value.Value.Value)
   else
    edAccelerometerModuleValue.Text:='0';
if (DeviceRootComponent.AccelerometerModule.Value.Value.Timestamp > 0.0) then edAccelerometerModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.AccelerometerModule.Value.Value.Timestamp+TimeZoneDelta);
gbOBDIIModule.Enabled:=true; ///? DeviceRootComponent.OBDIIModule.StateModule.IsPresented.BoolValue.Value;
if (true) ///? (gbOBDIIModule.Enabled)
 then begin
  edOBDIIModuleStateModuleVIN.Text:=DeviceRootComponent.OBDIIModule.StateModule.VIN.Value.Value;
  //.
  edOBDIIModuleBatteryModuleValue.Text:=FormatFloat('0.00',DeviceRootComponent.OBDIIModule.BatteryModule.Value.Value.Value);
  //.
  edOBDIIModuleFuelModuleValue.Text:=FormatFloat('0.000',DeviceRootComponent.OBDIIModule.FuelModule.Value.Value.Value);
  //.
  if (DeviceRootComponent.IgnitionModule.Value.BoolValue.Value)
   then edOBDIIModuleTachometerModuleValue.Text:='>= '+IntToStr(DeviceRootComponent.OBDIIModule.TachometerModule.Value.Value.Value)
   else edOBDIIModuleTachometerModuleValue.Text:='0';
  if (DeviceRootComponent.IgnitionModule.Value.BoolValue.Timestamp > 0.0) then edOBDIIModuleTachometerModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.IgnitionModule.Value.BoolValue.Timestamp+TimeZoneDelta);
  //.
  if (DeviceRootComponent.StatusModule.IsMotion.BoolValue.Value)
   then edOBDIIModuleSpeedometerModuleValue.Text:='>= '+FormatFloat('0',DeviceRootComponent.OBDIIModule.SpeedometerModule.Value.Value.Value)
   else edOBDIIModuleSpeedometerModuleValue.Text:='0';
  if (DeviceRootComponent.OBDIIModule.SpeedometerModule.Value.Value.Timestamp > 0.0) then edOBDIIModuleSpeedometerModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.OBDIIModule.SpeedometerModule.Value.Value.Timestamp+TimeZoneDelta);
  //.
  edOBDIIModuleMILAlertModuleAlertCodes.Text:=DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Value;
  if (edOBDIIModuleMILAlertModuleAlertCodes.Text = '')
   then edOBDIIModuleMILAlertModuleAlertCodes.Color:=clBtnFace
   else edOBDIIModuleMILAlertModuleAlertCodes.Color:=clRed;
  if (edOBDIIModuleMILAlertModuleAlertCodes.Text = '')
   then begin
    edOBDIIModuleMILAlertModuleAlertCodes.Font.Color:=clNavy;
    edOBDIIModuleMILAlertModuleAlertCodes.Text:='- none -'
    end
   else edOBDIIModuleMILAlertModuleAlertCodes.Font.Color:=clRed;
  if (DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Timestamp > 0.0) then edOBDIIModuleMILAlertModuleAlertCodes.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Timestamp+TimeZoneDelta);
  //.
  edOBDIIModuleOdometerModuleValue.Text:=FormatFloat('0.0',DeviceRootComponent.OBDIIModule.OdometerModule.Value.Value.Value);
  if (DeviceRootComponent.OBDIIModule.OdometerModule.Value.Value.Timestamp > 0.0) then edOBDIIModuleOdometerModuleValue.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.OBDIIModule.OdometerModule.Value.Value.Timestamp+TimeZoneDelta);
  end
 else begin
  edOBDIIModuleStateModuleVIN.Text:='?';
  //.
  edOBDIIModuleBatteryModuleValue.Text:='?';
  //.
  edOBDIIModuleFuelModuleValue.Text:='?';
  //.
  edOBDIIModuleTachometerModuleValue.Text:='?';
  edOBDIIModuleTachometerModuleValue.Hint:='';
  //.
  edOBDIIModuleSpeedometerModuleValue.Text:='?';
  edOBDIIModuleSpeedometerModuleValue.Hint:='';
  //.
  edOBDIIModuleMILAlertModuleAlertCodes.Text:='?';
  edOBDIIModuleMILAlertModuleAlertCodes.Color:=clBtnFace;
  edOBDIIModuleMILAlertModuleAlertCodes.Hint:='';
  //.
  edOBDIIModuleOdometerModuleValue.Text:='?';
  edOBDIIModuleOdometerModuleValue.Hint:='';
  end;
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.GetCurrentPosition();
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.bbObjectModelClick(Sender: TObject);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.properties1Click(Sender: TObject);
begin
bbObjectModelClick(nil);
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.StateBlinkerTimer(Sender: TObject);
begin
if (stGPSModuleIsActive.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stGPSModuleIsActive.Color:=clYellow
   else stGPSModuleIsActive.Color:=clSilver; 
  end;
if (stStatusModuleIsMIL.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stStatusModuleIsMIL.Color:=clYellow
   else stStatusModuleIsMIL.Color:=clSilver;
  end;
if (stOBDIIModuleFuelModuleIsLow.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stOBDIIModuleFuelModuleIsLow.Color:=clYellow
   else stOBDIIModuleFuelModuleIsLow.Color:=clSilver;
  end;
if (stOBDIIModuleBatteryModuleIsLow.Tag = 1)
 then begin
  if ((StateBlinker.Tag MOD 2) > 0)
   then stOBDIIModuleBatteryModuleIsLow.Color:=clYellow
   else stOBDIIModuleBatteryModuleIsLow.Color:=clSilver;
  end;
//.
StateBlinker.Tag:=StateBlinker.Tag+1;
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.cbDisableObjectMovingClick(Sender: TObject);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.cbDisableObjectClick(Sender: TObject);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.UpdaterTimer(Sender: TObject);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.stNewTrackColorClick(Sender: TObject);
begin
ColorDialog.Color:=stNewTrackColor.Color;
if (ColorDialog.Execute) then stNewTrackColor.Color:=ColorDialog.Color;
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime,TrackEndDayPicker.DateTime);
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-1.0,TrackEndDayPicker.DateTime-1.0);
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-2.0,TrackEndDayPicker.DateTime-2.0);
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TEnforaMT3000TrackerBusinessModelControlPanel.bbGetCurrentPositionClick(Sender: TObject);
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

procedure TEnforaMT3000TrackerBusinessModelControlPanel.cbBatteryModuleIsExternalPowerClick(Sender: TObject);
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
