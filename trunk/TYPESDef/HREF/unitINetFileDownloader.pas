unit unitINetFileDownloader;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wininet, StdCtrls, ComCtrls, Gauges, Buttons, ExtCtrls;

type
  TDoOnPortionRead = procedure (const BytesProcessed,BytesTotal: DWord) of object;
  TDoOnException = procedure (const E: Exception) of object;

  TInetFileDownloading = class(TThread)
  private
    FileSize: DWord;
    RealFileSize: DWord;
  public
    flEnabled: boolean;
    URL: ANSIString;
    DoOnPortionRead: TDoOnPortionRead;
    DoOnException: TDoOnException;
    Stream: TMemoryStream;
    ThreadException: Exception;
    PacketDelay: integer;

    Constructor Create(const pURL: ANSIString; const pDoOnPortionRead: TDoOnPortionRead; const pDoOnException: TDoOnException);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure ProcessDoOnPortionRead;
    procedure ProcessDoOnException;
  end;

  
type
  TfmINetFileDownloader = class(TForm)
    lbProgress: TLabel;
    lbStatus: TLabel;
    tbPriority: TTrackBar;
    sbOpen: TSpeedButton;
    sbSaveAs: TSpeedButton;
    sbCancel: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ProgressBar: TGauge;
    sbStartStop: TSpeedButton;
    SaveDialog: TSaveDialog;
    procedure tbPriorityChange(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbStartStopClick(Sender: TObject);
    procedure sbSaveAsClick(Sender: TObject);
    procedure sbOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
    procedure DoOnException(const E: Exception);
    procedure Open;
    procedure SaveAs;
  public
    { Public declarations }
    IFD: TInetFileDownloading;
    flFreeOnClose: boolean;
    flOpen: boolean;

    Constructor Create(const pURL: ANSIString; const pflOpen: boolean);
    Destructor Destroy; override;
  end;


implementation
Uses
  unitProxySpace,
  ShellAPI;


{$R *.DFM}



{TfmINetFileDownloader}
Constructor TfmINetFileDownloader.Create(const pURL: ANSIString; const pflOpen: boolean);
begin
Inherited Create(nil);
flFreeOnClose:=true;
flOpen:=pflOpen;
with lbStatus do begin
Color:=clGreen;
Font.Color:=clWhite;
Alignment:=taCenter;
Caption:='connecting ...';
Hint:=Caption;
Update;
end;
IFD:=TInetFileDownloading.Create(pURL,DoOnBytesRead,DoOnException);
end;

Destructor TfmINetFileDownloader.Destroy;
begin
IFD.Free;
Inherited;
end;

procedure TfmINetFileDownloader.DoOnBytesRead(const BytesProcessed,BytesTotal: DWord);
begin
with ProgressBar do begin
Progress:=Round(100*(BytesProcessed/BytesTotal));
if BytesProcessed <> BytesTotal
 then begin
  sbOpen.Enabled:=false;
  sbSaveAs.Enabled:=false;
  end
 else begin
  sbOpen.Enabled:=true;
  sbSaveAs.Enabled:=true;
  if flOpen
   then begin
    Open;
    if flFreeOnClose then Close;
    end;
  end;
with lbStatus do begin
Color:=clNavy;
Font.Color:=clYellow;
Alignment:=taCenter;
end;
if BytesTotal >= 1024
 then lbStatus.Caption:=IntToStr(Round(BytesProcessed/1000))+'Kb / '+IntToStr(Round(BytesTotal/1000))+'Kb'
 else lbStatus.Caption:=IntToStr(BytesProcessed)+'bt / '+IntToStr(BytesTotal)+'bt';
Hint:=Caption;
end;
end;

procedure TfmINetFileDownloader.DoOnException(const E: Exception);
begin
with lbStatus do begin
Color:=clRed;
Font.Color:=clWhite;
Alignment:=taCenter;
Caption:=E.Message;
Hint:=Caption;
end;
sbOpen.Enabled:=false;
sbSaveAs.Enabled:=false;
end;

procedure TfmINetFileDownloader.Open;

  procedure NormalizeFileName(var FN: ANSIString);
  var
    I: integer;
  begin
  for I:=1 to Length(FN) do
    if (FN[I] = '/') OR (FN[I] = ':') then FN[I]:='_';
  end;

var
  FN: ANSIString;
begin
if IFD = nil then Exit; //. ->
if IFD.ThreadException <> nil then Raise Exception.Create(IFD.ThreadException.Message); //. =>
FN:=IFD.URL;
NormalizeFileName(FN);
FN:=ExtractFilePath(ParamStr(0))+'\'+PathTempDATA+'\'+FN;
IFD.Stream.SaveToFile(FN);
if ShellExecute(0,nil,PChar(FN),nil,nil, 1) = 0 then Raise Exception.Create('could not open file'); //. =>
end;

procedure TfmINetFileDownloader.SaveAs;
var
  CD: string;
begin
CD:=GetCurrentDir;
try
if ((IFD <> nil) AND SaveDialog.Execute()) 
 then begin
  if IFD.ThreadException <> nil then Raise Exception.Create(IFD.ThreadException.Message); //. =>
  IFD.Stream.SaveToFile(SaveDialog.FileName);
  end;
finally
ChDir(CD);
end;
end;

procedure TfmINetFileDownloader.tbPriorityChange(Sender: TObject);
begin
if IFD <> nil then IFD.PacketDelay:=(tbPriority.Position)*50;
end;

procedure TfmINetFileDownloader.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmINetFileDownloader.sbStartStopClick(Sender: TObject);
begin
if IFD = nil then Exit; //. ->
IFD.flEnabled:=NOT IFD.flEnabled;
if IFD.flEnabled
 then sbStartStop.Caption:='Stop'
 else sbStartStop.Caption:='Start';
end;

procedure TfmINetFileDownloader.sbSaveAsClick(Sender: TObject);
begin
SaveAs;
end;

procedure TfmINetFileDownloader.sbOpenClick(Sender: TObject);
begin
Open;
end;

procedure TfmINetFileDownloader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if flFreeOnClose then Action:=caFree;
end;









{TInetFileDownloading}
Constructor TInetFileDownloading.Create(const pURL: ANSIString; const pDoOnPortionRead: TDoOnPortionRead; const pDoOnException: TDoOnException);
const
  WaitInterval = 100;
begin
flEnabled:=true;
URL:=pURL;
DoOnPortionRead:=pDoOnPortionRead;
DoOnException:=pDoOnException;
Stream:=nil;
ThreadException:=Exception.Create('downloading is not finished'); 
PacketDelay:=0;
flEnabled:=true;
Inherited Create(True);
Resume;
end;

Destructor TInetFileDownloading.Destroy;
begin
Inherited;
ThreadException.Free;
Stream.Free;
end;

procedure TInetFileDownloading.Execute;
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
begin
try
Stream:=nil;
try
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
 else if (Terminated) then Raise Exception.Create('downloading terminated'); //. =>
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

procedure TInetFileDownloading.ProcessDoOnPortionRead;
begin
if (Assigned(DoOnPortionRead)) then DoOnPortionRead(RealFileSize,FileSize);
end;

procedure TInetFileDownloading.ProcessDoOnException;
begin
if (Assigned(DoOnException)) then DoOnException(ThreadException);
end;



end.
