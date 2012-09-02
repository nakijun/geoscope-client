unit unitGeoObjectTrackPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, ExtDlgs;

type
  TfmGeoObjectTrackPanel = class(TForm)
    edTrackName: TEdit;
    ColorDialog: TColorDialog;
    bbOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lbColor: TLabel;
    sbChangeColor: TSpeedButton;
    procedure bbOkClick(Sender: TObject);
    procedure sbChangeColorClick(Sender: TObject);
    procedure edTrackNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create;
    function Accepted: boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmGeoObjectTrackPanel.Create;
begin
Inherited Create(nil);
end;

function TfmGeoObjectTrackPanel.Accepted: boolean;
begin
flAccepted:=false;
ShowModal();
Result:=flAccepted;
end;

procedure TfmGeoObjectTrackPanel.bbOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmGeoObjectTrackPanel.sbChangeColorClick(Sender: TObject);
begin
ColorDialog.Color:=lbColor.Color;
if (ColorDialog.Execute) then lbColor.Color:=ColorDialog.Color;
end;

procedure TfmGeoObjectTrackPanel.edTrackNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  flAccepted:=true;
  Close();
  end;
end;


end.
