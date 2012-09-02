unit unitEnforaObjectTracker1BusinessModelDeviceInitializerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaObjectModel,
  unitEnforaObjectTracker1BusinessModel,
  ExtCtrls;

type
  TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel = class(TBusinessModelDeviceInitializerPanel)
    Timer: TTimer;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    memoEnforaModemID: TMemo;
    btnCopyEnforaModemIDToClipboard: TBitBtn;
    GroupBox4: TGroupBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    bbEnforaWriteDeviceConfiguration: TBitBtn;
    EnforaCOMInitialization_edPortSpeed: TEdit;
    EnforaCOMInitialization_cbPort: TComboBox;
    procedure TimerTimer(Sender: TObject);
    procedure btnCopyEnforaModemIDToClipboardClick(Sender: TObject);
    procedure bbEnforaWriteDeviceConfigurationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    BusinessModel: TEnforaObjectTracker1BusinessModel;
    GeoGraphServerAddress: string;

    procedure Enfora_InitializeByCOM;
  public
    { Public declarations }
    Constructor Create(const pBusinessModel: TEnforaObjectTracker1BusinessModel);
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
Constructor TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.Create(const pBusinessModel: TEnforaObjectTracker1BusinessModel);
begin
Inherited Create(nil);
BusinessModel:=pBusinessModel;
//.
Update();
end;

Destructor TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.Destroy;
begin
Inherited;
end;

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.Update;

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

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.Enfora_InitializeByCOM;
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
  ServerIP: string;
  ServerPort: integer;
  ServerTCPPort: integer;
  ServerUDPPort: integer;
  DeviceRootComponent: TEnforaObjectDeviceComponent;
  CheckpointInterval: integer;
  ThresholdValue: integer;
  S: string;
  TF: TextFile;
begin
ParseAddress(GeoGraphServerAddress,  {out} ServerIP, {out} ServerPort);
ServerTCPPort:=ServerPort+EnforaTCPPortShift;
ServerUDPPort:=ServerPort+EnforaUDPPortShift;
//.
CheckpointInterval:=120;
ThresholdValue:=30;
DeviceRootComponent:=TEnforaObjectDeviceComponent(BusinessModel.EnforaObjectModel.ObjectDeviceSchema.RootComponent);
CheckpointInterval:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
ThresholdValue:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
//.
if (EnforaCOMInitialization_cbPort.Text <> '')
 then with TCOMTextedTransmitter.Create(EnforaCOMInitialization_cbPort.Text,StrToInt(EnforaCOMInitialization_edPortSpeed.Text)) do
  try
  ProcessCommand('AT&F');
  ProcessCommand('AT$AREG=2');
  ProcessCommand('AT$HOSTIF=0');
  ProcessCommand('AT$ACTIVE=1');
  ProcessCommand('AT$TCPAPI=1');
  ProcessCommand('AT$TCPIDLETO=86400');
  case DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value of
  1: begin //. MegaFon
    S:='internet.megafon.ru';
    end;
  2: begin //. MTS
    S:='internet.mts.ru';
    end;
  3: begin //. Beeline
    S:='internet.beeline.ru';
    end;
  else
    S:='internet';
  end;
  ProcessCommand('AT+CGDCONT=1,"IP","'+S+'","",0,0');
  ProcessCommand('AT$MDMID="'+memoEnforaModemID.Text+'"');
  ProcessCommand('AT$STOATEV=1,AT$AREG=2');
  ProcessCommand('AT$STOATEV=2,AT$AREG=1');
  ProcessCommand('AT$FRIEND=1,1,"'+ServerIP+'",'+IntToStr(ServerTCPPort)+',3');
  ProcessCommand('AT$UDPAPI=,'+IntToStr(ServerUDPPort));
  ProcessCommand('AT$WAKEUP=1,1');
  ProcessCommand('AT$EVTIM2='+IntToStr(CheckpointInterval));
  ProcessCommand('AT$EVDELA');
  ProcessCommand('AT$EVENT=0,1,11,1,1');
  ProcessCommand('AT$EVENT=0,1,15,1,1');
  ProcessCommand('AT$EVENT=0,2,11,1,1');
  ProcessCommand('AT$EVENT=0,3,40,1,6');
  ProcessCommand('AT$EVENT=1,0,27,1,1');
  ProcessCommand('AT$EVENT=1,3,22,0,0');
  ProcessCommand('AT$EVENT=2,0,27,0,0');
  ProcessCommand('AT$EVENT=2,3,14,0,0');
  ProcessCommand('AT$EVENT=3,0,9,2,4');
  ProcessCommand('AT$EVENT=3,3,37,1,0');
  ProcessCommand('AT$EVENT=4,0,9,5,5');
  ProcessCommand('AT$EVENT=4,3,21,0,0');
  ProcessCommand('AT$EVENT=5,0,9,0,0');
  ProcessCommand('AT$EVENT=5,3,13,0,0');
  ProcessCommand('AT$EVENT=6,0,9,1,1');
  ProcessCommand('AT$EVENT=6,3,21,0,0');
  ProcessCommand('AT$EVENT=7,1,13,1,1');
  ProcessCommand('AT$EVENT=7,3,43,2,0');
  ProcessCommand('AT$EVENT=7,3,52,8,4350');
  ProcessCommand('AT$EVDEL=8a');
  ProcessCommand('AT$EVENT=8,0,16,'+IntToStr(ThresholdValue)+',1000000');
  ProcessCommand('AT$EVENT=8,3,43,2,0');
  ProcessCommand('AT$EVENT=8,3,52,9,4350');
  ProcessCommand('AT$EVENT=9,0,26,0,0');
  ProcessCommand('AT$EVENT=9,3,44,1,0');
  ProcessCommand('AT$EVENT=10,0,26,1,1');
  ProcessCommand('AT$EVENT=10,3,52,65,4350');
  ProcessCommand('AT$EVENT=10,3,44,2,0');
  ProcessCommand('AT$PWRSAV=0,1,300,0');
  ProcessCommand('AT&W');
  ProcessCommand('AT$RESET',false);
  finally
  Destroy;
  end
 else begin
  AssignFile(TF,'C:\EnforaInit.txt'); ReWrite(TF);
  try
  WriteLn(TF,'AT&F');
  WriteLn(TF,'AT$AREG=2');
  WriteLn(TF,'AT$HOSTIF=0');
  WriteLn(TF,'AT$ACTIVE=1');
  WriteLn(TF,'AT$TCPAPI=1');
  WriteLn(TF,'AT$TCPIDLETO=86400');
  case DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value of
  1: begin //. MegaFon
    S:='internet.megafon.ru';
    end;
  2: begin //. MTS
    S:='internet.mts.ru';
    end;
  3: begin //. Beeline
    S:='internet.beeline.ru';
    end;
  else
    S:='internet';
  end;
  WriteLn(TF,'AT+CGDCONT=1,"IP","'+S+'","",0,0');
  WriteLn(TF,'AT$MDMID="'+memoEnforaModemID.Text+'"');
  WriteLn(TF,'AT$STOATEV=1,AT$AREG=2');
  WriteLn(TF,'AT$STOATEV=2,AT$AREG=1');
  WriteLn(TF,'AT$FRIEND=1,1,"'+ServerIP+'",'+IntToStr(ServerTCPPort)+',3');
  WriteLn(TF,'AT$UDPAPI=,'+IntToStr(ServerUDPPort));
  WriteLn(TF,'AT$WAKEUP=1,1');
  WriteLn(TF,'AT$EVTIM2='+IntToStr(CheckpointInterval));
  WriteLn(TF,'AT$EVDELA');
  WriteLn(TF,'AT$EVENT=0,1,11,1,1');
  WriteLn(TF,'AT$EVENT=0,1,15,1,1');
  WriteLn(TF,'AT$EVENT=0,2,11,1,1');
  WriteLn(TF,'AT$EVENT=0,3,40,1,6');
  WriteLn(TF,'AT$EVENT=1,0,27,1,1');
  WriteLn(TF,'AT$EVENT=1,3,22,0,0');
  WriteLn(TF,'AT$EVENT=2,0,27,0,0');
  WriteLn(TF,'AT$EVENT=2,3,14,0,0');
  WriteLn(TF,'AT$EVENT=3,0,9,2,4');
  WriteLn(TF,'AT$EVENT=3,3,37,1,0');
  WriteLn(TF,'AT$EVENT=4,0,9,5,5');
  WriteLn(TF,'AT$EVENT=4,3,21,0,0');
  WriteLn(TF,'AT$EVENT=5,0,9,0,0');
  WriteLn(TF,'AT$EVENT=5,3,13,0,0');
  WriteLn(TF,'AT$EVENT=6,0,9,1,1');
  WriteLn(TF,'AT$EVENT=6,3,21,0,0');
  WriteLn(TF,'AT$EVENT=7,1,13,1,1');
  WriteLn(TF,'AT$EVENT=7,3,43,2,0');
  WriteLn(TF,'AT$EVENT=7,3,52,8,4350');
  WriteLn(TF,'AT$EVDEL=8a');
  WriteLn(TF,'AT$EVENT=8,0,16,'+IntToStr(ThresholdValue)+',1000000');
  WriteLn(TF,'AT$EVENT=8,3,43,2,0');
  WriteLn(TF,'AT$EVENT=8,3,52,9,4350');
  WriteLn(TF,'AT$EVENT=9,0,26,0,0');
  WriteLn(TF,'AT$EVENT=9,3,44,1,0');
  WriteLn(TF,'AT$EVENT=10,0,26,1,1');
  WriteLn(TF,'AT$EVENT=10,3,52,65,4350');
  WriteLn(TF,'AT$EVENT=10,3,44,2,0');
  WriteLn(TF,'AT$PWRSAV=0,1,300,0');
  WriteLn(TF,'AT&W');
  WriteLn(TF,'AT$RESET',false);
  finally
  CloseFile(TF);
  end;
  end;
//.
ShowMessage('Enfora device has been initialized successfully');
end;

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.FormShow(Sender: TObject);
begin
memoEnforaModemID.SelectAll();
memoEnforaModemID.SetFocus();
end;

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.bbEnforaWriteDeviceConfigurationClick(Sender: TObject);
begin
Enfora_InitializeByCOM();
end;

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.TimerTimer(Sender: TObject);
begin
Self.BringToFront();
end;

procedure TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.btnCopyEnforaModemIDToClipboardClick(Sender: TObject);
begin
memoEnforaModemID.CopyToClipboard();
end;


end.
