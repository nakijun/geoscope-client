unit unitCoGeoMonitorObjectTreeNewObjectPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmCoGeoMonitorObjectTreeNewObjectPanel = class(TForm)
    Label1: TLabel;
    edName: TEdit;
    Label2: TLabel;
    cbKind: TComboBox;
    Label3: TLabel;
    edDomain: TEdit;
    Label4: TLabel;
    memoInfo: TMemo;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
  public
    { Public declarations }
    Constructor Create();
    function Dialog(): boolean;
  end;

implementation
uses
  unitCoGeoMonitorObjectFunctionality;

{$R *.dfm}

Constructor TfmCoGeoMonitorObjectTreeNewObjectPanel.Create();
var
  I: TGeoMonitorObjectKind;
begin
Inherited Create(nil);
cbKind.Items.BeginUpdate();
try
cbKind.Items.Clear();
for I:=Low(TGeoMonitorObjectKind) to High(TGeoMonitorObjectKind) do cbKind.Items.Add(GeoMonitorObjectKindNames[I]);
finally
cbKind.Items.EndUpdate();
end;
end;

function TfmCoGeoMonitorObjectTreeNewObjectPanel.Dialog(): boolean;
begin
flAccept:=false;
ShowModal();
Result:=flAccept;
end;

procedure TfmCoGeoMonitorObjectTreeNewObjectPanel.btnOKClick(Sender: TObject);
begin
flAccept:=true;
Close();
end;

procedure TfmCoGeoMonitorObjectTreeNewObjectPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
