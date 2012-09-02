unit unitEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaMiniMTObjectModel,
  unitEnforaMiniMTTrackerBusinessModel,
  ExtCtrls, Gauges;

type
  TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel = class(TBusinessModelDeviceInitializerPanel)
    Timer: TTimer;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    bbEnforaWriteDeviceConfiguration: TBitBtn;
    EnforaCOMInitialization_edPortSpeed: TEdit;
    EnforaCOMInitialization_cbPort: TComboBox;
    pcParameters: TPageControl;
    TabSheet1: TTabSheet;
    memoEnforaModemID: TMemo;
    btnCopyEnforaModemIDToClipboard: TBitBtn;
    TabSheet2: TTabSheet;
    memoEnforaInitializationScript: TMemo;
    Gauge: TGauge;
    BitBtn1: TBitBtn;
    procedure TimerTimer(Sender: TObject);
    procedure btnCopyEnforaModemIDToClipboardClick(Sender: TObject);
    procedure bbEnforaWriteDeviceConfigurationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    BusinessModel: TEnforaMiniMTTrackerBusinessModel;
    GeoGraphServerAddress: string;

    procedure Enfora_SearchCOMPort();
    procedure Enfora_InitializeByCOM();
  public
    { Public declarations }
    Constructor Create(const pBusinessModel: TEnforaMiniMTTrackerBusinessModel);
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
    procedure ProcessCommand(const Command: shortstring; const flCheckResponse: boolean = true);
  end;


implementation
Uses
  Registry,
  StrUtils,
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
Timeouts.ReadTotalTimeoutConstant:=10000;
Timeouts.WriteTotalTimeoutMultiplier:=0;
Timeouts.WriteTotalTimeoutConstant:=10000;
if (NOT SetCommTimeouts(Handle,Timeouts)) then Raise Exception.Create('could not set comm timeouts'); //. =>
PurgeComm(Handle,PURGE_RXCLEAR+PURGE_TXCLEAR);
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

procedure TCOMTextedTransmitter.ProcessCommand(const Command: shortstring; const flCheckResponse: boolean = true);
begin
try
WriteLn(Command);
if (flCheckResponse) then CheckOK();
except
  on E: Exception do Raise Exception.Create('error of command: '+Command+', '+E.Message); //. =>
  end;
end;


{TfmObjectDeviceInitialConfiguration}
Constructor TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Create(const pBusinessModel: TEnforaMiniMTTrackerBusinessModel);
begin
Inherited Create(nil);
BusinessModel:=pBusinessModel;
//.
Update();
end;

Destructor TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Destroy;
begin
Inherited;
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Update;

  function GenerateEndoraModemID(const UserID: integer; const UserPassword: string; const ObjectID: integer): ShortString;
  const
    MIDLength = 20;
  var
    ObjectIDStr: ShortString;
    ObjectIDArray: array of byte;
    I: integer;
    UserPasswordIdx: integer;
  begin
  Result:=IntToStr(UserID);
  if ((Length(Result) MOD 2) > 0) then Result:=Result+'_' else Result:=Result+'__';
  if ((MIDLength-Length(Result)) < 2)
   then begin
    Result:='?';
    Exit; //. ->
    end;
  ObjectIDStr:=IntToStr(ObjectID);
  SetLength(ObjectIDArray,(MIDLength-Length(Result)) DIV 2);
  if (Length(ObjectIDStr) > Length(ObjectIDArray))
   then begin
    Result:='?';
    Exit; //. ->
    end;
  for I:=0 to Length(ObjectIDArray)-1 do ObjectIDArray[I]:=$20;
  for I:=1 to Length(ObjectIDStr) do ObjectIDArray[I-1]:=Byte(ObjectIDStr[I]);
  //. encription
  if (Length(UserPassword) > 0)
   then begin
    UserPasswordIdx:=1;
    {$OVERFLOWCHECKS OFF}
    for I:=0 to Length(ObjectIDArray)-1 do begin
      ObjectIDArray[I]:=ObjectIDArray[I]+Byte(UserPassword[UserPasswordIdx]);
      Inc(UserPasswordIdx);
      if (UserPasswordIdx > Length(UserPassword)) then UserPasswordIdx:=1;
      end;
    {$OVERFLOWCHECKS ON}
    end;
  for I:=0 to Length(ObjectIDArray)-1 do Result:=Result+IntToHex(ObjectIDArray[I],2);
  end;

var
  reg: TRegistry;
  I: integer;
begin
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,BusinessModel.ObjectModel.ObjectController.idGeoGraphServerObject)) do
try
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,GeoGraphServerID)) do
try
GeoGraphServerAddress:=Address;
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
EnforaCOMInitialization_cbPort.Items.BeginUpdate;
try
EnforaCOMInitialization_cbPort.Items.Clear;
reg:=TRegistry.Create;
try
reg.Access:=KEY_READ;
reg.RootKey:=HKEY_LOCAL_MACHINE;
if (reg.OpenKey('Hardware\DeviceMap\SerialComm',False))
 then
  try
  reg.GetValueNames(EnforaCOMInitialization_cbPort.Items);
  for I:=0 to EnforaCOMInitialization_cbPort.Items.Count-1 do EnforaCOMInitialization_cbPort.Items[I]:=reg.ReadString(EnforaCOMInitialization_cbPort.Items[I]);
  EnforaCOMInitialization_cbPort.Items.Add('');
  finally
  reg.CloseKey;
  end;
finally
reg.Destroy;
end;
finally
EnforaCOMInitialization_cbPort.Items.EndUpdate;
end;
//.
memoEnforaModemID.Text:=GenerateEndoraModemID(ProxySpace_UserID(),ProxySpace_UserPassword(),BusinessModel.ObjectModel.ObjectController.ObjectID);
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Enfora_SearchCOMPort();
var
  I: integer;
  Port: string;
  Response: shortstring;
begin
for I:=0 to EnforaCOMInitialization_cbPort.Items.Count-1 do begin
  Port:=EnforaCOMInitialization_cbPort.Items[I];
  try
  with TCOMTextedTransmitter.Create(Port,StrToInt(EnforaCOMInitialization_edPortSpeed.Text)) do
  try
  WriteLn('ATI');
  //.
  Response:=ReadLn();
  Response:=ReadLn();
  if (Pos('Enfora',Response) > 0)
   then begin
    CheckOK();
    //.
    EnforaCOMInitialization_cbPort.ItemIndex:=I;
    Exit; //. ->
    end;
  finally
  Destroy;
  end;
  except
    end;
  end;
Raise Exception.Create('could not get Enfora COM port automatically, please select one'); //. =>
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Enfora_InitializeByCOM;
const
  EnforaTCPPortShift = 10;
  EnforaUDPPortShift = EnforaTCPPortShift+1;

  procedure ParseAddress(const A: string; out IP: string; out Port: integer);
  var
    I: integer;
    PS: string;
  begin
  I:=1;
  IP:='';
  while (I <= Length(A)) do begin
    if (A[I] = ':')
     then Break //. >
     else IP:=IP+A[I];
    Inc(I);
    end;
  Inc(I);
  //. get MessageTypeStr
  PS:='';
  while (I <= Length(A)) do begin
    PS:=PS+A[I];
    Inc(I);
    end;
  Port:=StrToInt(PS);
  end;

var
  APN: string;
  ServerIP: string;
  ServerPort: integer;
  ServerTCPPort: integer;
  ServerUDPPort: integer;
  DeviceRootComponent: TEnforaMiniMTObjectDeviceComponent;
  CheckpointInterval: integer;
  ThresholdValue: integer;
  Script: TStringList;
  S: string;
  I: integer;
begin
DeviceRootComponent:=TEnforaMiniMTObjectDeviceComponent(BusinessModel.ObjectModel.ObjectDeviceSchema.RootComponent);
//.
case DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value of
0,1: begin //. MegaFon
  APN:='internet.megafon.ru';
  end;
2: begin //. MTS
  APN:='internet.mts.ru';
  end;
3: begin //. Beeline
  APN:='internet.beeline.ru';
  end;
else
  APN:='internet';
end;
//.
ParseAddress(GeoGraphServerAddress,  {out} ServerIP, {out} ServerPort);
ServerTCPPort:=ServerPort+EnforaTCPPortShift;
ServerUDPPort:=ServerPort+EnforaUDPPortShift;
//.
CheckpointInterval:=120;
ThresholdValue:=30;
CheckpointInterval:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
ThresholdValue:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
//.
Script:=TStringList.Create();
try
Script.Assign(memoEnforaInitializationScript.Lines);
//. configuring script
S:=Script.Text;
S:=StringReplace(S, '<APN>',                     '"'+APN+'"',                    [rfReplaceAll]);
S:=StringReplace(S, '<TCPSERVERADDRESS>',        '"'+ServerIP+'"',               [rfReplaceAll]);
S:=StringReplace(S, '<TCPSERVERPORT>',           IntToStr(ServerTCPPort),        [rfReplaceAll]);
S:=StringReplace(S, '<UDPSERVERADDRESS>',        '',                             [rfReplaceAll]);
S:=StringReplace(S, '<UDPSERVERPORT>',           IntToStr(ServerUDPPort),        [rfReplaceAll]);
S:=StringReplace(S, '<MDMID>',                   '"'+memoEnforaModemID.Text+'"', [rfReplaceAll]);
S:=StringReplace(S, '<THRESHOLD>',               IntToStr(ThresholdValue),       [rfReplaceAll]);
S:=StringReplace(S, '<CHECKPOINT>',              IntToStr(CheckpointInterval),   [rfReplaceAll]);
Script.Text:=S;
//.
memoEnforaInitializationScript.Lines.Assign(Script);
//.
if (EnforaCOMInitialization_cbPort.Text = '')
 then begin
  Enfora_SearchCOMPort();
  if (EnforaCOMInitialization_cbPort.Text = '') then Exit; //. ->
  end;
with TCOMTextedTransmitter.Create(EnforaCOMInitialization_cbPort.Text,StrToInt(EnforaCOMInitialization_edPortSpeed.Text)) do
try
Gauge.Progress:=0;
Gauge.Show();
for I:=0 to Script.Count-1 do begin
  if (Script[I] <> '')
   then ProcessCommand(Script[I],(I <> Script.Count-1));
  //.
  Gauge.Progress:=Trunc(100*I/Script.Count);
  end;
Gauge.Progress:=100;
finally
Destroy;
end;
finally
Script.Destroy();
end;
//.
ShowMessage('Enfora device has been initialized successfully');
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.FormShow(Sender: TObject);
begin
memoEnforaModemID.SelectAll();
memoEnforaModemID.SetFocus();
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.BitBtn1Click(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Enfora_SearchCOMPort();
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.bbEnforaWriteDeviceConfigurationClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Enfora_InitializeByCOM();
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.TimerTimer(Sender: TObject);
begin
Self.BringToFront();
end;

procedure TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.btnCopyEnforaModemIDToClipboardClick(Sender: TObject);
begin
memoEnforaModemID.CopyToClipboard();
end;


end.
