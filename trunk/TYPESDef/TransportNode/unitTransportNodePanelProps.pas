unit unitTransportNodePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls, ComCtrls;

type
  TTransportNodePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    RxLabel5: TRxLabel;
    RxLabel1: TRxLabel;
    List: TListView;
    edName: TEdit;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
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

Constructor TTransportNodePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TTransportNodePanelProps.Destroy;
begin
Inherited;
end;

procedure TTransportNodePanelProps._Update;
begin
Inherited;
edName.Text:=ObjFunctionality.Name;
end;

procedure TTransportNodePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTransportNodePanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;

procedure TTransportNodePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  ObjFunctionality.Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

end.
