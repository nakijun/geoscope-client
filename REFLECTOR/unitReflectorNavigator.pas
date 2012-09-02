unit unitReflectorNavigator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons,
  unitReflector, ExtCtrls;

type
  TNavigationStep = (nsNone,nsMoveLeft,nsMoveUp,nsMoveRight,nsMoveDown,nsScaleUp,nsScaleDown,nsRotatePlus,nsRotateMinus);

  TfmReflectorNavigator = class(TForm)
    Ticker: TTimer;
    sbClose: TSpeedButton;
    sbMinimizeMaximize: TSpeedButton;
    pnlControls: TPanel;
    sbMoveUp: TSpeedButton;
    sbMoveLeft: TSpeedButton;
    sbMoveRight: TSpeedButton;
    sbMoveDown: TSpeedButton;
    sbScaleUp: TSpeedButton;
    sbScaleDown: TSpeedButton;
    sbRotatePlus: TSpeedButton;
    sbRotateMinus: TSpeedButton;
    sbHistoryBack: TSpeedButton;
    sbHistoryNext: TSpeedButton;
    Bevel1: TBevel;
    procedure sbMoveUpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveLeftMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveRightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveRightMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveUpMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveLeftMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveDownMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMoveDownMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbScaleUpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbScaleUpMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbScaleDownMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbScaleDownMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbRotatePlusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbRotatePlusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbRotateMinusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbRotateMinusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TickerTimer(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbMinimizeMaximizeClick(Sender: TObject);
    procedure sbHistoryBackClick(Sender: TObject);
    procedure sbHistoryNextClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    Reflector: TReflector;
    NavigationStep: TNavigationStep;
    flMaximized: boolean;

    procedure SetMaximize(const pflMaximize: boolean);
  public
    { Public declarations }

    Constructor Create(AOwner: TComponent); override;
    procedure Align;
  end;

implementation

{$R *.dfm}

Constructor TfmReflectorNavigator.Create(AOwner: TComponent);
begin
if (NOT (AOwner is TReflector)) then Raise Exception.Create('reflector type expected'); //. =>
Inherited Create(AOwner);
Reflector:=TReflector(AOwner);
Parent:=Reflector;
BringToFront;
NavigationStep:=nsNone;
flMaximized:=false;
//.
///?SetMaximize(true);
ClientWidth:=pnlControls.Width;
//.
Align;
end;

procedure TfmReflectorNavigator.Align;
begin
Top:=Reflector.ClientHeight-Height;
Left:=Reflector.ClientWidth-Width;
BringToFront();
end;

procedure TfmReflectorNavigator.SetMaximize(const pflMaximize: boolean);
var
  LastWidth: integer;
begin
if (pflMaximize = flMaximized) then Exit; //. =>
LastWidth:=Width;
if (pflMaximize)
 then begin
  pnlControls.Left:=0;
  sbClose.Left:=pnlControls.Left+pnlControls.Width+2;
  sbMinimizeMaximize.Left:=pnlControls.Left+pnlControls.Width+2;
  sbMinimizeMaximize.Caption:='>>';
  ClientWidth:=sbClose.Left+sbClose.Width;
  Left:=Left-(Width-LastWidth);
  pnlControls.Show();
  end
 else begin
  pnlControls.Hide();
  sbClose.Left:=0;
  sbMinimizeMaximize.Left:=0;
  sbMinimizeMaximize.Caption:='<<';
  ClientWidth:=sbClose.Left+sbClose.Width;
  Left:=Left-(Width-LastWidth);
  end;
flMaximized:=pflMaximize;
end;

procedure TfmReflectorNavigator.sbMoveUpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsMoveUp;
end;

procedure TfmReflectorNavigator.sbMoveUpMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbMoveLeftMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsMoveLeft;
end;

procedure TfmReflectorNavigator.sbMoveLeftMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbMoveRightMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsMoveRight;
end;

procedure TfmReflectorNavigator.sbMoveRightMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbMoveDownMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsMoveDown;
end;

procedure TfmReflectorNavigator.sbMoveDownMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbScaleUpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsScaleDown;
end;

procedure TfmReflectorNavigator.sbScaleUpMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbScaleDownMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsScaleUp;
end;

procedure TfmReflectorNavigator.sbScaleDownMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbRotatePlusMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsRotatePlus;
end;

procedure TfmReflectorNavigator.sbRotatePlusMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.sbRotateMinusMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsRotateMinus;
end;

procedure TfmReflectorNavigator.sbRotateMinusMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
NavigationStep:=nsNone;
end;

procedure TfmReflectorNavigator.TickerTimer(Sender: TObject);
const
  MoveShift = 32;
  ScaleCoef = 0.07;
  RotateAngle = PI/6;
begin
case NavigationStep of
nsMoveLeft: begin
  Reflector.PixShiftReflection(0,MoveShift);
  end;
nsMoveUp: begin
  Reflector.PixShiftReflection(MoveShift,0);
  end;
nsMoveRight: begin
  Reflector.PixShiftReflection(0,-MoveShift);
  end;
nsMoveDown: begin
  Reflector.PixShiftReflection(-MoveShift,0);
  end;
nsScaleUp: begin
  Reflector.ChangeScaleReflection(ScaleCoef);
  end;
nsScaleDown: begin
  Reflector.ChangeScaleReflection(-ScaleCoef);
  end;
nsRotatePlus: begin
  Reflector.RotateReflection(RotateAngle);
  end;
nsRotateMinus: begin
  Reflector.RotateReflection(-RotateAngle);
  end;
end;
end;

procedure TfmReflectorNavigator.sbCloseClick(Sender: TObject);
begin
Close();
end;

procedure TfmReflectorNavigator.sbMinimizeMaximizeClick(Sender: TObject);
begin
SetMaximize(NOT flMaximized);
end;

procedure TfmReflectorNavigator.sbHistoryBackClick(Sender: TObject);
begin
with Reflector do begin
LastPlaces_Back;
HistoryTimer.Enabled:=false;
HistoryTimer.Enabled:=true;
end;
end;

procedure TfmReflectorNavigator.sbHistoryNextClick(Sender: TObject);
begin
with Reflector do begin
LastPlaces_Next;
HistoryTimer.Enabled:=false;
HistoryTimer.Enabled:=true;
end;
end;

procedure TfmReflectorNavigator.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Tag:=1;
end;

end.
