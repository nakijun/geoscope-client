unit unitCoPluginFunctionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality;


Const
  PluginsFolder = 'Plugins';
  idTCoPlugin = 1111136;
Type
  TCoPluginTypeSystem = class(TCoComponentTypeSystem);

  TCoPluginFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    function getName: string;
    procedure setName(Value: string);
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure LoadFromFile(const FileName: string);
    procedure SaveToFile(var FileName: string);
    procedure Load; 
    property Name: string read getName write setName;
    property Info: string read getInfo write setInfo;
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoPluginTypeSystem: TCoPluginTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoPluginPanelProps;



                     

{TCoPluginFunctionality}
Constructor TCoPluginFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoPluginFunctionality.Destroy;
begin
Inherited;
end;

function TCoPluginFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoPluginPanelProps.Create(idCoComponent);
end;

function TCoPluginFunctionality.getName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
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
  Raise Exception.Create('could not WMF visualization'); //. =>
end;

procedure TCoPluginFunctionality.setName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
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
  Raise Exception.Create('could not WMF visualization'); //. => 
end;

function TCoPluginFunctionality.getInfo: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList,DetailsList1: TComponentsList;
  NameFunctionality: TBase2DVisualizationFunctionality;
  InfoFunctionality: TTTFVisualizationFunctionality;
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
    if DetailsList.Count < 1 then Raise Exception.Create('could not getName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do NameFunctionality:=TBase2DVisualizationFunctionality(TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)));
    with NameFunctionality do
    try
    if GetDetailsList(DetailsList1)
     then
      try
      if DetailsList1.Count < 1 then Raise Exception.Create('could not getInfo'); //. =>
      with TItemComponentsList(DetailsList1[0]^) do InfoFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      with InfoFunctionality do
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

procedure TCoPluginFunctionality.setInfo(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList,DetailsList1: TComponentsList;
  NameFunctionality: TBase2DVisualizationFunctionality;
  InfoFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTWMFVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 1 then Raise Exception.Create('could not getName'); //. =>
    with TItemComponentsList(DetailsList[0]^) do NameFunctionality:=TBase2DVisualizationFunctionality(TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)));
    with NameFunctionality do
    try
    if GetDetailsList(DetailsList1)
     then
      try
      if DetailsList1.Count < 1 then Raise Exception.Create('could not getInfo'); //. =>
      with TItemComponentsList(DetailsList1[0]^) do InfoFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
      with InfoFunctionality do
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

procedure TCoPluginFunctionality.LoadFromFile(const FileName: string);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  InfoFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTDATAFile, idTComponent,idComponent)
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with DATAFileFunctionality do
  try
  LoadFromFile(FileName);
  Self.Name:=ExtractFileName(FileName);
  Info:=Name;
  finally
  Release;
  end;
  end
 else
  Raise Exception.Create('could not get DATAFile component'); //. =>
end;

procedure TCoPluginFunctionality.SaveToFile(var FileName: string);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  InfoFunctionality: TTTFVisualizationFunctionality;
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
  end
 else
  Raise Exception.Create('could not get DATAFile component'); //. =>
end;



procedure TCoPluginFunctionality.Load;
var
  PN: string;
  PluginFileName: string;
begin
PN:=Name;
PluginFileName:=ChangeFileExt(PluginsFolder+'\'+PN,'');
SaveToFile(PluginFileName);
ProxySpace__Plugins_Add(PN);
end;




procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoPluginTypeSystem:=TCoPluginTypeSystem.Create(idTCoPlugin,TCoPluginFunctionality);

Finalization
CoPluginTypeSystem.Free;

end.
