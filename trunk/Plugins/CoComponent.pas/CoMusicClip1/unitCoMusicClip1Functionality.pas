unit unitCoMusicClip1Functionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality,
  unitCoMusicClipFunctionality;


Const
  idTCoMusicClip1 = 1111133;
Type
  TCoMusicClip1TypeSystem = class(TCoComponentTypeSystem);

  TCoMusicClip1Functionality = class(TCoMusicClipAbstractFunctionality)
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



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoMusicClip1TypeSystem: TCoMusicClip1TypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoMusicClip1PanelProps;



                     

{TCoMusicClip1Functionality}
Constructor TCoMusicClip1Functionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoMusicClip1Functionality.Destroy;
begin
Inherited;
end;

function TCoMusicClip1Functionality.TPropsPanel_Create: TForm;
begin
Result:=TCoMusicClip1PanelProps.Create(idCoComponent);
end;

function TCoMusicClip1Functionality.getArtistName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  ArtistNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do ArtistNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
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
  end
 else
  Raise Exception.Create('could not WMF visualization'); //. =>
end;

procedure TCoMusicClip1Functionality.setArtistName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  ArtistNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do ArtistNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
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
  end
 else
  Raise Exception.Create('could not WMF visualization'); //. => 
end;

function TCoMusicClip1Functionality.getCompositionName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList,DetailsList1: TComponentsList;
  ArtistNameFunctionality: TBase2DVisualizationFunctionality;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do ArtistNameFunctionality:=TBase2DVisualizationFunctionality(TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)));
    with ArtistNameFunctionality do
    try
    if GetDetailsList(DetailsList1)
     then
      try
      if DetailsList1.Count < 1 then Raise Exception.Create('could not getCompositionName'); //. =>
      with TItemComponentsList(DetailsList1[0]^) do CompositionNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      with CompositionNameFunctionality do
      try
      Result:=GetStr;
      finally
      Release;
      end;
      finally
      DetailsList1.Destroy;
      end;
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

procedure TCoMusicClip1Functionality.setCompositionName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList,DetailsList1: TComponentsList;
  ArtistNameFunctionality: TBase2DVisualizationFunctionality;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getArtistName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do ArtistNameFunctionality:=TBase2DVisualizationFunctionality(TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)));
    with ArtistNameFunctionality do
    try
    if GetDetailsList(DetailsList1)
     then
      try
      if DetailsList1.Count < 1 then Raise Exception.Create('could not getCompositionName'); //. =>
      with TItemComponentsList(DetailsList1[0]^) do CompositionNameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      with CompositionNameFunctionality do
      try
      SetStr(Value);
      finally
      Release;
      end;
      finally
      DetailsList1.Destroy;
      end;
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

procedure TCoMusicClip1Functionality.LoadFromFile(const FileName: string);
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

procedure TCoMusicClip1Functionality.SaveToFile(const FileName: string);
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

procedure TCoMusicClip1Functionality.Play;
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




procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoMusicClip1TypeSystem:=TCoMusicClip1TypeSystem.Create(idTCoMusicClip1,TCoMusicClip1Functionality);

Finalization
CoMusicClip1TypeSystem.Free;

end.
