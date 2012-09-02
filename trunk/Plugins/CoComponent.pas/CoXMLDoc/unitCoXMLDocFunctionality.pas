unit unitCoXMLDocFunctionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality,
  unitCoMusicClipFunctionality;


Const
  idTCoXMLDoc = 1111141;
Type
  TCoXMLDocTypeSystem = class(TCoComponentTypeSystem);

  TCoXMLDocFunctionality = class(TCoComponentFunctionality)
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
  CoXMLDocTypeSystem: TCoXMLDocTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoXMLDocPanelProps;



                     

{TCoXMLDocFunctionality}
Constructor TCoXMLDocFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoXMLDocFunctionality.Destroy;
begin
Inherited;
end;

function TCoXMLDocFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoXMLDocPanelProps.Create(idCoComponent);
end;

function TCoXMLDocFunctionality.getName: string;
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

procedure TCoXMLDocFunctionality.setName(Value: string);
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

procedure TCoXMLDocFunctionality.LoadFromFile(const FileName: string);
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

procedure TCoXMLDocFunctionality.SaveToFile(const FileName: string);
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

procedure TCoXMLDocFunctionality.Open;
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
CoXMLDocTypeSystem:=TCoXMLDocTypeSystem.Create(idTCoXMLDoc,TCoXMLDocFunctionality);

Finalization
CoXMLDocTypeSystem.Free;

end.
