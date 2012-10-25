unit unitMODELUserBillingAccountPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  MSXML,
  DBClient,
  GlobalSpaceDefines,
  Functionality,
  TypesDefines,
  TypesFunctionality,
  StdCtrls, ComCtrls, Menus;

//. transferred from unit SpaceUserBillingServerDefines.pas
const
  //. Tariffs
//USERBILLINGTYPE_SUSPENDEDTARIFF               < 0;
  USERBILLINGTYPE_NONE                          = 0;
  USERBILLINGTYPE_TARIFF_DAILY_RUB_ORDINARY     = 1;
  USERBILLINGTYPE_TARIFF_MONTHLY_RUB_ORDINARY   = 2;
  //. Transaction reasons
  TRANSACTION_REASON_UNKNOWN            = 0;
  TRANSACTION_REASON_DEPOSIT            = 1;
  TRANSACTION_REASON_DEBIT              = 2;
  TRANSACTION_REASON_TARIFICATION       = 3;
  TRANSACTION_REASON_SUSPENDTARIFF      = 4;
  TRANSACTION_REASON_RESUMETARIFF       = 5;
  TRANSACTION_REASON_CHANGETARIFF       = 6;
//.

const
  UserBillingTypeStrings: array[0..2] of string = ('none','daily rub tariff ordinary','monthly rub tariff ordinary');

  TransactionReasonStrings: array[0..6] of string = ('unknown','deposit','debit','tarification','suspend tariff','resume tariff','change tariff');


type
  TfmMODELUserBillingAccountPanel = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lvTransactions: TListView;
    Label3: TLabel;
    edAccount: TEdit;
    cbTariff: TComboBox;
    cbTariff_Popup: TPopupMenu;
    SuspendResumetariff1: TMenuItem;
    procedure cbTariffChange(Sender: TObject);
    procedure SuspendResumetariff1Click(Sender: TObject);
  private
    { Private declarations }
    ServerURL: WideString;
    UserName: WideString;
    UserPassword: WideString;
    MODELUserID: integer;
  public
    { Public declarations }
    Constructor Create(const pServerURL: WideString; const pUserName: WideString; const pUserPassword: WideString; const pMODELUserID: integer);
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
  end;

implementation
uses
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface;
  {$ELSE}
  SpaceInterfacesImport;
  {$ENDIF}

{$R *.dfm}


{TfmMODELUserBillingAccountPanel}
Constructor TfmMODELUserBillingAccountPanel.Create(const pServerURL: WideString; const pUserName: WideString; const pUserPassword: WideString; const pMODELUserID: integer);
var
  I: integer;
begin
Inherited Create(nil);
ServerURL:=pServerURL;
UserName:=pUserName;
UserPassword:=pUserPassword;
MODELUserID:=pMODELUserID;
//.
cbTariff.Items.BeginUpdate();
try
cbTariff.Items.Clear();
for I:=0 to Length(UserBillingTypeStrings)-1 do cbTariff.Items.Add(UserBillingTypeStrings[I]);
finally
cbTariff.Items.EndUpdate();
end;
end;

Destructor TfmMODELUserBillingAccountPanel.Destroy();
begin
Inherited;
end;

procedure TfmMODELUserBillingAccountPanel.Update();
const
  BillingDataVersion = 1;
var
  {$IFNDEF EmbeddedServer}
  MODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
  {$ENDIF}
  Account: double;
  BT: integer;
  flSuspendedTariff: boolean;
  BillingData: TByteArray;
  Idx: integer;
  Version: integer;
  ItemsCount: integer;
  I: integer;
  id: integer;
  Timestamp: double;
  Reason: integer;
  Delta: double;
  Summary: double;
  SS: byte;
  Comment: shortstring;
begin
{$IFNDEF EmbeddedServer}
MODELUserSOAPFunctionality:=GetITMODELUserSOAPFunctionality(ServerURL);
Account:=MODELUserSOAPFunctionality.Billing_Account(UserName,UserPassword,MODELUserID);
edAccount.Text:=FormatFloat('0.00',Account);
if (Account >= 0)
 then begin
  edAccount.Color:=clWindow;
  edAccount.Font.Color:=clWindowText;
  end
 else begin
  edAccount.Color:=clRed;
  edAccount.Font.Color:=clWhite;
  end;
//.
BT:=MODELUserSOAPFunctionality.getBillingType(UserName,UserPassword,MODELUserID);
if (BT < 0)
 then begin
  flSuspendedTariff:=true;
  BT:=-BT;
  end
 else flSuspendedTariff:=false;
cbTariff.Text:=UserBillingTypeStrings[BT];
if (flSuspendedTariff) then cbTariff.Text:=cbTariff.Text+' [SUSPENDED]';
//.
MODELUserSOAPFunctionality.Billing_Transactions_GetData(UserName,UserPassword,MODELUserID, BillingDataVersion,{out} BillingData);
lvTransactions.Items.BeginUpdate();
try
lvTransactions.Items.Clear();
//. process data
if (BillingData <> nil)
 then begin
  Idx:=0;
  Version:=Integer(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(Version));
  if (Version <> BillingDataVersion) then Raise Exception.Create('unknown billing data version'); //. =>
  //.
  ItemsCount:=Integer(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(ItemsCount));
  for I:=0 to ItemsCount-1 do with lvTransactions.Items.Insert(0) do begin
    id:=Integer(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(id));
    Timestamp:=Double(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(Timestamp));
    Reason:=Integer(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(Reason));
    Delta:=Double(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(Delta));
    Summary:=Double(Pointer(@BillingData[Idx])^); Inc(Idx,SizeOf(Summary));
    SS:=BillingData[Idx]; Inc(Idx); SetLength(Comment,SS); if (SS > 0) then Move(Pointer(@BillingData[Idx])^,Pointer(@Comment[1])^,SS); Inc(Idx,SS);
    //.
    Data:=Pointer(id);
    Caption:=IntToStr(id);
    SubItems.Add(FormatDateTime('YY/MM/DD HH:NN:SS',Timestamp));
    if ((0 <= Reason) AND (Reason < Length(TransactionReasonStrings)))
     then SubItems.Add(TransactionReasonStrings[Reason]) else SubItems.Add('ReasonID: '+IntToStr(Reason));
    SubItems.Add(FormatFloat('0.00',Delta));
    SubItems.Add(FormatFloat('0.00',Summary));
    SubItems.Add(Comment);
    end;
  end;
finally
lvTransactions.Items.EndUpdate();
end;
{$ELSE}
Raise Exception.Create('operation unavaiable for embedded server mode'); //. =>
{$ENDIF}
end;

procedure TfmMODELUserBillingAccountPanel.cbTariffChange(Sender: TObject);
{$IFNDEF EmbeddedServer}
var
  MODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
{$ENDIF}
begin
{$IFNDEF EmbeddedServer}
MODELUserSOAPFunctionality:=GetITMODELUserSOAPFunctionality(ServerURL);
MODELUserSOAPFunctionality.setBillingType(UserName,UserPassword,MODELUserID, cbTariff.ItemIndex);
{$ENDIF}
end;

procedure TfmMODELUserBillingAccountPanel.SuspendResumetariff1Click(Sender: TObject);
var
  {$IFNDEF EmbeddedServer}
  MODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
  {$ENDIF}
  BT: integer;
begin
{$IFNDEF EmbeddedServer}
MODELUserSOAPFunctionality:=GetITMODELUserSOAPFunctionality(ServerURL);
BT:=MODELUserSOAPFunctionality.getBillingType(UserName,UserPassword,MODELUserID);
if (BT = 0) then Exit; //. ->
BT:=-BT;
MODELUserSOAPFunctionality.setBillingType(UserName,UserPassword,MODELUserID, BT);
//.
Update();
{$ENDIF}
end;


end.
