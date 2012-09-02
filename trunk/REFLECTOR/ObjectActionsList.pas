unit ObjectActionsList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, ComCtrls, ImgList, ExtCtrls, Functionality, GlobalSpaceDefines,
  RXCtrls;

type
  TAction = procedure; stdcall;

  TItemActionsList = class
  public
    ObjectType: integer;
    ObjectTypeName: shortstring;
    ActionType: TSpaceObjClassAction;
    ActionName: shortstring;
    Action: TAction;
    Constructor Create(pObjectType: integer; const pObjectTypeName: string; pActionType: TSpaceObjClassAction; const pAction: TAction; const pActionName: shortstring);
    destructor Destroy; override;
    procedure InvokeAction;
  end;

  TFormObjectActionsList = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListObject: TTreeView;
    TabSheet2: TTabSheet;
    ListAction: TTreeView;
    ilTypesAndActions: TImageList;
    ilActions: TImageList;
    procedure ListObjectDblClick(Sender: TObject);
  private
    { Private declarations }
    ListItems: TList;
    ilTypesAndActions_TypesCount: integer;

  public
    { Public declarations }
    Constructor Create;
    destructor Destroy; override;
    procedure AddItem(pItem: TItemActionsList);
  end;

implementation
Uses
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitInstanceCreating;

{$R *.DFM}

{TItemActionsList}
Constructor TItemActionsList.Create(pObjectType: integer; const pObjectTypeName: string; pActionType: TSpaceObjClassAction; const pAction: TAction; const pActionName: shortstring);
begin
Inherited Create;
ObjectType:=pObjectType;
ObjectTypeName:=pObjectTypeName;
ActionType:=pActionType;
Action:=pAction;
ActionName:=pActionName;
end;

destructor TItemActionsList.Destroy;
begin
Inherited;
end;

procedure TItemActionsList.InvokeAction;
begin
if Assigned(Action) then Action;
end;




procedure CreatePrototype;
begin
with TfmInstanceCreating.Create do Show;
end;

{TFormObjectActionsList}
Constructor TFormObjectActionsList.Create;
var
  I: integer;
begin
Inherited Create(nil);
ListItems:=TList.Create;
ListObject.Items.Clear;
ListAction.Items.Clear;
ilTypesAndActions.Clear;
//.
ilTypesAndActions.Assign(TypesImageList);
ilTypesAndActions_TypesCount:=ilTypesAndActions.Count;
ilTypesAndActions.AddImages(ilActions);
//. insert create prototype item
if TypesSystem.Space.UserName = 'ROOT'
 then with ListAction.Items.Add(nil, 'Create prototype') do begin
  ImageIndex:=ilTypesAndActions_TypesCount+3;
  SelectedIndex:=ilTypesAndActions_TypesCount+3;
  StateIndex:=ilTypesAndActions_TypesCount+3;
  Data:=Pointer(@CreatePrototype);
  end;
end;

destructor TFormObjectActionsList.Destroy;
var
  I: integer;
begin
Inherited;
for I:=0 to ListItems.Count-1 do TObject(ListItems[I]).Free;
ListItems.Free;
end;

procedure TFormObjectActionsList.AddItem(pItem: TItemActionsList);

  function ObjectImageIndex(const idType: integer): integer;
  var
    TypeFunctionality: TTypeFunctionality;
  begin
  Result:=-1;
  TypeFunctionality:=TTypeFunctionality_Create(idType);
  Result:=TypeFunctionality.ImageList_Index;
  end;

  function ActionImageIndex(ActionType: TSpaceObjClassAction): integer;
  begin
  case ActionType of
  caUnknown: Result:=0;
  caCreate: Result:=3;
  caFind: Result:=2;
  caFindByName: Result:=2;
  caFindByNumber: Result:=2;
  caFindByAddr: Result:=2;
  caFindByClient: Result:=2;
  caFindNote: Result:=5;
  caInstall: Result:=1;
  caRemove: Result:=4;
  caWriteEvents: Result:=6;
  else
    Result:=0;
  end;
  Inc(Result,ilTypesAndActions_TypesCount);
  end;

  procedure AddToListObject;
  var
    curNode: TTreeNode;
    NewNode: TTreeNode;
  begin
  with ListObject.Items do begin
  curNode:=GetFirstNode;
  while curNode <> nil do begin
    if Integer(curNode.Data) = pItem.ObjectType
     then begin
      NewNode:=AddChild(curNode, pItem.ActionName);
      with NewNode do begin
      ImageIndex:=ActionImageIndex(pItem.ActionType);
      SelectedIndex:=ActionImageIndex(pItem.ActionType);
      StateIndex:=ActionImageIndex(pItem.ActionType);
      Data:=pItem;
      end;
      Exit;
      end;
    curNode:=curNode.getNextSibling;
    end;
  NewNode:=Add(nil, pItem.ObjectTypeName);
  with NewNode do begin
  ImageIndex:=ObjectImageIndex(pItem.ObjectType);
  SelectedIndex:=ObjectImageIndex(pItem.ObjectType);
  StateIndex:=ObjectImageIndex(pItem.ObjectType);
  Data:=Pointer(pItem.ObjectType);
  end;
  NewNode:=AddChild(NewNode, pItem.ActionName);
  with NewNode do begin
  ImageIndex:=ActionImageIndex(pItem.ActionType);
  SelectedIndex:=ActionImageIndex(pItem.ActionType);
  StateIndex:=ActionImageIndex(pItem.ActionType);
  Data:=pItem;
  end;
  end;
  end;

  procedure AddToListAction;
  var
    curNode: TTreeNode;
    NewNode: TTreeNode;
  begin
  with ListAction.Items do begin
  curNode:=GetFirstNode;
  while curNode <> nil do begin
    if TSpaceObjClassAction(curNode.Data) = pItem.ActionType
     then begin
      NewNode:=ListAction.Items.AddChild(curNode, pItem.ObjectTypeName);
      with NewNode do begin
      ImageIndex:=ObjectImageIndex(pItem.ObjectType);
      SelectedIndex:=ObjectImageIndex(pItem.ObjectType);
      StateIndex:=ObjectImageIndex(pItem.ObjectType);
      Data:=Pointer(pItem);
      end;
      Exit;
      end;
    curNode:=curNode.getNextSibling;
    end;
  NewNode:=ListAction.Items.Add(nil, pItem.ActionName);
  with NewNode do begin
  ImageIndex:=ActionImageIndex(pItem.ActionType);
  SelectedIndex:=ActionImageIndex(pItem.ActionType);
  StateIndex:=ActionImageIndex(pItem.ActionType);
  Data:=Pointer(pItem.ActionType);
  end;
  NewNode:=ListAction.Items.AddChild(NewNode, pItem.ObjectTypeName);
  with NewNode do begin
  ImageIndex:=ObjectImageIndex(pItem.ObjectType);
  SelectedIndex:=ObjectImageIndex(pItem.ObjectType);
  StateIndex:=ObjectImageIndex(pItem.ObjectType);
  Data:=Pointer(pItem);
  end;
  end;
  end;

begin
AddToListAction;
AddToListObject;
ListItems.Add(pItem);
end;

procedure TFormObjectActionsList.ListObjectDblClick(Sender: TObject);
begin
with (Sender as TTreeView).Selected do
if Data = @CreatePrototype
 then
  CreatePrototype
 else
  if NOT HasChildren
   then with TItemActionsList(Data) do begin
    if Assigned(Action) then Action else ShowMessage('not yet implemented');
    end;
end;

end.
