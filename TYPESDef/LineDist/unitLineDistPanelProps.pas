unit UnitLineDistPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, TypesDefines, Functionality,
  Db, SpaceObjInterpretation;

type
  TLineDistPanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    LabelType: TLabel;
    DBEditDistance: TDBEdit;
    LabelLength: TLabel;
    Bevel: TBevel;
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

Constructor TLineDistPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TLineDistPanelProps.Destroy;
begin
Inherited;
end;

procedure TLineDistPanelProps._Update;
begin
Inherited;
end;

procedure TLineDistPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TLineDistPanelProps.Controls_ClearPropData;
begin
DBEditDistance.Text:='';
LabelLength.Caption:='';
end;

end.
