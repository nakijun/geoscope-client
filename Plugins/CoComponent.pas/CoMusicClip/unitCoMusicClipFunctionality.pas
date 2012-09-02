unit unitCoMusicClipFunctionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality;


Const                                   
  idTCoMusicClip = 1111119;
Type
  TCoMusicClipTypeSystem = class(TCoComponentTypeSystem);

  TCoMusicClipAbstractFunctionality = class(TCoComponentFunctionality)
  public
    function getArtistName: string; virtual; abstract;
    procedure setArtistName(Value: string); virtual; abstract;
    function getCompositionName: string; virtual; abstract;
    procedure setCompositionName(Value: string); virtual; abstract;
    procedure Play; virtual; abstract;
    property ArtistName: string read getArtistName write setArtistName;
    property CompositionName: string read getCompositionName write setCompositionName;
  end;

  TCoMusicClipFunctionality = class(TCoMusicClipAbstractFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    function getArtistName: string; override;
    procedure setArtistName(Value: string); override;
    function getCompositionName: string; override;
    procedure setCompositionName(Value: string); override;
    procedure LoadFromFile(const FileName: string); override;
    procedure SaveToFile(const FileName: string); override;
    procedure Play; override;
    property ArtistName: string read getArtistName write setArtistName;
    property CompositionName: string read getCompositionName write setCompositionName;
  end;

  TTCoMusicClipFunctioning = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;


  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoMusicClipTypeSystem: TCoMusicClipTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoMusicClipPanelProps;





{TCoMusicClipFunctionality}
Constructor TCoMusicClipFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoMusicClipFunctionality.Destroy;
begin
Inherited;
end;

function TCoMusicClipFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoMusicClipPanelProps.Create(idCoComponent);
end;

function TCoMusicClipFunctionality.getArtistName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  ArtistNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTTTFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 2 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[1]^) do ArtistNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with ArtistNameFunctionality do
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

procedure TCoMusicClipFunctionality.setArtistName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  ArtistNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTTTFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 2 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[1]^) do ArtistNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with ArtistNameFunctionality do
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

function TCoMusicClipFunctionality.getCompositionName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTTTFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getCompositionName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do CompositionNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with CompositionNameFunctionality do
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

procedure TCoMusicClipFunctionality.setCompositionName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTTTFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getCompositionName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do CompositionNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with CompositionNameFunctionality do
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

procedure TCoMusicClipFunctionality.LoadFromFile(const FileName: string);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
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
  Raise Exception.Create('could not get DATAFile component'); //. =>
end;

procedure TCoMusicClipFunctionality.SaveToFile(const FileName: string);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  FN: string;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  FN:=FileName;
  SaveToFile(FN);
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get DATAFile component'); //. =>
end;

procedure TCoMusicClipFunctionality.Play;
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  Activate;
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get DATAFile component'); //. =>
end;




{TTCoMusicClipFunctioning}
Constructor TTCoMusicClipFunctioning.Create;
begin
Inherited Create(false);
end;

procedure TTCoMusicClipFunctioning.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  MusicClipsList: TList;
begin 
{with TCoComponentTypeFunctionality_Create(idTCoMusicClip) do
try
GetInstanceList(MusicClipsList);
try
I:=1;
repeat
  if (I MOD (10*59)) = 0
   then
    for J:=0 to MusicClipsList.Count-1 do with TCoMusicClipFunctionality.Create(Integer(MusicClipsList[J])) do
      try
      SetNowTime;
      finally
      Release;
      end;
  Sleep(WaitInterval);
  Inc(I);
until Terminated;
finally
MusicClipsList.Destroy;
end;
finally
Release;
end;}
end;



var
  TCoMusicClipFunctioning: TTCoMusicClipFunctioning = nil;

procedure Initialize;
begin
TCoMusicClipFunctioning:=TCoMusicClipFunctioning.Create;
end;

procedure Finalize;
begin
TCoMusicClipFunctioning.Free;
end;


Initialization
CoMusicClipTypeSystem:=TCoMusicClipTypeSystem.Create(idTCoMusicClip,TCoMusicClipFunctionality);

Finalization
CoMusicClipTypeSystem.Free;

end.
