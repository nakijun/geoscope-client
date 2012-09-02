unit unitSpaceContextLoader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, unitProxySpace;

type
  TfmSpaceContextLoader = class(TForm)
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
    
    procedure LoadContextFromFolder(const Folder: string);
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
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

Constructor TfmSpaceContextLoader.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
end;

procedure TfmSpaceContextLoader.btnSelectContextPathClick(Sender: TObject);
var
  Path: string;
begin
if (SelectDirectory('Select a folder where context is stored','',Path))
 then edDiskContextPath.Text:=Path;
end;

procedure TfmSpaceContextLoader.LoadContextFromFolder(const Folder: string);

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
  with Space do DistFolder:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+SUMMARYUserContextFolder;
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

  procedure Validate;

    procedure DetailedPictureVisualization_Validate(const ContextFolder: string);

      procedure ProcessObject(const idObj: integer);

        function ProcessSegment(const idObj: integer; const ptrLevel: pointer; const Level: integer; var SegmentsCount: integer; const SX,SY: integer; out SegmentBMP: TBitmap): boolean;

          function DrawCanvasScaledUsingGDIPlus(const DistCanvas: TCanvas; const DistX,DistY,DistWidth,DistHeight: Single; const BMP: TBitmap; const SrcX,SrcY,SrcWidth,SrcHeight: Single): GDIPAPI.TStatus;
          var
            Rect: TGPRectF;
            GDIPlusGraphics: TGPGraphics;
            GDIPlusBitmap: TGPBitmap;
          begin
          with Rect do begin
          X:=DistX;
          Y:=DistY;
          Width:=DistWidth;
          Height:=DistHeight;
          end;
          GDIPlusGraphics:=TGPGraphics.Create(DistCanvas.Handle);
          try
          GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
          try
          Result:=GDIPlusGraphics.DrawImage(GDIPlusBitmap, Rect, SrcX,SrcY,SrcWidth,SrcHeight, UnitPixel);
          finally
          GDIPlusBitmap.Destroy;
          end;
          finally
          GDIPlusGraphics.Destroy;
          end;
          end;

        var
          X,Y: integer;
          LevelFolder,SegmentFileName: string;
          JPEG: TJpegImage;
          S00,S10,S11,S01: TBitmap;
          BMP: TBitmap;
        begin
        Result:=false;
        try
        SegmentBMP:=nil;
        try
        if (ptrLevel = nil) then Exit; //. ->
        with Space do LevelFolder:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+SUMMARYUserContextFolder+'\'+ChangeFileExt(ContextFileName,'')+'\'+'TypesSystem'+'\'+'DetailedPictureVisualization'+'\'+IntToStr(idObj)+'\'+'L'+IntToStr(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).Params.ID);
        SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(SX)+'Y'+IntToStr(SY)+'.jpg';
        //.
        if (FileExists(SegmentFileName))
         then begin
          JPEG:=TJpegImage.Create;
          try
          JPEG.LoadFromFile(SegmentFileName);
          //.
          SegmentBMP:=TBitmap.Create;
          SegmentBMP.Assign(JPEG);
          finally
          JPEG.Destroy;
          end;
          Result:=true;
          Exit; //. ->
          end;
        //. try generating the segment
        S00:=nil;
        S10:=nil;
        S11:=nil;
        S01:=nil;
        try
        X:=(SX SHL 1);
        Y:=(SY SHL 1);
        if (
              ProcessSegment(idObj, TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext, Level+1, SegmentsCount,  X  ,Y  ,  S00) AND
              ProcessSegment(idObj, TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext, Level+1, SegmentsCount,  X+1,Y  ,  S10) AND
              ProcessSegment(idObj, TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext, Level+1, SegmentsCount,  X+1,Y+1,  S11) AND
              ProcessSegment(idObj, TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext, Level+1, SegmentsCount,  X  ,Y+1,  S01)
           )
         then begin
          BMP:=TBitmap.Create;
          try
          with TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^) do begin
          BMP.Width:=Round(Params.SegmentWidth*2);
          BMP.Height:=Round(Params.SegmentHeight*2);
          end;
          //. (0;0);
          BMP.Canvas.Draw(0,0,S00);
          //. (1;0)
          BMP.Canvas.Draw(S00.Width,0,S10);
          //. (1;1)
          BMP.Canvas.Draw(S00.Width,S00.Height,S11);
          //. (0;1)
          BMP.Canvas.Draw(0,S00.Height,S01);
          //. save result
          SegmentBMP:=TBitmap.Create;
          with TLevelItemOfTDetailedPictureVisualizationCash(TLevelItemOfTDetailedPictureVisualizationCash(ptrLevel^).ptrNext^) do begin
          SegmentBMP.Width:=Round(Params.SegmentWidth);
          SegmentBMP.Height:=Round(Params.SegmentHeight);
          end;
          DrawCanvasScaledUsingGDIPlus(SegmentBMP.Canvas, 0,0,SegmentBMP.Width,SegmentBMP.Height, BMP, 0,0,BMP.Width,BMP.Height);
          //. save segment
          JPEG:=TJpegImage.Create;
          try
          JPEG.Assign(SegmentBMP);
          ForceDirectories(LevelFolder);
          JPEG.SaveToFile(SegmentFileName);
          finally
          JPEG.Destroy;
          end;
          finally
          BMP.Destroy;
          end;
          Result:=true;
          Exit; //. ->
          end;
        finally
        S00.Free;
        S10.Free;
        S11.Free;
        S01.Free;
        end;
        except
          FreeAndNil(SegmentBMP);
          Raise; //. =>
          end;
        finally
        if (Level = 3)
         then begin
          Inc(SegmentsCount);
          lbReport.Items[lbReport.Items.Count-1]:='Completed: '+IntToStr(Round(100*(SegmentsCount/64)))+' %';
          Self.Update();
          end;
        end;
        end;

      var
        BA: TByteArray;
        Levels: pointer;
        SegmentsCount: integer;
        BMP: TBitmap;
      begin
      lbReport.Items.Add('process object #'+IntToStr(idObj));
      lbReport.ItemIndex:=lbReport.Items.Count-1;
      Self.Update();
      //.
      with TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idObj)) do
      try
      GetLevelsInfo(BA);
      finally
      Release;
      end;
      Levels:=nil;
      try
      TDetailedPictureVisualizationCashItem_PrepareLevelsFromByteArray(nil,Levels,BA);
      //.
      lbReport.Items.Add('Completed: 0 %');
      lbReport.ItemIndex:=lbReport.Items.Count-1;
      Self.Update();
      //.
      SegmentsCount:=0;
      ProcessSegment(idObj, Levels, 0,SegmentsCount,  0,0, BMP);
      BMP.Free;
      //.
      lbReport.Items[lbReport.Items.Count-1]:='Done.';
      finally
      TDetailedPictureVisualizationCashItem_FreeAndNilLevels(SystemTDetailedPictureVisualization, Levels);
      end;
      end;

    var
      StartupInput: TGDIPlusStartupInput;
      sr: TSearchRec;
      DPF: string;
      idDetailedPictureVisualization: integer;
    begin
    lbReport.Items.Add('detailed-picture-visualizations validation');
    lbReport.ItemIndex:=lbReport.Items.Count-1;
    Self.Update();
    //. Initialize GDI+
    StartupInput.DebugEventCallback := nil;
    StartupInput.SuppressBackgroundThread:=False;
    StartupInput.SuppressExternalCodecs:=False;
    StartupInput.GdiplusVersion:=1;
    GdiplusStartup(gdiplusToken, @StartupInput, nil);
    try
    DPF:=ContextFolder+'\'+'Context'+'\'+'TypesSystem'+'\'+'DetailedPictureVisualization';
    if (FindFirst(DPF+'\*.*', faDirectory, sr) = 0)
     then
      try
      repeat
        if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory))
         then begin
          //. get object id
          try
          idDetailedPictureVisualization:=StrToInt(sr.Name);
          except
            idDetailedPictureVisualization:=0;
            end;
          //. validating the object
          if (idDetailedPictureVisualization <> 0) then ProcessObject(idDetailedPictureVisualization);
          end;
      until (FindNext(sr) <> 0);
      finally
      FindClose(sr);
      end;
    finally
    GdiplusShutdown(gdiplusToken);
    end;
    end;

  var
    ContextFolder: string;
  begin
  with Space do ContextFolder:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+SUMMARYUserContextFolder;
  //.
  DetailedPictureVisualization_Validate(ContextFolder);
  end;

begin
lbReport.Items.Clear;
//.
CopyFiles;
Validate;
end;

procedure TfmSpaceContextLoader.btnStartLoadingClick(Sender: TObject);
begin
LoadContextFromFolder(edDiskContextPath.Text);
end;


end.
