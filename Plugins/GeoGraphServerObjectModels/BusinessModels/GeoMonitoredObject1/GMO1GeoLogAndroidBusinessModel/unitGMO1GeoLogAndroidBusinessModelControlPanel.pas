unit unitGMO1GeoLogAndroidBusinessModelControlPanel;

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
  unitGeoMonitoredObject1Model, unitGMO1GeoLogAndroidBusinessModel, StdCtrls, ExtCtrls, Buttons, ComCtrls,
  Menus;

type
  TGMO1GeoLogAndroidBusinessModelControlPanel = class(TBusinessModelControlPanel)
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
    gbConnector: TGroupBox;
    gbBattery: TGroupBox;
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
    gbVideoRecorder: TGroupBox;
    cbVideoRecorderModuleActive: TCheckBox;
    cbVideoRecorderModuleRecording: TCheckBox;
    btnVideoRecorderModulePlayer: TBitBtn;
    cbVideoRecorderModuleAudio: TCheckBox;
    cbVideoRecorderModuleVideo: TCheckBox;
    PopupMenu: TPopupMenu;
    properties1: TMenuItem;
    cbVideoRecorderModuleTransmitting: TCheckBox;
    cbVideoRecorderModuleSaving: TCheckBox;
    btnVideoRecorderModuleMeasurementsPanel: TBitBtn;
    btnVideoRecorderModuleMeasurementsControlPanel: TBitBtn;
    btnVideoRecorderModuleDiskMeasurementsPanel: TBitBtn;
    cbVideoRecorderModuleMode: TComboBox;
    Label9: TLabel;
    btnVideoRecorderModuleMeasurementsControlPanel_PopupMenu: TPopupMenu;
    Serverarchive1: TMenuItem;
    Devicearchive1: TMenuItem;
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
    procedure cbVideoRecorderModuleRecordingClick(Sender: TObject);
    procedure cbVideoRecorderModuleAudioClick(Sender: TObject);
    procedure cbVideoRecorderModuleVideoClick(Sender: TObject);
    procedure btnVideoRecorderModulePlayerClick(Sender: TObject);
    procedure cbVideoRecorderModuleActiveClick(Sender: TObject);
    procedure properties1Click(Sender: TObject);
    procedure cbVideoRecorderModuleTransmittingClick(Sender: TObject);
    procedure cbVideoRecorderModuleSavingClick(Sender: TObject);
    procedure btnVideoRecorderModuleMeasurementsPanelClick(
      Sender: TObject);
    procedure btnVideoRecorderModuleMeasurementsControlPanelClick(
      Sender: TObject);
    procedure btnVideoRecorderModuleDiskMeasurementsPanelClick(
      Sender: TObject);
    procedure cbVideoRecorderModuleModeChange(Sender: TObject);
    procedure Serverarchive1Click(Sender: TObject);
    procedure Devicearchive1Click(Sender: TObject);
  private
    { Private declarations }
    Model: TGMO1GeoLogAndroidBusinessModel;
    DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;
    TracksPanel: TForm;
    TracksPanel_ReflectorID: integer;
    VideoPlayer: TObject;
    MeasurementsPanel: TObject;

    procedure VideoPlayer_Restart();
    procedure VideoPlayer_Stop();
  public
    { Public declarations }
    Constructor Create(const pModel: TGMO1GeoLogAndroidBusinessModel);
    Destructor Destroy; override;
    procedure PostUpdate; override;
    procedure Update; override;
    procedure GetCurrentPosition();
    procedure AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
  end;


implementation
uses
  FileCtrl,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitGEOGraphServerController,
  unitGeoMonitoredObject1VideoRecorderVisor,
  unitGeoMonitoredObject1VideoRecorderMeasurementsControlPanel,
  unitGeoMonitoredObject1VideoRecorderMeasurementsPanel,
  unitGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel,
  unitGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel;

{$R *.dfm}


{TGMO1GeoLogAndroidBusinessModelControlPanel}
Constructor TGMO1GeoLogAndroidBusinessModelControlPanel.Create(const pModel: TGMO1GeoLogAndroidBusinessModel);
var
  I: TVideoRecorderModuleMode;
begin
Inherited Create(pModel);
Model:=pModel;
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(Model.GeoMonitoredObject1Model.ObjectDeviceSchema.RootComponent);
//.
TrackBeginDayPicker.DateTime:=Now;
TrackEndDayPicker.DateTime:=Now;
//.
cbVideoRecorderModuleMode.Items.BeginUpdate();
try
cbVideoRecorderModuleMode.Items.Clear();
for I:=Low(TVideoRecorderModuleMode) to High(TVideoRecorderModuleMode) do cbVideoRecorderModuleMode.Items.Add(VideoRecorderModuleModeStrings[I]);
finally
cbVideoRecorderModuleMode.Items.EndUpdate();
end;
//.
VideoPlayer:=nil;
MeasurementsPanel:=nil;
end;

Destructor TGMO1GeoLogAndroidBusinessModelControlPanel.Destroy;
begin
MeasurementsPanel.Free();
VideoPlayer.Free();
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
Inherited;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.PostUpdate;
begin
Inherited;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.Update;
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
Model.GeoMonitoredObject1Model.Lock.Enter();
try
if (DeviceRootComponent.VideoRecorderModule.Mode.Value.Value <= Integer(High(TVideoRecorderModuleMode))) then cbVideoRecorderModuleMode.ItemIndex:=DeviceRootComponent.VideoRecorderModule.Mode.Value.Value;
cbVideoRecorderModuleActive.Checked:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value;
cbVideoRecorderModuleRecording.Checked:=DeviceRootComponent.VideoRecorderModule.Recording.BoolValue.Value;
cbVideoRecorderModuleAudio.Checked:=DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value;
cbVideoRecorderModuleVideo.Checked:=DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value;
cbVideoRecorderModuleTransmitting.Checked:=DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value;
cbVideoRecorderModuleSaving.Checked:=DeviceRootComponent.VideoRecorderModule.Saving.BoolValue.Value;
btnVideoRecorderModulePlayer.Enabled:=DeviceRootComponent.VideoRecorderModule.Recording.BoolValue.Value AND DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value AND DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value;
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.GetCurrentPosition();
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.bbObjectModelClick(Sender: TObject);
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.properties1Click(Sender: TObject);
begin
bbObjectModelClick(nil);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbDisableObjectMovingClick(Sender: TObject);
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbDisableObjectClick(Sender: TObject);
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.UpdaterTimer(Sender: TObject);
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
lbConnectionLastCheckpointTime.Caption:='Last checkpoint time at: '+FormatDateTime('DD.MM.YY HH:NN:SS',TDateTime(Model.DeviceRootComponent.ConnectorModule.LastCheckpointTime.Value)+TimeZoneDelta);
//.
if ((TracksPanel <> nil) AND (ProxySpace___TypesSystem__Reflector_ID() <> TracksPanel_ReflectorID))
 then Update();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.stNewTrackColorClick(Sender: TObject);
begin
ColorDialog.Color:=stNewTrackColor.Color;
if (ColorDialog.Execute) then stNewTrackColor.Color:=ColorDialog.Color;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime,TrackEndDayPicker.DateTime);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-1.0,TrackEndDayPicker.DateTime-1.0);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-2.0,TrackEndDayPicker.DateTime-2.0);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.bbGetCurrentPositionClick(Sender: TObject);
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

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.VideoPlayer_Restart();
var
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
{$IFNDEF Plugin}
ServerAddress:=ProxySpace.SOAPServerURL;
UserName:=ProxySpace.UserName;
UserPassword:=ProxySpace.UserPassword;
{$ELSE}
ServerAddress:=ProxySpace_SOAPServerURL();
UserName:=ProxySpace_UserName();
UserPassword:=ProxySpace_UserPassword();
{$ENDIF}
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
Idx:=Pos('http://',ServerAddress);
if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
//.
FreeAndNil(VideoPlayer);
VideoPlayer:=TGeographServerObjectVideoPlayer.Create(ServerAddress,0,{default server port} UserName,UserPassword, Model.GeoMonitoredObject1Model);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.VideoPlayer_Stop();
begin
FreeAndNil(VideoPlayer);
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleActiveClick(Sender: TObject);
var
  SC: TCursor;
  V,LV: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleActive.Checked;
//.
LV:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue;
try
DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
try
DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('Video recorder is disabled'); //. =>
    else
      Raise; //. =>
    end;
  else
    Raise; //. =>
  end;
except
  DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=LV;
  Raise; //. =>
  end;
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
except
  flUpdating:=true;
  try
  cbVideoRecorderModuleActive.Checked:=false;
  finally
  flUpdating:=false;
  end;
  //.
  Raise; //. =>
  end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleModeChange(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedUInt16Data;
  BV: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
if (TVideoRecorderModuleMode(cbVideoRecorderModuleMode.ItemIndex) = VIDEORECORDERMODULEMODE_UNKNOWN) then Raise Exception.Create('wrong video-recorder mode'); //. =>
//.
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleMode.ItemIndex;
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Model.GeoMonitoredObject1Model.Lock.Enter();
try
DeviceRootComponent.VideoRecorderModule.Mode.Value:=V;
DeviceRootComponent.VideoRecorderModule.Mode.WriteDeviceCUAC();
//.
case TVideoRecorderModuleMode(V.Value) of
VIDEORECORDERMODULEMODE_H264STREAM1_AMRNBSTREAM1: begin
  if (NOT DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=true;
    //.
    DeviceRootComponent.VideoRecorderModule.Audio.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Audio.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleAudio.Checked:=true;
    finally
    flUpdating:=false;
    end;
    end;
  if (DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=false;
    //.
    DeviceRootComponent.VideoRecorderModule.Video.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Video.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleVideo.Checked:=false;
    finally
    flUpdating:=false;
    end;
    end;
  if (NOT DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=true;
    //.
    DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Transmitting.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleTransmitting.Checked:=true;
    finally
    flUpdating:=false;
    end;
    end;
  end;
VIDEORECORDERMODULEMODE_MODE_MPEG4,
VIDEORECORDERMODULEMODE_MODE_3GP: begin
  if (NOT DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=true;
    //.
    DeviceRootComponent.VideoRecorderModule.Audio.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Audio.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleAudio.Checked:=true;
    finally
    flUpdating:=false;
    end;
    end;
  if (NOT DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=true;
    //.
    DeviceRootComponent.VideoRecorderModule.Video.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Video.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleVideo.Checked:=true;
    finally
    flUpdating:=false;
    end;
    end;
  if (NOT DeviceRootComponent.VideoRecorderModule.Saving.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=true;
    //.
    DeviceRootComponent.VideoRecorderModule.Saving.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Saving.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleSaving.Checked:=true;
    finally
    flUpdating:=false;
    end;
    end;
  if (DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value)
   then begin
    BV.Timestamp:=Now-TimeZoneDelta;
    BV.Value:=false;
    //.
    DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue:=BV;
    DeviceRootComponent.VideoRecorderModule.Transmitting.WriteDeviceCUAC();
    //.
    flUpdating:=true;
    try
    cbVideoRecorderModuleTransmitting.Checked:=false;
    finally
    flUpdating:=false;
    end;
    end;
  end;
end;
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleRecordingClick(Sender: TObject);
var
  SC: TCursor;
  flRecording: boolean;
  V,BV,LV: TComponentTimestampedBooleanData;
  flTransmitting: boolean;
begin
if (flUpdating) then Exit; //. ->
flRecording:=cbVideoRecorderModuleRecording.Checked;
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=flRecording;
//.
if (flRecording)
 then begin
  if (TVideoRecorderModuleMode(DeviceRootComponent.VideoRecorderModule.Mode.Value.Value) = VIDEORECORDERMODULEMODE_MODE_MPEG4)
   then begin
    if (NOT DeviceRootComponent.VideoRecorderModule.Saving.BoolValue.Value)
     then begin
      BV.Timestamp:=Now-TimeZoneDelta;
      BV.Value:=true;
      //.
      DeviceRootComponent.VideoRecorderModule.Saving.BoolValue:=BV;
      DeviceRootComponent.VideoRecorderModule.Saving.WriteDeviceCUAC();
      end;
    //.
    if (DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value)
     then begin
      BV.Timestamp:=Now-TimeZoneDelta;
      BV.Value:=false;
      //.
      DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue:=BV;
      DeviceRootComponent.VideoRecorderModule.Transmitting.WriteDeviceCUAC();
      end;
    end;
  //.
  if (NOT DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value)
   then begin
    LV:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue;
    try
    DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
    try
    DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
    except
      on E: OperationException do
        case E.Code of
        -1000001: Raise Exception.Create('Video recorder is disabled'); //. =>
        else
          Raise; //. =>
        end;
      else
        Raise; //. =>
      end;
    except
      DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=LV;
      Raise; //. =>
      end;
    end;
  end;
//.
DeviceRootComponent.VideoRecorderModule.Recording.BoolValue:=V;
DeviceRootComponent.VideoRecorderModule.Recording.WriteDeviceCUAC();
//.
if (NOT flRecording)
 then begin
  if (DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value)
   then begin
    DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
    DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
    end;
  end
 else flTransmitting:=DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value;
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
//.
flUpdating:=true;
try
cbVideoRecorderModuleActive.Checked:=flRecording;
finally
flUpdating:=false;
end;
btnVideoRecorderModulePlayer.Enabled:=cbVideoRecorderModuleRecording.Checked AND cbVideoRecorderModuleActive.Checked AND cbVideoRecorderModuleTransmitting.Checked;
except
  flUpdating:=true;
  try
  cbVideoRecorderModuleRecording.Checked:=false;
  finally
  flUpdating:=false;
  end;
  //.
  Raise; //. =>
  end;
//.
if (flRecording AND flTransmitting)
 then VideoPlayer_Restart()
 else VideoPlayer_Stop();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleTransmittingClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleTransmitting.Checked;
DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Transmitting.WriteDeviceCUAC();
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleSavingClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleSaving.Checked;
DeviceRootComponent.VideoRecorderModule.Saving.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Saving.WriteDeviceCUAC();
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleAudioClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleAudio.Checked;
DeviceRootComponent.VideoRecorderModule.Audio.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Audio.WriteDeviceCUAC();
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
if (VideoPlayer <> nil) then VideoPlayer_Restart();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.cbVideoRecorderModuleVideoClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.GeoMonitoredObject1Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleVideo.Checked;
DeviceRootComponent.VideoRecorderModule.Video.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Video.WriteDeviceCUAC();
finally
Model.GeoMonitoredObject1Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
if (VideoPlayer <> nil) then VideoPlayer_Restart();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.btnVideoRecorderModulePlayerClick(Sender: TObject);
begin
VideoPlayer_Restart();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.btnVideoRecorderModuleMeasurementsPanelClick(Sender: TObject);
var
  SC: TCursor;
begin
FreeAndNil(MeasurementsPanel);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
MeasurementsPanel:=TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Create(Model.GeoMonitoredObject1Model);
finally
Screen.Cursor:=SC;
end;
TGeoMonitoredObject1VideoRecorderMeasurementsPanel(MeasurementsPanel).Show();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.btnVideoRecorderModuleMeasurementsControlPanelClick(Sender: TObject);
var
  SC: TCursor;
  DataServer: string;
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
FreeAndNil(MeasurementsPanel);
//.
DataServer:=DeviceRootComponent.VideoRecorderModule.SavingServer.Value.Value;
if (DataServer = ',0')
 then begin
  {$IFNDEF Plugin}
  ServerAddress:=ProxySpace.SOAPServerURL;
  UserName:=ProxySpace.UserName;
  UserPassword:=ProxySpace.UserPassword;
  {$ELSE}
  ServerAddress:=ProxySpace_SOAPServerURL();
  UserName:=ProxySpace_UserName();
  UserPassword:=ProxySpace_UserPassword();
  {$ENDIF}
  SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
  Idx:=Pos('http://',ServerAddress);
  if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
  //.
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  MeasurementsPanel:=TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.Create(Model.GeoMonitoredObject1Model,  ServerAddress,0,{default server port} UserName,UserPassword, Model.GeoMonitoredObject1Model.ObjectController.idGeoGraphServerObject);
  finally
  Screen.Cursor:=SC;
  end;
  TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel(MeasurementsPanel).Show();
  end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.Devicearchive1Click(Sender: TObject);
var
  SC: TCursor;
begin
FreeAndNil(MeasurementsPanel);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
MeasurementsPanel:=TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Create(Model.GeoMonitoredObject1Model);
finally
Screen.Cursor:=SC;
end;
TGeoMonitoredObject1VideoRecorderMeasurementsPanel(MeasurementsPanel).Show();
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.Serverarchive1Click(Sender: TObject);
var
  SC: TCursor;
  DataServer: string;
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
FreeAndNil(MeasurementsPanel);
//.
DataServer:=DeviceRootComponent.VideoRecorderModule.SavingServer.Value.Value;
if (DataServer = ',0')
 then begin
  {$IFNDEF Plugin}
  ServerAddress:=ProxySpace.SOAPServerURL;
  UserName:=ProxySpace.UserName;
  UserPassword:=ProxySpace.UserPassword;
  {$ELSE}
  ServerAddress:=ProxySpace_SOAPServerURL();
  UserName:=ProxySpace_UserName();
  UserPassword:=ProxySpace_UserPassword();
  {$ENDIF}
  SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
  Idx:=Pos('http://',ServerAddress);
  if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
  //.
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  MeasurementsPanel:=TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Create(ServerAddress,0,{default server port} UserName,UserPassword, Model.GeoMonitoredObject1Model.ObjectController.idGeoGraphServerObject);
  finally
  Screen.Cursor:=SC;
  end;
  TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel(MeasurementsPanel).Show();
  end;
end;

procedure TGMO1GeoLogAndroidBusinessModelControlPanel.btnVideoRecorderModuleDiskMeasurementsPanelClick(Sender: TObject);
var
  LD: string;
  MeasurementDatabaseFolder: string;
  SC: TCursor;
begin
FreeAndNil(MeasurementsPanel);
//.
LD:=GetCurrentDir();
try
if (NOT SelectDirectory('Select database path ->','',MeasurementDatabaseFolder)) then Exit; //. ->
finally
SetCurrentDir(LD);
end;
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
MeasurementsPanel:=TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Create(MeasurementDatabaseFolder,Model.GeoMonitoredObject1Model.ObjectController.idGeoGraphServerObject);
finally
Screen.Cursor:=SC;
end;
TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel(MeasurementsPanel).Show();
end;


end.
