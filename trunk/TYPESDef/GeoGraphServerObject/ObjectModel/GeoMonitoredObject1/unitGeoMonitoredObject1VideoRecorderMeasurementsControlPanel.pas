unit unitGeoMonitoredObject1VideoRecorderMeasurementsControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1VideoRecorderMeasurementsPanel,
  unitGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel;

type
  TCancelHandler = function(): boolean of object;
    
  TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel = class(TForm)
    gbMeasurements: TGroupBox;
    gbDataServerMeasurements: TGroupBox;
    Splitter1: TSplitter;
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    //.
    ServerAddress: string;
    ServerPort: integer;
    //.
    flAlwaysUseProxy: boolean;
    ProxyServerHost: string;
    ProxyServerPort: integer;
    ProxyServerUserName: string;
    ProxyServerUserPassword: string;
    //.
    UserName: WideString;
    UserPassword: WideString;
    //.
    idGeographServerObject: Int64;

    procedure DoOnPlayMeasurement(MeasurementID: string);
  public
    { Public declarations }
    VideoRecorderMeasurementsPanel: TGeoMonitoredObject1VideoRecorderMeasurementsPanel;
    VideoRecorderDataServerMeasurementsPanel: TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel;
    
    Constructor Create(const pModel: TGeoMonitoredObject1Model; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64);
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
    function OpenMeasurement(MeasurementID: string; const CancelHandler: TCancelHandler): string;
  end;

implementation
uses
  unitGMO1VRMControlPanelOperationPanel;

{$R *.dfm}


{TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel}
Constructor TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.Create(const pModel: TGeoMonitoredObject1Model; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64);
begin
Inherited Create(nil);
Model:=pModel;
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
if (ServerPort = 0) then ServerPort:=GeographDataServerPort;
//.
flAlwaysUseProxy:=false;
ProxyServerHost:='';
ProxyServerPort:=0;
ProxyServerUserName:='';
ProxyServerUserPassword:='';
//.
UserName:=pUserName;
UserPassword:=pUserPassword;
//.
idGeographServerObject:=pidGeographServerObject;
//.
VideoRecorderMeasurementsPanel:=TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Create(Model);
VideoRecorderDataServerMeasurementsPanel:=TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Create(ServerAddress,ServerPort, UserName,UserPassword, idGeographServerObject);
//.
VideoRecorderMeasurementsPanel.OnPlayMeasurement:=DoOnPlayMeasurement;
VideoRecorderMeasurementsPanel.BorderStyle:=bsNone;
VideoRecorderMeasurementsPanel.Align:=alClient;
VideoRecorderMeasurementsPanel.Parent:=gbMeasurements;
VideoRecorderMeasurementsPanel.Show();
//.
VideoRecorderDataServerMeasurementsPanel.BorderStyle:=bsNone;
VideoRecorderDataServerMeasurementsPanel.Align:=alClient;
VideoRecorderDataServerMeasurementsPanel.Parent:=gbDataServerMeasurements;
VideoRecorderDataServerMeasurementsPanel.Show();
end;

Destructor TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.Destroy();
begin
VideoRecorderDataServerMeasurementsPanel.Free();
VideoRecorderMeasurementsPanel.Free();
Inherited;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.Update();
begin
VideoRecorderMeasurementsPanel.Update();
VideoRecorderDataServerMeasurementsPanel.Update();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.DoOnPlayMeasurement(MeasurementID: string);
begin
with TfmGMO1VRMControlPanelOperationPanel.Create(Self,MeasurementID) do
try
ShowModal();
finally
Destroy();
end;
end;

function TfmGeoMonitoredObject1VideoRecorderMeasurementsControlPanel.OpenMeasurement(MeasurementID: string; const CancelHandler: TCancelHandler): string;
const
  PauseTime = 5; //. seconds
var
  I,J: integer;
  Measurement: TMeasurement;
begin
if (CancelHandler()) then Raise EAbort.Create(''); //. =>
//.
Model.VideoRecorder_Measurements_MoveToDataServer(MeasurementID);
while (true) do begin
  for I:=0 to PauseTime-1 do begin
    for J:=0 to 9 do begin
      Sleep(100);
      //.
      if (CancelHandler()) then Raise EAbort.Create(''); //. =>
      end;
    end;
  //.
  VideoRecorderDataServerMeasurementsPanel.Update();
  if (VideoRecorderDataServerMeasurementsPanel.Measurements_GetItem(MeasurementID,{out} Measurement) AND (Measurement.Completed = 1.0))
   then begin
    VideoRecorderMeasurementsPanel.Update();
    VideoRecorderDataServerMeasurementsPanel.lvMeasurements_SelectItem(Measurement.MeasurementID);
    //.
    Break; //. >
    end;
  //.
  Repaint();
  end;
Result:=Measurement.MeasurementID;
end;


end.
