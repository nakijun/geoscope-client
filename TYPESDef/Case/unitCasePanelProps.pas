unit UnitCasePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, TypesDefines,TypesFunctionality, Functionality,
  unitReflector, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation,
  RXCtrls;

type
  TCasePanelProps = class(TSpaceObjPanelProps)
    DBEditName: TDBEdit;
    DBEditDescr: TDBEdit;
    BitBtnDistrLines: TBitBtn;
    BitBtnResource: TBitBtn;
    Bevel: TBevel;
    RxLabel5: TRxLabel;
    bbStatistics: TBitBtn;
    procedure BitBtnDistrLinesClick(Sender: TObject);
    procedure BitBtnResourceClick(Sender: TObject);
    procedure bbStatisticsClick(Sender: TObject);
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
  UnitConnector_Resource,
  unitCaseStatistics;}

{$R *.DFM}

Constructor TCasePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCasePanelProps.Destroy;
begin
Inherited;
end;

procedure TCasePanelProps._Update;
begin
Inherited;
end;

procedure TCasePanelProps.BitBtnDistrLinesClick(Sender: TObject);
begin
/// +telecom
{with TFormCaseDistrLines.Create(TComponentFunctionality(ObjFunctionality).Space, idTCase,TComponentFunctionality(ObjFunctionality).idObj) do begin
Show;
Destroy;
end;}
end;

procedure TCasePanelProps.BitBtnResourceClick(Sender: TObject);
begin
with TypesSystem.Reflector do begin
/// +telecom
{with TFormConnectorsSpace.Create(idTCase,TComponentFunctionality(ObjFunctionality).idObj, TypesSystem.Reflector) do begin
Edit;
end;}
end;
end;

procedure TCasePanelProps.bbStatisticsClick(Sender: TObject);
begin
/// +telecom with TfmCaseStatistics.Create(TCaseFunctionality(ObjFunctionality)) do Show;
end;

procedure TCasePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCasePanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
DBEditDescr.Text:='';
end;

end.
