unit unitReleaseLoader;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wininet, StdCtrls, ComCtrls, Gauges, Buttons, ExtCtrls,
  AbArcTyp,
  AbZipTyp,
  AbUnzPrc,
  AbUtils;

type
  TDoOnException = procedure (const E: Exception) of object;
  TDoOnStateIsChanged = procedure () of object;
  TDoOnOperationProgress = procedure (const Precentage: integer) of object;
  TDoOnPortionRead = procedure (const BytesProcessed,BytesTotal: DWord) of object;

  TReleaseLoading = class(TThread)
  private
    FileSize: DWord;
    RealFileSize: DWord;
    ProgressValue: integer;

    procedure DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
    procedure Synchronize(Method: TThreadMethod); reintroduce;
  public
    flEnabled: boolean;
    URL: ANSIString;
    DestinationFolder: string;
    OnException: TDoOnException;
    OnStartOfDownloading: TDoOnStateIsChanged;
    OnPortionRead: TDoOnPortionRead;
    OnStartOfUnpacking: TDoOnStateIsChanged;
    OnUnpackingProgress: TDoOnOperationProgress;
    OnStartOfReleaseInstalling: TDoOnStateIsChanged;
    OnDone: TDoOnStateIsChanged;
    Stream: TMemoryStream;
    ThreadException: Exception;
    PacketDelay: integer;
    flCanTerminate: boolean;

    Constructor Create(const pURL: ANSIString; const pDestinationFolder: string);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure ProcessDoOnException;
    procedure ProcessDoOnStartOfDownloading();
    procedure ProcessDoOnPortionRead();
    procedure ProcessDoOnStartOfUnpacking();
    procedure ProcessDoOnUnpackingProgress();
    procedure ProcessDoOnDone();
  end;


type
  TfmReleaseLoader = class(TForm)
    lbStatus: TLabel;
    sbCancel: TSpeedButton;
    Bevel1: TBevel;
    ProgressBar: TGauge;
    procedure sbCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure DoOnException(const E: Exception);
    procedure DoOnStartOfDownloading();
    procedure DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
    procedure DoOnStartOfUnpacking();
    procedure DoOnUnpackingProgress(const Percentage: integer);
    procedure DoOnDone();
  public
    { Public declarations }
    URL: string;
    DestinationFolder: string;
    IFD: TReleaseLoading;
    flCompleted: boolean;

    Constructor Create(const pURL: string; const pDestinationFolder: string);
    Destructor Destroy(); override;
  end;


  procedure CopyFolder(const SrcFolder: string; const DistinationPath: string);
  procedure DeleteFolder(const Folder: string);


implementation
Uses
  StrUtils,
  FunctionalityImport;


{$R *.DFM}


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


{TfmReleaseInstaller}
Constructor TfmReleaseLoader.Create(const pURL: string; const pDestinationFolder: string);
begin
Inherited Create(nil);
URL:=pURL;
DestinationFolder:=pDestinationFolder;
flCompleted:=false;
//.
with lbStatus do begin
Color:=clBtnFace;
Font.Color:=clNavy;
Alignment:=taLeftJustify;
Caption:='preparing ...';
Hint:=Caption;
Update;
end;
IFD:=TReleaseLoading.Create(URL,DestinationFolder);
IFD.OnException:=DoOnException;
IFD.OnStartOfDownloading:=DoOnStartOfDownloading;
IFD.OnPortionRead:=DoOnBytesRead;
IFD.OnStartOfUnpacking:=DoOnStartOfUnpacking;
IFD.OnUnpackingProgress:=DoOnUnpackingProgress;
IFD.OnDone:=DoOnDone;
end;

Destructor TfmReleaseLoader.Destroy();
begin
IFD.Free();
Inherited;
end;

procedure TfmReleaseLoader.FormShow(Sender: TObject);
begin
IFD.Resume();
end;

procedure TfmReleaseLoader.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=((IFD = nil) OR (IFD.flCanTerminate));
end;

procedure TfmReleaseLoader.DoOnException(const E: Exception);
begin
with lbStatus do begin
Color:=clRed;
Font.Color:=clWhite;
Alignment:=taLeftJustify;
Caption:='Error. Process is stopped.';
Hint:=Caption;
end;
Application.MessageBox(PChar(E.Message),'error',MB_ICONEXCLAMATION+MB_OK);
Close();
end;

procedure TfmReleaseLoader.DoOnStartOfDownloading();
begin
ProgressBar.Progress:=0;
lbStatus.Caption:='connecting server ...';
end;

procedure TfmReleaseLoader.DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
begin
with ProgressBar do begin
Progress:=Round(100*(BytesProcessed/BytesTotal));
if (BytesTotal >= 1024)
 then lbStatus.Caption:='loaded: '+IntToStr(Round(BytesProcessed/1000))+'Kb / '+IntToStr(Round(BytesTotal/1000))+'Kb'
 else lbStatus.Caption:='loaded: '+IntToStr(BytesProcessed)+'bt / '+IntToStr(BytesTotal)+'bt';
Hint:=Caption;
end;
end;

procedure TfmReleaseLoader.DoOnStartOfUnpacking();
begin
ProgressBar.Progress:=0;
sbCancel.Enabled:=false;
lbStatus.Caption:='unpacking data ...';
end;

procedure TfmReleaseLoader.DoOnUnpackingProgress(const Percentage: integer);
begin
ProgressBar.Progress:=Percentage;
end;

procedure TfmReleaseLoader.DoOnDone();
begin
flCompleted:=true;
//.
ProgressBar.Progress:=ProgressBar.MaxValue;
lbStatus.Caption:='Loading is done.';
//.
Close();
end;

procedure TfmReleaseLoader.sbCancelClick(Sender: TObject);
begin
IFD.Terminate();
end;


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


{TReleaseLoading}
Constructor TReleaseLoading.Create(const pURL: ANSIString; const pDestinationFolder: string);
begin
flEnabled:=true;
URL:=pURL;
DestinationFolder:=pDestinationFolder;
Stream:=nil;
ThreadException:=Exception.Create('process is not finished'); 
PacketDelay:=0;
flEnabled:=true;
flCanTerminate:=true;
Inherited Create(true);
end;

Destructor TReleaseLoading.Destroy;
begin
Inherited;
ThreadException.Free;
Stream.Free;
end;

procedure TReleaseLoading.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TReleaseLoading.DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
begin
Raise Exception.Create('error while unpacking file: '+Item.FileName);
end;

procedure TReleaseLoading.Execute;
const
  BufferSize = 8192;
var
  hInet,hURL: HINTERNET;
  BytesRead: DWord;
  Buffer: array[0..BufferSize-1] of byte;
  BufferPortion: DWord;
  Header: string;
  Index: DWord;
  TotalSize, SizeOfTotalSize: dword;
  SizeHigh: DWord;
  I: integer;
  FN: string;
  FA: Integer;
  InstallProgramFile: string;
begin
try               
Stream:=nil;
try
Synchronize(ProcessDoOnStartOfDownloading);
//.
hInet:=InternetOpen('SpaceSOAPClient',
  PRE_CONFIG_INTERNET_ACCESS,
  nil,
  nil,
  0);
if (hInet = nil) then Raise Exception.Create('could not InternetOpen'); //. =>
try
if (InternetAttemptConnect(0) <> ERROR_SUCCESS) then Raise Exception.Create('no connection'); //. =>
//.
Header:='Accept: */*';
hURL:=InternetOpenURL(hInet,
  PChar(URL),
  pchar(Header),
  StrLen(pchar(Header)),
  0,
  0);
if (hURL = nil) then Raise Exception.Create('could not open file'); //. =>
try
//. get file size
Index:=0; SizeOfTotalSize:=SizeOf(TotalSize); TotalSize:=0;
if (HttpQueryInfo(hURL, HTTP_QUERY_CONTENT_LENGTH OR HTTP_QUERY_FLAG_NUMBER, @TotalSize, SizeOfTotalSize, Index))
 then
  FileSize:=TotalSize
 else begin
  FileSize:=FtpGetFileSize(hURL,@SizeHigh);
  if (FileSize = DWord(-1)) then FileSize:=BufferSize;
  end;
Stream:=TMemoryStream.Create;
Stream.SetSize(FileSize);
if (FileSize < BufferSize) then BufferPortion:=FileSize else BufferPortion:=BufferSize;
RealFileSize:=0;
repeat
  if (flEnabled)
   then begin
    //. read buffer
    if (NOT InternetReadFile(hURL, @Buffer, BufferPortion, BytesRead)) then Raise Exception.Create('can not read file'); //. =>
    if (BytesRead > 0)
     then begin
      Stream.Write(Buffer,BytesRead);
      Inc(RealFileSize,BytesRead);
      if (FileSize < RealFileSize) then FileSize:=(FileSize SHL 1); 
      Synchronize(ProcessDoOnPortionRead);
      end
     else begin
      FileSize:=RealFileSize;
      Synchronize(ProcessDoOnPortionRead);
      Break; //. >
      end;
    end;
  //.
  Sleep(PacketDelay);
until ((RealFileSize = FileSize) OR Terminated);
if (RealFileSize = FileSize)
 then FreeAndNil(ThreadException)
 else if (Terminated) then Raise Exception.Create('loading is terminated'); //. =>
//.
flCanTerminate:=false;
try
DeleteFolder(DestinationFolder);
ForceDirectories(DestinationFolder);
//.
Synchronize(ProcessDoOnStartOfUnpacking);
Stream.Position:=0;
with TZipArchive.CreateFromStream(Stream,'') do
try
OnProcessItemFailure:=DoOnAbArchiveItemFailureEvent;
ExtractOptions:=ExtractOptions+[eoRestorePath];
BaseDirectory:=DestinationFolder;
Load();
for I:=0 to ItemList.Count-1 do begin
  if (Terminated) then Raise Exception.Create('unpacking is terminated'); //. =>
  //.
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
  //.
  if ((I MOD 10) = 0)
   then begin
    ProgressValue:=Trunc(100.0*I/ItemList.Count);
    Synchronize(ProcessDoOnUnpackingProgress);
    end;
  end;
finally
Destroy();
end;
finally
flCanTerminate:=true;
end;
//.
Synchronize(ProcessDoOnDone);
finally
InternetCloseHandle(hURL);
end;
finally
InternetCloseHandle(hInet);
end;
except
  FreeAndNil(Stream);
  Raise; //. =>
  end;
except
  FreeAndNil(ThreadException);
  ThreadException:=AcquireExceptionObject;
  Synchronize(ProcessDoOnException);
  end;
end;

procedure TReleaseLoading.ProcessDoOnException;
begin
if Assigned(OnException) then OnException(ThreadException);
end;

procedure TReleaseLoading.ProcessDoOnStartOfDownloading();
begin
if Assigned(OnStartOfDownloading) then OnStartOfDownloading();
end;

procedure TReleaseLoading.ProcessDoOnPortionRead;
begin
if Assigned(OnPortionRead) then OnPortionRead(RealFileSize,FileSize);
end;

procedure TReleaseLoading.ProcessDoOnStartOfUnpacking();
begin
if Assigned(OnStartOfUnpacking) then OnStartOfUnpacking();
end;

procedure TReleaseLoading.ProcessDoOnUnpackingProgress();
begin
if Assigned(OnUnpackingProgress) then OnUnpackingProgress(ProgressValue);
end;

procedure TReleaseLoading.ProcessDoOnDone();
begin
if Assigned(OnDone) then OnDone();
end;


end.
