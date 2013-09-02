unit unitGMOHeatMeterBusinessModelAnalysisPanel;

interface

uses
  Windows, Messages, StrUtils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGMOHeatMeterBusinessModel, ExtCtrls, StdCtrls, Buttons;

const
  ChannelCount = 6;
  BackgroundColor = $00400000;

  ChannelCode_NoChannelData     = -1;
  ChannelCode_NoChannel         = -2;

  ChannelTitleHeight = 20;

  TempFolder = 'TempDATA';

  MToVFactor = 1.01;
  
type
  TAnalysisEventChannelV1 = packed record
    RC: integer;
    P: integer;
    T: integer;
    MassFlow: double;
    Heat: double;
  end;

  TAnalysisEventChannelMinMax = packed record
    Min: TAnalysisEventChannelV1;
    Max: TAnalysisEventChannelV1;
  end;

  TAnalysisEventV1 = packed record
    TimeStamp: double;
    flGcal: boolean;
    Channels: array[0..ChannelCount-1] of TAnalysisEventChannelV1;
  end;

  TReportStyle = (
    rsHour      = 1,
    rsDay       = 2
  );

  TGMOHeatMeterBusinessModelAnalysisPanel = class;
  
  TAnalysisEventAnalysis = class
  private
    AnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel;
  public
    StartTimestamp: double;
    //.
    Events: TMemoryStream;
    Count: integer;
    //.
    MinMax: array[0..ChannelCount-1] of TAnalysisEventChannelMinMax;

    Constructor Create(const pAnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel; const pStartTimestamp: double);
    Destructor Destroy(); override;
    procedure AddEvent(const Event: TAnalysisEventV1);
    procedure Process();
    function GetFirstEvent(): TAnalysisEventV1;
    function GetLastEvent(): TAnalysisEventV1;
    procedure Channel_DrawOnCanvas(const Channel: integer; const Canvas: TCanvas; const R: TRect);
    function  Channel_Drawing_GetPositionInfo(const Channel: integer; const Canvas: TCanvas; const R: TRect; const PX,PY: integer; out oTimestamp: double; out oValue: string): boolean;
    function CreateXLSReport(const ReportStyle: TReportStyle; const ReportFileName: string): boolean;
  end;

  TGMOHeatMeterBusinessModelAnalysisPanel = class(TForm)
    PaintBox: TPaintBox;
    Panel1: TPanel;
    btnCreateHourXLSReport: TBitBtn;
    btnCreateDayXLSReport: TBitBtn;
    procedure PaintBoxPaint(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCreateHourXLSReportClick(Sender: TObject);
    procedure btnCreateDayXLSReportClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGMOHeatMeterBusinessModel;
    Bitmap: TBitmap;
    DayDate: TDateTime;
    DaysCount: integer;
    Analysis: TAnalysisEventAnalysis;
    Visor_X: integer;
    Visor_Y: integer;

    function Process(): TAnalysisEventAnalysis;
    procedure Bitmap_Draw();
  public
    { Public declarations }
    ModelID: string;
    SerialNumber: string;
    ObjectID: string ;
    LifeTime: string;
    Algorithm: string;
    flGcal: boolean;
    
    Constructor Create(const pModel: TGMOHeatMeterBusinessModel; const pDayDate: TDateTime; const pDaysCount: integer);
    procedure Update(); reintroduce;
  end;


  function ConvertChannelCodeToString(const RC: integer): string;

implementation
uses
  TlHelp32,
  ActiveX,
  MSXML,
  Excel_TLB,
  ZLibEx,
  ShellAPI,
  unitObjectModel,
  unitGeoMonitoredObjectModel, unitBusinessModel, Math;

{$R *.dfm}


function ConvertChannelCodeToString(const RC: integer): string;
begin
SetLength(Result,0);
if (RC = 0)
 then begin
  Result:='OK'; 
  Exit; //. ->
  end;
//.
case (RC) of
ChannelCode_NoChannelData: begin
  Result:='No channel data';
  Exit; //. ->
  end;
ChannelCode_NoChannel: begin
  Result:='No channel';
  Exit; //. ->
  end;
end;
//.
if ((RC AND 1) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'power is off';
  end;
if ((RC AND 2) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'mass flow detector failure';
  end;
if ((RC AND 4) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'T detector failure';
  end;
if ((RC AND 8) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'P detector failure';
  end;
if ((RC AND 16) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'no P detector';
  end;
if ((RC AND 32) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'no T detector';
  end;
if ((RC AND 64) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'Q < 0';
  end;
if ((RC AND 128) > 0)
 then begin
  if (Length(Result) > 0) then Result:=Result+', ';
  Result:=Result+'no channel link';
  end;
end;

function KillTask(ExeFileName: string): integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: Thandle;
  FProcessEntry32: TprocessEntry32;
begin
  result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase
          (ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase
          (ExeFileName))) then
      result := integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE,
            BOOL(0), FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := process32next(FSnapshotHandle, FProcessEntry32);
  end;

  closehandle(FSnapshotHandle);
end;


{TAnalysisEventAnalysis}
Constructor TAnalysisEventAnalysis.Create(const pAnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel; const pStartTimestamp: double);
begin
Inherited Create();
AnalysisPanel:=pAnalysisPanel;
StartTimestamp:=pStartTimestamp;
Events:=TMemoryStream.Create();
end;

Destructor TAnalysisEventAnalysis.Destroy();
begin
Events.Free();
Inherited;
end;

procedure TAnalysisEventAnalysis.AddEvent(const Event: TAnalysisEventV1);
begin
Events.Write(Event,SizeOf(Event));
end;

procedure TAnalysisEventAnalysis.Process();
var
  C,I: integer;
  Event: TAnalysisEventV1;
begin
Events.Position:=0;
Count:=(Events.Size DIV SizeOf(TAnalysisEventV1));
(*///? for C:=0 to ChannelCount-1 do with MinMax[C] do begin
  Min.P:=MaxInt;
  Min.T:=MaxInt;
  Min.MassFlow:=MaxDouble;
  Min.Heat:=MaxDouble;
  //.
  Max.P:=-MaxInt;
  Max.T:=-MaxInt;
  Max.MassFlow:=-MaxDouble;
  Max.Heat:=-MaxDouble;
  end;
for I:=0 to Count-1 do begin
  Events.Read(Event,SizeOf(Event));
  for C:=0 to ChannelCount-1 do with MinMax[C] do begin
    if (Event.Channels[C].P < Min.P)
     then Min.P:=Event.Channels[C].P;
    if (Event.Channels[C].P > Max.P)
       then Max.P:=Event.Channels[C].P;
    if (Event.Channels[C].T < Min.T)
     then Min.T:=Event.Channels[C].T;
    if (Event.Channels[C].T > Max.T)
       then Max.T:=Event.Channels[C].T;
    if (Event.Channels[C].MassFlow < Min.MassFlow)
     then Min.MassFlow:=Event.Channels[C].MassFlow;
    if (Event.Channels[C].MassFlow > Max.MassFlow)
     then Max.MassFlow:=Event.Channels[C].MassFlow;
    if (Event.Channels[C].Heat < Min.Heat)
     then Min.Heat:=Event.Channels[C].Heat;
    if (Event.Channels[C].Heat > Max.Heat)
     then Max.Heat:=Event.Channels[C].Heat;
    end;
  end;*)
for C:=0 to ChannelCount-1 do with MinMax[C] do begin
  Min.P:=10;
  Min.T:=0;
  Min.MassFlow:=0.0;
  Min.Heat:=0.0;
  //.
  Max.P:=160;
  Max.T:=15000;
  Max.MassFlow:=100.0;
  Max.Heat:=100.0;
  end;
end;

function TAnalysisEventAnalysis.GetFirstEvent(): TAnalysisEventV1;
begin
Events.Position:=0;
Events.Read(Result,SizeOf(Result));
end;

function TAnalysisEventAnalysis.GetLastEvent(): TAnalysisEventV1;
begin
Events.Position:=(Count-1)*SizeOf(Result);
Events.Read(Result,SizeOf(Result));
end;

procedure TAnalysisEventAnalysis.Channel_DrawOnCanvas(const Channel: integer; const Canvas: TCanvas; const R: TRect);
var
  StepX: double;
  GW: double;

  procedure DrawParameter(const PI: integer; const Rect: TRect; const BackgeroundColor: TColor; const SignalColor: TColor);
  const
    MeshSize = 16;
  var
    I,J,IV: integer;
    CntX,CntY: integer;
    Title: string;
    Event: TAnalysisEventV1;
    V,D: double;
    X,Y: double;
  begin
  Canvas.Brush.Color:=BackgeroundColor;
  Canvas.Pen.Color:=Canvas.Brush.Color;
  Canvas.Pen.Style:=psSolid;
  Canvas.Rectangle(Rect);
  CntX:=((Rect.Right-Rect.Left) DIV MeshSize);
  CntY:=((Rect.Bottom-Rect.Top) DIV MeshSize);
  Canvas.Pen.Color:=TColor($004D4D4D);
  Canvas.Pen.Style:=psDot;
  for I:=0 to CntY do begin
    IV:=Rect.Bottom-I*MeshSize;
    Canvas.MoveTo(Rect.Left,IV);
    Canvas.LineTo(Rect.Right,IV);
    end;
  for J:=0 to CntX do begin
    IV:=Rect.Left+J*MeshSize;
    Canvas.MoveTo(IV,Rect.Top);
    Canvas.LineTo(IV,Rect.Bottom);
    end;
  case PI of
  0: Title:='P';
  1: Title:='T';
  2: Title:='MassFlow';
  3: Title:='Heat';
  end;
  Canvas.Font.Color:=clWhite;
  Canvas.Font.Style:=[fsBold];
  Canvas.TextOut(Rect.Left+8,Rect.Top+8, Title);
  //.
  Canvas.Pen.Color:=SignalColor;
  Canvas.Pen.Style:=psSolid;
  Events.Position:=0;
  Events.Read(Event,SizeOf(Event));
  case PI of
  0: begin
    X:=Rect.Left;
    D:=(MinMax[Channel].Max.P-MinMax[Channel].Min.P);
    if (D = 0.0) then Exit; //. ->
    Y:=Rect.Bottom-GW*(Event.Channels[Channel].P-MinMax[Channel].Min.P)/D;
    if (Y < Rect.Top) then Y:=Rect.Top;
    if (Y > Rect.Bottom) then Y:=Rect.Bottom;
    Canvas.MoveTo(Trunc(X),Trunc(Y));
    for I:=1 to Count-1 do begin
      Events.Read(Event,SizeOf(Event));
      X:=X+StepX;
      Y:=Rect.Bottom-GW*(Event.Channels[Channel].P-MinMax[Channel].Min.P)/D;
      if (Y < Rect.Top) then Y:=Rect.Top;
      if (Y > Rect.Bottom) then Y:=Rect.Bottom;
      Canvas.LineTo(Trunc(X),Trunc(Y));
      end;
    end;
  1: begin
    X:=Rect.Left;
    D:=(MinMax[Channel].Max.T-MinMax[Channel].Min.T);
    if (D = 0.0) then Exit; //. ->
    Y:=Rect.Bottom-GW*(Event.Channels[Channel].T-MinMax[Channel].Min.T)/D;
    if (Y < Rect.Top) then Y:=Rect.Top;
    if (Y > Rect.Bottom) then Y:=Rect.Bottom;
    Canvas.MoveTo(Trunc(X),Trunc(Y));
    for I:=1 to Count-1 do begin
      Events.Read(Event,SizeOf(Event));
      X:=X+StepX;
      Y:=Rect.Bottom-GW*(Event.Channels[Channel].T-MinMax[Channel].Min.T)/D;
      if (Y < Rect.Top) then Y:=Rect.Top;
      if (Y > Rect.Bottom) then Y:=Rect.Bottom;
      Canvas.LineTo(Trunc(X),Trunc(Y));
      end;
    end;
  2: begin
    X:=Rect.Left;
    D:=(MinMax[Channel].Max.MassFlow-MinMax[Channel].Min.MassFlow);
    if (D = 0.0) then Exit; //. ->
    Y:=Rect.Bottom-GW*(Event.Channels[Channel].MassFlow-MinMax[Channel].Min.MassFlow)/D;
    if (Y < Rect.Top) then Y:=Rect.Top;
    if (Y > Rect.Bottom) then Y:=Rect.Bottom;
    Canvas.MoveTo(Trunc(X),Trunc(Y));
    for I:=1 to Count-1 do begin
      Events.Read(Event,SizeOf(Event));
      X:=X+StepX;
      Y:=Rect.Bottom-GW*(Event.Channels[Channel].MassFlow-MinMax[Channel].Min.MassFlow)/D;
      if (Y < Rect.Top) then Y:=Rect.Top;
      if (Y > Rect.Bottom) then Y:=Rect.Bottom;
      Canvas.LineTo(Trunc(X),Trunc(Y));
      end;
    end;
  3: begin
    X:=Rect.Left;
    D:=(MinMax[Channel].Max.Heat-MinMax[Channel].Min.Heat);
    if (D = 0.0) then Exit; //. ->
    Y:=Rect.Bottom-GW*(Event.Channels[Channel].Heat-MinMax[Channel].Min.Heat)/D;
    if (Y < Rect.Top) then Y:=Rect.Top;
    if (Y > Rect.Bottom) then Y:=Rect.Bottom;
    Canvas.MoveTo(Trunc(X),Trunc(Y));
    for I:=1 to Count-1 do begin
      Events.Read(Event,SizeOf(Event));
      X:=X+StepX;
      Y:=Rect.Bottom-GW*(Event.Channels[Channel].Heat-MinMax[Channel].Min.Heat)/D;
      if (Y < Rect.Top) then Y:=Rect.Top;
      if (Y > Rect.Bottom) then Y:=Rect.Bottom;
      Canvas.LineTo(Trunc(X),Trunc(Y));
      end;
      end;
  end;
  end;

begin
StepX:=(0.0+R.Right-R.Left)/(Count-1);
GW:=(0.0+R.Bottom-R.Top)/4;
//. draw P
DrawParameter(0, Classes.Rect(R.Left,Trunc(R.Top+0.0*GW),R.Right,Trunc(R.Top+(0.0+1)*GW)), TColor($00400000), clWhite);
//. draw T
DrawParameter(1, Classes.Rect(R.Left,Trunc(R.Top+1.0*GW),R.Right,Trunc(R.Top+(1.0+1)*GW)), TColor($00400040), clYellow);
//. draw MassFlow
DrawParameter(2, Classes.Rect(R.Left,Trunc(R.Top+2.0*GW),R.Right,Trunc(R.Top+(2.0+1)*GW)), TColor($00400000), clBlue);
//. draw Heat
DrawParameter(3, Classes.Rect(R.Left,Trunc(R.Top+3.0*GW),R.Right,Trunc(R.Top+(3.0+1)*GW)), TColor($00400040), clRed);
end;

function TAnalysisEventAnalysis.Channel_Drawing_GetPositionInfo(const Channel: integer; const Canvas: TCanvas; const R: TRect; const PX,PY: integer; out oTimestamp: double; out oValue: string): boolean;
var
  GW: double;

  function CheckParameter(const PI: integer; const Rect: TRect): boolean;
  var
    TF: double;
    VS: string;
    I,J,IV: integer;
    CntX,CntY: integer;
    Title: string;
    Event: TAnalysisEventV1;
    V: double;
    X,Y: double;
  begin
  if ((PX < Rect.Left) OR (PX > Rect.Right) OR (PY < Rect.Top) OR (PY > Rect.Bottom)) then Exit; //. ->
  //.
  TF:=(0.0+PX-Rect.Left)/(Rect.Right-Rect.Left);
  Events.Position:=Trunc(TF*Count)*SizeOf(Event);
  Events.Read(Event,SizeOf(Event));
  oTimestamp:=Event.TimeStamp;
  case PI of
  0: VS:=FormatFloat('0.000',Event.Channels[Channel].P/100)+' MPa';
  1: VS:=FormatFloat('0.00',Event.Channels[Channel].T/100)+' C';
  2: VS:=FormatFloat('0.000',Event.Channels[Channel].MassFlow)+' t/h';
  3: begin
    if (Event.flGcal)
     then VS:=FormatFloat('0.000',Event.Channels[Channel].Heat)+' GCal/h'
     else VS:=FormatFloat('0.000',Event.Channels[Channel].Heat)+' GJ/h';
    end;
  end;
  oValue:=VS;
  Result:=true;
  end;

begin
Result:=false;
//.
GW:=(0.0+R.Bottom-R.Top)/4;
//. P
if (CheckParameter(0, Classes.Rect(R.Left,Trunc(R.Top+0.0*GW),R.Right,Trunc(R.Top+(0.0+1)*GW))))
 then begin
  Result:=true;
  Exit; //. ->                                           .
  end;
//. T
if (CheckParameter(1, Classes.Rect(R.Left,Trunc(R.Top+1.0*GW),R.Right,Trunc(R.Top+(1.0+1)*GW))))
 then begin
  Result:=true;
  Exit; //. ->
  end;
//. MassFlow
if (CheckParameter(2, Classes.Rect(R.Left,Trunc(R.Top+2.0*GW),R.Right,Trunc(R.Top+(2.0+1)*GW))))
 then begin
  Result:=true;
  Exit; //. ->
  end;
//. Heat
if (CheckParameter(3, Classes.Rect(R.Left,Trunc(R.Top+3.0*GW),R.Right,Trunc(R.Top+(3.0+1)*GW))))
 then begin
  Result:=true;
  Exit; //. ->
  end;
end;

function TAnalysisEventAnalysis.CreateXLSReport(const ReportStyle: TReportStyle; const ReportFileName: string): boolean;

  procedure Report_WriteHeader(const Sheet: _Worksheet);
  begin
  with Sheet.Range['A1',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='';
  Value2:='Адрес: пр Ленина 162-1';
  end;
  with Sheet.Range['A2',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='';
  Value2:='Тип прибора: TC-11 версия: '+AnalysisPanel.ModelID;
  end;
  with Sheet.Range['A3',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='';
  Value2:='Дата и время считывания архивных данных: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',StartTimestamp+TimeZoneDelta);
  end;
  with Sheet.Range['A4',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='';
  Value2:='Общее время наработки на момент считывания архивных данных, ч: '+AnalysisPanel.LifeTime;
  end;
  with Sheet.Range['A5',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='';
  Value2:='№ прибора: 01070070';
  end;
  with Sheet.Range['F6',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='Bold';
  Value2:='Тип архива: суточный';
  end;
  with Sheet.Range['E7',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='Bold';
  Value2:='Ведомость учёта параметров ГВСI';
  end;
  with Sheet.Range['F8',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=10;
  Font.FontStyle:='Bold';
  Value2:='за период c '+FormatDateTime('DD/MM/YYYY HH:NN:SS',GetFirstEvent().TimeStamp+TimeZoneDelta)+' по '+FormatDateTime('DD/MM/YYYY HH:NN:SS',GetLastEvent().TimeStamp+TimeZoneDelta);
  end;
  //.
  with Sheet.Range['A9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='Дата';
  end;
  with Sheet.Range['B9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='Наработка';
  end;
  with Sheet.Range['C9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='М3, т';
  end;
  with Sheet.Range['D9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='V3, м3';
  end;
  with Sheet.Range['E9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='T3, °C';
  end;
  with Sheet.Range['F9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='P3, МПа';
  end;
  with Sheet.Range['G9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='M4, т';
  end;
  with Sheet.Range['H9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='V4, м3';
  end;
  with Sheet.Range['I9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='T4, °C';
  end;
  with Sheet.Range['J9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='P4, МПа';
  end;
  with Sheet.Range['K9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='M3-M4, т';
  end;
  with Sheet.Range['L9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='V3-V4, м3';
  end;
  with Sheet.Range['M9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='T3-T4, °C';
  end;
  with Sheet.Range['N9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='Q3, ГКал';
  end;
  with Sheet.Range['O9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='Q4, ГКал';
  end;
  with Sheet.Range['P9',EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:='Qq1, ГКал';
  end;
  end;

  procedure Report_WriteHourRow(const Sheet: _Worksheet; const Row: integer; const T,dT: double; const AverageEvent: TAnalysisEventV1; const AverageEventCount: integer);
  begin
  with Sheet.Range['A'+IntToStr(Row),EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:=FormatDateTime('DD.MM.YY HH',(T-dT)+TimeZoneDelta)+':00:00';
  end;
  if (AverageEventCount > 0)
   then begin
    with Sheet.Range['B'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:='01:00:00';
    end;
    with Sheet.Range['C'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[2].MassFlow);
    end;
    with Sheet.Range['D'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[2].MassFlow*MToVFactor);
    end;
    with Sheet.Range['E'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageEvent.Channels[2].T/100.0);
    end;
    with Sheet.Range['F'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageEvent.Channels[2].P/100.0);
    end;
    with Sheet.Range['G'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['H'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[3].MassFlow*MToVFactor);
    end;
    with Sheet.Range['I'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageEvent.Channels[3].T/100.0);
    end;
    with Sheet.Range['J'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageEvent.Channels[3].P/100.0);
    end;
    with Sheet.Range['K'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[2].MassFlow-AverageEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['L'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',(AverageEvent.Channels[2].MassFlow-AverageEvent.Channels[3].MassFlow)*MToVFactor);
    end;
    with Sheet.Range['M'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',(AverageEvent.Channels[2].T-AverageEvent.Channels[3].T)/100.0);
    end;
    with Sheet.Range['N'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[2].MassFlow);
    end;
    with Sheet.Range['O'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['P'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageEvent.Channels[2].MassFlow-AverageEvent.Channels[3].MassFlow);
    end;
    end
   else begin
    with Sheet.Range['B'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:='00:00:00';
    end;
    end;
  end;
  
  procedure Report_WriteDayRow(const Sheet: _Worksheet; const Row: integer; const T,dT: double; const AverageDayEvent: TAnalysisEventV1; const AverageDayEventCount: integer);
  begin
  with Sheet.Range['A'+IntToStr(Row),EmptyParam] do begin
  Font.Name:='Arial Cyr';
  Font.Size:=8;
  Font.FontStyle:='';
  Value2:=FormatDateTime('DD.MM.YY',(T-dT)+TimeZoneDelta);
  end;
  if (AverageDayEventCount > 0)
   then begin
    with Sheet.Range['B'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=IntToStr(AverageDayEventCount)+':00:00';
    end;
    with Sheet.Range['C'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[2].MassFlow);
    end;
    with Sheet.Range['D'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[2].MassFlow*MToVFactor);
    end;
    with Sheet.Range['E'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageDayEvent.Channels[2].T/100.0);
    end;
    with Sheet.Range['F'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageDayEvent.Channels[2].P/100.0);
    end;
    with Sheet.Range['G'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['H'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[3].MassFlow*MToVFactor);
    end;
    with Sheet.Range['I'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageDayEvent.Channels[3].T/100.0);
    end;
    with Sheet.Range['J'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',AverageDayEvent.Channels[3].P/100.0);
    end;
    with Sheet.Range['K'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[2].MassFlow-AverageDayEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['L'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',(AverageDayEvent.Channels[2].MassFlow-AverageDayEvent.Channels[3].MassFlow)*MToVFactor);
    end;
    with Sheet.Range['M'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.00',(AverageDayEvent.Channels[2].T-AverageDayEvent.Channels[3].T)/100.0);
    end;
    with Sheet.Range['N'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[2].MassFlow);
    end;
    with Sheet.Range['O'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[3].MassFlow);
    end;
    with Sheet.Range['P'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:=FormatFloat('0.000',AverageDayEvent.Channels[2].MassFlow-AverageDayEvent.Channels[3].MassFlow);
    end;
    end
   else begin
    with Sheet.Range['B'+IntToStr(Row),EmptyParam] do begin
    Font.Name:='Arial Cyr';
    Font.Size:=8;
    Font.FontStyle:='';
    Value2:='00:00:00';
    end;
    end;
  end;
  
var
  XL: TExcelApplication;
  WB: _Workbook;
  Sheet: _Worksheet;
  LCID: integer;
  Col: ExcelRange;
  C,I: integer;
  Event: TAnalysisEventV1;
  T0,T,dT: double;
  AverageEvent: TAnalysisEventV1;
  AverageEventCount: integer;
  AverageDayEvent: TAnalysisEventV1;
  AverageDayEventCount: integer;
  HourIndex: integer;
  flAccept: boolean;
  Row: integer;
begin
Result:=false;
XL:=TExcelApplication.Create(nil);
try
LCID:=GetUserDefaultLCID;
XL.Connect();
try
WB:=XL.Workbooks.add(EmptyParam,LCID);
//.
Sheet:=(WB.ActiveSheet as _Worksheet);
//.
Sheet.Range['A1','A1000'].ColumnWidth:=14;
//.
Report_WriteHeader(Sheet);
//.
dT:=1.0/24.0; //. hour
T0:=Trunc(StartTimestamp);
T:=T0+dT;
AverageEvent.TimeStamp:=T0;
AverageEventCount:=0;
for C:=0 to ChannelCount-1 do begin
  AverageEvent.Channels[C].P:=0;
  AverageEvent.Channels[C].T:=0;
  AverageEvent.Channels[C].MassFlow:=0.0;
  AverageEvent.Channels[C].Heat:=0.0;
  end;
case (ReportStyle) of
rsDay: begin
  AverageDayEvent.TimeStamp:=T0;
  AverageDayEventCount:=0;
  for C:=0 to ChannelCount-1 do begin
    AverageDayEvent.Channels[C].P:=0;
    AverageDayEvent.Channels[C].T:=0;
    AverageDayEvent.Channels[C].MassFlow:=0.0;
    AverageDayEvent.Channels[C].Heat:=0.0;
    end;
  HourIndex:=0;
  end;
end;
Row:=10;
Events.Position:=0;
for I:=0 to Count-1 do begin
  Events.Read(Event,SizeOf(Event));
  if (Event.TimeStamp < T)
   then begin
    flAccept:=true;
    for C:=0 to ChannelCount-1 do begin
      if (Event.Channels[C].RC < 0)
       then begin
        flAccept:=false;
        break; //. >
        end;
      AverageEvent.Channels[C].P:=AverageEvent.Channels[C].P+Event.Channels[C].P;
      AverageEvent.Channels[C].T:=AverageEvent.Channels[C].T+Event.Channels[C].T;
      AverageEvent.Channels[C].MassFlow:=AverageEvent.Channels[C].MassFlow+Event.Channels[C].MassFlow;
      AverageEvent.Channels[C].Heat:=AverageEvent.Channels[C].Heat+Event.Channels[C].Heat;
      end;
    {///? if (flAccept) then} Inc(AverageEventCount);
    end
   else begin
    if (AverageEventCount > 0)
     then
      for C:=0 to ChannelCount-1 do begin
        AverageEvent.Channels[C].P:=Trunc(AverageEvent.Channels[C].P/AverageEventCount);
        AverageEvent.Channels[C].T:=Trunc(AverageEvent.Channels[C].T/AverageEventCount);
        AverageEvent.Channels[C].MassFlow:=AverageEvent.Channels[C].MassFlow/AverageEventCount;
        AverageEvent.Channels[C].Heat:=AverageEvent.Channels[C].Heat/AverageEventCount;
        end;
    //.
    case (ReportStyle) of
    rsHour: begin
      Report_WriteHourRow(Sheet,Row,T,dT,AverageEvent,AverageEventCount);
      //.
      Inc(Row);
      end;
    rsDay: begin
      if (AverageEventCount > 0)
       then begin
        for C:=0 to ChannelCount-1 do begin
          AverageDayEvent.Channels[C].P:=AverageDayEvent.Channels[C].P+AverageEvent.Channels[C].P;
          AverageDayEvent.Channels[C].T:=AverageDayEvent.Channels[C].T+AverageEvent.Channels[C].T;
          AverageDayEvent.Channels[C].MassFlow:=AverageDayEvent.Channels[C].MassFlow+AverageEvent.Channels[C].MassFlow;
          AverageDayEvent.Channels[C].Heat:=AverageDayEvent.Channels[C].Heat+AverageEvent.Channels[C].Heat;
          end;
        //.
        Inc(AverageDayEventCount);
        end;
      Inc(HourIndex);
      end;
    end;
    //.
    AverageEvent.TimeStamp:=T;
    AverageEventCount:=0;
    for C:=0 to ChannelCount-1 do begin
      AverageEvent.Channels[C].P:=0;
      AverageEvent.Channels[C].T:=0;
      AverageEvent.Channels[C].MassFlow:=0.0;
      AverageEvent.Channels[C].Heat:=0.0;
      end;
    case (ReportStyle) of
    rsDay: begin
      if (HourIndex = 24)
       then begin
        if (AverageDayEventCount > 0)
         then
          for C:=0 to ChannelCount-1 do begin
            AverageDayEvent.Channels[C].P:=Trunc(AverageDayEvent.Channels[C].P/AverageDayEventCount);
            AverageDayEvent.Channels[C].T:=Trunc(AverageDayEvent.Channels[C].T/AverageDayEventCount);
            end;
        //.
        Report_WriteDayRow(Sheet,Row,T,dT,AverageDayEvent,AverageDayEventCount);
        //.
        Inc(Row);
        //.
        AverageDayEvent.TimeStamp:=T;
        AverageDayEventCount:=0;
        for C:=0 to ChannelCount-1 do begin
          AverageDayEvent.Channels[C].P:=0;
          AverageDayEvent.Channels[C].T:=0;
          AverageDayEvent.Channels[C].MassFlow:=0.0;
          AverageDayEvent.Channels[C].Heat:=0.0;
          end;
        //.
        HourIndex:=0;
        end;
      end;
    end;
    //.
    T:=T+dT;
    end;
  end;
case (ReportStyle) of
rsDay: begin
  if (HourIndex > 0)
   then begin
    if (AverageDayEventCount > 0)
     then
      for C:=0 to ChannelCount-1 do begin
        AverageDayEvent.Channels[C].P:=Trunc(AverageDayEvent.Channels[C].P/AverageDayEventCount);
        AverageDayEvent.Channels[C].T:=Trunc(AverageDayEvent.Channels[C].T/AverageDayEventCount);
        end;
    //.
    Report_WriteDayRow(Sheet,Row,T,dT,AverageDayEvent,AverageDayEventCount);
    end;
  end;
end;
//.
ForceDirectories(ExtractFilePath(ReportFileName));
WB.SaveAs(ReportFileName,xlWorkbookNormal,'','',False,False,xlNoChange,xlLocalSessionChanges,True,0,0,EmptyParam,LCID);
finally
XL.Disconnect();
end;
finally
XL.Destroy();
KillTask('EXCEL.EXE');
end;
Result:=true;
end;


{TGMOHeatMeterBusinessModelAnalysisPanel}
Constructor TGMOHeatMeterBusinessModelAnalysisPanel.Create(const pModel: TGMOHeatMeterBusinessModel; const pDayDate: TDateTime; const pDaysCount: integer);
begin
Inherited Create(nil);
Model:=pModel;
DayDate:=pDayDate;
DaysCount:=pDaysCount;
//.
DoubleBuffered:=true;
//.
Update();
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.Update();
var
  XML: IXMLDOMDocument;
  XMLString: WideString;
  RootNode: IXMLDOMNode;
  DataNode: IXMLDOMNode;
  Node: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
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
  ModelID:=IntToStr(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('ID');
  SerialNumber:=IntToStr(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('ObjectID');
  ObjectID:=Trim(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('LifeTime');
  LifeTime:=Trim(Node.nodeTypedValue);
  Node:=DataNode.selectSingleNode('AlgorithmID');
  Algorithm:=IntToStr(Node.nodeTypedValue);
  flGcal:=(DataNode.selectSingleNode('CalculationID').nodeTypedValue = 156);
  end;
end;
Analysis:=Process();
end;

function TGMOHeatMeterBusinessModelAnalysisPanel.Process(): TAnalysisEventAnalysis;
const
  Portion = 4096;
var
  DaysLogDataStream: TMemoryStream;
  DayLogDataStream: TMemoryStream;
  RS: TMemoryStream;
  Day: integer;
  DataSize: integer;
  DS: TZDecompressionStream;
  Sz: Longint;
  Buffer: array[0..Portion-1] of byte;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  LastTrackNodeTimeStamp,Timestamp: double;
  flSetCommand: boolean;
  VersionNode: IXMLDOMNode;
  Version: integer;
  OperationsLogNode: IXMLDOMNode;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  OperationsLogItem: string;
  ElementAddress: TAddress;
  AddressIndex: integer;                                     
  ObjectModelElement: TComponentElement;
  Event: TAnalysisEventV1;

  function TelementryModel_ProcessEvent(TelemetryModelString: ANSIString; var Event: TAnalysisEventV1): boolean;
  var
    XML: IXMLDOMDocument;
    RootNode: IXMLDOMNode;
    DataNode: IXMLDOMNode;
    Node: IXMLDOMNode;
    ChannelsNode: IXMLDOMNode;
    VersionNode: IXMLDOMNode;
    Version: integer;
    ItemsNode: IXMLDOMNode;
    ChannelNode: IXMLDOMNode;
    I: integer;
    RC: string;
  begin
  Result:=false;
  if (Length(TelemetryModelString) = 0) then Exit; //. ->
  TelemetryModelString:=StringReplace(TelemetryModelString,'<?xmlversion="1.0"encoding="utf-16"?>','<?xml version="1.0" encoding="utf-8"?>',[rfReplaceAll]);
  XML:=CoDOMDocument.Create();
  XML.Set_Async(false);
  XML.LoadXml(TelemetryModelString);
  RootNode:=XML.documentElement;
  if (RootNode = nil) then Exit; //. ->
  //.
  Event.flGcal:=true;
  //.
  VersionNode:=RootNode.selectSingleNode('Version');
  Version:=0;
  if (VersionNode <> nil) then Version:=VersionNode.nodeTypedValue;
  case (Version) of
  1: begin
    DataNode:=RootNode.selectSingleNode('Data');
    Node:=DataNode.selectSingleNode('CalculationID');
    if (Node <> nil)
     then Event.flGcal:=(Node.nodeTypedValue = 156);
    end;
  end;
  //.
  ChannelsNode:=RootNode.selectSingleNode('Channels');
  VersionNode:=ChannelsNode.selectSingleNode('Version');
  Version:=0;
  if (VersionNode <> nil) then Version:=VersionNode.nodeTypedValue;
  case (Version) of
  1: begin
    ItemsNode:=ChannelsNode.selectSingleNode('Items');
    for I:=0 to 5 do begin
      ChannelNode:=ItemsNode.childNodes[I];
      RC:=ChannelNode.selectSingleNode('RC').nodeTypedValue;
      if (RC = 'NET')
       then Event.Channels[I].RC:=ChannelCode_NoChannel
       else
        if (RC = 'NO')
         then Event.Channels[I].RC:=ChannelCode_NoChannelData
         else Event.Channels[I].RC:=StrToInt(RC);
      //.
      if (RC <> 'NET')
       then begin
        Node:=ChannelNode.selectSingleNode('Pressure');
        if (Node <> nil)
         then Event.Channels[I].P:=Node.nodeTypedValue;
        Node:=ChannelNode.selectSingleNode('Temperature');
        if (Node <> nil)
         then Event.Channels[I].T:=Node.nodeTypedValue;
        Node:=ChannelNode.selectSingleNode('MassFlow');
        if (Node <> nil)
         then Event.Channels[I].MassFlow:=Node.nodeTypedValue;
        Node:=ChannelNode.selectSingleNode('Heat');
        if (Node <> nil)
         then Event.Channels[I].Heat:=Node.nodeTypedValue;
        end
       else begin
        Event.Channels[I].P:=-1;
        end;
      end;
    end;
  end;
  Result:=true;
  end;

begin
Result:=TAnalysisEventAnalysis.Create(Self,DayDate);
try
//. update Object Model
if (Model.ObjectModel.flComponentUserAccessControl)
 then begin
  Model.ObjectModel.ObjectSchema.RootComponent.ReadAllCUAC();
  Model.ObjectModel.ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  Model.ObjectModel.ObjectSchema.RootComponent.ReadAll();
  Model.ObjectModel.ObjectDeviceSchema.RootComponent.ReadAll();
  end;
//.
Model.ObjectModel.ObjectController.ObjectOperation_GetDaysLogData(DayDate,DaysCount, 1{ZLIB zipped XML format}, DaysLogDataStream);
try
DayLogDataStream:=TMemoryStream.Create();
try
DaysLogDataStream.Position:=0;
//.
RS:=TMemoryStream.Create();
try
DecimalSeparator:='.'; //. workaround
LastTrackNodeTimeStamp:=0.0;
for Day:=0 to DaysCount-1 do begin
  DaysLogDataStream.Read(DataSize,SizeOf(DataSize));
  if (DataSize <= 0) then Continue; //. ^
  DayLogDataStream.Size:=DataSize;
  DaysLogDataStream.Read(DayLogDataStream.Memory^,DataSize);
  //.
  DayLogDataStream.Position:=0;
  DS:=TZDecompressionStream.Create(DayLogDataStream);
  with DS do
  try
  RS.Size:=(DayLogDataStream.Size SHL 2);
  RS.Position:=0;
  repeat
    Sz:=DS.Read(Buffer,Portion);
    if (Sz > 0) then RS.Write(Buffer,Sz) else break; //. >
  until false;
  finally
  Destroy;
  end;
  DayLogDataStream.Size:=RS.Position;
  RS.Position:=0;
  DayLogDataStream.Position:=0;
  DayLogDataStream.CopyFrom(RS,DayLogDataStream.Size);
  DayLogDataStream.Position:=0;
  //.
  OLEStream:=TStreamAdapter.Create(DayLogDataStream);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
  for I:=0 to OperationsLogNode.childNodes.length-1 do begin
    OperationsLogItemNode:=OperationsLogNode.childNodes[I];
    OperationsLogItem:=OperationsLogItemNode.nodeName;
    if ((OperationsLogItem = 'SET') OR (OperationsLogItem = 'GET'))
     then begin
      flSetCommand:=(OperationsLogItem = 'SET');
      ElementAddress:=TSchemaComponent.GetAddressFromString(OperationsLogItemNode.selectSingleNode('Component').nodeTypedValue);
      AddressIndex:=0;
      if (ElementAddress[0] = 1)
       then ObjectModelElement:=Model.ObjectModel.ObjectSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
       else
        if (ElementAddress[0] = 2)
         then ObjectModelElement:=Model.ObjectModel.ObjectDeviceSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
         else ObjectModelElement:=nil;
      if (ObjectModelElement <> nil)
       then begin
        try
        TimeStamp:=OperationsLogItemNode.selectSingleNode('Time').nodeTypedValue;
        except
          TimeStamp:=EmptyTime;
          end;
        //.
        if ((Length(ElementAddress) = 3) AND ((ElementAddress[0] = 2) AND (ElementAddress[1] = 9) AND (ElementAddress[2] = 3)))
         then begin
          ObjectModelElement.FromXMLNodeByAddress(ElementAddress,AddressIndex, OperationsLogItemNode);
          if (ObjectModelElement is TComponentTimestampedANSIStringValue)
           then with TComponentTimestampedANSIStringValue(ObjectModelElement) do
            if (TelementryModel_ProcessEvent(Value.Value,{ref} Event))
             then begin
              Event.TimeStamp:=Value.Timestamp;
              Result.AddEvent(Event);
              end;
            end;
        end;
      end;
    end;
  end;
finally
RS.Destroy();
end;
finally
DayLogDataStream.Destroy();
end;
finally
DaysLogDataStream.Destroy();
//. restore Object Model
if (Model.ObjectModel.flComponentUserAccessControl)
 then begin
  Model.ObjectModel.ObjectSchema.RootComponent.ReadAllCUAC();
  Model.ObjectModel.ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  Model.ObjectModel.ObjectSchema.RootComponent.ReadAll();
  Model.ObjectModel.ObjectDeviceSchema.RootComponent.ReadAll();
  end;
end;
except
  FreeAndNil(Result);
  Raise; //. =>
  end;
Result.Process();
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.Bitmap_Draw();
var
  R: TRect;
  I,J,CI: integer;
  CT: string;
  TE: TSize;
begin
if (Analysis <> nil)
 then begin
  CI:=0;
  for I:=0 to 1 do
    for J:=0 to 2 do begin
      R.Left:=J*(Bitmap.Width DIV 3); R.Top:=I*(Bitmap.Height DIV 2);
      R.Right:=(J+1)*(Bitmap.Width DIV 3)-8;
      R.Bottom:=(I+1)*(Bitmap.Height DIV 2)-8;
      //. draw channel title
      CT:='Channel  № '+IntToStr(CI+1);
      Bitmap.Canvas.Brush.Color:=clWhite;
      Bitmap.Canvas.Pen.Color:=Bitmap.Canvas.Brush.Color;
      Bitmap.Canvas.Pen.Style:=psSolid;
      Bitmap.Canvas.Rectangle(R.Left,R.Top,R.Right,R.Top+ChannelTitleHeight);
      TE:=Bitmap.Canvas.TextExtent(CT);
      Bitmap.Canvas.Font.Color:=clBlack;
      Bitmap.Canvas.Font.Style:=[fsBold];
      Bitmap.Canvas.TextOut(R.Left+((R.Right-R.Left-TE.cx) DIV 2),R.Top+((ChannelTitleHeight-TE.cy) DIV 2), CT);
      R.Top:=R.Top+ChannelTitleHeight;
      //.
      Analysis.Channel_DrawOnCanvas(CI, Bitmap.Canvas, R);
      Inc(CI);
      end;
  end;
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.FormResize(Sender: TObject);
begin
FreeAndNil(Bitmap);
Bitmap:=TBitmap.Create();
Bitmap.Width:=PaintBox.Width;
Bitmap.Height:=PaintBox.Height;
//.
Bitmap_Draw();
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.FormShow(Sender: TObject);
begin
FormResize(Sender);
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.PaintBoxPaint(Sender: TObject);

  procedure Visor_Draw(const Canvas: TCanvas);
  const
    Rd = 3;
  var
    R: TRect;
    I,J,CI: integer;
    oTimestamp: double;
    oValue: string;
  begin
  Canvas.Pen.Color:=clRed;
  Canvas.Pen.Style:=psSolid;
  Canvas.MoveTo(0,Visor_Y);
  Canvas.LineTo(PaintBox.Width,Visor_Y);
  Canvas.MoveTo(Visor_X,0);
  Canvas.LineTo(Visor_X,PaintBox.Height);
  Canvas.Ellipse(Visor_X-Rd,Visor_Y-Rd,Visor_X+Rd,Visor_Y+Rd);
  //.
  CI:=0;
  for I:=0 to 1 do
    for J:=0 to 2 do begin
      R.Left:=J*(PaintBox.Width DIV 3); R.Top:=I*(PaintBox.Height DIV 2)+ChannelTitleHeight;
      R.Right:=(J+1)*(PaintBox.Width DIV 3)-8;
      R.Bottom:=(I+1)*(PaintBox.Height DIV 2)-8;
      if (Analysis.Channel_Drawing_GetPositionInfo(CI, PaintBox.Canvas, R, Visor_X,Visor_Y,{out} oTimestamp,{out} oValue))
       then begin
        PaintBox.Canvas.Brush.Color:=clBlack;
        PaintBox.Canvas.Font.Color:=clWhite;
        PaintBox.Canvas.Font.Style:=[];
        PaintBox.Canvas.TextOut(Visor_X+3,Visor_Y-32, ' '+oValue+' ');
        PaintBox.Canvas.TextOut(Visor_X+3,Visor_Y-16, ' '+FormatDateTime('HH:NN:SS DD/MM/YY',oTimestamp+TimeZoneDelta)+' ');
        //.
        Exit; //. ->
        end;
      Inc(CI);
      end;
  end;

begin
if (Analysis <> nil)
 then begin
  PaintBox.Canvas.Draw(0,0, Bitmap);
  Visor_Draw(PaintBox.Canvas);
  end;
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
Visor_X:=X;
Visor_Y:=Y;
//.
PaintBox.Repaint();
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.btnCreateHourXLSReportClick(Sender: TObject);
var
  TempReportFileName: string;
  SC: TCursor;
begin
TempReportFileName:=GetCurrentDir+'\'+TempFolder+'\'+'DATA'+FormatDateTime('YYYYMMDDHHNNSSZZZ',Now)+'.xls';
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
if (Analysis <> nil)
 then begin
  Analysis.CreateXLSReport(rsHour,TempReportFileName);
  //.
  ShellExecute(Handle,'open',PChar(TempReportFileName),nil,nil, SW_SHOW);
  end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGMOHeatMeterBusinessModelAnalysisPanel.btnCreateDayXLSReportClick(Sender: TObject);
var
  TempReportFileName: string;
  SC: TCursor;
begin
TempReportFileName:=GetCurrentDir+'\'+TempFolder+'\'+'DATA'+FormatDateTime('YYYYMMDDHHNNSSZZZ',Now)+'.xls';
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
if (Analysis <> nil)
 then begin
  Analysis.CreateXLSReport(rsDay,TempReportFileName);
  //.
  ShellExecute(0,'open',PChar(TempReportFileName),nil,nil, SW_SHOW);
  end;
finally
Screen.Cursor:=SC;
end;
end;


end.
