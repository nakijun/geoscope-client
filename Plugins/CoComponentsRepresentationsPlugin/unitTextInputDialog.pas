unit unitTextInputDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmTextInputDialog = class(TForm)
    stInputName: TStaticText;
    edText: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edTextKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flOk: boolean;
  public
    { Public declarations }
    Constructor Create(const InputName: string);
    function Dialog(out Text: string): boolean;
  end;


implementation

{$R *.dfm}


Constructor TfmTextInputDialog.Create(const InputName: string);
begin
Inherited Create(nil);
stInputName.Caption:=InputName;
end;

function TfmTextInputDialog.Dialog(out Text: string): boolean;
begin
flOk:=false;
ShowModal();
if (flOk)
 then begin
  Text:=edText.Text;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmTextInputDialog.btnOkClick(Sender: TObject);
begin
flOk:=true;
Close();
end;

procedure TfmTextInputDialog.btnCancelClick(Sender: TObject);
begin
Close();
end;

procedure TfmTextInputDialog.edTextKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  flOk:=true;
  Close();
  end;
end;


end.
