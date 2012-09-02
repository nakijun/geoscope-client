unit unitDetailedPictureLocalContextLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, unitProxySpace;

type
  TfmDetailedPictureLocalContextLoader = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    lbReport: TListBox;
    Label2: TLabel;
    edDiskContextPath: TEdit;
    btnSelectContextPath: TButton;
    btnStartLoading: TButton;
    procedure btnSelectContextPathClick(Sender: TObject);
    procedure btnStartLoadingClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    idDetailedPictureVisualization: integer;

    procedure LoadContextFromFolder(Folder: string);
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace; const pidDetailedPictureVisualization: integer);
  end;

implementation
uses
  FileCtrl,
  ComObj,
  Jpeg,
  GDIPOBJ, GDIPAPI, //. GDI+ support
  GlobalSpaceDefines,
  Functionality,
  TypesDefines,
  TypesFunctionality;

{$R *.dfm}

Constructor TfmDetailedPictureLocalContextLoader.Create(const pSpace: TProxySpace; const pidDetailedPictureVisualization: integer);
begin
Inherited Create(nil);
Space:=pSpace;
idDetailedPictureVisualization:=pidDetailedPictureVisualization
end;

procedure TfmDetailedPictureLocalContextLoader.btnSelectContextPathClick(Sender: TObject);
var
  Path: string;
begin
if (SelectDirectory('Select TypesSystem file storage folder','',Path))
 then edDiskContextPath.Text:=Path;
end;

procedure TfmDetailedPictureLocalContextLoader.LoadContextFromFolder(Folder: string);

  procedure CopyFiles;

    procedure ProcessFolder(const Folder: string; const DistinationPath: string; const BytesSummary: Int64; var BytesCopied: Int64; var LastTimeUpdated: TDateTime);

      procedure DeleteFilesInFolder(const Folder: string);
      var
        sr: TSearchRec;
        FN: string;
      begin
      if (FindFirst(Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
       then
        try
        repeat
          if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
           then begin
            FN:=Folder+'\'+sr.name;
            SysUtils.DeleteFile(FN);
            end;
        until (FindNext(sr) <> 0);
        finally
        SysUtils.FindClose(sr);
        end;
      end;

    var
      sr: TSearchRec;
    begin
    if (NOT DirectoryExists(DistinationPath)) then ForceDirectories(DistinationPath);
    //.
    DeleteFilesInFolder(DistinationPath);
    //.
    if (FindFirst(Folder+'\*.*', (faAnyFile-faDirectory), sr) = 0)
     then
      try
      repeat
        if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
         then begin
          //. copy file
          with TMemoryStream.Create do
          try
          LoadFromFile(Folder+'\'+sr.Name);
          SaveToFile(DistinationPath+'\'+sr.Name);
          Inc(BytesCopied,Size);
          finally
          Destroy;
          end;
          //. update progress
          if (((Now-LastTimeUpdated)*24*3600) > 3{seconds})
           then begin
            LastTimeUpdated:=Now;
            lbReport.Items[lbReport.Items.Count-1]:='Loaded: '+IntToStr(Round(100*(BytesCopied/BytesSummary)))+' %';
            Self.Update();
            end;
          end;
      until (FindNext(sr) <> 0);
      finally
      FindClose(sr);
      end;
    //. process subfolders
    if (FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
     then
      try
      repeat
        if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then ProcessFolder(Folder+'\'+sr.name,DistinationPath+'\'+sr.name,BytesSummary,BytesCopied,LastTimeUpdated);
      until (FindNext(sr) <> 0);
      finally
      FindClose(sr);
      end;
    end;

  var
    BytesSummary,BytesCopied: Int64;
    FSO,F: OleVariant;
    DistFolder: string;
    LastTimeUpdated: TDateTime;
  begin
  Folder:=Folder+'\'+'DetailedPictureVisualizations'+'\'+IntToStr(idDetailedPictureVisualization);
  DistFolder:=TTDetailedPictureVisualizationCash(SystemTDetailedPictureVisualization.Cash).Item_GetContextFolder(idDetailedPictureVisualization);
  //.
  BytesCopied:=0;
  //.
  FSO:=CreateOleObject('Scripting.FileSystemObject');
  F:=FSO.GetFolder(Folder);
  BytesSummary:=F.Size;
  //.
  lbReport.Items.Add('Context size - '+IntToStr(BytesSummary)+' bytes');
  lbReport.ItemIndex:=lbReport.Items.Count-1;
  Self.Update();
  //.
  lbReport.Items.Add('Loaded: 0 %');
  lbReport.ItemIndex:=lbReport.Items.Count-1;
  Self.Update();
  //.
  ProcessFolder(Folder,DistFolder,BytesSummary,BytesCopied,LastTimeUpdated);
  //.
  lbReport.Items[lbReport.Items.Count-1]:='Context loaded.';
  end;

begin
lbReport.Items.Clear;
//.
CopyFiles;
end;

procedure TfmDetailedPictureLocalContextLoader.btnStartLoadingClick(Sender: TObject);
begin
LoadContextFromFolder(edDiskContextPath.Text);
end;


end.
