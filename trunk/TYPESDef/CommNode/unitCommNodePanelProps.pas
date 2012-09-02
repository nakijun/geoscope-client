unit UnitCommNodePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  SpaceObjInterpretation, Db;

type
  TCommNodePanelProps = class(TSpaceObjPanelProps)
    LabelType: TLabel;
    DBEditName: TDBEdit;
    DBEditDescr: TDBEdit;
    BitBtnMonitorDamages: TBitBtn;
    BitBtnClients: TBitBtn;
    BitBtnReports: TBitBtn;
    BitBtnStatistics: TBitBtn;
    Bevel: TBevel;
    BitBtnCommLines: TBitBtn;
    BitBtnClientsStatistics: TBitBtn;
    procedure BitBtnMonitorDamagesClick(Sender: TObject);
    procedure BitBtnClientsClick(Sender: TObject);
    procedure BitBtnReportsClick(Sender: TObject);
    procedure BitBtnCommLinesClick(Sender: TObject);
    procedure BitBtnStatisticsClick(Sender: TObject);
    procedure BitBtnClientsStatisticsClick(Sender: TObject);
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
  unitDamageMonitor,
  unitServiceClients,
  unitCommNodeReports,
  unitCommNodeCommLines,
  unitCommNodeClientsStatistics,
  GoodsExplorer;}

{$R *.DFM}

Constructor TCommNodePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCommNodePanelProps.Destroy;
begin
Inherited;
end;

procedure TCommNodePanelProps._Update;
begin
Inherited;
end;

procedure TCommNodePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCommNodePanelProps.BitBtnMonitorDamagesClick(Sender: TObject);
begin
/// +telecom with TFormDamageMonitor.Create(TypesSystem.Reflector) do Show;
end;

procedure TCommNodePanelProps.BitBtnClientsClick(Sender: TObject);
begin
/// +telecom with TFormServiceClients.Create(TypesSystem.Reflector) do Show;
end;

procedure TCommNodePanelProps.BitBtnReportsClick(Sender: TObject);
begin
/// +telecom with TFormCommNodeReports.Create(TComponentFunctionality(ObjFunctionality).Space,TComponentFunctionality(ObjFunctionality).idObj) do Show;
end;

procedure TCommNodePanelProps.BitBtnCommLinesClick(Sender: TObject);
begin
/// +telecom with TFormCommNodeCommLines.Create(TComponentFunctionality(ObjFunctionality).Space) do Show;
end;

procedure TCommNodePanelProps.BitBtnStatisticsClick(Sender: TObject);
begin
/// +telecom with TGoodsExplor.Create(TComponentFunctionality(ObjFunctionality).Space) do Show;
end;

procedure TCommNodePanelProps.BitBtnClientsStatisticsClick(
  Sender: TObject);
begin
/// +telecom
{with TfmCommNodeClientsStatistics.Create(TComponentFunctionality(ObjFunctionality).Space) do begin
ShowModal;
Destroy;
end;}
end;

procedure TCommNodePanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
DBEditDescr.Text:='';
end;

end.
