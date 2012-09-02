unit unitMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitChanels, ExtCtrls, StdCtrls, Buttons, SyncObjs, Menus;

Type
  {ChanelsMonitor}
  TChanelsMonitorConfigStruc = packed record
    BackgroundColor: TColor;
    BackgroundColorDelta: integer;
    Mesh_Color: TColor;
    Mesh_stepX: integer;
    Mesh_stepY: integer;
    ChanelDrawIsoLineColor: TColor;
    SignalDefaultColor: TColor;
    RowPerChanel: integer;
    flChanelsGroupped: boolean;
    XSqueezeCoef: integer;
    YSqueezeCoef: Extended;
    {SignalsColorsCount: word}
    {SignalsColors: packed array [0..SignalsColorsCount-1] of TColor}
  end;

  TColors = array of TColor;

  TChanelsMonitor = class(TBitmap)
  private
    Lock: TCriticalSection;
    Mesh_BMP: TBitmap;
    FXSqueezeCoef: integer;
    FYSqueezeCoef: Extended;
    FRowPerChanel: integer;
    InteractiveCanvas: TCanvas;
    InteractiveControl: TWinControl;
    LastSelectionsY: array of smallint;
    FflChanelsGroupped: boolean;
    ConfigurationName: string;

    procedure DoOnBeforeAddSelections;
    procedure DoOnAddSelections(const Selections: TSelections);
    procedure DrawCanvasLine(Canvas: TCanvas; const X0,Y0,X1,Y1: integer; const pColor: TColor);
    procedure setRowPerChanel(Value: integer);
    procedure setXSqueezeCoef(Value: integer);
    procedure setYSqueezeCoef(Value: Extended);
    procedure setFlChanelsGroupped(Value: boolean);
  public
    Chanels: TChanels;
    Mesh_Color: TColor;
    Mesh_stepX: integer;
    Mesh_stepY: integer;
    BackgroundColor: TColor;
    BackgroundColorDelta: integer;
    ChanelDrawIsoLineColor: TColor; //. цвет нулевой линии канала
    SignalDefaultColor: TColor; //. цвет сигнала на экране
    ChanelNameColor: TColor; //. цвет надписи канала
    ChanelsColors: TColors;
    RowOffset: integer; //. смещение между строками вывода
    flOutputDisabled: boolean; //. если true то вывод только по заполнению внутреннего буфера

    Constructor Create(pChanels: TChanels; const pConfigurationName: string);
    Destructor Destroy; override;
    procedure Clear;
    function SetBounds(const NewWidth,NewHeight: integer): boolean;
    procedure ForceRepaint;
    procedure Mesh_ReCreate;
    procedure Mesh_Update;
    procedure Mesh_Draw;
    procedure Mesh_VertLine(const X: integer; const Y0,Y1: integer);
    procedure RecalculateRowOffset;
    procedure CopyParamsFrom(ChanelsMonitor: TChanelsMonitor);
    //. configuration routines
    procedure LoadConfiguration(const pConfigurationName: string);
    procedure SaveConfiguration;
    procedure EditConfiguration;
    procedure ValidateConfiguration;
    //.
    property RowPerChanel: integer read FRowPerChanel write setRowPerChanel; //. число строк вывода на канал (если > 1, канал рисуется в несколько строчек)
    property XSqueezeCoef: integer read FXSqueezeCoef write setXSqueezeCoef; //. коэф. сжатия по X
    property YSqueezeCoef: Extended read FYSqueezeCoef write setYSqueezeCoef; //. коэф. усиления по Y
    property flChanelsGroupped: boolean read FflChanelsGroupped write setFlChanelsGroupped; //. если RowPerChanel > 1 и этот флаг = true то каналы группируются и выводятся построчно
  end;



  {Chanels monitor form}
Const
  WM_FORCEREPAINT = WM_USER+1;
Type
  TfmMonitor = class(TForm)
    Popup: TPopupMenu;
    N1: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure N1Click(Sender: TObject);
  private
    procedure WMFORCEREPAINT(var Message: TMessage); message WM_FORCEREPAINT;
  public
    Monitor: TChanelsMonitor;
    flCanResize: boolean;

    Constructor Create(pChanels: TChanels; const pConfigurationName: string);
    Destructor Destroy; override;
  end;



var
  flConfigurable: boolean = true;
  flHided: boolean = false;

implementation
uses
  unitMonitorConfiguration;

{$R *.dfm}



{TChanelsMonitor}
Constructor TChanelsMonitor.Create(pChanels: TChanels; const pConfigurationName: string);
begin
Inherited Create;
Lock:=TCriticalSection.Create;
//.
FXSqueezeCoef:=1;
FYSqueezeCoef:=1;
FRowPerChanel:=1;
//.
PixelFormat:=pf16bit;
Height:=10;
Width:=10;
Mesh_Color:=clGray;
Mesh_stepX:=50;
Mesh_stepY:=50;
BackGroundColor:=TColor($002C3438);
BackgroundColorDelta:=0;
ChanelDrawIsoLineColor:=clWhite;
SignalDefaultColor:=clAqua;
ChanelNameColor:=clRed;
RowOffset:=Mesh_StepY;
flOutputDisabled:=false;
ConfigurationName:='';
//.
InteractiveCanvas:=nil;
InteractiveControl:=nil;
//. send handlers
Chanels:=TChanels.Create(pChanels);
with Chanels do begin
OnAddSelections:=Self.DoOnAddSelections;
OnBeforeAddSelections:=Self.DoOnBeforeAddSelections;
end;
//.
SetLength(ChanelsColors,0);
//.
if pConfigurationName <> ''
 then LoadConfiguration(pConfigurationName)
 else begin
  Mesh_ReCreate;
  Mesh_Draw;
  end;
end;

Destructor TChanelsMonitor.Destroy;
begin
Mesh_BMP.Free;
Chanels.Free;
Lock.Free;
Inherited;
end;

procedure TChanelsMonitor.Clear;
var
  OldWidth,OldHeight: integer;
begin
OldWidth:=Width; OldHeight:=Height;
Lock.Enter;
try
SetBounds(0,0);
SetBounds(OldWidth, OldHeight);
finally
Lock.Leave;
end;
end;

function TChanelsMonitor.SetBounds(const NewWidth,NewHeight: integer): boolean;
begin
Result:=false;
Lock.Enter;
try
//.
/// ? if NewWidth < Width then Chanels.ResizeCyclicBuffers(0);
Chanels.ResizeCyclicBuffers(NewWidth*FXSqueezeCoef*FRowPerChanel);
//.
Width:=NewWidth;
Height:=NewHeight;
//.
RecalculateRowOffset;
//.
Mesh_ReCreate;
//. repaint
ForceRepaint;
//.
finally
Lock.Leave;
end;
Result:=true;
end;

procedure TChanelsMonitor.DoOnBeforeAddSelections;
var
  X,Y: integer;
  Row: integer;
  I: integer;
  IC: integer;
  ChanelsEnabledCount: integer;
begin
if flOutputDisabled then Exit; //. ->
if flHided then Exit; //. ->
Lock.Enter;
try
//.
X:=Trunc(((TChanel(Chanels[0]).CyclicBuffer.BufferHeadOffset DIV SizeOf(TSelection)))/FXSqueezeCoef)+1;
if FRowPerChanel = 1
 then with TChanel(Chanels[0]) do begin
  Mesh_VertLine(X, 0,Height);
  end
 else with TChanel(Chanels[0]) do begin
  Row:=Trunc(X/Width);
  X:=X MOD Width;
  if FflChanelsGroupped then begin ChanelsEnabledCount:=0; for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then Inc(ChanelsEnabledCount); end;
  IC:=0;
  for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then begin
    if NOT FflChanelsGroupped
     then Y:=Round(RowOffset/2)+IC*FRowPerChanel*RowOffset+Row*RowOffset
     else Y:=Round(RowOffset/2)+IC*RowOffset+Row*(RowOffset*ChanelsEnabledCount);
    Mesh_VertLine(X, Y-Round(RowOffset/2),Y+Round(RowOffset/2));
    Inc(IC);
    end
  end;
//.
finally
Lock.Leave;
end;
end;

procedure TChanelsMonitor.DoOnAddSelections(const Selections: TSelections);
var
  SI: integer;
  X,XLast: integer;
  flDrawLine: boolean;
  I,IC: integer;
  CurRow: integer;
  Y,Yiso,YL: integer;
  RowOffsetHalf: integer;
  SignalColor: TColor;
  ChanelsEnabledCount: integer;
begin
if flOutputDisabled then Exit; //. ->
if flHided then Exit; //. ->
Lock.Enter;
try
//.
SI:=((TChanel(Chanels[0]).CyclicBuffer.BufferHeadOffset DIV SizeOf(TSelection))-1);
X:=Trunc(SI/FXSqueezeCoef);
CurRow:=Trunc(X/Width);
X:=X MOD Width;
if X > 0
 then begin
  Xlast:=Trunc((SI-1)/FXSqueezeCoef);
  Xlast:=Xlast MOD Width;
  flDrawLine:=true;
  end
 else
  flDrawLine:=false;
RowOffsetHalf:=Round(RowOffset/2)-1;
SetLength(LastSelectionsY,Chanels.Count);
if FflChanelsGroupped then begin ChanelsEnabledCount:=0; for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then Inc(ChanelsEnabledCount); end;
IC:=0;
for I:=0 to Chanels.Count-1 do begin
  if TChanel(Chanels[I]).Enabled
   then with TChanel(Chanels[I]) do begin
    if I < Length(ChanelsColors)
     then SignalColor:=ChanelsColors[I]
     else SignalColor:=SignalDefaultColor;
    if NOT FflChanelsGroupped
     then Y:=RowOffset+IC*FRowPerChanel*RowOffset+CurRow*RowOffset-Round(((Selections[I].Value-ZeroLevel)*FYSqueezeCoef/Range)*({1/2*}RowOffset))
     else Y:=RowOffset+IC*RowOffset+CurRow*(RowOffset*ChanelsEnabledCount)-Round(((Selections[I].Value-ZeroLevel)*FYSqueezeCoef/Range)*({1/2*}RowOffset));
    if FRowPerChanel = 1
     then begin            
      if Y < 0
       then
        Y:=0
       else
        if Y > Height then Y:=Height;
      end
     else begin
      if NOT FflChanelsGroupped
       then begin
        Yiso:=Round(RowOffset/2)+IC*FRowPerChanel*RowOffset+CurRow*RowOffset;
        YL:=Yiso-RowOffsetHalf+1;
        if Y < YL
         then
          Y:=YL
         else begin
          YL:=Yiso+RowOffsetHalf;
          if Y > YL then Y:=YL;
          end;
        end
       else begin
        YL:=CurRow*(RowOffset*ChanelsEnabledCount)+RowOffsetHalf+1;
        if Y < YL
         then
          Y:=YL
         else begin
          YL:=(CurRow+1)*(RowOffset*ChanelsEnabledCount)+RowOffsetHalf;
          if Y > YL then Y:=YL;
          end;
        end;
      end;
    if flDrawLine
     then begin
      DrawCanvasLine(Canvas, Xlast,LastSelectionsY[I],X,Y, SignalColor);
      if InteractiveCanvas <> nil then DrawCanvasLine(InteractiveCanvas, Xlast,LastSelectionsY[I],X,Y, SignalColor);
      end
     else begin
      Canvas.Lock;
      try
      Canvas.Pixels[X,Y]:=SignalColor;
      finally
      Canvas.UnLock;
      end;
      if InteractiveCanvas <> nil
       then begin
        InteractiveCanvas.Lock;
        try
        InteractiveCanvas.Pixels[X,Y]:=SignalColor;
        finally
        InteractiveCanvas.UnLock;
        end;
        end;
      end;
    Inc(IC);
    end;
  LastSelectionsY[I]:=Y;
  end;
//.
finally
Lock.Leave;
end;
end;

procedure TChanelsMonitor.setRowPerChanel(Value: integer);
begin
if FRowPerChanel = Value then Exit; //. ->
FRowPerChanel:=Value;
Clear;
Mesh_Update;
ForceRepaint;
end;

procedure TChanelsMonitor.setXSqueezeCoef(Value: integer);
begin
if FXSqueezeCoef = Value then Exit; //. ->
FXSqueezeCoef:=Value;
Clear;
ForceRepaint;
end;

procedure TChanelsMonitor.setYSqueezeCoef(Value: Extended);
begin
if FYSqueezeCoef = Value then Exit; //. ->
FYSqueezeCoef:=Value;
ForceRepaint;
end;

procedure TChanelsMonitor.setFlChanelsGroupped(Value: boolean);
begin
if Value = FflChanelsGroupped then Exit; //. ->
FflChanelsGroupped:=Value;
Mesh_Update;
ForceRepaint;
end;

procedure TChanelsMonitor.RecalculateRowOffset;
var
  NewRowOffset: integer;
  EnabledChanelsCount: integer;
  I: integer;
begin
//.
EnabledChanelsCount:=0;
for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then Inc(EnabledChanelsCount);
if EnabledChanelsCount = 0 then Exit; //. ->
//.
NewRowOffset:=Mesh_StepY;
while (NewRowOffset+Mesh_StepY)*(EnabledChanelsCount*FRowPerChanel+1) <= Height do Inc(NewRowOffset,Mesh_StepY);
RowOffset:=NewRowOffset;
end;

procedure TChanelsMonitor.CopyParamsFrom(ChanelsMonitor: TChanelsMonitor);
begin
RowPerChanel:=ChanelsMonitor.RowPerChanel;
XSqueezeCoef:=ChanelsMonitor.XSqueezeCoef;
YSqueezeCoef:=ChanelsMonitor.YSqueezeCoef;
SignalDefaultColor:=ChanelsMonitor.SignalDefaultColor;
end;

procedure TChanelsMonitor.ForceRepaint;
var
  I,IC,J: integer;
  CurRow: integer;
  X,Xlast: integer;
  Y,Ylast,Yiso,YL: integer;
  RowOffsetHalf: integer;
  SignalCOlor: TColor;
  ChanelsEnabledCount: integer;
begin
if flHided then Exit; //. ->
Lock.Enter;
try
//. draw mesh
Canvas.Draw(0,0,Mesh_BMP);
//.
RowOffsetHalf:=Round(RowOffset/2)-1;
if FflChanelsGroupped then begin ChanelsEnabledCount:=0; for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then Inc(ChanelsEnabledCount); end;
IC:=0;
for I:=0 to Chanels.Count-1 do with TChanel(Chanels[I]) do if Enabled then begin
  if I < Length(ChanelsColors)
   then SignalColor:=ChanelsColors[I]
   else SignalColor:=SignalDefaultColor;
  for J:=0 to CyclicBuffer.Count-1 do begin
    X:=Trunc(J/FXSqueezeCoef);
    CurRow:=Trunc(X/Width);
    X:=X MOD Width;
    if NOT FflChanelsGroupped
     then Y:=RowOffset+IC*FRowPerChanel*RowOffset+CurRow*RowOffset-Round(((TSelection(Pointer(Integer(CyclicBuffer.BufferPtr)+J*SizeOf(TSelection))^).Value-ZeroLevel)*FYSqueezeCoef/Range)*({1/2*}RowOffset))
     else Y:=RowOffset+IC*RowOffset+CurRow*(RowOffset*ChanelsEnabledCount)-Round(((TSelection(Pointer(Integer(CyclicBuffer.BufferPtr)+J*SizeOf(TSelection))^).Value-ZeroLevel)*FYSqueezeCoef/Range)*({1/2*}RowOffset));
    if (FRowPerChanel = 1) OR flOutputDisabled
     then begin
      if Y < 0
       then
        Y:=0
       else
        if Y > Height then Y:=Height;
      end
     else begin
      if NOT FflChanelsGroupped
       then begin
        Yiso:=Round(RowOffset/2)+IC*FRowPerChanel*RowOffset+CurRow*RowOffset;
        YL:=Yiso-RowOffsetHalf+1;
        if Y < YL
         then
          Y:=YL
         else begin
          YL:=Yiso+RowOffsetHalf;
          if Y > YL then Y:=YL;
          end;
        end
       else begin
        YL:=CurRow*(RowOffset*ChanelsEnabledCount)+RowOffsetHalf+1;
        if Y < YL
         then
          Y:=YL
         else begin
          YL:=(CurRow+1)*(RowOffset*ChanelsEnabledCount)+RowOffsetHalf;
          if Y > YL then Y:=YL;
          end;
        end;
      end;
    if (J MOD Width) > 0
     then begin
      DrawCanvasLine(Canvas, Xlast,Ylast,X,Y, SignalColor);
      end
     else begin
      Canvas.Lock;
      try
      Canvas.Pixels[X,Y]:=SignalColor;
      finally
      Canvas.UnLock;
      end;
      end;
    Xlast:=X;
    Ylast:=Y;
    end;
  Inc(IC);
  end;
if InteractiveCanvas <> nil then InteractiveCanvas.Draw(0,0,Self);
finally
Lock.Leave;
end;
end;

procedure TChanelsMonitor.DrawCanvasLine(Canvas: TCanvas; const X0,Y0,X1,Y1: integer; const pColor: TColor);
begin
with Canvas do begin
Lock;
try
Pen.Color:=pColor;
MoveTo(X0,Y0); LineTo(X1,Y1);
finally
UnLock;
end;
end;
end;

procedure TChanelsMonitor.Mesh_ReCreate;
begin
//. creating new mesh
if Mesh_BMP <> nil then Mesh_BMP.Destroy;
Mesh_BMP:=TBitmap.Create;
Mesh_BMP.Assign(Self);
//.
Mesh_Update;
end;

procedure TChanelsMonitor.Mesh_Update;
const
  Mesh__Cell_MarkLength = 3;
var
  X,Y: integer;
  MarkX,MarkY: integer;
  OldBkMode: integer;
  I,IC,IR,J: integer;
  ChanelsEnabledCount: integer;
  BkColor: TColor;
  R,G,B: byte;
begin
with Mesh_BMP,Canvas do begin
//. clear
ChanelsEnabledCount:=0; for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then Inc(ChanelsEnabledCount);
Brush.Color:=BackgroundColor;
Pen.Color:=BackgroundColor;
Pen.Style:=psSolid;
Rectangle(0,0,Width,Height);
BkColor:=BackgroundColor;
R:=(BkColor AND 255); G:=((BkColor SHR 8) AND 255); B:=((BkColor SHR 16) AND 255);
Brush.Color:=BkColor;
Pen.Color:=BkColor;
Rectangle(0,0,Width,Round(RowOffset/2));
if NOT FflChanelsGroupped
 then
  for J:=0 to RowPerChanel-1 do begin
    IC:=0;
    for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then begin
      Rectangle(0,Round(RowOffset/2)+IC*(RowOffset*RowPerChanel)+J*RowOffset-Round(RowOffset/2),Width,Round(RowOffset/2)+IC*(RowOffset*RowPerChanel)+J*RowOffset+Round(RowOffset/2));
      Inc(IC);
      end;
    Inc(R,BackgroundColorDelta); Inc(G,BackgroundColorDelta); Inc(B,BackgroundColorDelta);
    BkColor:=R+(G SHL 8)+(B SHL 16);
    Brush.Color:=BkColor;
    Pen.Color:=BkColor;
    end
 else
  for J:=0 to RowPerChanel-1 do begin
    Rectangle(0,J*RowOffset*ChanelsEnabledCount+Round(RowOffset/2),Width,(J+1)*RowOffset*ChanelsEnabledCount+Round(RowOffset/2));
    Inc(R,BackgroundColorDelta); Inc(G,BackgroundColorDelta); Inc(B,BackgroundColorDelta);
    BkColor:=R+(G SHL 8)+(B SHL 16);
    Brush.Color:=BkColor;
    Pen.Color:=BkColor;
    end;
//. main mesh drawing
X:=0;
while X < Width do with Canvas do begin
  for Y:=0 to Height-1 do if (Y MOD 3) = 0 then Pixels[X,Y]:=Mesh_Color;
  Inc(X,Mesh_stepX);
  end;
Y:=0;
while Y < Height do with Canvas do begin
  for X:=0 to Width-1 do if (X MOD 3) = 0 then Pixels[X,Y]:=Mesh_Color;
  Inc(Y,Mesh_stepY);
  end;
//. mesh cells marks drawing
Pen.Color:=Mesh_Color;
Pen.Style:=psSolid;
X:=0;
while X < Width do with Canvas do begin
  MarkX:=X+Round(Mesh_StepX/2);
  Y:=0;
  while Y < Height do with Canvas do begin
    MarkY:=Y-Trunc(Mesh__Cell_MarkLength/2);
    //. draw mark
    MoveTo(MarkX,MarkY); LineTo(MarkX,MarkY+Mesh__Cell_MarkLength);
    //.
    Inc(Y,Mesh_stepY);
    end;
  Inc(X,Mesh_stepX);
  end;
Y:=0;
while Y < Height do with Canvas do begin
  MarkY:=Y+Round(Mesh_StepY/2);
  X:=0;
  while X < Width do with Canvas do begin
    MarkX:=X-Trunc(Mesh__Cell_MarkLength/2);
    //. draw mark
    MoveTo(MarkX,MarkY); LineTo(MarkX+Mesh__Cell_MarkLength,MarkY);
    //.
    Inc(X,Mesh_stepX);
    end;
  Inc(Y,Mesh_stepY);
  end;
//. draw chanel zero level
IC:=0;
for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then begin
  for IR:=0 to FRowPerChanel-1 do
    for J:=0 to Width do if (J MOD 3) = 0 then Pixels[J,RowOffset+IC*FRowPerChanel*RowOffset+IR*RowOffset]:=ChanelDrawIsoLineColor;
  Inc(IC);
  end;
//. print chanels names
Font.Name:='Tahoma';
Font.Size:=10;
Font.Style:=[];
Font.Color:=ChanelNameColor;
OldBkMode:=SetBkMode(Handle, Windows.TRANSPARENT);
if NOT FflChanelsGroupped
 then begin
  IC:=0;
  for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then begin
    TextOut(3,RowOffset+IC*FRowPerChanel*RowOffset-TextHeight('ABC'),TChanel(Chanels[I]).Name);
    Inc(IC);
    end;
  end
 else begin
  for J:=0 to RowPerChanel-1 do begin
    IC:=0;
    for I:=0 to Chanels.Count-1 do if TChanel(Chanels[I]).Enabled then begin
      TextOut(3,RowOffset+J*RowOffset*ChanelsEnabledCount+IC*RowOffset-TextHeight('ABC'),TChanel(Chanels[I]).Name);
      Inc(IC);
      end;
    end;
  end;
SetBkMode(Handle, OldBkMode);
//.
end;
end;

procedure TChanelsMonitor.Mesh_Draw;
begin
Canvas.Draw(0,0,Mesh_BMP);
if InteractiveCanvas <> nil then InteractiveCanvas.Draw(0,0,Mesh_BMP);
end;

procedure TChanelsMonitor.Mesh_VertLine(const X: integer; const Y0,Y1: integer);
const
  LineThick = 10;
begin
Canvas.CopyRect(Rect(X,Y0,X+LineThick,Y1),Mesh_BMP.Canvas,Rect(X,Y0,X+LineThick,Y1));
if InteractiveCanvas <> nil then InteractiveCanvas.CopyRect(Rect(X,Y0,X+LineThick,Y1),Mesh_BMP.Canvas,Rect(X,Y0,X+LineThick,Y1));
end;

procedure TChanelsMonitor.LoadConfiguration(const pConfigurationName: string);
var
  ChanelsMonitorConfigStruc: TChanelsMonitorConfigStruc;
  ColorsCount: word;
  I: integer;
begin
if pConfigurationName <> ''
 then with TFileStream.Create(pConfigurationName, fmOpenRead) do
  try
  try
  //.
  if Read(ChanelsMonitorConfigStruc,SizeOf(ChanelsMonitorConfigStruc)) = SizeOf(ChanelsMonitorConfigStruc)
   then with ChanelsMonitorConfigStruc do begin
    Self.BackgroundColor:=BackgroundColor;
    Self.BackgroundColorDelta:=BackgroundColorDelta;
    Self.Mesh_Color:=Mesh_Color;
    Self.Mesh_stepX:=Mesh_stepX;
    Self.Mesh_stepY:=Mesh_stepY;
    Self.ChanelDrawIsoLineColor:=ChanelDrawIsoLineColor;
    Self.SignalDefaultColor:=SignalDefaultColor;
    Self.FRowPerChanel:=RowPerChanel;
    Self.FflChanelsGroupped:=flChanelsGroupped;
    Self.FXSqueezeCoef:=XSqueezeCoef;
    Self.FYSqueezeCoef:=YSqueezeCoef;
    ValidateConfiguration;
    ConfigurationName:=pConfigurationName;
    end;
  //. load signals colors
  if Read(ColorsCount,SizeOf(ColorsCount)) <> SizeOf(ColorsCount) then Raise Exception.Create('could not read monitor configuration'); //. =>
  SetLength(ChanelsColors,ColorsCount);
  for I:=0 to ColorsCount-1 do
    if Read(ChanelsColors[I],SizeOf(TColor)) <> SizeOf(TColor) then Raise Exception.Create('could not read monitor configuration'); //. =>
  //.
  except
    end;
  finally
  Destroy;
  end;
end;

procedure TChanelsMonitor.SaveConfiguration;
var
  ChanelsMonitorConfigStruc: TChanelsMonitorConfigStruc;
  ColorsCount: word;
  I: integer;
begin
if ConfigurationName <> ''
 then with TFileStream.Create(ConfigurationName, fmCreate) do
  try
  with ChanelsMonitorConfigStruc do begin
  BackgroundColor:=Self.BackgroundColor;
  BackgroundColorDelta:=Self.BackgroundColorDelta;
  Mesh_Color:=Self.Mesh_Color;
  Mesh_stepX:=Self.Mesh_stepX;
  Mesh_stepY:=Self.Mesh_stepY;
  ChanelDrawIsoLineColor:=Self.ChanelDrawIsoLineColor;
  SignalDefaultColor:=Self.SignalDefaultColor;
  RowPerChanel:=Self.FRowPerChanel;
  flChanelsGroupped:=Self.FflChanelsGroupped;
  XSqueezeCoef:=Self.FXSqueezeCoef;
  YSqueezeCoef:=Self.FYSqueezeCoef;
  end;
  if Write(ChanelsMonitorConfigStruc,SizeOf(ChanelsMonitorConfigStruc)) <> SizeOf(ChanelsMonitorConfigStruc) then Raise Exception.Create('could not write monitor configuration'); //. =>
  //. save signals colors
  ColorsCount:=Length(ChanelsColors);
  if Write(ColorsCount,SizeOf(ColorsCount)) <> SizeOf(ColorsCount) then Raise Exception.Create('could not write monitor configuration'); //. =>
  for I:=0 to ColorsCount-1 do
    if Write(ChanelsColors[I],SizeOf(TColor)) <> SizeOf(TColor) then Raise Exception.Create('could not write monitor configuration'); //. =>
  //.
  finally
  Destroy;
  end;
end;

procedure TChanelsMonitor.EditConfiguration;
begin
with TfmMonitorConfiguration.Create(Self) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TChanelsMonitor.ValidateConfiguration;
begin
Clear;
Mesh_Update;
ForceRepaint;
end;






{TfmMonitorTest}
Constructor TfmMonitor.Create(pChanels: TChanels; const pConfigurationName: string);
begin
Inherited Create(nil);
flCanResize:=true;
Monitor:=TChanelsMonitor.Create(pChanels, pConfigurationName);
Monitor.InteractiveCanvas:=Canvas;
Monitor.InteractiveControl:=Self;
if NOT flConfigurable then PopupMenu:=nil; 
end;

Destructor TfmMonitor.Destroy;
begin
Monitor.Free;
Inherited;
end;

procedure TfmMonitor.FormCanResize(Sender: TObject; var NewWidth,NewHeight: Integer; var Resize: Boolean);
begin
Resize:=flCanResize;
end;

procedure TfmMonitor.FormResize(Sender: TObject);
begin
Monitor.SetBounds(ClientWidth,ClientHeight);
end;

procedure TfmMonitor.WMFORCEREPAINT(var Message: TMessage);
begin
Monitor.ForceRepaint;
end;

procedure TfmMonitor.FormPaint(Sender: TObject);
begin
Canvas.Draw(0,0,Monitor);
end;


procedure TfmMonitor.N1Click(Sender: TObject);
begin
if flConfigurable then Monitor.EditConfiguration;
end;

end.
