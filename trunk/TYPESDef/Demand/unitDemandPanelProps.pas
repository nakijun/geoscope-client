unit UnitDemandPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  SpaceObjInterpretation, Db, StdCtrls,
  Buttons, ExtCtrls;

type
  TDemandPanelProps = class(TSpaceObjPanelProps)
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    LabelOwner: TLabel;
    Bevel: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
/// +
{Uses
  UnitClientDemandGoods;}
{$R *.DFM}

Constructor TDemandPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);

if flReadOnly then DisableControls;
Update;
end;

destructor TDemandPanelProps.Destroy;
begin
Inherited;
end;

procedure TDemandPanelProps._Update;
begin
Inherited;
end;

procedure TDemandPanelProps.DisableControls;
var
  I: integer;
begin
{for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;}
end;

procedure TDemandPanelProps.SpeedButton1Click(Sender: TObject);
begin
/// +telecom
{with TFormClientDemandGoods.Create(TComponentFunctionality(ObjFunctionality).Space, TComponentFunctionality(ObjFunctionality).idObj) do begin
ShowModal;
Destroy;
end;}
end;

procedure TDemandPanelProps.BitBtn1Click(Sender: TObject);
begin
//
end;

procedure TDemandPanelProps.Controls_ClearPropData;
begin
end;

end.
