unit unitReflectionWindowActualityIntervalPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  unitTimeIntervalSlider,
  unitReflectionWindowActualityIntervalSlider,
  ExtCtrls, ComCtrls;

const
  WM_UPDATEPANEL = WM_USER+1;
  WM_RESETANDUPDATEPANEL = WM_USER+2;
type
  TfmReflectionWindowActualityIntervalPanel = class(TForm)
    Updater: TTimer;
    Panel: TPanel;
    tbTimeScale: TTrackBar;
    procedure FormShow(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure tbTimeScaleChange(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
    IntervalSlider: TReflectionWindowActualityIntervalSlider;
    IntervalSlider_TimeResolution: double;
    IntervalSlider_TimeResolutionScale: double;
    procedure IntervalSlider_DoOnSelectInterval(const pInterval: TTimeInterval);
    procedure wmUpdatePanel(var Message: TMessage); message WM_UPDATEPANEL;
    procedure wmResetAndUpdatePanel(var Message: TMessage); message WM_RESETANDUPDATEPANEL;
  public
    { Public declarations }
    Constructor Create(const pReflector: TReflector);
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
    procedure Reset();
    procedure PostUpdatePanel();
    procedure PostResetAndUpdatePanel();
  end;


implementation

{$R *.dfm}


Constructor TfmReflectionWindowActualityIntervalPanel.Create(const pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
IntervalSlider:=TReflectionWindowActualityIntervalSlider.Create();
IntervalSlider.OnIntervalSelected:=IntervalSlider_DoOnSelectInterval;
IntervalSlider.Align:=alClient;
IntervalSlider.Parent:=Self;
IntervalSlider.Show();
IntervalSlider_TimeResolution:=1.0;
IntervalSlider_TimeResolutionScale:=1.0;
DoubleBuffered:=true;
end;

Destructor TfmReflectionWindowActualityIntervalPanel.Destroy();
begin
IntervalSlider.Free();
Inherited;
end;

procedure TfmReflectionWindowActualityIntervalPanel.Update();
var
  ptrReflLay,ptrItem: pointer;
  Obj: TSpaceObj;
  Obj_ActualityInterval: TComponentActualityInterval;
  TimeIntervalBegin,TimeIntervalEnd: TDateTime;
  MS: TMemoryStream;
  TimeMarks: TTimeIntervalSliderTimeMarks;
  I: integer;
begin
TimeIntervalEnd:=Now-TimeZoneDelta;
TimeIntervalBegin:=UndefinedTimestamp;
MS:=TMemoryStream.Create();
try
with Reflector.Reflecting do begin
Lock.Enter();
try
ptrReflLay:=Lays;
while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
  //. process a layer objects
  ptrItem:=Objects;
  while ptrItem <> nil do begin
    with TItemLayReflect(ptrItem^) do begin
    Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
    if (Reflector.Space.Obj_IsCached(Obj))
     then begin
      Obj_ActualityInterval:=Reflector.Space.Obj_ActualityInterval_Get(Obj);
      if (Obj_ActualityInterval.EndTimestamp <= TimeIntervalEnd)
       then begin
        MS.Write(Obj_ActualityInterval,SizeOf(Obj_ActualityInterval));
        if (Obj_ActualityInterval.EndTimestamp < TimeIntervalBegin)
         then TimeIntervalBegin:=Obj_ActualityInterval.EndTimestamp;
        end;
      end;
    end;
    //. go to next item
    ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
    end;
  //.
  ptrReflLay:=ptrNext;
  end;
finally
Lock.Leave();
end;
SetLength(TimeMarks,MS.Size DIV SizeOf(Obj_ActualityInterval));
MS.Position:=0;
for I:=0 to Length(TimeMarks)-1 do begin
  MS.Read(Obj_ActualityInterval,SizeOf(Obj_ActualityInterval));
  //.
  TimeMarks[I].Time:=Obj_ActualityInterval.EndTimestamp+TimeZoneDelta;
  TimeMarks[I].Color:=clNavy;
  end;
end;
finally
MS.Destroy();
end;
TimeIntervalEnd:=TimeIntervalEnd+TimeZoneDelta;
if (TimeIntervalBegin = UndefinedTimestamp) then TimeIntervalBegin:=TimeIntervalEnd-1.0;
IntervalSlider_TimeResolution:=(TimeIntervalEnd-TimeIntervalBegin){Days delta}/(Width/2.0);
//.
IntervalSlider.SetData(IntervalSlider.CurrentTime, (IntervalSlider_TimeResolution*IntervalSlider_TimeResolutionScale), TimeIntervalBegin,TimeIntervalEnd, TimeMarks);
end;

procedure TfmReflectionWindowActualityIntervalPanel.Reset();
begin
IntervalSlider.ClearTimeInterval();
end;

procedure TfmReflectionWindowActualityIntervalPanel.wmUpdatePanel(var Message: TMessage);
begin
Update();
end;

procedure TfmReflectionWindowActualityIntervalPanel.wmResetAndUpdatePanel(var Message: TMessage);
begin
Reset();
Update();
end;

procedure TfmReflectionWindowActualityIntervalPanel.PostUpdatePanel();
begin
PostMessage(Handle, WM_UPDATEPANEL, 0,0);
end;

procedure TfmReflectionWindowActualityIntervalPanel.PostResetAndUpdatePanel();
begin
PostMessage(Handle, WM_RESETANDUPDATEPANEL, 0,0);
end;

procedure TfmReflectionWindowActualityIntervalPanel.IntervalSlider_DoOnSelectInterval(const pInterval: TTimeInterval);
var
  ActualityInterval: TComponentActualityInterval;
begin
if (pInterval.Duration > 0.0)
 then begin
  ActualityInterval.BeginTimestamp:=pInterval.Time-TimeZoneDelta;
  ActualityInterval.EndTimestamp:=ActualityInterval.BeginTimestamp+pInterval.Duration;
  end
 else begin
  ActualityInterval.BeginTimestamp:=NullTimestamp;
  ActualityInterval.EndTimestamp:=MaxTimestamp;
  end;
Reflector.ReflectionWindow.SetActualityInterval(ActualityInterval);
Reflector.Reflecting.ResetReflect();
end;

procedure TfmReflectionWindowActualityIntervalPanel.UpdaterTimer(Sender: TObject);
begin
Update();
end;

procedure TfmReflectionWindowActualityIntervalPanel.FormShow(Sender: TObject);
begin
IntervalSlider.CurrentTime:=Now;
//.
///? Reset();
Update();
end;

procedure TfmReflectionWindowActualityIntervalPanel.tbTimeScaleChange(Sender: TObject);
const
  MaxScale = 30.0;
var
  F: double;
begin
F:=(tbTimeScale.Position/(tbTimeScale.Max DIV 2)-1.0);
IntervalSlider_TimeResolutionScale:=1.0;
if (F > 0) then IntervalSlider_TimeResolutionScale:=1/(IntervalSlider_TimeResolutionScale+(MaxScale*F)) else
if (F < 0) then IntervalSlider_TimeResolutionScale:=IntervalSlider_TimeResolutionScale-MaxScale*F;
IntervalSlider.SetTimeResolution(IntervalSlider_TimeResolution*IntervalSlider_TimeResolutionScale);
end;



end.
