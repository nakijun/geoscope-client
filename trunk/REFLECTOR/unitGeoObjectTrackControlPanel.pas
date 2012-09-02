unit unitGeoObjectTrackControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  unitProxySpace, Functionality, TypesFunctionality, unitXYToGeoCrdConvertor, unitGeoObjectTrackDecoding, unitObjectModel, ExtCtrls, ComCtrls, unitTimeIntervalSlider,
  Menus;

const
  LocationInfoInterval = 60{seconds}/(3600.0*24);
  FuelConsumptionRateTableName = 'FuelConsumptionRateTable.txt';
  
type
  TfmGeoObjectTrackDecodingSummaryPanelUpdating = class;
  TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating = class;

  TfmGeoObjectTrackControlPanel = class(TForm)
    Updater: TTimer;
    PageControl: TPageControl;
    tsSummary: TTabSheet;
    GroupBox1: TGroupBox;
    stSummariDistance: TStaticText;
    stSummaryNodesNumber: TStaticText;
    GroupBox3: TGroupBox;
    lvTrackNodes: TListView;
    stObjectModelEventsSummary: TStaticText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    StaticText1: TStaticText;
    cbStartPoint: TComboBox;
    cbFinishPoint: TComboBox;
    bbCalculateDistance: TBitBtn;
    memoDistanceResults: TMemo;
    tsStopsAndMovementsAnalysis: TTabSheet;
    lvStopsAndMovementsAnalysis: TListView;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edTrackBeginTimestamp: TEdit;
    Label5: TLabel;
    edTrackEndTimestamp: TEdit;
    GroupBox4: TGroupBox;
    lbStopsAndMovementsDuration: TLabel;
    tsFuelConsumption: TTabSheet;
    lvFuelConsumptionAnalysis: TListView;
    GroupBox5: TGroupBox;
    lbFuelConsumption: TLabel;
    tsEvents: TTabSheet;
    GroupBox6: TGroupBox;
    lvBusinessModelEvents: TListView;
    stBusinessModelEventsSummary: TStaticText;
    btnFuelConsumptionRateTable: TButton;
    btnCoComponent: TBitBtn;
    gbTrackInterval: TGroupBox;
    btnPrint: TBitBtn;
    lvStopsAndMovementsAnalysis_Popup: TPopupMenu;
    Addselectedtoprintreport1: TMenuItem;
    lvTrackNodes_PopupMenu: TPopupMenu;
    Addselectedtoprintreport2: TMenuItem;
    lvFuelConsumptionAnalysis_PopupMenu: TPopupMenu;
    Addselectedtoprintreport3: TMenuItem;
    lvBusinessModelEvents_PopupMenu: TPopupMenu;
    Addselectedtoprintreport4: TMenuItem;
    Panel3: TPanel;
    cbShowStopsAndMovements: TCheckBox;
    Panel4: TPanel;
    cbShowBusinessModelEvents: TCheckBox;
    Panel2: TPanel;
    cbShowTrack: TCheckBox;
    GroupBox7: TGroupBox;
    Panel5: TPanel;
    cbShowObjectModelEvents: TCheckBox;
    cbSpeedColoredTrack: TCheckBox;
    cbShowTrackNodes: TCheckBox;
    cbShowMovements: TCheckBox;
    N1: TMenuItem;
    Showmaphint1: TMenuItem;
    procedure UpdaterTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbStartPointChange(Sender: TObject);
    procedure bbCalculateDistanceClick(Sender: TObject);
    procedure lvTrackNodesAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure lvStopsAndMovementsAnalysisDblClick(Sender: TObject);
    procedure lvTrackNodesDblClick(Sender: TObject);
    procedure lvStopsAndMovementsAnalysisAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure lvFuelConsumptionAnalysisCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvFuelConsumptionAnalysisDblClick(Sender: TObject);
    procedure lvBusinessModelEventsCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvBusinessModelEventsDblClick(Sender: TObject);
    procedure btnFuelConsumptionRateTableClick(Sender: TObject);
    procedure btnCoComponentClick(Sender: TObject);
    procedure lvTrackNodesClick(Sender: TObject);
    procedure lvStopsAndMovementsAnalysisClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure Addselectedtoprintreport1Click(Sender: TObject);
    procedure Addselectedtoprintreport2Click(Sender: TObject);
    procedure Addselectedtoprintreport3Click(Sender: TObject);
    procedure Addselectedtoprintreport4Click(Sender: TObject);
    procedure lvFuelConsumptionAnalysisClick(Sender: TObject);
    procedure lvBusinessModelEventsClick(Sender: TObject);
    procedure cbShowTrackClick(Sender: TObject);
    procedure lvStopsAndMovementsAnalysisSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure Showmaphint1Click(Sender: TObject);
  private
    { Private declarations }
    FuelConsumptionRateTable: TFuelConsumptionRateTable;
    flUpdating: boolean;
    Update_ChangesCount: integer;
    Updating: TfmGeoObjectTrackDecodingSummaryPanelUpdating;
    StopsAndMovementsAnalysisUpdating: TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating;
    lvStopsAndMovementsAnalysis_flDisableSelectingEvents: boolean;
    TrackTimeIntervalSlider: TTimeIntervalSlider;
    //.
    PrintingPanel: TForm;


    procedure FuelConsumptionRateTable_Update();
    procedure lvTrackNodes_Update();
    function  lvTrackNodes_LocateItem(const pTimeStamp: TDateTime): integer;
    procedure lvTrackNodes_SelectItem(const pTimeStamp: TDateTime);
    procedure lvStopsAndMovementsAnalysis_Update();
    function  lvStopsAndMovementsAnalysis_LocateItem(const pTimeStamp: TDateTime): integer;
    procedure lvStopsAndMovementsAnalysis_SelectItem(const pTimeStamp: TDateTime);
    procedure lvFuelConsumptionAnalysis_Update();
    function  lvFuelConsumptionAnalysis_LocateItem(const pTimeStamp: TDateTime): integer;
    procedure lvFuelConsumptionAnalysis_SelectItem(const pTimeStamp: TDateTime);
    procedure lvBusinessModelEvents_Update();
    function  lvBusinessModelEvents_LocateItem(const pTimeStamp: TDateTime): integer;
    procedure lvBusinessModelEvents_SelectItem(const pTimeStamp: TDateTime);
    procedure TrackTimeIntervalSlider_Update();
    procedure TrackTimeIntervalSlider_DoOnSelectTime(const pTimeStamp: TDateTime);
    procedure TrackTimeIntervalSlider_DoOnSelectInterval(const pInterval: TTimeInterval);
    procedure CreatePrintingPanel();
  public
    GeoObjectTracks: TGeoObjectTracks;
    ptrGeoObjectTrack: pointer;
    TrackBeginTimestamp: TDateTime;
    TrackEndTimestamp: TDateTime;

    { Public declarations }
    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks; const pptrGeoObjectTrack: pointer);
    Destructor Destroy(); override;
    procedure Update; reintroduce;
    procedure SelectTime(const pTimeStamp: TDateTime);
    procedure SelectTimeInterval(Interval: TTimeInterval);
  end;

  TfmGeoObjectTrackDecodingSummaryPanelUpdating = class(TThread)
  private
    Panel: TfmGeoObjectTrackControlPanel;
    //.
    Track: TGeoObjectTrack;
    //.
    ProcessingFlag: boolean;
    ProcessingIndex: integer;
    ProcessingItem: TObjectTrackNode;
    ProcessingItemLocationInfo: string;
    ProcessingLastItemTimestamp: TDateTime;
    //.
    ThreadException: Exception;

    Constructor Create(const pPanel: TfmGeoObjectTrackControlPanel);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure GetProcessingItem();
    procedure UpdateProcessingItem();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
  end;

  TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating = class(TThread)
  private
    Panel: TfmGeoObjectTrackControlPanel;
    //.
    Track: TGeoObjectTrack;
    //.
    ProcessingFlag: boolean;
    ProcessingIndex: integer;
    ProcessingItem: TTrackStopsAndMovementsAnalysisInterval;
    ProcessingItemLocationInfo: string;
    //.
    ThreadException: Exception;

    Constructor Create(const pPanel: TfmGeoObjectTrackControlPanel);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure GetProcessingItem();
    procedure UpdateProcessingItem();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
  end;


implementation
uses
  ActiveX,
  Math,
  TypesDefines,
  GeoTransformations,
  unitComponentUserTextDataEditor,
  unitGeoObjectTrackDecodingPrintingPanel;

{$R *.dfm}


{TfmGeoObjectTrackControlPanel}
Constructor TfmGeoObjectTrackControlPanel.Create(const pGeoObjectTracks: TGeoObjectTracks; const pptrGeoObjectTrack: pointer);
var
  I: integer;
begin
Inherited Create(nil);
GeoObjectTracks:=pGeoObjectTracks;
ptrGeoObjectTrack:=pptrGeoObjectTrack;
//.
TrackTimeIntervalSlider:=nil;
//.
PrintingPanel:=nil;
//.
Update_ChangesCount:=0;
Update();
end;

Destructor TfmGeoObjectTrackControlPanel.Destroy();
begin
lvStopsAndMovementsAnalysis_flDisableSelectingEvents:=true;
PrintingPanel.Free();
TrackTimeIntervalSlider.Free();
//.
if (StopsAndMovementsAnalysisUpdating <> nil)
 then begin
  StopsAndMovementsAnalysisUpdating.Cancel();
  StopsAndMovementsAnalysisUpdating.Panel:=nil;
  StopsAndMovementsAnalysisUpdating:=nil;
  end;
if (Updating <> nil)
 then begin
  Updating.Cancel();
  Updating.Panel:=nil;
  Updating:=nil;
  end;
FuelConsumptionRateTable.Free();
Inherited;
end;

procedure TfmGeoObjectTrackControlPanel.Update;
var
  S: integer;
  L: double;
  NowUTCTime: TDateTime;
  TrackObjectModelEventsBeginTimestamp,TrackObjectModelEventsEndTimestamp: TDateTime;
  TrackBusinessModelEventsBeginTimestamp,TrackBusinessModelEventsEndTimestamp: TDateTime;
  flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents: boolean;
  I: integer;
begin
flUpdating:=true;
try
with GeoObjectTracks do begin
Lock.Enter;
try
GeoObjectTracks.GetTrackInfo(ptrGeoObjectTrack, S,L);
//.
NowUTCTime:=Now-TimeZoneDelta;
TrackBeginTimestamp:=NowUTCTime;
TrackEndTimestamp:=TrackBeginTimestamp;
if (TGeoObjectTrack(ptrGeoObjectTrack^).Nodes <> nil)
 then GeoObjectTracks.GetTrackTimestamps(ptrGeoObjectTrack,{out} TrackBeginTimestamp,TrackEndTimestamp);
if (TGeoObjectTrack(ptrGeoObjectTrack^).ObjectModelEvents <> nil)
 then begin
  GeoObjectTracks.GetTrackObjectModelEventsTimestamps(ptrGeoObjectTrack,{out} TrackObjectModelEventsBeginTimestamp,TrackObjectModelEventsEndTimestamp);
  if (TrackObjectModelEventsBeginTimestamp < TrackBeginTimestamp) then TrackBeginTimestamp:=TrackObjectModelEventsBeginTimestamp;
  if (TrackObjectModelEventsEndTimestamp > TrackEndTimestamp) then TrackEndTimestamp:=TrackObjectModelEventsEndTimestamp;
  end;
if (TGeoObjectTrack(ptrGeoObjectTrack^).BusinessModelEvents <> nil)
 then begin
  GeoObjectTracks.GetTrackBusinessModelEventsTimestamps(ptrGeoObjectTrack,{out} TrackBusinessModelEventsBeginTimestamp,TrackBusinessModelEventsEndTimestamp);
  if (TrackBusinessModelEventsBeginTimestamp < TrackBeginTimestamp) then TrackBeginTimestamp:=TrackBusinessModelEventsBeginTimestamp;
  if (TrackBusinessModelEventsEndTimestamp > TrackEndTimestamp) then TrackEndTimestamp:=TrackBusinessModelEventsEndTimestamp;
  end;
if (Trunc(TrackEndTimestamp) = Trunc(NowUTCTime)) then TrackEndTimestamp:=NowUTCTime; 
//.
Track_Reflection_GetFlags(ptrGeoObjectTrack,{out} flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents);
//.
TrackBeginTimestamp:=TrackBeginTimestamp+TimeZoneDelta;
TrackEndTimestamp:=TrackEndTimestamp+TimeZoneDelta;
Update_ChangesCount:=ChangesCount;
finally
Lock.Leave;
end;
end;
//.
edTrackBeginTimestamp.Text:=FormatDateTime('DD/MM/YY HH:NN',TrackBeginTimestamp);
edTrackEndTimestamp.Text:=FormatDateTime('DD/MM/YY HH:NN',TrackEndTimestamp);
//.
stSummariDistance.Caption:='Length: '+FormatFloat('0',L)+' meters';
stSummaryNodesNumber.Caption:='Points number: '+IntToStr(S);
//.
cbShowTrack.Checked:=flShowTrack;
cbShowTrackNodes.Checked:=flShowTrackNodes;
cbSpeedColoredTrack.Checked:=flSpeedColoredTrack; ///? cbSpeedColoredTrack.Enabled:=flShowTrack;
cbShowStopsAndMovements.Checked:=flShowStopsAndMovementsGraph;
cbShowMovements.Checked:=NOT flHideMovementsGraph;
cbShowObjectModelEvents.Checked:=flShowObjectModelEvents;
cbShowBusinessModelEvents.Checked:=flShowBusinessModelEvents;
//.
cbStartPoint.Items.BeginUpdate;
try
cbStartPoint.Items.Clear();
for I:=0 to S-1 do cbStartPoint.Items.Add(IntToStr(I));
cbStartPoint.ItemIndex:=-1;
finally
cbStartPoint.Items.EndUpdate;
end;
cbFinishPoint.Items.Clear();
cbFinishPoint.Enabled:=false;
bbCalculateDistance.Enabled:=false;
//.
FuelConsumptionRateTable_Update();
//.
lvTrackNodes_Update();
lvStopsAndMovementsAnalysis_Update();
lvFuelConsumptionAnalysis_Update();
lvBusinessModelEvents_Update();
//.
TrackTimeIntervalSlider_Update();
finally
flUpdating:=false;
end;
end;

procedure TfmGeoObjectTrackControlPanel.SelectTime(const pTimeStamp: TDateTime);
begin
TrackTimeIntervalSlider.SetCurrentTime(pTimeStamp+TimeZoneDelta);
end;

procedure TfmGeoObjectTrackControlPanel.SelectTimeInterval(Interval: TTimeInterval);
begin
Interval.Time:=Interval.Time+TimeZoneDelta;
TrackTimeIntervalSlider.SelectTimeInterval(Interval);
end;

procedure TfmGeoObjectTrackControlPanel.FuelConsumptionRateTable_Update();
var
  Data: TMemoryStream;
begin
FreeAndNil(FuelConsumptionRateTable);
with TComponentFunctionality_Create(idTCoComponent,TGeoObjectTrack(ptrGeoObjectTrack^).CoComponentID) do
try
GetUserData(FuelConsumptionRateTableName,{out} Data);
try
FuelConsumptionRateTable:=TFuelConsumptionRateTable.Create(Data);
finally
Data.Free;
end;
finally
Release();
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvTrackNodes_Update();
var
  LastTimeStamp: TDateTime;
  ptrTrackNode: pointer;
begin
with lvTrackNodes do begin
Items.BeginUpdate();
try
Items.Clear();
with TGeoObjectTrack(ptrGeoObjectTrack^) do begin
GeoObjectTracks.Lock.Enter();
try
LastTimeStamp:=-MaxDouble;
ptrTrackNode:=Nodes;
while (ptrTrackNode <> nil) do with TObjectTrackNode(ptrTrackNode^) do begin
  if (TimeStamp > LastTimeStamp)
   then begin
    with lvTrackNodes.Items.Add do begin
    Data:=ptrTrackNode;
    Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta);
    SubItems.Add('');
    SubItems.Add(FormatFloat('0.0',Speed));
    SubItems.Add(FormatFloat('0.0000',Latitude)+'; '+FormatFloat('0.0000',Longitude));
    end;
    LastTimeStamp:=TimeStamp;
    end;
  //.
  ptrTrackNode:=Next;
  end;
finally
GeoObjectTracks.Lock.Leave();
end;
end;
finally
Items.EndUpdate();
end;
end;
//.
if (Updating <> nil) then Updating.Cancel();
Updating:=TfmGeoObjectTrackDecodingSummaryPanelUpdating.Create(Self);
end;

procedure TfmGeoObjectTrackControlPanel.lvTrackNodesAdvancedCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
Sender.Canvas.Brush.Color:=clWhite;
Sender.Canvas.Font.Color:=clBlack;
Sender.Canvas.Font.Style:=[];
//.
case (SubItem) of
1: Sender.Canvas.Font.Style:=[fsBold]; //. location
2: begin //. speed column
  Sender.Canvas.Brush.Color:=SpeedColor(TObjectTrackNode(Item.Data^).Speed);
  Sender.Canvas.Font.Color:=clWhite;
  Sender.Canvas.Font.Style:=[fsBold];
  end;
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvTrackNodesClick(Sender: TObject);
var
  TrackNode: pointer;
begin
if (lvTrackNodes.Selected = nil) then Exit; //. ->
TrackNode:=lvTrackNodes.Selected.Data;
TrackTimeIntervalSlider.SetCurrentTime(TObjectTrackNode(TrackNode^).TimeStamp+TimeZoneDelta);
end;

procedure TfmGeoObjectTrackControlPanel.lvTrackNodesDblClick(Sender: TObject);
var
  TrackNode: pointer;
begin
if (lvTrackNodes.Selected = nil) then Exit; //. ->
TrackNode:=lvTrackNodes.Selected.Data;
GeoObjectTracks.Convertor.LocatePosition(TObjectTrackNode(TrackNode^).Latitude,TObjectTrackNode(TrackNode^).Longitude);
end;

function TfmGeoObjectTrackControlPanel.lvTrackNodes_LocateItem(const pTimeStamp: TDateTime): integer;
var
  MinDeltaT,DeltaT: double;
  MinDeltaTIndex: integer;
  I: integer;
begin
MinDeltaT:=MaxDouble;
MinDeltaTIndex:=-1;
for I:=0 to lvTrackNodes.Items.Count-1 do with TObjectTrackNode(lvTrackNodes.Items[I].Data^) do begin
  DeltaT:=Abs(TimeStamp-pTimeStamp);
  if (DeltaT < MinDeltaT)
   then begin
    MinDeltaT:=DeltaT;
    MinDeltaTIndex:=I;
    end;
  end;
Result:=MinDeltaTIndex;
end;

procedure TfmGeoObjectTrackControlPanel.lvTrackNodes_SelectItem(const pTimeStamp: TDateTime);
var
  Idx: integer;
  Item: TListItem;
  TrackNode: pointer;
begin
Idx:=lvTrackNodes_LocateItem(pTimeStamp);
if (Idx >= 0)
 then begin
  Item:=lvTrackNodes.Items[Idx];
  TrackNode:=Item.Data;
  //.
  if (NOT Item.Selected)
   then begin
    lvTrackNodes.Items.BeginUpdate();
    try
    Item.Selected:=true;
    Item.Focused:=Item.Selected;
    Item.MakeVisible(false);
    if (Visible AND (PageControl.ActivePage = tsSummary)) then lvTrackNodes.SetFocus();
    finally
    lvTrackNodes.Items.EndUpdate();
    end;
    lvTrackNodes.Repaint();
    //.
    GeoObjectTracks.Convertor.LocatePosition(TObjectTrackNode(TrackNode^).Latitude,TObjectTrackNode(TrackNode^).Longitude);
    end;
  end
 else if (lvTrackNodes.Selected <> nil) then lvTrackNodes.Selected.Selected:=false;  
end;

procedure TfmGeoObjectTrackControlPanel.Addselectedtoprintreport2Click(Sender: TObject);
var
  Item: TListItem;
  FragmentIndex: integer;
  ptrTrackNode: pointer;
  Description: string;
begin
if (lvTrackNodes.Selected = nil) then Exit; //. ->
///- if (PrintingPanel = nil) then Raise Exception.Create('Print report is not created'); //. =>
if (PrintingPanel = nil) then CreatePrintingPanel();
Item:=lvTrackNodes.Selected;
GetMem(ptrTrackNode,SizeOf(TObjectTrackNode));
try
TObjectTrackNode(ptrTrackNode^):=TObjectTrackNode(Item.Data^);
Description:='Time: '+Item.Caption+', Speed: '+Item.SubItems[1]+' km/h, Location: '+Item.SubItems[0];
//.
FragmentIndex:=TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel).lvFragments_AddNew(ptrTrackNode,Description);
except
  FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
  //.
  Raise; //. =>
  end;
//.
with TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel)do begin
Show();
BringToFront();
lvFragments.SetFocus();
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysis_Update();
var
  SummaryDistance: double;
  I,J: integer;
  SD,MD: TDateTime;
  NearestEvents: TObjectTrackEvents;
  S: string;
begin
with lvStopsAndMovementsAnalysis do begin
Items.BeginUpdate();
try
SummaryDistance:=0.0;
Items.Clear();
if (TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis = nil) then Exit; //. ->
for I:=0 to TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items.Count-1 do with lvStopsAndMovementsAnalysis.Items.Add,TTrackStopsAndMovementsAnalysisInterval(TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I]) do begin
  Data:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I];
  Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',Position.TimeStamp+TimeZoneDelta);
  if (flMovement) then SubItems.Add('Movement') else SubItems.Add('stop');
  SubItems.Add(FormatFloat('0.0',Duration*(24*60)));
  if (flMovement) then SubItems.Add(FormatFloat('0.000',Distance/1000.0)) else SubItems.Add('');
  SummaryDistance:=SummaryDistance+Distance;
  S:='';
  if (GeoObjectTracks.Track_GetNearestBusinessModelEvents(ptrGeoObjectTrack, Position.TimeStamp,Duration, otesCritical,{out} NearestEvents))
   then begin 
    for J:=0 to Length(NearestEvents)-1 do
      case NearestEvents[J].EventTag of
      EVENTTAG_POI_NEW: S:=S+' POI,';
      EVENTTAG_POI_ADDTEXT: S:=S+' Text: '+NearestEvents[J].EventMessage+',';
      EVENTTAG_POI_ADDIMAGE: S:=S+' Image,';
      EVENTTAG_POI_ADDDATAFILE: S:=S+' DataFile,';
      end;
    if (Length(S) > 0) then SetLength(S,Length(S)-1);
    S:='!'+S;
    end;
  if (flMovement)
   then begin
    SubItems.Add(S);
    SubItems.Add(FormatFloat('0',AvrSpeed));
    SubItems.Add(FormatFloat('0',MinSpeed));
    SubItems.Add(FormatFloat('0',MaxSpeed));
    end
   else begin
    SubItems.Add(S);
    SubItems.Add('');
    SubItems.Add('');
    SubItems.Add('');
    end;
  end;
finally
Items.EndUpdate();
end;
end;
//.
if (TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis <> nil)
 then begin
  SD:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).StopsDuration();
  MD:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).MovementsDuration();
  end;
lbStopsAndMovementsDuration.Caption:='Stops duration: '+IntToStr(Trunc(SD*24.0))+' h '+IntToStr(Trunc(Frac(SD*24.0)*60.0))+' min,  '+'Movements duration: '+IntToStr(Trunc(MD*24.0))+' h '+IntToStr(Trunc(Frac(MD*24.0)*60.0))+' min,  '+'Distance: '+FormatFloat('0.000',SummaryDistance/1000.0)+' km';
//.
if (StopsAndMovementsAnalysisUpdating <> nil) then StopsAndMovementsAnalysisUpdating.Cancel();
StopsAndMovementsAnalysisUpdating:=TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Create(Self);
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysisAdvancedCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
begin
Interval:=Item.Data;
if (Interval.flMovement)
 then begin
  Sender.Canvas.Brush.Color:=TColor($00E3E4FD);
  Sender.Canvas.Font.Color:=clBlack;
  Sender.Canvas.Font.Style:=[];
  //.
  case (SubItem) of
  5: begin
    Sender.Canvas.Brush.Color:=SpeedColor(Interval.AvrSpeed);
    Sender.Canvas.Font.Color:=clWhite;
    end;
  6: begin
    Sender.Canvas.Brush.Color:=SpeedColor(Interval.MinSpeed);
    Sender.Canvas.Font.Color:=clWhite;
    end;
  7: begin
    Sender.Canvas.Brush.Color:=SpeedColor(Interval.MaxSpeed);
    Sender.Canvas.Font.Color:=clWhite;
    end;
  end;
  end
 else begin
  Sender.Canvas.Brush.Color:=TColor($00EBFBE6);
  Sender.Canvas.Font.Color:=clBlack;
  Sender.Canvas.Font.Style:=[fsBold];
  end;
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysisClick(Sender: TObject);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
  TimeInterval: TTimeInterval;
begin
if (lvStopsAndMovementsAnalysis.Selected = nil) then Exit; //. ->
Interval:=TTrackStopsAndMovementsAnalysisInterval(lvStopsAndMovementsAnalysis.Selected.Data);
//.
TimeInterval.Time:=Interval.Position.TimeStamp+TimeZoneDelta;
TimeInterval.Duration:=Interval.Duration;
TrackTimeIntervalSlider.SetCurrentTime(TimeInterval.Time);
TrackTimeIntervalSlider.SelectTimeInterval(TimeInterval);
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysisDblClick(Sender: TObject);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
begin
if (lvStopsAndMovementsAnalysis.Selected = nil) then Exit; //. ->
Interval:=TTrackStopsAndMovementsAnalysisInterval(lvStopsAndMovementsAnalysis.Selected.Data);
GeoObjectTracks.Convertor.LocatePosition(Interval.Position.Latitude,Interval.Position.Longitude);
end;

function TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysis_LocateItem(const pTimeStamp: TDateTime): integer;
var
  I: integer;
  MinL,L: double;
begin
Result:=-1;
MinL:=MaxDouble;
for I:=0 to lvStopsAndMovementsAnalysis.Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(lvStopsAndMovementsAnalysis.Items[I].Data) do begin
  L:=Sqr(Position.TimeStamp-pTimeStamp);
  if (L < minL)
   then begin
    MinL:=L;
    Result:=I;
    end;
  end;
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysis_SelectItem(const pTimeStamp: TDateTime);
var
  Idx: integer;
  Item: TListItem;
  I: integer;
begin
Idx:=lvStopsAndMovementsAnalysis_LocateItem(pTimeStamp);
if (Idx >= 0)
 then begin
  Item:=lvStopsAndMovementsAnalysis.Items[Idx];
  //.
  if (NOT Item.Selected)
   then begin
    lvStopsAndMovementsAnalysis.Items.BeginUpdate();
    try
    lvStopsAndMovementsAnalysis_flDisableSelectingEvents:=true;
    try
    for I:=0 to lvStopsAndMovementsAnalysis.Items.Count-1 do begin
      lvStopsAndMovementsAnalysis.Items[I].Selected:=false;
      lvStopsAndMovementsAnalysis.Items[I].Focused:=lvStopsAndMovementsAnalysis.Items[I].Selected;
      end; 
    Item.Selected:=true;
    Item.Focused:=Item.Selected;
    finally
    lvStopsAndMovementsAnalysis_flDisableSelectingEvents:=false;
    end;
    Item.MakeVisible(false);
    if (Visible AND (PageControl.ActivePage = tsStopsAndMovementsAnalysis)) then lvStopsAndMovementsAnalysis.SetFocus();
    finally
    lvStopsAndMovementsAnalysis.Items.EndUpdate();
    end;
    lvStopsAndMovementsAnalysis.Repaint();
    end;
  end
 else if (lvStopsAndMovementsAnalysis.Selected <> nil)
  then begin
   lvStopsAndMovementsAnalysis_flDisableSelectingEvents:=true;
   try
   lvStopsAndMovementsAnalysis.Selected.Selected:=false;
   finally
   lvStopsAndMovementsAnalysis_flDisableSelectingEvents:=false;
   end;
   end;
end;

procedure TfmGeoObjectTrackControlPanel.lvStopsAndMovementsAnalysisSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  BeginTimestamp,EndTimestamp: TDateTime;
  I: integer;
  flFound: boolean;
  Interval: TTimeInterval;
begin
if (lvStopsAndMovementsAnalysis_flDisableSelectingEvents) then Exit; //. ->
if (lvStopsAndMovementsAnalysis.SelCount <= 1) then Exit; //. ->
//.
flFound:=false;
for I:=0 to lvStopsAndMovementsAnalysis.Items.Count-1 do if (lvStopsAndMovementsAnalysis.Items[I].Selected) then with TTrackStopsAndMovementsAnalysisInterval(lvStopsAndMovementsAnalysis.Items[I].Data) do begin
  BeginTimestamp:=Position.TimeStamp;
  flFound:=true;
  Break; //. >
  end;
if (NOT flFound) then Exit; //. ->
flFound:=false;
for I:=lvStopsAndMovementsAnalysis.Items.Count-1 downto 0 do if (lvStopsAndMovementsAnalysis.Items[I].Selected) then with TTrackStopsAndMovementsAnalysisInterval(lvStopsAndMovementsAnalysis.Items[I].Data) do begin
  EndTimestamp:=Position.TimeStamp+Duration;
  flFound:=true;
  Break; //. >
  end;
if (NOT flFound) then Exit; //. ->
//.
Interval.Duration:=EndTimestamp-BeginTimestamp;
if (Interval.Duration <= 0) then Exit; //. ->
Interval.Time:=BeginTimestamp+TimeZoneDelta;
TrackTimeIntervalSlider.SelectTimeInterval(Interval);
end;

procedure TfmGeoObjectTrackControlPanel.Addselectedtoprintreport1Click(Sender: TObject);
var
  Item: TListItem;
  FragmentIndex: integer;
  ptrTrackNode: pointer;
  Description: string;
begin
if (lvStopsAndMovementsAnalysis.Selected = nil) then Exit; //. ->
///- if (PrintingPanel = nil) then Raise Exception.Create('Print report is not created'); //. =>
if (PrintingPanel = nil) then CreatePrintingPanel();
Item:=lvStopsAndMovementsAnalysis.Selected;
GetMem(ptrTrackNode,SizeOf(TObjectTrackNode));
try
with TObjectTrackNode(ptrTrackNode^) do begin
Timestamp:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.TimeStamp;
Latitude:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.Latitude;
Longitude:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.Longitude;
end;
Description:='Time: '+Item.Caption+', Event: '+Item.SubItems[0]+', Duration: '+Item.SubItems[1]+' min, Distance: '+Item.SubItems[2]+', Location: '+Item.SubItems[3];
//.
FragmentIndex:=TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel).lvFragments_AddNew(ptrTrackNode,Description);
except
  FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
  //.
  Raise; //. =>
  end;
//.
with TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel)do begin
Show();
BringToFront();
lvFragments.SetFocus();
end;
end;

procedure TfmGeoObjectTrackControlPanel.Showmaphint1Click(Sender: TObject);
var
  Item: TListItem;
  Events: TObjectTrackEvents;
  POIID: Int64;
begin
if (lvStopsAndMovementsAnalysis.Selected = nil) then Exit; //. ->
Item:=lvStopsAndMovementsAnalysis.Selected;
if (GeoObjectTracks.Track_GetNearestBusinessModelEvents(ptrGeoObjectTrack,TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.TimeStamp,TTrackStopsAndMovementsAnalysisInterval(Item.Data).Duration,EVENTTAG_POI_NEW,1,{out} Events))
 then begin
  POIID:=Int64(Pointer(@Events[0].EventExtra[0])^);
  with TComponentFunctionality_Create(idTMapFormatObject,POIID) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end;
  finally
  Release;
  end;
  end;
end;

procedure TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysis_Update();
var
  SummaryDistance: double;
  I: integer;
  FCR,FC,FCS: double;
begin
with lvFuelConsumptionAnalysis do begin
Items.BeginUpdate();
try
SummaryDistance:=0.0;
Items.Clear();
FCS:=0.0;
if (TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis = nil) then Exit; //. ->
for I:=0 to TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items.Count-1 do if (TTrackStopsAndMovementsAnalysisInterval(TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I]).flMovement) then with lvFuelConsumptionAnalysis.Items.Add,TTrackStopsAndMovementsAnalysisInterval(TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I]) do begin
  Data:=TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I];
  Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',Position.TimeStamp+TimeZoneDelta);
  SubItems.Add(FormatFloat('0.0',Duration*(24*60)));
  SubItems.Add(FormatFloat('0.000',Distance/1000.0));
  SummaryDistance:=SummaryDistance+Distance;
  SubItems.Add(FormatFloat('0',AvrSpeed));
  FCR:=FuelConsumptionRateTable.GetSpeedConsumption(AvrSpeed)/100000.0{meters};
  FC:=Distance*FCR;
  FCS:=FCS+FC;
  SubItems.Add(FormatFloat('0.0',FC));
  end;
finally
Items.EndUpdate();
end;
end;
//.
lbFuelConsumption.Caption:='Fuel consumption: '+FormatFloat('0.0',FCS)+' L,  Distance: '+FormatFloat('0.000',SummaryDistance/1000.0)+' km';
end;

procedure TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysisCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
begin
Interval:=Item.Data;
Sender.Canvas.Brush.Color:=TColor($00E3E4FD);
Sender.Canvas.Font.Color:=clBlack;
Sender.Canvas.Font.Style:=[];
//.
case (SubItem) of
3: begin
  Sender.Canvas.Brush.Color:=SpeedColor(Interval.AvrSpeed);
  Sender.Canvas.Font.Color:=clWhite;
  end;
4: Sender.Canvas.Font.Style:=[fsBold];
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysisClick(Sender: TObject);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
begin
if (lvFuelConsumptionAnalysis.Selected = nil) then Exit; //. ->
Interval:=TTrackStopsAndMovementsAnalysisInterval(lvFuelConsumptionAnalysis.Selected.Data);
TrackTimeIntervalSlider.SetCurrentTime((Interval.Position.TimeStamp+Interval.Duration/2.0)+TimeZoneDelta);
end;

procedure TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysisDblClick(Sender: TObject);
var
  Interval: TTrackStopsAndMovementsAnalysisInterval;
begin
if (lvFuelConsumptionAnalysis.Selected = nil) then Exit; //. ->
Interval:=TTrackStopsAndMovementsAnalysisInterval(lvFuelConsumptionAnalysis.Selected.Data);
GeoObjectTracks.Convertor.LocatePosition(Interval.Position.Latitude,Interval.Position.Longitude);
end;

function TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysis_LocateItem(const pTimeStamp: TDateTime): integer;
var
  I: integer;
begin
Result:=-1;
for I:=0 to lvFuelConsumptionAnalysis.Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(lvFuelConsumptionAnalysis.Items[I].Data) do begin
  if ((Position.TimeStamp <= pTimeStamp) AND (pTimeStamp < (Position.TimeStamp+Duration)))
   then begin
    Result:=I;
    Exit; //. ->
    end;
  end;
end;

procedure TfmGeoObjectTrackControlPanel.lvFuelConsumptionAnalysis_SelectItem(const pTimeStamp: TDateTime);
var
  Idx: integer;
  Item: TListItem;
begin
Idx:=lvFuelConsumptionAnalysis_LocateItem(pTimeStamp);
if (Idx >= 0)
 then begin
  Item:=lvFuelConsumptionAnalysis.Items[Idx];
  //.
  if (NOT Item.Selected)
   then begin
    lvFuelConsumptionAnalysis.Items.BeginUpdate();
    try
    Item.Selected:=true;
    Item.Focused:=Item.Selected;
    Item.MakeVisible(false);
    if (Visible AND (PageControl.ActivePage = tsFuelConsumption)) then lvFuelConsumptionAnalysis.SetFocus();
    finally
    lvFuelConsumptionAnalysis.Items.EndUpdate();
    end;
    lvFuelConsumptionAnalysis.Repaint();
    end;
  end
 else if (lvFuelConsumptionAnalysis.Selected <> nil) then lvFuelConsumptionAnalysis.Selected.Selected:=false;
end;

procedure TfmGeoObjectTrackControlPanel.Addselectedtoprintreport3Click(Sender: TObject);
var
  Item: TListItem;
  FragmentIndex: integer;
  ptrTrackNode: pointer;
  Description: string;
begin
if (lvFuelConsumptionAnalysis.Selected = nil) then Exit; //. ->
///- if (PrintingPanel = nil) then Raise Exception.Create('Print report is not created'); //. =>
if (PrintingPanel = nil) then CreatePrintingPanel();
Item:=lvFuelConsumptionAnalysis.Selected;
GetMem(ptrTrackNode,SizeOf(TObjectTrackNode));
try
with TObjectTrackNode(ptrTrackNode^) do begin
Timestamp:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.TimeStamp;
Latitude:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.Latitude;
Longitude:=TTrackStopsAndMovementsAnalysisInterval(Item.Data).Position.Longitude;
end;
Description:='Time: '+Item.Caption+', Duration: '+Item.SubItems[0]+' min, Distance: '+Item.SubItems[1]+' km, Avr Speed: '+Item.SubItems[2]+' km/h, Consumption: '+Item.SubItems[3]+' L';
//.
FragmentIndex:=TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel).lvFragments_AddNew(ptrTrackNode,Description);
except
  FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
  //.
  Raise; //. =>
  end;
//.
with TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel)do begin
Show();
BringToFront();
lvFragments.SetFocus();
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvBusinessModelEvents_Update();
var
  ptrEvent: pointer;
  InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer;
begin
with GeoObjectTracks do begin
Lock.Enter();
try
GetTrackBusinessModelEventsInfo(ptrGeoObjectTrack, InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
finally
Lock.Leave();
end;
end;
stBusinessModelEventsSummary.Caption:='Info: '+IntToStr(InfoEventsCounter)+', Minor: '+IntToStr(MinorEventsCounter)+', Major: '+IntToStr(MajorEventsCounter)+', Critical: '+IntToStr(CriticalEventsCounter);
//.
with lvBusinessModelEvents do begin
Items.BeginUpdate();
try
Items.Clear();
with GeoObjectTracks do begin
Lock.Enter();
try
ptrEvent:=TGeoObjectTrack(ptrGeoObjectTrack^).BusinessModelEvents;
while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^) do begin
  if (true) ///? (Severity = otesCritical)
   then with Items.Add do begin
    Data:=ptrEvent;
    Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta);
    SubItems.Add(ObjectTrackEventSeverityStrings[Severity]);
    SubItems.Add(EventMessage);
    SubItems.Add(EventInfo);
    end;
  //.
  ptrEvent:=Next;
  end;
finally
Lock.Leave();
end;
end;
finally
Items.EndUpdate();
end;
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvBusinessModelEventsCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  ptrEvent: pointer;
begin
ptrEvent:=Item.Data;
Sender.Canvas.Brush.Color:=clWindow;
Sender.Canvas.Font.Color:=clBlack;
Sender.Canvas.Font.Style:=[];
//.
case (SubItem) of
1: begin
  Sender.Canvas.Brush.Color:=ObjectTrackEventSeverityColors[TObjectTrackEvent(ptrEvent^).Severity];
  Sender.Canvas.Font.Color:=ObjectTrackEventSeverityFontColors[TObjectTrackEvent(ptrEvent^).Severity];
  end;
end;
end;

procedure TfmGeoObjectTrackControlPanel.lvBusinessModelEventsClick(Sender: TObject);
var
  ptrEvent: pointer;
begin
if (lvBusinessModelEvents.Selected = nil) then Exit; //. ->
ptrEvent:=lvBusinessModelEvents.Selected.Data;
with TObjectTrackEvent(ptrEvent^) do TrackTimeIntervalSlider.SetCurrentTime(TimeStamp+TimeZoneDelta);
end;

procedure TfmGeoObjectTrackControlPanel.lvBusinessModelEventsDblClick(Sender: TObject);
var
  ptrEvent: pointer;
begin
if (lvBusinessModelEvents.Selected = nil) then Exit; //. ->
ptrEvent:=lvBusinessModelEvents.Selected.Data;
with TObjectTrackEvent(ptrEvent^) do GeoObjectTracks.Convertor.Reflector.ShiftingSetReflection(X,Y);
end;

function TfmGeoObjectTrackControlPanel.lvBusinessModelEvents_LocateItem(const pTimeStamp: TDateTime): integer;
var
  MinDeltaT,DeltaT: double;
  MinDeltaTIndex: integer;
  I: integer;
begin
MinDeltaT:=MaxDouble;
MinDeltaTIndex:=-1;
for I:=0 to lvBusinessModelEvents.Items.Count-1 do with TObjectTrackEvent(lvBusinessModelEvents.Items[I].Data^) do begin
  DeltaT:=Abs(TimeStamp-pTimeStamp);
  if (DeltaT < MinDeltaT)
   then begin
    MinDeltaT:=DeltaT;
    MinDeltaTIndex:=I;
    end;
  end;
Result:=MinDeltaTIndex;
end;

procedure TfmGeoObjectTrackControlPanel.lvBusinessModelEvents_SelectItem(const pTimeStamp: TDateTime);
var
  Idx: integer;
  Item: TListItem;
begin
Idx:=lvBusinessModelEvents_LocateItem(pTimeStamp);
if (Idx >= 0)
 then begin
  Item:=lvBusinessModelEvents.Items[Idx];
  //.
  if (NOT Item.Selected)
   then begin
    lvBusinessModelEvents.Items.BeginUpdate();
    try
    Item.Selected:=true;
    Item.Focused:=Item.Selected;
    Item.MakeVisible(false);
    if (Visible AND (PageControl.ActivePage = tsEvents)) then lvBusinessModelEvents.SetFocus();
    finally
    lvBusinessModelEvents.Items.EndUpdate();
    end;
    lvBusinessModelEvents.Repaint();
    end;
  end
 else if (lvBusinessModelEvents.Selected <> nil) then lvBusinessModelEvents.Selected.Selected:=false;
end;

procedure TfmGeoObjectTrackControlPanel.Addselectedtoprintreport4Click(Sender: TObject);
var
  ptrEvent: pointer;
  Idx: integer;
  Item,NodeItem: TListItem;
  FragmentIndex: integer;
  ptrTrackNode: pointer;
  Description: string;
begin
if (lvBusinessModelEvents.Selected = nil) then Exit; //. ->
///- if (PrintingPanel = nil) then Raise Exception.Create('Print report is not created'); //. =>
if (PrintingPanel = nil) then CreatePrintingPanel();
Item:=lvBusinessModelEvents.Selected;
ptrEvent:=Item.Data;
Idx:=lvTrackNodes_LocateItem(TObjectTrackEvent(ptrEvent^).TimeStamp);
if (Idx = -1) then Raise Exception.Create('Could not get location by time'); //. =>
//.
NodeItem:=lvTrackNodes.Items[Idx];
GetMem(ptrTrackNode,SizeOf(TObjectTrackNode));
try
TObjectTrackNode(ptrTrackNode^):=TObjectTrackNode(NodeItem.Data^);
Description:='Time: '+Item.Caption+', Severity: '+Item.SubItems[0]+', Message: '+Item.SubItems[1]+', Info: '+Item.SubItems[2];
//.
FragmentIndex:=TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel).lvFragments_AddNew(ptrTrackNode,Description);
except
  FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
  //.
  Raise; //. =>
  end;
//.
with TfmGeoObjectTrackDecodingPrintingPanel(PrintingPanel)do begin
Show();
BringToFront();
lvFragments.SetFocus();
end;
end;

procedure TfmGeoObjectTrackControlPanel.TrackTimeIntervalSlider_Update();
Const
  StopIntervalColor = clNavy;
  MovementIntervalColor = clRed;
var
  TimeMarks: TTimeIntervalSliderTimeMarks;
  TimeMarkIntervals: TTimeIntervalSliderTimeMarkIntervals;
  I: integer;
begin
SetLength(TimeMarks,lvTrackNodes.Items.Count);
for I:=0 to lvTrackNodes.Items.Count-1 do with TObjectTrackNode(lvTrackNodes.Items[I].Data^) do begin
  TimeMarks[I].Time:=TimeStamp+TimeZoneDelta;
  TimeMarks[I].Color:=SpeedColor(Speed);
  end;
if (TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis <> nil)
 then begin
  SetLength(TimeMarkIntervals,TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items.Count);
  for I:=0 to TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(TTrackStopsAndMovementsAnalysis(TGeoObjectTrack(ptrGeoObjectTrack^).StopsAndMovementsAnalysis).Items[I]) do begin
    TimeMarkIntervals[I].Time:=Position.TimeStamp+TimeZoneDelta;
    TimeMarkIntervals[I].Duration:=Duration;
    if (flMovement)
     then TimeMarkIntervals[I].Color:=MovementIntervalColor
     else TimeMarkIntervals[I].Color:=StopIntervalColor;
    end;
  end
 else SetLength(TimeMarkIntervals,0);
//.
FreeAndNil(TrackTimeIntervalSlider);
TrackTimeIntervalSlider:=TTimeIntervalSlider.Create(TrackBeginTimestamp, 1.0{Day}/(Screen.WorkAreaWidth/2.0), TrackBeginTimestamp,TrackEndTimestamp, TimeMarks,TimeMarkIntervals);
TrackTimeIntervalSlider.OnTimeSelected:=TrackTimeIntervalSlider_DoOnSelectTime;
TrackTimeIntervalSlider.OnIntervalSelected:=TrackTimeIntervalSlider_DoOnSelectInterval;
TrackTimeIntervalSlider.Align:=alClient;
TrackTimeIntervalSlider.Parent:=gbTrackInterval;
end;

procedure TfmGeoObjectTrackControlPanel.TrackTimeIntervalSlider_DoOnSelectTime(const pTimeStamp: TDateTime);
var
  UTCTimeStamp: TDateTime;
begin
UTCTimeStamp:=pTimeStamp-TimeZoneDelta;
lvTrackNodes_SelectItem(UTCTimeStamp);
lvStopsAndMovementsAnalysis_SelectItem(UTCTimeStamp);
lvFuelConsumptionAnalysis_SelectItem(UTCTimeStamp);
lvBusinessModelEvents_SelectItem(UTCTimeStamp);
end;

procedure TfmGeoObjectTrackControlPanel.TrackTimeIntervalSlider_DoOnSelectInterval(const pInterval: TTimeInterval);
begin
GeoObjectTracks.Track_Reflection_SetInterval(ptrGeoObjectTrack,pInterval.Time-TimeZoneDelta,pInterval.Duration);
end;

procedure TfmGeoObjectTrackControlPanel.CreatePrintingPanel();
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
PrintingPanel:=TfmGeoObjectTrackDecodingPrintingPanel.Create(Self);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGeoObjectTrackControlPanel.UpdaterTimer(Sender: TObject);
var
  flUpdateIsNeeded: boolean;
begin
if ((ProxySpace = nil) OR (ProxySpace.State <> psstWorking)) then Exit; //. ->
with GeoObjectTracks do begin
Lock.Enter;
try
flUpdateIsNeeded:=(Update_ChangesCount <> ChangesCount);
finally
Lock.Leave;
end;
if (flUpdateIsNeeded) then Close();
end;
end;

procedure TfmGeoObjectTrackControlPanel.FormActivate(Sender: TObject);
begin
UpdaterTimer(nil);
if (Visible AND (PageControl.ActivePage = tsStopsAndMovementsAnalysis)) then lvStopsAndMovementsAnalysis.SetFocus();
end;

procedure TfmGeoObjectTrackControlPanel.btnPrintClick(Sender: TObject);
begin
if (PrintingPanel = nil) then CreatePrintingPanel();
//.
PrintingPanel.Show();
end;

procedure TfmGeoObjectTrackControlPanel.btnCoComponentClick(Sender: TObject);

  procedure ShowPropsPanel(const idTObj,idObj: integer);
  begin
  with TComponentFunctionality_Create(idTObj,idObj) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end;
  finally
  Release;
  end;
  end;

var
  CoComponentPanelProps: TForm;
begin
CoComponentPanelProps:=nil;
GeoObjectTracks.Convertor.Reflector.Space.Log.OperationStarting('loading ..........');
try
try
CoComponentPanelProps:=GeoObjectTracks.Convertor.Reflector.Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(TGeoObjectTrack(ptrGeoObjectTrack^).CoComponentID),TGeoObjectTrack(ptrGeoObjectTrack^).CoComponentID);
except
  FreeAndNil(CoComponentPanelProps);
  end;
finally
GeoObjectTracks.Convertor.Reflector.Space.Log.OperationDone();
end;
if (CoComponentPanelProps <> nil)
 then with CoComponentPanelProps do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end
 else ShowPropsPanel(idTCoComponent,TGeoObjectTrack(ptrGeoObjectTrack^).CoComponentID);
end;

procedure TfmGeoObjectTrackControlPanel.cbShowTrackClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
GeoObjectTracks.Track_Reflection_SetFlags(ptrGeoObjectTrack,cbShowTrack.Checked,cbShowTrackNodes.Checked,cbSpeedColoredTrack.Checked,cbShowStopsAndMovements.Checked,NOT cbShowMovements.Checked,cbShowObjectModelEvents.Checked,cbShowBusinessModelEvents.Checked);
///? cbSpeedColoredTrack.Enabled:=cbShowTrack.Checked;
end;

procedure TfmGeoObjectTrackControlPanel.cbStartPointChange(Sender: TObject);
var
  I: integer;
begin
if (cbStartPoint.ItemIndex < (cbStartPoint.Items.Count-1))
 then begin
  cbFinishPoint.Items.BeginUpdate;
  try
  cbFinishPoint.Items.Clear();
  for I:=cbStartPoint.ItemIndex+1 to (cbStartPoint.Items.Count-1) do cbFinishPoint.Items.Add(IntToStr(I));
  finally
  cbFinishPoint.Items.EndUpdate;
  end;
  cbFinishPoint.Enabled:=true;
  bbCalculateDistance.Enabled:=true;
  end
 else begin
  cbFinishPoint.Enabled:=false;
  bbCalculateDistance.Enabled:=false;
  end;
end;

procedure TfmGeoObjectTrackControlPanel.bbCalculateDistanceClick(Sender: TObject);
var
  StartIndex,FinishIndex: integer;
  L: double;
  BeginTime,EndTime: TDateTime;
begin
if ((cbStartPoint.ItemIndex >= 0) AND (cbFinishPoint.ItemIndex >= 0))
 then begin
  StartIndex:=cbStartPoint.ItemIndex;
  FinishIndex:=cbStartPoint.ItemIndex+1+cbFinishPoint.ItemIndex;
  //.
  L:=GeoObjectTracks.GetTrackIntervalLength(ptrGeoObjectTrack, StartIndex,FinishIndex);
  GeoObjectTracks.GetTrackIntervalTimestamps(ptrGeoObjectTrack, StartIndex,FinishIndex, BeginTime,EndTime);
  memoDistanceResults.Lines.BeginUpdate;
  try
  memoDistanceResults.Lines.Clear();
  memoDistanceResults.Lines.Add('Length: '+FormatFloat('0',L)+' meters');
  memoDistanceResults.Lines.Add('Points: '+IntToStr(FinishIndex-StartIndex+1));
  memoDistanceResults.Lines.Add('Time interval: '+FormatDateTime('HH:NN:SS',(EndTime-BeginTime)));
  memoDistanceResults.Lines.Add('Average speed: '+FormatFloat('0',(L/1000.0)/((EndTime-BeginTime)*24))+' km/h');
  finally
  memoDistanceResults.Lines.EndUpdate;
  end;
  end;
end;

procedure TfmGeoObjectTrackControlPanel.btnFuelConsumptionRateTableClick(Sender: TObject);
begin
with TfmComponentUserTextDataEditor.Create(idTCoComponent,TGeoObjectTrack(ptrGeoObjectTrack^).CoComponentID, FuelConsumptionRateTableName, 'Fuel consumption table') do
try
if (Edit())
 then begin
  FuelConsumptionRateTable_Update();
  lvFuelConsumptionAnalysis_Update();
  end;
finally
Destroy();
end;
end;


{TfmGeoObjectTrackDecodingSummaryPanelUpdating}
Constructor TfmGeoObjectTrackDecodingSummaryPanelUpdating.Create(const pPanel: TfmGeoObjectTrackControlPanel);
begin
Panel:=pPanel;
Track:=TGeoObjectTrack(Panel.ptrGeoObjectTrack^);
ProcessingFlag:=false;
ProcessingIndex:=0;
ProcessingLastItemTimestamp:=0.0;
//.
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TfmGeoObjectTrackDecodingSummaryPanelUpdating.Destroy();
begin
Cancel();
Inherited;
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.Execute();
var
  I: integer;
  idTOwner,idOwner: integer;
  HintInfo: TByteArray;
  S: string;
  LocationInfo: string;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
if (Terminated) then Exit; //. ->
repeat
  Synchronize(GetProcessingItem);
  if (NOT ProcessingFlag) then Exit; //. ->
  //.
  try
  with TGeoCrdConverter.Create(Track.DatumID) do
  try
  GeoCoder_LatLongToNearestObjects(GEOCODER_YANDEXMAPS, ProcessingItem.Latitude,ProcessingItem.Longitude,{out} LocationInfo);
  finally
  Destroy();
  end;
  if (LocationInfo = '') then LocationInfo:='- not found -';
  except
    on E: Exception do LocationInfo:='!ERROR: '+E.Message;
    end;
  ProcessingItemLocationInfo:=LocationInfo;
  //.
  Synchronize(UpdateProcessingItem);
until (Terminated);
finally
CoUnInitialize;
end;
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.GetProcessingItem();
begin
if (Terminated) then Exit; //. ->
//.
repeat
  if (ProcessingIndex >= Panel.lvTrackNodes.Items.Count)
   then begin
    ProcessingFlag:=false;
    Exit; //. ->
    end;
  //.
  if (((TObjectTrackNode(Panel.lvTrackNodes.Items[ProcessingIndex].Data^).TimeStamp-ProcessingLastItemTimestamp) >= LocationInfoInterval) OR (ProcessingIndex = (Panel.lvTrackNodes.Items.Count-1))) then Break; //. >
  //.
  Inc(ProcessingIndex);
until (false);
ProcessingItem:=TObjectTrackNode(Panel.lvTrackNodes.Items[ProcessingIndex].Data^);
ProcessingFlag:=true;
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.UpdateProcessingItem();
begin
if (Terminated) then Exit; //. ->
//.
Panel.lvTrackNodes.Items[ProcessingIndex].SubItems[0]:=ProcessingItemLocationInfo;
//.
ProcessingLastItemTimestamp:=ProcessingItem.TimeStamp;
//.
Inc(ProcessingIndex);
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.Finalize();
begin
if (Panel = nil) then Exit; //. ->
//.
if (Panel.Updating = Self) then Panel.Updating:=nil;
end;

procedure TfmGeoObjectTrackDecodingSummaryPanelUpdating.Cancel();
begin
Terminate();
end;


{TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating}
Constructor TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Create(const pPanel: TfmGeoObjectTrackControlPanel);
begin
Panel:=pPanel;
Track:=TGeoObjectTrack(Panel.ptrGeoObjectTrack^);
ProcessingFlag:=false;
ProcessingIndex:=0;
//.
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Destroy();
begin
Cancel();
Inherited;
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Execute();
var
  I: integer;
  idTOwner,idOwner: integer;
  HintInfo: TByteArray;
  S: string;
  LocationInfo: string;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
if (Terminated) then Exit; //. ->
repeat
  Synchronize(GetProcessingItem);
  if (NOT ProcessingFlag) then Exit; //. ->
  //.
  try
  with TGeoCrdConverter.Create(Track.DatumID) do
  try
  GeoCoder_LatLongToNearestObjects(GEOCODER_YANDEXMAPS, ProcessingItem.Position.Latitude,ProcessingItem.Position.Longitude,{out} LocationInfo);
  finally
  Destroy();
  end;
  if (LocationInfo = '') then LocationInfo:='- not found -';
  except
    on E: Exception do LocationInfo:='!ERROR: '+E.Message;
    end;
  ProcessingItemLocationInfo:=LocationInfo;
  //.
  Synchronize(UpdateProcessingItem);
until (Terminated);
finally
CoUnInitialize;
end;
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.GetProcessingItem();
begin
if (Terminated) then Exit; //. ->
//.
repeat
  if (ProcessingIndex >= Panel.lvStopsAndMovementsAnalysis.Items.Count)
   then begin
    ProcessingFlag:=false;
    Exit; //. ->
    end;
  //.
  if (NOT TTrackStopsAndMovementsAnalysisInterval(Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].Data).flMovement) then Break; //. >
  //.
  Inc(ProcessingIndex);
until (false);
ProcessingItem:=TTrackStopsAndMovementsAnalysisInterval(Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].Data);
ProcessingFlag:=true;
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.UpdateProcessingItem();
begin
if (Terminated) then Exit; //. ->
//.
if (Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].SubItems[3] <> '')
 then Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].SubItems[3]:=Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].SubItems[3]+'; '+ProcessingItemLocationInfo
 else Panel.lvStopsAndMovementsAnalysis.Items[ProcessingIndex].SubItems[3]:=ProcessingItemLocationInfo;
//.
Inc(ProcessingIndex);
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Finalize();
begin
if (Panel = nil) then Exit; //. ->
//.
if (Panel.StopsAndMovementsAnalysisUpdating = Self) then Panel.StopsAndMovementsAnalysisUpdating:=nil;
end;

procedure TfmGeoObjectTrackDecodingStopsAndMovementsAnalysisPanelUpdating.Cancel();
begin
Terminate();
end;


end.
