unit unitGeoMonitoredObject1FileSystemExplorerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model, ComCtrls, Menus;

type
  TGeoMonitoredObject1FileSystemExplorerPanel = class(TForm)
    lvDirList: TListView;
    lvMeasurements_PopupMenu: TPopupMenu;
    Deleteselected1: TMenuItem;
    N2: TMenuItem;
    Updatelist1: TMenuItem;
    N3: TMenuItem;
    Open1: TMenuItem;
    OpenFileDialog: TOpenDialog;
    N1: TMenuItem;
    Savefile1: TMenuItem;
    StartFTPtransfer1: TMenuItem;
    procedure Deleteselected1Click(Sender: TObject);
    procedure lvDirListDblClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Updatelist1Click(Sender: TObject);
    procedure Savefile1Click(Sender: TObject);
    procedure StartFTPtransfer1Click(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;

    procedure LoadFile(const FileName: string; const OutputDirectory: string);
    procedure SaveFile(const InputFileName: string; const FileName: string);
  public
    { Public declarations }
    CurrentDirectory: string;

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
  unitGeoMonitoredObject1FileSystemFTPTransferPanel;

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
Constructor TGeoMonitoredObject1FileSystemExplorerPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
//.
CurrentDirectory:='/mnt/sdcard';
//.
lvDirList.Columns[0].Width:=0;
lvDirList.Columns[2].Width:=0;
Update();
end;

Destructor TGeoMonitoredObject1FileSystemExplorerPanel.Destroy();
begin
Inherited;
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.Update();

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
  DirContent: TStringList;
  I: integer;
  ItemParams: TStringList;
  FileID: string;
  IsDirectory: boolean;
  FileSize: dword;
  NewItem: TListItem;
begin
Caption:=CurrentDirectory;
with lvDirList do begin
Items.BeginUpdate();
try
Items.Clear();
if (CurrentDirectory <> '')
 then with Items.Add do begin //. add up directory row
  Caption:='..';
  SubItems.Add('[..]');
  SubItems.Add('0');
  SubItems.Add('');
  end;
L:=Model.FileSystem_GetDirList(CurrentDirectory);
if (L = '') then Exit; //. ->
if (SplitStrings(L,';',{out} DirContent))
 then
  try
  for I:=0 to DirContent.Count-1 do begin
    SplitStrings(DirContent[I],',',{out} ItemParams);
    try
    FileID:=ItemParams[0];
    IsDirectory:=(ItemParams[1] = '0');
    if (IsDirectory)
     then begin
      if (CurrentDirectory <> '')
       then NewItem:=Items.Insert(1)
       else NewItem:=Items.Insert(0);
      end
     else NewItem:=Items.Add();
    with NewItem do
    if (IsDirectory)
     then begin
      Caption:=FileID;
      SubItems.Add('['+ANSIUpperCase(FileID)+']');
      SubItems.Add(ItemParams[1]);
      SubItems.Add('dir');
      end
     else begin
      FileSize:=StrToInt(ItemParams[2]);
      //.
      Caption:=FileID;
      SubItems.Add(FileID);
      SubItems.Add(ItemParams[1]);
      SubItems.Add(IntToStr(FileSize));
      end;
    finally
    ItemParams.Free();
    end;
    end;
  finally
  DirContent.Destroy();
  end;
finally
Items.EndUpdate();
end;
end;
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.LoadFile(const FileName: string; const OutputDirectory: string);
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
FileData:=Model.FileSystem_GetFileData(FileName);
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

procedure TGeoMonitoredObject1FileSystemExplorerPanel.SaveFile(const InputFileName: string; const FileName: string);
var
  FileData: TByteArray;
  MS: TMemoryStream;
  ZS: TZipStream;
  FN: string;
  FileItem: TAbArchiveItem;
begin
MS:=TMemoryStream.Create();
try
ZS:=TZipStream.CreateFromStreamForZipping(MS,'');
try
FN:=ExtractFileName(InputFileName);
FileItem:=ZS.CreateItem(FN);
FileItem.DiskFileName:=InputFileName;
ZS.Add(FileItem);
//.
ZS.SaveArchive();
ByteArray_PrepareFromStream({ref} FileData,MS);
finally
ZS.Destroy();
end;
finally
MS.Destroy();
end;
Model.FileSystem_SetFileData(FileName,FileData);
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.Deleteselected1Click(Sender: TObject);
var
  SC: TCursor;
  IDs: string;
  I: integer;
begin
IDs:='';
for I:=0 to lvDirList.Items.Count-1 do
  if (lvDirList.Items[I].Selected)
   then IDs:=IDs+CurrentDirectory+'/'+lvDirList.Items[I].Caption+',';
if (IDs = '') then Exit; //. ->
SetLength(IDs,Length(IDs)-1);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Model.FileSystem_DeleteFile(IDs);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.lvDirListDblClick(Sender: TObject);

  function GetDirDir(const Dir: string): string;
  var
    I: integer;
    p: integer;
  begin
  p:=0;
  for I:=Length(Dir) downto 1 do
    if (Dir[I] = '/')
     then begin
      p:=I;
      Break; //. >
      end;
  Result:=Dir;
  if (p = 0) then Exit; //. ->
  SetLength(Result,p-1);
  end;

var
  SC: TCursor;
  FileID: string;
  IsDirectory: boolean;
  LastCurrentDirectory: string;
  LD,OutputDirectory: string;
begin
if (lvDirList.Selected = nil) then Exit; //. ->
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
FileID:=lvDirList.Selected.Caption;
IsDirectory:=(lvDirList.Selected.SubItems[1] = '0');
if (IsDirectory)
 then begin
  LastCurrentDirectory:=CurrentDirectory;
  if (FileID <> '..')
   then CurrentDirectory:=CurrentDirectory+'/'+FileID
   else CurrentDirectory:=GetDirDir(CurrentDirectory);
  try
  Update();
  except
    CurrentDirectory:=LastCurrentDirectory;
    Update();
    //.
    Raise; //. =>
    end;
  end;
finally
Screen.Cursor:=SC;
end;
if (NOT IsDirectory)
 then begin
  LD:=GetCurrentDir();
  try
  if (SelectDirectory('Select saving directory ->','',OutputDirectory))
   then LoadFile(CurrentDirectory+'/'+FileID,OutputDirectory);
  finally
  SetCurrentDir(LD);
  end;
  end;
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.Open1Click(Sender: TObject);
begin
lvDirListDblClick(nil);
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.Savefile1Click(Sender: TObject);
var
  SC: TCursor;
begin
if (NOT OpenFileDialog.Execute()) then Exit; //. ->
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
SaveFile(OpenFileDialog.FileName,CurrentDirectory+'/'+ExtractFileName(OpenFileDialog.FileName));
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1FileSystemExplorerPanel.Updatelist1Click(Sender: TObject);
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

procedure TGeoMonitoredObject1FileSystemExplorerPanel.StartFTPtransfer1Click(Sender: TObject);
var
  FileID: string;
begin
if (lvDirList.Selected = nil) then Exit; //. ->
//.
FileID:=lvDirList.Selected.Caption;
with TTGeoMonitoredObject1FileSystemFTPTransferPanel.Create(Model,CurrentDirectory+'/'+FileID) do
try
ShowModal();
finally
Destroy();
end;
end;


end.
