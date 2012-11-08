unit unitGeoMonitoredObject1LANUDPConnectionRepeaterPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANUDPConnectionRepeater, StdCtrls, Buttons, ExtCtrls;

type
  TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel = class(TForm)
    gbLANUDPEndpoint: TGroupBox;
    gbLocalPort: TGroupBox;
    gbStatus: TGroupBox;
    btnStartStop: TBitBtn;
    lbStatus: TLabel;
    edLocalReceivingPort: TEdit;
    Label3: TLabel;
    Updater: TTimer;
    Label1: TLabel;
    edAddress: TEdit;
    Label2: TLabel;
    edTransmittingPort: TEdit;
    Label4: TLabel;
    edReceivingPort: TEdit;
    Label5: TLabel;
    edLocalTransmittingPort: TEdit;
    Label6: TLabel;
    edPacketSize: TEdit;
    procedure btnStartStopClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    Repeater: TGeographProxyServerLANUDPConnectionRepeater;

    procedure UpdateStatus();
  public
    { Public declarations }
    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Start();
    procedure Stop();
    function  IsStarted(): boolean;
  end;


implementation
uses
{$IFNDEF Plugin}
  unitProxySpace;
{$ELSE}
  FunctionalityImport;
{$ENDIF}


{$R *.dfm}



Constructor TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
Repeater:=nil;
UpdateStatus();
end;

Destructor TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.Destroy();
begin
Stop();
Inherited;
end;

procedure TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.Start();
const
  DefaultServerPort = 2010;
var
  PacketSize: integer;
  ReceivingPort: integer;
  Address: string;
  TransmittingPort: integer;
  LocalReceivingPort: integer;
  LocalTransmittingPort: integer;
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
PacketSize:=StrToInt(edPacketSize.Text);
ReceivingPort:=StrToInt(edReceivingPort.Text);
Address:=edAddress.Text;
TransmittingPort:=StrToInt(edTransmittingPort.Text);
LocalReceivingPort:=StrToInt(edLocalReceivingPort.Text);
LocalTransmittingPort:=StrToInt(edLocalTransmittingPort.Text);
{$IFNDEF Plugin}
ServerAddress:=ProxySpace.SOAPServerURL;
UserName:=ProxySpace.UserName;
UserPassword:=ProxySpace.UserPassword;
{$ELSE}
ServerAddress:=ProxySpace_SOAPServerURL();
UserName:=ProxySpace_UserName();                                
UserPassword:=ProxySpace_UserPassword();
{$ENDIF}
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
Idx:=Pos('http://',ServerAddress);
if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
//.
FreeAndNil(Repeater);
Repeater:=TGeographProxyServerLANUDPConnectionRepeater.Create(lcmctPacketted, ReceivingPort,PacketSize, Address,TransmittingPort,PacketSize, LocalReceivingPort,PacketSize, LocalTransmittingPort,PacketSize, ServerAddress,DefaultServerPort, UserName,UserPassword, Model.ObjectController.idGeoGraphServerObject, Model.ControlModule_StartLANUDPConnection,Model.ControlModule_StopLANUDPConnection);
//.
gbLANUDPEndpoint.Enabled:=false;
gbLocalPort.Enabled:=false;
btnStartStop.Caption:='Stop';
UpdateStatus();
Updater.Enabled:=true;
end;

procedure TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.Stop();
begin
FreeAndNil(Repeater);
//.
Updater.Enabled:=false;
gbLANUDPEndpoint.Enabled:=true;
gbLocalPort.Enabled:=true;
btnStartStop.Caption:='Start';
UpdateStatus();
end;

function  TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.IsStarted(): boolean;
begin
Result:=(Repeater <> nil);
end;

procedure TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.UpdateStatus();
begin
if (IsStarted())
 then begin
  lbStatus.Font.Color:=clGreen;
  lbStatus.Caption:='Online';
  end
 else begin
  lbStatus.Font.Color:=clRed;
  lbStatus.Caption:='offline';
  end;
end;

procedure TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.UpdaterTimer(Sender: TObject);
begin
UpdateStatus();
end;

procedure TfmGeoMonitoredObject1LANUDPConnectionRepeaterPanel.btnStartStopClick(Sender: TObject);
begin
if (IsStarted()) then Stop() else Start();
end;


end.
