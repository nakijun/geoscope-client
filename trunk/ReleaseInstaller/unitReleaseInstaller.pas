unit unitReleaseInstaller;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wininet, StdCtrls, ComCtrls, Gauges, Buttons, ExtCtrls,
  AbArcTyp,
  AbZipTyp,
  AbUnzPrc,
  AbUtils;

const
  IntallingProcess = 'Install.cmd';
  ClientExecutive = 'SOAPClient.exe';
type
  TDoOnException = procedure (const E: Exception) of object;
  TDoOnStateIsChanged = procedure () of object;
  TDoOnOperationProgress = procedure (const Precentage: integer) of object;
  TDoOnPortionRead = procedure (const BytesProcessed,BytesTotal: DWord) of object;

  TReleaseInstalling = class(TThread)
  private
    FileSize: DWord;
    RealFileSize: DWord;
    ProgressValue: integer;

    procedure DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
  public
    flEnabled: boolean;
    URL: ANSIString;
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

    Constructor Create(const pURL: ANSIString);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure ProcessDoOnException;
    procedure ProcessDoOnStartOfDownloading();
    procedure ProcessDoOnPortionRead();
    procedure ProcessDoOnStartOfUnpacking();
    procedure ProcessDoOnUnpackingProgress();
    procedure ProcessDoOnStartOfReleaseInstalling();
    procedure ProcessDoOnDone();
  end;


type
  TfmReleaseInstaller = class(TForm)
    lbStatus: TLabel;
    sbCancel: TSpeedButton;
    Bevel1: TBevel;
    ProgressBar: TGauge;
    procedure sbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure DoOnException(const E: Exception);
    procedure DoOnStartOfDownloading();
    procedure DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
    procedure DoOnStartOfUnpacking();
    procedure DoOnUnpackingProgress(const Percentage: integer);
    procedure DoOnStartOfReleaseInstalling();
    procedure DoOnDone();
  public
    { Public declarations }
    URL: string;
    IFD: TReleaseInstalling;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
  end;


var
  fmReleaseInstaller: TfmReleaseInstaller;

implementation
Uses
  StrUtils;


{$R *.DFM}



{TfmReleaseInstaller}
Constructor TfmReleaseInstaller.Create(AOwner: TComponent);
begin
Inherited Create(AOwner);
with lbStatus do begin
Color:=clBtnFace;
Font.Color:=clNavy;
Alignment:=taLeftJustify;
Caption:='preparing to install ...';
Hint:=Caption;
Update;
end;
URL:=ParamStr(1);
IFD:=TReleaseInstalling.Create(URL);
IFD.OnException:=DoOnException;
IFD.OnStartOfDownloading:=DoOnStartOfDownloading;
IFD.OnPortionRead:=DoOnBytesRead;
IFD.OnStartOfUnpacking:=DoOnStartOfUnpacking;
IFD.OnUnpackingProgress:=DoOnUnpackingProgress;
IFD.OnStartOfReleaseInstalling:=DoOnStartOfReleaseInstalling;
IFD.OnDone:=DoOnDone;
IFD.Resume();
end;

Destructor TfmReleaseInstaller.Destroy;
begin
IFD.Free;
Inherited;
end;

procedure TfmReleaseInstaller.DoOnException(const E: Exception);
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

procedure TfmReleaseInstaller.DoOnStartOfDownloading();
begin
ProgressBar.Progress:=0;
lbStatus.Caption:='connecting server ...';
end;

procedure TfmReleaseInstaller.DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
begin
with ProgressBar do begin
Progress:=Round(100*(BytesProcessed/BytesTotal));
if (BytesTotal >= 1024)
 then lbStatus.Caption:='loaded: '+IntToStr(Round(BytesProcessed/1000))+'Kb / '+IntToStr(Round(BytesTotal/1000))+'Kb'
 else lbStatus.Caption:='loaded: '+IntToStr(BytesProcessed)+'bt / '+IntToStr(BytesTotal)+'bt';
Hint:=Caption;
end;
end;

procedure TfmReleaseInstaller.DoOnStartOfUnpacking();
begin
ProgressBar.Progress:=0;
sbCancel.Enabled:=false;
lbStatus.Caption:='unpacking data ...';
end;

procedure TfmReleaseInstaller.DoOnUnpackingProgress(const Percentage: integer);
begin
ProgressBar.Progress:=Percentage;
end;

procedure TfmReleaseInstaller.DoOnStartOfReleaseInstalling();
begin
ProgressBar.Progress:=0;
lbStatus.Caption:='installing ...';
end;

procedure TfmReleaseInstaller.DoOnDone();
begin
ProgressBar.Progress:=ProgressBar.MaxValue;
lbStatus.Caption:='Installation has been done.';
Application.MessageBox(PChar(lbStatus.Caption),'Information',MB_ICONINFORMATION+MB_OK);
//.
Application.Terminate();
end;

procedure TfmReleaseInstaller.sbCancelClick(Sender: TObject);
begin
IFD.Terminate();
end;

procedure TfmReleaseInstaller.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
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


{TReleaseInstalling}
Constructor TReleaseInstalling.Create(const pURL: ANSIString);
begin
flEnabled:=true;
URL:=pURL;
Stream:=nil;
ThreadException:=Exception.Create('process is not finished'); 
PacketDelay:=0;
flEnabled:=true;
flCanTerminate:=true;
Inherited Create(true);
end;

Destructor TReleaseInstalling.Destroy;
begin
Inherited;
ThreadException.Free;
Stream.Free;
end;

function WinExecAndWait32(FileName: String; Visibility : integer; const WaitForProcessFinish: boolean = true): dword;
var
  zAppName: array[0..255] of char;
  zCurDir: array[0..255] of char;
  WorkDir: String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
StrPCopy(zAppName,FileName);
GetDir(0,WorkDir);
StrPCopy(zCurDir,WorkDir);
FillChar(StartupInfo,Sizeof(StartupInfo),#0);
StartupInfo.cb := Sizeof(StartupInfo);
StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
StartupInfo.wShowWindow := Visibility;
if not CreateProcess(nil,
  zAppName,                      { указатель командной строки }
  nil,                           { указатель на процесс атрибутов 
  безопасности }
  nil,                           { указатель на поток атрибутов безопасности 
  }
  false,                         { флаг родительского обработчика }
  CREATE_NEW_CONSOLE or          { флаг создания }
  NORMAL_PRIORITY_CLASS,
  nil,                           { указатель на новую среду процесса }
  nil,                           { указатель на имя текущей директории }
  StartupInfo,                   { указатель на STARTUPINFO }
  ProcessInfo)
 then
  Result:=$FFFFFFFF
 else begin
  if (WaitForProcessFinish)
   then begin
    WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess,Result);
    end;
  end;
end;

procedure TReleaseInstalling.DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
begin
Raise Exception.Create('error while unpacking file: '+Item.FileName);
end;

procedure TReleaseInstalling.Execute;
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
Sleep(2000); //. wait for last release termination
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
Synchronize(ProcessDoOnStartOfUnpacking);
Stream.Position:=0;
with TZipArchive.CreateFromStream(Stream,'') do
try
OnProcessItemFailure:=DoOnAbArchiveItemFailureEvent;
ExtractOptions:=ExtractOptions+[eoRestorePath];
BaseDirectory:=ExtractFilePath(GetModuleName(HInstance))+'..';
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
//.
Synchronize(ProcessDoOnStartOfReleaseInstalling);
InstallProgramFile:='..\'+'TempDATA'+'\'+IntallingProcess;
if (FileExists(InstallProgramFile))
 then begin
  if (WinExecAndWait32(InstallProgramFile,0) = $FFFFFFFF)
   then Raise Exception.Create('could not start installation script'); //. =>
  end;
if (Terminated) then Raise Exception.Create('installing is terminated'); //. =>
//.
Synchronize(ProcessDoOnDone);
//.
if (WinExecAndWait32('..\'+ClientExecutive,1,false) = $FFFFFFFF)
 then Raise Exception.Create('could not start client program'); //. =>
finally
flCanTerminate:=true;
end;
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

procedure TReleaseInstalling.ProcessDoOnException;
begin
if Assigned(OnException) then OnException(ThreadException);
end;

procedure TReleaseInstalling.ProcessDoOnStartOfDownloading();
begin
if Assigned(OnStartOfDownloading) then OnStartOfDownloading();
end;

procedure TReleaseInstalling.ProcessDoOnPortionRead;
begin
if Assigned(OnPortionRead) then OnPortionRead(RealFileSize,FileSize);
end;

procedure TReleaseInstalling.ProcessDoOnStartOfUnpacking();
begin
if Assigned(OnStartOfUnpacking) then OnStartOfUnpacking();
end;

procedure TReleaseInstalling.ProcessDoOnUnpackingProgress();
begin
if Assigned(OnUnpackingProgress) then OnUnpackingProgress(ProgressValue);
end;

procedure TReleaseInstalling.ProcessDoOnStartOfReleaseInstalling();
begin
if Assigned(OnStartOfReleaseInstalling) then OnStartOfReleaseInstalling();
end;

procedure TReleaseInstalling.ProcessDoOnDone();
begin
if Assigned(OnDone) then OnDone();
end;

procedure TfmReleaseInstaller.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:=((IFD = nil) OR (IFD.flCanTerminate));
end;


Initialization
DecimalSeparator:='.';
ChDir(ExtractFilePath(GetModuleName(HInstance)));


end.
