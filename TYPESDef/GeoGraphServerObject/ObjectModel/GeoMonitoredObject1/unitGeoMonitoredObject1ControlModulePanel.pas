unit unitGeoMonitoredObject1ControlModulePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model, ComCtrls, Menus, StdCtrls, Buttons;

type
  TGeoMonitoredObject1ControlModulePanel = class(TForm)
    btnGetDeviceLog: TBitBtn;
    btnGetDeviceState: TBitBtn;
    btnRestartDeviceProcess: TBitBtn;
    btnRestartDevice: TBitBtn;
    btnLANConnectionRepeater: TBitBtn;
    btnLANUDPConnectionRepeater: TBitBtn;
    procedure btnGetDeviceLogClick(Sender: TObject);
    procedure btnGetDeviceStateClick(Sender: TObject);
    procedure btnRestartDeviceClick(Sender: TObject);
    procedure btnRestartDeviceProcessClick(Sender: TObject);
    procedure btnLANConnectionRepeaterClick(Sender: TObject);
    procedure btnLANUDPConnectionRepeaterClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;

    procedure SaveDeviceLogToFile(const OutputDirectory: string);
  public
    LANConnectionRepeaterPanels: TList;
    LANUDPConnectionRepeaterPanels: TList;

    { Public declarations }
    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override; 
    procedure Update; reintroduce;
  end;


implementation
uses
  StrUtils,
  FileCtrl,
  AbUtils,
  AbArcTyp,
  AbZipTyp,
  AbZipPrc,
  AbUnzPrc,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGeoMonitoredObject1LANConnectionRepeaterPanel,
  unitGeoMonitoredObject1LANUDPConnectionRepeaterPanel;

{$R *.dfm}


{TZipStream}
type
  TZipStream = class(TAbZipArchive)
  private
    procedure ZipHelper(Sender : TObject; Item : TAbArchiveItem; OutStream : TStream);
    procedure ZipHelperStream(Sender : TObject; Item : TAbArchiveItem; OutStream, InStream : TStream);
    procedure DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
    procedure DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);

    Constructor CreateFromStream( aStream : TStream; const ArchiveName : string ); override;
    Constructor CreateFromStreamForZipping( aStream : TStream; const ArchiveName : string );
    Constructor CreateFromStreamForUnzipping( aStream : TStream; const ArchiveName : string );
  end;

Constructor TZipStream.CreateFromStream(aStream: TStream; const ArchiveName: string);
begin
inherited CreateFromStream(aStream,ArchiveName);
OnProcessItemFailure:=DoOnAbArchiveItemFailureEvent;
end;

Constructor TZipStream.CreateFromStreamForZipping(aStream: TStream; const ArchiveName: string);
begin
CreateFromStream(aStream,ArchiveName);
DeflationOption:=doMaximum;
CompressionMethodToUse:=smDeflated;
InsertHelper:=ZipHelper;
InsertFromStreamHelper:=ZipHelperStream;
end;

Constructor TZipStream.CreateFromStreamForUnzipping(aStream: TStream; const ArchiveName: string);
begin
CreateFromStream(aStream,ArchiveName);
ExtractHelper:=DoExtractHelper;
end;

procedure TZipStream.ZipHelper(Sender: TObject; Item: TAbArchiveItem; OutStream: TStream);
begin
AbZip(TAbZipArchive(Sender), TAbZipItem(Item), OutStream);
end;

procedure TZipStream.ZipHelperStream(Sender: TObject; Item: TAbArchiveItem; OutStream, InStream: TStream);
begin
if (Assigned(InStream)) then AbZipFromStream(TAbZipArchive(Sender), TAbZipItem(Item), OutStream, InStream);
end;

procedure TZipStream.DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
begin
AbUnzip(Sender,TAbZipItem(Item),NewName);
end;

procedure TZipStream.DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
begin
Raise Exception.Create('error of processing file: '+Item.FileName); //. =>
end;


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TGeoMonitoredObject1ControlModulePanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
//.
LANConnectionRepeaterPanels:=TList.Create();
LANUDPConnectionRepeaterPanels:=TList.Create();
//.
Update();
end;

Destructor TGeoMonitoredObject1ControlModulePanel.Destroy();
var
  I: integer;
begin
if (LANUDPConnectionRepeaterPanels <> nil)
 then begin
  for I:=0 to LANUDPConnectionRepeaterPanels.Count-1 do TObject(LANUDPConnectionRepeaterPanels[I]).Destroy();
  LANUDPConnectionRepeaterPanels.Destroy();
  end;
if (LANConnectionRepeaterPanels <> nil)
 then begin
  for I:=0 to LANConnectionRepeaterPanels.Count-1 do TObject(LANConnectionRepeaterPanels[I]).Destroy();
  LANConnectionRepeaterPanels.Destroy();
  end;
Inherited;
end;

procedure TGeoMonitoredObject1ControlModulePanel.Update();
begin
end;

procedure TGeoMonitoredObject1ControlModulePanel.SaveDeviceLogToFile(const OutputDirectory: string);
var
  SC: TCursor;
  FileData: TByteArray;
  MS: TMemoryStream;
  I: integer;
  FN: string;
  FA: integer;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
FileData:=Model.ControlModule_GetDeviceLogData();
//.
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@FileData[0])^,Length(FileData));
MS.Position:=0;
with TZipStream.CreateFromStreamForUnzipping(MS,'') do
try
ExtractOptions:=ExtractOptions+[eoRestorePath];
BaseDirectory:=OutputDirectory;
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
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnGetDeviceStateClick(Sender: TObject);
var
  Info: string;
begin
Info:=Model.ControlModule_GetDeviceStateInfo();
ShowMessage(Info);
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnGetDeviceLogClick(Sender: TObject);
var
  LD: string;
  OutputDirectory: String;
begin
LD:=GetCurrentDir();
try
if (SelectDirectory('Select saving directory ->','',OutputDirectory))
 then SaveDeviceLogToFile(OutputDirectory);
finally
SetCurrentDir(LD);
end;
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnRestartDeviceClick(Sender: TObject);
begin
if (MessageDlg('Do you want to restart device ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
Model.ControlModule_RestartDevice();
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnRestartDeviceProcessClick(Sender: TObject);
begin
if (MessageDlg('Do you want to restart device process ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
Model.ControlModule_RestartDeviceProcess();
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnLANConnectionRepeaterClick(Sender: TObject);
var
  LANConnectionRepeaterPanel: TfmGeoMonitoredObject1LANConnectionRepeaterPanel;
begin
LANConnectionRepeaterPanel:=TfmGeoMonitoredObject1LANConnectionRepeaterPanel.Create(Model);
LANConnectionRepeaterPanels.Add(LANConnectionRepeaterPanel);
LANConnectionRepeaterPanel.Show();
end;

procedure TGeoMonitoredObject1ControlModulePanel.btnLANUDPConnectionRepeaterClick(Sender: TObject);
var
  LANUDPConnectionRepeaterPanel: TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel;
begin
LANUDPConnectionRepeaterPanel:=TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.Create(Model);
LANUDPConnectionRepeaterPanels.Add(LANUDPConnectionRepeaterPanel);
LANUDPConnectionRepeaterPanel.Show();
end;


end.
