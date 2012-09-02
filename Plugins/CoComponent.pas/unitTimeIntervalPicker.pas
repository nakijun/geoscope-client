unit unitTimeIntervalPicker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfmTimeIntervalPicker = class(TForm)
    TrackBeginDayPicker: TDateTimePicker;
    Label3: TLabel;
    TrackEndDayPicker: TDateTimePicker;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Select(out BeginTime,EndTime: TDateTime): boolean;
  end;


implementation

{$R *.dfm}


Constructor TfmTimeIntervalPicker.Create();
begin
Inherited Create(nil);
TrackBeginDayPicker.DateTime:=Now-7.0{minus week};
TrackEndDayPicker.DateTime:=Now;
end;

function TfmTimeIntervalPicker.Select(out BeginTime,EndTime: TDateTime): boolean;
begin
flAccept:=false;
ShowModal();
if (flAccept)
 then begin
  BeginTime:=TrackBeginDayPicker.DateTime;
  EndTime:=TrackEndDayPicker.DateTime;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmTimeIntervalPicker.btnOkClick(Sender: TObject);
begin
flAccept:=true;
Close();
end;


end.
