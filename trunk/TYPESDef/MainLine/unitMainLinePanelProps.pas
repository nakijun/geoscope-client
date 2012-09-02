unit UnitMainLinePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation,
  RXCtrls;

type
  TMainLinePanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    DBEditNumber: TDBEdit;
    DBEditDescr: TDBEdit;
    LabelDpndStrips: TLabel;
    LabelPanelCases: TLabel;
    DBEditDpndStrips: TDBEdit;
    DBEditCases: TDBEdit;
    BitBtnDamages: TBitBtn;
    BitBtnEventLog: TBitBtn;
    BitBtnResource: TBitBtn;
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

Constructor TMainLinePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TMainLinePanelProps.Destroy;
begin
Inherited;
end;

procedure TMainLinePanelProps._Update;
var
  OwnerName: string;
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  strOwner_Key: string;
  S: string;
begin
Inherited;
OwnerName:='';
if TMainLineFunctionality(ObjFunctionality).GetSTNOwner(idTOwner,idOwner)
 then begin
  OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
  if OwnerFunctionality <> nil
   then with OwnerFunctionality do begin
    OwnerName:=Name;
    Release;
    end;
  end;
LabelOwner.Caption:=OwnerName;
end;

procedure TMainLinePanelProps.BitBtnResourceClick(Sender: TObject);
begin
/// +telecom
{with TFormResourceLines.Create(TypesSystem.Reflector.Space, idTMainLine, TComponentFunctionality(ObjFunctionality).idObj) do begin
Edit;
Destroy;
end}
end;

procedure TMainLinePanelProps.BitBtnDamagesClick(Sender: TObject);
begin
/// +telecom
{with TEditorDamages.Create(idTMainLine,TComponentFunctionality(ObjFunctionality).idObj,nmTMainLine+': '+MainLine_Name(TComponentFunctionality(ObjFunctionality).idObj), TypesSystem.Reflector) do begin
Show;
end;}
end;

procedure TMainLinePanelProps.BitBtnEventLogClick(Sender: TObject);
begin
/// +telecom
{with TFormObjectEventLog.Create(idTMainLine,TComponentFunctionality(ObjFunctionality).idObj,nmTMainLine+': '+MainLine_Name(TComponentFunctionality(ObjFunctionality).idObj),'', TypesSystem.Reflector) do begin
ShowModal;
Destroy;
end;}
end;

procedure TMainLinePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMainLinePanelProps.Controls_ClearPropData;
begin
DBEditNumber.Text:='';
LabelOwner.Caption:='';
DBEditDescr.Text:='';
DBEditDpndStrips.Text:='';
DBEditCases.Text:='';
end;

end.
