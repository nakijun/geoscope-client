unit unitOfferGoodsEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, Functionality, TypesFunctionality, TypesDefines, Db, StdCtrls,
  Buttons, ExtCtrls, RXCtrls, Grids, Menus, ComCtrls;

type
  TGoodsListItemDescr = record
    idOfferGoods: integer;
    flDeleted: boolean;
    flSaved: boolean;
  end;

  function TGoodsListItemDescr_Create: pointer;
  procedure TGoodsListItemDescr_Destroy(const ptrInstance: pointer);

type
  TfmOfferGoodsEditor = class(TForm)
    GoodsList_Popup: TPopupMenu;
    NCreateNew: TMenuItem;
    NDestroySelected: TMenuItem;
    Panel3: TPanel;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    RxLabel3: TRxLabel;
    lbUID: TRxLabel;
    edName: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edGoodsSearchContext: TEdit;
    GoodsList: TStringGrid;
    ComboBox: TComboBox;
    N1: TMenuItem;
    N2: TMenuItem;
    dbf1: TMenuItem;
    dbf2: TMenuItem;
    N3: TMenuItem;
    StaticText1: TStaticText;
    StaticText5: TStaticText;
    StatusBar: TStatusBar;
    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxExit(Sender: TObject);
    procedure GoodsListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure NCreateNewClick(Sender: TObject);
    procedure NDestroySelectedClick(Sender: TObject);
    procedure GoodsListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsListDblClick(Sender: TObject);
    procedure GoodsListTopLeftChanged(Sender: TObject);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edGoodsSearchContextKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsListGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure GoodsListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GoodsListExit(Sender: TObject);
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edScheduleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edContactTLFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edGoodsSearchContextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GoodsList_PopupPopup(Sender: TObject);
    procedure GoodsListMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    OfferFunctionality: TOfferFunctionality;
    GoodsList_DefaultFontColor: TColor;
    GoodsList_DefaultFontStyle: TFontStyles;
    GoodsList_DefaultBrushColor: TColor;
    GoogsList_flInEditing: boolean;
    GoodsList_EditString: string;

    procedure CommonKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Controls_ClearPropData;
  public
    { Public declarations }
    Constructor Create(pOfferFunctionality: TOfferFunctionality);
    destructor Destroy; override;
    procedure Update;

    procedure Props_Update;
    procedure GoodsList_Update;
    procedure GoodsList_Clear;
    procedure GoodsList_CreateNew;
    procedure GoodsList_ToggleItemDestroyState(const ixItem: integer);
    procedure GoodsList_ToggleSelectedItemDestroyState;
    procedure GoodsList__Selected_ShowPanelProps;
    function GoodsList__Selected_EditType: boolean;
    function GoodsList_flItemsChanged: boolean;
    procedure GoodsList_UpdateRemoteDatabase;
  end;

implementation
Uses
  unitGoodsEditor;

{$R *.DFM}

{TGoodsListItemDescr}
function TGoodsListItemDescr_Create: pointer;
begin
GetMem(Result,SizeOf(TGoodsListItemDescr));
with TGoodsListItemDescr(Result^) do begin
idOfferGoods:=0;
flDeleted:=false;
flSaved:=false;
end;
end;

procedure TGoodsListItemDescr_Destroy(const ptrInstance: pointer);
begin
FreeMem(ptrInstance,SizeOf(TGoodsListItemDescr));
end;


{TfmOfferGoodsEditor}
Constructor TfmOfferGoodsEditor.Create(pOfferFunctionality: TOfferFunctionality);
var
  MeasurementsList: TStringList;
begin
Inherited Create(nil);
OfferFunctionality:=pOfferFunctionality;
OfferFunctionality.AddRef;
MeasureUnits_GetInstanceList(MeasurementsList);
with ComboBox do begin
Clear;
Items.Assign(MeasurementsList);
Visible:=false;
end;
MeasurementsList.Destroy;
{The combobox height is not settable, so we will}
{instead size the grid to fit the combobox!}
with GoodsList do begin
DefaultRowHeight:=ComboBox.Height-1;
GoodsList_DefaultFontColor:=Font.Color;
GoodsList_DefaultFontStyle:=Font.Style;
GoodsList_DefaultBrushColor:=Brush.Color;
GoogsList_flInEditing:=false;
end;
GoodsList_Clear;
Props_Update;
end;

destructor TfmOfferGoodsEditor.Destroy;
begin
GoodsList_Clear;
OfferFunctionality.Release;
Inherited;
end;

procedure TfmOfferGoodsEditor.Props_Update;
var
  CT: integer;
begin
edName.Text:=OfferFunctionality.Name;
lbUID.Caption:=IntToStr(OfferFunctionality.UID);
end;

procedure TfmOfferGoodsEditor.GoodsList_Update;
var
  Goods: TList;
  I: integer;
  idOfferGoods_: integer;
  GoodsName: string;
  GoodsKey_: integer;
  GoodsAmount: extended;
  GoodsMeasurementName: string;
  idGoodsMeasurement: integer;
  GoodsMinPrice: Currency;
  GoodsMisc: string;
  SC: TCursor;
  DS: Char;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
GoodsList_Clear;
{/// + with GoodsList,OfferFunctionality.Space.TObjPropsQuery_Create do
try
EnterSQL(
  'SELECT OfferGoods.Key_,Goods.Name,Goods.Key_ GoodsKey_,OfferGoods.Amount,Measurements.Name MeasurementName,OfferGoods.idMeasurement,OfferGoods.MinPrice,OfferGoods.Misc '+
  'FROM OfferGoods,Goods,Measurements '+
  'WHERE '+
  '  Goods.Name LIKE ''%'+edGoodsSearchContext.Text+'%'' AND '+
  '  OfferGoods.idOffer = '+IntToStr(OfferFunctionality.idObj)+' AND '+
  '  OfferGoods.idGoods = Goods.Key_ AND '+
  '  OfferGoods.idMeasurement = Measurements.Key_ '+
  'ORDER BY '+
  '  Goods.Name'
);
Open;
if RecordCount > 0
 then begin
  RowCount:=RecordCount+1;
  I:=1;
  while NOT EOF do begin
    idOfferGoods_:=FieldValues['Key_'];
      //. получаем тип товара
    GoodsName:=FieldValues['Name'];
    GoodsKey_:=FieldValues['GoodsKey_'];
    Objects[1,I]:=TObject(GoodsKey_);
    Cells[1,I]:=GoodsName;
    //. получаем количество товара
    if FieldValues['Amount'] <> null
     then begin
      GoodsAmount:=FieldValues['Amount'];
      DS:=DecimalSeparator;
      DecimalSeparator:='.';
      Cells[2,I]:=FormatFloat('0.######',GoodsAmount);
      DecimalSeparator:=DS;
      end
     else
      Cells[2,I]:='';
    //. получаем единицу измерения количества
    idGoodsMeasurement:=FieldValues['idMeasurement'];
    GoodsMeasurementName:=FieldValues['MeasurementName'];
    Objects[3,I]:=TObject(idGoodsMeasurement);
    Cells[3,I]:=GoodsMeasurementName;
    //. получаем минимальную цену товара
    if FieldValues['MinPrice'] <> null
     then begin
      GoodsMinPrice:=FieldValues['MinPrice'];
      DS:=DecimalSeparator;
      DecimalSeparator:='-';
      Cells[4,I]:=FormatFloat('0.00',GoodsMinPrice);
      DecimalSeparator:=DS;
      end
     else
      Cells[4,I]:='';
    //. получаем прочую информацию
    if FieldValues['Misc'] <> null
     then GoodsMisc:=FieldValues['Misc']
     else GoodsMisc:='';
    Cells[5,I]:=GoodsMisc;

    Objects[0,I]:=TGoodsListItemDescr_Create;
    with TGoodsListItemDescr(Pointer(Objects[0,I])^) do begin
    idOfferGoods:=idOfferGoods_;
    flDeleted:=false;
    flSaved:=true;
    end;
    Cells[0,I]:=IntToStr(I);

    Inc(I);
    Next;
    end;
  end;
finally
Destroy;
end;}
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmOfferGoodsEditor.GoodsList_Clear;
var
  I: integer;
begin
//. clear slots
with GoodsList do
for I:=0 to RowCount-1 do
  if Objects[0,I] <> nil
   then begin
    TGoodsListItemDescr_Destroy(Objects[0,I]);
    Objects[0,I]:=nil;
    end;
//. init list view
with GoodsList do begin
RowCount:=2;
Cells[0,0]:='№';
Cells[1,0]:='Goods name';
Cells[2,0]:='How much';
Cells[3,0]:='Measurement';
Cells[4,0]:='Price (rub)';
Cells[5,0]:='Other';
Cells[0,1]:='';
Cells[1,1]:='';
Cells[2,1]:='';
Cells[3,1]:='';
Cells[4,1]:='';
Cells[5,1]:='';
end;
end;

procedure TfmOfferGoodsEditor.Update;
begin
Props_Update;
GoodsList_Update;
end;

procedure TfmOfferGoodsEditor.GoodsList_CreateNew;
var
  ixNewItem: integer;
begin
with GoodsList do begin
GoodsList.SetFocus;
if (RowCount = 2) AND (Objects[0,1] = nil)
 then
  ixNewItem:=1
 else begin
  ixNewItem:=RowCount;
  RowCount:=RowCount+1;
  end;
//. ItemDescriptor creating
Objects[0,ixNewItem]:=TGoodsListItemDescr_Create;
with TGoodsListItemDescr(Pointer(Objects[0,ixNewItem])^) do begin
idOfferGoods:=0;
flDeleted:=false;
flSaved:=false;
end;
//. init Goods
Objects[1,ixNewItem]:=TObject(idUnknownGoods);
Cells[1,ixNewItem]:=sUnknownGoods;
//. init Amount
Cells[2,ixNewItem]:='';
//. init MeasurUnit
Objects[3,ixNewItem]:=TObject(idUnknownMeasureUnit);
Cells[3,ixNewItem]:=sUnknownMeasureUnit;
//. init MinPrice
Cells[4,ixNewItem]:='';
//. init Misc
Cells[5,ixNewItem]:='';
//. init Number
Cells[0,ixNewItem]:=IntToStr(RowCount-1);

Col:=1;
Row:=ixNewItem; //. select ixNewItem Row
Application.ProcessMessages;
if NOT GoodsList__Selected_EditType
 then begin
  TGoodsListItemDescr_Destroy(Pointer(Objects[0,ixNewItem]));
  if ixNewItem = 1
   then begin
    Objects[0,1]:=nil; 
    Cells[0,1]:='';
    Cells[1,1]:='';
    Cells[2,1]:='';
    Cells[3,1]:='';
    Cells[4,1]:='';
    Cells[5,1]:='';
    end
   else
    RowCount:=RowCount-1;
  Exit; //. ->
  end;
end;
end;

procedure TfmOfferGoodsEditor.GoodsList_ToggleItemDestroyState(const ixItem: integer);
begin
with GoodsList do
if (ixItem < RowCount) AND (Objects[0,ixItem] <> nil)
 then begin
  TGoodsListItemDescr(Pointer(Objects[0,ixItem])^).flDeleted:=NOT TGoodsListItemDescr(Pointer(Objects[0,ixItem])^).flDeleted;
  RePaint;
  end;
end;

procedure TfmOfferGoodsEditor.GoodsList_ToggleSelectedItemDestroyState;
begin
GoodsList_ToggleItemDestroyState(GoodsList.Row);
end;

procedure TfmOfferGoodsEditor.GoodsList__Selected_ShowPanelProps;
begin
end;

function TfmOfferGoodsEditor.GoodsList__Selected_EditType: boolean;
var
  idNewGoods: integer;
  SC: TCursor;

  function IsGoodsAlreadyExist(const idGoods: integer; const indexExceptOfferGoods: integer): boolean;
  var
    I: integer;
  begin
  Result:=false;
  for I:=1 to GoodsList.RowCount-1 do
    if (I <> indexExceptOfferGoods) AND (Integer(GoodsList.Objects[1,I]) = idGoods)
     then begin
      Result:=true;
      Exit;
      end;
  end;

begin
Result:=false;
if (GoodsList.Row = 1) AND (GoodsList.Objects[0,GoodsList.Row] = nil) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
with GoodsList,TfmGoodsEditor.Create do begin
edGoodsName.Text:=Cells[1,Row];
if Select(idNewGoods) AND (NOT IsGoodsAlreadyExist(idNewGoods,Row) OR (Application.MessageBox('! such item already exist'#$0D#$0A'want anyway ?','Attention',MB_YESNO+MB_ICONWARNING) = IDYES))
 then begin
  if TGoodsListItemDescr(Pointer(Objects[0,Row])^).flSaved
   then with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,TGoodsListItemDescr(Pointer(Objects[0,Row])^).idOfferGoods)) do
    try
    idGoods:=idNewGoods;
    finally
    Release;
    end;
  //. get Goods
  Objects[1,Row]:=TObject(idNewGoods);
  with TGoodsFunctionality(TComponentFunctionality_Create(idTGoods,Integer(Objects[1,Row]))) do
  try
  Cells[1,Row]:=Name;
  finally
  Release;
  end;
  Result:=true;
  end;
Destroy;
end;
finally
Screen.Cursor:=SC;
end;
end;

function TfmOfferGoodsEditor.GoodsList_flItemsChanged: boolean;
var
  I: integer;
begin
Result:=false;
with GoodsList do
for I:=1 to RowCount-1 do
  if (Objects[0,I] <> nil)
   then
    if TGoodsListItemDescr(Pointer(Objects[0,I])^).flDeleted
     then begin
      Result:=true;
      Exit; //. ->
      end
     else
      if NOT TGoodsListItemDescr(Pointer(Objects[0,I])^).flSaved
       then begin
        Result:=true;
        Exit; //. ->
        end;
end;

procedure TfmOfferGoodsEditor.GoodsList_UpdateRemoteDatabase;
var
  I: integer;
  DS: Char;
  SavedRowCount: integer;
  DeletedRowCount: integer;
  wsSQL: WideString;
  idGoods: integer;
  sAmount: string;
  idMeasureUnit: integer;
  MinPrice: Currency;
  sMinPrice: string;
  Misc: string;
  maxidRow: integer;

  procedure GoodsList_PackRows;
  var
    ixItem: integer;
    I: integer;
    J: integer;

    procedure AlignItemNumbers;
    var
      I: integer;
    begin
    with GoodsList do for I:=1 to RowCount-1 do Cells[0,I]:=IntToStr(I);
    end;

  begin
  with GoodsList do begin
  SetFocus;
  ixItem:=1;
  while ixItem < RowCount do
    if (Objects[0,ixItem] <> nil) AND TGoodsListItemDescr(Pointer(Objects[0,ixItem])^).flDeleted
     then begin
      I:=ixItem;
      //. delete item descriptor
      if Objects[0,I] <> nil
       then begin
        TGoodsListItemDescr_Destroy(Pointer(Objects[0,I]));
        Objects[0,I]:=nil;
        end;
      //. shift up rows
      while I < RowCount-1 do begin
        for J:=0 to ColCount-1 do begin
          Objects[J,I]:=Objects[J,I+1];
          Cells[J,I]:=Cells[J,I+1];
          end;
        Inc(I);
        end;
      if RowCount > 2
       then begin
        RowCount:=RowCount-1;
        end
       else begin
        Cells[0,1]:='';
        Cells[1,1]:='';
        Cells[2,1]:='';
        Cells[3,1]:='';
        Cells[4,1]:='';
        Cells[5,1]:='';
        end;
      end
     else
      Inc(ixItem);
  end;
  AlignItemNumbers;
  end;

begin
with GoodsList do begin
if NOT GoodsList_flItemsChanged then Raise Exception.Create(''); //. =>
StatusBar.Panels[0].Text:='transmitting to remote server ...';
Application.ProcessMessages;
try
{New Items saving into the remote database}
wsSQL:='';
SavedRowCount:=0;
for I:=1 to RowCount-1 do
  if (Objects[0,I] <> nil) AND (NOT TGoodsListItemDescr(Pointer(Objects[0,I])^).flDeleted AND NOT TGoodsListItemDescr(Pointer(Objects[0,I])^).flSaved)
   then with OfferFunctionality do begin
    //. set idGoods
    idGoods:=Integer(Objects[1,I]);
    //. set Amount
    if Cells[2,I] <> ''
     then begin
      DS:=DecimalSeparator;
      DecimalSeparator:='.';
      try
      sAmount:=FormatFloat('0.000000',StrToFloat(Cells[2,I]));
      except
        DecimalSeparator:=DS;
        Destroy;
        Raise Exception.Create('wrong value.');
        end;
      DecimalSeparator:=DS;
      end
     else sAmount:='null';
    //. set MeasureUnit
    idMeasureUnit:=Integer(Objects[3,I]);
    //. set MinPrice
    if Cells[4,I] <> ''
     then begin
      DS:=DecimalSeparator;
      DecimalSeparator:='-';
      try
      MinPrice:=StrToFloat(Cells[4,I]);
      except
        DecimalSeparator:=DS;
        Destroy;
        Raise Exception.Create('wrong price.');
        end;
      DecimalSeparator:='.';
      sMinPrice:=FormatFloat('0.000000',MinPrice);
      DecimalSeparator:=DS;
      end
     else sMinPrice:='null';
    //. set Misc
    if Cells[5,I] <> null
     then Misc:=Cells[5,I]
     else Misc:='';
    //. prepare summary SQL string
    wsSQL:=wsSQL+'INSERT INTO OfferGoods (idOffer,idGoods,Amount,idMeasurement,MinPrice,Misc,Key_) Values('+IntToStr(idObj)+','+IntToStr(idGoods)+','+sAmount+','+IntToStr(idMeasureUnit)+','+sMinPrice+','''+Misc+''',0)'#$0D#$0A;
    //.
    Inc(SavedRowCount);
    end;
//. add new rows
{/// + if SavedRowCount > 0
 then with OfferFunctionality.Space.TObjPropsQuery_Create do
  try
  case SQLServerType of
  sqlInformix: EnterSQL('LOCK TABLE OfferGoods IN EXCLUSIVE MODE');
  sqlMySQL: EnterSQL('LOCK TABLE OfferGoods WRITE');
  else
    Raise Exception.Create('choosing sql server: unknown server'); //. =>
  end;
  ExecSQL;
  try
  EnterSQL(wsSQL);
  ExecSQL;
  EnterSQL('SELECT Max(Key_) MaxID FROM OfferGoods');
  Open;
  maxidRow:=FieldValues['MaxID'];
  finally //! если связь рассыпится, то возможен случай когда таблица может быть заблокирована до окончания сессии
  case SQLServerType of
  sqlInformix: EnterSQL('UNLOCK TABLE OfferGoods');
  sqlMySQL: EnterSQL('UNLOCK TABLES');
  else
    Raise Exception.Create('choosing sql server: unknown server'); //. =>
  end;
  ExecSQL;
  end;
  finally
  Destroy;
  end; }
//. установка IDs для незаписанных строк
for I:=RowCount-1 downto 1 do
  if (Objects[0,I] <> nil) AND (NOT TGoodsListItemDescr(Pointer(Objects[0,I])^).flDeleted AND NOT TGoodsListItemDescr(Pointer(Objects[0,I])^).flSaved)
   then with TGoodsListItemDescr(Pointer(Objects[0,I])^) do begin
    idOfferGoods:=maxidRow;
    flSaved:=true;
    Dec(maxidRow);
    end;
{Deleted-marked Items deleting}
wsSQL:='DELETE FROM OfferGoods WHERE Key_ in (';
DeletedRowCount:=0;
for I:=1 to RowCount-1 do
  if (Objects[0,I] <> nil) AND (TGoodsListItemDescr(Pointer(Objects[0,I])^).flDeleted AND TGoodsListItemDescr(Pointer(Objects[0,I])^).flSaved) 
   then begin
    wsSQL:=wsSQL+IntToStr(TGoodsListItemDescr(Pointer(Objects[0,I])^).idOfferGoods)+',';
    Inc(DeletedRowCount);
    end;
//. delete rows
{/// + if DeletedRowCount > 0
 then with OfferFunctionality.Space.TObjPropsQuery_Create do
  try
  SetLength(wsSQL,Length(wsSQL)-1); wsSQL:=wsSQL+')';
  case SQLServerType of
  sqlInformix: EnterSQL('LOCK TABLE OfferGoods IN EXCLUSIVE MODE');
  sqlMySQL: EnterSQL('LOCK TABLE OfferGoods WRITE');
  else
    Raise Exception.Create('choosing sql server: unknown server'); //. =>
  end;
  ExecSQL;
  try
  EnterSQL(wsSQL);
  ExecSQL;
  finally //! если связь рассыпится, то возможен случай когда таблица может быть заблокирована до окончания сессии
  case SQLServerType of
  sqlInformix: EnterSQL('UNLOCK TABLE OfferGoods');
  sqlMySQL: EnterSQL('UNLOCK TABLES');
  else
    Raise Exception.Create('choosing sql server: unknown server'); //. =>
  end;
  ExecSQL;
  end;
  finally
  Destroy;
  end;}
GoodsList_PackRows;
//. update goodslist view
RePaint;
//.
finally
StatusBar.Panels[0].Text:='';
end;
end;
StatusBar.Panels[0].Text:='transmitting successful. rows transmitted: '+IntToStr(SavedRowCount)+', rows deleted: '+IntToStr(DeletedRowCount);
end;

procedure TfmOfferGoodsEditor.Controls_ClearPropData;
begin
lbUID.Caption:='';
edName.Text:='';
GoodsList.RowCount:=5;
end;

procedure TfmOfferGoodsEditor.ComboBoxChange(Sender: TObject);
var
  idNewMeasureUnit: integer;
  idOfferGoods: integer;
begin
if (GoodsList.Row = 1) AND (GoodsList.Objects[0,GoodsList.Row] = nil) then Exit; //. ->
idOfferGoods:=TGoodsListItemDescr(Pointer(GoodsList.Objects[0,GoodsList.Row])^).idOfferGoods;
idNewMeasureUnit:=Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);
if TGoodsListItemDescr(Pointer(GoodsList.Objects[0,GoodsList.Row])^).flSaved
 then with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,idOfferGoods)) do
  try
  idMeasureUnit:=idNewMeasureUnit;
  finally
  Release;
  end;
GoodsList.Objects[3,GoodsList.Row]:=TObject(idNewMeasureUnit);
GoodsList.Cells[GoodsList.Col,GoodsList.Row]:=ComboBox.Items[ComboBox.ItemIndex];
end;

procedure TfmOfferGoodsEditor.ComboBoxExit(Sender: TObject);
begin
{Get the ComboBox selection and place in the grid}
GoodsList.Cells[GoodsList.Col,GoodsList.Row] :=ComboBox.Items[ComboBox.ItemIndex];
ComboBox.Visible := False;
GoodsList.SetFocus;
end;

procedure TfmOfferGoodsEditor.GoodsListSelectCell(Sender: TObject; ACol,ARow: Integer; var CanSelect: Boolean);
var
  R: TRect;
  I: integer;
begin
if ARow = 0 then Exit;
if (ARow = 1) AND (GoodsList.Objects[0,ARow] = nil) then Exit; //. ->
if GoogsList_flInEditing
 then begin
  CanSelect:=False;
  Exit; //. ->
  end;
ComboBox.Visible:=False;
case ACol of
1: begin
  GoodsList.Options:=GoodsList.Options-[goEditing];
  end;
2: begin
  GoodsList.Options:=GoodsList.Options+[goEditing];
  end;
3: begin
  {Size and position the combo box to fit the cell}
  GoodsList.Options:=GoodsList.Options-[goEditing];
  R:=GoodsList.CellRect(ACol, ARow);
  R.Left:=R.Left+GoodsList.Left;
  R.Right:=R.Right+GoodsList.Left;
  R.Top:=R.Top+GoodsList.Top;
  R.Bottom:=R.Bottom+GoodsList.Top;
  ComboBox.Left:=R.Left;
  ComboBox.Top:=R.Top;
  ComboBox.Width:=(R.Right)-R.Left;
  ComboBox.Height:=(R.Bottom)-R.Top;
  ComboBox.ItemIndex:=-1;
  for I:=0 to ComboBox.Items.Count-1 do
    if Integer(ComboBox.Items.Objects[I]) = Integer(GoodsList.Objects[ACol,ARow])
     then begin
      ComboBox.ItemIndex:=I;
      Break;
      end;
  {Show the combobox}
  ComboBox.Visible:=True;
  ComboBox.SetFocus;
  end;
4: begin
  GoodsList.Options:=GoodsList.Options+[goEditing];
  end;
5: begin
  GoodsList.Options:=GoodsList.Options+[goEditing];
  end;
end;
CanSelect:=true;
end;

procedure TfmOfferGoodsEditor.NCreateNewClick(Sender: TObject);
begin
GoodsList_CreateNew;
end;

procedure TfmOfferGoodsEditor.NDestroySelectedClick(Sender: TObject);
begin
GoodsList_ToggleSelectedItemDestroyState;
end;

procedure TfmOfferGoodsEditor.GoodsListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  NewAmount: Extended;
  NewMinPrice: Extended;
  NewMisc: string;
  DS: Char;

  function flUpdateRemoteDatabase: boolean;
  begin
  Result:=TGoodsListItemDescr(Pointer(GoodsList.Objects[0,GoodsList.Row])^).flSaved;
  end;

begin
case Key of
VK_RETURN: if NOT ((GoodsList.Row = 1) AND (GoodsList.Objects[0,GoodsList.Row] = nil)) then with GoodsList do
  case Col of
  1: GoodsList__Selected_EditType;
  2: if GoogsList_flInEditing then begin
    DS:=DecimalSeparator;
    DecimalSeparator:='.';
    if Cells[Col,Row] <> ''
     then begin
      try
      NewAmount:=StrToFloat(Cells[Col,Row])
      except
        DecimalSeparator:=DS;
        ShowMessage('wrong number');
        Cells[Col,Row]:=GoodsList_EditString;
        GoogsList_flInEditing:=false;
        Exit;
        end;
      DecimalSeparator:=DS;
      end
     else NewAmount:=-1;
    if flUpdateRemoteDatabase
     then with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,TGoodsListItemDescr(Pointer(Objects[0,Row])^).idOfferGoods)) do
      try
      Amount:=NewAmount;
      finally
      Release;
      end;
    GoogsList_flInEditing:=false;
    end;
  4: if GoogsList_flInEditing then begin
    DS:=DecimalSeparator;
    DecimalSeparator:='-';
    if Cells[Col,Row] <> ''
     then begin
      try
      NewMinPrice:=StrToFloat(Cells[Col,Row])
      except
        DecimalSeparator:=DS;
        ShowMessage('wrong number');
        Cells[Col,Row]:=GoodsList_EditString;
        GoogsList_flInEditing:=false;
        Exit;
        end;
      DecimalSeparator:=DS;
      end
     else NewMinPrice:=-1;
    if flUpdateRemoteDatabase
     then with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,TGoodsListItemDescr(Pointer(Objects[0,Row])^).idOfferGoods)) do
      try
      MinPrice:=NewMinPrice;
      finally
      Release;
      end;
    GoogsList_flInEditing:=false;
    end;
  5: if GoogsList_flInEditing
   then begin
    if flUpdateRemoteDatabase
     then with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTOfferGoods,TGoodsListItemDescr(Pointer(Objects[0,Row])^).idOfferGoods)) do
      try
      Misc:=Cells[Col,Row];
      finally
      Release;
      end;
    GoogsList_flInEditing:=false;
    end;
  end;
VK_ESCAPE: if GoogsList_flInEditing then with GoodsList do begin
  Cells[Col,Row]:=GoodsList_EditString;
  EditorMode:=false;
  GoogsList_flInEditing:=false;
  end;
VK_INSERT: GoodsList_CreateNew;
VK_DELETE: if NOT ((GoodsList.Row = 1) AND (GoodsList.Objects[0,GoodsList.Row] = nil)) then begin
  GoodsList_ToggleSelectedItemDestroyState;
  with GoodsList do if Row < RowCount-1 then Row:=Row+1;
  end;
else
  CommonKeyDownHandler(Sender,Key,Shift);
end;
end;

procedure TfmOfferGoodsEditor.GoodsListDblClick(Sender: TObject);
begin
with GoodsList do begin
case Col of
0: begin
  beep;
  end;
1: begin
  GoodsList__Selected_EditType;
  end;
end;
end;
end;

procedure TfmOfferGoodsEditor.GoodsListTopLeftChanged(Sender: TObject);
var
  R: TRect;
begin
with GoodsList do begin
case Col of
3: begin
  R:=CellRect(Col,Row);
  R.Left:=R.Left+Left;
  R.Right:=R.Right+Left;
  R.Top:=R.Top+Top;
  R.Bottom:=R.Bottom+Top;
  ComboBox.Left:=R.Left+1;
  ComboBox.Top:=R.Top+1;
  ComboBox.Width:=(R.Right+1)-R.Left;
  ComboBox.Height:=(R.Bottom+1)-R.Top;
  end;
end;
end;
end;

procedure TfmOfferGoodsEditor.GoodsListGetEditText(Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
if NOT GoogsList_flInEditing
 then begin
  GoodsList_EditString:=GoodsList.Cells[ACol,ARow];
  GoogsList_flInEditing:=true;
  end;
end;

procedure TfmOfferGoodsEditor.GoodsListDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  FontColor: TColor;
  FontStyle: TFontStyles;
begin
with GoodsList,Canvas do begin
if ((Objects[0,ARow] <> nil) AND NOT TGoodsListItemDescr(Pointer(Objects[0,ARow])^).flSaved) AND (ACol <> 0)
 then begin
  Font.Style:=Font.Style+[fsBold];
  Font.Color:=clSilver;
  TextRect(Rect,Rect.Left+2,Rect.Top+2, Cells[ACol, ARow]);
  end
 else begin
  Font.Color:=GoodsList_DefaultFontColor;
  Font.Style:=GoodsList_DefaultFontStyle;
  end;
if (Objects[0,ARow] <> nil) AND TGoodsListItemDescr(Pointer(Objects[0,ARow])^).flDeleted AND (ACol = 0) 
 then begin
  Pen.Color:=clRed;
  Pen.Width:=2;
  MoveTo(Rect.Left,Rect.Top);
  LineTo(Rect.Right,Rect.Bottom);
  MoveTo(Rect.Right,Rect.Top);
  LineTo(Rect.Left,Rect.Bottom);
  end;
end;
end;

procedure TfmOfferGoodsEditor.GoodsListExit(Sender: TObject);
begin
if GoogsList_flInEditing
 then begin
  GoodsList.Cells[GoodsList.Col,GoodsList.Row]:=GoodsList_EditString;
  GoogsList_flInEditing:=false;
  end;
end;

procedure TfmOfferGoodsEditor.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  OfferFunctionality.Name:=edName.Text;
  end;
end;

procedure TfmOfferGoodsEditor.edGoodsSearchContextKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D) AND ((edGoodsSearchContext.Text <> '') OR (Application.MessageBox(' ?'#$0D#$0A'get all list','',MB_YESNO+MB_ICONWARNING) = IDYES))
 then begin
  if GoodsList_flItemsChanged
   then case Application.MessageBox('Editor has new rows.'#$0D#$0A'Transmit him ?','',MB_YESNOCANCEL+MB_ICONWARNING) of
    IDYES: begin
      GoodsList_UpdateRemoteDatabase;
      end;
    IDCANCEL: Exit;                  
    end;
  GoodsList_Update;
  GoodsList.SetFocus;
  Key:=#0;
  end;
end;

procedure TfmOfferGoodsEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if GoodsList_flItemsChanged
 then case Application.MessageBox('Editor has new rows.'#$0D#$0A'Transmit him ?','',MB_YESNOCANCEL+MB_ICONWARNING) of
  IDYES: begin
    GoodsList_UpdateRemoteDatabase;
    CanClose:=true;
    end;
  IDCANCEL: CanClose:=false;
  end;
end;

procedure TfmOfferGoodsEditor.ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
with Sender as TComboBox do
case Key of
VK_LEFT: begin
  GoodsList.SetFocus;
  GoodsList.Col:=GoodsList.Col-1;
  Key:=0;
  end;
VK_RIGHT: begin
  GoodsList.SetFocus;
  GoodsList.Col:=GoodsList.Col+1;
  Key:=0;
  end;
else
  GoodsListKeyDown(Sender,Key,Shift);
end;
end;

procedure TfmOfferGoodsEditor.CommonKeyDownHandler(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_F5: GoodsList_UpdateRemoteDatabase;
end;
end;

procedure TfmOfferGoodsEditor.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDownHandler(Sender,Key,Shift);
end;

procedure TfmOfferGoodsEditor.edPasswordKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDownHandler(Sender,Key,Shift);
end;

procedure TfmOfferGoodsEditor.edScheduleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDownHandler(Sender,Key,Shift);
end;

procedure TfmOfferGoodsEditor.edContactTLFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDownHandler(Sender,Key,Shift);
end;

procedure TfmOfferGoodsEditor.edGoodsSearchContextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDownHandler(Sender,Key,Shift);
end;

procedure TfmOfferGoodsEditor.GoodsList_PopupPopup(Sender: TObject);
begin
GoodsList.EditorMode:=false;
GoogsList_flInEditing:=false;
end;

procedure TfmOfferGoodsEditor.GoodsListMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol,ARow: longint;
begin
with GoodsList do
case Button of
mbLeft: begin
  MouseToCell(X,Y, ACol,ARow);
  if ACol = 0
   then
    with TOfferGoodsFunctionality(TComponentFunctionality_Create(idTGoods,Integer(Objects[1,ARow]))) do
    try
    with TPanelProps_Create(false, 0,nil, nilObject) do begin
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end;
  end;
end;
end;

end.

