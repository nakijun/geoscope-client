unit unitMeasurementAudioVideoPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ExtCtrls,
  PasLibVlcPlayerUnit,
  unitVideoRecorderMeasurementTimeIntervalSlider;

const
  WM_START = WM_USER+1;
  WM_STOP = WM_USER+2;
  WM_CURRENTTIMESTAMP = WM_USER+4;
type
  TfmMeasurementAudioVideoPlayer = class(TForm)
    pnlMain: TPanel;
    pnlControl: TPanel;
  private
    { Private declarations }
    MeasurementAudioFile: string;
    MeasurementVideoFile: string;
    //.
    StartTimestamp,FinishTimestamp,CurrentTimestamp: double;
    //.
    AudioPlayer: TPasLibVlcPlayer;
    VideoPlayer: TPasLibVlcPlayer;
    //.
    Slider: TMeasurementTimeIntervalSlider;

    procedure AudioPlayer_DoOnLengthChanged(Sender : TObject; time: Int64);
    procedure AudioPlayer_DoOnEndReached(Sender: TObject);
    procedure AudioPlayer_DoOnTimeChanged(Sender : TObject; time: Int64);
    procedure Slider_DoOnTimeSelected(const Time: TDateTime);
    procedure Slider_DoOnIntervalSelected(const Interval: TTimeInterval);

    procedure wmStart(var Message: TMessage); message WM_START;
    procedure wmStop(var Message: TMessage); message WM_STOP;
    procedure wmCurrentTimestamp(var Message: TMessage); message WM_CURRENTTIMESTAMP;
  public
    { Public declarations }

    Constructor Create(const pMeasurementAudioFile: string; const pMeasurementVideoFile: string; const pStartTimestamp,pFinishTimestamp: double);
    Destructor Destroy(); override;
    procedure Start(); 
    procedure Stop(); 
    procedure Initialize;
    procedure SetCurrentTimestamp();
  end;

implementation
uses
  StrUtils,
  unitObjectModel;

{$R *.dfm}


{TfmMeasurementMediaPlayer}
Constructor TfmMeasurementAudioVideoPlayer.Create(const pMeasurementAudioFile: string; const pMeasurementVideoFile: string; const pStartTimestamp,pFinishTimestamp: double);
begin
Inherited Create(nil);
MeasurementAudioFile:=pMeasurementAudioFile;
MeasurementVideoFile:=pMeasurementVideoFile;
//.
StartTimestamp:=pStartTimestamp;
FinishTimestamp:=pFinishTimestamp;
//.
Slider:=nil;
//.
AudioPlayer:=TPasLibVlcPlayer.Create(nil);
AudioPlayer.TitleShow:=false;
AudioPlayer.OnMediaPlayerLengthChanged:=AudioPlayer_DoOnLengthChanged;
AudioPlayer.OnMediaPlayerEndReached:=AudioPlayer_DoOnEndReached;
AudioPlayer.OnMediaPlayerTimeChanged:=AudioPlayer_DoOnTimeChanged;
AudioPlayer.Align:=alClient;
AudioPlayer.Parent:=pnlMain;
//.
VideoPlayer:=TPasLibVlcPlayer.Create(nil);
VideoPlayer.TitleShow:=false;
VideoPlayer.Align:=alClient;
VideoPlayer.Parent:=pnlMain;
//.
Initialize();
//.
Start();
end;

Destructor TfmMeasurementAudioVideoPlayer.Destroy();
begin
if (VideoPlayer <> nil)
 then begin
  VideoPlayer.Pause();
  VideoPlayer.Destroy();
  end;
if (AudioPlayer <> nil)
 then begin
  AudioPlayer.Pause();
  AudioPlayer.Destroy();
  end;
//.
Slider.Free();
Inherited;
end;

procedure TfmMeasurementAudioVideoPlayer.Start();
begin
AudioPlayer.Play(MeasurementAudioFile);
VideoPlayer.Play(MeasurementVideoFile);
end;

procedure TfmMeasurementAudioVideoPlayer.Stop();
begin
AudioPlayer.Pause();
VideoPlayer.Pause();
end;

procedure TfmMeasurementAudioVideoPlayer.Initialize();
var
  TimeIntervalBegin,TimeIntervalEnd,CurrentTime: double;
  TimeResolution: double;
begin
TimeIntervalBegin:=StartTimestamp+TimeZoneDelta;
if (FinishTimestamp <> 0.0)
 then TimeIntervalEnd:=FinishTimestamp+TimeZoneDelta
 else TimeIntervalEnd:=Now;
TimeResolution:=(TimeIntervalEnd-TimeIntervalBegin){Days delta}/(Width/2.1);
//.
if (Slider = nil)
 then begin
  if (FinishTimestamp <> 0.0)
   then CurrentTime:=TimeIntervalBegin
   else CurrentTime:=TimeIntervalEnd;
  Slider:=TMeasurementTimeIntervalSlider.Create(CurrentTime,TimeResolution,TimeIntervalBegin,TimeIntervalEnd);
  Slider.SetControlMode(scmNavigating);
  Slider.OnTimeSelected:=Slider_DoOnTimeSelected;
  Slider.OnIntervalSelected:=Slider_DoOnIntervalSelected;
  Slider.Align:=alClient;
  Slider.Parent:=pnlControl;
  end
 else Slider.SetParams(TimeResolution,TimeIntervalBegin,TimeIntervalEnd);
end;

procedure TfmMeasurementAudioVideoPlayer.SetCurrentTimestamp();
begin
if (CurrentTimestamp > Slider.TimeIntervalEnd) then CurrentTimestamp:=Slider.TimeIntervalEnd;
Slider.SetCurrentTime(CurrentTimestamp,false);
end;

procedure TfmMeasurementAudioVideoPlayer.AudioPlayer_DoOnLengthChanged(Sender : TObject; time: Int64);
begin
end;

procedure TfmMeasurementAudioVideoPlayer.AudioPlayer_DoOnEndReached(Sender: TObject);
begin
PostMessage(Handle, WM_START, 0,0);
end;

procedure TfmMeasurementAudioVideoPlayer.AudioPlayer_DoOnTimeChanged(Sender : TObject; time: Int64);
begin 
if ((Slider = nil) OR Slider.flTimeSelecting OR Slider.flIntervalSelecting) then Exit; //. ->
CurrentTimestamp:=Slider.TimeIntervalBegin+time/(1000.0*3600.0*24.0);
SendMessage(Handle, WM_CURRENTTIMESTAMP, 0,0);
end;

procedure TfmMeasurementAudioVideoPlayer.Slider_DoOnTimeSelected(const Time: TDateTime);
var
  Pos: double;
  TimeInMs: Int64;
begin
TimeInMs:=Trunc((Time-Slider.TimeIntervalBegin)*(24*3600*1000));
///////if (AudioPlayer <> nil) then AudioPlayer.SetVideoPosInMs(TimeInMs);
///////if (VideoPlayer <> nil) then VideoPlayer.SetVideoPosInMs(TimeInMs);
if (AudioPlayer <> nil) then AudioPlayer.SetVideoPosInPercent(100.0*(Time-Slider.TimeIntervalBegin)/(Slider.TimeIntervalEnd-Slider.TimeIntervalBegin));
if (VideoPlayer <> nil) then VideoPlayer.SetVideoPosInPercent(100.0*(Time-Slider.TimeIntervalBegin)/(Slider.TimeIntervalEnd-Slider.TimeIntervalBegin));
end;

procedure TfmMeasurementAudioVideoPlayer.Slider_DoOnIntervalSelected(const Interval: TTimeInterval);
var
  Pos: double;
  TimeInMs: Int64;
begin
if (Interval.Duration > 0.0)
 then begin
  TimeInMs:=Trunc((Interval.Time-Slider.TimeIntervalBegin)*(24*3600*1000));
  if (AudioPlayer <> nil) then AudioPlayer.SetVideoPosInMs(TimeInMs);
  if (VideoPlayer <> nil) then VideoPlayer.SetVideoPosInMs(TimeInMs);
  end;
end;

procedure TfmMeasurementAudioVideoPlayer.wmStart(var Message: TMessage);
begin
Start();
end;

procedure TfmMeasurementAudioVideoPlayer.wmStop(var Message: TMessage);
begin
Stop();
end;

procedure TfmMeasurementAudioVideoPlayer.wmCurrentTimestamp(var Message: TMessage);
begin
SetCurrentTimestamp();
end;


end.
