unit unitCoSegmentedImageFunctionality;
Interface
Uses
  SysUtils,
  Classes,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality,
  TypesDefines;


Const
  idTCoSegmentedImage = 1111142;
  SummarySegmentSize = 256;
  
Type
  TCoSegmentedImageTypeSystem = class(TCoComponentTypeSystem);

  TCoSegmentedImageFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    procedure GenerateFromImage(const ImageFileName: string);
    procedure Prepare;
    procedure GetSegmentsMapTable(out MapTable: pointer; out MapTableXSize,MapTableYSize: integer; out SegmentWidth,SegmentHeight: double);
    function getProportion: Extended;
    procedure setProportion(Value: Extended);
    property Proportion: Extended read getProportion write setProportion;
  end;

  TSegmentStruc = record
    idSegment: integer;
    ptrSegment: TPtr;
    X0: double;
    Y0: double;
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoSegmentedImageTypeSystem: TCoSegmentedImageTypeSystem = nil;

Implementation
Uses
  Graphics,
  Jpeg,
  unitCoSegmentedImagePanelProps;





{TCoSegmentedImageFunctionality}
Constructor TCoSegmentedImageFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoSegmentedImageFunctionality.Destroy;
begin
Inherited;
end;

function TCoSegmentedImageFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoSegmentedImagePanelProps.Create(idCoComponent);
end;

procedure TCoSegmentedImageFunctionality.GenerateFromImage(const ImageFileName: string);
var
  idTComponent,idComponent: integer;
  CELLVisualizationFunctionality: TCELLVisualizationFunctionality;
  DetailsList: TComponentsList;
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
  _ColCount,_RowCount: integer;
  _LineWidth: double;
  _RowSize: double;
  Col_dX,Col_dY: double;
  Row_dX,Row_dY: double;
  Org_X,Org_Y: double;
  X,Y: double;
  JI: TJPEGImage;
  BMP: TBitmap;
  ImageSegmentWidth,ImageSegmentHeight: double;
  ptrOwner: TPtr;
  DetailTypeFunctionality: TTBase2DVisualizationFunctionality;
  I,J: integer;
  SegmentBMP: TBitmap;
  SegmentJI: TJPEGImage;
  SegmentStream: TMemoryStream;
  BA: TByteArray;
  ObjectVisualization: TObjectVisualization;
  idDetail: integer;
  SegmentFunctionality: TDetailedPictureVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCELLVisualization, idTComponent,idComponent)
 then begin
  CELLVisualizationFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with CELLVisualizationFunctionality do
  try
  if TBase2DVisualizationFunctionality(CELLVisualizationFunctionality).GetDetailsList(DetailsList)
   then begin
    DetailsList.Free;
    Raise Exception.Create('can not generate image: segments already generated'); //. =>
    end;
  JI:=TJPEGImage.Create;
  with JI do
  try
  LoadFromFile(ImageFileName);
  BMP:=TBitmap.Create;
  try
  BMP.Assign(JI);
  Proportion:=(BMP.Height/BMP.Width);
  GetCoordinates(X0,Y0, X1,Y1, X2,Y2, X3,Y3);
  GetParams(_ColCount,_RowCount,_LineWidth);
  _RowSize:=RowSize;
  Col_dX:=(X1-X0)/_ColCount; Col_dY:=(Y1-Y0)/_ColCount;
  Row_dX:=(X3-X0)/_RowCount; Row_dY:=(Y3-Y0)/_RowCount;
  Org_X:=X0+Row_dX/2; Org_Y:=Y0+Row_dY/2;
  ImageSegmentWidth:=BMP.Width/_ColCount;
  ImageSegmentHeight:=BMP.Height/_RowCount;
  SegmentBMP:=TBitmap.Create;
  try
  SegmentBMP.Width:=Round(ImageSegmentWidth);
  SegmentBMP.Height:=Round(ImageSegmentHeight);
  SegmentJI:=TJPEGImage.Create;
  try
  SegmentStream:=TMemoryStream.Create;
  try
  ptrOwner:=TBaseVisualizationFunctionality(CELLVisualizationFunctionality).Ptr;
  DetailTypeFunctionality:=TTBase2DVisualizationFunctionality(TTypeFunctionality_Create(idTDetailedPictureVisualization));
  with DetailTypeFunctionality do
  try
  for I:=0 to _RowCount-1 do begin
    X:=Org_X; Y:=Org_Y;
    for J:=0 to _ColCount-1 do begin
      //.
      SegmentBMP.Canvas.CopyRect(Rect(0,0,SegmentBMP.Width,SegmentBMP.Height),BMP.Canvas,Rect(Round(J*ImageSegmentWidth),Round(I*ImageSegmentHeight),Round((J+1)*ImageSegmentWidth),Round((I+1)*ImageSegmentHeight)));
      SegmentJI.Assign(SegmentBMP);
      SegmentStream.Position:=0;
      SegmentJI.SaveToStream(SegmentStream);
      //.
      idDetail:=CreateInstanceEx(ObjectVisualization, ptrOwner);
      SegmentFunctionality:=TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idDetail));
      with TBase2DVisualizationFunctionality(SegmentFunctionality) do
      try
      SetLength(BA,SegmentStream.Size);
      SegmentStream.Position:=0;
      SegmentStream.Read(BA,Length(BA));  
      SegmentFunctionality.GenerateFromImage(BA);
      SetNode(0,X,Y); SetNode(1,X+Col_dX*(1+1/(ImageSegmentWidth)),Y+Col_dY*(1+1/(ImageSegmentWidth)));
      Width:=_RowSize*(1+1/ImageSegmentHeight);
      finally
      Release;
      end;
      X:=X+Col_dX; Y:=Y+Col_dY;
      end;
    Org_X:=Org_X+Row_dX; Org_Y:=Org_Y+Row_dY;
    end;
  finally
  SegmentStream.Destroy;
  end;
  finally
  SegmentJI.Destroy;
  end;
  finally
  SegmentBMP.Destroy;
  end;
  finally
  BMP.Destroy;
  end;
  finally
  Release;
  end;
  finally
  Destroy;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TCoSegmentedImageFunctionality.Prepare;

  function GetNearestSegment(const pX,pY: double; const MinD: double; OwnedSegments: TList; out ptrSegment: pointer): boolean;
  var
    I: integer;
    MinI: integer;
    MinDist,D: double;
  begin
  MinI:=-1;
  for I:=0 to OwnedSegments.Count-1 do with TSegmentStruc(OwnedSegments[I]^) do begin
    D:=sqr(X0-pX)+sqr(Y0-pY);
    if ((D < MinD) AND ((D < minDist) OR (MinI = -1)))
     then begin
      minDist:=D;
      MinI:=I;
      end;
    end;
  if (MinI <> -1)
   then begin
    ptrSegment:=OwnedSegments[MinI];
    Result:=true;
    end
   else Result:=false;
  end;

  procedure ProcessForSegmentedImages(const VF: TBase2DVisualizationFunctionality; const IL: TList);
  var
    DetailsList: TComponentsList;
    I: integer;
    BA: TByteArray;
    NodesCount: integer;
    ptrSegment: pointer;
    DVF: TBase2DVisualizationFunctionality;
  begin
  if (VF.GetDetailsList(DetailsList))
   then
    try
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
      if (idTComponent = idTDetailedPictureVisualization)
       then begin
        DVF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
        try
        if (TComponentFunctionality(DVF).Tag = 0)
         then begin
          DVF.GetNodes(BA);
          NodesCount:=Integer(Pointer(@BA[0])^);
          if (NodesCount = 2)
           then begin
            GetMem(ptrSegment,SizeOf(TSegmentStruc));
            with TSegmentStruc(ptrSegment^) do begin
            idSegment:=idComponent;
            ptrSegment:=TBaseVisualizationFunctionality(DVF).Ptr;
            X0:=Double(Pointer(@BA[4])^);
            Y0:=Double(Pointer(@BA[12])^);
            end;
            IL.Add(ptrSegment);
            end;
          end;
        finally
        DVF.Release;
        end;
        end;
    //. process own objects
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do begin
      DVF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      try
      ProcessForSegmentedImages(DVF, IL);
      finally
      DVF.Release;
      end;
      end;
    finally
    DetailsList.Destroy;
    end;
  end;

  function GetDimension(const Size: integer; out Level: integer): integer;
  begin
  Result:=1;
  Level:=0;
  while (Result < Size) do begin
    Result:=(Result SHL 1);
    Inc(Level);
    end;
  end;

  procedure DeleteFolder(const Folder: string);
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
    until FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  if (FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then DeleteFolder(Folder+'\'+sr.name);
    until FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  RemoveDir(Folder);
  end;

  procedure ProcessSrcSegment(const X0,Y0: double; const Col_dX,Col_dY,Row_dX,Row_dY: double; const Xindex,Yindex: integer; const MinD: double; const OwnedSegments: TList; const BMP: TBitmap);
  var
    X,Y: double;
    ptrSegment: pointer;
    SegmentFunctionality: TDetailedPictureVisualizationFunctionality;
    LevelsInfo: TByteArray;
    idLevel0Params: TDetailedPictureVisualizationLevel;
    idSegment: integer;
    ExS: TByteArray;
    SegmentDATA: TByteArray;
    P: pointer;
    SegmentParams: TDetailedPictureVisualizationLevelSegment;
    _DATASize: integer;
    JI: TJpegImage;
    DivX: integer;
    DivY: integer;
    SegmentWidth: double;
    SegmentHeight: double;
    VisibleMinScale: double;
    VisibleMaxScale: double;
  begin
  X:=X0+Col_dX*Xindex+Row_dX*Yindex;
  Y:=Y0+Col_dY*Xindex+Row_dY*Yindex;
  if (GetNearestSegment(X+(Row_dX/2),Y+(Row_dY/2),MinD,OwnedSegments, ptrSegment))
   then begin
    SegmentFunctionality:=TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,TSegmentStruc(ptrSegment^).idSegment));
    with SegmentFunctionality do
    try
    GetLevelsInfo(LevelsInfo);
    if (Length(LevelsInfo) > 0)
     then begin
      idLevel0Params:=TDetailedPictureVisualizationLevel(Pointer(@LevelsInfo[Length(LevelsInfo)-SizeOf(TDetailedPictureVisualizationLevel)])^);
      SetLength(ExS,0);
      Level_GetSegments(idLevel0Params.id, 0,0,0,0, ExS, SegmentDATA);
      P:=@SegmentDATA[0];
      with SegmentParams do begin
      id:=Integer(P^); Inc(Integer(P),SizeOf(id));
      XIndex:=Integer(P^); Inc(Integer(P),SizeOf(XIndex));
      YIndex:=Integer(P^); Inc(Integer(P),SizeOf(YIndex));
      _DATASize:=Integer(P^); Inc(Integer(P),SizeOf(_DATASize));
      if (_DATASize > 0)
       then begin
        DATA:=TMemoryStream.Create;
        try
        DATA.Size:=_DATASize;
        DATA.Write(P^,_DATASize);
        Inc(Integer(P),_DATASize);
        JI:=TJpegImage.Create;
        try
        DATA.Position:=0;
        JI.LoadFromStream(DATA);
        BMP.Canvas.StretchDraw(Rect(0,0,BMP.Width,BMP.Height),JI);
        finally
        JI.Destroy;
        end;
        finally
        DATA.Destroy;
        end;
        //.
        Level_GetParams(idLevel0Params.id, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
        VisibleMinScale:=2.0;
        Level_SetParams(idLevel0Params.id, DivX,DivY, SegmentWidth,SegmentHeight, VisibleMinScale,VisibleMaxScale);
        end;
      end;
      end;

    finally
    Release;
    end;
    //.
    FreeMem(ptrSegment,SizeOf(TSegmentStruc));
    OwnedSegments.Remove(ptrSegment);
    end;
  end;

var
  idTComponent,idComponent: integer;
  CELLVisualizationFunctionality: TCELLVisualizationFunctionality;
  OwnedSegments: TList;
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
  _ColCount,_RowCount: integer;
  dvX,dvY: integer;
  lvX,lvY: integer;
  Level: integer;
  _LineWidth: double;
  _RowSize: double;
  Col_dX,Col_dY: double;
  Row_dX,Row_dY: double;
  MinDcol,MinDrow,MinD: double;
  Org_X,Org_Y: double;
  X,Y: double;
  I,J: integer;
  ptrSegment: pointer;
  SegmentFunctionality: TDetailedPictureVisualizationFunctionality;
  SegmentWidth,SegmentHeight: integer;
  SX,SY: double;
  DetailsList: TComponentsList;
  idSummarySegment: integer;
  ptrOwner: TPtr;
  DetailTypeFunctionality: TTBase2DVisualizationFunctionality;
  ObjectVisualization: TObjectVisualization;
  SummarySegmentFunctionality: TDetailedPictureVisualizationFunctionality;
  flagLoop: boolean;
  Color: TColor;
  Width: Double;
  flagFill: boolean;
  ColorFill: TColor;
  BA: TByteArray;
  TilesFolder: string;
  SegmentBMP: TBitmap;
  SegmentJI: TJPEGImage;
  _X,_Y: integer;
  SegmentFileName: string;
  LevelsInfo: TByteArray;
  idBottomLevelParams: TDetailedPictureVisualizationLevel;
  DivX: integer;
  DivY: integer;
  _SegmentWidth: double;
  _SegmentHeight: double;
  VisibleMinScale: double;
  VisibleMaxScale: double;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCELLVisualization, idTComponent,idComponent)
 then begin
  CELLVisualizationFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with CELLVisualizationFunctionality do
  try
  OwnedSegments:=TList.Create;
  try
  GetParams(_ColCount,_RowCount,_LineWidth);
  //. prepare summary segment image
  dvX:=_ColCount;
  dvY:=_RowCount;
  dvX:=GetDimension(dvX, lvX);
  dvY:=GetDimension(dvY, lvY);
  if (lvY > lvX)
   then begin
    dvX:=dvY;
    Level:=lvY;
    end
   else begin
    dvY:=dvX;
    Level:=lvX;
    end;
  //. set a new cell dimension
  CELLVisualizationFunctionality.LineWidth:=0; _LineWidth:=0;
  CELLVisualizationFunctionality.Change(0,0,dvX-_ColCount,dvY-_RowCount); _ColCount:=dvX; _RowCount:=dvY;
  CELLVisualizationFunctionality.DoQuad;
  //.
  GetCoordinates(X0,Y0, X1,Y1, X2,Y2, X3,Y3);
  _RowSize:=RowSize;
  Col_dX:=(X1-X0)/_ColCount; Col_dY:=(Y1-Y0)/_ColCount;
  Row_dX:=(X3-X0)/_RowCount; Row_dY:=(Y3-Y0)/_RowCount;
  MinDcol:=sqr(Col_dX)+sqr(Col_dY);
  MinDrow:=sqr(Row_dX)+sqr(Row_dY);
  if (MinDrow < MinDcol) then MinD:=MinDrow else MinD:=MinDcol;
  MinD:=MinD/2;
  Org_X:=X0; Org_Y:=Y0;
  //. align segments
  ProcessForSegmentedImages(TBase2DVisualizationFunctionality(CELLVisualizationFunctionality), OwnedSegments);
  if (OwnedSegments.Count = 0) then Raise Exception.Create('segments not found'); //. =>
  for I:=0 to _RowCount-1 do begin
    X:=Org_X; Y:=Org_Y;
    for J:=0 to _ColCount-1 do begin
      if (GetNearestSegment(X+(Row_dX/2),Y+(Row_dY/2),MinD,OwnedSegments, ptrSegment))
       then begin
        SegmentFunctionality:=TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,TSegmentStruc(ptrSegment^).idSegment));
        with SegmentFunctionality do
        try
        GetParams(SegmentWidth,SegmentHeight);
        if (SegmentHeight > 0)
         then begin
          SX:=X+(Row_dX/2)*(1+1/(2*SegmentWidth));
          SY:=Y+(Row_dY/2)*(1+1/(2*SegmentHeight));
          end
         else begin
          SX:=X+(Row_dX/2);
          SY:=Y+(Row_dY/2);
          end;
        try
        with TBase2DVisualizationFunctionality(SegmentFunctionality) do begin
        SetNode(0,SX,SY);
        if (SegmentWidth > 0 ) then SetNode(1,SX+Col_dX*(1+1/SegmentWidth),SY+Col_dY*(1+1/SegmentWidth)) else SetNode(1,SX+Col_dX,SY+Col_dY);
        if (SegmentHeight > 0) then Width:=_RowSize*(1+1/SegmentHeight) else Width:=_RowSize;
        end;
        except
          end;
        finally
        Release;
        end;
        //.
        FreeMem(ptrSegment,SizeOf(TSegmentStruc));
        OwnedSegments.Remove(ptrSegment);
        end;
      X:=X+Col_dX; Y:=Y+Col_dY;
      end;
    Org_X:=Org_X+Row_dX; Org_Y:=Org_Y+Row_dY;
    end;
  //. preparing summary segment image
  if (OwnedSegments.Count > 0) then Raise Exception.Create('not all segments aligned'); //. =>
  ProcessForSegmentedImages(TBase2DVisualizationFunctionality(CELLVisualizationFunctionality), OwnedSegments);
  if (OwnedSegments.Count = 0) then Raise Exception.Create('segments not found'); //. =>
  if (TBase2DVisualizationFunctionality(CELLVisualizationFunctionality).GetDetailsList(DetailsList))
   then
    try
    idSummarySegment:=0;
    if ((DetailsList.Count = 1) AND (TItemComponentsList(DetailsList[0]^).idTComponent = idTDetailedPictureVisualization))
     then with TComponentFunctionality_Create(TItemComponentsList(DetailsList[0]^).idTComponent,TItemComponentsList(DetailsList[0]^).idComponent) do
      try
      //. summary segment image tag
      if (Tag = 1) then idSummarySegment:=TItemComponentsList(DetailsList[0]^).idComponent;
      finally
      Release;
      end;
    if (idSummarySegment = 0)
     then begin //. construct summary segment image and move segments into
      ptrOwner:=TBaseVisualizationFunctionality(CELLVisualizationFunctionality).Ptr;
      DetailTypeFunctionality:=TTBase2DVisualizationFunctionality(TTypeFunctionality_Create(idTDetailedPictureVisualization));
      with DetailTypeFunctionality do
      try
      idSummarySegment:=CreateInstanceEx(ObjectVisualization, ptrOwner);
      SummarySegmentFunctionality:=TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idSummarySegment));
      with SummarySegmentFunctionality do
      try
      TComponentFunctionality(SummarySegmentFunctionality).Tag:=1;
      //.
      TBase2DVisualizationFunctionality(SummarySegmentFunctionality).GetProps(flagLoop,Color,Width,flagFill,ColorFill);
      Color:=clGray;
      ColorFill:=clSilver;
      TBase2DVisualizationFunctionality(SummarySegmentFunctionality).SetProps(flagLoop,Color,Width,flagFill,ColorFill);
      //. move segments
      ptrOwner:=TBaseVisualizationFunctionality(SummarySegmentFunctionality).Ptr;
      for I:=0 to OwnedSegments.Count-1 do with TSegmentStruc(OwnedSegments[I]^) do with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idSegment)) do
        try
        ChangeOwner(ptrOwner);
        finally
        Release;
        end;
      finally
      Release;
      end;
      finally
      Release;
      end;
      end;
    //.
    SummarySegmentFunctionality:=TDetailedPictureVisualizationFunctionality(TComponentFunctionality_Create(idTDetailedPictureVisualization,idSummarySegment));
    with SummarySegmentFunctionality do
    try
    TBase2DVisualizationFunctionality(SummarySegmentFunctionality).GetProps(flagLoop,Color,Width,flagFill,ColorFill);
    TilesFolder:='C:\Temp\Temp'+FormatDateTime('DDMMYYHHNNSS',Now);
    ForceDirectories(TilesFolder);
    try
    SegmentBMP:=TBitmap.Create;
    try
    SegmentBMP.Width:=SummarySegmentSize;
    SegmentBMP.Height:=SegmentBMP.Width;
    //.
    SegmentJI:=TJPegImage.Create;
    try
    for _Y:=0 to dvY-1 do
      for _X:=0 to dvX-1 do begin
        SegmentBMP.Canvas.Pen.Color:=Color;
        SegmentBMP.Canvas.Brush.Color:=ColorFill;
        SegmentBMP.Canvas.Rectangle(0,0,SegmentBMP.Width,SegmentBMP.Height);
        //.
        ProcessSrcSegment(X0,Y0, Col_dX,Col_dY,Row_dX,Row_dY, _X,_Y, MinD, OwnedSegments, SegmentBMP);
        //.
        SegmentJI.Assign(SegmentBMP);
        SegmentFileName:=TilesFolder+'\'+'Segment_'+IntToStr(Level)+'_'+IntToStr(_X)+'_'+IntToStr(_Y)+'.jpg';
        SegmentJI.SaveToFile(SegmentFileName);
        end;
    finally
    SegmentJI.Destroy;
    end;
    finally
    SegmentBMP.Destroy;
    end;
    //. setting segment image
    TBase2DVisualizationFunctionality(SummarySegmentFunctionality).SetNode(0,X0+Row_dX*dvY/2.0,Y0+Row_dY*dvY/2.0);
    TBase2DVisualizationFunctionality(SummarySegmentFunctionality).SetNode(1,X0+Col_dX*dvX+Row_dX*dvY/2.0,Y0+Col_dY*dvX+Row_dY*dvY/2.0);
    TBase2DVisualizationFunctionality(SummarySegmentFunctionality).Width:=Sqrt(sqr(Row_dX)+sqr(Row_dY))*dvY;
    //. generating segment image
    SummarySegmentFunctionality.GenerateFromTiles(TilesFolder,Level);
    SummarySegmentFunctionality.GetLevelsInfo(LevelsInfo);
    if (Length(LevelsInfo) > 0)
     then begin
      idBottomLevelParams:=TDetailedPictureVisualizationLevel(Pointer(@LevelsInfo[0])^);
      //.
      SummarySegmentFunctionality.Level_GetParams(idBottomLevelParams.id, DivX,DivY, _SegmentWidth,_SegmentHeight, VisibleMinScale,VisibleMaxScale);
      VisibleMaxScale:=1.5;
      SummarySegmentFunctionality.Level_SetParams(idBottomLevelParams.id, DivX,DivY, _SegmentWidth,_SegmentHeight, VisibleMinScale,VisibleMaxScale);
      end;
    finally
    DeleteFolder(TilesFolder);
    end;
    finally
    Release;
    end;
    finally
    DetailsList.Destroy;
    end
   else Raise Exception.Create('details not found'); //. =>
  finally
  for I:=0 to OwnedSegments.Count-1 do FreeMem(OwnedSegments[I],SizeOf(TSegmentStruc));
  OwnedSegments.Destroy;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TCoSegmentedImageFunctionality.GetSegmentsMapTable(out MapTable: pointer; out MapTableXSize,MapTableYSize: integer; out SegmentWidth,SegmentHeight: double);

  function GetNearestSegment(const pX,pY: double; const MinD: double; OwnedSegments: TList; out ptrSegment: pointer): boolean;
  var
    I: integer;
    MinI: integer;
    MinDist,D: double;
  begin
  MinI:=-1;
  for I:=0 to OwnedSegments.Count-1 do with TSegmentStruc(OwnedSegments[I]^) do begin
    D:=sqr(X0-pX)+sqr(Y0-pY);
    if ((D < MinD) AND ((D < minDist) OR (MinI = -1)))
     then begin
      minDist:=D;
      MinI:=I;
      end;
    end;
  if (MinI <> -1)
   then begin
    ptrSegment:=OwnedSegments[MinI];
    Result:=true;
    end
   else Result:=false;
  end;

  procedure ProcessForSegmentedImages(const VF: TBase2DVisualizationFunctionality; const IL: TList);
  var
    DetailsList: TComponentsList;
    I: integer;
    BA: TByteArray;
    NodesCount: integer;
    ptrSegment: pointer;
    DVF: TBase2DVisualizationFunctionality;
  begin
  if (VF.GetDetailsList(DetailsList))
   then
    try
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
      if (idTComponent = idTDetailedPictureVisualization)
       then begin
        DVF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
        try
        if (TComponentFunctionality(DVF).Tag = 0)
         then begin
          DVF.GetNodes(BA);
          NodesCount:=Integer(Pointer(@BA[0])^);
          if (NodesCount = 2)
           then begin
            GetMem(ptrSegment,SizeOf(TSegmentStruc));
            with TSegmentStruc(ptrSegment^) do begin
            idSegment:=idComponent;
            ptrSegment:=TBaseVisualizationFunctionality(DVF).Ptr;
            X0:=Double(Pointer(@BA[4])^);
            Y0:=Double(Pointer(@BA[12])^);
            end;
            IL.Add(ptrSegment);
            end;
          end;
        finally
        DVF.Release;
        end;
        end;
    //. process own objects
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do begin
      DVF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      try
      ProcessForSegmentedImages(DVF, IL);
      finally
      DVF.Release;
      end;
      end;
    finally
    DetailsList.Destroy;
    end;
  end;

var
  idTComponent,idComponent: integer;
  CELLVisualizationFunctionality: TCELLVisualizationFunctionality;
  OwnedSegments: TList;
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
  _ColCount,_RowCount: integer;
  _LineWidth: double;
  _RowSize: double;
  Col_dX,Col_dY: double;
  Row_dX,Row_dY: double;
  MinDcol,MinDrow,MinD: double;
  Org_X,Org_Y: double;
  MapTableSize: integer;
  X,Y: double;
  I,J: integer;
  ptrSegment: pointer;
begin
MapTable:=nil;
try
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCELLVisualization, idTComponent,idComponent)
 then begin
  CELLVisualizationFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with CELLVisualizationFunctionality do
  try
  OwnedSegments:=TList.Create;
  try
  //.
  ProcessForSegmentedImages(TBase2DVisualizationFunctionality(CELLVisualizationFunctionality), OwnedSegments);
  //.
  if (OwnedSegments.Count = 0) then Raise Exception.Create('segments not found'); //. =>
  //.
  GetCoordinates(X0,Y0, X1,Y1, X2,Y2, X3,Y3);
  GetParams(_ColCount,_RowCount,_LineWidth);
  _RowSize:=RowSize;
  Col_dX:=(X1-X0)/_ColCount; Col_dY:=(Y1-Y0)/_ColCount;
  Row_dX:=(X3-X0)/_RowCount; Row_dY:=(Y3-Y0)/_RowCount;
  MinDcol:=sqr(Col_dX)+sqr(Col_dY);
  MinDrow:=sqr(Row_dX)+sqr(Row_dY);
  if (MinDrow < MinDcol) then MinD:=MinDrow else MinD:=MinDcol;
  MinD:=MinD/2;
  Org_X:=X0; Org_Y:=Y0;
  SegmentWidth:=Sqrt(sqr(Col_dX)+sqr(Col_dY));
  SegmentHeight:=Sqrt(sqr(Row_dX)+sqr(Row_dY));
  MapTableXSize:=_ColCount;
  MapTableYSize:=_RowCount;
  MapTableSize:=MapTableYSize*MapTableXSize*SizeOf(Integer);
  if (MapTableSize > 0)
   then begin
    GetMem(MapTable,MapTableSize);
    for I:=0 to _RowCount-1 do begin
      X:=Org_X; Y:=Org_Y;
      for J:=0 to _ColCount-1 do begin
        if (GetNearestSegment(X+(Row_dX/2),Y+(Row_dY/2),MinD,OwnedSegments, ptrSegment))
         then begin
          Integer(Pointer(Integer(MapTable)+(I*_ColCount+J)*SizeOf(Integer))^):=TSegmentStruc(ptrSegment^).idSegment;
          //.
          OwnedSegments.Remove(ptrSegment);
          end
         else Integer(Pointer(Integer(MapTable)+(I*_ColCount+J)*SizeOf(Integer))^):=0;
        X:=X+Col_dX; Y:=Y+Col_dY;
        end;
      Org_X:=Org_X+Row_dX; Org_Y:=Org_Y+Row_dY;
      end;
    end;
  finally
  for I:=0 to OwnedSegments.Count-1 do FreeMem(OwnedSegments[I],SizeOf(TSegmentStruc));
  OwnedSegments.Destroy;
  end;
  finally
  Release;
  end;
  end;
except
  FreeMem(MapTable,MapTableSize);
  Raise; //. =>
  end;
end;

function TCoSegmentedImageFunctionality.getProportion: Extended;
var
  idTComponent,idComponent: integer;
  CELLVisualizationFunctionality: TCELLVisualizationFunctionality;
  DetailsList: TComponentsList;
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCELLVisualization, idTComponent,idComponent)
 then begin
  CELLVisualizationFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with CELLVisualizationFunctionality do
  try
  GetCoordinates(X0,Y0, X1,Y1, X2,Y2, X3,Y3);
  Result:=Sqrt((sqr(X3-X0)+sqr(Y3-Y0))/(sqr(X1-X0)+sqr(Y1-Y0)));
  finally
  Release;
  end;
  end;
end;

procedure TCoSegmentedImageFunctionality.setProportion(Value: Extended);
var
  idTComponent,idComponent: integer;
  CELLVisualizationFunctionality: TCELLVisualizationFunctionality;
  DetailsList: TComponentsList;
  X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double;
  L: Extended;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCELLVisualization, idTComponent,idComponent)
 then begin
  CELLVisualizationFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with CELLVisualizationFunctionality do
  try
  if TBase2DVisualizationFunctionality(CELLVisualizationFunctionality).GetDetailsList(DetailsList)
   then begin
    DetailsList.Free;
    Raise Exception.Create('can not change proportion: segments already generated'); //. =>
    end;
  GetCoordinates(X0,Y0, X1,Y1, X2,Y2, X3,Y3);
  L:=Sqrt(sqr(X1-X0)+sqr(Y1-Y0));
  TBase2DVisualizationFunctionality(CELLVisualizationFunctionality).Width:=Value*L;
  finally
  Release;
  end;
  end;
end;

procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoSegmentedImageTypeSystem:=TCoSegmentedImageTypeSystem.Create(idTCoSegmentedImage,TCoSegmentedImageFunctionality);

Finalization
CoSegmentedImageTypeSystem.Free;

end.
