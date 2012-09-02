unit UnitBoxPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls;

type
  TBoxPanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    DBEditName: TDBEdit;
    LabelStreet: TLabel;
    LabelPoint: TLabel;
    ComboBox_Street: TComboBox;
    ComboBox_Point: TComboBox;
    LabelHouse: TLabel;
    LabelFloor: TLabel;
    DBEditFloor: TDBEdit;
    DBEditHouse: TDBEdit;
    LabelCorpsSep: TLabel;
    DBEditCorps: TDBEdit;
    LabelPanelEntrance: TLabel;
    DBEditEntrance: TDBEdit;
    BitBtnEditZoneService: TBitBtn;
    BitBtnResource: TBitBtn;
    Bevel: TBevel;
    RxLabel5: TRxLabel;
    procedure BitBtnResourceClick(Sender: TObject);
    procedure BitBtnEditZoneServiceClick(Sender: TObject);
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

Constructor TBoxPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TBoxPanelProps.Destroy;
begin
Inherited;
end;

procedure TBoxPanelProps._Update;
var
  Street_Key,Point_Key: integer;
  I: integer;
begin
Inherited;
end;

procedure TBoxPanelProps.BitBtnResourceClick(Sender: TObject);
begin
with TypesSystem.Reflector do begin
/// +telecom
{with TFormConnectorsSpace.Create(idTBox,TComponentFunctionality(ObjFunctionality).idObj, TypesSystem.Reflector) do begin
try
Edit;
except
  // иногда возникает неизвестно почему
  Beep;
  end;
end;}
end;
end;

procedure TBoxPanelProps.BitBtnEditZoneServiceClick(Sender: TObject);
begin
/// +telecom
{with TEditBox_ZonesService.Create(TypesSystem.Reflector, idTBox,TComponentFunctionality(ObjFunctionality).idObj) do
begin
Edit;
Destroy;
end;}
end;

procedure TBoxPanelProps.ComboBox_PointChange(Sender: TObject);
begin
with (Sender as TComboBox) do begin
end;
end;

procedure TBoxPanelProps.ComboBox_StreetChange(Sender: TObject);
begin
with (Sender as TComboBox) do begin
end;
end;

procedure TBoxPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TBoxPanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
ComboBox_Point.ItemIndex:=-1;
ComboBox_Street.ItemIndex:=-1;
DBEditHouse.Text:='';
DBEditCorps.Text:='';
DBEditFloor.Text:='';
DBEditEntrance.Text:='';
end;

end.
