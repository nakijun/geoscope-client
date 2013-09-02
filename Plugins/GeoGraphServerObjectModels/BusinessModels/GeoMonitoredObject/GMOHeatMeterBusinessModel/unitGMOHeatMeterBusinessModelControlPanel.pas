unit unitGMOHeatMeterBusinessModelControlPanel;

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
  unitGMOHeatMeterBusinessModel, StdCtrls, ExtCtrls, Buttons, ComCtrls;

type
  TGMOHeatMeterBusinessModelControlPanel = class(TBusinessModelControlPanel)
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
    TrackBeginDayPicker: TDateTimePicker;
    bbAddDayTrackToTheCurrentReflector: TBitBtn;
    stNewTrackColor: TStaticText;
    ColorDialog: TColorDialog;
    stChangeNewTrackColor: TSpeedButton;
    Label4: TLabel;
    stDayTracksTableOrigin: TStaticText;
    cbAddObjectModelTrackEvents: TCheckBox;
    cbAddBusinessModelTrackEvents: TCheckBox;
    gbConnection: TGroupBox;
    gbBattery: TGroupBox;
    Label5: TLabel;
    edConnectionServiceProviderAccount: TEdit;
    Label6: TLabel;
    edBatteryVoltage: TEdit;
    Label7: TLabel;
    edBatteryCharge: TEdit;
    bbGetCurrentPosition: TBitBtn;
    TrackEndDayPicker: TDateTimePicker;
    Label8: TLabel;
    StressTester: TTimer;
    bbAddDayTrackToTheCurrentReflectorM1: TBitBtn;
    bbAddDayTrackToTheCurrentReflectorM2: TBitBtn;
    GroupBox1: TGroupBox;
    lvTelemetryModelChannels: TListView;
    btnShowTelemetryModelAnalysis: TBitBtn;
    AnalysisBeginDayPicker: TDateTimePicker;
    Label3: TLabel;
    AnalysisEndDayPicker: TDateTimePicker;
    Label9: TLabel;
    edModel: TEdit;
    Label10: TLabel;
    edSerialNumber: TEdit;
    Label11: TLabel;
    edObject: TEdit;
    Label12: TLabel;
    edLifeTime: TEdit;
    Label13: TLabel;
    edAlgorithm: TEdit;
    procedure UpdaterTimer(Sender: TObject);
    procedure cbDisableObjectMovingClick(Sender: TObject);
    procedure cbDisableObjectClick(Sender: TObject);
    procedure bbObjectModelClick(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
    procedure stNewTrackColorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbGetCurrentPositionClick(Sender: TObject);
    procedure StressTesterTimer(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
    procedure bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
    procedure btnShowTelemetryModelAnalysisClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGMOHeatMeterBusinessModel;
    TracksPanel: TForm;
    TracksPanel_ReflectorID: integer;

    procedure TelemetryModel_Update();
  public
    { Public declarations }
    Constructor Create(const pModel: TGMOHeatMeterBusinessModel);
    Destructor Destroy; override;
    procedure PostUpdate; override;
    procedure Update; override;
    procedure GetCurrentPosition();
    procedure AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
  end;


implementation
uses
  MSXML,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitGeoMonitoredObjectModel,
  unitGMOHeatMeterBusinessModelAnalysisPanel;

{$R *.dfm}


{TGMOHeatMeterBusinessModelControlPanel}
Constructor TGMOHeatMeterBusinessModelControlPanel.Create(const pModel: TGMOHeatMeterBusinessModel);
begin
Inherited Create(pModel);
Model:=pModel;
//.
TrackBeginDayPicker.DateTime:=Now;
TrackEndDayPicker.DateTime:=Now;
//.
AnalysisBeginDayPicker.DateTime:=Now;
AnalysisEndDayPicker.DateTime:=Now;
end;

Destructor TGMOHeatMeterBusinessModelControlPanel.Destroy;
begin
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(TracksPanel);
Inherited;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.PostUpdate;
begin
Inherited;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.Update;
var
  flUpdatingOld: boolean;
  PA,BV: integer;
begin
flUpdatingOld:=flUpdating;
try
flUpdating:=true;
//.
PA:=Model.DeviceConnectionServiceProviderAccount;
if ((PA <> 0) OR Model.ObjectModel.IsObjectOnline())
 then begin
  gbConnection.Caption:=' Connector ';
  gbConnection.Color:=clBtnFace;
  edConnectionServiceProviderAccount.Color:=clWindow;
  end
 else begin
  gbConnection.Caption:=' Account is Low !!! ';
  gbConnection.Color:=clRed;
  edConnectionServiceProviderAccount.Color:=clRed;
  end;
edConnectionServiceProviderAccount.Text:=IntToStr(PA);
//.
BV:=Model.DeviceBatteryVoltage;
if ((BV <> 0) OR Model.ObjectModel.IsObjectOnline())
 then begin
  gbBattery.Caption:=' Battery ';
  gbBattery.Color:=clBtnFace;
  edBatteryVoltage.Color:=clWindow;
  edBatteryCharge.Color:=clWindow;
  end
 else begin
  gbBattery.Caption:=' Battery is Low !!! ';
  gbBattery.Color:=clRed;
  edBatteryVoltage.Color:=clRed;
  edBatteryCharge.Color:=clRed;
  end;
edBatteryVoltage.Text:=IntToStr(BV);
//.
edBatteryCharge.Text:=IntToStr(Model.DeviceBatteryCharge)+' %';
//. in
edAlert.Text:=TrackLoggerAlertSeverityStrings[Model.AlertSeverity];
edAlert.Color:=TrackLoggerAlertSeverityColors[Model.AlertSeverity];
//. out
cbDisableObjectMoving.Checked:=Model.DisableObjectMoving;
cbDisableObject.Checked:=Model.DisableObject;
//.
TelemetryModel_Update();
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

procedure TGMOHeatMeterBusinessModelControlPanel.GetCurrentPosition();
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

procedure TGMOHeatMeterBusinessModelControlPanel.TelemetryModel_Update();
var
  XML: IXMLDOMDocument;
  XMLString: WideString;
  RootNode: IXMLDOMNode;
  DataNode: IXMLDOMNode;
  Node: IXMLDOMNode;
  ChannelsNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ItemsNode: IXMLDOMNode;
  ChannelNode: IXMLDOMNode;
  I: integer;
  RCS: string;
  RC: integer;
  P,T: integer;
  MassFlow,Heat: string;
  S: string;
  flGcal: boolean;
begin
XMLString:=Model.DeviceRootComponent.TelemetryModule.TelemetryModel.Value.Value;
if (Length(XMLString) = 0) then Exit; //. ->
XML:=CoDOMDocument.Create();
XML.Set_Async(false);
XML.loadXML(XMLString);
RootNode:=XML.documentElement;
//.
flGcal:=true;
//.
VersionNode:=RootNode.selectSingleNode('Version');
Version:=0;
if (VersionNode <> nil) then Version:=VersionNode.nodeTypedValue;
case (Version) of
1: begin
  DataNode:=RootNode.selectSingleNode('Data');
  //.
  Node:=DataNode.selectSingleNode('HWVersion');
  edModel.Text:=IntToStr(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('ID');
  edSerialNumber.Text:=IntToStr(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('ObjectID');
  edObject.Text:=Trim(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('LifeTime');
  edLifeTime.Text:=Trim(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('AlgorithmID');
  edAlgorithm.Text:=IntToStr(Node.nodeTypedValue);
  flGcal:=(DataNode.selectSingleNode('CalculationID').nodeTypedValue = 156);
  end;
end;
//.
lvTelemetryModelChannels.Items.BeginUpdate();
try
lvTelemetryModelChannels.Items.Clear();
ChannelsNode:=RootNode.selectSingleNode('Channels');
VersionNode:=ChannelsNode.selectSingleNode('Version');
Version:=0;
if (VersionNode <> nil) then Version:=VersionNode.nodeTypedValue;
case (Version) of
1: begin
  ItemsNode:=ChannelsNode.selectSingleNode('Items');
  for I:=0 to 5 do begin
    ChannelNode:=ItemsNode.childNodes[I];
    with lvTelemetryModelChannels.Items.Add do begin
    Caption:=IntToStr(I+1);
    //.
    RCS:=ChannelNode.selectSingleNode('RC').nodeTypedValue;
    if (RCS = 'NET')
     then RC:=ChannelCode_NoChannel
     else
      if (RCS = 'NO')
       then RC:=ChannelCode_NoChannelData
       else RC:=StrToInt(RCS);
    SubItems.Add(ConvertChannelCodeToString(RC));
    //.
    if (RC <> ChannelCode_NoChannel)
     then begin
      //.
      Node:=ChannelNode.selectSingleNode('Pressure');
      if (Node <> nil)
       then begin
        P:=Node.nodeTypedValue;
        SubItems.Add(FormatFloat('0.0',P/100.0));
        end
       else SubItems.Add('?');
      //.
      Node:=ChannelNode.selectSingleNode('Temperature');
      if (Node <> nil)
       then begin
        T:=Node.nodeTypedValue;
        SubItems.Add(FormatFloat('0.0',T/100.0));
        end
       else SubItems.Add('?');
      //.
      Node:=ChannelNode.selectSingleNode('MassFlow');
      if (Node <> nil)
       then begin
        MassFlow:=Node.nodeTypedValue;
        SubItems.Add(MassFlow);
        end
       else SubItems.Add('?');
      //.
      Node:=ChannelNode.selectSingleNode('Heat');
      if (Node <> nil)
       then begin
        Heat:=Node.nodeTypedValue;
        if (flGcal)
         then SubItems.Add(Heat+' GCal/h')
         else SubItems.Add(Heat+' GJ/h');
        end
       else SubItems.Add('?');
      end
     else begin
      SubItems.Add('--');
      SubItems.Add('--');
      SubItems.Add('--');
      SubItems.Add('--');
      end;
    end;
    end;
  end;
end;
finally
lvTelemetryModelChannels.Items.EndUpdate();
end;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.btnShowTelemetryModelAnalysisClick(Sender: TObject);
var
  DaysCount: integer;
  AnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel;
begin
DaysCount:=Trunc(AnalysisEndDayPicker.DateTime)-Trunc(AnalysisBeginDayPicker.DateTime)+1;
if (DaysCount < 1) then Raise Exception.Create('invalid date interval'); //. =>
ProxySpace__Log_OperationStarting('loading data from the server ...');
try
AnalysisPanel:=TGMOHeatMeterBusinessModelAnalysisPanel.Create(Model, AnalysisBeginDayPicker.DateTime-TimeZoneDelta,DaysCount);
finally
ProxySpace__Log_OperationDone();
end;
try
AnalysisPanel.ShowModal();
finally
AnalysisPanel.Destroy();
end;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.AddDayTrackToTheCurrentReflector(const BeginDate,EndDate: TDateTime);
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
///-
///- StressTester.Enabled:=true;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.bbObjectModelClick(Sender: TObject);
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

procedure TGMOHeatMeterBusinessModelControlPanel.cbDisableObjectMovingClick(Sender: TObject);
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

procedure TGMOHeatMeterBusinessModelControlPanel.cbDisableObjectClick(Sender: TObject);
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

procedure TGMOHeatMeterBusinessModelControlPanel.UpdaterTimer(Sender: TObject);
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

procedure TGMOHeatMeterBusinessModelControlPanel.stNewTrackColorClick(Sender: TObject);
begin
ColorDialog.Color:=stNewTrackColor.Color;
if (ColorDialog.Execute) then stNewTrackColor.Color:=ColorDialog.Color;
end;

procedure TGMOHeatMeterBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorClick(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime,TrackEndDayPicker.DateTime);
end;

procedure TGMOHeatMeterBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM1Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-1.0,TrackEndDayPicker.DateTime-1.0);
end;

procedure TGMOHeatMeterBusinessModelControlPanel.bbAddDayTrackToTheCurrentReflectorM2Click(Sender: TObject);
begin
AddDayTrackToTheCurrentReflector(TrackBeginDayPicker.DateTime-2.0,TrackEndDayPicker.DateTime-2.0);
end;

procedure TGMOHeatMeterBusinessModelControlPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TGMOHeatMeterBusinessModelControlPanel.bbGetCurrentPositionClick(Sender: TObject);
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

procedure TGMOHeatMeterBusinessModelControlPanel.StressTesterTimer(Sender: TObject);
begin
bbAddDayTrackToTheCurrentReflector.Click();
end;


end.
