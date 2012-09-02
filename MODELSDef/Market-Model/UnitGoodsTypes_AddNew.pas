unit UnitGoodsTypes_AddNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFormGoodsTypes_AddNew = class(TForm)
    Label1: TLabel;
    EditTypeName: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
    
  public
    { Public declarations }
    function Enter(var TypeName: string): boolean;
  end;

var
  FormGoodsTypes_AddNew: TFormGoodsTypes_AddNew;

implementation

{$R *.DFM}
function TFormGoodsTypes_AddNew.Enter(var TypeName: string): boolean;
begin
flAccept:=false;
ShowModal;
Result:=false;
if flAccept AND (EditTypeName.Text <> '')
 then begin
  TypeName:=EditTypeName.Text;
  Result:=true;
  Exit;
  end;
end;

procedure TFormGoodsTypes_AddNew.BitBtn1Click(Sender: TObject);
begin
flAccept:=true;
Close;
end;

procedure TFormGoodsTypes_AddNew.BitBtn2Click(Sender: TObject);
begin
Close;
end;

end.
