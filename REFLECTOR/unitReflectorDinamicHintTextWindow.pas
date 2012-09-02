unit unitReflectorDinamicHintTextWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unitReflector, ExtCtrls;

type
  TfmReflectorDynamicHintTextWindow = class(TForm)
    Memo: TMemo;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
    idHint: integer;

    procedure Process;
  public
    { Public declarations }
    Constructor Create(const pReflector: TReflector);
  end;

implementation

{$R *.dfm}


Constructor TfmReflectorDynamicHintTextWindow.Create(const pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
idHint:=0;
end;

procedure TfmReflectorDynamicHintTextWindow.Process;

  procedure ProcessShow;
  var
    I: byte;
  begin
  Timer.Interval:=100;
  Show();
  {//. alpha blend is not work in case of child window AlphaBlendValue:=0;
  Show;
  for I:=1 to 51 do begin
    AlphaBlendValue:=I*5;
    Application.ProcessMessages;
    end;
  AlphaBlendValue:=High(AlphaBlendValue);}
  end;

  procedure GetTextWidthAndHeight(const pMemo: TMemo; out W,H: integer);
  var
    I: integer;
  begin
  Font.Assign(pMemo.Font);
  H:=Canvas.TextHeight(pMemo.Lines[0])*pMemo.Lines.Count;
  W:=0;
  for I:=0 to pMemo.Lines.Count-1 do
    if (Canvas.TextWidth(pMemo.Lines[I]) > W) then W:=Canvas.TextWidth(pMemo.Lines[I]);
  H:=H+2;
  W:=W+2;
  end;

  procedure NormalizeString(var S: string);
  var
    I: integer;
    SR: string;
  begin
  SR:='';
  for I:=1 to Length(S) do if (S[I] = #$0A) then SR:=SR+#$0D#$0A else SR:=SR+S[I];
  S:=SR;
  end;

var
  ptrDynaHintItem: pointer;
  R: boolean;
  Item: TDynamicHint;
  P: Windows.TPoint;
  _id: integer;
  S: string;
  TextFontName: string;
  TextFontSize: integer;
  TextFontColor: TColor;
  _Extent: TRect;
  W,H: integer;
begin
with Reflector do begin
DynamicHints.Lock.Enter;
try
R:=(DynamicHints.flEnabled AND DynamicHints.GetItemAtPoint(Point(FXMsLast,FYMsLast), ptrDynaHintItem));
if (R)
 then with TDynamicHint(ptrDynaHintItem^) do begin
  _id:=id;
  S:=''; ///? InfoText;
  TextFontName:=''; ///? InfoTextFontName;
  TextFontSize:=10; ///? InfoTextFontSize;
  TextFontColor:=clNone; ///? InfoTextFontColor;
  _Extent:=Extent;
  end;
finally
DynamicHints.Lock.Leave;
end;
if (R)
 then begin
  if (_id <> idHint)
   then begin
    if (S <> '')
     then begin
      Self.Hide;
      Timer.Interval:=1000;
      //.
      NormalizeString(S);
      Self.Memo.Text:=S;
      Self.Memo.Font.Name:=TextFontName;
      Self.Memo.Font.Size:=TextFontSize;
      Self.Memo.Font.Color:=TextFontColor;
      GetTextWidthAndHeight(Self.Memo, W,H);
      Self.Parent:=Reflector;
      Self.Width:=W;
      Self.Height:=H;
      //. P:=Reflector.ScreenToClient(Point(FXMsLast,FYMsLast));
      Self.Left:=_Extent.Left;
      Self.Top:=_Extent.Bottom;
      ProcessShow;
      end
     else begin
      Self.Hide;
      Timer.Interval:=1000;
      end;
   idHint:=_id;
   end;
  end
 else begin
  idHint:=0;
  Self.Hide;
  Timer.Interval:=1000;
  end;
end;
end;

procedure TfmReflectorDynamicHintTextWindow.TimerTimer(Sender: TObject);
begin
Timer.Enabled:=false;
try
Process;
finally
Timer.Enabled:=true;
end;
end;


end.
