unit unitUInt16BitMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const
  CheckboxesOffsetX = 4;
  CheckboxesOffsetY = 4;
  CheckboxesCount = 16;
  CheckboxSizeX = 33;
  CheckboxSizeY = 17;
type
  TDoOnSetOperation = procedure (const Value: word) of object;
  TDoOnSetBitOperation = procedure (const Index: integer; const Value: boolean) of object;

  TfmUInt16BitMap = class(TForm)
    ScrollBox: TScrollBox;
  private
    { Private declarations }
    _Value: word;
    Checkboxes: TList;
    flUpdating: boolean;

    procedure CreateBitmap();
    procedure UpdateBitMap();
    procedure setValue(NewValue: word);
    function getValue: word;
    procedure CheckBoxClick(Sender: TObject);
  public
    { Public declarations }
    OnSetEvent: TDoOnSetOperation;
    OnSetBitEvent: TDoOnSetBitOperation;

    Constructor Create(const AOwner: TComponent);
    property Value: word read getValue write setValue;
  end;


implementation

{$R *.dfm}

Constructor TfmUInt16BitMap.Create(const AOwner: TComponent);
begin
Inherited Create(AOwner);
CreateBitmap();
end;

procedure TfmUInt16BitMap.CreateBitmap();
var
  I: integer;
  BitCheckBox: TCheckBox;
begin
CheckBoxes:=TList.Create;
for I:=0 to CheckBoxesCount-1 do begin
  BitCheckBox:=TCheckBox.Create(Self);
  BitCheckBox.Caption:=IntToStr(I);
  BitCheckBox.Width:=CheckboxSizeX;
  BitCheckBox.Height:=CheckboxSizeY;
  BitCheckBox.Left:=CheckboxesOffsetX+I*CheckboxSizeX;
  BitCheckBox.Top:=CheckboxesOffsetY;
  BitCheckBox.OnClick:=CheckBoxClick;
  BitCheckBox.Tag:=I;
  BitCheckBox.ShowHint:=true;
  BitCheckBox.Hint:=IntToStr((1 SHL I));
  BitCheckBox.Parent:=ScrollBox;
  CheckBoxes.Add(BitCheckBox);
  end;
end;

procedure TfmUInt16BitMap.UpdateBitMap();
var
  W: word;
  I: integer;
begin
flUpdating:=true;
try
W:=1;
for I:=0 to Checkboxes.Count-1 do begin
  TCheckbox(Checkboxes[I]).Checked:=((_Value AND W) = W);
  W:=(W SHL 1);
  end;
finally
flUpdating:=false;
end;
end;

procedure TfmUInt16BitMap.setValue(NewValue: word);
begin
_Value:=NewValue;
UpdateBitMap();
end;

function TfmUInt16BitMap.getValue: word;
begin
Result:=_Value;
end;

procedure TfmUInt16BitMap.CheckBoxClick(Sender: TObject);
var
  CB: TCheckBox;
  W: word;
begin
if (flUpdating) then Exit; //. ->
CB:=TCheckBox(Sender);
W:=1;
W:=(W SHL CB.Tag);
if (CB.Checked)
 then _Value:=(_Value OR W)
 else _Value:=(_Value AND (NOT W));
//.
if (Assigned(OnSetEvent)) then OnSetEvent(_Value);
//.
if (Assigned(OnSetBitEvent)) then OnSetBitEvent(CB.Tag,CB.Checked);
end;


end.
