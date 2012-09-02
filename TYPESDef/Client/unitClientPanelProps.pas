unit UnitClientPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, TypesDefines,TypesFunctionality,unitReflector, Db,
  Buttons, SpaceObjInterpretation, Functionality, RXCtrls;

type
  TClientPanelProps = class(TSpaceObjPanelProps)
    DBEditName: TDBEdit;
    LabelPoint: TLabel;
    LabelStreet: TLabel;
    ComboBox_Street: TComboBox;
    LabelHouse: TLabel;
    LabelApartment: TLabel;
    DBEditHouse: TDBEdit;
    LabelCorpsSep: TLabel;
    DBEditCorps: TDBEdit;
    DBEditApartment: TDBEdit;
    BitBtnServiceTLFs: TBitBtn;
    ComboBox_Point: TComboBox;
    Bevel2: TBevel;
    BitBtnCommLines: TBitBtn;
    Bevel1: TBevel;
    stDebet: TStaticText;
    RxLabel5: TRxLabel;
    procedure BitBtnServiceTLFsClick(Sender: TObject);
    procedure BitBtnCommLinesClick(Sender: TObject);
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
  UnitListObjects,
  UnitClientCommLines;}

{$R *.DFM}

Constructor TClientPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TClientPanelProps.Destroy;
begin
Inherited;
end;

procedure TClientPanelProps._Update;
var
  Street_Key,Point_Key: integer;
  I: integer;
  Money: Double;
begin
Inherited;
end;

procedure TClientPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TClientPanelProps.BitBtnServiceTLFsClick(Sender: TObject);
/// +telecom
{var
  List: TFormListObjects;}
begin
/// +telecom
{List:=TFormListObjects.Create(TypesSystem.Reflector);
with List do begin
Client_GetOwnerObjects(TComponentFunctionality(ObjFunctionality).idObj, List);
LabelCaption.Caption:='devices '+DBEditName.Text;
LabelAction.Hide;
Explore;
end;}
end;

procedure TClientPanelProps.BitBtnCommLinesClick(Sender: TObject);
begin
/// +telecom with TFormClientCommLines.Create(TComponentFunctionality(ObjFunctionality).Space,TComponentFunctionality(ObjFunctionality).idObj) do Show;
end;

procedure TClientPanelProps.Controls_ClearPropData;
begin
stDebet.Caption:='';
DBEditName.Text:='';
ComboBox_Point.ItemIndex:=-1;
ComboBox_Street.ItemIndex:=-1;
DBEditHouse.Text:='';
DBEditCorps.Text:='';
DBEditApartment.Text:='';
end;

end.
