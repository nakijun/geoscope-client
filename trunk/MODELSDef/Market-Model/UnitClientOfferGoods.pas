unit UnitClientOfferGoods;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls,
  TypesDefines,
  SpaceObjectSchema,
  Db, Grids, DBGrids, DBTables;

type
  TFormClientOfferGoods = class(TForm)
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonDelete: TSpeedButton;
    Caption: TLabel;
    procedure SpeedButtonAddClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure SpeedButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    Offer_Key: integer;
    QueryProps: TSpaceObjPropsQuery;
    Updater: TShmUpdater;

    procedure UpdateGrid;
    procedure Grid_DeleteSelectedRecord;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; pOffer_Key: integer);
    destructor Destroy; override;
  end;

implementation
Uses
  UnitActiveGoods;

{$R *.DFM}
Constructor TFormClientOfferGoods.Create(pSpace: TProxySpace; pOffer_Key: integer);
begin
Inherited Create(nil);
Space:=pSpace;
Offer_Key:=pOffer_Key;
QueryProps:=Space.TObjPropsQuery_Create;
DataSource.DataSet:=QueryProps;
UpdateGrid;
Updater:=TShmUpdater.Create(idTOffer,Offer_Key, UpdateGrid);
end;

destructor TFormClientOfferGoods.Destroy;
begin
Updater.Free;
QueryProps.Free;
Inherited;
end;

procedure TFormClientOfferGoods.UpdateGrid;
begin
with QueryProps do begin
Close;
EnterSQL('SELECT OffersGoods.Key_,GoodsCathegories.CathegoryName,GoodsTypes.TypeName,Goods.Cathegory,Goods.Type,Goods.Name,Goods.Descr, OffersGoods.Count,OffersGoods.MinPrice,OffersGoods.Info FROM Goods,GoodsCathegories,GoodsTypes,OffersGoods '+'WHERE OffersGoods.Offer_Key+0 = '+IntToStr(Offer_Key)+' AND OffersGoods.Goods_Key = Goods.Key_ AND (Goods.Cathegory = GoodsCathegories.Key_ AND Goods.Type = GoodsTypes.Key_) ORDER BY Goods.Cathegory,Goods.Type,Goods.Name,OffersGoods.MinPrice,OffersGoods.Count');
Open;
end;
end;

procedure TFormClientOfferGoods.SpeedButtonAddClick(Sender: TObject);
begin
with TFormActiveGoods.Create(Space, 0,true,Offer_Key) do begin
if Done then UpdateGrid;
Destroy;
end;
end;

procedure TFormClientOfferGoods.DBGridDblClick(Sender: TObject);
var
  Key_: integer;
begin
with (Sender as TDBGrid) do begin
try Key_:=DataSource.DataSet.FieldValues['Key_'] except Exit end;
with TFormActiveGoods.Create(Space, Key_,true,Offer_Key) do begin
if Done then UpdateGrid;
Destroy;
end;
end;
end;

procedure TFormClientOfferGoods.Grid_DeleteSelectedRecord;
var
  Key_: integer;
begin
try Key_:=QueryProps.FieldValues['Key_'] except Exit end;
with Space.TObjPropsQuery_Create do begin
EnterSQL('DELETE FROM OffersGoods WHERE Key_+0 = '+IntToStr(Key_));
ExecSQL;
Destroy;
end;
UpdateGrid;
end;

procedure TFormClientOfferGoods.SpeedButtonDeleteClick(Sender: TObject);
begin
if MessageDlg('delete selected goods ?', mtConfirmation , [mbOk,mbNo], 0) <> mrOk then Exit;
Grid_DeleteSelectedRecord;
end;

end.
