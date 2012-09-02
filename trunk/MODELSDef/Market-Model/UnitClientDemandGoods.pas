unit UnitClientDemandGoods;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls,
  TypesDefines,
  SpaceObjectSchema,
  Db, Grids, DBGrids, DBTables;

type
  TFormClientDemandGoods = class(TForm)
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
    Demand_Key: integer;
    QueryProps: TSpaceObjPropsQuery;
    Updater: TShmUpdater;

    procedure UpdateGrid;
    procedure Grid_DeleteSelectedRecord;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; pDemand_Key: integer);
    destructor Destroy; override;
  end;

implementation
Uses
  UnitActiveGoods;

{$R *.DFM}
Constructor TFormClientDemandGoods.Create(pSpace: TProxySpace; pDemand_Key: integer);
begin
Inherited Create(nil);
Space:=pSpace;
Demand_Key:=pDemand_Key;
QueryProps:=Space.TObjPropsQuery_Create;
DataSource.DataSet:=QueryProps;
UpdateGrid;
Updater:=TShmUpdater.Create(idTDemand,Demand_Key, UpdateGrid);
end;

destructor TFormClientDemandGoods.Destroy;
begin
Updater.Free;
QueryProps.Free;
Inherited;
end;

procedure TFormClientDemandGoods.UpdateGrid;
begin
with QueryProps do begin
Close;
EnterSQL('SELECT DemandsGoods.Key_,GoodsCathegories.CathegoryName,GoodsTypes.TypeName,Goods.Cathegory,Goods.Type,Goods.Name,Goods.Descr, DemandsGoods.Count,DemandsGoods.MaxPrice,DemandsGoods.Info FROM Goods,GoodsCathegories,GoodsTypes,DemandsGoods '+'WHERE DemandsGoods.Demand_Key+0 = '+IntToStr(Demand_Key)+' AND DemandsGoods.Goods_Key = Goods.Key_ AND (Goods.Cathegory = GoodsCathegories.Key_ AND Goods.Type = GoodsTypes.Key_) ORDER BY Goods.Cathegory,Goods.Type,Goods.Name,DemandsGoods.MaxPrice,DemandsGoods.Count');
Open;
end;
end;

procedure TFormClientDemandGoods.SpeedButtonAddClick(Sender: TObject);
begin
with TFormActiveGoods.Create(Space, 0,false,Demand_Key) do begin
if Done then UpdateGrid;
Destroy;
end;
end;

procedure TFormClientDemandGoods.DBGridDblClick(Sender: TObject);
var
  Key_: integer;
begin
with (Sender as TDBGrid) do begin
try Key_:=DataSource.DataSet.FieldValues['Key_'] except Exit end;
with TFormActiveGoods.Create(Space, Key_,false,Demand_Key) do begin
if Done then UpdateGrid;
Destroy;
end;
end;
end;

procedure TFormClientDemandGoods.Grid_DeleteSelectedRecord;
var
  Key_: integer;
begin
try Key_:=QueryProps.FieldValues['Key_'] except Exit end;
with Space.TObjPropsQuery_Create do begin
EnterSQL('DELETE FROM DemandsGoods WHERE Key_+0 = '+IntToStr(Key_));
ExecSQL;
Destroy;
end;
UpdateGrid;
end;

procedure TFormClientDemandGoods.SpeedButtonDeleteClick(Sender: TObject);
begin
if MessageDlg('delete selected goods ?', mtConfirmation , [mbOk,mbNo], 0) <> mrOk then Exit;
Grid_DeleteSelectedRecord;
end;

end.
