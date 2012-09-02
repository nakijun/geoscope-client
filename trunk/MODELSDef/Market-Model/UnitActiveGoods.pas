unit UnitActiveGoods;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormActiveGoods = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    EditGoodsName: TEdit;
    Label3: TLabel;
    BitBtnGoodsSelect: TBitBtn;
    EditGoodsType: TEdit;
    Label4: TLabel;
    EditGoodsCount: TEdit;
    LabelGoodsPrice: TLabel;
    EditGoodsPriceRb: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditGoodsPriceKp: TEdit;
    Label7: TLabel;
    EditGoodsInfo: TEdit;
    Bevel2: TBevel;
    Label8: TLabel;
    EditGoodsCathegory: TEdit;
    BitBtnAccept: TBitBtn;
    BitBtnCancel: TBitBtn;
    Bevel3: TBevel;
    Label9: TLabel;
    EditGoodsDescr: TEdit;
    procedure BitBtnAcceptClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure EditGoodsPriceRbChange(Sender: TObject);
    procedure BitBtnGoodsSelectClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    flOffer: boolean;
    Owner_Key: integer;
    ActiveGoods_Key: integer;
    Goods_Key: integer;
    flChanged: boolean;
    flDone: boolean;

    procedure RetrieveGoods(ActiveGoods_Key: integer);
    function AcceptGoods: boolean;
    procedure UpdateGoods;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; pActiveGoods_Key: integer; pflOffer: boolean; pOwner_Key: integer);
    // если pActiveGoods_Key = 0, то содается новый товар, иначе редактируется
    function Done: boolean;
  end;

implementation
Uses
  UnitGoods;

{$R *.DFM}

Constructor TFormActiveGoods.Create(pSpace: TProxySpace; pActiveGoods_Key: integer; pflOffer: boolean; pOwner_Key: integer);
var
  S: string;
begin
Inherited Create(nil);
Space:=pSpace;
Goods_Key:=0;
flChanged:=false;
flOffer:=pflOffer;
Owner_Key:=pOwner_Key;
ActiveGoods_Key:=pActiveGoods_Key;
if flOffer
 then begin
  S:='Offer:';
  LabelGoodsPrice.Caption:='min price';
  end
 else begin
  S:='Query:';
  LabelGoodsPrice.Caption:='max price';
  end;
if ActiveGoods_Key <> 0
 then begin
  RetrieveGoods(ActiveGoods_Key);
  Caption:=S+' goods editing';
  end
 else begin
  Caption:=S+' new goods';
  end;
end;

procedure TFormActiveGoods.UpdateGoods;

  function Goods_Cathegory(Goods_Key: integer): string;
  begin
  Result:='';
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT GoodsCathegories.CathegoryName FROM Goods,GoodsCathegories WHERE Goods.Key_+0 = '+IntToStr(Goods_Key)+' AND GoodsCathegories.Key_ = Goods.Cathegory');
  Open;
  try Result:=FieldValues['CathegoryName'] except end;
  Destroy;
  end;
  end;

  function Goods_Type(Goods_Key: integer): string;
  begin
  Result:='';
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT GoodsTypes.TypeName FROM Goods,GoodsTypes WHERE Goods.Key_+0 = '+IntToStr(Goods_Key)+' AND GoodsTypes.Key_ = Goods.Type');
  Open;
  try Result:=FieldValues['TypeName'] except end;
  Destroy;
  end;
  end;

  function Goods_Name(Goods_Key: integer): string;
  begin
  Result:='';
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT Name FROM Goods WHERE Key_+0 = '+IntToStr(Goods_Key));
  Open;
  try Result:=FieldValues['Name'] except end;
  Destroy;
  end;
  end;

  function Goods_Descr(Goods_Key: integer): string;
  begin
  Result:='';
  with Space.TObjPropsQuery_Create do begin
  EnterSQL('SELECT Descr FROM Goods WHERE Key_+0 = '+IntToStr(Goods_Key));
  Open;
  try Result:=FieldValues['Descr'] except end;
  Destroy;
  end;
  end;

begin
EditGoodsCathegory.Text:=Goods_Cathegory(Goods_Key);
EditGoodsType.Text:=Goods_Type(Goods_Key);
EditGoodsName.Text:=Goods_Name(Goods_Key);
EditGoodsDescr.Text:=Goods_Descr(Goods_Key);
end;

procedure TFormActiveGoods.RetrieveGoods(ActiveGoods_Key: integer);
begin
with Space.TObjPropsQuery_Create do begin
if flOffer
 then EnterSQL('SELECT * FROM OffersGoods WHERE Key_+0 = '+IntToStr(ActiveGoods_Key))
 else EnterSQL('SELECT * FROM DemandsGoods WHERE Key_+0 = '+IntToStr(ActiveGoods_Key));
Open;
try
Goods_Key:=FieldValues['Goods_Key'];
except
  Destroy;
  Exit;
  end;
UpdateGoods;
try EditGoodsCount.Text:=FieldValues['Count'] except EditGoodsCount.Text:='?' end;
if flOffer
 then begin
  try EditGoodsPriceRb.Text:=IntToStr(Round(Int(FieldValues['MinPrice']))) except EditGoodsPriceRb.Text:='?' end;
  try EditGoodsPriceKp.Text:=IntToStr(Round(Frac(FieldValues['MinPrice'])*100)) except EditGoodsPriceKp.Text:='?' end;
  end
 else begin
  try EditGoodsPriceRb.Text:=IntToStr(Round(Int(FieldValues['MaxPrice']))) except EditGoodsPriceRb.Text:='?' end;
  try EditGoodsPriceKp.Text:=IntToStr(Round(Frac(FieldValues['MaxPrice'])*100)) except EditGoodsPriceKp.Text:='?' end;
  end;
try EditGoodsInfo.Text:=FieldValues['Info'] except EditGoodsInfo.Text:='???????' end;
Destroy;
end;
end;

function TFormActiveGoods.AcceptGoods: boolean;
var
  strCount,strPrice: string;
  I: integer;
begin
Result:=false;
// проверяем корректность введенных данных
if Goods_Key = 0
 then begin
  ShowMessage('! goods not selected.');
  Exit;
  end;
try
StrToInt(EditGoodsCount.Text);
except
  ShowMessage('! wrong value.');
  Exit;
  end;
strCount:=EditGoodsCount.Text;
if EditGoodsPriceRb.Text <> ''
 then begin
  try
  I:=StrToInt(EditGoodsPriceRb.Text);
  except
    ShowMessage('! wrong value');
    Exit;
    end;
  strPrice:=IntToStr(I);
  end
 else
  strPrice:='0';
if EditGoodsPriceKp.Text <> ''
 then begin
  try
  I:=StrToInt(EditGoodsPriceKp.Text);
  except
    ShowMessage('! wrong value');
    Exit;
    end;
  if I >= 100
   then begin
    ShowMessage('! wrong value');
    Exit;
    end;
  strPrice:=strPrice+'.'+IntToStr(I);
  end
 else
  strPrice:=strPrice+'.'+'0';

if ActiveGoods_Key <> 0
 then with Space.TObjPropsQuery_Create do begin // редактируем
  if flOffer
   then EnterSQL('UPDATE OffersGoods SET(Goods_Key,Count,MinPrice,Info) = ('+IntToStr(Goods_Key)+', '+strCount+', '+strPrice+', '''+EditGoodsInfo.Text+''') WHERE Key_ = '+IntToStr(ActiveGoods_Key))
   else EnterSQL('UPDATE DemandsGoods SET(Goods_Key,Count,MaxPrice,Info) = ('+IntToStr(Goods_Key)+', '+strCount+', '+strPrice+', '''+EditGoodsInfo.Text+''') WHERE Key_ = '+IntToStr(ActiveGoods_Key));
  ExecSQL;
  Destroy;
  end
 else with Space.TObjPropsQuery_Create do begin // создаем новый
  if flOffer
   then EnterSQL('INSERT INTO OffersGoods (Offer_Key,Goods_Key,Count,MinPrice,Info,Key_) Values('+IntToStr(Owner_Key)+', '+IntToStr(Goods_Key)+', '+strCount+', '+strPrice+', '''+EditGoodsInfo.Text+''', 0)')
   else EnterSQL('INSERT INTO DemandsGoods (Demand_Key,Goods_Key,Count,MaxPrice,Info,Key_) Values('+IntToStr(Owner_Key)+', '+IntToStr(Goods_Key)+', '+strCount+', '+strPrice+', '''+EditGoodsInfo.Text+''', 0)');
  ExecSQL;
  if flOffer
   then EnterSQL('SELECT Max(Key_) maxKey_ FROM OffersGoods')
   else EnterSQL('SELECT Max(Key_) maxKey_ FROM DemandsGoods');
  Open;
  ActiveGoods_Key:=FieldValues['maxKey_'];
  Destroy;
  end;
flChanged:=false;
Result:=true;
end;

function TFormActiveGoods.Done: boolean;
begin
flDone:=false;
ShowModal;
Result:=false;
if flDone
 then Result:=true;
end;

procedure TFormActiveGoods.BitBtnAcceptClick(Sender: TObject);
begin
if flChanged
 then begin
  if NOT AcceptGoods then Exit;
  flDone:=true;
  end;
Close;
end;

procedure TFormActiveGoods.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TFormActiveGoods.EditGoodsPriceRbChange(Sender: TObject);
begin
flChanged:=true;
end;

procedure TFormActiveGoods.BitBtnGoodsSelectClick(Sender: TObject);
begin
with TFormGoods.Create(Space, Goods_Key) do begin
if Select(Goods_Key)
 then begin
  UpdateGoods;
  flChanged:=true;  
  end;
Destroy;
end;
end;

end.
