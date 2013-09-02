unit unitComponentStreamLoadingProgressPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TfmComponentStreamLoadingProgressPanel = class;

  TComponentStreamLoadingProgress = class(TThread)
  private
    ProgressPanel: TfmComponentStreamLoadingProgressPanel;
    ProgressSize: integer;
    ProgressPosition: integer;
    ThreadException: Exception;

    Constructor Create(pProgressPanel: TfmComponentStreamLoadingProgressPanel);
    procedure Execute(); override;
    procedure DoOnReadProgress(const Size: Int64; const ReadSize: Int64);
    procedure DoOnProgress();
    procedure DoOnSuccess();
    procedure DoOnException();
  end;

  TfmComponentStreamLoadingProgressPanel = class(TForm)
    ProgressBar: TProgressBar;
    Panel1: TPanel;
    stProgressInfo: TStaticText;
  private
    { Private declarations }
    ServerAddress: string;
    ServerPort: integer;
    UserName: WideString;
    UserPassword: WideString;
    idTComponent: integer;
    idComponent: Int64;
    //.
    StreamLoading: TComponentStreamLoadingProgress;
    //.
    flSuccess: boolean;

    procedure DoOnProgress(const Size: integer; const Position: integer);
  public
    DataID: string;
    FileName: string;
    
    { Public declarations }
    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidTComponent: integer; const pidComponent: Int64; const pDataID: string; const pFileName: string);
    Destructor Destroy(); override;
    procedure Start();
    procedure Stop();
    function Process(): boolean;
  end;


implementation
uses
  Sockets,
  unitSpaceDataServerClient;

{$R *.dfm}


{TComponentStreamLoadingProgress}
Constructor TComponentStreamLoadingProgress.Create(pProgressPanel: TfmComponentStreamLoadingProgressPanel);
begin
ProgressPanel:=pProgressPanel;
Inherited Create(false);
end;

procedure TComponentStreamLoadingProgress.Execute();
var
  SpaceDataServerClient: TSpaceDataServerClient;
  Reading: TTcpClient;
  ItemsCount: integer;
  FileStream: TFileStream;
begin
try
SpaceDataServerClient:=TSpaceDataServerClient.Create(ProgressPanel.ServerAddress,ProgressPanel.ServerPort,ProgressPanel.UserName,ProgressPanel.UserPassword);
try
Reading:=SpaceDataServerClient.ComponentStreamServer_GetComponentStream_Begin(ProgressPanel.idTComponent,ProgressPanel.idComponent,{out} ItemsCount);
try
if (ItemsCount <> 1) then Raise Exception.Create('wrong ItemsCount'); //. =>
//.
if (FileExists(ProgressPanel.FileName))
 then begin
  FileStream:=TFileStream.Create(ProgressPanel.FileName,fmOpenWrite);
  FileStream.Position:=FileStream.Size;
  end
 else FileStream:=TFileStream.Create(ProgressPanel.FileName,fmCreate);
try
SpaceDataServerClient.ComponentStreamServer_GetComponentStream_Read(Reading,ProgressPanel.DataID,FileStream,DoOnReadProgress);
finally
FileStream.Destroy();
end;
finally
SpaceDataServerClient.ComponentStreamServer_GetComponentStream_End(Reading);
end;
finally
SpaceDataServerClient.Destroy();
end;
Synchronize(DoOnSuccess);
except
  on AE: EAbort do ;
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TComponentStreamLoadingProgress.DoOnReadProgress(const Size: Int64; const ReadSize: Int64);
begin
if (Terminated) then Raise EAbort.Create(''); //. =>
ProgressSize:=Size;
ProgressPosition:=ReadSize;
Synchronize(DoOnProgress);
end;

procedure TComponentStreamLoadingProgress.DoOnProgress();
begin
ProgressPanel.DoOnProgress(ProgressSize,ProgressPosition);
end;

procedure TComponentStreamLoadingProgress.DoOnSuccess();
begin
ProgressPanel.flSuccess:=true;
ProgressPanel.Close();
end;

procedure TComponentStreamLoadingProgress.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar(ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
//.
ProgressPanel.Close();
end;


{TfmComponentStreamLoadingProgressPanel}  
Constructor TfmComponentStreamLoadingProgressPanel.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidTComponent: integer; const pidComponent: Int64; const pDataID: string; const pFileName: string);
begin
Inherited Create(nil);
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
UserName:=pUserName;
UserPassword:=pUserPassword;
idTComponent:=pidTComponent;
idComponent:=pidComponent;
DataID:=pDataID;
FileName:=pFileName;
end;

Destructor TfmComponentStreamLoadingProgressPanel.Destroy();
begin
Stop();
//.
Inherited;
end;

procedure TfmComponentStreamLoadingProgressPanel.Start();
begin
stProgressInfo.Caption:='initializing ... ';
ProgressBar.Position:=0;
flSuccess:=false;
StreamLoading:=TComponentStreamLoadingProgress.Create(Self);
end;

procedure TfmComponentStreamLoadingProgressPanel.Stop();
begin
FreeAndNil(StreamLoading);
end;

function TfmComponentStreamLoadingProgressPanel.Process(): boolean;
begin
Start();
//.
ShowModal();
//.
Result:=flSuccess;
end;

procedure TfmComponentStreamLoadingProgressPanel.DoOnProgress(const Size: integer; const Position: integer);
const
  Kb = 1024;
  Mb = 1024*Kb;
var
  SS,PS: string;
begin
if (Size >= Mb)
 then SS:=IntToStr(Size DIV Mb)+' Mb'
 else
  if (Size >= Kb)
   then SS:=IntToStr(Size DIV Kb)+' Kb'
   else SS:=IntToStr(Size)+' bt';
if (Position >= Mb)
 then PS:=IntToStr(Position DIV Mb)+' Mb'
 else
  if (Position >= Kb)
   then PS:=IntToStr(Position DIV Kb)+' Kb'
   else PS:=IntToStr(Position)+' bt';
//.
stProgressInfo.Caption:=PS+' / '+SS+'  ';
ProgressBar.Position:=Trunc((100.0*Position)/Size);
end;


end.
