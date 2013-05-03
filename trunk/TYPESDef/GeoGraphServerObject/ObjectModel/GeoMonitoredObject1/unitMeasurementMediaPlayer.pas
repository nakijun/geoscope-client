unit unitMeasurementMediaPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ExtCtrls,
  PasLibVlcPlayerUnit,
  unitVideoRecorderMeasurementTimeIntervalSlider;

const
  WM_START = WM_USER+1;
  WM_STOP = WM_USER+2;
  WM_INITIALIZE = WM_USER+3;
  WM_CURRENTTIMESTAMP = WM_USER+4;
type
  TfmMeasurementMediaPlayer = class(TForm)
    pnlMain: TPanel;
    pnlControl: TPanel;
  private
    { Private declarations }
    MeasurementMediaFile: string;
    StartTimeStamp,FinishTimestamp,CurrentTimestamp: double;
    //.
    Player: TPasLibVlcPlayer;
    Slider: TMeasurementTimeIntervalSlider;

    procedure Player_DoOnLengthChanged(Sender : TObject; time: Int64);
    procedure Player_DoOnEndReached(Sender: TObject);
    procedure Player_DoOnTimeChanged(Sender : TObject; time: Int64);
    procedure Slider_DoOnTimeSelected(const Time: TDateTime);
    procedure Slider_DoOnIntervalSelected(const Interval: TTimeInterval);

    procedure wmStart(var Message: TMessage); message WM_START;
    procedure wmStop(var Message: TMessage); message WM_STOP;
    procedure wmInitialize(var Message: TMessage); message WM_INITIALIZE;
    procedure wmCurrentTimestamp(var Message: TMessage); message WM_CURRENTTIMESTAMP;
  public
    { Public declarations }
    
    Constructor Create(const pMeasurementMediaFile: string; const pTimeStamp: double);
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
Constructor TfmMeasurementMediaPlayer.Create(const pMeasurementMediaFile: string; const pTimeStamp: double);
begin
Inherited Create(nil);
MeasurementMediaFile:=pMeasurementMediaFile;
StartTimeStamp:=pTimeStamp;
//.
Slider:=nil;
//.
Player:=TPasLibVlcPlayer.Create(nil);
Player.TitleShow:=false;
Player.OnMediaPlayerLengthChanged:=Player_DoOnLengthChanged;
Player.OnMediaPlayerEndReached:=Player_DoOnEndReached;
Player.OnMediaPlayerTimeChanged:=Player_DoOnTimeChanged;
Player.Align:=alClient;
Player.Parent:=pnlMain;
//.
Start();
end;

Destructor TfmMeasurementMediaPlayer.Destroy();
begin
if (Player <> nil)
 then begin
  Player.Pause();
  Player.Destroy();
  end;
//.
Slider.Free();
Inherited;
end;

procedure TfmMeasurementMediaPlayer.Start();
begin
Player.Play(MeasurementMediaFile);
end;

procedure TfmMeasurementMediaPlayer.Stop();
begin
Player.Pause();
end;

procedure TfmMeasurementMediaPlayer.Initialize();
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

procedure TfmMeasurementMediaPlayer.SetCurrentTimestamp();
begin
if (CurrentTimestamp > Slider.TimeIntervalEnd) then CurrentTimestamp:=Slider.TimeIntervalEnd;
Slider.SetCurrentTime(CurrentTimestamp,false);
end;

procedure TfmMeasurementMediaPlayer.Player_DoOnLengthChanged(Sender : TObject; time: Int64);
var
  _FinishTimestamp: double;
begin
_FinishTimestamp:=StartTimestamp+time/(1000.0*3600.0*24.0);
if (_FinishTimestamp <> FinishTimestamp)
 then begin
  FinishTimestamp:=_FinishTimestamp;
  SendMessage(Handle, WM_INITIALIZE, 0,0);
  end;
end;

procedure TfmMeasurementMediaPlayer.Player_DoOnEndReached(Sender: TObject);
begin
PostMessage(Handle, WM_START, 0,0);
end;

procedure TfmMeasurementMediaPlayer.Player_DoOnTimeChanged(Sender : TObject; time: Int64);
begin 
if ((Slider = nil) OR Slider.flTimeSelecting OR Slider.flIntervalSelecting) then Exit; //. ->
CurrentTimestamp:=Slider.TimeIntervalBegin+time/(1000.0*3600.0*24.0);
SendMessage(Handle, WM_CURRENTTIMESTAMP, 0,0);
end;

procedure TfmMeasurementMediaPlayer.Slider_DoOnTimeSelected(const Time: TDateTime);
var
  Pos: double;
  TimeInMs: Int64;
begin
if (Player <> nil)
 then begin
  TimeInMs:=Trunc((Time-Slider.TimeIntervalBegin)*(24*3600*1000));
  Player.SetVideoPosInMs(TimeInMs);
  end;
end;

procedure TfmMeasurementMediaPlayer.Slider_DoOnIntervalSelected(const Interval: TTimeInterval);
var
  Pos: double;
  TimeInMs: Int64;
begin
if ((Player <> nil) AND (Interval.Duration > 0.0))
 then begin
  TimeInMs:=Trunc((Interval.Time-Slider.TimeIntervalBegin)*(24*3600*1000));
  Player.SetVideoPosInMs(TimeInMs);
  end;
end;

procedure TfmMeasurementMediaPlayer.wmStart(var Message: TMessage);
begin
Start();
end;

procedure TfmMeasurementMediaPlayer.wmStop(var Message: TMessage);
begin
Stop();
end;

procedure TfmMeasurementMediaPlayer.wmInitialize(var Message: TMessage);
begin
Initialize();
end;

procedure TfmMeasurementMediaPlayer.wmCurrentTimestamp(var Message: TMessage);
begin
SetCurrentTimestamp();
end;


end.
