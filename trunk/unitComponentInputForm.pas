unit unitComponentInputForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TfmComponentInput = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    sbOk: TSpeedButton;
    cbTypes: TComboBoxEx;
    procedure sbOkClick(Sender: TObject);
    procedure edTypeIDKeyPress(Sender: TObject; var Key: Char);
    procedure cbTypesChange(Sender: TObject);
    procedure cbTypesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    flOk: boolean;

    procedure CheckInput;
    procedure ParseString(const S: string; out TypeID,ID: Integer);
  public
    { Public declarations }
    Constructor Create;
    function InputID(out idTComponent,idComponent: integer): boolean;
  end;

implementation
Uses
  Functionality,TypesFunctionality;

{$R *.dfm}


{TfmComponentInput}
Constructor TfmComponentInput.Create;
var
  I: integer;
begin
Inherited Create(nil);
with cbTypes do begin
Clear;
ItemsEx.BeginUpdate;
try
for I:=0 to TypesSystem.Count-1 do with ItemsEx.Add do
  with TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create do
  try
  Data:=Pointer(idType);
  Caption:=Name;
  finally
  Release;
  end;
finally
ItemsEx.EndUpdate;
end;
end;
end;

procedure TfmComponentInput.ParseString(const S: string; out TypeID,ID: Integer);
var
  NS: String;
  I: integer;
begin
I:=1;
NS:='';
for I:=1 to Length(S) do
  if S[I] <> ';'
   then NS:=NS+S[I]
   else Break;
try
TypeID:=StrToInt(NS);
except
  Raise Exception.Create('could not recognize TypeID'); //. =>
  end;
if I = Length(S) then Raise Exception.Create('ID not found'); //. =>
Inc(I);
NS:='';
for I:=I to Length(S) do NS:=NS+S[I];
try
ID:=StrToInt(NS);
except
  Raise Exception.Create('could not recognize ID'); //. =>
  end;
end;

function TfmComponentInput.InputID(out idTComponent,idComponent: integer): boolean;
begin
flOk:=false;
ShowModal;
if flOk
 then begin
  ParseString(edID.Text, idTComponent,idComponent);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmComponentInput.CheckInput;
var
  TypeID,ID: integer;
begin
ParseString(edID.Text, TypeID,ID);
end;

procedure TfmComponentInput.sbOkClick(Sender: TObject);
begin
CheckInput;
flOk:=true;
Close;
end;

procedure TfmComponentInput.edTypeIDKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  CheckInput;
  flOk:=true;
  Close;
  end;
end;

procedure TfmComponentInput.cbTypesChange(Sender: TObject);
begin 
if cbTypes.ItemIndex <> -1
 then begin
  edID.Text:=IntToStr(Integer(cbTypes.ItemsEx[cbTypes.ItemIndex].Data))+'; ';
  end;
end;

procedure TfmComponentInput.cbTypesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (Key = $0D) AND(cbTypes.ItemIndex <> -1)
 then begin
  edID.Text:=IntToStr(Integer(cbTypes.ItemsEx[cbTypes.ItemIndex].Data))+'; ';
  end;
end;

end.
