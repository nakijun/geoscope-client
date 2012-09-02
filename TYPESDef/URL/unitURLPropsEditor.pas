unit unitURLPropsEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmURLPropsEditor = class(TForm)
    Label1: TLabel;
    edURL: TEdit;
    Label2: TLabel;
    edURLName: TEdit;
    cbPanelBrowser: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Dialog(var URL: string; var URLName: string; var flPanelBrowser: boolean): boolean;
  end;


implementation

{$R *.dfm}


Constructor TfmURLPropsEditor.Create();
begin
Inherited Create(nil);
end;

function TfmURLPropsEditor.Dialog(var URL: string; var URLName: string; var flPanelBrowser: boolean): boolean;
begin
edURL.Text:=URL;
edURLName.Text:=URLName;
cbPanelBrowser.Checked:=flPanelBrowser;
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  URL:=edURL.Text;
  URLName:=edURLName.Text;
  flPanelBrowser:=cbPanelBrowser.Checked;
  Result:=true;
  end
 else Result:=false;
end;


procedure TfmURLPropsEditor.btnOKClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmURLPropsEditor.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
