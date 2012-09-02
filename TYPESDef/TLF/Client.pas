unit Client;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Buttons, Dialogs,
  ExtCtrls, StdCtrls, Db, DBTables, TypesFunctionality;

Const
  Client_NTable = 'Clients';

type
  TPanelClientData = class (TPanel)
  private
    FLabelCaptClient: TLabel;
    FLabelClientName: TLabel;
    FLabelCaptClientFAccount: TLabel;
    FLabelClientFAccount: TLabel;
    FLabelCaptClientCathegory: TLabel;
    FLabelClientCathegory: TLabel;
    FButtonChangeClient: TBitBtn;
    procedure ChangeClient(pClientKey_: integer);
    procedure SpeedFButtonChangeClientClick(Sender: TObject);
  public
    Space: TProxySpace;
    ClientName: string;
    ClientKey_: integer;
    ClientAddress: TAddress;
    PanelClientAddress: TPanelAddress;
    Constructor Create(pSpace: TProxySpace; pClientKey_: integer; Owner: TWinControl;pLeft,pTop: integer);
    destructor Destroy; override;
  end;

implementation
Uses
  UnitFormClients;

{TPanelClientData}
Constructor TPanelClientData.Create(pSpace: TProxySpace; pClientKey_: integer; Owner: TWinControl;pLeft,pTop: integer);
begin
Inherited Create(Owner);
Space:=pSpace;
ClientAddress:=TAddress.Create(Space, 0,0,'','','');
Parent:=Owner;
Left:=pLeft;
Top:=pTop;
Width:=729;
Height:=241;
TabOrder:=0;
FLabelCaptClient:=TLabel.Create(Self);
FLabelClientName:=TLabel.Create(Self);
PanelClientAddress:=TPanelAddress.Create(Space, ClientAddress,true, Self,5,100);
FLabelCaptClientFAccount:=TLabel.Create(Self);
FLabelClientFAccount:=TLabel.Create(Self);
FLabelCaptClientCathegory:=TLabel.Create(Self);
FLabelClientCathegory:=TLabel.Create(Self);
FButtonChangeClient:=TBitBtn.Create(Self);
with FLabelCaptClient do begin
Parent:=Self;
Left:=17;
Top:=17;
Width:=60;
Height:=20;
Caption:='Client:';
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWindowText;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[];
ParentFont:=False;
end;
with FLabelClientName do begin
Parent:=Self;
Left:=89;
Top:=17;
Width:=548;
Height:=20;
Alignment:=taCenter;
AutoSize:=False;
Color:=clBlue;
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWhite;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[fsBold];
ParentColor:=False;
ParentFont:=False;
end;
with FLabelCaptClientFAccount do begin
Parent:=Self;
Left:=17;
Top:=52;
Width:=113;
Height:=20;
Caption:='Account: ';
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWindowText;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[];
ParentFont:=False;
end;
with FLabelClientFAccount do begin
Parent:=Self;
Left:=137;
Top:=52;
Width:=6;
Height:=20;
Color:=clWhite;
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWindowText;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[fsBold];
ParentColor:=False;
ParentFont:=False;
end;
with FLabelCaptClientCathegory do begin
Parent:=Self;
Left:=17;
Top:=75;
Width:=113;
Height:=20;
Caption:='Cathegory: ';
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWindowText;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[];
ParentFont:=False;
end;
with FLabelClientCathegory do begin
Parent:=Self;
Left:=137;
Top:=75;
Width:=6;
Height:=20;
Color:=clWhite;
Font.Charset:=DEFAULT_CHARSET;
Font.Color:=clWindowText;
Font.Height:=-16;
Font.Name:='MS Sans Serif';
Font.Style:=[fsBold];
ParentColor:=False;
ParentFont:=False;
end;
with FButtonChangeClient do begin
Parent:=Self;
Left:=645;
Top:=17;
Width:=80;
Height:=20;
Caption:='Change...';
OnClick:=SpeedFButtonChangeClientClick;
end;
ChangeClient(pClientKey_);
Show;
end;

destructor TPanelClientData.Destroy;
begin
ClientAddress.Free;
Inherited;
end;

procedure TPanelClientData.ChangeClient(pClientKey_: integer);
var
  strClCode: string;
  FAccount: integer;
  strFAccount: string;
  Cathegory: integer;
  strCathegory: string;
  CathegoryName: string;
  Point_Key,Street_Key: integer;
  strPoint_Key,strStreet_Key: string;
  Point,Street,House,Corps,Apartment: string;
  NewAddress: TAddress;
begin
Str(pClientKey_,strClCode);
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT * FROM '+Client_NTable+' WHERE clcode = '+strClCode);
Open;
try ClientName:=FieldValues['cname'] except ClientName:='' end;
try FAccount:=FieldValues['faccount'] except FAccount:=0 end;
try Cathegory:=FieldValues['category'] except Cathegory:=0 end;
try Point_Key:=FieldValues['pcode'] except Point_Key:=0 end;
try Street_Key:=FieldValues['strcode'] except Street_Key:=0 end;
try House:=FieldValues['Home'] except House:='' end;
try Corps:=FieldValues['Corps'] except Corps:='' end;
try Apartment:=FieldValues['Apartment'] except Apartment:='' end;
Close;
Str(Point_Key,strPoint_Key);
EnterSQL('SELECT pname FROM Point WHERE pcode = '+strPoint_Key);
Open;
try Point:=FieldValues['pname'] except Point:='' end;
Close;
Str(Street_Key,strStreet_Key);
EnterSQL('SELECT stype,sname FROM Street WHERE scode = '+strStreet_Key);
Open;
try Street:=FieldValues['stype']+FieldValues['sname'] except Street:='' end;
Str(Cathegory,strCathegory);
Close;
EnterSQL('SELECT catname FROM Category WHERE catcode = '+strCathegory);
Open;
try CathegoryName:=FieldValues['catname'] except CathegoryName:='' end;
Destroy;
end;
Str(FAccount,strFAccount);
FLabelClientName.Caption:=ClientName;
FLabelClientFAccount.Caption:=strFAccount;
FLabelClientCathegory.Caption:=CathegoryName;
NewAddress:=TAddress.Create(Space, Point_Key,Street_Key,House,Corps,Apartment);
PanelClientAddress.AssignAddress(NewAddress);
NewAddress.Destroy;
ClientKey_:=pClientKey_;
end;

procedure TPanelClientData.SpeedFButtonChangeClientClick(Sender: TObject);
var
  Client_Key: integer;
begin
with TFormClients.Create(Space) do begin
if SelectClient(Client_Key)
 then ChangeClient(Client_Key)
end;
end;


end.
