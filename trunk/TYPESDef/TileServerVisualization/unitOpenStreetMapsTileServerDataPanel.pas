unit unitOpenStreetMapsTileServerDataPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TOpenStreetMapsTileServerDataPanel = class(TForm)
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flSave: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Dialog(): boolean;
  end;


implementation

{$R *.dfm}


Constructor TOpenStreetMapsTileServerDataPanel.Create();
begin
Inherited Create(nil);
end;

function TOpenStreetMapsTileServerDataPanel.Dialog(): boolean;
begin
flSave:=false;
ShowModal();
Result:=flSave;
end;

procedure TOpenStreetMapsTileServerDataPanel.btnSaveClick(Sender: TObject);
begin
flSave:=true;
Close();
end;

procedure TOpenStreetMapsTileServerDataPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
