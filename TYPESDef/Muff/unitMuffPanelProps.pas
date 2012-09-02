unit UnitMuffPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines, Functionality,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation;

type
  TMuffPanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    LabelType: TLabel;
    DBEditType: TDBEdit;
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
Constructor TMuffPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TMuffPanelProps.Destroy;
begin
Inherited;
end;

procedure TMuffPanelProps._Update;
begin
Inherited;
end;

procedure TMuffPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMuffPanelProps.Controls_ClearPropData;
begin
DBEditType.Text:='';
end;

end.
