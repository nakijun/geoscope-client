unit unitGeoGraphServerUnRegisterObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmUnRegisterObject = class(TForm)
    Label4: TLabel;
    edObjectID: TEdit;
    sbAccept: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure sbCancelClick(Sender: TObject);
    procedure sbAcceptClick(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Accept(out ObjectID: integer): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmUnRegisterObject.Create();
begin
Inherited Create(nil);
end;

function TfmUnRegisterObject.Accept(out ObjectID: integer): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  ObjectID:=StrToInt(edObjectID.Text);
  Result:=true;
  end
 else Result:=false;
end;


procedure TfmUnRegisterObject.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmUnRegisterObject.sbAcceptClick(Sender: TObject);
begin
flAccepted:=true;
Close;
end;

end.
