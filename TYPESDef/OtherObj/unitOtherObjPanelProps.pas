unit UnitOtherObjPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines, Functionality, TypesFunctionality,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation;

type
  TOtherObjPanelProps = class(TSpaceObjPanelProps)
    LabelType: TLabel;
    Bevel2: TBevel;
    edDescription: TEdit;
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
Constructor TOtherObjPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOtherObjPanelProps.Destroy;
begin
Inherited;
end;

procedure TOtherObjPanelProps._Update;
begin
Inherited;
edDescription.Text:=TOtherObjFunctionality(ObjFunctionality).Name;
end;

procedure TOtherObjPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOtherObjPanelProps.Controls_ClearPropData;
begin
edDescription.Text:='';
end;

end.
