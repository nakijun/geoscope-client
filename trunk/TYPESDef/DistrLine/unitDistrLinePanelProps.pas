unit UnitDistrLinePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, SpaceObjInterpretation, RXCtrls;

type
  TDistrLinePanelProps = class(TSpaceObjPanelProps)
    DBEditNumber: TDBEdit;
    DBEditDescr: TDBEdit;
    BitBtnResource: TBitBtn;
    BitBtnDamages: TBitBtn;
    BitBtnEventLog: TBitBtn;
    Bevel: TBevel;
    LabelOwner: TRxLabel;
    RxLabel5: TRxLabel;
    procedure BitBtnResourceClick(Sender: TObject);
    procedure BitBtnDamagesClick(Sender: TObject);
    procedure BitBtnEventLogClick(Sender: TObject);
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
  UnitLinesEditResource,
  UnitEditorDamages,
  UnitObjectEventLog;}

{$R *.DFM}

Constructor TDistrLinePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TDistrLinePanelProps.Destroy;
begin
Inherited;
end;

procedure TDistrLinePanelProps._Update;
var
  TOwner: integer;
  Owner_Key: integer;
  strOwner_key: string;
  S: string;
begin
inherited;
end;

procedure TDistrLinePanelProps.BitBtnResourceClick(Sender: TObject);
begin
/// +telecom
{with TFormResourceLines.Create(TComponentFunctionality(ObjFunctionality).Space, idTDistrLine,TComponentFunctionality(ObjFunctionality).idObj) do begin
Edit;
Destroy;
end;}
end;

procedure TDistrLinePanelProps.BitBtnDamagesClick(Sender: TObject);
begin
/// +telecom
{with TEditorDamages.Create(idTDistrLine,TComponentFunctionality(ObjFunctionality).idObj,nmTDistrLine+': '+DistrLine_Name(TComponentFunctionality(ObjFunctionality).idObj),TypesSystem.Reflector) do begin
Show;
end;}
end;

procedure TDistrLinePanelProps.BitBtnEventLogClick(Sender: TObject);
begin
/// +telecom
{with TFormObjectEventLog.Create(idTDistrLine,TComponentFunctionality(ObjFunctionality).idObj,nmTDistrLine+': '+DistrLine_Name(TComponentFunctionality(ObjFunctionality).idObj),'', TypesSystem.Reflector) do begin
ShowModal;
Destroy;
end;}
end;

procedure TDistrLinePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TDistrLinePanelProps.Controls_ClearPropData;
begin
DBEditNumber.Text:='';
LabelOwner.Caption:='';
DBEditDescr.Text:='';
end;

end.
