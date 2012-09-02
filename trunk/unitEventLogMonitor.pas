unit unitEventLogMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmEventLogMonitor = class(TForm)
    Label1: TLabel;
    edServerName: TEdit;
    Label2: TLabel;
    edQoS_sendInterval: TEdit;
    Label3: TLabel;
    edMonitorAddress: TEdit;
    bbOK: TBitBtn;
    procedure bbOKClick(Sender: TObject);
  private
    { Private declarations }
    MonitorAddress: string;
    ServerName: string;
    QoS_SendInterval: integer;
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Edit(var vMonitorAddress: string; var vServerName: string; var vQoS_SendInterval: integer): boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmEventLogMonitor.Create();
begin
Inherited Create(nil);
end;

function TfmEventLogMonitor.Edit(var vMonitorAddress: string; var vServerName: string; var vQoS_SendInterval: integer): boolean;
begin
edServerName.Text:=vServerName;
edQoS_SendInterval.Text:=IntToStr(vQoS_SendInterval);
edMonitorAddress.Text:=vMonitorAddress;
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  if (edServerName.Text = '') then Raise Exception.Create('Server name is empty'); //. =>
  vServerName:=edServerName.Text;
  vQoS_SendInterval:=StrToInt(edQoS_SendInterval.Text);
  vMonitorAddress:=edMonitorAddress.Text;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmEventLogMonitor.bbOKClick(Sender: TObject);
begin
flAccepted:=true;
Close;
end;


end.
