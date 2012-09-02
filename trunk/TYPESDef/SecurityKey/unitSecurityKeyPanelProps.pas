unit unitSecurityKeyPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TSecurityKeyPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    edName: TEdit;
    edInfo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCode: TEdit;
    Label4: TLabel;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edInfoKeyPress(Sender: TObject; var Key: Char);
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

Constructor TSecurityKeyPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TSecurityKeyPanelProps.Destroy;
begin
Inherited;
end;

procedure TSecurityKeyPanelProps._Update;
begin
Inherited;
with TSecurityKeyFunctionality(ObjFunctionality) do begin
edName.Text:=Name;
edInfo.Text:=Info;
try
edCode.Text:=Code;
except
  edCode.Text:='?';
  end;
end;
end;

procedure TSecurityKeyPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TSecurityKeyPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edInfo.Text:='';
edCode.Text:='';
end;

procedure TSecurityKeyPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityKeyFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TSecurityKeyPanelProps.edInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityKeyFunctionality(ObjFunctionality).Info:=edInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

end.
