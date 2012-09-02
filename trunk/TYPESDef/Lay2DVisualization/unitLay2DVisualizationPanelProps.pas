unit unitLay2DVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines, TypesFunctionality,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation, RXCtrls;

type
  TLay2DVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    RxLabel1: TRxLabel;
    lbLevel: TRxLabel;
    RxLabel2: TRxLabel;
    edInfo: TEdit;
    procedure edInfoKeyPress(Sender: TObject; var Key: Char);
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

{$R *.DFM}
Constructor TLay2DVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TLay2DVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TLay2DVisualizationPanelProps._Update;
begin
Inherited;
lbLevel.Caption:=IntToStr(TLay2DVisualizationFunctionality(ObjFunctionality).Number);
edInfo.Text:=TLay2DVisualizationFunctionality(ObjFunctionality).Name;
end;

procedure TLay2DVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TLay2DVisualizationPanelProps.Controls_ClearPropData;
begin
lbLevel.Caption:='';
edInfo.Text:='';
end;

procedure TLay2DVisualizationPanelProps.edInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then TLay2DVisualizationFunctionality(ObjFunctionality).Name:=edInfo.Text;
end;

end.
