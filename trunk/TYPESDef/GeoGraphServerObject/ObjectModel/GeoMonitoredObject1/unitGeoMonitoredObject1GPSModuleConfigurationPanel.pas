unit unitGeoMonitoredObject1GPSModuleConfigurationPanel;

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
  TGeoMonitoredObject1GPSModuleConfigurationPanel = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnApply: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edProviderReadInterval: TEdit;
    Label1: TLabel;
    edMapID: TEdit;
    gbMapPOI: TGroupBox;
    gbMediaFragmentConfiguration: TGroupBox;
    gbMediaFragmentAudioConfiguration: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cbMediaFragmentAudioSampleRate: TComboBox;
    cbMediaFragmentAudioBitRate: TComboBox;
    gbMediaFragmentVideoConfiguration: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbMediaFragmentVideoResolution: TComboBox;
    cbMediaFragmentVideoFrameRate: TComboBox;
    cbMediaFragmentVideoBitRate: TComboBox;
    gbMapPOIImage: TGroupBox;
    Label6: TLabel;
    edImageQuality: TEdit;
    Label7: TLabel;
    cbImageResolution: TComboBox;
    Label10: TLabel;
    edImageFormat: TEdit;
    Label11: TLabel;
    edMediaFragmentFormat: TEdit;
    Label12: TLabel;
    edMediaFragmentMaxDuration: TEdit;
    cbIgnoreImpulseModeSleepingOnMovement: TCheckBox;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    Configuration: TGPSModuleConfiguration;
    flApply: boolean;
  public
    { Public declarations }
    Constructor Create(const pConfiguration: TGPSModuleConfiguration);
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
Constructor TGeoMonitoredObject1GPSModuleConfigurationPanel.Create(const pConfiguration: TGPSModuleConfiguration);
begin
Inherited Create(nil);
Configuration:=pConfiguration;
//.
Update();
end;

Destructor TGeoMonitoredObject1GPSModuleConfigurationPanel.Destroy();
begin
Inherited;
end;

procedure TGeoMonitoredObject1GPSModuleConfigurationPanel.Update();
begin
edProviderReadInterval.Text:=IntToStr(Configuration.Provider_ReadInterval);
cbIgnoreImpulseModeSleepingOnMovement.Checked:=Configuration.flIgnoreImpulseModeSleepingOnMovement;
edMapID.Text:=IntToStr(Configuration.MapID);
//.
cbImageResolution.Text:=IntToStr(Configuration.MapPOI_Image_ResX)+'x'+IntToStr(Configuration.MapPOI_Image_ResY);
if (Configuration.MapPOI_Image_Quality > 0)
 then edImageQuality.Text:=IntToStr(Configuration.MapPOI_Image_Quality)
 else edImageQuality.Text:=DefaultValueStr;
edImageFormat.Text:=Configuration.MapPOI_Image_Format;
if (Configuration.MapPOI_MediaFragment_Audio_SampleRate > 0)
 then cbMediaFragmentAudioSampleRate.Text:=IntToStr(Configuration.MapPOI_MediaFragment_Audio_SampleRate)
 else cbMediaFragmentAudioSampleRate.Text:=DefaultValueStr;
if (Configuration.MapPOI_MediaFragment_Audio_BitRate > 0)
 then cbMediaFragmentAudioBitRate.Text:=IntToStr(Configuration.MapPOI_MediaFragment_Audio_BitRate)
 else cbMediaFragmentAudioBitRate.Text:=DefaultValueStr;
cbMediaFragmentVideoResolution.Text:=IntToStr(Configuration.MapPOI_MediaFragment_Video_ResX)+'x'+IntToStr(Configuration.MapPOI_MediaFragment_Video_ResY);
if (Configuration.MapPOI_MediaFragment_Video_FrameRate > 0)
 then cbMediaFragmentVideoFrameRate.Text:=IntToStr(Configuration.MapPOI_MediaFragment_Video_FrameRate)
 else cbMediaFragmentVideoFrameRate.Text:=DefaultValueStr;
if (Configuration.MapPOI_MediaFragment_Video_BitRate > 0)
 then cbMediaFragmentVideoBitRate.Text:=IntToStr(Configuration.MapPOI_MediaFragment_Video_BitRate)
 else cbMediaFragmentVideoBitRate.Text:=DefaultValueStr;
if (Configuration.MapPOI_MediaFragment_MaxDuration > 0)
 then edMediaFragmentMaxDuration.Text:=IntToStr(Configuration.MapPOI_MediaFragment_MaxDuration)
 else edMediaFragmentMaxDuration.Text:=DefaultValueStr;
edMediaFragmentFormat.Text:=Configuration.MapPOI_MediaFragment_Format;
end;

procedure TGeoMonitoredObject1GPSModuleConfigurationPanel.Apply();

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
Configuration.Provider_ReadInterval:=StrToInt(edProviderReadInterval.Text);
Configuration.flIgnoreImpulseModeSleepingOnMovement:=cbIgnoreImpulseModeSleepingOnMovement.Checked;
Configuration.MapID:=StrToInt(edMapID.Text);
//.
SplitStrings(cbImageResolution.Text,{out} SL);
try
Configuration.MapPOI_Image_ResX:=StrToInt(SL[0]);
Configuration.MapPOI_Image_ResY:=StrToInt(SL[1]);
finally
SL.Destroy();
end;
if (edImageQuality.Text <> DefaultValueStr)
 then Configuration.MapPOI_Image_Quality:=StrToInt(edImageQuality.Text)
 else Configuration.MapPOI_Image_Quality:=-1;
Configuration.MapPOI_Image_Format:=edImageFormat.Text;
if (cbMediaFragmentAudioSampleRate.Text <> DefaultValueStr)
 then Configuration.MapPOI_MediaFragment_Audio_SampleRate:=StrToInt(cbMediaFragmentAudioSampleRate.Text)
 else Configuration.MapPOI_MediaFragment_Audio_SampleRate:=-1;
if (cbMediaFragmentAudioBitRate.Text <> DefaultValueStr)
 then Configuration.MapPOI_MediaFragment_Audio_BitRate:=StrToInt(cbMediaFragmentAudioBitRate.Text)
 else Configuration.MapPOI_MediaFragment_Audio_BitRate:=-1;
SplitStrings(cbMediaFragmentVideoResolution.Text,{out} SL);
try
Configuration.MapPOI_MediaFragment_Video_ResX:=StrToInt(SL[0]);
Configuration.MapPOI_MediaFragment_Video_ResY:=StrToInt(SL[1]);
finally
SL.Destroy();
end;
if (cbMediaFragmentVideoFrameRate.Text <> DefaultValueStr)
 then Configuration.MapPOI_MediaFragment_Video_FrameRate:=StrToInt(cbMediaFragmentVideoFrameRate.Text)
 else Configuration.MapPOI_MediaFragment_Video_FrameRate:=-1;
if (cbMediaFragmentVideoBitRate.Text <> DefaultValueStr)
 then Configuration.MapPOI_MediaFragment_Video_BitRate:=StrToInt(cbMediaFragmentVideoBitRate.Text)
 else Configuration.MapPOI_MediaFragment_Video_BitRate:=-1;
if (edMediaFragmentMaxDuration.Text <> DefaultValueStr)
 then Configuration.MapPOI_MediaFragment_MaxDuration:=StrToInt(edMediaFragmentMaxDuration.Text)
 else Configuration.MapPOI_MediaFragment_MaxDuration:=-1;
Configuration.MapPOI_MediaFragment_Format:=edMediaFragmentFormat.Text;
end;

function TGeoMonitoredObject1GPSModuleConfigurationPanel.Dialog(): boolean;
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

procedure TGeoMonitoredObject1GPSModuleConfigurationPanel.btnApplyClick(Sender: TObject);
begin
flApply:=true;
Close();
end;

procedure TGeoMonitoredObject1GPSModuleConfigurationPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
