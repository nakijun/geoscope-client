unit unitPanelPropsProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Gauges, SpaceObjInterpretation, ExtCtrls;

type
  TfmPanelPropsProgress = class(TForm)
    Gauge: TGauge;
    sbStop: TSpeedButton;
    Timer: TTimer;
    Bevel1: TBevel;
    procedure sbStopClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    Updating: TPropsPanelsUpdating;
  public
    { Public declarations }
    Constructor Create(const pUpdating: TPropsPanelsUpdating);
    procedure ReAlign;
  end;

implementation

{$R *.dfm}


Constructor TfmPanelPropsProgress.Create(const pUpdating: TPropsPanelsUpdating);
begin
Inherited Create(nil);
Updating:=pUpdating;
Parent:=Updating.PanelProps;
Width:=67;
end;

procedure TfmPanelPropsProgress.ReAlign;
begin
with Updating.PanelProps do begin
Self.Left:=ClientWidth-Updating.PanelProps.VertScrollBar.Size-Self.Width-2;
Self.Top:=2;
Self.BringToFront;
end;
end;

procedure TfmPanelPropsProgress.sbStopClick(Sender: TObject);
begin
Updating.flCancel:=true;
end;

procedure TfmPanelPropsProgress.TimerTimer(Sender: TObject);
begin
if (Updating.flCancel) then Exit; //. ->
if (Updating.ComponentCount > 0) then Show;
ReAlign;
end;

end.
