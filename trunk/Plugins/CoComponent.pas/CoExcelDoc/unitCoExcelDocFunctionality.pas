unit unitCoExcelDocFunctionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality,
  unitCoMusicClipFunctionality;


Const
  idTCoExcelDoc = 1111138;
Type
  TCoExcelDocTypeSystem = class(TCoComponentTypeSystem);

  TCoExcelDocFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    function getName: string;
    procedure setName(Value: string);
    procedure LoadFromFile(const FileName: string); override;
    procedure SaveToFile(const FileName: string); override; 
    procedure Open; 
    property Name: string read getName write setName;
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoExcelDocTypeSystem: TCoExcelDocTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoExcelDocPanelProps;



                     

{TCoExcelDocFunctionality}
Constructor TCoExcelDocFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoExcelDocFunctionality.Destroy;
begin
Inherited;
end;

function TCoExcelDocFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoExcelDocPanelProps.Create(idCoComponent);
end;

function TCoExcelDocFunctionality.getName: string;
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
  end
 else
  Raise Exception.Create('could not get Picture visualization'); //. =>
end;

procedure TCoExcelDocFunctionality.setName(Value: string);
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
  end
 else
  Raise Exception.Create('could not get WMF visualization'); //. => 
end;

procedure TCoExcelDocFunctionality.LoadFromFile(const FileName: string);
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

procedure TCoExcelDocFunctionality.SaveToFile(const FileName: string);
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

procedure TCoExcelDocFunctionality.Open;
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
CoExcelDocTypeSystem:=TCoExcelDocTypeSystem.Create(idTCoExcelDoc,TCoExcelDocFunctionality);

Finalization
CoExcelDocTypeSystem.Free;

end.
