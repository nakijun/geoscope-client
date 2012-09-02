unit unitTransportRoutePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls, ComCtrls, Menus ,unitTTransportNode_InstanceList;

type
  TTransportRoutePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    RxLabel5: TRxLabel;          
    edName: TEdit;
    RxLabel2: TRxLabel;           
    RxLabel3: TRxLabel;
    cbTransportType: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    NodesList: TListView;
    Bevel1: TBevel;
    NodesListPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    cbValid: TCheckBox;
    RxLabel4: TRxLabel;
    edRemarks: TEdit;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure cbTransportTypeChange(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure NodesListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure NodesListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N1Click(Sender: TObject);
    procedure NodesListDblClick(Sender: TObject);
    procedure edRemarksKeyPress(Sender: TObject; var Key: Char);
    procedure cbValidClick(Sender: TObject);
  private
    { Private declarations }
    NodeItemsList: TRouteNodesList;
    fmTTransportNode_InstanceList: TfmTTransportNode_InstanceList;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;

    procedure NodesListClear;
    procedure NodesList_Item__Update(const Index: integer);
    procedure NodesListUpdate;
    procedure NodesList_RemoveSelectedItem;
    procedure NodesList_ExchangeItems(SrsIndex,DistIndex: integer);
    procedure NodesList__SelectedItem_GetTimeTable;
  end;

implementation
Uses
  unitTransportRouteNodePanelProps;

{$R *.DFM}

Constructor TTransportRoutePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
NodesList.SmallImages:=Types_ImageList;
Update;
end;

destructor TTransportRoutePanelProps.Destroy;
begin
fmTTransportNode_InstanceList.Free;
NodesListClear;
Inherited;
end;

procedure TTransportRoutePanelProps._Update;
var
  I: integer;
  idTTransport: integer;
  id: integer;
begin
Inherited;
edName.Text:=ObjFunctionality.Name;
cbValid.Checked:=TTransportRouteFunctionality(ObjFunctionality).Valid;
//. getting TransportType
idTTransport:=TTransportRouteFunctionality(ObjFunctionality).idTTransport;
edRemarks.Text:=TTransportRouteFunctionality(ObjFunctionality).Remarks;
//. подготавливаем список узлов
NodesListUpdate;
end;

procedure TTransportRoutePanelProps.NodesListClear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
NodeItemsList.Free;
NodeItemsList:=nil;
with NodesList.Items do begin
BeginUpdate;
Clear;
EndUpdate;
end;
end;

procedure TTransportRoutePanelProps.NodesList_Item__Update(const Index: integer);
var
  TransportNodeFunctionality: TTransportNodeFunctionality;
  S: string;
begin
with TItemRouteNodesList(NodeItemsList[Index]^) do begin
with NodesList.Items[Index] do begin
TransportNodeFunctionality:=TTransportNodeFunctionality(TComponentFunctionality_Create(idTTransportNode,idNode));
with TransportNodeFunctionality do begin
Caption:=Name;
ImageIndex:=TypeFunctionality.ImageList_Index;
SubItems.Add(IntToStr(TTransportRouteFunctionality(ObjFunctionality).Nodes__Node_DistanceBefore(idItem)));
S:=TTransportRouteFunctionality(ObjFunctionality).Nodes__Node_OrderPrice(idItem);
if S = '' then S:='---';
SubItems.Add(S);
Release;
end;
end;
end;
end;

procedure TTransportRoutePanelProps.NodesListUpdate;
var
  I: integer;
begin
NodesListClear;
TTransportRouteFunctionality(ObjFunctionality).Nodes_GetList(NodeItemsList);
with NodeItemsList do begin
NodesList.Items.BeginUpdate;
for I:=0 to Count-1 do begin
  NodesList.Items.Add;
  NodesList_Item__Update(I);
  end;
NodesList.Items.EndUpdate;
end;
end;

procedure TTransportRoutePanelProps.NodesList__SelectedItem_GetTimeTable;
begin
if NodesList.Selected = nil then Exit;
with TfmTransportRouteNodePanelProps.Create(TTransportRouteFunctionality(ObjFunctionality),TItemRouteNodesList(NodeItemsList[NodesList.Selected.Index]^).idItem) do begin
ShowModal;
Destroy;
end;
end;

procedure TTransportRoutePanelProps.NodesList_RemoveSelectedItem;
var
  RemoveItem: TListItem;
  RemoveIndex: integer;
  ptrRemoveItem: pointer;
begin
if NodesList.Selected = nil then Exit;
RemoveItem:=NodesList.Selected;
Updater.Disable;
try
TTransportRouteFunctionality(ObjFunctionality).Nodes_Remove(TItemRouteNodesList(NodeItemsList[RemoveItem.Index]^).idItem);
except
  Updater.Enabled;
  Raise; //.=>
  end;
NodeItemsList.Delete(RemoveItem.Index);
RemoveItem.Delete;
end;

procedure TTransportRoutePanelProps.NodesList_ExchangeItems(SrsIndex,DistIndex: integer);
var
  S,S1,S2: string;
  SI: TItemRouteNodesList;
  I,Index: integer;
begin
with NodesList do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit;
Items.BeginUpdate;
SI:=TItemRouteNodesList(NodeItemsList[SrsIndex]^);
S:=Items[SrsIndex].Caption;
Index:=Items[SrsIndex].ImageIndex;
S1:=Items[SrsIndex].SubItems[0];
S2:=Items[SrsIndex].SubItems[1];
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    TItemRouteNodesList(NodeItemsList[I]^):=TItemRouteNodesList(NodeItemsList[I-1]^);
    Updater.Disable;
    try
    TTransportRouteFunctionality(ObjFunctionality).Nodes_ChangeNodeOrder(TItemRouteNodesList(NodeItemsList[I]^).idItem, I);
    except
      Updater.Enabled;
      Raise; //.=>
      end;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Items[I].SubItems[0]:=Items[I-1].SubItems[0];
    Items[I].SubItems[1]:=Items[I-1].SubItems[1];
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    TItemRouteNodesList(NodeItemsList[I]^):=TItemRouteNodesList(NodeItemsList[I+1]^);
    Updater.Disable;
    try
    TTransportRouteFunctionality(ObjFunctionality).Nodes_ChangeNodeOrder(TItemRouteNodesList(NodeItemsList[I]^).idItem, I);
    except
      Updater.Enabled;
      Raise; //.=>
      end;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Items[I].SubItems[0]:=Items[I+1].SubItems[0];
    Items[I].SubItems[1]:=Items[I+1].SubItems[1];
    Inc(I);
    end;
  end;
TItemRouteNodesList(NodeItemsList[DistIndex]^):=SI;
Updater.Disable;
try
TTransportRouteFunctionality(ObjFunctionality).Nodes_ChangeNodeOrder(TItemRouteNodesList(NodeItemsList[DistIndex]^).idItem, DistIndex);
except
  Updater.Enabled;
  Raise; //.=>
  end;
Items[DistIndex].Caption:=S;
Items[DistIndex].ImageIndex:=Index;
Items[DistIndex].SubItems[0]:=S1;
Items[DistIndex].SubItems[1]:=S2;
Items.EndUpdate;
end;
end;


procedure TTransportRoutePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTransportRoutePanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;

procedure TTransportRoutePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  ObjFunctionality.Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TTransportRoutePanelProps.cbTransportTypeChange(Sender: TObject);
begin
Updater.Disable;
try
TTransportRouteFunctionality(ObjFunctionality).idTTransport:=Integer(cbTransportType.Items.Objects[cbTransportType.ItemIndex]);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TTransportRoutePanelProps.N2Click(Sender: TObject);
begin
NodesList_RemoveSelectedItem;
end;

procedure TTransportRoutePanelProps.NodesListDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Item: TListItem;
  idTransportNode: integer;
  idItem: integer;
begin
if Sender = Source
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if Item = nil then Exit;
  NodesList_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end
 else
  if (Source is TListView) AND ((Source as TListView).Selected <> nil)
   then begin
    idTransportNode:=Integer((Source as TListView).Selected.Data);
    if TTransportRouteFunctionality(ObjFunctionality).Nodes_IsNodeExist(idTransportNode)
     then begin
      ShowMessage('! such node already exist');
      Exit;
      end;
    //. вставляем транспортый узел
    Updater.Disable;
    try
    idItem:=TTransportRouteFunctionality(ObjFunctionality).Nodes_Insert(idTransportNode);
    except
      Updater.Enabled;
      Raise; //.=>
      end;
    NodeItemsList.AddNode(idTransportNode,idItem);
    NodesList_Item__Update(NodesList.Items.Add.Index);
    end
end;

procedure TTransportRoutePanelProps.NodesListDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TTransportRoutePanelProps.N1Click(Sender: TObject);
begin
if fmTTransportNode_InstanceList = nil then fmTTransportNode_InstanceList:=TfmTTransportNode_InstanceList.Create;
fmTTransportNode_InstanceList.Show;
end;

procedure TTransportRoutePanelProps.NodesListDblClick(Sender: TObject);
begin
NodesList__SelectedItem_GetTimeTable;
end;

procedure TTransportRoutePanelProps.edRemarksKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TTransportRouteFunctionality(ObjFunctionality).Remarks:=edRemarks.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TTransportRoutePanelProps.cbValidClick(Sender: TObject);
begin
Updater.Disable;
try
TTransportRouteFunctionality(ObjFunctionality).Valid:=cbValid.Checked;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

end.
