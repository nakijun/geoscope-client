unit UnitTextInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormTextInput = class(TForm)
    Caption: TLabel;
    Edit: TEdit;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    flOK: boolean;

    procedure setCaptionInput(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    Constructor Create;
    function Input(var S: string): boolean;
    property CaptionInput: string write setCaptionInput;
  end;

implementation

{$R *.DFM}
Constructor TFormTextInput.Create;
begin
Inherited Create(nil);
end;

function TFormTextInput.Input(var S: string): boolean;
begin
flOK:=false;
ShowModal;
Result:=false;
if flOK
 then begin
  S:=Edit.Text;
  Result:=true;
  end;
end;

procedure TFormTextInput.EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  flOK:=true;
  Close;
  end;
end;

procedure TFormTextInput.setCaptionInput(const Value: string);
begin
Caption.Caption:=Value;
end;

procedure TFormTextInput.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if Key = VK_ESCAPE then Close;
end;

end.
