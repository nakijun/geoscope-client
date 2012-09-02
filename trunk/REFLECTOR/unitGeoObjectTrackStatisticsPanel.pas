unit unitGeoObjectTrackStatisticsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  unitProxySpace, unitXYToGeoCrdConvertor, ExtCtrls, ComCtrls;

type
  TfmGeoObjectTrackStatisticsPanel = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StaticText1: TStaticText;
    Label1: TLabel;
    cbStartPoint: TComboBox;
    Label2: TLabel;
    cbFinishPoint: TComboBox;
    bbCalculateDistance: TBitBtn;
    memoDistanceResults: TMemo;
    stSummariDistance: TStaticText;
    stSummaryNodesNumber: TStaticText;
    Updater: TTimer;
    GroupBox3: TGroupBox;
    lvObjectModelEvents: TListView;
    stObjectModelEventsSummary: TStaticText;
    GroupBox4: TGroupBox;
    lvBusinessModelEvents: TListView;
    stBusinessModelEventsSummary: TStaticText;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdaterTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbStartPointChange(Sender: TObject);
    procedure bbCalculateDistanceClick(Sender: TObject);
  private
    { Private declarations }
    GeoObjectTracks: TGeoObjectTracks;
    GeoObjectTrack: pointer;
    Update_ChangesCount: integer;

    procedure lvObjectModelEvents_Update;
    procedure lvBusinessModelEvents_Update;
  public
    { Public declarations }
    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks; const pGeoObjectTrack: pointer);
    procedure Update; reintroduce;
  end;

implementation
uses
  unitObjectModel;

{$R *.dfm}


Constructor TfmGeoObjectTrackStatisticsPanel.Create(const pGeoObjectTracks: TGeoObjectTracks; const pGeoObjectTrack: pointer);
begin
Inherited Create(nil);
GeoObjectTracks:=pGeoObjectTracks;
GeoObjectTrack:=pGeoObjectTrack;
Update_ChangesCount:=0;
Update();
end;

procedure TfmGeoObjectTrackStatisticsPanel.Update;
var
  S: integer;
  L: double;
  I: integer;
begin
with GeoObjectTracks do begin
Lock.Enter;
try
GeoObjectTracks.GetTrackInfo(GeoObjectTrack, S,L);
Update_ChangesCount:=ChangesCount;
finally
Lock.Leave;
end;
end;
//.
stSummariDistance.Caption:='Length: '+FormatFloat('0',L)+' meters';
stSummaryNodesNumber.Caption:='Points number: '+IntToStr(S);
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
lvObjectModelEvents_Update();
//.
lvBusinessModelEvents_Update();
end;

procedure TfmGeoObjectTrackStatisticsPanel.lvObjectModelEvents_Update;
var
  ptrEvent: pointer;
  InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer;
begin
with GeoObjectTracks do begin
Lock.Enter;
try
GetTrackObjectModelEventsInfo(GeoObjectTrack, InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
finally
Lock.Leave;
end;
end;
stObjectModelEventsSummary.Caption:='Info: '+IntToStr(InfoEventsCounter)+', Minor: '+IntToStr(MinorEventsCounter)+', Major: '+IntToStr(MajorEventsCounter)+', Critical: '+IntToStr(CriticalEventsCounter);
//.
with lvObjectModelEvents do begin
Items.BeginUpdate;
try
Items.Clear;
with GeoObjectTracks do begin
Lock.Enter;
try
ptrEvent:=TGeoObjectTrack(GeoObjectTrack^).ObjectModelEvents;
while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^),Items.Add do begin
  Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta);
  SubItems.Add(ObjectTrackEventSeverityStrings[Severity]);
  SubItems.Add(EventMessage);
  SubItems.Add(EventInfo);
  //.
  ptrEvent:=Next;
  end;
finally
Lock.Leave;
end;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmGeoObjectTrackStatisticsPanel.lvBusinessModelEvents_Update;
var
  ptrEvent: pointer;
  InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer;
begin
with GeoObjectTracks do begin
Lock.Enter;
try
GetTrackBusinessModelEventsInfo(GeoObjectTrack, InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
finally
Lock.Leave;
end;
end;
stBusinessModelEventsSummary.Caption:='Info: '+IntToStr(InfoEventsCounter)+', Minor: '+IntToStr(MinorEventsCounter)+', Major: '+IntToStr(MajorEventsCounter)+', Critical: '+IntToStr(CriticalEventsCounter);
//.
with lvBusinessModelEvents do begin
Items.BeginUpdate;
try
Items.Clear;
with GeoObjectTracks do begin
Lock.Enter;
try
ptrEvent:=TGeoObjectTrack(GeoObjectTrack^).BusinessModelEvents;
while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^),Items.Add do begin
  Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta);
  SubItems.Add(ObjectTrackEventSeverityStrings[Severity]);
  SubItems.Add(EventMessage);
  SubItems.Add(EventInfo);
  //.
  ptrEvent:=Next;
  end;
finally
Lock.Leave;
end;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmGeoObjectTrackStatisticsPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmGeoObjectTrackStatisticsPanel.UpdaterTimer(Sender: TObject);
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

procedure TfmGeoObjectTrackStatisticsPanel.FormActivate(Sender: TObject);
begin
UpdaterTimer(nil);
end;

procedure TfmGeoObjectTrackStatisticsPanel.cbStartPointChange(Sender: TObject);
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

procedure TfmGeoObjectTrackStatisticsPanel.bbCalculateDistanceClick(Sender: TObject);
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
  L:=GeoObjectTracks.GetTrackIntervalLength(GeoObjectTrack, StartIndex,FinishIndex);
  GeoObjectTracks.GetTrackIntervalTimestamps(GeoObjectTrack, StartIndex,FinishIndex, BeginTime,EndTime);
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

end.
