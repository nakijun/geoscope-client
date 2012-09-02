unit unitGMOBusinessModelDeviceInitializerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredObjectModel,
  unitGMOBusinessModel,
  ExtCtrls;

type
  TfmGMOBusinessModelDeviceInitializerPanel = class(TBusinessModelDeviceInitializerPanel)
    Timer: TTimer;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edGeoGraphServerAddress: TEdit;
    edObjectID: TEdit;
    edObjectUserID: TEdit;
    edObjectUserPassword: TEdit;
    edObjectDevicePassword: TEdit;
    pcDeviceInitialization: TPageControl;
    TabSheet1: TTabSheet;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    bbWriteDeviceConfiguration: TBitBtn;
    edDevicePhoneNumber: TEdit;
    SMSInitialization_edPortSpeed: TEdit;
    SMSInitialization_cbSendingMethod: TComboBox;
    SMSInitialization_cbPort: TComboBox;
    TabSheet2: TTabSheet;
    procedure bbWriteDeviceConfigurationClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    BusinessModel: TGMOBusinessModel;
    
    procedure InitializeBySMS;
  public
    { Public declarations }
    Constructor Create(const pBusinessModel: TGMOBusinessModel);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;

  TCOMTextedTransmitter = class
  private
    Handle: THandle;

    Constructor Create(const pPort: string; const pPortSpeed: integer);
    Destructor Destroy; override;
    function ReadLn(): shortstring;
    procedure WriteLn(Ln: shortstring);
    procedure CheckOK();
    procedure ProcessCommand(const Command: shortstring);
  end;

  TSMSSendingType = (sstUnknown,sstText,sstPDU);

  TSMSTransmitter = class
  private
    SendingType: TSMSSendingType;

    Constructor Create();
    procedure SendMessage(const Address: shortstring; const Message: shortstring); virtual; abstract;
  end;

  TSMSTextedTransmitter = class(TSMSTransmitter)
  private
    Handle: THandle;

    Constructor Create(const pPort: string; const pPortSpeed: integer); 
    Destructor Destroy; override;
    procedure SendMessage(const Address: shortstring; const Message: shortstring); override;
    function ReadString(const StringSize: longword): shortstring;
    procedure WriteString(const Ln: shortstring);
    function ReadLn(SkipLnCount: integer): shortstring;
    procedure WriteLn(Ln: shortstring);
  end;

Const
  SMSSendingTypeStrings: array[TSMSSendingType] of string = ('Unknown','Text','PDU');

implementation
Uses
  Registry,
  StrUtils,
  Clipbrd,
  FunctionalityImport,
  TypesDefines;

{$R *.dfm}

{TCOMTextedTransmitter}
Constructor TCOMTextedTransmitter.Create(const pPort: string; const pPortSpeed: integer);
var
  PortName: string;
  DCB: TDCB;
  Timeouts: TCommTimeouts;
begin
Inherited Create();
Handle:=INVALID_HANDLE_VALUE;
PortName:='\\.\'+pPort;
Handle:=CreateFile(PChar(PortName),GENERIC_READ+GENERIC_WRITE,0,nil,OPEN_EXISTING,0,0);
if (Handle = INVALID_HANDLE_VALUE) then Raise Exception.Create('cannot open comm port '+PortName+': '+SysErrorMessage(GetLastError)); //. =>
if (NOT GetCommState(Handle, DCB)) then Raise Exception.Create('could not get comm state'); //. =>
DCB.BaudRate:=pPortSpeed;
if (NOT SetCommState(Handle, DCB)) then Raise Exception.Create('could not set comm state'); //. =>
Timeouts.ReadIntervalTimeout:=0;
Timeouts.ReadTotalTimeoutMultiplier:=0;
Timeouts.ReadTotalTimeoutConstant:=3000;
Timeouts.WriteTotalTimeoutMultiplier:=0;
Timeouts.WriteTotalTimeoutConstant:=0;
if (NOT SetCommTimeouts(Handle,Timeouts)) then Raise Exception.Create('could not set comm timeouts'); //. =>
end;

Destructor TCOMTextedTransmitter.Destroy;
begin
if (Handle <> INVALID_HANDLE_VALUE) then CloseHandle(Handle);
Inherited;
end;

function TCOMTextedTransmitter.ReadLn(): shortstring;

  function GetLn: shortstring;
  var
    C: Char;
    NumberOfActualReadBytes: longword;
    R: shortstring;
  begin
  R:='';
  repeat
    if ((NOT ReadFile(Handle,C,1,NumberOfActualReadBytes,nil)) OR (NumberOfActualReadBytes <> 1)) then Raise Exception.Create('could not read port'); //. =>
    if ((C <> #$0D) AND (C <> #$0A)) then R:=R+C;
  until (C = #$0A);
  Result:=R;
  end;

begin
Result:=GetLn();
end;

procedure TCOMTextedTransmitter.WriteLn(Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
Ln:=Ln+#$0D#$0A;
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

procedure TCOMTextedTransmitter.CheckOK();
var
  Response: shortstring;
begin
Response:=ReadLn();
Response:=ReadLn();
if ((Length(Response) >= 2) AND ((Response[1] = 'O') AND (Response[2] = 'K'))) then Exit; //. ->
Raise Exception.Create('response error'); //. =>
end;

procedure TCOMTextedTransmitter.ProcessCommand(const Command: shortstring);
begin
try
WriteLn(Command);
CheckOK();
except
  on E: Exception do Raise Exception.Create('error of command: '+Command+', '+E.Message); //. =>
  end;
end;


{TSMSTransmitter}
Constructor TSMSTransmitter.Create();
begin
Inherited Create;
SendingType:=sstUnknown;
end;


{TSMSTextedTransmitter}
Constructor TSMSTextedTransmitter.Create(const pPort: string; const pPortSpeed: integer);
var
  PortName: string;
  DCB: TDCB;
  Timeouts: TCommTimeouts;
begin
Inherited Create();
SendingType:=sstText;
//.
Handle:=INVALID_HANDLE_VALUE;
PortName:='\\.\'+pPort;
Handle:=CreateFile(PChar(PortName),GENERIC_READ+GENERIC_WRITE,0,nil,OPEN_EXISTING,0,0);
if (Handle = INVALID_HANDLE_VALUE) then Raise Exception.Create('cannot open comm port '+PortName+': '+SysErrorMessage(GetLastError)); //. =>
if (NOT GetCommState(Handle, DCB)) then Raise Exception.Create('could not get comm state'); //. =>
DCB.BaudRate:=pPortSpeed;
if (NOT SetCommState(Handle, DCB)) then Raise Exception.Create('could not set comm state'); //. =>
Timeouts.ReadIntervalTimeout:=0;
Timeouts.ReadTotalTimeoutMultiplier:=0;
Timeouts.ReadTotalTimeoutConstant:=10000;
Timeouts.WriteTotalTimeoutMultiplier:=0;
Timeouts.WriteTotalTimeoutConstant:=0;
if (NOT SetCommTimeouts(Handle,Timeouts)) then Raise Exception.Create('could not set comm timeouts'); //. =>
end;

Destructor TSMSTextedTransmitter.Destroy;
begin
if (Handle <> INVALID_HANDLE_VALUE) then CloseHandle(Handle);
Inherited;
end;

function TSMSTextedTransmitter.ReadString(const StringSize: longword): shortstring;
var
  C: Char;
  NumberOfActualReadBytes: longword;
begin
if ((NOT ReadFile(Handle,Pointer(@Result[1])^,StringSize,NumberOfActualReadBytes,nil)) OR (NumberOfActualReadBytes <> StringSize)) then Raise Exception.Create('could not read port: '+SysErrorMessage(GetLastError)); //. =>
end;

procedure TSMSTextedTransmitter.WriteString(const Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

function TSMSTextedTransmitter.ReadLn(SkipLnCount: integer): shortstring;

  function GetLn: shortstring;
  var
    C: Char;
    NumberOfActualReadBytes: longword;
    R: shortstring;
  begin
  R:='';
  repeat
    if ((NOT ReadFile(Handle,C,1,NumberOfActualReadBytes,nil)) OR (NumberOfActualReadBytes <> 1)) then Raise Exception.Create('could not read port: '+SysErrorMessage(GetLastError)); //. =>
    if ((C <> #$0D) AND (C <> #$0A)) then R:=R+C;
  until (C = #$0A);
  Result:=R;
  end;

begin
while (SkipLnCount > 0) do begin
  GetLn();
  Dec(SkipLnCount);
  end;
Result:=GetLn();
end;

procedure TSMSTextedTransmitter.WriteLn(Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
Ln:=Ln+#$0D#$0A;
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

{///- old instable vesrion procedure TSMSTextedTransmitter.SendMessage(const Address: shortstring; const Message: shortstring);

  procedure CheckOK(const Response: shortstring);
  begin
  if (Response = 'OK') then Exit; //. ->
  Raise Exception.Create('response error'); //. =>
  end;

  procedure CheckReadSymbol(const Response: shortstring);
  begin
  if (Response = '> ') then Exit; //. ->
  Raise Exception.Create('response error'); //. =>
  end;

  function LinesCount(const Message: string): integer;
  var
    I: integer;
  begin
  Result:=1;
  for I:=1 to Length(Message) do
    if (Message[I] = #$0D)
     then Inc(Result);
  end;

var
  Response: shortstring;
  idSMS: integer;
begin
WriteLn('AT');
Response:=ReadLn(2);
CheckOK(Response);                
//.
WriteLn('AT+CMGF=1');
Response:=ReadLn(2);
CheckOK(Response);
//.
WriteLn('AT+CMGW="'+Address+'"');
ReadLn(1); //. skip empty string
Response:=ReadString(2);
CheckReadSymbol(Response);
//. write message
WriteLn(Message);
WriteString(Char(26));
//. get composed SMS id
Response:=ReadLn(3);
Response:=MidStr(Response,7,Length(Response)-6);
try
idSMS:=StrToInt(Response);
except
  Raise Exception.Create('error of composing SMS'); //. =>
  end;
try
//.
Response:=ReadLn(1);
CheckOK(Response);
//.
WriteLn('AT+CMSS='+IntToStr(idSMS));
//. get sent SMS id
Response:=ReadLn(2);
Response:=MidStr(Response,7,Length(Response)-6);
idSMS:=StrToInt(Response);
//.
ReadLn(1);
finally
//. delete composed message
WriteLn('AT+CMGD='+IntToStr(idSMS)+',3');
//.
Response:=ReadLn(2);
CheckOK(Response);
end;
end;}

procedure TSMSTextedTransmitter.SendMessage(const Address: shortstring; const Message: shortstring);

  function Encode7bit(Src: String): String;
  var
    Dst:String;
    i:Integer;
    CurS,NextS:Byte;
    TStr:String;
  begin
    for i:=1 to Length(Src) do begin
      if (i mod 8)=0 then Continue;
      TStr:=Copy(Src,i,1);
      CurS:=Ord(TStr[1]);
      if (i mod 8)>1 then
        CurS:=(CurS shr ((i mod 8)-1) );
      if i<Length(Src) then begin
        TStr:=Copy(Src,i+1,1);
        NextS:=Ord(TStr[1]);
      end else
        NextS:=0;
      NextS:=(NextS shl (8-(i mod 8)));
      Dst:=Dst+IntToHex(CurS+NextS,2);
    end;
    Result:=Dst;
  end;

var
  lngt, i: Integer;
  Adr,nmes,m,tel,vi: String;
begin
Adr:=Address;
m:=Message;
// Полуоктеты представляют десятичные цифры, и, например, номер отправителя получается
// при перестановке десятичных цифр в каждом октете: от "72 38 88 09 00 F1" к "27 83 88 90 00 1F".
// Длина телефонного номера нечетна, поэтому в последний октет добавлен F.
if Length(Adr) mod 2 = 1 then
  Adr := Adr + 'F';
for i := 1 to Length(Adr) do
  if i mod 2 = 0 then
    tel := tel + Adr[i] + Adr[i-1];
//.
nmes :=        '00'; // Длина информации о SMSC. Длина - 0 означает, что для отправки СМС должен использоваться номер SMSC, сохраненный в телефоне. Этот октет является дополнительным. Для некотоорых телефонов этот октет должен быть опущен! (Но все равно будет использоватьтся СМСЦ, сохраненный в телефоне.
nmes := nmes + '11'; // Первый октет SMS-SUBMIT
nmes := nmes + '00'; // TP-Message-Reference. Значение 0х00 указывает на то, что в качестве номера телефона отправителя будет использоваться номер.
nmes := nmes + '0B'; // Длина номера получателя (11)
nmes := nmes + '81'; // Тип-адреса. (91 указывает международный формат телефонного номера, 81 - местный формат).
nmes := nmes + tel;  // Телефонный номер получателя в международном формате в полуоктетах (46708251358). Если указать номер телефона в местном формате (Type-of-Address равен 81 вместо 91), то для указания номера телефона можно было бы использовать 10 октетов (0x0A) и октеты были бы представлены как 7080523185 (0708251358).
nmes := nmes + '00'; // TP-PID. Идентификатор протокола
nmes := nmes + '00'; // TP-DCS.
nmes := nmes + 'A8'; // TP-Validity-Period. "AA" означает 4 дня. Этот октет является дополнительным, см. 4 и 3 первого октета
nmes := nmes + IntToHex(Length(m),2); // TP-User-Data-Length. Длина сообщения.
nmes := nmes + Encode7bit(m); // TP-User-Data. Эти октеты представляют сообщение "hellohello", преобразованное в 7 битку.
lngt := Round((length(nmes)-2)/2);
WriteLn('AT+CMGS='+IntToStr(lngt)+#13);
sleep(1000);
WriteLn(nmes+^Z);
end;


{TfmObjectDeviceInitialConfiguration}
Constructor TfmGMOBusinessModelDeviceInitializerPanel.Create(const pBusinessModel: TGMOBusinessModel);
begin
Inherited Create(nil);
BusinessModel:=pBusinessModel;
//.
Update();
end;

Destructor TfmGMOBusinessModelDeviceInitializerPanel.Destroy;
begin
Inherited;
end;

procedure TfmGMOBusinessModelDeviceInitializerPanel.Update;
var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  ObjectComponentID: integer;
  reg: TRegistry;
  I: integer;
begin
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,BusinessModel.ObjectModel.ObjectController.idGeoGraphServerObject)) do
try
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,GeoGraphServerID)) do
try
edGeoGraphServerAddress.Text:=Address;
Object_GetProperties1(ObjectID, ObjectName,ObjectType,BusinessType,ObjectComponentID);
finally
Release;
end;
finally
Release;
end;
//.
BusinessModel.ObjectModel.ObjectSchema.RootComponent.LoadAll();
BusinessModel.ObjectModel.ObjectDeviceSchema.RootComponent.LoadAll();
//.
edObjectID.Text:=IntToStr(BusinessModel.ObjectModel.ObjectController.ObjectID);
edObjectUserID.Text:=IntToStr(ProxySpace_UserID());
edObjectUserPassword.Text:=ProxySpace_UserPassword();
//.
edDevicePhoneNumber.Text:=FormatFloat('0',(BusinessModel.ObjectModel as TGeoMonitoredObjectModel).DeviceConnectorServiceProviderNumber());
//.
SMSInitialization_cbPort.Items.BeginUpdate;
try
SMSInitialization_cbPort.Items.Clear;
reg:=TRegistry.Create;
try
reg.Access:=KEY_READ;
reg.RootKey:=HKEY_LOCAL_MACHINE;
if (reg.OpenKey('Hardware\DeviceMap\SerialComm',False))
 then
  try
  reg.GetValueNames(SMSInitialization_cbPort.Items);
  for I:=0 to SMSInitialization_cbPort.Items.Count-1 do SMSInitialization_cbPort.Items[I]:=reg.ReadString(SMSInitialization_cbPort.Items[I]);
  finally
  reg.CloseKey;
  end;
finally
reg.Destroy;
end;
finally
SMSInitialization_cbPort.Items.EndUpdate;
end;
//.
SMSInitialization_cbSendingMethod.Items.Clear;
SMSInitialization_cbSendingMethod.Items.Add(SMSSendingTypeStrings[sstText]);
SMSInitialization_cbSendingMethod.Items.Add(SMSSendingTypeStrings[sstPDU]);
SMSInitialization_cbSendingMethod.ItemIndex:=0;
end;

procedure CopyStringToClipboard(s: string);
var
 hClipbrd: THandle;
 hg: THandle;
 P: PChar;
begin
Clipboard.Open;
try
Clipboard.AsText:=s;
hClipbrd:=Clipboard.GetAsHandle(CF_TEXT);
if (hClipbrd = INVALID_HANDLE_VALUE) then Raise Exception.Create('could not insert a string into clipboard'); //. =>
SetClipboardData(CF_LOCALE,hClipbrd);
finally
Clipboard.Close;
end;
end;

procedure TfmGMOBusinessModelDeviceInitializerPanel.InitializeBySMS;

  function EncryptDevicePassword(const DevicePassword: ANSIString): ANSIString;
  var
    I: integer;
    L: integer;
  begin
  Result:=DevicePassword;
  L:=Length(Result);
  for I:=1 to L do Result[I]:=Char(Byte(Result[I])+Byte(DevicePassword[L-I+1]));
  end;

  function EncryptNewDevicePassword(const NewDevicePassword: ANSIString; const EncryptString: ANSIString): ANSIString;
  var
    I,J: integer;
  begin
  Result:=NewDevicePassword;
  if (Length(EncryptString) = 0) then Exit; //. ->
  J:=1;
  for I:=1 to Length(Result) do begin
    Result[I]:=Char(Byte(Result[I])+Byte(EncryptString[J]));
    Inc(J);
    if (J > Length(EncryptString)) then J:=1;
    end;
  end;

  function EncodeString(const S: ANSIString): ANSIString;
  var
    I: integer;
  begin
  Result:='';
  for I:=1 to Length(S) do
    Result:=Result+IntToHex(Byte(S[I]),2);
  end;

var
  DevicePassword: ANSIString;
  NewDevicePassword: ANSIString;
  RS,S: ANSIString;
  SMSAddress: string;
begin
NewDevicePassword:=edObjectUserPassword.Text;
DevicePassword:=edObjectDevicePassword.Text;
//.
RS:='1'+';'; //. Descriptor = 1 (Initialization command)
S:=EncryptDevicePassword(DevicePassword);
S:=EncodeString(S);
RS:=RS+S+';'; //. encrypted device password
RS:=RS+edObjectUserID.Text+';'; //. UserID
S:=EncryptNewDevicePassword(NewDevicePassword,DevicePassword);
S:=EncodeString(S);
RS:=RS+S+';'; //. encrypted new device password
RS:=RS+edObjectID.Text+';'; //. ObjectID
RS:=RS+edGeoGraphServerAddress.Text; //. GeoGraphServer IP Address
CopyStringToClipboard(RS);
//. send SMS
SMSAddress:='8'+edDevicePhoneNumber.Text;
with TSMSTextedTransmitter.Create(SMSInitialization_cbPort.Text,StrToInt(SMSInitialization_edPortSpeed.Text)) do
try
SendMessage(SMSAddress,RS);
finally
Destroy;
end;
//.
ShowMessage('Initialization SMS has been sent to the device');
end;

procedure TfmGMOBusinessModelDeviceInitializerPanel.bbWriteDeviceConfigurationClick(Sender: TObject);
begin
InitializeBySMS();
end;

procedure TfmGMOBusinessModelDeviceInitializerPanel.TimerTimer(Sender: TObject);
begin
Self.BringToFront();
end;


end.
