unit unitGMOHeatMeterBusinessModelCustomControlPanel;

interface

uses
  Windows, Messages, SysUtils, ActiveX, Variants, Classes, SyncObjs, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Gauges, Buttons,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitCoGeoMonitorObjectFunctionality,
  unitGEOGraphServerController,
  unitObjectModel,
  unitGeoMonitoredObjectModel,
  unitBusinessModel,
  unitGMOHeatMeterBusinessModel, ComCtrls;

const
  WM_UPDATECONTROLPANEL = WM_USER+1;

type
  TGMOHeatMeterBusinessModelCustomControlPanel = class;

  TObjectModelsUpdating = class(TThread)
  private
    Panel: TGMOHeatMeterBusinessModelCustomControlPanel;
    idCoComponent: integer;
    //.
    StageCount: integer;
    Stage: integer;
    //.
    ServerObjectController: TGEOGraphServerObjectController;
    ObjectModel: TObjectModel;
    ObjectBusinessModel: TBusinessModel;
    //.
    ThreadException: Exception;

    Constructor Create(const pPanel: TGMOHeatMeterBusinessModelCustomControlPanel);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure SetModels();
    procedure SetNullModels();
    procedure UpdatePanel();
    procedure CreatePanelUpdater();
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    procedure DoOnStage();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
  end;

  TGMOHeatMeterBusinessModelCustomControlPanel = class(TBusinessModelCustomControlPanel)
    pnlIndicators: TPanel;
    Panel1: TPanel;
    pnlLeft: TPanel;
    pnlAudioVideo: TPanel;
    sbLockPanel: TSpeedButton;
    sbPropsPanel: TSpeedButton;
    pnlTools: TPanel;
    pnlSignalValue: TPanel;
    imgSignalValue0: TImage;
    imgSignalValue1: TImage;
    imgSignalValue2: TImage;
    imgSignalValue3: TImage;
    imgSignalValue4: TImage;
    imgSignalValue5: TImage;
    pnlBatteryCharge: TPanel;
    imgBatteryCharge0: TImage;
    imgBatteryCharge1: TImage;
    imgBatteryCharge2: TImage;
    imgBatteryCharge3: TImage;
    imgBatteryCharge4: TImage;
    imgBatteryCharge5: TImage;
    imgBatteryCharge6: TImage;
    imgBatteryCharge7: TImage;
    imgBatteryCharge8: TImage;
    imgBatteryCharge9: TImage;
    imgBatteryCharge10: TImage;
    imgBatteryCharge11: TImage;
    imgBatteryCharge12: TImage;
    imgBatteryCharge13: TImage;
    imgBatteryCharge14: TImage;
    imgBatteryCharge15: TImage;
    imgBatteryCharge16: TImage;
    imgBatteryCharge17: TImage;
    imgBatteryCharge18: TImage;
    imgBatteryCharge19: TImage;
    lbBatteryCharge: TLabel;
    GroupBox1: TGroupBox;
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
    GroupBox2: TGroupBox;
    lvTelemetryModelChannels: TListView;
    AnalysisBeginDayPicker: TDateTimePicker;
    Label3: TLabel;
    AnalysisEndDayPicker: TDateTimePicker;
    btnShowTelemetryModelAnalysis: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPropsPanelClick(Sender: TObject);
    procedure btnShowTelemetryModelAnalysisClick(Sender: TObject);
  private
    { Private declarations }
    idCoComponent: integer;
    //.
    ServerObjectController: TGEOGraphServerObjectController;
    ObjectModelLock: TCriticalSection;
    ObjectModel: TObjectModel;
    ObjectBusinessModel: TGMOHeatMeterBusinessModel;
    VideoRecorderModule_flRecordingOld: boolean;
    VideoRecorderModule_flActiveOld: boolean;
    //.
    ObjectModelsUpdating: TObjectModelsUpdating;
    //.
    Updater: TComponentPresentUpdater;
    flUpdating: boolean;

    procedure wmUPDATECONTROLPANEL(var Message: TMessage); message WM_UPDATECONTROLPANEL;
    procedure GetCurrentLocation();
    procedure TelemetryModel_Update();
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer);
    Destructor Destroy(); override;
    procedure PostUpdate();
    procedure Update(); reintroduce;
  end;


implementation
uses
  MSXML,
  TypesDefines,
  unitCoComponentRepresentations,
  unitCoGeoMonitorObjectPanelProps,
  unitGMOHeatMeterBusinessModelAnalysisPanel;

{$R *.dfm}


{TObjectModelsUpdating}
Constructor TObjectModelsUpdating.Create(const pPanel: TGMOHeatMeterBusinessModelCustomControlPanel);
begin
Panel:=pPanel;
idCoComponent:=Panel.idCoComponent;
//.
StageCount:=3;
//.
Inherited Create(false);
end;

Destructor TObjectModelsUpdating.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Cancel();
Inherited;
end;

procedure TObjectModelsUpdating.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TObjectModelsUpdating.Execute();
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  DeviceRootComponent: TGeoMonitoredObjectDeviceComponent;
  BV: TComponentTimestampedBooleanData;
  flSet: boolean;
begin
try
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
Stage:=0; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
Stage:=1; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release;
end;
Stage:=2; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
if ((NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) OR ((_ObjectType = 0) OR (_BusinessModel = 0)))
 then begin
  Synchronize(SetNullModels);
  //.
  Synchronize(UpdatePanel);
  //.
  Exit; //. ->
  end;
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController);
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
Stage:=3; Synchronize(DoOnStage);
if (Terminated)
 then begin
  FreeAndNil(ObjectBusinessModel);
  FreeAndNil(ObjectModel);
  FreeAndNil(ServerObjectController);
  //.
  Exit; //. ->
  end;
//.
Synchronize(SetModels);
//.
Synchronize(UpdatePanel);
//.
Synchronize(CreatePanelUpdater);
finally
Release;
end;
finally
CoUnInitialize();
end;
except
  on E: Exception do begin
    FreeAndNil(ObjectBusinessModel);
    FreeAndNil(ObjectModel);
    FreeAndNil(ServerObjectController);
    //.
    if (E is EAbort)
     then ThreadException:=EAbort.Create(E.Message)
     else ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TObjectModelsUpdating.SetModels();
var
  CP: TBusinessModelControlPanel;
begin
if (Terminated) then Exit; //. ->
//.
Panel.ObjectModelLock.Enter();
try
FreeAndNil(Panel.ObjectBusinessModel);
FreeAndNil(Panel.ObjectModel);
finally
Panel.ObjectModelLock.Leave();
end;
FreeAndNil(Panel.ServerObjectController);
//.
Panel.ServerObjectController:=ServerObjectController;
Panel.ObjectModelLock.Enter();
try
Panel.ObjectModel:=ObjectModel;
Panel.ObjectBusinessModel:=TGMOHeatMeterBusinessModel(ObjectBusinessModel);
finally
Panel.ObjectModelLock.Leave();
end;
end;

procedure TObjectModelsUpdating.SetNullModels();
begin
if (Terminated) then Exit; //. ->
//.
Panel.ObjectModelLock.Enter();
try
FreeAndNil(Panel.ObjectBusinessModel);
FreeAndNil(Panel.ObjectModel);
finally
Panel.ObjectModelLock.Leave();
end;
FreeAndNil(Panel.ServerObjectController);
end;

procedure TObjectModelsUpdating.UpdatePanel();
begin
if (Terminated) then Exit; //. ->
//.
Panel.Update();
end;

procedure TObjectModelsUpdating.CreatePanelUpdater();
begin
if (Terminated) then Exit; //. ->
//.
if ((Panel.Updater = nil) AND (Panel.ServerObjectController <> nil)) then Panel.Updater:=TComponentPresentUpdater_Create(idTGeoGraphServerObject,Panel.ServerObjectController.idGeoGraphServerObject, Panel.PostUpdate,Panel.Close);
end;

procedure TObjectModelsUpdating.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TObjectModelsUpdating.DoOnStage();
begin
if (Terminated) then Exit; //. ->
//.
Panel.Caption:='Updating... '+IntToStr(Trunc(100*Stage/StageCount))+' %';
end;

procedure TObjectModelsUpdating.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
if (NOT (ThreadException is EAbort)) then Application.MessageBox(PChar('error while updating object models, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TObjectModelsUpdating.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TObjectModelsUpdating.Finalize();
begin
if (Panel = nil) then Exit; //. ->
//.
if (Panel.ObjectModelsUpdating = Self) then Panel.ObjectModelsUpdating:=nil;
end;

procedure TObjectModelsUpdating.Cancel();
begin
Terminate();
end;


{TGMO1RescueDogBusinessModelCustomControlPanel}
Constructor TGMOHeatMeterBusinessModelCustomControlPanel.Create(const pidCoComponent: integer);
begin
Inherited Create(nil);
idCoComponent:=pidCoComponent;
//.
AnalysisBeginDayPicker.DateTime:=Now;
AnalysisEndDayPicker.DateTime:=Now;
//.
ObjectModelLock:=TCriticalSection.Create();
//.
ObjectModelsUpdating:=TObjectModelsUpdating.Create(Self);
end;

Destructor TGMOHeatMeterBusinessModelCustomControlPanel.Destroy();
begin
Updater.Free();
//.
if (ObjectModelsUpdating <> nil)
 then begin
  ObjectModelsUpdating.Cancel();
  ObjectModelsUpdating.Panel:=nil;
  if (unitCoComponentRepresentations.flFinalizing) then ObjectModelsUpdating.ForceDestroy();
  ObjectModelsUpdating:=nil;
  end;
//.
ObjectModelLock.Free();
//.
Inherited;
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.PostUpdate();
var
  WM: TMessage;
begin
ObjectModelLock.Enter();
try
if (ObjectModel = nil) then Exit; //. ->
//. prepare object schema side
ObjectModel.ObjectSchema.RootComponent.LoadAll();
//. prepare object device schema side
ObjectModel.ObjectDeviceSchema.RootComponent.LoadAll();
finally
ObjectModelLock.Leave();
end;
//.
if (GetCurrentThreadID = MainThreadID) then wmUPDATECONTROLPANEL(WM) else PostMessage(Handle, WM_UPDATECONTROLPANEL,0,0);
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.Update();
var
  DeviceRootComponent: TGeoMonitoredObjectDeviceComponent;
  IV: integer;
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
  Bearing: double;
begin
flUpdating:=true;
try
Caption:='Control Panel';
//.
if (ObjectModel = nil) then Exit; //. ->
ObjectModel.Lock.Enter();
try
DeviceRootComponent:=TGeoMonitoredObjectDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
IV:=50; ///? DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value;
imgSignalValue0.Hide();
imgSignalValue1.Hide();
imgSignalValue2.Hide();
imgSignalValue3.Hide();
imgSignalValue4.Hide();
imgSignalValue5.Hide();
case (Round(IV/20.0)) of
0: imgSignalValue0.Show();
1: imgSignalValue1.Show();
2: imgSignalValue2.Show();
3: imgSignalValue3.Show();
4: imgSignalValue4.Show();
5: imgSignalValue5.Show();
else
  imgSignalValue5.Show();
end;
pnlSignalValue.Show();
//.
IV:=100; ///? DeviceRootComponent.BatteryModule.Charge.Value;
imgBatteryCharge0.Hide();
imgBatteryCharge1.Hide();
imgBatteryCharge2.Hide();
imgBatteryCharge3.Hide();
imgBatteryCharge4.Hide();
imgBatteryCharge5.Hide();
imgBatteryCharge6.Hide();
imgBatteryCharge7.Hide();
imgBatteryCharge8.Hide();
imgBatteryCharge9.Hide();
imgBatteryCharge10.Hide();
imgBatteryCharge11.Hide();
imgBatteryCharge12.Hide();
imgBatteryCharge13.Hide();
imgBatteryCharge14.Hide();
imgBatteryCharge15.Hide();
imgBatteryCharge16.Hide();
imgBatteryCharge17.Hide();
imgBatteryCharge18.Hide();
imgBatteryCharge19.Hide();
case (Round(IV/5.0)) of
0:  imgBatteryCharge0.Show();
1:  imgBatteryCharge1.Show();
2:  imgBatteryCharge2.Show();
3:  imgBatteryCharge3.Show();
4:  imgBatteryCharge4.Show();
5:  imgBatteryCharge5.Show();
6:  imgBatteryCharge6.Show();
7:  imgBatteryCharge7.Show();
8:  imgBatteryCharge8.Show();
9:  imgBatteryCharge9.Show();
10: imgBatteryCharge10.Show();
11: imgBatteryCharge11.Show();
12: imgBatteryCharge12.Show();
13: imgBatteryCharge13.Show();
14: imgBatteryCharge14.Show();
15: imgBatteryCharge15.Show();
16: imgBatteryCharge16.Show();
17: imgBatteryCharge17.Show();
18: imgBatteryCharge18.Show();
19: imgBatteryCharge19.Show();
else
  imgBatteryCharge19.Show();
end;
finally
ObjectModel.Lock.Leave();
end;
//.
pnlBatteryCharge.Show();
lbBatteryCharge.Show();
//.
btnShowTelemetryModelAnalysis.Enabled:=true;
//.
TelemetryModel_Update();
finally
flUpdating:=false;
end;
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.wmUPDATECONTROLPANEL(var Message: TMessage);
begin
Update();
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.GetCurrentLocation();
var
  DeviceRootComponent: TGeoMonitoredObjectDeviceComponent;
  ptrObj: TPtr;
  Visualization: TObjectDescriptor;
begin
if (ObjectModel = nil) then Exit; //. ->
DeviceRootComponent:=TGeoMonitoredObjectDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
if (NOT ObjectModel.IsObjectOnline()) then Raise Exception.Create('Cannot get current position: object is offline'); //. =>
//. read device gps fix
DeviceRootComponent.GPSModule.GPSFixData.ReadDeviceCUAC();
//. set object at current reflector center
ObjectModel.Lock.Enter();
try
Visualization:=TGeoMonitoredObjectComponent(ObjectModel.ObjectSchema.RootComponent).Visualization.Descriptor.Value;
finally
ObjectModel.Lock.Leave();
end;
//.
ProxySpace_StayUpToDate();
//.
ptrObj:=ProxySpace__Obj_Ptr(Visualization.idTObj,Visualization.idObj);
ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(ptrObj);
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.TelemetryModel_Update();
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
XMLString:=ObjectBusinessModel.DeviceRootComponent.TelemetryModule.TelemetryModel.Value.Value;
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

procedure TGMOHeatMeterBusinessModelCustomControlPanel.sbPropsPanelClick(Sender: TObject);
var
  SC: TCursor;
  PP: TForm;
begin
SC:=Screen.Cursor;
try
PP:=TCoGeoMonitorObjectPanelProps.Create(idCoComponent);
finally
Screen.Cursor:=SC;
end;
PP.Show();
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.btnShowTelemetryModelAnalysisClick(Sender: TObject);
var
  DaysCount: integer;
  AnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel;
begin
DaysCount:=Trunc(AnalysisEndDayPicker.DateTime)-Trunc(AnalysisBeginDayPicker.DateTime)+1;
if (DaysCount < 1) then Raise Exception.Create('invalid date interval'); //. =>
ProxySpace__Log_OperationStarting('loading data from the server ...');
try
AnalysisPanel:=TGMOHeatMeterBusinessModelAnalysisPanel.Create(ObjectBusinessModel, AnalysisBeginDayPicker.DateTime-TimeZoneDelta,DaysCount);
finally
ProxySpace__Log_OperationDone();
end;
try
AnalysisPanel.ShowModal();
finally
AnalysisPanel.Destroy();
end;
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (sbLockPanel.Down) then Raise Exception.Create('Panel is locked'); //. =>
//.
CanClose:=true;
end;

procedure TGMOHeatMeterBusinessModelCustomControlPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
