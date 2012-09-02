unit unitNewSecurityKeyPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TNewSecurityKeyPanelProps = class(TForm)
    Image1: TImage;
    edName: TEdit;
    edInfo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    sbAccept: TSpeedButton;
    sbClose: TSpeedButton;
    procedure sbAcceptClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
  public
    { Public declarations }
    Constructor Create; 
    Destructor Destroy; override;
    function Accept(out Name: shortstring; out Info: shortstring): boolean;
  end;

implementation
{$R *.DFM}

Constructor TNewSecurityKeyPanelProps.Create;
begin
Inherited Create(nil);
edName.Text:='';
edInfo.Text:='';
end;

destructor TNewSecurityKeyPanelProps.Destroy;
begin
Inherited;
end;

function TNewSecurityKeyPanelProps.Accept(out Name: shortstring; out Info: shortstring): boolean;
begin
flAccept:=false;
ShowModal;
if flAccept
 then begin
  Name:=edName.Text;
  Info:=edInfo.Text;
  Result:=true;
  end
 else
  Result:=false;
end;

procedure TNewSecurityKeyPanelProps.sbAcceptClick(Sender: TObject);
begin
flAccept:=true;
Close;
end;

procedure TNewSecurityKeyPanelProps.sbCloseClick(Sender: TObject);
begin
Close;
end;

end.
