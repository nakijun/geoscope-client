unit unitCreateObjectInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  RXCtrls, RxGIF;

type
  TfmCreateObjectInfo = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    SecretPanel1: TSecretPanel;
    RxLabel3: TRxLabel;
    Image2: TImage;
    bbCreate: TBitBtn;
    bbCancel: TBitBtn;
    imgCreation: TImage;
    procedure bbCancelClick(Sender: TObject);
    procedure bbCreateClick(Sender: TObject);
  private
    { Private declarations }
    flCreate: boolean;
  public
    { Public declarations }
    Constructor Create;
    function AskAboutCreate: boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmCreateObjectInfo.Create;
begin
Inherited Create(nil);
end;

function TfmCreateObjectInfo.AskAboutCreate: boolean;
begin
flCreate:=false;
ShowModal;
Result:=false;
if flCreate
 then begin
  Result:=true;
  end;
end;

procedure TfmCreateObjectInfo.bbCreateClick(Sender: TObject);
begin
flCreate:=true;
Close;
end;

procedure TfmCreateObjectInfo.bbCancelClick(Sender: TObject);
begin
Close;
end;


end.
