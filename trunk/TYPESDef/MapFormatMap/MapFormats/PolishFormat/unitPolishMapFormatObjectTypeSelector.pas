unit unitPolishMapFormatObjectTypeSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmPolishFormatObjectTypeSelector = class(TForm)
    Label1: TLabel;
    cbKind: TComboBox;
    Label2: TLabel;
    lbType: TListBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure cbKindClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lbTypeDblClick(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;

    procedure lbType_Update(const KindID: integer);
    procedure CheckSelection();
  public
    { Public declarations }
    Constructor Create;
    procedure Update; reintroduce;
    function Dialog(out KindID: integer; out TypeID: integer): boolean; 
    function TypeDialog(const KindID: integer; out TypeID: integer): boolean;
  end;


implementation
uses
  unitPolishMapFormatDefines;

{$R *.dfm}


Constructor TfmPolishFormatObjectTypeSelector.Create;
begin
Inherited Create(nil);
Update();
end;

procedure TfmPolishFormatObjectTypeSelector.Update;
var
  I: TPMFObjectKind;
begin
lbType_Update(Integer(pmfokUnknown));
cbKind.Items.BeginUpdate;
try
cbKind.Items.Clear();
cbKind.ItemIndex:=-1;
for I:=Low(TPMFObjectKind) to High(TPMFObjectKind) do if (I <> pmfokUnknown)
 then begin
  cbKind.Items.AddObject(PMFObjectKindStrings[I],TObject(I));
  if (I = pmfokPOI)
   then begin
    cbKind.ItemIndex:=cbKind.Items.Count-1;
    lbType_Update(Integer(pmfokPOI));
    end;
  end;
finally
cbKind.Items.EndUpdate;
end;
end;

procedure TfmPolishFormatObjectTypeSelector.lbType_Update(const KindID: integer);
var
  I: integer;
begin
lbType.Items.BeginUpdate;
try
lbType.Items.Clear();
case TPMFObjectKind(KindID) of
pmfokPolyline:  for I:=0 to Length(POLYLINE_TYPES)-1 do lbType.Items.AddObject(POLYLINE_TYPES[I].TypeName,TObject(POLYLINE_TYPES[I].TypeID));
pmfokPolygon:   for I:=0 to Length(POLYGON_TYPES)-1 do lbType.Items.AddObject(POLYGON_TYPES[I].TypeName,TObject(POLYGON_TYPES[I].TypeID));
pmfokPOI:       for I:=0 to Length(POI_TYPES)-1 do lbType.Items.AddObject(POI_TYPES[I].TypeName,TObject(POI_TYPES[I].TypeID));
end;
lbType.ItemIndex:=-1;
finally
lbType.Items.EndUpdate;
end;
end;

procedure TfmPolishFormatObjectTypeSelector.CheckSelection();
begin
if (cbKind.ItemIndex = -1) then Raise Exception.Create('object kind is not selected'); //. =>
if (lbType.ItemIndex = -1) then Raise Exception.Create('object type is not selected'); //. =>
end;

function TfmPolishFormatObjectTypeSelector.Dialog(out KindID: integer; out TypeID: integer): boolean;
begin
cbKind.Enabled:=true;
//.
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  KindID:=Integer(cbKind.Items.Objects[cbKind.ItemIndex]);
  TypeID:=Integer(lbType.Items.Objects[lbType.ItemIndex]);
  Result:=true;
  end
 else Result:=false;
end;

function TfmPolishFormatObjectTypeSelector.TypeDialog(const KindID: integer; out TypeID: integer): boolean;
var
  I: integer;
begin
for I:=0 to cbKind.Items.Count-1 do
  if (TPMFObjectKind(cbKind.Items.Objects[I]) = TPMFObjectKind(KindID))
   then begin
    cbKind.ItemIndex:=I;
    lbType_Update(KindID);
    Break; //. >
    end;
cbKind.Enabled:=false;
//.
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  TypeID:=Integer(lbType.Items.Objects[lbType.ItemIndex]);
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmPolishFormatObjectTypeSelector.cbKindClick(Sender: TObject);
begin
if (cbKind.ItemIndex <> -1)
 then lbType_Update(Integer(cbKind.Items.Objects[cbKind.ItemIndex]))
 else lbType_Update(Integer(pmfokUnknown));
end;

procedure TfmPolishFormatObjectTypeSelector.btnOKClick(Sender: TObject);
begin
CheckSelection();
flAccepted:=true;
Close();
end;

procedure TfmPolishFormatObjectTypeSelector.btnCancelClick(Sender: TObject);
begin
Close();
end;

procedure TfmPolishFormatObjectTypeSelector.lbTypeDblClick(Sender: TObject);
begin
CheckSelection();
flAccepted:=true;
Close();
end;


end.
