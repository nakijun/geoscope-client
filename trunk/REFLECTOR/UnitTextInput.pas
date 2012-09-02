unit unitTextInput;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormTextInput = class(TForm)
    Caption: TLabel;
    Edit: TEdit;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flAccept: boolean;
    
    procedure setCaptionInput(const Value: string);
  public
    { Public declarations }
    Constructor Create;
    function Input: string; overload;
    function Input(out Input: string): boolean; overload;
    property CaptionInput: string write setCaptionInput;
  end;

implementation

{$R *.DFM}
Constructor TFormTextInput.Create;
begin
Inherited Create(nil);
end;

function TFormTextInput.Input: string;
begin
Result:='';
ShowModal;
Result:=Edit.Text;
end;

function TFormTextInput.Input(out Input: string): boolean;
begin
flAccept:=false;
ShowModal;
if (flAccept)
 then begin
  Input:=Edit.Text;
  Result:=true;
  end
 else Result:=false;
end;

procedure TFormTextInput.EditKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  flAccept:=true;
  Close;
  end;
end;

procedure TFormTextInput.setCaptionInput(const Value: string);
begin
Caption.Caption:=Value;
end;

end.
