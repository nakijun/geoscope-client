unit unitMarketServicePanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, DB, DBTables, DBXpress, SqlExpr,
  Functionality, SpaceObjInterpretation;

type
  TMarketServicePanelProps = class(TSpaceObjPanelProps)
    Panel1: TPanel;
    edQuery: TEdit;
    reSolutions: TRichEdit;
    Bevel1: TBevel;
    sbCreateNewOffer: TSpeedButton;
    sbGetOfferByID: TSpeedButton;
    Image1: TImage;
    procedure edQueryKeyPress(Sender: TObject; var Key: Char);
    procedure edQueryKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure reSolutionsKeyPress(Sender: TObject; var Key: Char);
    procedure reSolutionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbCreateNewOfferClick(Sender: TObject);
    procedure sbGetOfferByIDClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoResolve(sQuery: string; Solutions: TRichEdit);
    procedure Resolve;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    procedure CommonKeyPress(Sender: TObject; var Key: Char);
    procedure CommonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

implementation
Uses
  TypesDefines,
  TypesFunctionality,
  /// - unitOperator,
  /// - unitOfferPanelProps,
  unitTextInput;

{$R *.DFM}


Constructor TMarketServicePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

procedure TMarketServicePanelProps.DoResolve(sQuery: string; Solutions: TRichEdit);
const
  OutputLimit = 100;
var
  GoodsFunctionality: TGoodsFunctionality;
  OfferGoodsFunctionality: TOfferGoodsFunctionality;
  OfferGoodsMinPrice: Currency;
  OfferGoodsMinPriceString: string;
  MeasureUnitFunctionality: TMeasureUnitFunctionality;
  OfferFunctionality: TOfferFunctionality;
  ClientFunctionality: TClientFunctionality;
  OfferSchedule: string;
  OfferContactInfo: shortstring;
  OfferContactTLF: integer;
  OfferAddress: string;
  OfferLastUpdate: TDateTime;
  I: integer;
  S,S1: string;
  SQLExpr: string;

  function GetSQLExpr(const sQuery: string; out SQLExpr: string): boolean;
  var
    I: integer;
    Context: string;
  begin
  Result:=false;
  SQLExpr:='';
  Context:='';
  for I:=1 to Length(sQuery) do
    if sQuery[I] = ' '
     then begin
      if Context <> ''
       then begin
        SQLExpr:=SQLExpr+'UPPER(Goods.Name) LIKE ''%'+Context+'%'' AND ';
        Context:='';
        Result:=true;
        end;
      end
     else
      Context:=Context+sQuery[I];
  if Context <> ''
   then begin
    SQLExpr:=SQLExpr+'UPPER(Goods.Name) LIKE ''%'+Context+'%'' AND ';
    Result:=true;
    end;
  end;

begin
sQuery:=ANSIUpperCase(sQuery);
if NOT GetSQLExpr(sQuery, SQLExpr)
 then begin
  ShowMessage('Nothing to search ???');
  Exit; //. ->
  end;
(*/// + with Solutions,ObjFunctionality.Space.TObjPropsQuery_Create do
try
EnterSQL(
  'SELECT OfferGoods.idGoods,OfferGoods.idOffer,OfferGoods.idMeasurement,Offers.idUser,OfferGoods.Key_ idOfferGoods '+
  'FROM Goods,OfferGoods,Offers '+
  'WHERE '+SQLExpr+'Goods.Key_ = OfferGoods.idGoods AND OfferGoods.idOffer = Offers.Key_');
Open;
Clear;
Lines.BeginUpdate;
try
I:=0;
while NOT EOF do begin
    with SelAttributes do begin
    Color:=clGray;
    Size:=8;
    end;
    Lines.Add(IntToStr(I+1)+'.');

    GoodsFunctionality:=TGoodsFunctionality(TComponentFunctionality_Create(idTGoods,Integer(FieldValues['idGoods'])));
    OfferGoodsFunctionality:=TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,Integer(FieldValues['idOfferGoods'])));
    OfferGoodsMinPrice:=OfferGoodsFunctionality.MinPrice;
    if OfferGoodsMinPrice <> -1
     then OfferGoodsMinPriceString:=FormatCurr('',OfferGoodsFunctionality.MinPrice)
     else OfferGoodsMinPriceString:='?';
    MeasureUnitFunctionality:=TMeasureUnitFunctionality.Create(FieldValues['idMeasurement']);
    S:=GoodsFunctionality.Name+'   '+FormatFloat('0.#',OfferGoodsFunctionality.Amount)+' ['+MeasureUnitFunctionality.Name+']   price: '+OfferGoodsMinPriceString+'rub. '+OfferGoodsFunctionality.Misc;
    MeasureUnitFunctionality.Destroy;
    OfferGoodsFunctionality.Destroy;
    GoodsFunctionality.Destroy;
    with SelAttributes do begin
    Color:=clWhite;
    Size:=10;
    end;
    Lines.Add(S);

    //. offer name
    OfferFunctionality:=TOfferFunctionality(TComponentFunctionality_Create(idTOffer,Integer(FieldValues['idOffer'])));
    try
    S:='    '+OfferFunctionality.Name;
    with SelAttributes do begin
    Color:=clLime;
    Size:=13;
    end;
    Lines.Add(S);
    //. offer address
    S:='             ';
    OfferAddress:=OfferFunctionality.AddressStr;
    if OfferAddress <> ''
     then S:=S+OfferAddress
     else S:=S+'<no address>';
    with SelAttributes do begin
    Color:=clGreen;
    Size:=10;
    end;
    Lines.Add(S);
    //. offer schedule
    S:='             work mode: ';
    OfferSchedule:=OfferFunctionality.Schedule;
    if OfferSchedule <> ''
     then S:=S+OfferSchedule
     else S:=S+'<no working mode>';
    with SelAttributes do begin
    Color:=TColor($00808040);
    Size:=10;
    end;
    Lines.Add(S);
    //. offer contact info
    S:='             contact info: ';
    OfferContactInfo:=IntToStr(OfferFunctionality.ContactTLF); /// + .ContactInfo;
    if OfferContactInfo <> '' then S:=S+OfferContactInfo+', ';
    OfferContactTLF:=OfferFunctionality.ContactTLF;
    if OfferContactTLF <> 0 then S:=S+'TLF - '+IntToStr(OfferContactTLF);
    with SelAttributes do begin
    Color:=TColor($00FF8080);
    Size:=10;
    end;
    Lines.Add(S);
    //. offer info last update
    S:='             info updated: ';
    OfferLastUpdate:=OfferFunctionality.LastUpdated;
    if OfferLastUpdate <> 0
     then S:=S+FormatDateTime('HH:NN DD.MM.YYYY',OfferLastUpdate)
     else S:=S+'<unknown>';
    with SelAttributes do begin
    Color:=TColor($00FF80FF);
    Size:=10;
    end;
    //.
    Lines.Add(S);
    finally
    OfferFunctionality.Destroy;
    end;

    {/// ? ClientFunctionality:=TClientFunctionality.Create(FieldValues['idUser']);
    S:='        '+ClientFunctionality.Name;
    ClientFunctionality.Destroy;
    with SelAttributes do begin
    Color:=clAqua;
    Size:=10;
    end;
    Lines.Add(S);}

    Inc(I);
    if I > OutputLimit then Break; //. >
    Next;
  end;
if I = 0
 then with SelAttributes do begin
  Color:=clRed;
  Size:=16;
  Lines.Add('no solutions .');
  end;
finally
SelStart:=0;
Lines.EndUpdate;
end;
finally
Destroy;
end;*)
end;

procedure TMarketServicePanelProps.Resolve;
var
  SC: TCursor;
begin
if Length(edQuery.Text) > 2
 then begin
  SC:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  try
  DoResolve(edQuery.Text,reSolutions)
  finally
  Screen.Cursor:=SC;
  end;
  end
 else begin
  ShowMessage('! query is too small (not less 3).');
  edQuery.SetFocus;
  end;
end;

procedure TMarketServicePanelProps.CommonKeyPress(Sender: TObject; var Key: Char);
begin
case Ord(Key) of
1{<CTRL+A>}: begin
  edQuery.Text:='';
  reSolutions.Lines.Clear;
  sbGetOfferByIDClick(nil);
  end;
26{<CTRL+Z>}: begin
  edQuery.Text:='';
  reSolutions.Lines.Clear;
  sbCreateNewOfferClick(nil);
  end;
$0D: begin
  Resolve;
  reSolutions.SetFocus;
  end;
end;
end;

procedure TMarketServicePanelProps.CommonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
end;


procedure TMarketServicePanelProps.edQueryKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TMarketServicePanelProps.edQueryKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TMarketServicePanelProps.reSolutionsKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TMarketServicePanelProps.reSolutionsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TMarketServicePanelProps.sbCreateNewOfferClick(Sender: TObject);
var
  SC: TCursor;
  idNewOffer: integer;
begin
{/// - if Application.MessageBox('Create offer goods ?','',MB_YESNOCANCEL+MB_ICONWARNING) <> mrYES then Exit; //. ->
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TTOfferFunctionality.Create do
try
idNewOffer:=CreateInstance;
finally
Destroy;
end;
finally
Screen.Cursor:=SC;
end;
with TOfferFunctionality(TComponentFunctionality_Create(idTOffer,idNewOffer)) do
with TPanelProps_Create do begin
Position:=poScreenCenter;
Show;
end;}
end;


procedure TMarketServicePanelProps.sbGetOfferByIDClick(Sender: TObject);
var
  OfferIDString: string;
  OfferID: integer;
  Inputed: boolean;
begin
(*/// - with TFormTextInput.Create do
try
CaptionInput:='Enter offer number';
Inputed:=Input(OfferIDString);
finally
Destroy;
end;
if NOT Inputed then Exit; //. ->
try
OfferID:=StrToInt(OfferIDString);
except
  ShowMessage('wrong number');
  Exit; //. ->
  end;
with TOfferFunctionality.Create(OfferID) do
try
try
Check;
{/// + with TOfferPanelProps(TPanelProps_Create) do begin
Position:=poScreenCenter;
ActiveControl:=bbGoodsEdit;
ShowModal;
end;}
except
  On E: Exception do ShowMessage('error: '+E.Message);
  end;
finally
Release;
end;*)
end;

procedure TMarketServicePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMarketServicePanelProps.Controls_ClearPropData;
begin
end;

end.
