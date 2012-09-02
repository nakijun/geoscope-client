unit unitAreaNotificationServerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TAreaNotificationServerPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edInfo: TEdit;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edInfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

Constructor TAreaNotificationServerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TAreaNotificationServerPanelProps.Destroy;
begin
Inherited;
end;

procedure TAreaNotificationServerPanelProps._Update;
begin
Inherited;
edName.Text:=TAreaNotificationServerFunctionality(ObjFunctionality).Name;
edInfo.Text:=TAreaNotificationServerFunctionality(ObjFunctionality).Info;
end;

procedure TAreaNotificationServerPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TAreaNotificationServerFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TAreaNotificationServerPanelProps.edInfoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TAreaNotificationServerFunctionality(ObjFunctionality).Info:=edInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TAreaNotificationServerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TAreaNotificationServerPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edInfo.Text:='';
end;


end.
