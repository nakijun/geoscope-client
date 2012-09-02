unit unitSecurityComponentOperationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TSecurityComponentOperationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    edName: TEdit;
    edSQLInfo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edSQLInfoKeyPress(Sender: TObject; var Key: Char);
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

Constructor TSecurityComponentOperationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TSecurityComponentOperationPanelProps.Destroy;
begin
Inherited;
end;

procedure TSecurityComponentOperationPanelProps._Update;
begin
Inherited;
with TSecurityComponentOperationFunctionality(ObjFunctionality) do begin
edName.Text:=Name;
edSQLInfo.Text:=SQLInfo;
end;
end;

procedure TSecurityComponentOperationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TSecurityComponentOperationPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edSQLInfo.Text:='';
end;

procedure TSecurityComponentOperationPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityComponentOperationFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TSecurityComponentOperationPanelProps.edSQLInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityComponentOperationFunctionality(ObjFunctionality).SQLInfo:=edSQLInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

end.
