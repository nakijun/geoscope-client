unit unitComponentsTreePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfmComponentsTreePanel = class(TForm)
    tvComponents: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvComponentsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    idTComponent: integer;
    idComponent: integer;
    { Public declarations }

    Constructor Create(const pidTComponent: integer; const pidComponent: integer);
    Destructor Destroy; override;
    procedure Clear;
    procedure Update(const flShowRoot: boolean = false); reintroduce;
  end;


implementation
uses
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesFunctionality,
  SpaceObjInterpretation;

{$R *.dfm}


Constructor TfmComponentsTreePanel.Create(const pidTComponent: integer; const pidComponent: integer);
begin
Inherited Create(nil);
idTComponent:=pidTComponent;
idComponent:=pidComponent;
//.
tvComponents.Images:=TypesImageList;
end;

Destructor TfmComponentsTreePanel.Destroy;
begin
Clear;
Inherited;
end;

procedure TfmComponentsTreePanel.Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
tvComponents.Items.BeginUpdate;
try
for I:=0 to tvComponents.Items.Count-1 do begin
  ptrDestroyItem:=tvComponents.Items[I].Data;
  FreeMem(ptrDestroyItem,SizeOf(TItemComponentsList));
  end;
tvComponents.Items.Clear;
finally
tvComponents.Items.EndUpdate;
end;
end;

procedure TfmComponentsTreePanel.Update(const flShowRoot: boolean = false);

  procedure ProcessComponent(Node: TTreeNode; const pidTComponent: integer; const pidComponent: integer);
  var
    Info: string;
    ImageIndex: integer;
    ParentNode: TTreeNode;
    CI: pointer;
    ComponentsList: TComponentsList;
    I: integer;
  begin
  //.
  with TComponentFunctionality_Create(pidTComponent,pidComponent) do
  try
  if ((NOT ((pidTComponent = idTComponent) AND (pidComponent = idComponent))) OR flShowRoot)
   then begin
    Info:=TypeFunctionality.Name;
    if Name <> '' then Info:=Info+'('+Name+')';
    ImageIndex:=TypeFunctionality.ImageList_Index;
    //.
    ParentNode:=tvComponents.Items.AddChild(Node,Info);
    ParentNode.ImageIndex:=ImageIndex;
    ParentNode.SelectedIndex:=ParentNode.ImageIndex;
    GetMem(CI,SizeOf(TItemComponentsList));
    with TItemComponentsList(CI^) do begin
    idTComponent:=pidTComponent;
    idComponent:=pidComponent;
    ID:=0;
    end;
    ParentNode.Data:=CI;
    end
   else ParentNode:=nil;
  //. process own components
  GetComponentsList(ComponentsList);
  try
  for I:=0 to ComponentsList.Count-1 do with TItemComponentsList(ComponentsList[I]^) do ProcessComponent(ParentNode, idTComponent,idComponent);
  finally
  ComponentsList.Destroy;
  end;
  finally
  Release;
  end;
  end;

begin
tvComponents.Items.BeginUpdate;
try
Clear();
ProcessComponent(nil, idTComponent,idComponent);
finally
tvComponents.Items.EndUpdate;
end;
end;

procedure TfmComponentsTreePanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmComponentsTreePanel.tvComponentsDblClick(Sender: TObject);
var
  ptrComponent: pointer;
begin
if (tvComponents.Selected.Data = nil) then Exit; //. ->
ptrComponent:=tvComponents.Selected.Data;
with TComponentFunctionality_Create(TItemComponentsList(ptrComponent^).idTComponent,TItemComponentsList(ptrComponent^).idComponent) do
try
with TSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
flFreeOnClose:=false;
Left:=Self.Left+Round((Self.Width-Width)/2);
Top:=Self.Top+Self.Height-Height-10;
NormalizeSize();
Show();
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
