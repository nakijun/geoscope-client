unit unitGetDayLogDataPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfmGetDayLogDataPanel = class(TForm)
    btnOk: TButton;
    datetimepickerDateSelector: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cbOutputDataType: TComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure edIntervalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Accept(out Date: TDateTime; out DataType: word): boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmGetDayLogDataPanel.Create();
begin
Inherited Create(nil);
datetimepickerDateSelector.DateTime:=Now;
cbOutputDataType.ItemIndex:=0;
end;

function TfmGetDayLogDataPanel.Accept(out Date: TDateTime; out DataType: word): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  Date:=datetimepickerDateSelector.DateTime;
  case cbOutputDataType.ItemIndex of
  0: DataType:=0; //. XML
  1: DataType:=3; //. PlainTextRU
  else
    Raise Exception.Create('Output data type is not selected'); //. =>
  end;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmGetDayLogDataPanel.btnOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmGetDayLogDataPanel.edIntervalKeyPress(Sender: TObject;
  var Key: Char);
begin
if (Key = #$0D)
 then begin
  flAccepted:=true;
  Close();
  end;
end;


end.
