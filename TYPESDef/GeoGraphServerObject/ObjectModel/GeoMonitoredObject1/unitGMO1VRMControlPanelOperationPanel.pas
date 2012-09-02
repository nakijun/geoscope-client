unit unitGMO1VRMControlPanelOperationPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1VideoRecorderMeasurementsControlPanel, StdCtrls,
  Buttons, ExtCtrls, ComCtrls;

const
  ProgressAnimationFile = 'Lib\AVI\Copy.avi';
type
  TfmGMO1VRMControlPanelOperationPanel = class(TForm)
    Starter: TTimer;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    Animate: TAnimate;
    stStatus: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure StarterTimer(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    ControlPanel: TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel;
    MeasurementID: string;
    //.
    flCancel: boolean;

    function IsCancel(): boolean;
  public
    { Public declarations }
    Constructor Create(const pControlPanel: TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel; const pMeasurementID: string);
  end;


implementation

{$R *.dfm}


Constructor TfmGMO1VRMControlPanelOperationPanel.Create(const pControlPanel: TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel; const pMeasurementID: string);
begin
Inherited Create(nil);
ControlPanel:=pControlPanel;
MeasurementID:=pMeasurementID;
end;

function TfmGMO1VRMControlPanelOperationPanel.IsCancel(): boolean;
begin
Application.ProcessMessages();
Result:=flCancel;
end;

procedure TfmGMO1VRMControlPanelOperationPanel.FormShow(Sender: TObject);
begin
Starter.Enabled:=true;
end;

procedure TfmGMO1VRMControlPanelOperationPanel.StarterTimer(Sender: TObject);
var
  MID: string;
  BaseFolder: string;
begin
Starter.Enabled:=false;
//.
Animate.FileName:=ExtractFilePath(ParamStr(0))+ProgressAnimationFile;
Animate.Active:=true;
//.
flCancel:=false;
try
try
stStatus.Caption:=' loading measurement ...'; stStatus.Repaint();
MID:=ControlPanel.OpenMeasurement(MeasurementID,IsCancel);
if (IsCancel()) then Raise EAbort.Create(''); //. =>
stStatus.Caption:='opening measurement ...'; stStatus.Repaint();
BaseFolder:=ControlPanel.VideoRecorderDataServerMeasurementsPanel.OpenMeasurement(MID);
if (IsCancel()) then Raise EAbort.Create(''); //. =>
finally
Close();
Application.ProcessMessages();
end;
stStatus.Caption:='playing measurement ...'; stStatus.Repaint();
ControlPanel.VideoRecorderDataServerMeasurementsPanel.PlayMeasurement(BaseFolder,MID);
except
  on E: EAbort do ;
  else
    Raise; //. =>
  end;
end;

procedure TfmGMO1VRMControlPanelOperationPanel.btnCancelClick(Sender: TObject);
begin
flCancel:=true;
end;


end.
