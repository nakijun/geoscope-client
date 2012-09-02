unit UnitGoods;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, unitReflector, SpaceObjectSchema,
  Db, Grids, DBGrids, DBTables;

type
  TFormGoods = class(TForm)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonDelete: TSpeedButton;
    Caption: TLabel;
    SpeedButtonEdit: TSpeedButton;
    procedure SpeedButtonAddClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure SpeedButtonEditClick(Sender: TObject);
    procedure SpeedButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    QueryProps: TSpaceObjPropsQuery;
    Updater: TShmUpdater;
    flOk: boolean;
    PrimaryGoods_Key: integer;

    procedure UpdateGrid;
    procedure Grid_DeleteSelectedRecord;
    function Find(Key_: integer): boolean;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; pPrimaryGoods_Key: integer);
    destructor Destroy; override;
    function Select(var Goods_Key: integer): boolean;
  end;

implementation
Uses
  UnitGoodsPanelProps;

{$R *.DFM}
Constructor TFormGoods.Create(pSpace: TProxySpace; pPrimaryGoods_Key: integer);
begin
Inherited Create(nil);
Space:=pSpace;
QueryProps:=Space.TObjPropsQuery_Create;
DataSource.DataSet:=QueryProps;
PrimaryGoods_Key:=pPrimaryGoods_Key;
UpdateGrid;
//Updater:=TShmUpdater.Create(IDTypeOffer,Offer_Key, UpdateGrid);
end;

destructor TFormGoods.Destroy;
begin
Updater.Free;
QueryProps.Free;
Inherited;
end;

procedure TFormGoods.UpdateGrid;
begin
with QueryProps do begin
Close;
EnterSQL('SELECT Goods.Key_,GoodsCathegories.CathegoryName,GoodsTypes.TypeName,Goods.Cathegory,Goods.Type,Goods.Name,Goods.Descr FROM Goods,GoodsCathegories,GoodsTypes '+'WHERE (Goods.Cathegory = GoodsCathegories.Key_ AND Goods.Type = GoodsTypes.Key_) ORDER BY Goods.Cathegory,Goods.Type,Goods.Name');
Open;
end;
end;

procedure TFormGoods.SpeedButtonAddClick(Sender: TObject);
var
  Key_: integer;
begin
///@
{with TGoodsPanelProps.Create(Space,0) do begin
if Done(Key_)
 then begin
  UpdateGrid;
  Find(Key_);
  end;
Destroy;
end;}
end;

procedure TFormGoods.DBGridDblClick(Sender: TObject);
begin
flOk:=true;
Close;
end;

function TFormGoods.Select(var Goods_Key: integer): boolean;
var
  G_Key: integer;
begin
flOk:=false;
ShowModal;
Result:=false;
if NOT flOk then Exit;
G_Key:=QueryProps.FieldValues['Key_'];
if G_Key = PrimaryGoods_Key then Exit;
Goods_Key:=G_Key;
Result:=true;
end;

procedure TFormGoods.SpeedButtonEditClick(Sender: TObject);
var
  Key_: integer;
begin
try Key_:=QueryProps.FieldValues['Key_'] except Exit end;
///@
{with TGoodsPanelProps.Create(Space, Key_) do begin
if Done(Key_) then UpdateGrid;
Destroy;
end;}
end;

procedure TFormGoods.Grid_DeleteSelectedRecord;
var
  Key_: integer;
begin
try Key_:=QueryProps.FieldValues['Key_'] except Exit end;
if Key_ = PrimaryGoods_Key
 then begin
  ShowMessage('! can not destroy the goods.');
  Exit;
  end;
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT Count(*) Cnt FROM OffersGoods WHERE Goods_Key+0 = '+IntToStr(Key_));
Open;
if FieldValues['Cnt'] > 0
 then begin
  ShowMessage('! can not destroy the goods.');
  Destroy;
  Exit;
  end;
Close;
EnterSQL('SELECT Count(*) Cnt FROM DemandsGoods WHERE Goods_Key+0 = '+IntToStr(Key_));
Open;
if FieldValues['Cnt'] > 0
 then begin
  ShowMessage('! can not destroy the goods.');
  Destroy;
  Exit;
  end;
EnterSQL('DELETE FROM Goods WHERE Key_+0 = '+IntToStr(Key_));
ExecSQL;
Destroy;
end;
UpdateGrid;
end;


function TFormGoods.Find(Key_: integer): boolean;
begin
Result:=false;
DBGrid.Hide;
with QueryProps do begin
First;
while NOT EOF do begin
  if FieldValues['Key_'] = Key_
   then begin
    Result:=true;
    Break;
    end;
  Next;
  end;
end;
DBGrid.Show;
end;

procedure TFormGoods.SpeedButtonDeleteClick(Sender: TObject);
begin
if MessageDlg('delete selected goods ?', mtConfirmation , [mbOk,mbNo], 0) <> mrOk then Exit;
Grid_DeleteSelectedRecord;
end;

end.
