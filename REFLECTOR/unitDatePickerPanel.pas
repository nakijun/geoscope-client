unit unitDatePickerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TDatePickerPanel = class(TForm)
    Panel1: TPanel;
    btnAccept: TBitBtn;
    btnCancel: TBitBtn;
    MonthCalendar: TMonthCalendar;
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Dialog(out Date: TDateTime): boolean;
  end;

implementation

{$R *.dfm}

Constructor TDatePickerPanel.Create();
begin
Inherited Create(nil);
MonthCalendar.Date:=Now;
end;

function TDatePickerPanel.Dialog(out Date: TDateTime): boolean;
begin
flAccept:=false;
ShowModal();
if (flAccept)
 then begin
  Date:=MonthCalendar.Date;
  Result:=true;
  end
 else Result:=false;
end;

procedure TDatePickerPanel.btnAcceptClick(Sender: TObject);
begin
flAccept:=true;
Close();
end;

procedure TDatePickerPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
