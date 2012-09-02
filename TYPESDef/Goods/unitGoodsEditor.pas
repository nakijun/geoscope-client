unit unitGoodsEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, RXCtrls, ExtCtrls, Buttons, Functionality, TypesDefines, TypesFunctionality;

Const
  idGoodsPrototype = 40138;
type
  TfmGoodsEditor = class(TForm)
    RxLabel5: TRxLabel;
    lvInstanceList: TListView;
    sbSelectedGoods_Edit: TSpeedButton;
    Bevel1: TBevel;
    RxLabel1: TRxLabel;
    sbSelectedObj_Destroy: TSpeedButton;
    edGoodsName: TEdit;
    RxLabel2: TRxLabel;
    Memo1: TMemo;
    procedure edGoodsNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvInstanceListKeyPress(Sender: TObject; var Key: Char);
    procedure lvInstanceListDblClick(Sender: TObject);
    procedure edGoodsNameChange(Sender: TObject);
    procedure sbSelectedGoods_EditClick(Sender: TObject);
    procedure sbSelectedObj_DestroyClick(Sender: TObject);
    procedure lvInstanceListEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure lvInstanceListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edGoodsNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    TypeGoodsFunctionality: TTGoodsFunctionality;
    idSelectedGoods: integer;
    flSelected: boolean;

    function TGoods_Create(const GName: string): integer;
  public
    { Public declarations }

    Constructor Create;
    Destructor Destroy; override;
    function Select(var idGoods: integer): boolean;
    
    procedure lvInstanceList_Update(const Context: string);
    procedure lvInstanceList__SelectedGoods_Edit;
    procedure lvInstanceList__SelectedGoods_Destroy;
    procedure lvInstanceList_Select;
  end;

implementation

{$R *.DFM}

Constructor TfmGoodsEditor.Create;
begin
Inherited Create(nil);
TypeGoodsFunctionality:=TTGoodsFunctionality.Create;
end;

Destructor TfmGoodsEditor.Destroy;
begin
TypeGoodsFunctionality.Free;
Inherited;
end;

function TfmGoodsEditor.TGoods_Create(const GName: string): integer;
var
  SC: TCursor;
  idNewGoods: integer;
  SecurityComponents: TComponentsList;
  I: integer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TComponentFunctionality_Create(idTGoods,idGoodsPrototype) do
try
flUserSecurityDisabled:=true;
try
ToClone(idNewGoods);
finally
flUserSecurityDisabled:=false;
end;
with TGoodsFunctionality(TypeGoodsFunctionality.TComponentFunctionality_Create(idNewGoods)) do
try
flUserSecurityDisabled:=true;
try
//. security component destroing, because new component will have default security
if QueryComponents(idTSecurityComponent, SecurityComponents)
 then
  try
  with TTypeFunctionality_Create(idTSecurityComponent) do
  try
  flUserSecurityDisabled:=true;
  try
  for I:=0 to SecurityComponents.Count-1 do DestroyInstance(TItemComponentsList(SecurityComponents[I]^).idComponent);
  finally
  flUserSecurityDisabled:=false;
  end;
  finally
  Release;
  end;
  finally
  SecurityComponents.Destroy;
  end;
//. override name
Name:=GName;
finally
flUserSecurityDisabled:=false;
end;
finally
Release;
end;
finally
Release;
end;
lvInstanceList_Update(GName);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGoodsEditor.edGoodsNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  idGoods: integer;
begin
case Ord(Key) of
VK_RETURN:
  if Length(edGoodsName.Text) >= 3
   then begin
    lvInstanceList_Update(edGoodsName.Text);
    if lvInstanceList.Items.Count > 0
     then begin
      lvInstanceList.Items[0].Selected:=true;
      lvInstanceList.Items[0].Focused:=true;
      idSelectedGoods:=Integer(lvInstanceList.Selected.Data);
      lvInstanceList.SetFocus;
      end
     else
      if NOT TypeGoodsFunctionality.IsInstanceExist(edGoodsName.Text, idGoods)
       then begin //. создаем новый товар с именем edGoodsName.Text
        if (Application.MessageBox('such goods not exist '#$0D#$0A'Want to create ?','Question',MB_YESNO+MB_ICONQUESTION) = IDYES)
         then begin
          TGoods_Create(edGoodsName.Text);
          lvInstanceList_Update(edGoodsName.Text);
          lvInstanceList.Items[0].Selected:=true;
          lvInstanceList.Items[0].Focused:=true;
          idSelectedGoods:=Integer(lvInstanceList.Selected.Data);
          lvInstanceList.SetFocus;
          end
         else begin
          edGoodsName.SetFocus;
          edGoodsName.SelectAll;
          end;
        end;
    Key:=0;
    end;
VK_ESCAPE: Close;
end;
end;

procedure TfmGoodsEditor.edGoodsNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then Key:=#0;
end;

procedure TfmGoodsEditor.edGoodsNameChange(Sender: TObject);
begin
idSelectedGoods:=0;
end;

procedure TfmGoodsEditor.lvInstanceList_Update(const Context: string);
var
  List: TStringList;
  I: integer;
begin
TypeGoodsFunctionality.GetInstanceListContainingContext(Context, List);
try
with lvInstanceList.Items do begin
BeginUpdate;
Clear;
for I:=0 to List.Count-1 do with Add do begin
  Caption:=List.Strings[I];
  Data:=List.Objects[I];
  end;
EndUpdate;
end;
finally
List.Destroy;
end;
end;

procedure TfmGoodsEditor.lvInstanceList_Select;
begin
if lvInstanceList.Selected <> nil
 then begin
  edGoodsName.Text:=lvInstanceList.Selected.Caption;
  idSelectedGoods:=Integer(lvInstanceList.Selected.Data);
  edGoodsName.SetFocus;
  flSelected:=true;
  Close;
  end;
end;

procedure TfmGoodsEditor.lvInstanceList__SelectedGoods_Edit;
var
  GoodsFunctionality: TGoodsFunctionality;
begin
if lvInstanceList.Selected <> nil
 then begin
  GoodsFunctionality:=TGoodsFunctionality(TComponentFunctionality_Create(idTGoods,Integer(lvInstanceList.Selected.Data)));
  with GoodsFunctionality do
  try
  with TPanelProps_Create(false, 0,nil, nilObject) do
  try
  Position:=poScreenCenter;
  ShowModal;
  finally
  Destroy;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TfmGoodsEditor.lvInstanceList__SelectedGoods_Destroy;
var
  idDelGoods: integer;
begin
if lvInstanceList.Selected <> nil
 then begin
  if Application.MessageBox('Destroy selecte goods ?','Attention',MB_YESNO+MB_ICONWARNING) = IDYES
   then begin
    idDelGoods:=Integer(lvInstanceList.Selected.Data);
    TypeGoodsFunctionality.DestroyInstance(idDelGoods);
    lvInstanceList.Selected.Delete;
    if idSelectedGoods = idDelGoods then idSelectedGoods:=0;
    end;
  end;
end;

procedure TfmGoodsEditor.lvInstanceListKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D then lvInstanceList_Select;
end;

procedure TfmGoodsEditor.lvInstanceListDblClick(Sender: TObject);
begin
lvInstanceList_Select;
end;

procedure TfmGoodsEditor.lvInstanceListEdited(Sender: TObject; Item: TListItem; var S: String);
var
  GoodsFunctionality: TGoodsFunctionality;
begin
S:=AnsiUpperCase(S);
GoodsFunctionality:=TGoodsFunctionality(TypeGoodsFunctionality.TComponentFunctionality_Create(Integer(Item.Data)));
if GoodsFunctionality <> nil
 then with GoodsFunctionality do
  try
  Name:=S;
  finally
  Release;
  end;
end;

procedure TfmGoodsEditor.sbSelectedGoods_EditClick(Sender: TObject);
begin
lvInstanceList__SelectedGoods_Edit;
end;

procedure TfmGoodsEditor.sbSelectedObj_DestroyClick(Sender: TObject);
begin
lvInstanceList__SelectedGoods_Destroy;
{with TypeGoodsFunctionality.Space.TObjPropsQuery_Create do begin
for I:=0 to 39999 do begin
  EnterSQL('INSERT INTO Goods (Name) Values(''D'+IntToStr(I)+''')');
  ExecSQL;
  end;
Destroy;
end;}
end;


function TfmGoodsEditor.Select(var idGoods: integer): boolean;
begin
Result:=false;
flSelected:=false;
ShowModal;
if flSelected
 then begin
  idGoods:=idSelectedGoods;
  Result:=true;
  end;
end;

procedure TfmGoodsEditor.lvInstanceListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_ESCAPE: Close;
end;
end;

end.
