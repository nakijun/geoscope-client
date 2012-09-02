unit unitCoGMONotificationAreaFunctionality;
Interface
Uses
  Classes,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality;


Const
  idTCoGMONotificationArea = 1111146;
  NotificationAddressesTag = 1;
Type
  TCoGMONotificationAreaTypeSystem = class(TCoComponentTypeSystem);

  TCoGMONotificationAreaFunctionality = class(TCoComponentFunctionality)
  private
    function getName: string;
    procedure setName(Value: string);
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    procedure GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
    procedure GetObjectsVisibleInside(out Objects: TPtrArray);
    property Name: string read getName write setName;
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoGMONotificationAreaTypeSystem: TCoGMONotificationAreaTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoGMONotificationAreaPanelProps;



                     

{TCoGMONotificationAreaFunctionality}
Constructor TCoGMONotificationAreaFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoGMONotificationAreaFunctionality.Destroy;
begin
Inherited;
end;

function TCoGMONotificationAreaFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoGMONotificationAreaPanelProps.Create(idCoComponent);
end;

function TCoGMONotificationAreaFunctionality.getName: string;
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

procedure TCoGMONotificationAreaFunctionality.setName(Value: string);
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

procedure TCoGMONotificationAreaFunctionality.GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
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

procedure TCoGMONotificationAreaFunctionality.GetObjectsVisibleInside(out Objects: TPtrArray);
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


procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoGMONotificationAreaTypeSystem:=TCoGMONotificationAreaTypeSystem.Create(idTCoGMONotificationArea,TCoGMONotificationAreaFunctionality);

Finalization
CoGMONotificationAreaTypeSystem.Free;

end.
