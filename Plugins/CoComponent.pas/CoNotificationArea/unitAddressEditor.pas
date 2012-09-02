unit unitAddressEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TfmAddressEditor = class(TForm)
    Label1: TLabel;
    edAddress: TEdit;
    Label2: TLabel;
    cbMessageType: TComboBox;
    sbOk: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure edAddressChange(Sender: TObject);
    procedure cbMessageTypeChange(Sender: TObject);
    procedure sbOkClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
  private
    { Private declarations }
    flChanged: boolean;
    flAccepted: boolean;
  public
    { Public declarations }

    Constructor Create;
    function Edit(var Address: string; var MessageType: integer): boolean;
  end;

implementation
Uses
  unitAddressesEditor;

{$R *.dfm}


Constructor TfmAddressEditor.Create;
begin
Inherited Create(nil);
end;

function TfmAddressEditor.Edit(var Address: string; var MessageType: integer): boolean;
var
  I,Idx: integer;
begin
edAddress.Text:=Address;
cbMessageType.Items.Clear();
for I:=0 to Length(EventMessageTypeStrings)-1 do begin
  Idx:=cbMessageType.Items.AddObject(EventMessageTypeStrings[I],TObject(I));
  if (I = MessageType) then cbMessageType.ItemIndex:=Idx;
  end;
//.
flChanged:=false;
flAccepted:=false;
ShowModal();
if (flChanged AND flAccepted)
 then begin
  Address:=edAddress.Text;
  if (cbMessageType.ItemIndex <> -1)
   then MessageType:=Integer(cbMessageType.Items.Objects[cbMessageType.ItemIndex])
   else MessageType:=0; //. default
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmAddressEditor.edAddressChange(Sender: TObject);
begin
flChanged:=true;
end;

procedure TfmAddressEditor.cbMessageTypeChange(Sender: TObject);
begin
flChanged:=true;
end;


procedure TfmAddressEditor.sbOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmAddressEditor.sbCancelClick(Sender: TObject);
begin
Close();
end;

end.
