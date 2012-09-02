unit unitTimeIntervalSlider;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ExtCtrls;

type
  TTimeIntervalSliderTimeMark = record
    Time: TDateTime;
    Color: TColor;
  end;

  TTimeInterval = record
    Time: TDateTime;
    Duration: TDateTime;
  end;

  TTimeIntervalSliderTimeMarkInterval = record
    Time: TDateTime;
    Duration: TDateTime;
    Color: TColor;
  end;

  TDOOnTimeSelected = procedure (const Time: TDateTime) of Object;
  TDOOnIntervalSelected = procedure (const Interval: TTimeInterval) of Object;

  TTimeIntervalSliderTimeMarks = array of TTimeIntervalSliderTimeMark;

  TTimeIntervalSliderTimeMarkIntervals = array of TTimeIntervalSliderTimeMarkInterval;

  TTimeIntervalSlider = class(TPaintBox)
  private
    CurrentTime: TDateTime;
    TimeResolution: TDateTime;
    TimeIntervalBegin: TDateTime;
    TimeIntervalEnd: TDateTime;
    TimeMarks: TTimeIntervalSliderTimeMarks;
    TimeMarkIntervals: TTimeIntervalSliderTimeMarkIntervals;
    SelectedInterval: TTimeInterval;
    BMP: TBitmap;
    flMoving: boolean;
    flTimeSelecting: boolean;
    flIntervalSelecting: boolean;
    Mouse_LastX: integer;
    Mouse_LastY: integer;
    Mouse_LastDownTime: TDateTime;

    procedure DoOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DoOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DoOnMouseClick(Sender: TObject);
    procedure DoOnMouseDblClick(Sender: TObject);
    procedure wmCM_MOUSELEAVE(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DoOnMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  public
    OnTimeSelected: TDOOnTimeSelected;
    OnIntervalSelected: TDOOnIntervalSelected;

    Constructor Create(const pCurrentTime: TDateTime; const pTimeResolution: TDateTime; const pTimeIntervalBegin,pTimeIntervalEnd: TDateTime; const pTimeMarks: TTimeIntervalSliderTimeMarks = nil; const pTimeMarkIntervals: TTimeIntervalSliderTimeMarkIntervals = nil);
    Destructor Destroy(); override;
    procedure Paint(); override;
    procedure Move(const dX: integer);
    procedure SetCurrentTime(const pCurrentTime: TDateTime; const flFireEvent: boolean = true);
    procedure SelectTimeInterval(const Interval: TTimeInterval; const flFireEvent: boolean = true);
  end;


implementation
uses
  Math;



{TTimeIntervalSlider}
Constructor TTimeIntervalSlider.Create(const pCurrentTime: TDateTime; const pTimeResolution: TDateTime; const pTimeIntervalBegin,pTimeIntervalEnd: TDateTime; const pTimeMarks: TTimeIntervalSliderTimeMarks = nil; const pTimeMarkIntervals: TTimeIntervalSliderTimeMarkIntervals = nil);
begin
Inherited Create(nil);
CurrentTime:=pCurrentTime;
TimeResolution:=pTimeResolution;
TimeIntervalBegin:=pTimeIntervalBegin;
TimeIntervalEnd:=pTimeIntervalEnd;
TimeMarks:=pTimeMarks;
TimeMarkIntervals:=pTimeMarkIntervals;
SelectedInterval.Duration:=0.0;
//.
Mouse_LastDownTime:=0.0;
flMoving:=false;
flTimeSelecting:=false;
OnMouseDown:=DoOnMouseDown;
OnMouseUp:=DoOnMouseUp;
OnMouseMove:=DoOnMouseMove;
OnClick:=DoOnMouseClick;
OnDblClick:=DoOnMouseDblClick;
BMP:=TBitmap.Create();
end;

Destructor TTimeIntervalSlider.Destroy();
begin
BMP.Free();
Inherited;
end;

procedure TTimeIntervalSlider.DoOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  DblClickTime = (1.0/(24*3600*1000))*333{milliseconds};
var
  _CurrentTime: TDateTime;
begin
try
flMoving:=true;
if (Button = mbLeft)
 then begin
  _CurrentTime:=CurrentTime+((X-(Width DIV 2))*TimeResolution);
  if (NOT ((TimeIntervalBegin <= _CurrentTime) AND (_CurrentTime <= TimeIntervalEnd))) then Exit; //. ->
  //.
  if ((Now-Mouse_LastDownTime) > DblClickTime)
   then begin
    SelectedInterval.Time:=_CurrentTime;
    SelectedInterval.Duration:=0.0;
    end
   else begin
    SelectedInterval.Time:=TimeIntervalBegin;
    SelectedInterval.Duration:=(TimeIntervalEnd-TimeIntervalBegin);
    //.
    flMoving:=false;
    end;
  //.
  Paint();
  //.
  if (Assigned(OnIntervalSelected)) then OnIntervalSelected(SelectedInterval);
  //.
  flIntervalSelecting:=true;
  end
 else flTimeSelecting:=true;
finally
Mouse_LastX:=X;
Mouse_LastY:=Y;
Mouse_LastDownTime:=Now;
end;
end;

procedure TTimeIntervalSlider.DoOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if (flMoving)
 then begin
  flMoving:=false;
  end;
flTimeSelecting:=false;
flIntervalSelecting:=false;
end;

procedure TTimeIntervalSlider.wmCM_MOUSELEAVE(var Message: TMessage);
begin
flMoving:=false;
flTimeSelecting:=false;
flIntervalSelecting:=false;
end;

procedure TTimeIntervalSlider.DoOnMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var
  _CurrentTime: TDateTime;
  Interval: TTimeInterval;
begin
if (flMoving)
 then begin
  if (flIntervalSelecting)
   then begin
    _CurrentTime:=CurrentTime+((X-(Width DIV 2))*TimeResolution);
    if (_CurrentTime < TimeIntervalBegin) then _CurrentTime:=TimeIntervalBegin;
    if (_CurrentTime > TimeIntervalEnd) then _CurrentTime:=TimeIntervalEnd;
    //.
    SelectedInterval.Duration:=_CurrentTime-SelectedInterval.Time;
    //.
    Paint();
    //. fire event
    if (Assigned(OnIntervalSelected))
     then begin
      Interval:=SelectedInterval;
      if (Interval.Duration < 0.0)
       then begin
        Interval.Time:=Interval.Time+Interval.Duration;
        Interval.Duration:=-Interval.Duration;
        end;
      OnIntervalSelected(Interval);
      end;
    end else
  if (flTimeSelecting)
   then begin
    Move(-(X-Mouse_LastX));
    //.
    if (Assigned(OnTimeSelected)) then OnTimeSelected(CurrentTime);
    end ;
  //.
  Mouse_LastX:=X;
  Mouse_LastY:=Y;
  end;
end;

procedure TTimeIntervalSlider.DoOnMouseClick(Sender: TObject);
begin
end;

procedure TTimeIntervalSlider.DoOnMouseDblClick(Sender: TObject);
begin
end;

procedure TTimeIntervalSlider.Move(const dX: integer);
var
  _CurrentTime: TDateTime;
begin
_CurrentTime:=CurrentTime+(dX*TimeResolution);
if (_CurrentTime < TimeIntervalBegin) then _CurrentTime:=TimeIntervalBegin; 
if (_CurrentTime > TimeIntervalEnd) then _CurrentTime:=TimeIntervalEnd;
if (_CurrentTime = CurrentTime) then Exit; //. ->
//.
CurrentTime:=_CurrentTime;
//.
Paint();
end;

procedure TTimeIntervalSlider.SetCurrentTime(const pCurrentTime: TDateTime; const flFireEvent: boolean);
begin
//.
CurrentTime:=pCurrentTime;
//.
Paint();
//.
if (flFireEvent AND Assigned(OnTimeSelected)) then OnTimeSelected(CurrentTime);
end;

procedure TTimeIntervalSlider.SelectTimeInterval(const Interval: TTimeInterval; const flFireEvent: boolean = true);
begin
//.
SelectedInterval:=Interval;
//.
Paint();
//.
if (flFireEvent AND Assigned(OnIntervalSelected)) then OnIntervalSelected(SelectedInterval);
end;

procedure TTimeIntervalSlider.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
Inherited SetBounds(ALeft,ATop,AWidth,AHeight);
//.
if (BMP <> nil)
 then begin
  BMP.Width:=AWidth;
  BMP.Height:=AHeight;
  end;
end;

procedure TTimeIntervalSlider.Paint();
const
  BackgroundColor = TColor($00C5C5C5);
  TimeIntervalColor = clWhite;
  CenterMarkerColor = TColor($000000BF);
  CenterMarkerColorHigh = clRed;
  TimeMarkerColor = clBlack;
  SelectedIntervalTimeMarkerColor = clBlack;
  DayDelta = 1.0;
  HourMarkerColor = clBlack;
  HourDelta = 1.0/24.0;
  M30MarkerColor = clBlack;
  M30Delta = 30.0/(24.0*60.0);
  M15MarkerColor = clBlack;
  M15Delta = 15.0/(24.0*60.0);

var
  Mid: integer;
  TIB,TIE,IntervalBegin,IntervalEnd: TDateTime;
  S: string;
  Day,Hour,M30,M15: TDateTime;
  X,Y,Y1,L: integer;
  DY,HY,M30Y,M15Y: integer;
  TW,LP,DLLP,HLLP,M30LLP,M15LLP: integer;
  I: integer;
begin
Inherited;
//.
with BMP.Canvas do begin
//. draw background
Brush.Color:=BackgroundColor;
Pen.Color:=Canvas.Brush.Color;
Pen.Width:=1;
Rectangle(0,0,Width,Height);
//.
Mid:=(Width DIV 2);
IntervalBegin:=CurrentTime-(Mid*TimeResolution);
IntervalEnd:=CurrentTime+(Mid*TimeResolution);
//. draw TimeInterval
Brush.Color:=TimeIntervalColor;
Pen.Color:=Canvas.Brush.Color;
if (TimeIntervalBegin >= IntervalBegin) then TIB:=TimeIntervalBegin else TIB:=IntervalBegin;
if (TimeIntervalEnd <= IntervalEnd) then TIE:=TimeIntervalEnd else TIE:=IntervalEnd;
Rectangle(Trunc(Mid+(TIB-CurrentTime)/TimeResolution),0,Trunc(Mid+(TIE-CurrentTime)/TimeResolution),Height);
//. draw selected interval
if (SelectedInterval.Duration <> 0.0)
 then begin
  Pen.Width:=1;
  Brush.Style:=bsSolid;
  Y:=0;
  X:=Trunc(Mid+(SelectedInterval.Time-CurrentTime)/TimeResolution);
  L:=Ceil(SelectedInterval.Duration/TimeResolution);
  //.
  Brush.Color:=clRed;
  Pen.Color:=Brush.Color;
  Rectangle(X,Y,X+L,Height);
  //.
  S:=FormatDateTime('HH:NN:SS',SelectedInterval.Time);
  Font.Color:=SelectedIntervalTimeMarkerColor;
  Font.Style:=[];
  Brush.Style:=bsClear;
  TextOut(X+3,TextHeight(S),S);
  S:=FormatDateTime('HH:NN:SS',SelectedInterval.Time+SelectedInterval.Duration)+' ('+FormatDateTime('HH:NN',SelectedInterval.Duration)+')';
  TextOut((X+L)+3,2*TextHeight(S),S);
  Brush.Style:=bsSolid;
  end;
//. draw Day marks
Pen.Color:=TimeMarkerColor;
Pen.Width:=1;
Font.Color:=clNavy;
Font.Style:=[];
Brush.Style:=bsClear;
DY:=Trunc(Height*(1/4));
DLLP:=-MaxInt;
Day:=Floor(IntervalBegin/DayDelta)*DayDelta;
while (Day < IntervalEnd) do begin
  X:=Trunc(Mid+(Day-CurrentTime)/TimeResolution);
  MoveTo(X,Height); LineTo(X,DY);
  S:=FormatDateTime('DD.MM',Day);
  TW:=(TextWidth(S) DIV 2);
  LP:=X-TW;
  if (LP > DLLP)
   then begin
    TextOut(LP,DY-TextHeight(S),S);
    DLLP:=X+TW;
    end;
  //. draw Hour marks
  HY:=Trunc(Height*(1/2));
  HLLP:=-MaxInt;
  Hour:=Day+HourDelta;
  while (Hour < (Day+DayDelta)) do begin
    X:=Trunc(Mid+(Hour-CurrentTime)/TimeResolution);
    MoveTo(X,Height); LineTo(X,HY);
    S:=FormatDateTime('HH',Hour);
    TW:=(TextWidth(S) DIV 2);
    LP:=X-TW;
    if (LP > HLLP)
     then begin
      TextOut(LP,HY-TextHeight(S),S);
      HLLP:=X+2*TW;
      end;
    //.
    Hour:=Hour+HourDelta;
    end;
  //.
  Day:=Day+DayDelta;
  //. draw M30 marks
  M30Y:=Trunc(Height*(5/8));
  M30LLP:=-MaxInt;
  M30:=Day-DayDelta+M30Delta;
  while (M30 < (Hour+HourDelta)) do begin
    X:=Trunc(Mid+(M30-CurrentTime)/TimeResolution);
    MoveTo(X,Height); LineTo(X,M30Y);
    {///? S:=FormatDateTime('NN',M30);
    TW:=(TextWidth(S) DIV 2);
    LP:=X-TW;
    if (LP > M30LLP)
     then begin
      TextOut(LP,M30Y-TextHeight(S),S);
      M30LLP:=X+2*TW;
      end;}
    //.
    M30:=M30+HourDelta;
    end;
  //. draw M15 marks
  M15Y:=Trunc(Height*(3/4));
  M15LLP:=-MaxInt;
  M15:=Day-DayDelta+M15Delta;
  while (M15 < (M30+M30Delta)) do begin
    X:=Trunc(Mid+(M15-CurrentTime)/TimeResolution);
    MoveTo(X,Height); LineTo(X,M15Y);
    {///? S:=FormatDateTime('NN',M15);
    TW:=(TextWidth(S) DIV 2);
    LP:=X-TW;
    if (LP > M15LLP)
     then begin
      TextOut(LP,M15Y-TextHeight(S),S);
      M15LLP:=X+2*TW;
      end;}
    //.
    M15:=M15+M30Delta;
    end;
  end;
//. draw center marker
Pen.Color:=CenterMarkerColor;
Pen.Width:=3;
MoveTo(Mid,0); LineTo(Mid,Height);
Pen.Width:=1;
Pen.Color:=CenterMarkerColorHigh;
MoveTo(Mid,0); LineTo(Mid,Height);
Font.Color:=clblack;
Font.Style:=[fsBold];
TextOut(Mid+3,0,FormatDateTime('HH:NN:SS DD.MM',CurrentTime));
//. draw TimeMarks
if (Length(TimeMarks) > 0)
 then begin
  Pen.Width:=1;
  Brush.Style:=bsSolid;
  Y:=Trunc(Height*(7/8));
  Y1:=Trunc(Height*(15/16))-1;
  for I:=0 to Length(TimeMarks)-1 do begin
    X:=Trunc(Mid+(TimeMarks[I].Time-CurrentTime)/TimeResolution);
    //.
    Brush.Color:=TimeMarks[I].Color;
    Pen.Color:=Brush.Color;
    Rectangle(X,Y,X+3,Y1);
    end;
  end;
if (Length(TimeMarkIntervals) > 0)
 then begin
  Pen.Width:=1;
  Brush.Style:=bsSolid;
  Y:=Trunc(Height*(15/16));
  for I:=0 to Length(TimeMarkIntervals)-1 do begin
    X:=Trunc(Mid+(TimeMarkIntervals[I].Time-CurrentTime)/TimeResolution);
    L:=Ceil(TimeMarkIntervals[I].Duration/TimeResolution);
    //.
    Brush.Color:=TimeMarkIntervals[I].Color;
    Pen.Color:=Brush.Color;
    Rectangle(X,Y,X+L,Height);
    end;
  end;
end;
//.
Canvas.Draw(0,0,BMP);
end;



end.
