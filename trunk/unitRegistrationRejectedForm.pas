unit unitRegistrationRejectedForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RXCtrls;

type
  TfmRegistrationRejected = class(TForm)
    Image1: TImage;
    RxLabel3: TRxLabel;
    memoRejectionReason: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRegistrationRejected: TfmRegistrationRejected;

implementation

{$R *.dfm}

end.
