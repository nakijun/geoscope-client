unit unitTileServerVisualizationLevels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Menus;

type
  TfmTileServerVisualizationLevels = class(TForm)
    lvLevels: TListView;
    GroupBox1: TGroupBox;
    sbShowSelecetdLevels: TSpeedButton;
    sbHideSelectedLevels: TSpeedButton;
    sbCacheSelectedLevels: TSpeedButton;
    sbGenerateUpperLevelsForSelectedLevel: TSpeedButton;
    sbCacheAndGenerateFromDetailedLevel: TSpeedButton;
    lvLevels_Popup: TPopupMenu;
    Getlevelpixelatreflectorcenter1: TMenuItem;
    Showpixelcoordinatesatreflectorcenter1: TMenuItem;
    procedure sbShowSelecetdLevelsClick(Sender: TObject);
    procedure sbHideSelectedLevelsClick(Sender: TObject);
    procedure sbCacheSelectedLevelsClick(Sender: TObject);
    procedure sbGenerateUpperLevelsForSelectedLevelClick(Sender: TObject);
    procedure sbCacheAndGenerateFromDetailedLevelClick(Sender: TObject);
    procedure Getlevelpixelatreflectorcenter1Click(Sender: TObject);
    procedure Showpixelcoordinatesatreflectorcenter1Click(Sender: TObject);
  private
    { Private declarations }
    idTileServerVisualization: integer;
    procedure VisibleSelectedLevels;
    procedure InvisibleSelectedLevels;
    procedure CacheLevels(const LevelsList: TList);
    procedure GenerateUpperLevels(const idLevel: integer);
    procedure DegenerateEmptySegmentsOfBottomLevel;
  public
    { Public declarations }
    Constructor Create(const pidTileServerVisualization: integer);
    procedure Update;
    procedure lvLevels_Update;
  end;

implementation
Uses
  GlobalSpaceDefines,unitProxySpace,Functionality,TypesDefines,TypesFunctionality,
  unitReflector,
  JPeg,
  GDIPOBJ, GDIPAPI, //. GDI+ support
  unitTextInput,
  unitTileServerLevelsActionProgress;

{$R *.dfm}


Constructor TfmTileServerVisualizationLevels.Create(const pidTileServerVisualization: integer);
begin
Inherited Create(nil);
idTileServerVisualization:=pidTileServerVisualization;
Update;
end;

procedure TfmTileServerVisualizationLevels.Update;
begin
lvLevels_Update;
end;

procedure TfmTileServerVisualizationLevels.lvLevels_Update;

  function LevelCachingFactor(const ptrLevel: pointer): double;
  var
    ptrSegment: pointer;
    SegmentsCount: integer;
  begin
  with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  SegmentsCount:=0;
  ptrSegment:=Segments;
  while (ptrSegment <> nil) do begin Inc(SegmentsCount); ptrSegment:=TSegmentItemOfTTileServerVisualizationCash(ptrSegment^).ptrNext; end;
  Result:=SegmentsCount/((Params.DivX+0.0)*Params.DivY);
  end;
  end;

var
  ptrItem: pointer;
  ptrLevel: pointer;
  I: integer;
begin
with TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization) do
try
TypeSystem.Lock.Enter;
try
with TSystemTTileServerVisualization(TypeSystem) do
with lvLevels.Items do begin
Clear;
BeginUpdate;
try
if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Exit; //. ->
//.
I:=0;
ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  with Add do begin
  Caption:=IntToStr(I);
  DATA:=Pointer(Params.ID);
  if (NOT Disabled)
   then SubItems.Add('VISIBLE')
   else SubItems.Add('invisible');
  SubItems.Add(IntToStr(Params.DivX));
  SubItems.Add(IntToStr(Params.DivY));
  SubItems.Add(FormatFloat('0.000',Params.SegmentWidth));
  SubItems.Add(FormatFloat('0.000',Params.SegmentHeight));
  SubItems.Add(FormatFloat('0.000',LevelCachingFactor(ptrLevel)*100)+' %');
  if (flPersist) then SubItems.Add('+') else SubItems.Add('-'); 
  SubItems.Add(IntToStr(Params.ID));
  end;
  //. next level
  Inc(I);
  ptrLevel:=ptrNext;
  end;
finally
EndUpdate;
end;
end;
finally
TypeSystem.Lock.Leave;
end;
finally
Release;
end;
end;

procedure TfmTileServerVisualizationLevels.VisibleSelectedLevels;
var
  K: integer;
  idLevel: integer;
  ptrItem: pointer;
  ptrLevel: pointer;
begin
Enabled:=false;
try
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
with lvLevels do
for K:=0 to Items.Count-1 do
  if (Items[K].Checked)
   then begin
    idLevel:=Integer(Items[K].Data);
    TypeSystem.Lock.Enter;
    try
    with TSystemTTileServerVisualization(TypeSystem) do begin
    if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Continue; //. >
    //.
    ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
    while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
      if (Params.id = idLevel) then Disabled:=false;
      //. next level
      ptrLevel:=ptrNext;
      end;
    end;
    finally
    TypeSystem.Lock.Leave;
    end;
    end;
finally
Release;
end;
lvLevels_Update;
finally
Enabled:=true;
end;
end;

procedure TfmTileServerVisualizationLevels.InvisibleSelectedLevels;
var
  K: integer;
  idLevel: integer;
  ptrItem: pointer;
  ptrLevel: pointer;
begin
Enabled:=false;
try
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
with lvLevels do
for K:=0 to Items.Count-1 do
  if (Items[K].Checked)
   then begin
    idLevel:=Integer(Items[K].Data);
    TypeSystem.Lock.Enter;
    try
    with TSystemTTileServerVisualization(TypeSystem) do begin
    if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Continue; //. >
    //.
    ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
    while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
      if (Params.id = idLevel) then Disabled:=true;
      //. next level
      ptrLevel:=ptrNext;
      end;
    end;
    finally
    TypeSystem.Lock.Leave;
    end;
    end;
finally
Release;
end;
lvLevels_Update;
finally
Enabled:=true;
end;
end;

procedure TfmTileServerVisualizationLevels.CacheLevels(const LevelsList: TList);
const
  ReadPortion = 5;
var
  K: integer;
  idLevel: integer;
  LogStringIndex: integer;
  ptrItem: pointer;
  ptrLevel: pointer;
  I,J,L: integer;
  PortionX,PortionY: integer;
  XIndexMin,XIndexMax,YIndexMin,YIndexMax: integer;
  flAllSegmentsExists: boolean;
  RSL: TList;
  ItemsTable: pointer;
  ItemsTableSize: integer;
  ExceptSegments: TByteArray;
  BA: TByteArray;
  SegmentsList: TList;
  LevelFolder,SegmentFileName: string;
  PS: string;
begin
Enabled:=false;
try
with TfmTileServerLevelsActionProgress.Create(nil) do
try
Caption:='levels dowloading progress';
Show;
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
with lvLevels do
for K:=0 to LevelsList.Count-1 do begin
  idLevel:=Integer(LevelsList[K]);
  TypeSystem.Lock.Enter;
  try
  with TSystemTTileServerVisualization(TypeSystem) do begin
  if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Continue; //. >
  //.
  ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
  while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
    Lock.BeginRead;
    try
    if (Params.id = idLevel)
     then begin
      memoLog.Lines.Add('level ID - '+IntToStr(idLevel));
      LogStringIndex:=memoLog.Lines.Add('download started');
      //.
      LevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,Params.ID);
      J:=0;
      repeat
        PortionY:=Params.DivY-J;
        if (PortionY <= 0) then Break; //. >
        if (PortionY > ReadPortion) then PortionY:=ReadPortion;
        //.
        I:=0;
        repeat
          PortionX:=Params.DivX-I;
          if (PortionX <= 0) then Break; //. >
          if (PortionX > ReadPortion) then PortionX:=ReadPortion;
          //. loading the level segments portion
          XIndexMin:=I;
          XIndexMax:=I+PortionX-1;
          YIndexMin:=J;
          YIndexMax:=J+PortionY-1;
          flAllSegmentsExists:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetVisibleSegmentsLocal(ptrItem, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, false, false, nil,  ItemsTable,ItemsTableSize, ExceptSegments);
          try
          if (NOT flAllSegmentsExists)
           then begin
            //. save cached items
            if (ItemsTable <> nil)
             then
              for L:=0 to (ItemsTableSize DIV SizeOf(Pointer))-1 do with TSegmentItemOfTTileServerVisualizationCash(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^)^) do begin
                //. remove texture if exists
                if (TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.flEnabled AND (TSystemTTileServerVisualization(TypeSystem).Cash.Segment_idOGLTexture(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^)) <> 0)) then TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.DeleteSegmentTexture(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^));
                //.
                TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^));
                try
                if (Params._DATA <> nil)
                 then begin
                  ForceDirectories(LevelFolder);
                  SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(Params.XIndex)+'Y'+IntToStr(Params.YIndex)+'.jpg';
                  if ((Params._DATA.Size > 0) AND (NOT FileExists(SegmentFileName))) then Params._DATA.SaveToFile(SegmentFileName);
                  //.
                  TSystemTTileServerVisualization(TypeSystem).Cash.Segment_SetDATA(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^),nil);
                  end;
                finally
                TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(Pointer(Pointer(Integer(ItemsTable)+L*SizeOf(Pointer))^));
                end;
                end;
            SegmentsList:=TList.Create;
            try
            SegmentsList.Capacity:=(XIndexMax-XIndexMin+1)*(YIndexMax-YIndexMin+1);
            //. try to restore segments from saved context
            flAllSegmentsExists:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__RestoreSegmentsLocal(ptrItem, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, ptrLevel, XIndexMin,XIndexMax,YIndexMin,YIndexMax, nil,  RSL,ExceptSegments);
            if (RSL <> nil)
             then
              try
              for I:=0 to RSL.Count-1 do SegmentsList.Add(RSL[I]);
              finally
              RSL.Destroy;
              end;
            //. get segments from server
            if (NOT flAllSegmentsExists)
             then begin
              Level_GetSegments(TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,Params.id, XIndexMin,XIndexMax,YIndexMin,YIndexMax, ExceptSegments, BA);
              TTileServerVisualizationCashItemLevel_PrepareSegmentsFromByteArray(TSystemTTileServerVisualization(TypeSystem), idObj, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, ptrLevel,BA, SegmentsList);
              end;
            for L:=0 to SegmentsList.Count-1 do with TSegmentItemOfTTileServerVisualizationCash(SegmentsList[L]^) do begin
              //. remove texture if exists
              if (TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.flEnabled AND (TSystemTTileServerVisualization(TypeSystem).Cash.Segment_idOGLTexture(SegmentsList[L]) <> 0)) then TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.DeleteSegmentTexture(SegmentsList[L]);
              //.
              TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(SegmentsList[L]);
              try
              if (Params._DATA <> nil)
               then begin
                ForceDirectories(LevelFolder);
                //. swap loaded segments data to context file
                SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(Params.XIndex)+'Y'+IntToStr(Params.YIndex)+'.jpg';
                if ((Params._DATA.Size > 0) AND (NOT FileExists(SegmentFileName))) then Params._DATA.SaveToFile(SegmentFileName);
                //.
                TSystemTTileServerVisualization(TypeSystem).Cash.Segment_SetDATA(SegmentsList[L],nil);
                end;
              finally
              TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(SegmentsList[L]);
              end;
              end;
            finally
            SegmentsList.Destroy;
            end;
            end;
          finally
          if (ItemsTable <> nil) then FreeMem(ItemsTable,ItemsTableSize);
          end;
          //.
          PS:='downloaded: '+IntToStr(Round(100*(J*Params.DivX+I)/(Params.DivX*Params.DivY)))+'%';
          if (PS <> memoLog.Lines[LogStringIndex])
           then begin
            memoLog.Lines[LogStringIndex]:=PS;
            _ProcessMessages;
            if (flCancel) then Raise Exception.Create('process terminated by user'); //. =>
            end;
          //.
          I:=I+PortionX;
        until false;
        //.
        J:=J+PortionY;
      until false;
      //.
      memoLog.Lines[LogStringIndex]:='level download complete.';
      end;
    finally
    Lock.EndRead;
    end;
    //. next level
    ptrLevel:=ptrNext;
    end;
  end;
  finally
  TypeSystem.Lock.Leave;
  end;
  end;
memoLog.Lines.Add('levels done.');
finally
Release;
end;
finally
Destroy;
end;
finally
lvLevels_Update;
Enabled:=true;
end;
end;

procedure TfmTileServerVisualizationLevels.GenerateUpperLevels(const idLevel: integer);

  function Obj_ProcessLevel(const idObj: integer; const idLevel: integer; const ptrItem: pointer; const ptrLevel,ptrUpLevel: pointer; const LevelNumber: integer; const TypeSystem: TSystemTTileServerVisualization; const ProgressForm: TfmTileServerLevelsActionProgress): boolean;

    function SaveSegmentsToStoredContextAndGetLevelCachingFactor(const ptrItem: pointer; const ptrLevel: pointer): double;
    var
      LevelFolder: string;
      ptrSegment: pointer;
      SegmentsCount: integer;
      SegmentFileName: string;
    begin
    with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
    Lock.BeginRead;
    try
    LevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,Params.ID);
    SegmentsCount:=0;
    ptrSegment:=Segments;
    while (ptrSegment <> nil) do with TSegmentItemOfTTileServerVisualizationCash(ptrSegment^) do begin
      TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(ptrSegment);
      try
      if (Params._DATA <> nil)
       then begin
        ForceDirectories(LevelFolder);
        SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(Params.XIndex)+'Y'+IntToStr(Params.YIndex)+'.jpg';
        if ((Params._DATA.Size > 0) AND (NOT FileExists(SegmentFileName))) then Params._DATA.SaveToFile(SegmentFileName);
        end;
      finally
      TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(ptrSegment);
      end;
      //.
      Inc(SegmentsCount);
      ptrSegment:=ptrNext;
      end;
    Result:=SegmentsCount/(Params.DivX*Params.DivY);
    finally
    Lock.EndRead;
    end;
    end;
    end;

    procedure GetSegment(const SegmentFileName: string; out JPEG: TJpegImage);
    begin
    JPEG:=TJpegImage.Create;
    try
    JPEG.LoadFromFile(SegmentFileName);
    except
      FreeAndNil(JPEG);
      Raise; //. =>
      end;
    end;

    procedure GetSegmentBMP(const SegmentFileName: string; out BMP: TBitmap);
    var
      JI: TJpegImage;
    begin
    BMP:=nil;
    try
    GetSegment(SegmentFileName, JI);
    try
    BMP:=TBitmap.Create;
    BMP.HandleType:=bmDIB;
    BMP.PixelFormat:=pf24bit;
    //.
    BMP.Assign(JI);
    finally
    JI.Destroy;
    end;
    except
      FreeAndNil(BMP);
      Raise; //. =>
      end;
    end;

    function Bitmap_DrawToQuarterBitmap(const SrcBMP: TBitmap; const DestBMP: TBitmap): boolean;
    var
      SrcDIB,DestDIB: TDIBSection;
      ptrSrcPixel,ptrDestPixel: pointer;
      XSize,YSize: integer;
      SrcRowSize,SrcRowWSize: integer;
    begin
    Result:=false;
    if ((GetObject(SrcBMP.Handle,SizeOf(SrcDIB),@SrcDIB) = 0) OR (GetObject(DestBMP.Handle,SizeOf(DestDIB),@DestDIB) = 0)) then Exit; //. ->
    XSize:=DestBMP.Width;
    YSize:=DestBMP.Height;
    SrcRowSize:=SrcBMP.Width*3;
    SrcRowWSize:=2*SrcRowSize;
    ptrSrcPixel:=System.PByte(SrcDIB.dsBm.bmBits);
    ptrDestPixel:=System.PByte(DestDIB.dsBm.bmBits);
    asm
          PUSH EAX
          PUSH EBX
          PUSH ECX
          PUSH EDX
          PUSH ESI
          PUSH EDI
          MOV ESI,ptrSrcPixel
          MOV EDI,ptrDestPixel
          MOV ECX,YSize
          CLD
      @M0:  PUSH ECX
            PUSH ESI
            MOV ECX,XSize
        @M1:  PUSH ECX
              XOR AX,AX
              XOR BX,BX
              XOR CX,CX
              XOR DX,DX
              //.
              LODSB //. get "B"
              MOV BX,AX
              LODSB //. get "G"
              MOV CX,AX
              LODSB //. get "R"
              MOV DX,AX
              //.
              LODSB //. get "B"
              ADD BX,AX
              LODSB //. get "G"
              ADD CX,AX
              LODSB //. get "R"
              ADD DX,AX
              //.
              PUSH ESI
              ADD ESI,SrcRowSize
              SUB ESI,6
              //.
              LODSB //. get "B"
              ADD BX,AX
              LODSB //. get "G"
              ADD CX,AX
              LODSB //. get "R"
              ADD DX,AX
              //.
              LODSB //. get "B"
              ADD BX,AX
              LODSB //. get "G"
              ADD CX,AX
              LODSB //. get "R"
              ADD DX,AX
              //.
              SHR BX,2
              SHR CX,2
              SHR DX,2
              //.
              MOV AL,BL
              STOSB
              //.
              MOV AL,CL
              STOSB
              //.
              MOV AL,DL
              STOSB
              //.
              POP ESI
              POP ECX
              LOOP @M1
            POP ESI
            POP ECX
            ADD ESI,SrcRowWSize
            LOOP @M0
          POP EDI
          POP ESI
          POP EDX
          POP ECX
          POP EBX
          POP EAX
    end;
    Result:=true; 
    end;

  var
    LevelsList: TList;
    LogStringIndex: integer;
    ptrLevel1,ptrUpLevel1: pointer;
    SrcLevelFolder,DistLevelFolder: string;
    BMP: TBitmap;
    NewLevelSize: integer;
    I,J: integer;
    SegmentsGenerated: integer;
    Segment00FileName,Segment10FileName,Segment11FileName,Segment01FileName: string;
    SegmentBMP: TBitmap;
    SegmentJI: TJpegImage;
    NewSegmentFileName: string;
    ptrNewSegment: pointer;
    PS: string;
  begin
  Result:=false;
  if (TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.ID = idLevel)
   then begin
    if (ptrUpLevel = nil) then Exit; //. ->
    if (SaveSegmentsToStoredContextAndGetLevelCachingFactor(ptrItem,ptrLevel) < 1)
     then begin
      //. to cache all items
      LevelsList:=TList.Create;
      try;
      LevelsList.Add(Pointer(idLevel));
      CacheLevels(LevelsList);
      finally
      LevelsList.Destroy;
      end;
      Self.Repaint;
      end;
    if ((TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.DivX <> 2*TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.DivX) OR (TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.DivY <> 2*TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.DivY)) then Raise Exception.Create('wrong upper level dimension'); //. =>
    //.
    if (SaveSegmentsToStoredContextAndGetLevelCachingFactor(ptrItem,ptrUpLevel) < 1)
     then begin
      TTileServerVisualizationCashItemLevel_FreeAndNilSegments(TypeSystem,TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Segments);
      ProgressForm.memoLog.Lines.Add('level #'+IntToStr(LevelNumber-1));
      LogStringIndex:=ProgressForm.memoLog.Lines.Add('generation started');
      SrcLevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.ID);
      DistLevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.ID);
      NewLevelSize:=TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.DivY;
      BMP:=TBitmap.Create;
      try
      BMP.HandleType:=bmDIB;
      BMP.PixelFormat:=pf24bit; 
      //.
      BMP.Width:=Round(TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.SegmentWidth*2);
      BMP.Height:=Round(TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.SegmentHeight*2);
      SegmentsGenerated:=0;
      for I:=0 to NewLevelSize-1 do
        for J:=0 to NewLevelSize-1 do begin
          NewSegmentFileName:='X'+IntToStr(J)+'Y'+IntToStr(I)+'.jpg';
          if (NOT FileExists(DistLevelFolder+'\'+NewSegmentFileName))
           then begin
            //. (0;0)
            Segment00FileName:=SrcLevelFolder+'\'+'X'+IntToStr(2*J)+'Y'+IntToStr(2*I)+'.jpg';
            Segment10FileName:=SrcLevelFolder+'\'+'X'+IntToStr(2*J+1)+'Y'+IntToStr(2*I)+'.jpg';
            Segment11FileName:=SrcLevelFolder+'\'+'X'+IntToStr(2*J+1)+'Y'+IntToStr(2*I+1)+'.jpg';
            Segment01FileName:=SrcLevelFolder+'\'+'X'+IntToStr(2*J)+'Y'+IntToStr(2*I+1)+'.jpg';
            if (NOT (FileExists(Segment00FileName) AND FileExists(Segment10FileName) AND FileExists(Segment11FileName) AND FileExists(Segment01FileName))) then Continue; //. >
            //.
            GetSegmentBMP(Segment00FileName, SegmentBMP);
            try
            BMP.Canvas.Draw(0,0,SegmentBMP);
            finally
            SegmentBMP.Destroy;
            end;
            //. (1;0)
            GetSegmentBMP(Segment10FileName, SegmentBMP);
            try
            BMP.Canvas.Draw(SegmentBMP.Width,0,SegmentBMP);
            finally
            SegmentBMP.Destroy;
            end;
            //. (1;1)
            GetSegmentBMP(Segment11FileName, SegmentBMP);
            try
            BMP.Canvas.Draw(SegmentBMP.Width,SegmentBMP.Height,SegmentBMP);
            finally
            SegmentBMP.Destroy;
            end;
            //. (0;1)
            GetSegmentBMP(Segment01FileName, SegmentBMP);
            try
            BMP.Canvas.Draw(0,SegmentBMP.Height,SegmentBMP);
            finally
            SegmentBMP.Destroy;
            end;
            //. save result
            SegmentBMP:=TBitmap.Create;
            try
            SegmentBMP.HandleType:=bmDIB;
            SegmentBMP.PixelFormat:=pf24bit; 
            //.
            SegmentBMP.Width:=Round(TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.SegmentWidth);
            SegmentBMP.Height:=Round(TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Params.SegmentHeight);
            //.
            if (NOT Bitmap_DrawToQuarterBitmap(BMP, SegmentBMP)) then Raise Exception.Create('Bitmap_DrawToQuarterBitmap error'); //. =>
            //.
            SegmentJI:=TJpegImage.Create;
            try
            SegmentJI.Assign(SegmentBMP);
            //. save segment
            ForceDirectories(DistLevelFolder);
            SegmentJI.SaveToFile(DistLevelFolder+'\'+NewSegmentFileName);
            finally
            SegmentJI.Destroy;
            end;
            finally
            SegmentBMP.Destroy;
            end;
            end;
          //. create and insert new segment item
          GetMem(ptrNewSegment,SizeOf(TSegmentItemOfTTileServerVisualizationCash));
          with TSegmentItemOfTTileServerVisualizationCash(ptrNewSegment^) do begin
          ptrNext:=nil;
          Lock:=TLevelItemOfTTileServerVisualizationCash(ptrLevel^).SegmentLock;
          with Params do begin
          id:=TTTileServerVisualizationCash(TypeSystem.Cash).SegmentPositionHashCode(J,I);
          XIndex:=J;
          YIndex:=I;
          _DATA:=nil;
          end;
          _idOGLTexture:=0;
          end;
          //.
          TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Lock.BeginWrite;
          try
          if (TTileServerVisualizationCashItemLevelSegments_Insert(TLevelItemOfTTileServerVisualizationCash(ptrUpLevel^).Segments,ptrNewSegment))
           then TSystemTTileServerVisualization(TypeSystem).Cash.Segment_SetDATA(ptrNewSegment,nil) //. remove from memory
           else FreeMem(ptrNewSegment,SizeOf(TSegmentItemOfTTileServerVisualizationCash));
          finally
          TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Lock.EndWrite;
          end;
          //.
          Inc(SegmentsGenerated);
          PS:='generated: '+IntToStr(Round(100*SegmentsGenerated/(NewLevelSize*NewLevelSize)))+'%';
          if (PS <> ProgressForm.memoLog.Lines[LogStringIndex])
           then begin
            ProgressForm.memoLog.Lines[LogStringIndex]:=PS;
            ProgressForm._ProcessMessages;
            if (ProgressForm.flCancel) then Raise Exception.Create('process terminated by user'); //. =>
            end;
          end;
      finally
      BMP.Destroy;
      end;
      ProgressForm.memoLog.Lines[LogStringIndex]:='level generated.';
      end
     else ProgressForm.memoLog.Lines[LogStringIndex]:='level cached.';
    //.
    Result:=true;
    end
   else begin
    ptrUpLevel1:=ptrLevel;
    ptrLevel1:=TLevelItemOfTTileServerVisualizationCash(ptrLevel^).ptrNext;
    if (ptrLevel1 = nil) then Exit; //. ->
    if (Obj_ProcessLevel(idObj,idLevel, ptrItem,ptrLevel1,ptrUpLevel1, LevelNumber+1, TypeSystem,ProgressForm))
     then Result:=Obj_ProcessLevel(idObj,TLevelItemOfTTileServerVisualizationCash(ptrLevel^).Params.ID, ptrItem,ptrLevel,ptrUpLevel, LevelNumber, TypeSystem,ProgressForm);
    end;
  end;

var
  StartupInput: TGDIPlusStartupInput;
  ProgressForm: TfmTileServerLevelsActionProgress;
  ptrItem: pointer;
begin
//. Initialize GDI+
StartupInput.DebugEventCallback := nil;
StartupInput.SuppressBackgroundThread:=False;
StartupInput.SuppressExternalCodecs:=False;
StartupInput.GdiplusVersion:=1;
GdiplusStartup(gdiplusToken, @StartupInput, nil);
try
//.
Enabled:=false;
try
ProgressForm:=TfmTileServerLevelsActionProgress.Create(nil);
with ProgressForm do
try
Caption:='levels generation progress';
Show;
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
TypeSystem.Lock.Enter;
try
with TSystemTTileServerVisualization(TypeSystem) do begin
if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Raise Exception.Create('obj item not found'); //. =>
//.
Obj_ProcessLevel(idObj,idLevel, ptrItem,TItemTTileServerVisualizationCash(ptrItem^).Levels,nil, 0, TSystemTTileServerVisualization(TypeSystem),ProgressForm);
end;
finally
TypeSystem.Lock.Leave;
end;
memoLog.Lines.Add('levels generation done.');
finally
Release;
end;
finally
Destroy;
end;
finally
lvLevels_Update;
Enabled:=true;
end;
finally
GdiplusShutdown(gdiplusToken);
end;
end;

procedure TfmTileServerVisualizationLevels.DegenerateEmptySegmentsOfBottomLevel;
var
  idBottomLevel: integer;
  StartupInput: TGDIPlusStartupInput;
  ProgressForm: TfmTileServerLevelsActionProgress;
  ptrItem,ptrLevel: pointer;
  X,Y: integer;
  ProcessedCount: integer;
  IL: TList;
  LevelFolder: string;
  I: integer;
  SegmentFileName: string;
  PS: string;
begin
if (lvLevels.Items.Count = 0) then Exit; //. ->
idBottomLevel:=Integer(lvLevels.Items[lvLevels.Items.Count-1].Data);
//. Initialize GDI+
StartupInput.DebugEventCallback := nil;
StartupInput.SuppressBackgroundThread:=False;
StartupInput.SuppressExternalCodecs:=False;
StartupInput.GdiplusVersion:=1;
GdiplusStartup(gdiplusToken, @StartupInput, nil);
try
//.
Enabled:=false;
try
ProgressForm:=TfmTileServerLevelsActionProgress.Create(nil);
with ProgressForm do
try
Caption:='empty segments de-generation progress';
Show;
ProgressForm._ProcessMessages;
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
TypeSystem.Lock.Enter;
try
with TSystemTTileServerVisualization(TypeSystem) do begin
if (NOT TSystemTTileServerVisualization(TypeSystem).Cash.GetItem(idObj, ptrItem)) then Raise Exception.Create('obj item not found'); //. =>
ptrLevel:=TItemTTileServerVisualizationCash(ptrItem^).Levels;
while (ptrLevel <> nil) do with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
  if (Params.id = idBottomLevel) then Break; //. >
  //. next level
  ptrLevel:=ptrNext;
  end;
if (ptrLevel = nil) then Exit; //. ->
with TLevelItemOfTTileServerVisualizationCash(ptrLevel^) do begin
Lock.BeginRead;
try
ProgressForm.memoLog.Lines.Add('de-generation started.');
ProcessedCount:=0;
for Y:=0 to Params.DivY-1 do
  for X:=0 to Params.DivX-1 do begin
    if (TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__DegenerateSegmentsLocal(ptrItem, TItemTTileServerVisualizationCash(ptrItem^).TileProviderID, ptrLevel, X,X,Y,Y, nil,  IL))
     then
      try
      LevelFolder:=TSystemTTileServerVisualization(TypeSystem).Cash.Item_Level__GetContextFolder(idObj,TItemTTileServerVisualizationCash(ptrItem^).TileProviderID,idBottomLevel);
      ForceDirectories(LevelFolder);
      for I:=0 to IL.Count-1 do with TSegmentItemOfTTileServerVisualizationCash(IL[I]^) do begin
        //. remove texture if exists
        if (TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.flEnabled AND (TSystemTTileServerVisualization(TypeSystem).Cash.Segment_idOGLTexture(IL[I]) <> 0)) then TSystemTTileServerVisualization(TypeSystem).SegmentsOGLTextures.DeleteSegmentTexture(IL[I]);
        //.
        TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Lock(IL[I]);
        try
        if (Params._DATA <> nil)
         then begin
          //. swap loaded segments data to context file
          SegmentFileName:=LevelFolder+'\'+'X'+IntToStr(Params.XIndex)+'Y'+IntToStr(Params.YIndex)+'.jpg';
          if ((Params._DATA.Size > 0) AND (NOT FileExists(SegmentFileName))) then Params._DATA.SaveToFile(SegmentFileName);
          TSystemTTileServerVisualization(TypeSystem).Cash.Segment_SetDATA(IL[I],nil);
          end;
        finally
        TSystemTTileServerVisualization(TypeSystem).Cash.Segment_Unlock(IL[I]);
        end;
        end;
      finally
      IL.Destroy;
      end;
    //.
    Inc(ProcessedCount);
    PS:='de-generated: '+IntToStr(Round(100*ProcessedCount/(Params.DivX*Params.DivY)))+'%';
    if (PS <> ProgressForm.memoLog.Lines[0])
     then begin
      ProgressForm.memoLog.Lines[0]:=PS;
      ProgressForm._ProcessMessages;
      if (ProgressForm.flCancel) then Raise Exception.Create('process terminated by user'); //. =>
      end;
    end;
finally
Lock.EndRead;
end;
end;
end;
finally
TypeSystem.Lock.Leave;
end;
memoLog.Lines[0]:='empty segments de-generation done.';
finally
Release;
end;
finally
Destroy;
end;
finally
lvLevels_Update;
Enabled:=true;
end;
finally
GdiplusShutdown(gdiplusToken);
end;
end;

procedure TfmTileServerVisualizationLevels.sbShowSelecetdLevelsClick(Sender: TObject);
begin
VisibleSelectedLevels;
end;

procedure TfmTileServerVisualizationLevels.sbHideSelectedLevelsClick(Sender: TObject);
begin
InvisibleSelectedLevels;
end;

procedure TfmTileServerVisualizationLevels.sbCacheSelectedLevelsClick(Sender: TObject);
var
  LevelsList: TList;
  idLevel: integer;
  I: integer;
begin
LevelsList:=TList.Create;
try;
for I:=0 to lvLevels.Items.Count-1 do
  if (lvLevels.Items[I].Checked)
   then begin
    idLevel:=Integer(lvLevels.Items[I].Data);
    LevelsList.Add(Pointer(idLevel));
    end;
if (LevelsList.Count = 0)  then Exit; //. ->
CacheLevels(LevelsList);
finally
LevelsList.Destroy;
end;
end;


procedure TfmTileServerVisualizationLevels.sbGenerateUpperLevelsForSelectedLevelClick(Sender: TObject);
var
  idLevel: integer;
  I: integer;
begin
idLevel:=-1;
for I:=0 to lvLevels.Items.Count-1 do
  if (lvLevels.Items[I].Checked)
   then
    if (idLevel = -1)
     then idLevel:=Integer(lvLevels.Items[I].Data)
     else Raise Exception.Create('there are more than one item selected'); //. =>
GenerateUpperLevels(idLevel);
end;

procedure TfmTileServerVisualizationLevels.sbCacheAndGenerateFromDetailedLevelClick(Sender: TObject);
var
  WorkLevel: integer;
begin
if (lvLevels.Items.Count = 0) then Exit; //. ->
if (MessageDlg('Confirm the operation', mtConfirmation , [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
WorkLevel:=lvLevels.Items.Count-1;
repeat
  GenerateUpperLevels(Integer(lvLevels.Items[WorkLevel].Data));
  //. next up level
  Dec(WorkLevel);
until (WorkLevel = 0);
//.
Self.Repaint;
//. finally, de-generate empty segments
if (MessageDlg('Do you want to degenerate the empty segments', mtConfirmation , [mbYes,mbNo], 0) = mrYes)
 then DegenerateEmptySegmentsOfBottomLevel;
end;

procedure TfmTileServerVisualizationLevels.Getlevelpixelatreflectorcenter1Click(Sender: TObject);

  procedure ParseString(const S: string; out X,Y: Integer);
  var
    NS: String;
    I: integer;
  begin
  I:=1;
  NS:='';
  for I:=1 to Length(S) do
    if S[I] <> ';'
     then NS:=NS+S[I]
     else Break;
  try
  X:=StrToInt(NS);
  except
    Raise Exception.Create('could not recognize X'); //. =>
    end;
  if I = Length(S) then Raise Exception.Create('X not found'); //. =>
  Inc(I);
  NS:='';
  for I:=I to Length(S) do NS:=NS+S[I];
  try
  Y:=StrToInt(NS);
  except
    Raise Exception.Create('could not recognize Y'); //. =>
    end;
  end;

var
  idLevel: integer;
  strPix: string;
  PX,PY: integer;
  X,Y: double;
begin
if (lvLevels.Selected = nil) then Exit; //. ->
idLevel:=Integer(lvLevels.Selected.Data);
with TFormTextInput.Create do
try
CaptionInput:='Enter pixel X;Y';
if (Input(strPix))
 then begin
  ParseString(strPix, PX,PY);
  with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
  try
  Level_ConvertPixPosToXY(idLevel, PX,PY,  X,Y);
  if ((Reflector <> nil) AND (Reflector is TReflector))
   then TReflector(Reflector).ShiftingSetReflection(X,Y);
  finally
  Release;
  end;
  end;
finally
Destroy;
end;
end;

procedure TfmTileServerVisualizationLevels.Showpixelcoordinatesatreflectorcenter1Click(Sender: TObject);
var
  idLevel: integer;
  X,Y: double;
  PX,PY: integer;
begin
if (lvLevels.Selected = nil) then Exit; //. ->
idLevel:=Integer(lvLevels.Selected.Data);
with TTileServerVisualizationFunctionality(TComponentFunctionality_Create(idTTileServerVisualization,idTileServerVisualization)) do
try
if (Reflector = nil) then Exit; //. ->
with (Reflector as TReflector).ReflectionWindow do begin
Lock.Enter;
try
X:=Xcenter/cfTransMeter;
Y:=Ycenter/cfTransMeter;
finally
Lock.Leave;
end;
end;
Level_ConvertXYToPixPos(idLevel, X,Y,  PX,PY);
finally
Release;
end;
ShowMessage('Pixel coordinates:'#$0D#$0A'X = '+IntToStr(PX)+#$0D#$0A'Y = '+IntToStr(PY));
end;

end.
