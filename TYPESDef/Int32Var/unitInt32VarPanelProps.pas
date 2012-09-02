unit unitInt32VarPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  StdCtrls, Mask, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TInt32VarPanelProps = class(TSpaceObjPanelProps)
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

Constructor TInt32VarPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TInt32VarPanelProps.Destroy;
begin
Inherited;
end;

procedure TInt32VarPanelProps._Update;
begin
Inherited;
edValue.Text:=IntToStr(TInt32VarFunctionality(ObjFunctionality).Value);
lbSetTimeStamp.Caption:='Set time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TInt32VarFunctionality(ObjFunctionality).SetTimeStamp);
end;

procedure TInt32VarPanelProps.edValueKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable;
  try
  TInt32VarFunctionality(ObjFunctionality).Value:=StrToInt(edValue.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TInt32VarPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TInt32VarPanelProps.Controls_ClearPropData;
begin
edValue.Text:='';
lbSetTimeStamp.Caption:='';
end;


end.
