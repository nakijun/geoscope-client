unit unitDoubleVarPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  StdCtrls, Mask, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TDoubleVarPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    lbSetTimeStamp: TLabel;
    edValue: TEdit;
    procedure edValueKeyPress(Sender: TObject; var Key: Char);
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

Constructor TDoubleVarPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TDoubleVarPanelProps.Destroy;
begin
Inherited;
end;

procedure TDoubleVarPanelProps._Update;
begin
Inherited;
edValue.Text:=FormatFloat('',TDoubleVarFunctionality(ObjFunctionality).Value);
lbSetTimeStamp.Caption:='Set time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TDoubleVarFunctionality(ObjFunctionality).SetTimeStamp);
end;

procedure TDoubleVarPanelProps.edValueKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable;
  try
  TDoubleVarFunctionality(ObjFunctionality).Value:=StrToFloat(edValue.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TDoubleVarPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TDoubleVarPanelProps.Controls_ClearPropData;
begin
edValue.Text:='';
lbSetTimeStamp.Caption:='';
end;


end.
