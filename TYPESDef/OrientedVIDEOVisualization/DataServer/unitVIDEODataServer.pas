unit unitVIDEODataServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, SyncObjs, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MMSystem, StdCtrls, Buttons, VFW;


type
  TAVIProcessing = class(TThread)
  public
    Lock: TCriticalSection;
    pFile: IAVIFile;
    VideoStream: IAVIStream;
    AudioStream: IAVIStream;
    VideoData: pointer;
    VideoDataSize: integer;
    VideoMsPerFrame: integer;
    AudioData: pointer;
    AudioDataSize: integer;
    AudioMsPerFrame: integer;
    AudioFramesPerSec: integer;
    AudioFrameDataSize: integer;
    AudioFrameSize: integer;
    MaxVideoFrame: integer;
    MaxAudioFrame: integer;
    MsNullTime: integer;
    NullTimeEqu: integer;
    CurrentVideoFrame: integer;
    CurrentAudioFrame: integer;
    LastVideoFrame: integer;
    LastAudioFrame: integer;
    Interval: integer;
    pWFX: pointer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Execute; override;
  end;

type
  TfmVIDEODataServer = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    AVIDeviceID: integer;
    AVIProcessing: TAVIProcessing;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
  end;

var
  fmVIDEODataServer: TfmVIDEODataServer;

implementation

{$R *.dfm}


{TAVIProcessing}
Constructor TAVIProcessing.Create;
var
  avis: TAVIStreamInfo;
  L1,L2: integer;
  WFXSize: integer;
begin
Lock:=TCriticalSection.Create;
pFile:=nil;
VideoData:=nil;
AudioStream:=nil;
VideoStream:=nil;
AVIFileInit;
if AVIFileOpen(pFile,'test1.wav',OF_SHARE_DENY_WRITE,0) <> AVIERR_OK then Raise Exception.Create('could not open file'); //. =>
if AVIFileGetStream(pFile,AudioStream,streamtypeAUDIO,0) = AVIERR_OK
 then begin //. get audio params
  if AVIStreamInfo(AudioStream, avis,SizeOf(avis)) <> AVIERR_OK then Raise Exception.Create('could not get audio stream info'); //. =>
  AudioFramesPerSec:=Trunc(avis.dwRate/avis.dwScale)*avis.dwSampleSize;
  MaxAudioFrame:=avis.dwLength;
  if AVIStreamRead(AudioStream,0,Trunc(AudioFramesPerSec/10),0,Trunc(AudioFramesPerSec/10),@L1,@L2) <> AVIERR_OK then Raise Exception.Create('could not read audio stream'); //. =>
  AudioFrameDataSize:=L1;
  AudioFrameSize:=L2;
  AudioMsPerFrame:=Round(1000/10);
  if AVIStreamReadFormat(AudioStream,0,nil, @WFXSize) <> AVIERR_OK then Raise Exception.Create('could not read audio stream format size'); //. =>
  GetMem(pWFX,WFXSize);
  if AVIStreamReadFormat(AudioStream,0, pWFX,@WFXSize) <> AVIERR_OK then Raise Exception.Create('could not read audio stream format'); //. =>
  TWaveFormatEx(pWFX^).cbSize:=WFXSize;
  GetMem(AudioData,AudioFrameDataSize);
  end;
if AVIFileGetStream(pFile,VideoStream,streamtypeVIDEO,0) = AVIERR_OK
 then begin //. get video params
  if AVIStreamInfo(VideoStream, avis,SizeOf(avis)) <> AVIERR_OK then Raise Exception.Create('could not get video stream info'); //. =>
  VideoMsPerFrame:=Round(1000/(avis.dwRate/avis.dwScale));
  MaxVideoFrame:=avis.dwLength;
  end;
//.
NullTimeEqu:=0;
LastVideoFrame:=0;
LastAudioFrame:=0;
Interval:=10;
Inherited Create(true);
/// ? Priority:=tpHighest;
Resume;
end;

Destructor TAVIProcessing.Destroy;
begin
Inherited;
if pWFX <> nil then FreeMem(pWFX);
if AudioData <> nil then FreeMem(AudioData);
{/// ? if VideoStream <> nil then AVIStreamRelease(VideoStream);
if AudioStream <> nil then AVIStreamRelease(AudioStream);
if pFile <> nil then AVIFileRelease(pFile);}
AVIFileExit;
Lock.Free;
end;

procedure TAVIProcessing.Execute;
var
  MsNewTime: integer;
  avis: TAVIStreamInfo;
  WFXSize: integer;
  L1,L2: integer;
  VF: TBitmapInfoHeader;
  pFrame: IGetFrame;
  pVF: PBitmapInfoHeader;
begin
with VF do begin
biSize:=SizeOf(VF);
biBitCount:=24;
biCompression:=BI_RGB;
biWidth:=100;
biHeight:=70;
biSizeImage:=Trunc(biWidth*biHeight*biBitCount/8);
end;
pFrame:=nil;
if VideoStream <> nil then pFrame:=AVIStreamGetFrameOpen(VideoStream,nil);
try
MsNullTime:=timeGetTime;
repeat
  Sleep(Interval);
  //.
  Lock.Enter;
  try
  MsNewTime:=timeGetTime;
  if AudioStream <> nil
   then begin //. get audio packet
    CurrentAudioFrame:=(MsNewTime-MsNullTime) DIV AudioMsPerFrame+2;
    if ((MsNewTime-MsNullTime) MOD AudioMsPerFrame) > 0 then Inc(CurrentAudioFrame);
    if CurrentAudioFrame <> LastAudioFrame
     then begin
      AVIStreamRead(AudioStream,CurrentAudioFrame*AudioFrameSize,AudioFrameSize,AudioData,AudioFrameDataSize,@L1,@L2);
      AudioDataSize:=L1;
      LastAudioFrame:=CurrentAudioFrame;
      end;
    end;
  if pFrame <> nil
   then begin //. get video frame
    CurrentVideoFrame:=(MsNewTime-MsNullTime) DIV VideoMsPerFrame;
    if ((MsNewTime-MsNullTime) DIV VideoMsPerFrame) > 0 then Inc(CurrentVideoFrame);
    if (CurrentVideoFrame <> LastVideoFrame)
     then
      if (CurrentVideoFrame < MaxVideoFrame)
       then begin
        try
        pVF:=AVIStreamGetFrame(pFrame,CurrentVideoFrame);
        if pVF = nil then Raise Exception.Create('no extraction done'); //. =>
        VideoData:=pVF;
        VideoDataSize:=pVF.biSize+pVF.biSizeImage;
        except
          end;
        //.
        LastVideoFrame:=CurrentVideoFrame;
        end
       else
        MsNullTime:=timeGetTime;
    end;
  finally
  Lock.Leave;
  end;
  //.
until Terminated;
finally
if pFrame <> nil then AVIStreamGetFrameClose(pFrame);
end;
end;

{TfmVIDEODataServer}
Constructor TfmVIDEODataServer.Create(AOwner: TComponent);
begin
Inherited Create(AOwner);
//.
AVIProcessing:=TAVIProcessing.Create;
end;

Destructor TfmVIDEODataServer.Destroy;
begin
AVIProcessing.Free;
//.
Inherited;
end;


end.
