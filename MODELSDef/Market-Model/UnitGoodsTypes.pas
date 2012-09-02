unit UnitGoodsTypes;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Db, DBTables;

type
  TGoodsTypes = class(TForm)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    BitBtnAddNew: TBitBtn;
    BitBtnTypeName: TBitBtn;
    LabelCathegory: TLabel;
    procedure BitBtnAddNewClick(Sender: TObject);
    procedure BitBtnTypeNameClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    Cathegory_Key: integer;
    QueryProps: TSpaceObjPropsQuery;
    flOk: boolean;
    GetType_TypeKey_: integer;

    procedure Update;
    procedure AddNew;
    procedure Find;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace);
    destructor Destroy; override;
    procedure SelectCathegory(pCathegory_Key: integer);
    function GetType(var Type_Key: integer): boolean;
  end;


implementation
Uses
  UnitGoodsTypes_AddNew,
  UnitGoodsTypes_Find;

{$R *.DFM}

Constructor TGoodsTypes.Create(pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
QueryProps:=Space.TObjPropsQuery_Create;
DataSource.DataSet:=QueryProps;
SelectCathegory(1);
end;

destructor TGoodsTypes.Destroy;
begin
QueryProps.Free;
Inherited;
end;

procedure TGoodsTypes.SelectCathegory(pCathegory_Key: integer);
begin
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT CathegoryName FROM GoodsCathegories WHERE Key_+0 = '+IntToStr(pCathegory_Key));
Open;
LabelCathegory.Caption:='';
Cathegory_Key:=pCathegory_Key;
if RecordCount > 0
 then begin
  try LabelCathegory.Caption:='goods cathegory:    '+FieldValues['CathegoryName'] except end;
  Update;
  end;
Destroy;
end;
end;

procedure TGoodsTypes.Update;
begin
with QueryProps do begin
Close;
EnterSQL('SELECT * FROM GoodsTypes WHERE Cathegory_Key+0 = '+IntToStr(Cathegory_Key)+' ORDER BY TypeName');
Open;
end;
end;

procedure TGoodsTypes.AddNew;
var
  NewType: string;
begin
with TFormGoodsTypes_AddNew.Create(nil) do begin
if Enter(NewType)
 then with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT Count(*) Cnt FROM GoodsTypes WHERE  Cathegory_Key+0 = '+IntToStr(Cathegory_Key)+' AND TypeName = '''+NewType+'''');
  Open;
  if FieldValues['Cnt'] = 0
   then begin
    EnterSQL('INSERT INTO GoodsTypes (Cathegory_Key, TypeName, Key_) VALUES ('+IntToStr(Cathegory_Key)+', '''+NewType+''', 0)');
    ExecSQL;
    Self.Update;
    end;
  Destroy;
  end;
Destroy;
end;
end;

procedure TGoodsTypes.Find;
var
  TypeName: string;
  Key_: integer;
begin
with TFormGoodsTypes_Find.Create(nil) do begin
if Enter(TypeName)
 then with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT Key_ FROM GoodsTypes WHERE  Cathegory_Key+0 = '+IntToStr(Cathegory_Key)+' AND TypeName LIKE ''%'+TypeName+'%''');
  Open;
  if RecordCount > 0
   then begin
    Key_:=FieldValues['Key_'];
    DBGrid.Hide;
    with QueryProps do begin
    First;
    while NOT EOF do begin
     if FieldValues['Key_'] = IntToStr(Key_) then Break;
     Next;
     end;
    end;
    Beep;
    Beep;
    DBGrid.Show;
    end
   else ShowMessage(TypeName+' not found !!!');
  Destroy;
  end;
Destroy;
end;
end;

function TGoodsTypes.GetType(var Type_Key: integer): boolean;
begin
flOk:=false;
ShowModal;
Result:=false;
if flOk
 then begin
  Type_Key:=GetType_TypeKey_;
  Result:=true;
  end;
end;

procedure TGoodsTypes.BitBtnAddNewClick(Sender: TObject);
begin
AddNew;
end;

procedure TGoodsTypes.BitBtnTypeNameClick(Sender: TObject);
begin
Find;
end;

procedure TGoodsTypes.DBGridDblClick(Sender: TObject);
begin
GetType_TypeKey_:=QueryProps.FieldValues['Key_'];
flOk:=true;
Close;
end;

end.
