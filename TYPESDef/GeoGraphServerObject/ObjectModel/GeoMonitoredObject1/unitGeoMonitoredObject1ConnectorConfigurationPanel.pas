unit unitGeoMonitoredObject1ConnectorConfigurationPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitGeoMonitoredObject1Model, ComCtrls, Menus, StdCtrls, Buttons,
  ExtCtrls;

type
  TGeoMonitoredObject1ConnectorConfigurationPanel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnApply: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edLoopSleepTime: TEdit;
    Label1: TLabel;
    edTransmitInterval: TEdit;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    Configuration: TConnectorModuleConfiguration;
    flApply: boolean;
  public
    { Public declarations }
    Constructor Create(const pConfiguration: TConnectorModuleConfiguration);
    Destructor Destroy(); override;
    procedure Update; reintroduce;
    procedure Apply();
    function Dialog(): boolean;
  end;


implementation
uses
  unitObjectModel;

{$R *.dfm}


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TGeoMonitoredObject1ConnectorConfigurationPanel.Create(const pConfiguration: TConnectorModuleConfiguration);
begin
Inherited Create(nil);
Configuration:=pConfiguration;
//.
Update();
end;

Destructor TGeoMonitoredObject1ConnectorConfigurationPanel.Destroy();
begin
Inherited;
end;

procedure TGeoMonitoredObject1ConnectorConfigurationPanel.Update();
begin
edLoopSleepTime.Text:=IntToStr(Configuration.LoopSleepTime);
edTransmitInterval.Text:=IntToStr(Configuration.TransmitInterval);
end;

procedure TGeoMonitoredObject1ConnectorConfigurationPanel.Apply();
begin
Configuration.LoopSleepTime:=StrToInt(edLoopSleepTime.Text);
Configuration.TransmitInterval:=StrToInt(edTransmitInterval.Text);
end;

function TGeoMonitoredObject1ConnectorConfigurationPanel.Dialog(): boolean;
begin
flApply:=false;
ShowModal();
if (flApply)
 then begin
  Apply();
  Result:=true;
  end
 else Result:=false;
end;

procedure TGeoMonitoredObject1ConnectorConfigurationPanel.btnApplyClick(Sender: TObject);
begin
flApply:=true;
Close();
end;

procedure TGeoMonitoredObject1ConnectorConfigurationPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
