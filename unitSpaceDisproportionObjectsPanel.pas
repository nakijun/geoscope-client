unit unitSpaceDisproportionObjectsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfmSpaceDisproportionObjectsPanel = class(TForm)
    Panel1: TPanel;
    lbObjectsList: TListBox;
    Label1: TLabel;
    edFactor: TEdit;
    btnProcess: TButton;
    procedure btnProcessClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbObjectsListClick(Sender: TObject);
  private
    { Private declarations }
    procedure Process();
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy; override;
  end;

implementation
uses
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  unitReflector,
  TypesFunctionality;

{$R *.dfm}


Constructor TfmSpaceDisproportionObjectsPanel.Create;
begin
Inherited Create(nil);
end;

Destructor TfmSpaceDisproportionObjectsPanel.Destroy;
begin
Inherited;
end;

procedure TfmSpaceDisproportionObjectsPanel.Process();
var
  Factor: double;
  BA: TByteArray;
  ObjectList: TList;
  I: integer;
begin
Factor:=StrToFloat(edFactor.Text);
with TTVisualizationFunctionality.Create do
try
GetDisproportionObjects(Factor,{out} BA);
ByteArray_CreateList(BA,{out} ObjectList);
try
lbObjectsList.Items.BeginUpdate;
try
lbObjectsList.Items.Clear;
for I:=0 to ObjectList.Count-1 do lbObjectsList.Items.AddObject(IntToStr(TPtr(ObjectList[I])),TObject(ObjectList[I]));
finally
lbObjectsList.Items.EndUpdate;
end;
finally
ObjectList.Destroy;
end;
finally
Release;
end;
end;

procedure TfmSpaceDisproportionObjectsPanel.btnProcessClick(Sender: TObject);
begin
Process();
end;

procedure TfmSpaceDisproportionObjectsPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmSpaceDisproportionObjectsPanel.lbObjectsListClick(Sender: TObject);
var
  ptrObj: TPtr;
  R: TReflector;
begin
if (lbObjectsList.ItemIndex = -1) then Exit; //. ->
ptrObj:=TPtr(lbObjectsList.Items.Objects[lbObjectsList.ItemIndex]);
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector'); //. =>
if (NOT (TypesSystem.Reflector is TReflector)) then Raise Exception.Create('default reflector has wrong type'); //. =>
R:=TReflector(TypesSystem.Reflector);
R.ShowObjAtCenter(ptrObj);
end;


end.
