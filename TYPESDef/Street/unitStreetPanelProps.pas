unit UnitStreetPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, TypesDefines,unitReflector, Functionality, SpaceObjInterpretation;

type
  TStreetPanelProps = class(TSpaceObjPanelProps)
    LabelType: TLabel;
    Bevel: TBevel;
    edName: TEdit;
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
Uses
  TypesFunctionality;

{$R *.DFM}
Constructor TStreetPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TStreetPanelProps.Destroy;
begin
Inherited;
end;

procedure TStreetPanelProps._Update;
begin
Inherited;
edName.Text:=TStreetFunctionality(ObjFunctionality).Name;
end;

procedure TStreetPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TStreetPanelProps.Controls_ClearPropData;
begin
end;

end.
