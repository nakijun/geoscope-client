unit unitVideoRecorderMeasurement;

interface
uses
  Classes;

Const
  DescriptorFileName = 'Data.xml';
  AudioFileName = 'Audio.rtp';
  VideoFileName = 'Video.rtp';
  MediaMPEG4FileName = 'Data.mp4';
  Media3GPFileName = 'Data.3gp';
  AudioAACADTSFileName = 'Audio.aac';
  VideoH264FileName = 'Video.h264';
  //.
  MeasurementFragmentsFolderName = 'Fragments';

Type
  TVideoRecorderMeasurement = class
  public
    MeasurementDatabaseFolder: string;
    MeasurementID: string;
    //.
    MeasurementFolder: string;
    //.
    ID: string;
    Mode: smallint;
    StartTimestamp: double;
    FinishTimestamp: double;
    AudioPackets: integer;
    VideoPackets: integer;

    class function GetMeasurementsList(const pMeasurementDatabaseFolder: string): ANSIString;
    class procedure CopyMeasurement(const pSourceMeasurementDatabaseFolder: string; const pMeasurementID: string; const pDestinationMeasurementDatabaseFolder: string);
    class procedure DeleteMeasurement(const pMeasurementDatabaseFolder: string; const pMeasurementID: string);

    Constructor Create(const pMeasurementDatabaseFolder: string; const pMeasurementID: string);
    procedure LoadDescriptor();
    procedure SaveDescriptor();
    function IsAudio(): boolean;
    function IsVideo(): boolean;
    function FileSize(const pFileName: string): integer; 
    function AudioFileSize(): integer;
    function VideoFileSize(): integer;
    function GetContent(): TStringList;
    function PrepareFragment(StartTimestamp,FinishTimeStamp: double; const flAudio,flVideo: boolean): string;
  end;
  
implementation
uses
  Windows,
  SysUtils,
  MSXML;


function GetFileSize(const FileName: String): integer;
var
  FS: TFileStream;
begin
if (NOT FileExists(Filename))
 then begin
  Result:=0;
  Exit; //. ->
  end;
FS:=TFileStream.Create(Filename, fmOpenRead);
try
Result:=FS.Size;
finally
FS.Destroy();
end;
end;

procedure CopyFolder(const SrcFolder: string; const DistinationPath: string);
var
  sr: TSearchRec;
begin
if (NOT DirectoryExists(DistinationPath)) then ForceDirectories(DistinationPath);
//.
if (SysUtils.FindFirst(SrcFolder+'\*.*', (faAnyFile-faDirectory), sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
     then with TMemoryStream.Create() do //. copy file
      try
      LoadFromFile(SrcFolder+'\'+sr.Name);
      SaveToFile(DistinationPath+'\'+sr.Name);
      finally
      Destroy;
      end;
  until (SysUtils.FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
//. process subfolders
if (SysUtils.FindFirst(SrcFolder+'\*.*', faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then CopyFolder(SrcFolder+'\'+sr.name,DistinationPath+'\'+sr.name);
  until (SysUtils.FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
end;

procedure DeleteFolder(const Folder: string);
var
  sr: TSearchRec;
  FN: string;
begin
if (NOT DirectoryExists(Folder)) then Exit; //. ->
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
  until SysUtils.FindNext(sr) <> 0;
  finally
  SysUtils.FindClose(sr);
  end;
//.
SysUtils.RemoveDir(Folder);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TVideoRecorderMeasurement}
class function TVideoRecorderMeasurement.GetMeasurementsList(const pMeasurementDatabaseFolder: string): ANSIString;
var
  sr: TSearchRec;
  MeasurementID: string;
  Measurement: TVideoRecorderMeasurement;
  ItemStr: string;
begin
Result:='';
if (FindFirst(pMeasurementDatabaseFolder+'\*.*', faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory))
     then begin
      MeasurementID:=sr.Name;
      try
      Measurement:=TVideoRecorderMeasurement.Create(pMeasurementDatabaseFolder,MeasurementID);
      try
      ItemStr:=MeasurementID+','+FloatToStr(Measurement.StartTimestamp)+','+FloatToStr(Measurement.FinishTimestamp)+','+IntToStr(Measurement.AudioFileSize())+','+IntToStr(Measurement.VideoFileSize());
      if (Result <> '') then Result:=Result+';'+ItemStr else Result:=ItemStr;
      finally
      Measurement.Destroy();
      end;
      except
        end;
      end;
  until (FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
end;

class procedure TVideoRecorderMeasurement.CopyMeasurement(const pSourceMeasurementDatabaseFolder: string; const pMeasurementID: string; const pDestinationMeasurementDatabaseFolder: string);
begin
CopyFolder(pSourceMeasurementDatabaseFolder+'\'+pMeasurementID,pDestinationMeasurementDatabaseFolder+'\'+pMeasurementID);
end;

class procedure TVideoRecorderMeasurement.DeleteMeasurement(const pMeasurementDatabaseFolder: string; const pMeasurementID: string);
begin
DeleteFolder(pMeasurementDatabaseFolder+'\'+pMeasurementID);
end;

Constructor TVideoRecorderMeasurement.Create(const pMeasurementDatabaseFolder: string; const pMeasurementID: string);
begin
Inherited Create();
MeasurementDatabaseFolder:=pMeasurementDatabaseFolder;
MeasurementID:=pMeasurementID;
//.
MeasurementFolder:=MeasurementDatabaseFolder+'\'+MeasurementID;
//.
ID:='';
Mode:=0;
StartTimestamp:=0.0;
FinishTimestamp:=0.0;
AudioPackets:=0;
VideoPackets:=0;
//.
LoadDescriptor();
end;

procedure TVideoRecorderMeasurement.LoadDescriptor();
var
  DFN: string;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
begin
DFN:=MeasurementFolder+'\'+DescriptorFileName;
if (FileExists(DFN))
 then begin
  Doc:=CoDomDocument.Create();
  Doc.Set_Async(false);
  Doc.Load(DFN);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 1) then Raise Exception.Create('unknown decriptor file version'); //. =>
  ID:=RootNode.selectSingleNode('ID').nodeTypedValue;
  Mode:=RootNode.selectSingleNode('Mode').nodeTypedValue;
  StartTimestamp:=RootNode.selectSingleNode('StartTimestamp').nodeTypedValue;
  FinishTimestamp:=RootNode.selectSingleNode('FinishTimestamp').nodeTypedValue;
  AudioPackets:=RootNode.selectSingleNode('AudioPackets').nodeTypedValue;
  VideoPackets:=RootNode.selectSingleNode('VideoPackets').nodeTypedValue;
  end
 else Raise Exception.Create('measurement descriptor file is not found, '+DFN); //. =>
end;

procedure TVideoRecorderMeasurement.SaveDescriptor();
var
  DFN: string;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
begin
DFN:=MeasurementFolder+'\'+DescriptorFileName;
if (FileExists(DFN))
 then begin
  Doc:=CoDomDocument.Create();
  Doc.Set_Async(false);
  Doc.Load(DFN);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 1) then Raise Exception.Create('unknown decriptor file version'); //. =>
  RootNode.selectSingleNode('ID').nodeTypedValue:=ID;
  RootNode.selectSingleNode('Mode').nodeTypedValue:=Mode;
  RootNode.selectSingleNode('StartTimestamp').nodeTypedValue:=StartTimestamp;
  RootNode.selectSingleNode('FinishTimestamp').nodeTypedValue:=FinishTimestamp;
  RootNode.selectSingleNode('AudioPackets').nodeTypedValue:=AudioPackets;
  RootNode.selectSingleNode('VideoPackets').nodeTypedValue:=VideoPackets;
  //.
  Doc.Save(DFN);
  end
 else Raise Exception.Create('measurement descriptor file is not found, '+DFN); //. =>
end;

function TVideoRecorderMeasurement.IsAudio(): boolean;
begin
Result:=(AudioPackets > 0);
end;

function TVideoRecorderMeasurement.IsVideo(): boolean;
begin
Result:=(VideoPackets > 0);
end;

function TVideoRecorderMeasurement.FileSize(const pFileName: string): integer;
begin
Result:=GetFileSize(MeasurementFolder+'\'+pFileName);
end;

function TVideoRecorderMeasurement.AudioFileSize(): integer;
begin
Result:=GetFileSize(MeasurementFolder+'\'+AudioFileName);
end;

function TVideoRecorderMeasurement.VideoFileSize(): integer;
begin
Result:=GetFileSize(MeasurementFolder+'\'+VideoFileName);
end;

function TVideoRecorderMeasurement.GetContent(): TStringList;
var
  sr: TSearchRec;
  FN: string;
begin
Result:=TStringList.Create();
try
if (SysUtils.FindFirst(MeasurementFolder+'\*.*', faAnyFile-faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
     then Result.Add(sr.name);
  until (SysUtils.FindNext(sr) <> 0);
  finally
  SysUtils.FindClose(sr);
  end;
except
  FreeAndNil(Result);
  Raise; //. =>
  end;
end;

function TVideoRecorderMeasurement.PrepareFragment(StartTimestamp,FinishTimeStamp: double; const flAudio,flVideo: boolean): string;
var
  FragmentID: string;
  FragmentFolder: string;
  AudioPacketTimeDelta: double;
  AudioStartPos,AudioFinishPos: integer;
  AudioPacketCounter: integer;
  AudioPacketTS,AudioPacketTSBase: integer;
  VideoPacketTimeDelta: double;
  VideoStartPos,VideoFinishPos: integer;
  VideoPacketCounter: integer;
  VideoPacketTS,VideoPacketTSBase: integer;
  Input,Output: TFileStream;
  I: integer;
  PacketDescriptor: integer;
  Packet: array of byte;
  Fragment: TVideoRecorderMeasurement;
begin
if (Self.FinishTimestamp = 0.0) then Raise Exception.Create('measurement is not finished'); //. =>
if ((StartTimestamp >= Self.FinishTimestamp) OR  (FinishTimestamp <= Self.StartTimestamp)) then Raise Exception.Create('fragment is out of scope'); //. =>
if (FinishTimestamp = 0.0) then FinishTimestamp:=Self.FinishTimestamp;
if (StartTimestamp >= FinishTimestamp) then Raise Exception.Create('fragment is out of scope'); //. =>
//.
FragmentID:=FloatToStr(StartTimestamp);
FragmentFolder:=MeasurementFolder+'\'+MeasurementFragmentsFolderName+'\'+FragmentID;
ForceDirectories(FragmentFolder);
//.
//. copy descriptor
CopyFile(PAnsiChar(MeasurementFolder+'\'+DescriptorFileName),PAnsiChar(FragmentFolder+'\'+DescriptorFileName),false);
//.
AudioPacketTimeDelta:=0;
AudioStartPos:=0;
AudioFinishPos:=0;
if (flAudio AND (Self.AudioPackets > 0))
 then begin
  AudioPacketTimeDelta:=(Self.FinishTimestamp-Self.StartTimestamp)/Self.AudioPackets;
  if (StartTimestamp < Self.StartTimestamp)
   then StartTimestamp:=Self.StartTimestamp;
  AudioStartPos:=Trunc((StartTimestamp-Self.StartTimestamp)/AudioPacketTimeDelta);
  if (FinishTimestamp > Self.FinishTimestamp)
   then FinishTimestamp:=Self.FinishTimestamp;
  AudioFinishPos:=Self.AudioPackets-Trunc((Self.FinishTimestamp-FinishTimestamp)/AudioPacketTimeDelta);
  end;
AudioPacketCounter:=0;
//.
VideoPacketTimeDelta:=0;
VideoStartPos:=0;
VideoFinishPos:=0;
if (flVideo AND (Self.VideoPackets > 0))
 then begin
  VideoPacketTimeDelta:=(Self.FinishTimestamp-Self.StartTimestamp)/Self.VideoPackets;
  if (StartTimestamp < Self.StartTimestamp)
   then StartTimestamp:=Self.StartTimestamp;
  VideoStartPos:=Trunc((StartTimestamp-Self.StartTimestamp)/VideoPacketTimeDelta);
  if (FinishTimestamp > Self.FinishTimestamp)
   then FinishTimestamp:=Self.FinishTimestamp;
  VideoFinishPos:=Self.VideoPackets-Trunc((Self.FinishTimestamp-FinishTimestamp)/VideoPacketTimeDelta);
  end;
VideoPacketCounter:=0;
//.
SetLength(Packet,1024*1024*1);
if (flAudio AND (Self.AudioPackets > 0))
 then begin
  Input:=TFileStream.Create(MeasurementFolder+'\'+AudioFileName,(fmOpenRead OR fmShareDenyWrite));
  try
  Output:=TFileStream.Create(FragmentFolder+'\'+AudioFileName,fmCreate);
  try
  AudioPacketTSBase:=-1;
  for I:=0 to Self.AudioPackets-1 do begin
    Input.Read(PacketDescriptor,SizeOf(PacketDescriptor));
    if (PacketDescriptor > 0)
     then begin
      if ((AudioStartPos <= I) AND (I <= AudioFinishPos))
       then begin
        Input.Read(Pointer(@Packet[0])^,PacketDescriptor);
        //.
        AudioPacketTS:=(Packet[4] SHL 24)+((Packet[5] AND $FF) SHL 16)+((Packet[6] AND $FF) SHL 8)+(Packet[7] AND $FF);
        if (AudioPacketTSBase < 0) then AudioPacketTSBase:=AudioPacketTS;
        AudioPacketTS:=AudioPacketTS-AudioPacketTSBase;
        Packet[7]:=Byte(AudioPacketTS AND $FF);
        Packet[6]:=Byte((AudioPacketTS SHR 8) AND $FF);
        Packet[5]:=Byte((AudioPacketTS SHR 16) AND $FF);
        Packet[4]:=Byte(AudioPacketTS SHR 24);
        //.
        Output.write(PacketDescriptor,SizeOf(PacketDescriptor));
        Output.write(Pointer(@Packet[0])^,PacketDescriptor);
        //.
        Inc(AudioPacketCounter);
        //.
        if (I = AudioFinishPos) then Break; //. >
        end
       else Input.Position:=Input.Position+PacketDescriptor;
      end;
    end;
  finally
  Output.Destroy();
  end;
  finally
  Input.Destroy();
  end;
  end;
if (flVideo AND (Self.VideoPackets > 0))
 then begin
  Input:=TFileStream.Create(MeasurementFolder+'\'+VideoFileName,(fmOpenRead OR fmShareDenyWrite));
  try
  Output:=TFileStream.Create(FragmentFolder+'\'+VideoFileName,fmCreate);
  try
  VideoPacketTSBase:=-1;
  for I:=0 to Self.VideoPackets-1 do begin
    Input.Read(PacketDescriptor,SizeOf(PacketDescriptor));
    if (PacketDescriptor > 0)
     then begin
      if ((VideoStartPos <= I) AND (I <= VideoFinishPos))
       then begin
        Input.Read(Pointer(@Packet[0])^,PacketDescriptor);
        //.
        VideoPacketTS:=(Packet[4] SHL 24)+((Packet[5] AND $FF) SHL 16)+((Packet[6] AND $FF) SHL 8)+(Packet[7] AND $FF);
        if (VideoPacketTSBase < 0) then VideoPacketTSBase:=VideoPacketTS;
        VideoPacketTS:=VideoPacketTS-VideoPacketTSBase;
        Packet[7]:=Byte(VideoPacketTS AND $FF);
        Packet[6]:=Byte((VideoPacketTS SHR 8) AND $FF);
        Packet[5]:=Byte((VideoPacketTS SHR 16) AND $FF);
        Packet[4]:=Byte(VideoPacketTS SHR 24);
        //.
        Output.write(PacketDescriptor,SizeOf(PacketDescriptor));
        Output.write(Pointer(@Packet[0])^,PacketDescriptor);
        //.
        Inc(VideoPacketCounter);
        //.
        if (I = VideoFinishPos) then Break; //. >
        end
       else Input.Position:=Input.Position+PacketDescriptor;
      end;
    end;
  finally
  Output.Destroy();
  end;
  finally
  Input.Destroy();
  end;
  end;
//.
Fragment:=TVideoRecorderMeasurement.Create(MeasurementFolder+'\'+MeasurementFragmentsFolderName,FragmentID);
try
Fragment.ID:=FragmentID;
Fragment.StartTimestamp:=StartTimestamp;
Fragment.FinishTimestamp:=FinishTimestamp;
Fragment.AudioPackets:=AudioPacketCounter;
Fragment.VideoPackets:=VideoPacketCounter;
//.
Fragment.SaveDescriptor();
finally
Fragment.Destroy();
end;
//.
Result:=FragmentID;
end;


end.
