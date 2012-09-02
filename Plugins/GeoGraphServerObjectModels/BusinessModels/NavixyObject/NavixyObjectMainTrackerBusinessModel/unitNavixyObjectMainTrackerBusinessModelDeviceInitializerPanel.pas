unit unitNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitNavixyObjectModel,
  unitNavixyObjectMainTrackerBusinessModel,
  ExtCtrls;

type
  TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel = class(TBusinessModelDeviceInitializerPanel)
    Timer: TTimer;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    memoNavixyDeviceHeader: TMemo;
    btnCopyNavixyModemIDToClipboard: TBitBtn;
    GroupBox4: TGroupBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    bbNavixyWriteDeviceConfiguration: TBitBtn;
    NavixyCOMInitialization_edPortSpeed: TEdit;
    NavixyCOMInitialization_cbPort: TComboBox;
    Label1: TLabel;
    edNavixyDevicePassword: TEdit;
    procedure TimerTimer(Sender: TObject);
    procedure btnCopyNavixyModemIDToClipboardClick(Sender: TObject);
    procedure bbNavixyWriteDeviceConfigurationClick(Sender: TObject);
  private
    { Private declarations }
    BusinessModel: TNavixyObjectMainTrackerBusinessModel;
    GeoGraphServerAddress: string;

    procedure Navixy_InitializeByCOM;
  public
    { Public declarations }
    Constructor Create(const pBusinessModel: TNavixyObjectMainTrackerBusinessModel);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;

  TNavixyControlComPort = class
  private
    Handle: THandle;

    Constructor Create(const pPort: string; const pPortSpeed: integer);
    Destructor Destroy(); override;
    function ReadLn(): shortstring;
    procedure WriteLn(Ln: shortstring);
  public
    procedure ProcessCommand(Command,CommandParams: string; const CommandTag: integer; const CommandPassword: string);
  end;


implementation
Uses
  Registry,
  StrUtils,
  FunctionalityImport,
  TypesDefines;

{$R *.dfm}

{TNavixyControlComPort}
Constructor TNavixyControlComPort.Create(const pPort: string; const pPortSpeed: integer);
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

Destructor TNavixyControlComPort.Destroy();
begin
if (Handle <> INVALID_HANDLE_VALUE) then CloseHandle(Handle);
Inherited;
end;

function TNavixyControlComPort.ReadLn(): shortstring;

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

procedure TNavixyControlComPort.WriteLn(Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
Ln:=Ln+#$0D#$0A;
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

procedure TNavixyControlComPort.ProcessCommand(Command,CommandParams: string; const CommandTag: integer; const CommandPassword: string);

  function ChecResponse(const Response: string): boolean;
  var
    OkStatement,ErrStatement: string;
    ErrorCode: integer;
  begin
  Result:=false;
  OkStatement:='$OK:'+Command+'+'+IntToStr(CommandTag)+'=';
  ErrStatement:='$ERR:'+Command+'+'+IntToStr(CommandTag)+'=';
  if (ANSIPos(OkStatement,Response) = 1)
   then begin
    Result:=true;
    Exit //. ->
    end
   else 
    if (ANSIPos(ErrStatement,Response) = 1)
     then begin
      ErrorCode:=StrToInt(Copy(Response,Length(ErrStatement)+1,Length(Response)-Length(ErrStatement)));
      Case (ErrorCode) of
      0:  Raise Exception.Create('Unknown communication error'); //. =>
      1:  Raise Exception.Create('Invalid password'); //. =>
      2:  Raise Exception.Create('Invalid command parameters'); //. =>
      3:  Raise Exception.Create('GSM SMS base phone number or GPRS Server IP address not set'); //. =>
      4:  Raise Exception.Create('Unable to detect GSM signal'); //. =>
      5:  Raise Exception.Create('GSM Failed'); //. =>
      6:  Raise Exception.Create('Unable to establish the GPRS connection'); //. =>
      7:  Raise Exception.Create('Download process interrupted'); //. =>
      8:  Raise Exception.Create('Voice busy tone'); //. =>
      9:  Raise Exception.Create('SIM PIN Code Error'); //. =>
      10: Raise Exception.Create('Unsupported PDU mode'); //. =>
      11: Raise Exception.Create('Write_RQ_error'); //. =>
      12: Raise Exception.Create('Read_RQ_error'); //. =>
      13: Raise Exception.Create('Log_Write_error'); //. =>
      14: Raise Exception.Create('Log_Read_error'); //. =>
      15: Raise Exception.Create('Invalid event'); //. =>
      else
        Raise Exception.Create('unknown response error'); //. =>
      end;
      end;
  end;

var
  CommandStr: string;
  Response: string;
  LastTime: TDateTime;
begin
if (CommandParams <> '')
 then CommandParams:=CommandPassword+','+CommandParams
 else CommandParams:=CommandPassword;
CommandStr:='$WP+'+Command+'+'+IntToStr(CommandTag)+'='+CommandParams;
//. write command
WriteLn(CommandStr);
//. check response
try
LastTime:=Now;
repeat
  if ((Now-LastTime)*24*60 > 1{minute}) then Raise Exception.Create('Command timeout'); //. => 
  //.
  Response:=ReadLn();
until (ChecResponse(Response));
except
  On E: Exception do Raise Exception.Create('error of command '+Command+' ('+CommandParams+'), '+E.Message); //. =>
  end;
end;


{TfmObjectDeviceInitialConfiguration}
Constructor TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.Create(const pBusinessModel: TNavixyObjectMainTrackerBusinessModel);
begin
Inherited Create(nil);
BusinessModel:=pBusinessModel;
//.
Update();
end;

Destructor TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.Destroy;
begin
Inherited;
end;

procedure TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.Update;

  function GenerateNavixyModemHeader(const UserID: integer; const UserPassword: string; const ObjectID: integer): ShortString;
  const
    MIDLength = 16;
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
NavixyCOMInitialization_cbPort.Items.BeginUpdate;
try
NavixyCOMInitialization_cbPort.Items.Clear;
reg:=TRegistry.Create;
try
reg.Access:=KEY_READ;
reg.RootKey:=HKEY_LOCAL_MACHINE;
if (reg.OpenKey('Hardware\DeviceMap\SerialComm',False))
 then
  try
  reg.GetValueNames(NavixyCOMInitialization_cbPort.Items);
  for I:=0 to NavixyCOMInitialization_cbPort.Items.Count-1 do NavixyCOMInitialization_cbPort.Items[I]:=reg.ReadString(NavixyCOMInitialization_cbPort.Items[I]);
  finally
  reg.CloseKey;
  end;
finally
reg.Destroy;
end;
finally
NavixyCOMInitialization_cbPort.Items.EndUpdate;
end;
//.
memoNavixyDeviceHeader.Text:=GenerateNavixyModemHeader(ProxySpace_UserID(),ProxySpace_UserPassword(),BusinessModel.ObjectModel.ObjectController.ObjectID);
end;

procedure TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.Navixy_InitializeByCOM;
const
  NavixyTCPPortShift = 20;

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
  DeviceRootComponent: TNavixyObjectDeviceComponent;
  KeepAliveInterval: integer;
  CheckpointInterval: integer;
  ThresholdValue: integer;
  APN: string;
  CommandTag: integer;
  DeviceID: integer;
  DevicePassword,NewDevicePassword: string;
begin
ParseAddress(GeoGraphServerAddress,  {out} ServerIP, {out} ServerPort);
ServerTCPPort:=ServerPort+NavixyTCPPortShift;
//.
CheckpointInterval:=120;
ThresholdValue:=30;
DeviceRootComponent:=TNavixyObjectDeviceComponent(BusinessModel.NavixyObjectModel.ObjectDeviceSchema.RootComponent);
KeepAliveInterval:=DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Value;
CheckpointInterval:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
ThresholdValue:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
case DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value of
1: begin //. MegaFon
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
DevicePassword:=edNavixyDevicePassword.Text;
NewDevicePassword:=DeviceRootComponent.ConnectionModule.Password.Value;
//.
with TNavixyControlComPort.Create(NavixyCOMInitialization_cbPort.Text,StrToInt(NavixyCOMInitialization_edPortSpeed.Text)) do
try
CommandTag:=1;
//. set Device ID, new password
DeviceID:=BusinessModel.ObjectModel.ObjectController.ObjectID+2000000000{Navixy correction};
ProcessCommand('UNCFG',IntToStr(DeviceID)+','+NewDevicePassword+',,0,0,0,0',CommandTag,DevicePassword); DevicePassword:=NewDevicePassword; Inc(CommandTag);
//. set Checkpoint and Threshold
ProcessCommand('TRACK','4,'+IntToStr(CheckpointInterval)+','+IntToStr(ThresholdValue)+',0,0,4,0',CommandTag,DevicePassword); Inc(CommandTag);
{FINALLY}
//. set unique Device Header
ProcessCommand('RPHEAD','1,'+memoNavixyDeviceHeader.Text,CommandTag,DevicePassword); Inc(CommandTag);
//. set communication 
ProcessCommand('COMMTYPE','4,0,0,'+APN+',"","",'+ServerIP+','+IntToStr(ServerTCPPort)+','+IntToStr(KeepAliveInterval)+',""',CommandTag,DevicePassword); Inc(CommandTag);
finally
Destroy();
end;
//.
ShowMessage('Navixy device has been initialized successfully');
end;

procedure TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.bbNavixyWriteDeviceConfigurationClick(Sender: TObject);
begin
Navixy_InitializeByCOM();
end;

procedure TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.TimerTimer(Sender: TObject);
begin
Self.BringToFront();
end;

procedure TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.btnCopyNavixyModemIDToClipboardClick(Sender: TObject);
begin
memoNavixyDeviceHeader.CopyToClipboard();
end;


end.
