unit UnitGoodsTypes_Find;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormGoodsTypes_Find = class(TForm)
    Label1: TLabel;
    EditTypeName: TEdit;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flOk: boolean;
  public
    { Public declarations }
    function Enter(var TypeName: string): boolean;
  end;

var
  FormGoodsTypes_Find: TFormGoodsTypes_Find;

implementation

{$R *.DFM}

function TFormGoodsTypes_Find.Enter(var TypeName: string): boolean;
begin
flOk:=false;
ShowModal;
Result:=false;
if flOk AND (EditTypeName.Text <> '')
 then begin
  TypeName:=EditTypeName.Text;
  Result:=true;
  Exit;
  end;
end;

procedure TFormGoodsTypes_Find.BitBtnOkClick(Sender: TObject);
begin
flOk:=true;
Close;
end;

procedure TFormGoodsTypes_Find.BitBtnCancelClick(Sender: TObject);
begin
Close;
end;

end.
