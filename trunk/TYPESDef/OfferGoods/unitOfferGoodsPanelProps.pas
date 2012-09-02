unit unitOfferGoodsPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls;

type
  TOfferGoodsPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    RxLabel5: TRxLabel;
    lbName: TRxLabel;
    sbName: TSpeedButton;
    RxLabel1: TRxLabel;
    edAmount: TEdit;
    RxLabel2: TRxLabel;
    edMeasurement: TEdit;
    RxLabel3: TRxLabel;
    edMinPrice: TEdit;
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

Constructor TOfferGoodsPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOfferGoodsPanelProps.Destroy;
begin
Inherited;
end;

procedure TOfferGoodsPanelProps._Update;
var
  Street_Key,Point_Key: integer;
  I: integer;
begin
Inherited;
end;

procedure TOfferGoodsPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOfferGoodsPanelProps.Controls_ClearPropData;
begin
lbName.Caption:='';
edAmount.Text:='';
edMeasurement.Text:='';
edMinPrice.Text:='';
end;

end.
