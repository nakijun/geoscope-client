unit unitGeoMonitoredObject1VideoRecorderMeasurementVisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGeoMonitoredObject1Model,
  unitVideoRecorderMeasurement,
  unitVideoRecorderMeasurementTimeIntervalSlider,
  unitGeoMonitoredObject1VideoRecorderMeasurementPlayer,
  ExtCtrls, StdCtrls, Buttons, ComCtrls;

const
  WM_STOPPLAYING = WM_USER+1;

type
  TfmGeoGraphServerObjectVideoMeasurementVisor = class(TForm)
    Playing: TTimer;
    pnlMain: TPanel;
    pnlControl: TPanel;
    Bevel1: TBevel;
    cbAudio: TCheckBox;
    cbVideo: TCheckBox;
    btnStartStopPlayingFragment: TBitBtn;
    Splitter1: TSplitter;
    lvFragments: TListView;
    procedure PlayingTimer(Sender: TObject);
    procedure btnStartStopPlayingFragmentClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure lvFragmentsClick(Sender: TObject);
    procedure lvFragmentsDblClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    MeasurementDatabaseFolder: string;
    MeasurementID: string;
    MeasurementFolder: string;
    MeasurementFragmentsFolder: string;
    //.
    Measurement: TVideoRecorderMeasurement;
    //.
    Slider: TMeasurementTimeIntervalSlider;
    Player: TVideoRecorderMeasurementPlayer;

    procedure LoadMeasurementDescriptor();
    function  LoadMeasurementFragment(const StartTimestamp,FinishTimeStamp: double; const flAudio,flVideo: boolean): string;
    procedure Fragments_GetList(out Fragments: TStringList);
    procedure lvFragments_Update();
    procedure wmStopPlaying(var Message: TMessage); message WM_STOPPLAYING;
  public
    { Public declarations }
    flPlaying: boolean;
    
    Constructor Create(const pModel: TGeoMonitoredObject1Model; const pMeasurementDatabaseFolder: string; const pMeasurementID: string);
    Destructor Destroy(); override;
    procedure StartPlaying(const Interval: TTimeInterval);
    procedure StartFragmentPlaying(const pFragmentID: string);
    procedure StartPlayingIndication();
    procedure StopPlaying();
    procedure PostStopPlaying();
  end;

implementation
uses
  {$IFDEF Plugin}
  FunctionalityImport,
  {$ENDIF}
  StrUtils,
  Registry,
  winsock,
  Sockets,
  AbArcTyp,
  AbZipTyp,
  AbUnzPrc,
  AbUtils;

{$R *.dfm}


procedure DeleteFolder(const Folder: string);
var
  sr: TSearchRec;
  FN: string;
begin
if (NOT SysUtils.DirectoryExists(Folder)) then Exit; //. ->
//.
if (SysUtils.FindFirst(Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
     then begin
      FN:=Folder+'\'+sr.name;
      SysUtils.DeleteFile(FN);
      end;
  until SysUtils.FindNext(sr) <> 0;
  finally
  SysUtils.FindClose(sr);
  end;
if (SysUtils.FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then DeleteFolder(Folder+'\'+sr.name);
  until (SysUtils.FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
//.
SysUtils.RemoveDir(Folder);
end;


{TZipArchive}
type
  TZipArchive = class(TAbZipArchive)
  private
    Constructor CreateFromStream( aStream : TStream; const ArchiveName : string );
    procedure DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
  end;

Constructor TZipArchive.CreateFromStream(aStream: TStream; const ArchiveName: string);
begin
inherited CreateFromStream(aStream,ArchiveName);
ExtractHelper:=DoExtractHelper;
end;

procedure TZipArchive.DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
begin
AbUnzip(Sender,TAbZipItem(Item),NewName);
end;


{TfmGeoGraphServerObjectVideoMeasurementVisor}
Constructor TfmGeoGraphServerObjectVideoMeasurementVisor.Create(const pModel: TGeoMonitoredObject1Model; const pMeasurementDatabaseFolder: string; const pMeasurementID: string);
var
  TimeIntervalBegin,TimeIntervalEnd,CurrentTime: double;
  TimeResolution: double;
begin
Inherited Create(nil);
Model:=pModel;
MeasurementDatabaseFolder:=pMeasurementDatabaseFolder;
MeasurementID:=pMeasurementID;
//.
MeasurementFolder:=MeasurementDatabaseFolder+'\'+MeasurementID;
MeasurementFragmentsFolder:=MeasurementFolder+'\'+MeasurementFragmentsFolderName;
//.
LoadMeasurementDescriptor();
//.
Measurement:=TVideoRecorderMeasurement.Create(MeasurementDatabaseFolder,MeasurementID);
//.
TimeIntervalBegin:=Measurement.StartTimestamp+TimeZoneDelta;
if (Measurement.FinishTimestamp <> 0.0)
 then begin
   TimeIntervalEnd:=Measurement.FinishTimestamp+TimeZoneDelta;
   CurrentTime:=TimeIntervalBegin;
   end
 else begin
  TimeIntervalEnd:=Now;
  CurrentTime:=TimeIntervalEnd;
  end;
TimeResolution:=(TimeIntervalEnd-TimeIntervalBegin){Days delta}/(Width/2.0);
//.
Slider:=TMeasurementTimeIntervalSlider.Create(CurrentTime,TimeResolution,TimeIntervalBegin,TimeIntervalEnd);
Slider.Align:=alClient;
Slider.Parent:=pnlMain;
//.
cbAudio.Enabled:=Measurement.IsAudio();
cbAudio.Checked:=cbAudio.Enabled;
cbVideo.Enabled:=Measurement.IsVideo();
cbVideo.Checked:=cbVideo.Enabled;
//.
Player:=nil;
//.
flPlaying:=false;
//.
lvFragments_Update();
end;

Destructor TfmGeoGraphServerObjectVideoMeasurementVisor.Destroy();
begin
Player.Free();
Slider.Free();
Measurement.Free();
Inherited;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.LoadMeasurementDescriptor();
var
  Flags: integer;
  BA: TByteArray;
  MS: TMemoryStream;
  I: integer;
  FN: string;
  FA: Integer;
begin
///?? if (FileExists(MeasurementFolder+'\'+DescriptorFileName)) then Exit; //. ->
//.
Flags:=1{DecriptorFile};
BA:=Model.VideoRecorder_Measurement_GetData(MeasurementID,Flags);
//.
DeleteFolder(MeasurementFolder);
ForceDirectories(MeasurementFolder);
//.
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@BA[0])^,Length(BA));
MS.Position:=0;
with TZipArchive.CreateFromStream(MS,'') do
try
ExtractOptions:=ExtractOptions+[eoRestorePath];
BaseDirectory:=MeasurementDatabaseFolder;
Load();
for I:=0 to ItemList.Count-1 do begin
  FN:=AnsiReplaceStr(ItemList[I].FileName,'/','\');
  ForceDirectories(BaseDirectory+'\'+ExtractFilePath(FN));
  if ((ItemList[I].ExternalFileAttributes AND faDirectory) <> faDirectory)
   then begin
    FN:=BaseDirectory+'\'+ItemList[I].FileName;
    if (FileExists(FN))
     then begin
      if (NOT DeleteFile(FN))
       then begin
        FA:=FileGetAttr(FN);
        FA:=(FA AND (NOT faReadOnly));
        FileSetAttr(FN,FA);
        if (NOT DeleteFile(FN)) then Raise Exception.Create('could not delete old file: '+FN); //. =>
        end;
      end;
    Extract(ItemList[I],ItemList[I].FileName);
    end;
  end;
finally
Destroy();
end;
finally
MS.Destroy();
end;
end;

function TfmGeoGraphServerObjectVideoMeasurementVisor.LoadMeasurementFragment(const StartTimestamp,FinishTimeStamp: double; const flAudio,flVideo: boolean): string;
var
  MeasurementFragmentID: string;
  MeasurementFragmentFolder: string;
  Flags: integer;
  BA: TByteArray;
  MS: TMemoryStream;
  I: integer;
  FN: string;
  FA: Integer;
begin
MeasurementFragmentID:=FloatToStr(StartTimestamp);
MeasurementFragmentFolder:=MeasurementFragmentsFolder+'\'+MeasurementFragmentID;
//.
Flags:=1{DecriptorFile};
if (flAudio) then Flags:=Flags+2{AudioFile};
if (flVideo) then Flags:=Flags+4{VideoFile};
BA:=Model.VideoRecorder_Measurement_GetDataFragment(MeasurementID, StartTimestamp,FinishTimeStamp, Flags);
//.
DeleteFolder(MeasurementFragmentFolder);
ForceDirectories(MeasurementFragmentFolder);
//.
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@BA[0])^,Length(BA));
MS.Position:=0;
with TZipArchive.CreateFromStream(MS,'') do
try
ExtractOptions:=ExtractOptions+[eoRestorePath];
BaseDirectory:=MeasurementFragmentsFolder;
Load();
for I:=0 to ItemList.Count-1 do begin
  FN:=AnsiReplaceStr(ItemList[I].FileName,'/','\');
  ForceDirectories(BaseDirectory+'\'+ExtractFilePath(FN));
  if ((ItemList[I].ExternalFileAttributes AND faDirectory) <> faDirectory)
   then begin
    FN:=BaseDirectory+'\'+ItemList[I].FileName;
    if (FileExists(FN))
     then begin
      if (NOT DeleteFile(FN))
       then begin
        FA:=FileGetAttr(FN);
        FA:=(FA AND (NOT faReadOnly));
        FileSetAttr(FN,FA);
        if (NOT DeleteFile(FN)) then Raise Exception.Create('could not delete old file: '+FN); //. =>
        end;
      end;
    Extract(ItemList[I],ItemList[I].FileName);
    end;
  end;
finally
Destroy();
end;
finally
MS.Destroy();
end;
Result:=MeasurementFragmentID;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.StartPlaying(const Interval: TTimeInterval);
var
  SC: TCursor;
  MeasurementFragmentID: string;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
MeasurementFragmentID:=LoadMeasurementFragment(Interval.Time-TimeZoneDelta,Interval.Time+Interval.Duration-TimeZoneDelta, cbAudio.Checked,cbVideo.Checked);
//.
FreeAndNil(Player);
Player:=TVideoRecorderMeasurementPlayer.Create(MeasurementFragmentsFolder,MeasurementFragmentID);
Player.OnPlayerClosed:=PostStopPlaying;
Player.OnStartStreaming:=StartPlayingIndication;
Player.Resume();
//.
Slider.flSelectionRange:=true;
Slider.SetCurrentTime(Interval.Time);
//.
flPlaying:=true;
btnStartStopPlayingFragment.Caption:='Stop playing';
//.
lvFragments_Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.StartFragmentPlaying(const pFragmentID: string);
var
  SC: TCursor;
  Fragment: TVideoRecorderMeasurement;
  Interval: TTimeInterval;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Fragment:=TVideoRecorderMeasurement.Create(MeasurementFragmentsFolder,pFragmentID);
try
Interval.Time:=Fragment.StartTimestamp+TimeZoneDelta;
Interval.Duration:=Fragment.FinishTimestamp-Fragment.StartTimestamp;
finally
Fragment.Destroy();
end;
//.
FreeAndNil(Player);
Player:=TVideoRecorderMeasurementPlayer.Create(MeasurementFragmentsFolder,pFragmentID);
Player.OnPlayerClosed:=PostStopPlaying;
Player.OnStartStreaming:=StartPlayingIndication;
Player.Resume();
//.
Slider.flSelectionRange:=true;
Slider.SetCurrentTime(Interval.Time);
//.
flPlaying:=true;
btnStartStopPlayingFragment.Caption:='Stop playing';
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.StartPlayingIndication();
begin
Playing.Enabled:=true;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.StopPlaying();
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Playing.Enabled:=false;
Slider.flSelectionRange:=false;
//.
flPlaying:=false;
btnStartStopPlayingFragment.Caption:='Start playing';
//.
FreeAndNil(Player);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.PostStopPlaying();
begin
PostMessage(Handle, WM_STOPPLAYING,0,0);
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.wmStopPlaying(var Message: TMessage);
begin
StopPlaying();
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.PlayingTimer(Sender: TObject);
var
  SelectedInterval: TTimeInterval;
  CurrentTime,NewCurrentTime: TDateTime;
begin
SelectedInterval:=Slider.GetSelectedInterval();
if (SelectedInterval.Duration <= 0.0)
 then begin
  Playing.Enabled:=false;
  Exit; //. ->
  end;
CurrentTime:=Slider.GetCurrentTime();
if (CurrentTime < SelectedInterval.Time) then Exit; //. ->
NewCurrentTime:=CurrentTime+1.0/(24*3600){second};
if (NewCurrentTime > (SelectedInterval.Time+SelectedInterval.Duration)) then Exit; //. ->
CurrentTime:=NewCurrentTime;
Slider.SetCurrentTime(CurrentTime);
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.btnStartStopPlayingFragmentClick(Sender: TObject);
var
  SelectedInterval: TTimeInterval;
begin
SelectedInterval:=Slider.GetSelectedInterval();
if (SelectedInterval.Duration <= 0.0) then Exit; //. ->
if (NOT flPlaying)
 then StartPlaying(SelectedInterval)
 else StopPlaying();
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.Fragments_GetList(out Fragments: TStringList);
var
  sr: TSearchRec;
begin
Fragments:=TStringList.Create();
try
if (FindFirst(MeasurementFragmentsFolder+'\*.*', faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory))
     then Fragments.Add(sr.Name);
  until (FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
except
  FreeAndNil(Fragments);
  Raise; //. =>
  end;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.lvFragments_Update();
var
  L: string;
  Fragments: TStringList;
  I: integer;
  Fragment: TVideoRecorderMeasurement;
begin
with lvFragments do begin
Items.BeginUpdate();
try
Items.Clear();
Fragments_GetList({out} Fragments);
try
for I:=0 to Fragments.Count-1 do begin
  Fragment:=TVideoRecorderMeasurement.Create(MeasurementFragmentsFolder,Fragments[I]);
  try
  with Items.Add do begin
  Caption:=Fragment.MeasurementID;
  SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',Fragment.StartTimestamp+TimeZoneDelta));
  if (Fragment.FinishTimestamp <> 0.0)
   then begin
    SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',Fragment.FinishTimestamp+TimeZoneDelta));
    SubItems.Add(IntToStr(Trunc((Fragment.FinishTimestamp-Fragment.StartTimestamp)*24*3600)))
    end
   else begin
    SubItems.Add('not finished');
    SubItems.Add('none');
    end;
  if (Fragment.IsAudio())
   then SubItems.Add('+')
   else SubItems.Add('-');
  if (Fragment.IsVideo())
   then SubItems.Add('+')
   else SubItems.Add('-');
  end;
  finally
  Fragment.Destroy();
  end;
  end;
finally
Fragments.Destroy();
end;
finally
Items.EndUpdate();
end;
end;
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.FormHide(Sender: TObject);
begin
if (flPlaying)
 then StopPlaying();
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.lvFragmentsClick(Sender: TObject);
var
  FragmentID: string;
  Fragment: TVideoRecorderMeasurement;
  Interval: TTimeInterval;
begin
if (lvFragments.Selected = nil) then Exit; //. ->
FragmentID:=lvFragments.Selected.Caption;
Fragment:=TVideoRecorderMeasurement.Create(MeasurementFragmentsFolder,FragmentID);
try
Interval.Time:=Fragment.StartTimestamp+TimeZoneDelta;
Interval.Duration:=Fragment.FinishTimestamp-Fragment.StartTimestamp;
finally
Fragment.Destroy();
end;
Slider.SelectTimeInterval(Interval);
Slider.SetCurrentTime(Interval.Time);
end;

procedure TfmGeoGraphServerObjectVideoMeasurementVisor.lvFragmentsDblClick(Sender: TObject);
var
  FragmentID: string;
begin
if (lvFragments.Selected = nil) then Exit; //. ->
FragmentID:=lvFragments.Selected.Caption;
//.
StartFragmentPlaying(FragmentID);
end;


end.
