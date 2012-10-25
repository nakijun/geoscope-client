unit unitCoPhotoFunctionality;
Interface
Uses
  Classes,
  DBClient,
  Graphics,
  Forms,
  FunctionalityImport,
  CoFunctionality;

                
Const
  idTCoPhoto = 1111131;
Type
  TCoPhotoTypeSystem = class(TCoComponentTypeSystem);

  TCoPhotoFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    function getName: string;
    procedure setName(Value: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(var FileName: string);
    procedure GetPreview(out Preview: TBitmap);
    property Name: string read getName write setName;
  end;

  TTCoPhotoFunctioning = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;


  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoPhotoTypeSystem: TCoPhotoTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  JPEG,
  unitCoPhotoPanelProps;





{TCoPhotoFunctionality}
Constructor TCoPhotoFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
end;

Destructor TCoPhotoFunctionality.Destroy;
begin
Inherited;
end;

function TCoPhotoFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoPhotoPanelProps.Create(idCoComponent);
end;

function TCoPhotoFunctionality.getName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTPictureVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not get Name'); //. =>
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
  end
 else
  Raise Exception.Create('could not get Picture-visualization'); //. =>
end;

procedure TCoPhotoFunctionality.setName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTPictureVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not get Name'); //. =>
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
  end
 else
  Raise Exception.Create('could not get Picture-visualization'); //. =>
end;

procedure TCoPhotoFunctionality.LoadFromFile(const FileName: string);
const
  TempFolder = 'TempDATA';
  MaxSizeValue = 200;
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  VisualizationFunctionality: TPictureVisualizationFunctionality;
  JPEG: TJPEGImage;
  MaxSize: integer;
  K: Extended;
  BMP: TBitmap;
  TempFile: string;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  LoadFromFile(FileName);
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get data-file'); //. =>
//. load thumbnail image into the map
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTPictureVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TPictureVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  JPEG:=TJPEGImage.Create;
  with JPEG do
  try
  LoadFromFile(FileName);
  MaxSize:=Width;
  if Height > MaxSize then MaxSize:=Height;
  if MaxSize > MaxSizeValue
   then K:=MaxSizeValue/MaxSize
   else K:=1;
  BMP:=TBitmap.Create;
  with BMP do
  try
  Width:=Round(JPEG.Width*K);
  Height:=Round(JPEG.Height*K);
  Canvas.StretchDraw(Rect(0,0,Width,Height), JPEG);
  JPEG.Assign(BMP);
  finally
  Destroy;
  end;
  TempFile:=GetCurrentDir+'\'+TempFolder+'\'+'PhotoSmallImage('+FormatDateTime('YYYYMMDDHHNNSSZZZ',Now)+').jpeg';
  SaveToFile(TempFile);
  VisualizationFunctionality.LoadFromFile(TempFile);
  finally
  Destroy;
  end;
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get Picture-visualization'); //. =>
end;

procedure TCoPhotoFunctionality.GetPreview(out Preview: TBitmap);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TPictureVisualizationFunctionality;
begin
Preview:=nil;
try
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTPictureVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TPictureVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  VisualizationFunctionality.GetBMP1(Preview);
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get Picture-visualization'); //. =>
except
  Preview.Free;
  Preview:=nil;
  Raise; //. =>
  end;
end;

procedure TCoPhotoFunctionality.SaveToFile(var FileName: string);
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
  SaveToFile(FileName);
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





{TTCoPhotoFunctioning}
Constructor TTCoPhotoFunctioning.Create;
begin
Inherited Create(false);
end;

procedure TTCoPhotoFunctioning.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  PhotosList: TList;
begin 
{with TCoComponentTypeFunctionality_Create(idTCoPhoto) do
try
GetInstanceList(PhotosList);
try
I:=1;
repeat
  if (I MOD (10*59)) = 0
   then
    for J:=0 to PhotosList.Count-1 do with TCoPhotoFunctionality.Create(Integer(PhotosList[J])) do
      try
      SetNowTime;
      finally
      Release;
      end;
  Sleep(WaitInterval);
  Inc(I);
until Terminated;
finally
PhotosList.Destroy;
end;
finally
Release;
end;}
end;



var
  TCoPhotoFunctioning: TTCoPhotoFunctioning = nil;

procedure Initialize;
begin
TCoPhotoFunctioning:=TCoPhotoFunctioning.Create;
end;

procedure Finalize;
begin
TCoPhotoFunctioning.Free;
end;


Initialization
CoPhotoTypeSystem:=TCoPhotoTypeSystem.Create(idTCoPhoto,TCoPhotoFunctionality);

Finalization
CoPhotoTypeSystem.Free;

end.
