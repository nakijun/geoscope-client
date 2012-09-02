unit UnitFormMessage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TFormMessage = class(TForm)
    BitBtnOK: TBitBtn;
    Label1: TLabel;
    LabelPreambula: TLabel;
    Label2: TLabel;
    LabelMessage: TLabel;
    TimerTicks: TTimer;
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTicksTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

procedure TFormMessage.BitBtnOKClick(Sender: TObject);
begin
Close;
end;

procedure TFormMessage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TFormMessage.TimerTicksTimer(Sender: TObject);
begin
Beep;
end;

end.
