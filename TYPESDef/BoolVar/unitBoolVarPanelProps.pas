unit unitBoolVarPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  StdCtrls, Mask, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TBoolVarPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    lbSetTimeStamp: TLabel;
    cbValue: TComboBox;
    procedure cbValueChange(Sender: TObject);
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

Constructor TBoolVarPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TBoolVarPanelProps.Destroy;
begin
Inherited;
end;

procedure TBoolVarPanelProps._Update;
begin
Inherited;
if (TBoolVarFunctionality(ObjFunctionality).Value)
 then cbValue.ItemIndex:=1
 else cbValue.ItemIndex:=0;
lbSetTimeStamp.Caption:='Set time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TBoolVarFunctionality(ObjFunctionality).SetTimeStamp);
end;

procedure TBoolVarPanelProps.cbValueChange(Sender: TObject);
begin
if (NOT flUpdating)
 then begin
  TBoolVarFunctionality(ObjFunctionality).Value:=(cbValue.ItemIndex = 1);
  end;
end;

procedure TBoolVarPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TBoolVarPanelProps.Controls_ClearPropData;
begin
end;


end.
