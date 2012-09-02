unit unitSetCheckpointIntervalPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmSetCheckpointIntervalPanel = class(TForm)
    Label1: TLabel;
    edInterval: TEdit;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure edIntervalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Accept(out NewInterval: smallint): boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmSetCheckpointIntervalPanel.Create();
begin
Inherited Create(nil);
end;

function TfmSetCheckpointIntervalPanel.Accept(out NewInterval: smallint): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  NewInterval:=StrToInt(edInterval.Text);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmSetCheckpointIntervalPanel.btnOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmSetCheckpointIntervalPanel.edIntervalKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key = #$0D)
 then begin
  flAccepted:=true;
  Close();
  end;
end;


end.
