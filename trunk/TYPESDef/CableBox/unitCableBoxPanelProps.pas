unit UnitCableBoxPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Db, SpaceObjInterpretation,
  RXCtrls;

type
  TCableBoxPanelProps = class(TSpaceObjPanelProps)
    LabelPoint: TLabel;
    DBEditName: TDBEdit;
    LabelStreet: TLabel;
    ComboBox_Street: TComboBox;
    ComboBox_Point: TComboBox;
    LabelHouse: TLabel;
    DBEditHouse: TDBEdit;
    LabelCorpsSep: TLabel;
    DBEditCorps: TDBEdit;
    BitBtnCableBox_EditZoneService: TBitBtn;
    BitBtnCableBoxResource: TBitBtn;
    Bevel2: TBevel;
    RxLabel5: TRxLabel;
    procedure BitBtnCableBoxResourceClick(Sender: TObject);
    procedure BitBtnCableBox_EditZoneServiceClick(Sender: TObject);
    procedure ComboBox_PointChange(Sender: TObject);
    procedure ComboBox_StreetChange(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
/// +telecom
{Uses
  UnitFormCaseDistrLines,
  UnitEditBox_ZonesService,
  UnitConnector_Resource;}

{$R *.DFM}

Constructor TCableBoxPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCableBoxPanelProps.Destroy;
begin
Inherited;
end;

procedure TCableBoxPanelProps._Update;
var
  Street_Key,Point_Key: integer;
  I: integer;
begin
Inherited;
end;

procedure TCableBoxPanelProps.BitBtnCableBoxResourceClick(Sender: TObject);
begin
with TypesSystem.Reflector do begin
/// +telecom
{with TFormConnectorsSpace.Create(idTCableBox,TComponentFunctionality(ObjFunctionality).idObj, TypesSystem.Reflector) do begin
try
Edit;
except
  // иногда возникает неизвестно почему
  Beep;
  end;
end;}
end;
end;

procedure TCableBoxPanelProps.BitBtnCableBox_EditZoneServiceClick(
  Sender: TObject);
begin
/// +telecom
{with TEditBox_ZonesService.Create(TypesSystem.Reflector, idTCableBox,TComponentFunctionality(ObjFunctionality).idObj) do
begin
Edit;
Destroy;
end;}
end;

procedure TCableBoxPanelProps.ComboBox_PointChange(Sender: TObject);
begin
with (Sender as TComboBox) do begin
end;
end;

procedure TCableBoxPanelProps.ComboBox_StreetChange(Sender: TObject);
begin
with (Sender as TComboBox) do begin
end;
end;

procedure TCableBoxPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCableBoxPanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
ComboBox_Point.ItemIndex:=-1;
ComboBox_Street.ItemIndex:=-1;
DBEditHouse.Text:='';
DBEditCorps.Text:='';
end;

end.
