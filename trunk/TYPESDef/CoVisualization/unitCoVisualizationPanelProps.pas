unit unitCoVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls;

type
  TCoVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    sbShoaAtCenter: TSpeedButton;
    sbPackUnpack: TSpeedButton;
    tvComponents: TTreeView;
    procedure sbShoaAtCenterClick(Sender: TObject);
    procedure sbPackUnpackClick(Sender: TObject);
    procedure tvComponentsDblClick(Sender: TObject);
  private
    { Private declarations }
    tvComponents_ItemsList: TList;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure tvComponents_Clear();
    procedure tvComponents_Update();
    procedure SetVisualizationAsContainer();
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  GlobalSpaceDefines;
  
{$R *.DFM}

Constructor TCoVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
//.
tvComponents_ItemsList:=TList.Create;
tvComponents.Images:=TypesImageList;
//.
if flReadOnly then DisableControls;
Update;
end;

destructor TCoVisualizationPanelProps.Destroy;
begin
tvComponents_Clear();
tvComponents_ItemsList.Free;
Inherited;
end;

procedure TCoVisualizationPanelProps._Update;
begin
Inherited;
if TCoVisualizationFunctionality(ObjFunctionality).IsPacked
 then begin
  tvComponents_Update(); 
  tvComponents.Enabled:=true;
  sbPackUnpack.Caption:='Un-pack'
  end
 else begin
  tvComponents_Clear();
  sbPackUnpack.Caption:='Pack';
  tvComponents.Enabled:=false;
  end;
end;

procedure TCoVisualizationPanelProps.tvComponents_Clear();
var
  I: integer;
  ptrRemoveItem: pointer;
begin
for I:=0 to tvComponents_ItemsList.Count-1 do begin
  ptrRemoveItem:=tvComponents_ItemsList[I];
  FreeMem(ptrRemoveItem,SizeOf(TItemComponentsList));
  end;
tvComponents_ItemsList.Clear;
tvComponents.Items.Clear;
end;

procedure TCoVisualizationPanelProps.tvComponents_Update();
var
  SpacePtr: pointer;
  SpaceSize: integer;

  procedure ProcessObj(const ptrObj: TPtr; const Node: TTreeNode);
  var
    Obj: TSpaceObj;
    Info: string;
    ImageIndex: integer;
    SubNode: TTreeNode;
    ptrNewItem: pointer;
    ptrOwnerObj: TPtr;
  begin
  Obj:=TSpaceObj(Pointer(Integer(SpacePtr)+ptrObj)^);
  with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  Info:=TypeFunctionality.Name;
  if (Name <> '') then Info:=Info+'('+Name+')';
  ImageIndex:=TypeFunctionality.ImageList_Index;
  finally
  Release;
  end;
  //. создаем и заполняем новый узел
  SubNode:=tvComponents.Items.AddChild(Node,Info);
  SubNode.ImageIndex:=ImageIndex;
  SubNode.SelectedIndex:=SubNode.ImageIndex;
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  tvComponents_ItemsList.Add(ptrNewItem);
  with TItemComponentsList(ptrNewItem^) do begin
  idTComponent:=Obj.idTObj;
  idComponent:=Obj.idObj;
  end;
  SubNode.Data:=ptrNewItem;
  //. process own objects ...
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    ProcessObj(ptrOwnerObj,SubNode);
    //.
    ptrOwnerObj:=TPtr(Pointer(Integer(SpacePtr)+ptrOwnerObj)^);
    end;
  end;

var
  MS: TMemoryStream;
  ptrObj: integer;
  ptr: pointer;
begin
tvComponents.Items.BeginUpdate;
try
tvComponents_Clear();
//.
TCoVisualizationFunctionality(ObjFunctionality).GetSpace(MS);
try
SpaceSize:=MS.Size;
if (SpaceSize > 0)
 then begin
  GetMem(SpacePtr,SpaceSize);
  try
  MS.Position:=0;
  MS.Read(SpacePtr^,SpaceSize);
  //.
  ptrObj:=0;
  while (ptrObj <> nilPtr) do begin
    ProcessObj(ptrObj,nil);
    //. next
    ptr:=Pointer(Integer(SpacePtr)+ptrObj);
    ptrObj:=TPtr(ptr^);
    end;
  finally
  FreeMem(SpacePtr,SpaceSize);
  end;
  end;
finally
MS.Destroy;
end;
finally
tvComponents.Items.EndUpdate;
end;
end;

procedure TCoVisualizationPanelProps.SetVisualizationAsContainer();
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  P0,P1: TPoint;
  NodesCount: integer;
  X,Y, X1,Y1: double;
  BA: TByteArray;
  BAPtr: pointer;
begin
if (NOT TCoVisualizationFunctionality(ObjFunctionality).IsPacked) then Raise Exception.Create('Visualization is not packed'); //. =>
ptrObj:=TCoVisualizationFunctionality(ObjFunctionality).Ptr;
with TCoVisualizationFunctionality(ObjFunctionality) do begin
Space.ReadObj(Obj,SizeOf(Obj),ptrObj);
ptrPoint:=Obj.ptrFirstPoint;
if (ptrPoint = nilPtr) then Raise Exception.Create('could not get base point #0'); //. =>
Space.ReadObj(P0,SizeOf(P0),ptrPoint);
ptrPoint:=P0.ptrNextObj;
if (ptrPoint = nilPtr) then Raise Exception.Create('could not get base point #1'); //. =>
Space.ReadObj(P1,SizeOf(P1),ptrPoint);
//. set Nodes as MinMax container
X:=P0.X; Y:=P0.Y;
X1:=X+Sqrt(sqr(P1.X-P0.X)+sqr(P1.Y-P0.Y)); Y1:=Y;
NodesCount:=2;
SetLength(BA,SizeOf(NodesCount)+NodesCount*(SizeOf(X)+SizeOf(Y)));
BAPtr:=Pointer(@BA[0]);
Integer(BAPtr^):=NodesCount; Inc(Integer(BAPtr),SizeOf(NodesCount));
Double(BAPtr^):=X; Inc(Integer(BAPtr),SizeOf(X));
Double(BAPtr^):=Y; Inc(Integer(BAPtr),SizeOf(Y));
Double(BAPtr^):=X1; Inc(Integer(BAPtr),SizeOf(X));
Double(BAPtr^):=Y1; Inc(Integer(BAPtr),SizeOf(Y));
//.
SetNodes(BA,Obj.Width);
end;
end;

procedure TCoVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCoVisualizationPanelProps.Controls_ClearPropData;
begin
sbPackUnpack.Caption:='';
end;

procedure TCoVisualizationPanelProps.sbShoaAtCenterClick(Sender: TObject);
begin
if TCoVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TCoVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TCoVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TCoVisualizationPanelProps.sbPackUnpackClick(Sender: TObject);
var
  R: integer;
begin
if TCoVisualizationFunctionality(ObjFunctionality).IsPacked
 then begin
  R:=MessageDlg('Set visualization coordinates as a container first?', mtConfirmation, mbYesNoCancel, 0);
  if (R = mrYes)
   then SetVisualizationAsContainer()
   else
    if (R = mrCancel) then Exit; //. ->
  TCoVisualizationFunctionality(ObjFunctionality).UnPack();
  end
 else begin
  TCoVisualizationFunctionality(ObjFunctionality).Pack();
  end;
end;


procedure TCoVisualizationPanelProps.tvComponentsDblClick(Sender: TObject);
var
  ptrComponentItem: pointer;
begin
///?
Exit; //. ->
if (TPtr(tvComponents.Selected.Data) = nilPtr) then Exit; //. ->
ptrComponentItem:=tvComponents.Selected.Data;
with TItemComponentsList(ptrComponentItem^) do with TComponentFunctionality_Create(idTComponent,idComponent) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
flFreeOnClose:=false;
Left:=Self.Left+Round((Self.Width-Width)/2);
Top:=Self.Top+Self.Height-Height-10;
Show;
end;
finally
Release;
end;
tvComponents.Items.BeginUpdate;
try
tvComponents.Selected.Expanded:=NOT tvComponents.Selected.Expanded;
finally
tvComponents.Items.EndUpdate;
end;
end;

end.
