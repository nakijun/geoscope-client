unit unitCoNotificationAreaFunctionality;
Interface
Uses
  Classes,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality;


Const
  idTCoNotificationArea = 1111145;
  NotificationAddressesTag = 1;
Type
  TCoNotificationAreaTypeSystem = class(TCoComponentTypeSystem);

  TCoNotificationAreaFunctionality = class(TCoComponentFunctionality)
  private
    function getName: string;
    procedure setName(Value: string);
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    procedure GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
    procedure GetObjectsVisibleInside(out Objects: TPtrArray);
    function getNotificationAddresses: string;
    procedure setNotificationAddresses(Value: string);
    property Name: string read getName write setName;
    property NotificationAddresses: string read getNotificationAddresses write setNotificationAddresses;
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoNotificationAreaTypeSystem: TCoNotificationAreaTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoNotificationAreaPanelProps;



                     

{TCoNotificationAreaFunctionality}
Constructor TCoNotificationAreaFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoNotificationAreaFunctionality.Destroy;
begin
Inherited;
end;

function TCoNotificationAreaFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoNotificationAreaPanelProps.Create(idCoComponent);
end;

function TCoNotificationAreaFunctionality.getName: string;
var
  idT,TypeMarkerID: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCoComponentTypeMarker, idT,TypeMarkerID))
 then with TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idT,TypeMarkerID)) do
  try
  Result:=Name;
  finally
  Release;
  end
 else Raise Exception.Create('type-marker is not found'); //. =>
end;

procedure TCoNotificationAreaFunctionality.setName(Value: string);
var
  idT,TypeMarkerID: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCoComponentTypeMarker, idT,TypeMarkerID))
 then with TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idT,TypeMarkerID)) do
  try
  Name:=Value;
  //. notify update operation
  TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
  finally
  Release;
  end
 else Raise Exception.Create('type-marker is not found'); //. =>
end;

procedure TCoNotificationAreaFunctionality.GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
var
  CL: TComponentsList;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponents(TBase2DVisualizationFunctionality,CL))
 then
  try
  VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
  VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('visualization-component is not found'); //. =>
end;

procedure TCoNotificationAreaFunctionality.GetObjectsVisibleInside(out Objects: TPtrArray);
type //. do not midify it (transferred from uniReflector.pas)

  TObjWinRefl = record
    Xmn,Ymn,
    Xmx,Ymx: smallint;
  end;

  TItemLayReflect = record
    ptrNext: pointer;
    ptrObject: TPtr;
    Window: TObjWinRefl;
    ObjUpdating: TThread;
  end;

  TLayReflect = record
    ptrNext: pointer;
    flLay: boolean; 
    Objects: pointer;
    ObjectsCount: integer;
  end;
var
  VisualizationType,VisualizationID: integer;
  VisualizationPtr: TPtr;
  Lays: pointer;
  ptrLay: pointer;
  ptrItem: pointer;
  ObjCount: integer;
  ptrDestroyLay: pointer;
  ptrDestroyItem: pointer;
begin
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
VisualizationPtr:=Ptr;
finally
Release;
end;
ProxySpace__Obj_GetLaysOfVisibleObjectsInside(VisualizationPtr, Lays);
try
ObjCount:=0;
ptrLay:=Lays;
while (ptrLay <> nil) do begin
  Inc(ObjCount,TLayReflect(ptrLay^).ObjectsCount);
  ptrLay:=TLayReflect(ptrLay^).ptrNext;
  end;
SetLength(Objects,ObjCount);
ObjCount:=0;
ptrLay:=Lays;
while (ptrLay <> nil) do begin
  ptrItem:=TLayReflect(ptrLay^).Objects;
  while (ptrItem <> nil) do with TItemLayReflect(ptrItem^) do begin
    Objects[ObjCount]:=ptrObject;
    Inc(ObjCount);
    ptrItem:=ptrNext;
    end;
  ptrLay:=TLayReflect(ptrLay^).ptrNext;
  end;
finally
//. lays destroying
while (Lays <> nil) do begin
  ptrDestroyLay:=Lays;
  Lays:=TLayReflect(ptrDestroyLay^).ptrNext;
  //. lay destroying
  with TLayReflect(ptrDestroyLay^) do
  while Objects <> nil do begin
    ptrDestroyItem:=Objects;
    Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
    //. item of lay destroying
    FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
    end;
  FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
  end;
end;
end;

function TCoNotificationAreaFunctionality.getNotificationAddresses: string;
var
  idT,DescriptionID: integer;
  SL: TStringList;
begin
Result:='';
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDescription, NotificationAddressesTag, idT,DescriptionID))
 then with TDescriptionFunctionality(TComponentFunctionality_Create(idT,DescriptionID)) do
  try
  SL:=TStringList.Create;
  try
  GetValue1(SL);
  Result:=SL.Text;
  finally
  SL.Destroy;
  end;
  //. remove ending #$0D#$0A
  if (Length(Result) >= 2) then SetLength(Result,Length(Result)-2);
  finally
  Release;
  end;
end;

procedure TCoNotificationAreaFunctionality.setNotificationAddresses(Value: string);
var
  idT,DescriptionID: integer;
  SL: TStringList;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDescription, NotificationAddressesTag, idT,DescriptionID))
 then with TDescriptionFunctionality(TComponentFunctionality_Create(idT,DescriptionID)) do
  try
  SL:=TStringList.Create;
  try
  if (Value = '') then Value:=' ';
  SL.Text:=Value;
  SetValue1(SL);
  finally
  SL.Destroy;
  end;
  //. notify update operation
  TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
  finally
  Release;
  end
 else Raise Exception.Create('no description component is found'); //. =>
end;


procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoNotificationAreaTypeSystem:=TCoNotificationAreaTypeSystem.Create(idTCoNotificationArea,TCoNotificationAreaFunctionality);

Finalization
CoNotificationAreaTypeSystem.Free;

end.
