unit UnitNamePanelProps;

interface

uses
  UnitProxySpace, TypesDefines,TypesFunctionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Functionality, SpaceObjInterpretation;

type
  TNamePanelProps = class(TSpaceObjPanelProps)
    Panel2: TPanel;
    Text: TMemo;
    procedure TextKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flChanged: boolean;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure Save;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure SaveChanges; override;
  end;

implementation

{$R *.DFM}

Constructor TNamePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flChanged:=false;
Update;
end;

destructor TNamePanelProps.Destroy;
begin
Inherited;
end;

procedure TNamePanelProps._Update;
var
  I: integer;
begin
Inherited;
Text.Lines[0]:=TNameFunctionality(ObjFunctionality).Value;
end;

procedure TNamePanelProps.SaveChanges;
begin
if flChanged then Save;
Inherited;
end;

procedure TNamePanelProps.Save;
begin
Updater.Disable;
try
TNameFunctionality(ObjFunctionality).SetValue(Text.Lines[0]);
except
  Updater.Enabled;
  Raise; //.=>
  end;
flChanged:=false;
end;


procedure TNamePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TNamePanelProps.TextKeyPress(Sender: TObject; var Key: Char);
begin
flChanged:=true;
end;

procedure TNamePanelProps.Controls_ClearPropData;
begin
Text.Lines.Clear;
end;

end.
