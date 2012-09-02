unit unitGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model, ComCtrls, Menus;

type
  TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel = class(TForm)
    lvMeasurements: TListView;
    lvMeasurements_PopupMenu: TPopupMenu;
    Deleteselected1: TMenuItem;
    N2: TMenuItem;
    Updatelist1: TMenuItem;
    N3: TMenuItem;
    Open1: TMenuItem;
    Copyselectedtofolder1: TMenuItem;
    Moceselectedtofolder1: TMenuItem;
    procedure Deleteselected1Click(Sender: TObject);
    procedure lvMeasurementsDblClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Updatelist1Click(Sender: TObject);
    procedure Copyselectedtofolder1Click(Sender: TObject);
    procedure Moceselectedtofolder1Click(Sender: TObject);
  private
    { Private declarations }
    idGeographServerObject: integer;
    MeasurementDatabaseFolder: string;
    MeasurementVisor: TForm;

    procedure OpenMeasurement(const MeasurementID: string);
  public
    { Public declarations }

    Constructor Create(const pMeasurementDatabaseFolder: string; const pidGeographServerObject: integer);
    Destructor Destroy(); override; 
    procedure Update; reintroduce;
  end;


implementation
uses
  FileCtrl,
  StrUtils,
  GlobalSpaceDefines,
  unitObjectModel,
  unitVideoRecorderMeasurement,
  unitGeoMonitoredObject1VideoRecorderDataServerMeasurementVisor,
  unitMeasurementMediaPlayer;

{$R *.dfm}


function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Create(const pMeasurementDatabaseFolder: string; const pidGeographServerObject: integer);
begin
Inherited Create(nil);
idGeographServerObject:=pidGeographServerObject;
MeasurementDatabaseFolder:=pMeasurementDatabaseFolder;
//.
MeasurementVisor:=nil;
//.
lvMeasurements.Columns[0].Width:=0;
Update();
end;

Destructor TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Destroy();
begin
MeasurementVisor.Free();
Inherited;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Update();

  function SplitStrings(const S: string; const Delim: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create();
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] = Delim)
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

var
  L: string;
  Measurements: TStringList;
  I: integer;
  MeasurementParams: TStringList;
  MeasurementID: string;
  MeasurementStartTimestamp,MeasurementFinishTimestamp: double;
  AudioSize,VideoSize: integer;
begin
with lvMeasurements do begin
Items.BeginUpdate();
try
Items.Clear();
L:=TVideoRecorderMeasurement.GetMeasurementsList(MeasurementDatabaseFolder);
if (L = '') then Exit; //. ->
if (SplitStrings(L,';',{out} Measurements))
 then
  try
  for I:=0 to Measurements.Count-1 do with Items.Add do begin
    SplitStrings(Measurements[I],',',{out} MeasurementParams);
    try
    MeasurementID:=MeasurementParams[0];
    MeasurementStartTimestamp:=StrToFloat(MeasurementParams[1]);
    MeasurementFinishTimestamp:=StrToFloat(MeasurementParams[2]);
    AudioSize:=StrToInt(MeasurementParams[3]);
    VideoSize:=StrToInt(MeasurementParams[4]);
    //.
    Caption:=MeasurementID;
    SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',MeasurementStartTimestamp+TimeZoneDelta));
    if (MeasurementFinishTimestamp <> 0.0)
     then begin
      SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',MeasurementFinishTimestamp+TimeZoneDelta));
      SubItems.Add(IntToStr(Trunc((MeasurementFinishTimestamp-MeasurementStartTimestamp)*24*3600)))
      end
     else begin
      SubItems.Add('not finished');
      SubItems.Add('none');
      end;
    if (AudioSize <> 0)
     then SubItems.Add(IntToStr(AudioSize))
     else SubItems.Add('none');
    if (VideoSize <> 0)
     then SubItems.Add(IntToStr(VideoSize))
     else SubItems.Add('none');
    if ((AudioSize+VideoSize) <> 0)
     then SubItems.Add(IntToStr(AudioSize+VideoSize))
     else SubItems.Add('none');
    finally
    MeasurementParams.Free();
    end;
    end
  finally
  Measurements.Destroy();
  end;
finally
Items.EndUpdate();
end;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.OpenMeasurement(const MeasurementID: string);
const
  PathTempDATA = 'TempDATA'; //. do not modify
var
  SC: TCursor;
  DestFolder: string;
  Measurement: TVideoRecorderMeasurement;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
FreeAndNil(MeasurementVisor);
//.
DestFolder:=PathTempDATA+'\'+IntToStr(idGeographServerObject);
TVideoRecorderMeasurement.CopyMeasurement(MeasurementDatabaseFolder,MeasurementID,DestFolder);
Measurement:=TVideoRecorderMeasurement.Create(DestFolder,MeasurementID);
case (TVideoRecorderModuleMode(Measurement.Mode)) of
VIDEORECORDERMODULEMODE_H264STREAM1_AMRNBSTREAM1:       MeasurementVisor:=TfmGeoGraphServerObjectDataServerVideoMeasurementVisor.Create(DestFolder,MeasurementID);
VIDEORECORDERMODULEMODE_MODE_MPEG4:                     with TfmMeasurementMediaPlayer.Create(Measurement.MeasurementFolder+'\'+MediaMPEG4FileName,Measurement.StartTimestamp) do
  try
  ShowModal();
  finally
  Destroy();
  end;
VIDEORECORDERMODULEMODE_MODE_3GP:                       with TfmMeasurementMediaPlayer.Create(Measurement.MeasurementFolder+'\'+Media3GPFileName,Measurement.StartTimestamp) do
  try
  ShowModal();
  finally
  Destroy();
  end
else
  Raise Exception.Create('unknown video-recorder mode'); //. =>
end;
finally
Screen.Cursor:=SC;
end;
//.
if (MeasurementVisor <> nil) then MeasurementVisor.Show();
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Deleteselected1Click(Sender: TObject);
var
  SC: TCursor;
  I: integer;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then TVideoRecorderMeasurement.DeleteMeasurement(MeasurementDatabaseFolder,lvMeasurements.Items[I].Caption);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.lvMeasurementsDblClick(Sender: TObject);
var
  SC: TCursor;
begin
if (lvMeasurements.Selected = nil) then Exit; //. ->
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
OpenMeasurement(lvMeasurements.Selected.Caption);
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Open1Click(Sender: TObject);
begin
lvMeasurementsDblClick(nil);
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Updatelist1Click(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Copyselectedtofolder1Click(Sender: TObject);
var
  SC: TCursor;
  LD,DestinationMeasurementDatabaseFolder: string;
  I: integer;
begin
LD:=GetCurrentDir();
try
if (NOT SelectDirectory('Select directory ->','',DestinationMeasurementDatabaseFolder)) then Exit; //. ->
finally
SetCurrentDir(LD);
end;
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then TVideoRecorderMeasurement.CopyMeasurement(MeasurementDatabaseFolder,lvMeasurements.Items[I].Caption,DestinationMeasurementDatabaseFolder);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDiskMeasurementsPanel.Moceselectedtofolder1Click(Sender: TObject);
var
  SC: TCursor;
  LD,DestinationMeasurementDatabaseFolder: string;
  I: integer;
  MeasurementID: string;
begin
LD:=GetCurrentDir();
try
if (NOT SelectDirectory('Select directory ->','',DestinationMeasurementDatabaseFolder)) then Exit; //. ->
finally
SetCurrentDir(LD);
end;
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then begin
    MeasurementID:=lvMeasurements.Items[I].Caption;
    TVideoRecorderMeasurement.CopyMeasurement(MeasurementDatabaseFolder,MeasurementID,DestinationMeasurementDatabaseFolder);
    TVideoRecorderMeasurement.DeleteMeasurement(MeasurementDatabaseFolder,MeasurementID);
    end;
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;


end.
