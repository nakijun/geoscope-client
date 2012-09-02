unit unitRegistrationAcceptedForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RXCtrls;

type
  TfmRegistrationAccepted = class(TForm)
    Image1: TImage;
    RxLabel3: TRxLabel;
    Bevel1: TBevel;
    memoInfo: TMemo;
    bbExit: TBitBtn;
    lbNewUser: TLabel;
    bbOK: TBitBtn;
    bbReconnect: TBitBtn;
    procedure bbExitClick(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure bbReconnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UserName: string;
    UserPassword: string;
  end;

var
  fmRegistrationAccepted: TfmRegistrationAccepted;

implementation
Uses
  ShellAPI,
  unitProxySpace;

{$R *.dfm}

procedure TfmRegistrationAccepted.bbExitClick(Sender: TObject);
begin
ProxySpace.Free;
//.
IsConsole:=true;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmRegistrationAccepted.bbOKClick(Sender: TObject);
begin
Close;
end;

procedure TfmRegistrationAccepted.bbReconnectClick(Sender: TObject);
var
  Cmd,Prms: string;
begin
Cmd:=Application.ExeName;
Prms:=ProxySpace.SOAPServerURL+' '+UserName+' '+UserPassword;
//.
try ProxySpace.Destroy; except end;
//.
ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
//.
IsConsole:=true;
TerminateProcess(GetCurrentProcess,0);
end;


end.
