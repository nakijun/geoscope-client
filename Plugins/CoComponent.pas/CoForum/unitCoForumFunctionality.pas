unit unitCoForumFunctionality;
Interface
Uses
  Windows,
  SysUtils,
  Classes,
  ActiveX,
  MyOLECtnrs,
  Graphics,
  Forms,
  DBClient,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality;

               

Const
  idTCoForum = 1111129;
Type
  TCoForumTypeSystem = class(TCoComponentTypeSystem);

  TCoForumFunctionality = class(TCoComponentFunctionality)
  public
    Visualization_WMFList: TList;
    
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function getName: string;
    procedure setName(Value: string);
    function TPropsPanel_Create: TForm; override;
    function Visualization_ReflectV0(pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean; override;
    procedure GetDATAStream(out Stream: TClientBlobStream);
    procedure SetDATAStream(Stream: TMemoryStream);
    procedure GetBlocksList(out List: TList);
    procedure SetBlocksList(List: TList);
    procedure Visualization_WMFListFree;
    procedure Visualization_WMFListUpdate;
    property Name: string read getName write setName;
  end;

  TTCoForumFunctioning = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;


  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoForumTypeSystem: TCoForumTypeSystem = nil;

Implementation
Uses
  TypesDefines,
  unitCoForumPanelProps;



{TCoForumFunctionality}
Constructor TCoForumFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Visualization_WMFList:=nil;
end;

Destructor TCoForumFunctionality.Destroy;
begin
Visualization_WMFListFree;
Inherited;
end;

procedure TCoForumFunctionality.Visualization_WMFListFree;
var
  I: integer;
begin
if Visualization_WMFList <> nil
 then begin
  for I:=0 to Visualization_WMFList.Count-1 do TObject(Visualization_WMFList[I]).Destroy;
  Visualization_WMFList.Free;
  Visualization_WMFList:=nil;
  end;
end;

procedure TCoForumFunctionality.Visualization_WMFListUpdate;
var
  BlocksList: TList;
  I: integer;
  WMF: TMetaFile;
begin
Visualization_WMFListFree;
GetBlocksList(BlocksList);
try
Visualization_WMFList:=TList.Create;
try
for I:=0 to BlocksList.Count-1 do begin
  GetObjWMF(TMemoryStream(BlocksList[I]),WMF);
  Visualization_WMFList.Add(WMF);
  end;
except
  Visualization_WMFListFree;
  Raise; //. =>
  end;
finally
for I:=0 to BlocksList.Count-1 do TObject(BlocksList[I]).Destroy;
BlocksList.Destroy;
end;
end;

function TCoForumFunctionality.getName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCUSTOMVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do NameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with NameFunctionality do
    try
    Result:=GetStr;
    finally
    Release;
    end;
    finally
    DetailsList.Destroy;
    end;
  finally
  Release;
  end;
  end;
end;

procedure TCoForumFunctionality.setName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCUSTOMVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do NameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with NameFunctionality do
    try
    SetStr(Value);
    finally
    Release;
    end;
    finally
    DetailsList.Destroy;
    end;
  finally
  Release;
  end;
  end;
end;

procedure TCoForumFunctionality.GetDATAStream(out Stream: TClientBlobStream);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  GetDATA1(Stream);
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get data-file'); //. =>
end;

procedure TCoForumFunctionality.SetDATAStream(Stream: TMemoryStream);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  VisualizationFunctionality: TComponentFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  SetDATA1(Stream);
  finally
  Release;
  end;
  if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCUSTOMVisualization, idTComponent,idComponent)
   then begin
    VisualizationFunctionality:=TComponentFunctionality_Create(idTComponent,idComponent);
    with VisualizationFunctionality do
    try
    DoOnComponentUpdate;
    finally
    Release;
    end;
    end;
  end
 else
  Raise Exception.Create('could not get data-file'); //. =>
end;

procedure TCoForumFunctionality.GetBlocksList(out List: TList);
var
  SrsStream: TClientBlobStream;
  BlockSize: integer;
  NewBlock: TMemoryStream;
  I: integer;
begin
GetDATAStream(SrsStream);
try
List:=TList.Create;
try
if SrsStream.Size = 0 then Exit; //. ->
SrsStream.Position:=0;
repeat
  if SrsStream.Read(BlockSize,SizeOf(BlockSize)) <> SizeOf(BlockSize) then Raise Exception.Create('could not read block size'); //. =>
  if BlockSize = -1 then Break; //. >
  NewBlock:=TMemoryStream.Create;
  NewBlock.Size:=BlockSize;
  if (BlockSize <> 0) AND (NewBlock.CopyFrom(SrsStream,BlockSize) <> BlockSize) then Raise Exception.Create('could not read block'); //. =>
  NewBlock.Position:=0;
  List.Add(NewBlock);
until false;
except
  for I:=0 to List.Count-1 do TObject(List[I]).Destroy;
  List.Destroy;
  Raise; //. =>
  end;
finally
SrsStream.Destroy;
end;
end;

procedure TCoForumFunctionality.SetBlocksList(List: TList);
var
  DistStream: TMemoryStream;
  I: integer;
  BlockSize: integer;
  Block: TMemoryStream;
begin
DistStream:=TMemoryStream.Create;
try
for I:=0 to List.Count-1 do begin
  Block:=List[I];
  BlockSize:=Block.Size;
  if DistStream.Write(BlockSize,SizeOf(BlockSize)) <> SizeOf(BlockSize) then Raise Exception.Create('could not write block size'); //. =>
  Block.Position:=0;
  if (BlockSize > 0 ) AND (DistStream.CopyFrom(Block,BlockSize) <> BlockSize) then Raise Exception.Create('could not write block'); //. =>
  end;
//. write end marker
BlockSize:=-1;
if DistStream.Write(BlockSize,SizeOf(BlockSize)) <> SizeOf(BlockSize) then Raise Exception.Create('could not write blocks end marker'); //. =>
//. save
DistStream.Position:=0;
SetDATAStream(DistStream);
finally
DistStream.Destroy;
end;
end;

function TCoForumFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoForumPanelProps.Create(idCoComponent);
end;

{Reflect function version #0}
Type
  //. Imported from TReflector.pas
  TNode = record
    X,Y: Extended;
  end;

  TScreenNode = Windows.TPoint;

  TFigureWinRefl = class
  public
    ptrObj: TPtr;
    idTObj: integer;
    idObj: integer;
    flagLoop: boolean;
    Color: TColor;
    flagFill: boolean;
    ColorFill: TColor;
    Width: TSpaceObjLineWidth;
    Style: TPenStyle;
    flPolyLine: boolean;
    flSelected: boolean;
    SelectedPoint_Index: integer;

    Count: integer;
    Nodes: array[0..TSpaceObj_maxPointsCount-1] of TNode;
    CountScreenNodes: integer;
    ScreenNodes: array[0..TSpaceObj_maxPointsCount-1] of TScreenNode;
    Position: integer;
  end;

  TReflectionWindow = class
  public
    X0,Y0,X1,Y1,X2,Y2,X3,Y3: TCrd;
    Xcenter,Ycenter: TCrd;
    Xmn,Ymn,Xmx,Ymx: smallint;
    Xmd,Ymd: word;
    HorRange,VertRange: Extended;
    //. ContainerCoord: TContainerCoord;
  end;

  TWindowLimit = record
    Vol: integer;
  end;

  TWindow = class
  public
    Limits: array[0..3] of TWindowLimit;
    IndexLimit: integer;
  end;
  //. end of import

function TCoForumFunctionality.Visualization_ReflectV0(pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean;

  procedure GetMaxHeightAndMaxWidth(out MaxHeight: integer; out MaxWidth: integer);
  var
    I: integer;
  begin
  MaxHeight:=0;
  MaxWidth:=0;
  for I:=0 to Visualization_WMFList.Count-1 do with TMetaFile(Visualization_WMFList[I]) do begin
    if Width > MaxWidth then MaxWidth:=Width;
    Inc(Maxheight,Height);
    end;
  end;

var
  S: TClientBlobStream;
  ptrItem: pointer;
  X0,Y0, X1,Y1: Extended;
  diffX1X0,diffY1Y0: Extended;
  _Width: Extended;
  b: Extended;
  XF: XForm;
  Alfa: Extended;
  CosAlfa,SinAlfa: Extended;
  V: Extended;
  S0_X3,S0_Y3: Extended;
  S1_X3,S1_Y3: Extended;
  Xc,Yc: integer;
  K1,K2: Extended;
  Scale: Extended;
  MaxHeight: integer;
  MaxWidth: integer;
  I: integer;
  Y: Extended;
begin
Result:=false;
try
if Visualization_WMFList = nil then Visualization_WMFListUpdate;
with TFigureWInRefl(pFigure) do begin
X0:=Nodes[0].X;Y0:=Nodes[0].Y;
X1:=Nodes[1].X;Y1:=Nodes[1].Y;
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
_Width:=Sqrt(sqr(diffX1X0)+sqr(diffY1Y0));
if (diffX1X0 > 0) AND (diffY1Y0 >= 0)
 then
  Alfa:=2*PI+ArcTan(-diffY1Y0/diffX1X0)
 else
  if (diffX1X0 < 0) AND (diffY1Y0 > 0)
   then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
   else
    if (diffX1X0 < 0) AND (diffY1Y0 <= 0)
     then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
     else
      if (diffX1X0 > 0) AND (diffY1Y0 < 0)
       then Alfa:=ArcTan(-diffY1Y0/diffX1X0)
       else
        if diffY1Y0 > 0
         then Alfa:=3*PI/2
         else Alfa:=PI/2;
with TReflectionWindow(pReflectionWindow) do b:=(Width*(Xmx-Xmn)/(Sqrt(sqr(X1-X0)+sqr(Y1-Y0))/cfTransMeter));
if Abs(diffY1Y0) > Abs(diffX1X0)
 then begin
  V:=(b/2)/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
  S0_X3:=(V)+X0;
  S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
  S1_X3:=(-V)+X0;
  S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
  end
 else begin
  V:=(b/2)/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
  S0_Y3:=(V)+Y0;
  S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
  S1_Y3:=(-V)+Y0;
  S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
  end;
if (3*PI/4 <= Alfa) AND (Alfa < 7*PI/4)
 then begin Xc:=Round(S0_X3);Yc:=Round(S0_Y3) end
 else begin Xc:=Round(S1_X3);Yc:=Round(S1_Y3) end;
end;
Alfa:=-Alfa;
//.
K1:=b/_Width;
GetMaxHeightAndMaxWidth(MaxHeight,MaxWidth);
K2:=MaxHeight/MaxWidth;
if K2 < K1
 then Scale:=_Width/MaxWidth
 else Scale:=b/MaxHeight;
//.
CosAlfa:=Cos(Alfa);
SinAlfa:=Sin(Alfa);
//. reflecting
SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
Y:=0;
for I:=0 to Visualization_WMFList.Count-1 do
  try
  XF.eDx:=Xc{///- -TReflectionWindow(pReflectionWindow).Xmn};
  XF.eDy:=Yc{///- -TReflectionWindow(pReflectionWindow).Ymn};
  XF.eM11:=CosAlfa;
  XF.eM12:=SinAlfa;
  XF.eM21:=-SinAlfa;
  XF.eM22:=CosAlfa;
  SetWorldTransForm(pCanvas.Handle,XF);
  XF.eDx:=0;
  XF.eDy:=Y;
  XF.eM11:=Scale;
  XF.eM12:=0;
  XF.eM21:=0;
  XF.eM22:=Scale;
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_LEFTMULTIPLY);
  pCanvas.Draw(0,0 ,TMetaFile(Visualization_WMFList[I]));
  Y:=Y+TMetaFile(Visualization_WMFList[I]).Height*Scale;
  finally
  ModifyWorldTransForm(pCanvas.Handle,XF,MWT_IDENTITY);
  end;
//.
Result:=true;
except
  end;
end;



{TTCoForumFunctioning}
Constructor TTCoForumFunctioning.Create;
begin
Inherited Create(false);
end;

procedure TTCoForumFunctioning.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  ForumsList: TList;
begin 
{with TCoComponentTypeFunctionality_Create(idTCoForum) do
try
GetInstanceList(ForumsList);
try
I:=1;
repeat
  if (I MOD (10*59)) = 0
   then
    for J:=0 to ForumsList.Count-1 do with TCoForumFunctionality.Create(Integer(ForumsList[J])) do
      try
      SetNowTime;
      finally
      Release;
      end;
  Sleep(WaitInterval);
  Inc(I);
until Terminated;
finally
ForumsList.Destroy;
end;
finally
Release;
end;}
end;




var
  TCoForumFunctioning: TTCoForumFunctioning = nil;

procedure Initialize;
begin
TCoForumFunctioning:=TCoForumFunctioning.Create;
end;

procedure Finalize;
begin
TCoForumFunctioning.Free;
end;


Initialization
CoForumTypeSystem:=TCoForumTypeSystem.Create(idTCoForum,TCoForumFunctionality);

Finalization
CoForumTypeSystem.Free;

end.
