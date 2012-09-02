unit unitGeoMonitoredObject1VideoRecorderMeasurementsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model, ComCtrls, Menus;

type
  TDoOnPlayMeasurement = procedure (MeasurementID: string) of object;

  TGeoMonitoredObject1VideoRecorderMeasurementsPanel = class(TForm)
    lvMeasurements: TListView;
    lvMeasurements_PopupMenu: TPopupMenu;
    Deleteselected1: TMenuItem;
    N2: TMenuItem;
    Updatelist1: TMenuItem;
    N3: TMenuItem;
    Open1: TMenuItem;
    Moveselectedtodataserver1: TMenuItem;
    N1: TMenuItem;
    procedure Deleteselected1Click(Sender: TObject);
    procedure lvMeasurementsDblClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Updatelist1Click(Sender: TObject);
    procedure Moveselectedtodataserver1Click(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    MeasurementVisor: TForm;

    procedure PlayMeasurement(const MeasurementID: string);
    procedure OpenMeasurement(const MeasurementID: string);
  public
    { Public declarations }
    OnPlayMeasurement: TDoOnPlayMeasurement;

    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override; 
    procedure Update(); reintroduce;
  end;


implementation
uses
  StrUtils,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGeoMonitoredObject1VideoRecorderMeasurementVisor;

{$R *.dfm}


function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
//.
MeasurementVisor:=nil;
//.
OnPlayMeasurement:=nil;
//.
lvMeasurements.Columns[0].Width:=0;
lvMeasurements.Columns[4].Width:=0;
lvMeasurements.Columns[5].Width:=0;
lvMeasurements.Columns[6].Width:=0;
//.
Update();
end;

Destructor TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Destroy();
begin
MeasurementVisor.Free();
Inherited;
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Update();

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
L:=Model.VideoRecorder_Measurements_GetList();
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

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.PlayMeasurement(const MeasurementID: string);
begin
if (Assigned(OnPlayMeasurement)) then OnPlayMeasurement(MeasurementID);
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.OpenMeasurement(const MeasurementID: string);
const
  PathTempDATA = 'TempDATA'; //. do not modify
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
FreeAndNil(MeasurementVisor);
MeasurementVisor:=TfmGeoGraphServerObjectVideoMeasurementVisor.Create(Model,PathTempDATA,MeasurementID);
finally
Screen.Cursor:=SC;
end;
//.
MeasurementVisor.Show();
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Moveselectedtodataserver1Click(Sender: TObject);
var
  SC: TCursor;
  IDs: string;
  I: integer;
begin
IDs:='';
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then IDs:=IDs+lvMeasurements.Items[I].Caption+',';
if (IDs = '') then Exit; //. ->
SetLength(IDs,Length(IDs)-1);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Model.VideoRecorder_Measurements_MoveToDataServer(IDs);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Deleteselected1Click(Sender: TObject);
var
  SC: TCursor;
  IDs: string;
  I: integer;
begin
IDs:='';
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then IDs:=IDs+lvMeasurements.Items[I].Caption+',';
if (IDs = '') then Exit; //. ->
SetLength(IDs,Length(IDs)-1);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Model.VideoRecorder_Measurements_Delete(IDs);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.lvMeasurementsDblClick(Sender: TObject);
var
  SC: TCursor;
begin
if (lvMeasurements.Selected = nil) then Exit; //. ->
//.
PlayMeasurement(lvMeasurements.Selected.Caption);
{///- SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
OpenMeasurement(lvMeasurements.Selected.Caption);
finally
Screen.Cursor:=SC;
end;}
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Open1Click(Sender: TObject);
begin
lvMeasurementsDblClick(nil);
end;

procedure TGeoMonitoredObject1VideoRecorderMeasurementsPanel.Updatelist1Click(Sender: TObject);
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


end.
