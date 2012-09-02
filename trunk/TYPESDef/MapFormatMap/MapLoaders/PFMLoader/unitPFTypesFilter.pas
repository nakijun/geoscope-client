unit unitPFTypesFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitPFMLoader, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TPFMapObjectTypesFilter = class(TMapObjectTypesFilter)
  public
    Constructor Create();
    procedure Update();
  end;

  TfmPFTypesFilter = class(TForm)
    Panel1: TPanel;
    lvTypes: TListView;
    Panel2: TPanel;
    btnClearAll: TBitBtn;
    btnSetAll: TBitBtn;
    btnAccept: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnClearAllClick(Sender: TObject);
    procedure btnSetAllClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    PFMapObjectTypesFilter: TPFMapObjectTypesFilter;
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create(const pPFMapObjectTypesFilter: TPFMapObjectTypesFilter);
    procedure Update; reintroduce;
    function Dialog(): boolean;
  end;

implementation
uses
  unitPolishMapFormatDefines;

{$R *.dfm}


{TPFMapObjectTypesFilter}
Constructor TPFMapObjectTypesFilter.Create;
begin
Inherited Create;
Update();
end;

procedure TPFMapObjectTypesFilter.Update();
var
  Idx: integer;
  I: integer;
begin
SetLength(Items,Length(POI_TYPES)+Length(POLYLINE_TYPES)+Length(POLYGON_TYPES));
Idx:=0;
//.
for I:=0 to Length(POI_TYPES)-1 do begin
  Items[Idx].KindID:=Integer(pmfokPOI);
  Items[Idx].TypeID:=POI_TYPES[I].TypeID;
  Items[Idx].flEnabled:=true;
  Inc(Idx);
  end;
//.
for I:=0 to Length(POLYLINE_TYPES)-1 do begin
  Items[Idx].KindID:=Integer(pmfokPOLYLINE);
  Items[Idx].TypeID:=POLYLINE_TYPES[I].TypeID;
  Items[Idx].flEnabled:=true;
  Inc(Idx);
  end;
//.
for I:=0 to Length(POLYGON_TYPES)-1 do begin
  Items[Idx].KindID:=Integer(pmfokPOLYGON);
  Items[Idx].TypeID:=POLYGON_TYPES[I].TypeID;
  Items[Idx].flEnabled:=true;
  Inc(Idx);
  end;
end;


Constructor TfmPFTypesFilter.Create(const pPFMapObjectTypesFilter: TPFMapObjectTypesFilter);
begin
Inherited Create(nil);
PFMapObjectTypesFilter:=pPFMapObjectTypesFilter;
Update();
end;

procedure TfmPFTypesFilter.Update;
var
  I: integer;
begin
with lvTypes do begin
Items.BeginUpdate();
try
Items.Clear();
for I:=0 to Length(PFMapObjectTypesFilter.Items)-1 do with Items.Add do begin
  Checked:=PFMapObjectTypesFilter.Items[I].flEnabled;
  case TPMFObjectKind(PFMapObjectTypesFilter.Items[I].KindID) of
  pmfokPolyline: Caption:='Polyline';
  pmfokPolygon: Caption:='Polygon';
  pmfokPOI: Caption:='POI';
  else
    Caption:='?';
  end;
  SubItems.Add(KIND_TYPES_GetNameByID(TPMFObjectKind(PFMapObjectTypesFilter.Items[I].KindID),PFMapObjectTypesFilter.Items[I].TypeID));
  SubItems.Add('0x'+ANSILowerCase(IntToHex(PFMapObjectTypesFilter.Items[I].TypeID,1)));
  end;
finally
Items.EndUpdate();
end;
end;
end;

function TfmPFTypesFilter.Dialog(): boolean;
begin
flAccepted:=false;
ShowModal();
Result:=flAccepted;
end;

procedure TfmPFTypesFilter.btnClearAllClick(Sender: TObject);
var
  I: integer;
begin
with lvTypes do for I:=0 to Items.Count-1 do Items[I].Checked:=false;
end;

procedure TfmPFTypesFilter.btnSetAllClick(Sender: TObject);
var
  I: integer;
begin
with lvTypes do for I:=0 to Items.Count-1 do Items[I].Checked:=true;
end;


procedure TfmPFTypesFilter.btnAcceptClick(Sender: TObject);
var
  I: integer;
begin
with lvTypes do for I:=0 to Items.Count-1 do PFMapObjectTypesFilter.Items[I].flEnabled:=Items[I].Checked;
//.
flAccepted:=true;
Close();
end;

procedure TfmPFTypesFilter.btnCancelClick(Sender: TObject);
begin
Close();
end;

end.
