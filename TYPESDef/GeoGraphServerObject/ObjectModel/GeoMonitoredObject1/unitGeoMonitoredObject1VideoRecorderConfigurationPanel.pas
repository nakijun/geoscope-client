unit unitGeoMonitoredObject1VideoRecorderConfigurationPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitGeoMonitoredObject1Model, ComCtrls, Menus, StdCtrls, Buttons,
  ExtCtrls;

const
  DefaultValueStr = 'Default';

type
  TGeoMonitoredObject1VideoRecorderConfigurationPanel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnApply: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edName: TEdit;
    gbCameraConfiguration: TGroupBox;
    gbMeasurementConfiguration: TGroupBox;
    Label5: TLabel;
    edMeasurementMaxDuration: TEdit;
    Label6: TLabel;
    edMeasurementLifeTime: TEdit;
    Label7: TLabel;
    edMeasurementAutosaveInterval: TEdit;
    gbCameraAudioConfiguration: TGroupBox;
    gbCameraVideoConfiguration: TGroupBox;
    Label2: TLabel;
    cbCameraVideoResolution: TComboBox;
    Label3: TLabel;
    cbCameraVideoFrameRate: TComboBox;
    Label4: TLabel;
    cbCameraVideoBitRate: TComboBox;
    Label8: TLabel;
    cbCameraAudioSampleRate: TComboBox;
    Label9: TLabel;
    cbCameraAudioBitRate: TComboBox;
    cbEnabled: TCheckBox;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    Configuration: TVideoRecorderModuleConfiguration;
    flApply: boolean;
  public
    { Public declarations }
    Constructor Create(const pConfiguration: TVideoRecorderModuleConfiguration);
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
Constructor TGeoMonitoredObject1VideoRecorderConfigurationPanel.Create(const pConfiguration: TVideoRecorderModuleConfiguration);
begin
Inherited Create(nil);
Configuration:=pConfiguration;
//.
Update();
end;

Destructor TGeoMonitoredObject1VideoRecorderConfigurationPanel.Destroy();
begin
Inherited;
end;

procedure TGeoMonitoredObject1VideoRecorderConfigurationPanel.Update();
begin
cbEnabled.Checked:=Configuration.flEnabled;
edName.Text:=Configuration.Name;
//.
if (Configuration.Camera_Audio_SampleRate > 0)
 then cbCameraAudioSampleRate.Text:=IntToStr(Configuration.Camera_Audio_SampleRate)
 else cbCameraAudioSampleRate.Text:=DefaultValueStr;
if (Configuration.Camera_Audio_BitRate > 0)
 then cbCameraAudioBitRate.Text:=IntToStr(Configuration.Camera_Audio_BitRate)
 else cbCameraAudioBitRate.Text:=DefaultValueStr;
cbCameraVideoResolution.Text:=IntToStr(Configuration.Camera_Video_ResX)+'x'+IntToStr(Configuration.Camera_Video_ResY);
if (Configuration.Camera_Video_FrameRate > 0)
 then cbCameraVideoFrameRate.Text:=IntToStr(Configuration.Camera_Video_FrameRate)
 else cbCameraVideoFrameRate.Text:=DefaultValueStr;
if (Configuration.Camera_Video_BitRate > 0)
 then cbCameraVideoBitRate.Text:=IntToStr(Configuration.Camera_Video_BitRate)
 else cbCameraVideoBitRate.Text:=DefaultValueStr;
//.
edMeasurementMaxDuration.Text:=FormatFloat('0.0',Configuration.Measurement_MaxDuration*(24*60));
edMeasurementLifeTime.Text:=FormatFloat('0.0',Configuration.Measurement_LifeTime);
edMeasurementAutosaveInterval.Text:=FormatFloat('0.0',Configuration.Measurement_AutosaveInterval);
end;

procedure TGeoMonitoredObject1VideoRecorderConfigurationPanel.Apply();

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    StartIndex: integer;
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  StartIndex:=1;
  SS:='';
  for I:=StartIndex to Length(S) do
    if (S[I] in ['x','õ'])
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

  function StrToFloat(const S: string): Extended;
  begin
  DecimalSeparator:='.';
  Result:=SysUtils.StrToFloat(S);
  end;
  
var
  SL: TStringList;
begin
Configuration.flEnabled:=cbEnabled.Checked;
Configuration.Name:=edName.Text;
//.
if (cbCameraAudioSampleRate.Text <> DefaultValueStr)
 then Configuration.Camera_Audio_SampleRate:=StrToInt(cbCameraAudioSampleRate.Text)
 else Configuration.Camera_Audio_SampleRate:=-1;
if (cbCameraAudioBitRate.Text <> DefaultValueStr)
 then Configuration.Camera_Audio_BitRate:=StrToInt(cbCameraAudioBitRate.Text)
 else Configuration.Camera_Audio_BitRate:=-1;
SplitStrings(cbCameraVideoResolution.Text,{out} SL);
try
Configuration.Camera_Video_ResX:=StrToInt(SL[0]);
Configuration.Camera_Video_ResY:=StrToInt(SL[1]);
finally
SL.Destroy();
end;
if (cbCameraVideoFrameRate.Text <> DefaultValueStr)
 then Configuration.Camera_Video_FrameRate:=StrToInt(cbCameraVideoFrameRate.Text)
 else Configuration.Camera_Video_FrameRate:=-1;
if (cbCameraVideoBitRate.Text <> DefaultValueStr)
 then Configuration.Camera_Video_BitRate:=StrToInt(cbCameraVideoBitRate.Text)
 else Configuration.Camera_Video_BitRate:=-1;
//.
Configuration.Measurement_MaxDuration:=StrToFloat(edMeasurementMaxDuration.Text)/(24*60);
Configuration.Measurement_LifeTime:=StrToFloat(edMeasurementLifeTime.Text);
Configuration.Measurement_AutosaveInterval:=StrToFloat(edMeasurementAutosaveInterval.Text);
end;

function TGeoMonitoredObject1VideoRecorderConfigurationPanel.Dialog(): boolean;
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

procedure TGeoMonitoredObject1VideoRecorderConfigurationPanel.btnApplyClick(Sender: TObject);
begin
flApply:=true;
Close();
end;

procedure TGeoMonitoredObject1VideoRecorderConfigurationPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
