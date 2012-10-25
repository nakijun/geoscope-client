unit unitCoMusicCollectionFunctionality;
Interface
Uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality,
  unitCoMusicClipFunctionality,
  unitCoMusicClip1Functionality;

                                
Const
  idTCoMusicCollection = 1111130;
Type
  TCoMusicCollectionTypeSystem = class(TCoComponentTypeSystem);

  TCoMusicCollectionFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    function getName: string;
    procedure setName(Value: string);
    procedure GetClipsList(out List: TList);
    property Name: string read getName write setName;
  end;

  TTCoMusicCollectionFunctioning = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;




//. -----------------------------------------------------------




  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoMusicCollectionTypeSystem: TCoMusicCollectionTypeSystem = nil;

Implementation
Uses
  TypesDefines,
  unitCoMusicCollectionPanelProps;



{TCoMusicCollectionFunctionality}
Constructor TCoMusicCollectionFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
end;

Destructor TCoMusicCollectionFunctionality.Destroy;
begin
Inherited;
end;

function TCoMusicCollectionFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoMusicCollectionPanelProps.Create(idCoComponent);
end;

function TCoMusicCollectionFunctionality.getName: string;
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  I: integer;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
Result:='?';
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 2 then Raise Exception.Create('could not getName'); //. =>
    I:=0; while TItemComponentsList(DetailsList[I]^).idTComponent <> idTTTFVisualization do Inc(I); 
    with TItemComponentsList(DetailsList[I]^) do NameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
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

procedure TCoMusicCollectionFunctionality.setName(Value: string);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  I: integer;
  NameFunctionality: TTTFVisualizationFunctionality;
begin
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 2 then Raise Exception.Create('could not getName'); //. =>
    I:=0; while TItemComponentsList(DetailsList[I]^).idTComponent <> idTTTFVisualization do Inc(I); 
    with TItemComponentsList(DetailsList[I]^) do NameFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
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

procedure TCoMusicCollectionFunctionality.GetClipsList(out List: TList);
var
  idTComponent,idComponent: integer;
  VisualizationFunctionality: TBase2DVisualizationFunctionality;
  DetailsList: TComponentsList;
  CELLFunctionality: TCELLVisualizationFunctionality;
  IOList: TComponentsList;
  I: integer;
begin
List:=TList.Create;
try
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTVisualization, idTComponent,idComponent)
 then begin
  VisualizationFunctionality:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  with VisualizationFunctionality do
  try
  if GetDetailsList(DetailsList)
   then
    try
    if DetailsList.Count < 2 then Raise Exception.Create('could not getName'); //. =>
    I:=0; while TItemComponentsList(DetailsList[I]^).idTComponent <> idTCELLVisualization do Inc(I);
    with TItemComponentsList(DetailsList[I]^) do CELLFunctionality:=TCELLVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
    with CELLFunctionality do
    try
    GetInsideObjectsList1(idTCoMusicClip, false, IOList);
    try
    for I:=0 to IOList.Count-1 do List.Add(Pointer(TItemComponentsList(IOList[I]^).idComponent));
    finally
    IOList.Destroy;
    end;
    GetInsideObjectsList1(idTCoMusicClip1, false, IOList);
    try
    for I:=0 to IOList.Count-1 do List.Add(Pointer(TItemComponentsList(IOList[I]^).idComponent));
    finally
    IOList.Destroy;
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
except
  List.Destroy;
  List:=nil;
  Raise; //. =>
  end;
end;



{TTCoMusicCollectionFunctioning}
Constructor TTCoMusicCollectionFunctioning.Create;
begin
Inherited Create(false);
end;

procedure TTCoMusicCollectionFunctioning.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  ForumsList: TList;
begin 
{with TCoComponentTypeFunctionality_Create(idTCoMusicCollection) do
try
GetInstanceList(ForumsList);
try
I:=1;
repeat
  if (I MOD (10*59)) = 0
   then
    for J:=0 to ForumsList.Count-1 do with TCoMusicCollectionFunctionality.Create(Integer(ForumsList[J])) do
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
  TCoMusicCollectionFunctioning: TTCoMusicCollectionFunctioning = nil;

procedure Initialize;
begin
TCoMusicCollectionFunctioning:=TCoMusicCollectionFunctioning.Create;
end;

procedure Finalize;
begin
TCoMusicCollectionFunctioning.Free;
end;


Initialization
CoMusicCollectionTypeSystem:=TCoMusicCollectionTypeSystem.Create(idTCoMusicCollection,TCoMusicCollectionFunctionality);

Finalization
CoMusicCollectionTypeSystem.Free;

end.
