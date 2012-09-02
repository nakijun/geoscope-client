unit unitMapFormatMapObjectPrototypesDATAEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfmMapFormatMapObjectPrototypesDATAEditor = class(TForm)
    Panel1: TPanel;
    memoDATA: TMemo;
    btnAccept: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Dialog(var DATAStr: ANSIString): boolean;
  end;


implementation

{$R *.dfm}


Constructor TfmMapFormatMapObjectPrototypesDATAEditor.Create();
begin
Inherited Create(nil);
end;

function TfmMapFormatMapObjectPrototypesDATAEditor.Dialog(var DATAStr: ANSIString): boolean;
begin
flAccepted:=false;
memoDATA.Lines.Text:=DATAStr;
ShowModal();
if (flAccepted)
 then begin
  DATAStr:=memoDATA.Lines.Text;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmMapFormatMapObjectPrototypesDATAEditor.btnAcceptClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmMapFormatMapObjectPrototypesDATAEditor.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
