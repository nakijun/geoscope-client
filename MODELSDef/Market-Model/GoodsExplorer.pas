unit GoodsExplorer;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, ImgList, Db, Buttons, TypesDefines, TypesFunctionality, Functionality;

const
  tnIDsRelations = 'CompIDsRelations';
  tnComponents = 'Components';
  tnComponentsComponents = 'Cs_Cs';
  tnComponentObjects = 'ComponentObjects';
  
type
  TGoodsExplor = class(TForm)
    lvComponents: TListView;
    ImageList: TImageList;
    tvComponents: TTreeView;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    sbClone: TSpeedButton;
    edGoodsSearch: TEdit;
    sbGoodsSearch: TSpeedButton;
    edComponentsSearch: TEdit;
    sbComponentsSearch: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure tvComponentsEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tvComponentsChange(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton3Click(Sender: TObject);
    procedure lvComponentsDblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbCloneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvComponentsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvComponentsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sbGoodsSearchClick(Sender: TObject);
    procedure sbComponentsSearchClick(Sender: TObject);
    procedure edComponentsSearchChange(Sender: TObject);
    procedure edGoodsSearchChange(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    lvComponents_idObj: integer;

    function Component_GetLinkedObject(const idComponent: integer; var idTObj,idObj: integer): boolean;

    procedure tvComponents_Clear;
    procedure tvComponents_Update;
    procedure tvComponents__SelectedNode_AddNode;
    procedure tvComponents_DeleteSelectedNode;
    procedure tvComponents__EditNode_Post;
    procedure tvComponents_SearchByName(const strFind: string);

    procedure lvComponents_Clear;
    procedure lvComponents_Update(const idOwner: integer);
    procedure lvComponents_AddGoods;
    procedure lvComponents_InsertGoods(const idGoods: integer);
    procedure lvComponents_RemoveGoods(Item: TListItem);
    procedure lvComponents__UpdateItem(Item: TListItem);
    procedure lvComponents__Selected_Update;
    procedure lvComponents__Selected_Edit;
    procedure lvComponents_GoodsSearch(const strFind: string);
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace);
  end;

implementation

{$R *.DFM}

Constructor TGoodsExplor.Create(pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
lvComponents_idObj:=0;
end;

function TGoodsExplor.Component_GetLinkedObject(const idComponent: integer; var idTObj,idObj: integer): boolean;
begin
Result:=false;
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT idTObj,idObj FROM '+tnComponentObjects+' WHERE idComponent+0 = '+IntToStr(idComponent));
Open;
try
idTObj:=FieldValues['idTObj'];
idObj:=FieldValues['idObj'];
Result:=true;
except
  end;
Destroy;
end;
end;

procedure TGoodsExplor.tvComponents_Clear;
begin
with tvComponents do begin
Items.BeginUpdate;
Items.Clear;
Items.EndUpdate;
end;
end;

procedure TGoodsExplor.tvComponents_Update;
var
  id: integer;
  RootNode: TTreeNode;
  idComponent: integer;
  Component: TTreeNode;
  StrID: string;

  procedure TreateNodeChilds(const idObj: integer; Node: TTreeNode);
  var
    idComponent: integer;
    Component: TTreeNode;
    StrID: string;
  begin
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT '+tnIDsRelations+'.StrID,'+tnComponentsComponents+'.idComponent FROM '+tnIDsRelations+','+tnComponentsComponents+' WHERE '+tnComponentsComponents+'.idOwner+0 = '+IntToStr(idObj)+' AND '+tnComponentsComponents+'.idComponent = '+tnIDsRelations+'.ENumID ORDER BY '+tnIDsRelations+'.StrID');
  Open;
  while NOT EOF do begin
    try StrID:=FieldValues['StrID'] except StrID:='' end;
    try idComponent:=FieldValues['idComponent'] except idComponent:=0 end;
    Component:=tvComponents.Items.AddChild(Node,StrID);
    Component.Data:=pointer(idComponent);
    TreateNodeChilds(idComponent, Component);

    Next;
    end;
  Destroy;
  end;
  end;

begin
tvComponents_Clear;
tvComponents.Items.BeginUpdate;
RootNode:=tvComponents.Items.AddChild(nil,'>');
RootNode.Data:=Pointer(0);
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT '+tnIDsRelations+'.StrID,'+tnComponents+'.id FROM '+tnIDsRelations+','+tnComponents+' WHERE '+tnComponents+'.id NOT in (SELECT idComponent FROM '+tnComponentsComponents+') AND '+tnComponents+'.id = '+tnIDsRelations+'.ENumID ORDER BY '+tnIDsRelations+'.StrID');
Open;
while NOT EOF do begin
  try StrID:=FieldValues['StrID'] except StrID:='' end;
  try idComponent:=FieldValues['id'] except idComponent:=0 end;
  Component:=tvComponents.Items.AddChild(RootNode,StrID);
  Component.Data:=pointer(idComponent);
  TreateNodeChilds(idComponent, Component);

  Next;
  end;
Destroy;
end;
tvComponents.Items.EndUpdate;
end;

procedure TGoodsExplor.tvComponents__SelectedNode_AddNode;
var
  idNewComponent: integer;
begin
with tvComponents do begin
if Selected = nil then Exit;
// добавляем компонент в БД
with Space.TObjPropsQuery_Create do begin
EnterSQL('INSERT INTO '+tnComponents+' (id) VALUES(0)');
ExecSQL;
EnterSQL('SELECT Max(id) MaxID FROM '+tnComponents);
Open;
idNewComponent:=FieldValues['MaxID'];
EnterSQL('INSERT INTO '+tnIDsRelations+' (StrID,ENumID) VALUES("",'+IntToStr(idNewComponent)+')');
ExecSQL;
if Integer(Selected.Data) <> 0
 then begin
  EnterSQL('INSERT INTO '+tnComponentsComponents+' (idOwner,idComponent) VALUES('+IntToStr(Integer(Selected.Data))+','+IntToStr(idNewComponent)+')');
  ExecSQL;
  end;
Destroy;
end;
// добавляем ветку в дерево
with tvComponents.Items.AddChild(Selected,'') do begin
Data:=pointer(idNewComponent);
tvComponents.Selected.Expand(false);
EditText;
end;
end;
end;

procedure TGoodsExplor.tvComponents_DeleteSelectedNode;
var
  idDelComponent: integer;
begin
if (tvComponents.Selected = nil) OR (Integer(tvComponents.Selected.Data) = 0) then Exit;
// Удаляем компонент из БД
with tvComponents.Selected,Space.TObjPropsQuery_Create do begin
idDelComponent:=Integer(tvComponents.Selected.Data);
EnterSQL('SELECT Count(*) Cnt FROM '+tnComponentsComponents+' WHERE idOwner+0 = '+IntToStr(idDelComponent));
Open;
if FieldValues['Cnt'] > 0
 then begin
  ShowMessage('! can not destroy.');
  Destroy;
  Exit;
  end;
EnterSQL('DELETE FROM '+tnIDsRelations+' WHERE ENumID+0 = '+IntToStr(idDelComponent));
ExecSQL;
EnterSQL('DELETE FROM '+tnComponents+' WHERE id+0 = '+IntToStr(idDelComponent));
ExecSQL;
if (Parent <> nil) AND (Integer(Parent.Data) <> 0)
 then EnterSQL('DELETE FROM '+tnComponentsComponents+' WHERE (idOwner+0 = '+IntToStr(Integer(Parent.Data))+' AND idComponent+0 = '+IntToStr(idDelComponent)+')')
 else EnterSQL('DELETE FROM '+tnComponentsComponents+' WHERE idComponent+0 = '+IntToStr(idDelComponent));
ExecSQL;
Destroy;
end;
// удаление ветки дерева
tvComponents.Selected.Delete;
end;

procedure TGoodsExplor.tvComponents__EditNode_Post;
begin
end;

procedure TGoodsExplor.lvComponents_Clear;
begin
lvComponents.Items.BeginUpdate;
lvComponents.Items.Clear;
lvComponents.Items.EndUpdate;
end;

procedure TGoodsExplor.tvComponents_SearchByName(const strFind: string);
var
  id: integer;
  RootNode: TTreeNode;
  idComponent: integer;
  Component: TTreeNode;
  StrID: string;

  procedure TreateNodeChilds(const idObj: integer; Node: TTreeNode);
  var
    idComponent: integer;
    Component: TTreeNode;
    StrID: string;
  begin
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT '+tnIDsRelations+'.StrID,'+tnComponentsComponents+'.idComponent FROM '+tnIDsRelations+','+tnComponentsComponents+' WHERE '+tnComponentsComponents+'.idOwner+0 = '+IntToStr(idObj)+' AND '+tnComponentsComponents+'.idComponent = '+tnIDsRelations+'.ENumID ORDER BY '+tnIDsRelations+'.StrID');
  Open;
  while NOT EOF do begin
    try StrID:=FieldValues['StrID'] except StrID:='' end;
    try idComponent:=FieldValues['idComponent'] except idComponent:=0 end;
    Component:=tvComponents.Items.AddChild(Node,StrID);
    Component.Data:=pointer(idComponent);
    TreateNodeChilds(idComponent, Component);

    Next;
    end;
  Destroy;
  end;
  end;

begin
tvComponents_Clear;
tvComponents.Items.BeginUpdate;
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT '+tnIDsRelations+'.StrID,'+tnComponents+'.id FROM '+tnIDsRelations+','+tnComponents+' WHERE '+tnComponents+'.id = '+tnIDsRelations+'.ENumID AND '+tnIDsRelations+'.StrID LIKE "%'+strFind+'%" ORDER BY '+tnIDsRelations+'.StrID');
Open;
while NOT EOF do begin
  try StrID:=FieldValues['StrID'] except StrID:='' end;
  try idComponent:=FieldValues['id'] except idComponent:=0 end;
  Component:=tvComponents.Items.AddChild(RootNode,StrID);
  Component.Data:=pointer(idComponent);
  TreateNodeChilds(idComponent, Component);

  Next;
  end;
Destroy;
end;
tvComponents.Items.EndUpdate;
end;

procedure TGoodsExplor.lvComponents_Update(const idOwner: integer);
var
  idComponent: integer;
  idTObj,idObj: integer;
  Item: TListItem;
begin
lvComponents_Clear;
if idOwner = 0 then Exit;
lvComponents_idObj:=idOwner;
with lvComponents,Space.TObjPropsQuery_Create do begin
Items.BeginUpdate;
EnterSQL('SELECT idComponent FROM '+tnComponentsComponents+' WHERE '+tnComponentsComponents+'.idOwner+0 = '+IntToStr(lvComponents_idObj));
Open;
while NOT EOF do begin
  try idComponent:=FieldValues['idComponent'] except idComponent:=0 end;
  if Component_GetLinkedObject(idComponent, idTObj,idObj)
   then begin
    Item:=Items.Add;
    with Item do begin
    Data:=Pointer(idComponent);
    lvComponents__UpdateItem(Item);
    end;
    end;

  Next;
  end;
Destroy;
Items.EndUpdate;
end;
end;

procedure TGoodsExplor.lvComponents_AddGoods;
var
  TypeFunctionality: TTypeFunctionality;
  GoodsFunctionality: TComponentFunctionality;
  idNewGoods: integer;
  idNewComponent: integer;
  NewItem: TListItem;
begin
TypeFunctionality:=TTypeFunctionality_Create(idTGoods);
if TypeFunctionality <> nil
 then with TypeFunctionality do begin
  try
  idNewGoods:=CreateInstance;
  if lvComponents_idObj <> 0
   then with Space.TObjPropsQuery_Create do begin
    // добавляем компонент в БД
    EnterSQL('INSERT INTO '+tnComponents+' (id) VALUES(0)');
    ExecSQL;
    EnterSQL('SELECT Max(id) MaxID FROM '+tnComponents);
    Open;
    idNewComponent:=FieldValues['MaxID'];
    EnterSQL('INSERT INTO '+tnComponentsComponents+' (idOwner,idComponent) VALUES('+IntToStr(lvComponents_idObj)+','+IntToStr(idNewComponent)+')');
    ExecSQL;
    EnterSQL('INSERT INTO '+tnComponentObjects+' (idComponent,idTObj,idObj) VALUES('+IntToStr(idNewComponent)+','+IntToStr(idTGoods)+','+IntToStr(idNewGoods)+')');
    ExecSQL;
    Destroy;
    end;
  with lvComponents do begin
  Items.BeginUpdate;
  NewItem:=Items.Add;
  with NewItem do begin
  Data:=Pointer(idNewComponent);
  lvComponents__UpdateItem(NewItem);
  GoodsFunctionality:=TComponentFunctionality_Create(idNewGoods);
  if GoodsFunctionality <> nil
   then with GoodsFunctionality do begin
    with TPanelProps_Create(false, 0,nil,nilObject) do ShowModal;
    lvComponents__UpdateItem(NewItem);
    Release;
    end;
  end;
  Items.EndUpdate;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TGoodsExplor.lvComponents_InsertGoods(const idGoods: integer);
var
  idNewComponent: integer;
  NewItem: TListItem;
begin
if lvComponents_idObj <> 0
 then begin
  with Space.TObjPropsQuery_Create do begin
  // добавляем компонент в БД
  EnterSQL('INSERT INTO '+tnComponents+' (id) VALUES(0)');
  ExecSQL;
  EnterSQL('SELECT Max(id) MaxID FROM '+tnComponents);
  Open;
  idNewComponent:=FieldValues['MaxID'];
  EnterSQL('INSERT INTO '+tnComponentsComponents+' (idOwner,idComponent) VALUES('+IntToStr(lvComponents_idObj)+','+IntToStr(idNewComponent)+')');
  ExecSQL;
  EnterSQL('INSERT INTO '+tnComponentObjects+' (idComponent,idTObj,idObj) VALUES('+IntToStr(idNewComponent)+','+IntToStr(idTGoods)+','+IntToStr(idGoods)+')');
  ExecSQL;
  Destroy;
  end;
  with lvComponents do begin
  Items.BeginUpdate;
  NewItem:=Items.Add;
  with NewItem do begin
  Data:=Pointer(idNewComponent);
  lvComponents__UpdateItem(NewItem);
  end;
  Items.EndUpdate;
  end;
  end
 else
  ShowMessage('can not copy root catalog');
end;

procedure TGoodsExplor.lvComponents_RemoveGoods(Item: TListItem);
var
  TypeFunctionality: TTypeFunctionality;
  idRemoveComponent: integer;
  cntObjects: integer;
  idTObj,idObj: integer;
begin
if Item = nil then Exit;
with Space.TObjPropsQuery_Create do begin
idRemoveComponent:=Integer(Item.Data);
if Component_GetLinkedObject(idRemoveComponent, idTObj,idObj)
 then begin
  EnterSQL('SELECT Count(*) Cnt FROM '+tnComponentObjects+' WHERE (idTObj+0 = '+IntToStr(idTObj)+' AND idObj+0 = '+IntToStr(idObj)+')');
  Open;
  cntObjects:=FieldValues['Cnt'];
  if cntObjects = 1
   then begin
    TypeFunctionality:=TTypeFunctionality_Create(idTObj);
    if TypeFunctionality <> nil
     then with TypeFunctionality do begin
      DestroyInstance(idObj);
      Release;
      end;
    end;
  end;
// удаляем компонент из БД
EnterSQL('DELETE FROM '+tnComponentObjects+' WHERE idComponent+0 = '+IntToStr(idRemoveComponent));
ExecSQL;
EnterSQL('DELETE FROM '+tnComponentsComponents+' WHERE idComponent+0 = '+IntToStr(idRemoveComponent));
ExecSQL;
EnterSQL('DELETE FROM '+tnComponents+' WHERE id+0 = '+IntToStr(idRemoveComponent));
ExecSQL;
Destroy;
end;
Item.Delete;
end;

procedure TGoodsExplor.lvComponents__Selected_Update;
begin
lvComponents__UpdateItem(lvComponents.Selected);
end;

procedure TGoodsExplor.lvComponents__UpdateItem(Item: TListItem);
var
  GoodsFunctionality: TGoodsFunctionality;
  idTObj,idObj: integer;
begin
if (Item = nil) OR (Integer(Item.Data) = 0) then Exit;
if NOT Component_GetLinkedObject(Integer(Item.Data), idTObj,idObj) then Exit;
with Item do begin
case idTObj of
idTGoods: begin
  GoodsFunctionality:=TGoodsFunctionality(TComponentFunctionality_Create(idTGoods,idObj));
  if GoodsFunctionality <> nil
   then with GoodsFunctionality do begin
    Caption:=Name;
    SubItems.Clear;
    SubItems.Add(IntToStr(StdAmount));
    SubItems.Add(StdMeasureUnit);
    ImageIndex:=Random(15);
    Release;
    end;
  end;
end;
end;
end;

procedure TGoodsExplor.lvComponents__Selected_Edit;
var
  idTObj,idObj: integer;
  ObjFunctionality: TComponentFunctionality;
begin
if (lvComponents.Selected = nil) OR (Integer(lvComponents.Selected.Data) = 0) then Exit;
if NOT Component_GetLinkedObject(Integer(lvComponents.Selected.Data), idTObj,idObj) then Exit;
with lvComponents.Selected do begin
ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
if ObjFunctionality <> nil
 then with ObjFunctionality do begin
  with TPanelProps_Create(false, 0,nil,nilObject) do ShowModal;
  lvComponents__UpdateItem(lvComponents.Selected);
  Release;
  end;
end;
end;

procedure TGoodsExplor.lvComponents_GoodsSearch(const strFind: string);
var
  idComponent: integer;
  idTObj,idObj: integer;
  Item: TListItem;
begin
lvComponents_Clear;
with lvComponents,Space.TObjPropsQuery_Create do begin
Items.BeginUpdate;
EnterSQL('SELECT '+tnComponentObjects+'.idComponent FROM '+tnTGoods+','+tnComponentObjects+' WHERE '+tnComponentObjects+'.idTObj+0 = '+IntToStr(idTGoods)+' AND '+tnComponentObjects+'.idObj = '+tnTGoods+'.Key_ AND '+tnTGoods+'.Name LIKE "%'+strFind+'%"');
Open;
while NOT EOF do begin
  try idComponent:=FieldValues['idComponent'] except idComponent:=0 end;
  if Component_GetLinkedObject(idComponent, idTObj,idObj)
   then begin
    Item:=Items.Add;
    with Item do begin
    Data:=Pointer(idComponent);
    lvComponents__UpdateItem(Item);
    end;
    end;

  Next;
  end;
Destroy;
Items.EndUpdate;
end;
end;

procedure TGoodsExplor.FormCreate(Sender: TObject);
begin
tvComponents_Update;
end;

procedure TGoodsExplor.tvComponentsEdited(Sender: TObject; Node: TTreeNode; var S: String);
begin
S:=AnsiUpperCase(S);
with Node,Space.TObjPropsQuery_Create do begin
if Integer(Node.Data) <> 0
 then begin
  EnterSQL('UPDATE '+tnIDsRelations+' SET StrID =  '''+S+''' WHERE EnumID = '+IntToStr(Integer(Node.Data)));
  ExecSQL;
  end;
Destroy;
end;
end;

procedure TGoodsExplor.SpeedButton1Click(Sender: TObject);
begin
tvComponents__SelectedNode_AddNode;
end;

procedure TGoodsExplor.SpeedButton2Click(Sender: TObject);
begin
tvComponents_DeleteSelectedNode;
end;

procedure TGoodsExplor.tvComponentsChange(Sender: TObject; Node: TTreeNode);
begin
lvComponents_Update(Integer(Node.Data));
end;

procedure TGoodsExplor.SpeedButton3Click(Sender: TObject);
begin
lvComponents_AddGoods;
end;

procedure TGoodsExplor.lvComponentsDblClick(Sender: TObject);
begin
lvComponents__Selected_Edit;
end;

procedure TGoodsExplor.SpeedButton4Click(Sender: TObject);
begin
lvComponents_RemoveGoods(lvComponents.Selected);
end;

procedure TGoodsExplor.sbCloneClick(Sender: TObject);
begin
with TGoodsExplor.Create(Space) do Show;
end;

procedure TGoodsExplor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TGoodsExplor.lvComponentsDragOver(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Source is TListView then Accept:=true;
end;

procedure TGoodsExplor.lvComponentsDragDrop(Sender, Source: TObject; X,Y: Integer);
var
  idTObj,idObj: integer;
begin
if Component_GetLinkedObject(Integer((Source as TListView).Selected.Data), idTObj,idObj)
 then begin
  case idTObj of
  idTGoods: lvComponents_InsertGoods(idObj);
  end;
  end;
end;

procedure TGoodsExplor.sbGoodsSearchClick(Sender: TObject);
begin
lvComponents_GoodsSearch(edGoodsSearch.Text);
end;

procedure TGoodsExplor.sbComponentsSearchClick(Sender: TObject);
begin
if edComponentsSearch.Text <> ''
 then tvComponents_SearchByName(edComponentsSearch.Text)
 else tvComponents_Update;
end;

procedure TGoodsExplor.edComponentsSearchChange(Sender: TObject);
begin
edGoodsSearch.Text:=(Sender as TEdit).Text;
end;

procedure TGoodsExplor.edGoodsSearchChange(Sender: TObject);
begin
edComponentsSearch.Text:=(Sender as TEdit).Text;
end;

end.
