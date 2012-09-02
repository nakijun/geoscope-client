unit UnitHousePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, TypesDefines, TypesFunctionality, Functionality, unitReflector,
  Db, SpaceObjInterpretation;

type
  THousePanelProps = class(TSpaceObjPanelProps)
    LabelType: TLabel;
    Bevel2: TBevel;
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

{$R *.DFM}

Constructor THousePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor THousePanelProps.Destroy;
begin
Inherited;
end;

procedure THousePanelProps._Update;
begin
Inherited;
edName.Text:=THouseFunctionality(ObjFunctionality).Name;
end;

procedure THousePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure THousePanelProps.Controls_ClearPropData;
begin
end;

end.
