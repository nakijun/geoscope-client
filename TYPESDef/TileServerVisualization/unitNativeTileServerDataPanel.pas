unit unitNativeTileServerDataPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TNativeTileServerDataPanel = class(TForm)
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


Constructor TNativeTileServerDataPanel.Create();
begin
Inherited Create(nil);
end;

function TNativeTileServerDataPanel.Dialog(): boolean;
begin
flSave:=false;
ShowModal();
Result:=flSave;
end;

procedure TNativeTileServerDataPanel.btnSaveClick(Sender: TObject);
begin
flSave:=true;
Close();
end;

procedure TNativeTileServerDataPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
