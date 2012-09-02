unit unitGMOGeoLogAndroidBusinessModelControlPanel;

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
  unitGMOGeoLogAndroidBusinessModel, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TGMOGeoLogAndroidBusinessModelControlPanel = class(TBusinessModelControlPanel)
    pnlHeader: TPanel;
    lbConnectionStatus: TLabel;
    stConnectionStatus: TStaticText;
    lbConnectionLastCheckpointTime: TLabel;
    bbObjectModel: TBitBtn;
    Updater: TTimer;
    gbIncoming: TGroupBox;
    Label1: TLabel;
    edAlert: TEdit;
    gbOutgoing: TGroupBox;
    cbDisableObjectMoving: TCheckBox;
    cbDisableObject: TCheckBox;
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
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edConnectionServiceProviderAccount: TEdit;
    Label6: TLabel;
    edBatteryVoltage: TEdit;
    Label7: TLabel;
    edBatteryCharge: TEdit;
    bbGetCurrentPosition: TBitBtn;
    Label8: TLabel;
    edConnectionServiceProviderSignal: TEdit;
    TrackBeginDayPicker: TDateTimePicker;
    Label3: TLabel;
    TrackEndDayPicker: TDateTimePicker;
    bbAddDayTrackToTheCurrentReflectorM1: TBitBtn;
    bbAddDayTrackToTheCurrentReflectorM2: TBitBtn;
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
  private
    { Private declarations }
    Model: TGMOGeoLogAndroidBusinessModel;
    TracksPanel: TForm;
    TracksPanel_ReflectorID: integer;
  public
    { Public declarations }
    Constructor Create(const pModel: TGMOGeoLogAndroidBusinessModel);
    Destructor Destroy; override;
    procedure PostUpdate; override;
    procedure Update; override;
    procedure GetCurrentPosition();
    procedure AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
  end;


implementation
uses
  GlobalSpaceDefines,
  FunctionalityImport,
  unitGeoMonitoredObjectModel;

{$R *.dfm}


{TGMOGeoLogAndroidBusinessModelControlPanel}
Constructor TGMOGeoLogAndroidBusinessModelControlPanel.Create(const pModel: TGMOGeoLogAndroidBusinessModel);
begin
Inherited Create(pModel);
Model:=pModel;
//.
TrackBeginDayPicker.DateTime:=Now;
TrackEndDayPicker.DateTime:=Now;
end;

Destructor TGMOGeoLogAndroidBusinessModelControlPanel.Destroy;
begin
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
Inherited;
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.PostUpdate;
begin
Inherited;
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.Update;
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
edAlert.Text:=TrackLoggerAlertSeverityStrings[Model.AlertSeverity];
edAlert.Color:=TrackLoggerAlertSeverityColors[Model.AlertSeverity];
//. out
cbDisableObjectMoving.Checked:=Model.DisableObjectMoving;
cbDisableObject.Checked:=Model.DisableObject;
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.GetCurrentPosition();
var
  ptrObj: TPtr;
  Visualization: TObjectDescriptor;
begin
if (NOT Model.ObjectModel.IsObjectOnline) then Raise Exception.Create('Cannot get current position: object is offline'); //. =>
//. read device gps fix
Model.DeviceRootComponent.GPSModule.GPSFixData.ReadDevice();
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.bbObjectModelClick(Sender: TObject);
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.cbDisableObjectMovingClick(Sender: TObject);
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.cbDisableObjectClick(Sender: TObject);
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.UpdaterTimer(Sender: TObject);
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

procedure TGMOGeoLogAndroidBusinessModelControlPanel.stNewTrackColorClick(Sender: TObject);
begin
ColorDialog.Color:=stNewTrackColor.Color;
if (ColorDialog.Execute) then stNewTrackColor.Color:=ColorDialog.Color;
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime,TrackEndDayPicker.DateTime);
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-1.0,TrackEndDayPicker.DateTime-1.0);
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-2.0,TrackEndDayPicker.DateTime-2.0);
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TGMOGeoLogAndroidBusinessModelControlPanel.bbGetCurrentPositionClick(Sender: TObject);
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


end.
