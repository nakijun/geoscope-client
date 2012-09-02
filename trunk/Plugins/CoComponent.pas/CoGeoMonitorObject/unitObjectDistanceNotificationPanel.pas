unit unitObjectDistanceNotificationPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unitCoGeoMonitorObjectFunctionality;

type
  TfmObjectDistanceNotificationPanel = class(TForm)
    Label1: TLabel;
    cbObjectDistanceType: TComboBox;
    Label2: TLabel;
    edDistance: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;

    procedure Validate();
  public
    { Public declarations }
    Constructor Create();
    function Dialog(var ObjectDistanceType: TObjectDistanceType; var Distance: double): boolean;
  end;


implementation

{$R *.dfm}


{TfmObjectDistanceNotificationPanel}
Constructor TfmObjectDistanceNotificationPanel.Create();
begin
Inherited Create(nil);
cbObjectDistanceType.Items.BeginUpdate;
try
cbObjectDistanceType.Clear;
cbObjectDistanceType.Items.AddObject('Threshold',TObject(odtMinMax));
cbObjectDistanceType.Items.AddObject('Minimum',TObject(odtMin));
cbObjectDistanceType.Items.AddObject('Maximum',TObject(odtMax));
finally
cbObjectDistanceType.Items.EndUpdate;
end;
end;

function TfmObjectDistanceNotificationPanel.Dialog(var ObjectDistanceType: TObjectDistanceType; var Distance: double): boolean;
begin
case ObjectDistanceType of
odtMinMax: cbObjectDistanceType.ItemIndex:=0;
odtMin: cbObjectDistanceType.ItemIndex:=1;
odtMax: cbObjectDistanceType.ItemIndex:=2;
else
  cbObjectDistanceType.ItemIndex:=-1;
end;
edDistance.Text:=FormatFloat('0',Distance);
flAccept:=false;
ShowModal();
if (flAccept)
 then begin
  case cbObjectDistanceType.ItemIndex of
  0: ObjectDistanceType:=odtMinMax;
  1: ObjectDistanceType:=odtMin;
  2: ObjectDistanceType:=odtMax;
  else
    ObjectDistanceType:=odtUnknown;
  end;
  Distance:=StrToFloat(edDistance.Text);
  //.
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmObjectDistanceNotificationPanel.Validate();
begin
case cbObjectDistanceType.ItemIndex of
0: ;
1: ;
else
  Raise Exception.Create('Criteria is not selected'); //. =>
end;
StrToFloat(edDistance.Text);
end;

procedure TfmObjectDistanceNotificationPanel.btnOkClick(Sender: TObject);
begin
Validate();
flAccept:=true;
Close();
end;

procedure TfmObjectDistanceNotificationPanel.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
