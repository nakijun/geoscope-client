unit unitCoComponentInputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TfmCoComponentInput = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    sbOk: TSpeedButton;
    procedure sbOkClick(Sender: TObject);
    procedure edTypeIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flOk: boolean;

    procedure CheckInput;
    procedure ParseString(const S: string; out ID: Integer);
  public
    { Public declarations }
    Constructor Create;
    function InputID(out idCoComponent: integer): boolean;
  end;

implementation
Uses
  Functionality,TypesFunctionality;

{$R *.dfm}


{TfmCoComponentInput}
Constructor TfmCoComponentInput.Create;
begin
Inherited Create(nil);
end;

procedure TfmCoComponentInput.ParseString(const S: string; out ID: Integer);
begin
ID:=StrToInt(S);
end;

function TfmCoComponentInput.InputID(out idCoComponent: integer): boolean;
begin
idCoComponent:=0;
flOk:=false;
ShowModal();
if (flOk)
 then begin
  ParseString(edID.Text,{out} idCoComponent);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmCoComponentInput.CheckInput();
var
  ID: integer;
begin
ParseString(edID.Text,{out} ID);
end;

procedure TfmCoComponentInput.sbOkClick(Sender: TObject);
begin
CheckInput();
flOk:=true;
Close;
end;

procedure TfmCoComponentInput.edTypeIDKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  CheckInput();
  flOk:=true;
  Close;
  end;
end;

end.
