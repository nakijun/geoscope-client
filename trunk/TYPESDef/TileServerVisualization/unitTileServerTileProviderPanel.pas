unit unitTileServerTileProviderPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmTileServerTileProviderPanel = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    Label2: TLabel;
    edName: TEdit;
    Label3: TLabel;
    edURL: TEdit;
    Label4: TLabel;
    edFormat: TEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    cbIndependentLevels: TCheckBox;
    Label5: TLabel;
    edType: TEdit;
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


{TfmTileServerTileProviderPanel}
Constructor TfmTileServerTileProviderPanel.Create();
begin
Inherited Create(nil);
end;

function TfmTileServerTileProviderPanel.Dialog(): boolean;
begin
flSave:=false;
ShowModal();
Result:=flSave;
end;

procedure TfmTileServerTileProviderPanel.btnSaveClick(Sender: TObject);
begin
flSave:=true;
Close();
end;

procedure TfmTileServerTileProviderPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
