unit unitTimeDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmTimeDialog = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDays: TEdit;
    edHours: TEdit;
    edMinutes: TEdit;
    edSeconds: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create;
    function TimeDialog(out Time: TDateTime): boolean;
  end;

implementation

{$R *.dfm}


{TfmTimeDialog}
Constructor TfmTimeDialog.Create;
begin
Inherited Create(nil);
end;

function TfmTimeDialog.TimeDialog(out Time: TDateTime): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  Time:=StrToInt(edDays.Text)+StrToInt(edHours.Text)/24.0+StrToInt(edMinutes.Text)/(24.0*60)+StrToInt(edSeconds.Text)/(24.0*60*60);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmTimeDialog.btnOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmTimeDialog.btnCancelClick(Sender: TObject);
begin
Close();
end;

end.
