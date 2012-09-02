unit unitSetGeoDistanceThresholdPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmSetGeoDistanceThresholdPanel = class(TForm)
    Label1: TLabel;
    edValue: TEdit;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure edValueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Accept(out NewValue: smallint): boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmSetGeoDistanceThresholdPanel.Create();
begin
Inherited Create(nil);
end;

function TfmSetGeoDistanceThresholdPanel.Accept(out NewValue: smallint): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  NewValue:=StrToInt(edValue.Text);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmSetGeoDistanceThresholdPanel.btnOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmSetGeoDistanceThresholdPanel.edValueKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key = #$0D)
 then begin
  flAccepted:=true;
  Close();
  end;
end;


end.
