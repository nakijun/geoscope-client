unit unitProxyObjectPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines, unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls;

type
  TProxyObjectPanelProps = class(TSpaceObjPanelProps)
    SpeedButton1: TSpeedButton;
    Bevel: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure Update; override;
  end;

implementation

{$R *.DFM}

Constructor TProxyObjectPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TProxyObjectPanelProps.Destroy;
begin
Inherited;
end;

procedure TProxyObjectPanelProps.Update;
begin

Inherited;
end;

procedure TProxyObjectPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TProxyObjectPanelProps.Controls_ClearPropData;
begin
end;

procedure TProxyObjectPanelProps.SpeedButton1Click(Sender: TObject);
var
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
begin
if TProxyObjectFunctionality(ObjFunctionality).GetReference(idTOwner,idOwner)
 then begin //. ваводим панель свойств объекта, на который указывает Proxy
  OwnerFunctionality:=TComponentFunctionality_Create(Space, idTOwner,idOwner);
  if OwnerFunctionality <> nil
   then with OwnerFunctionality do begin
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Position:=poScreenCenter;
    Show;
    end;
    Release;
    end;
  end
end;

end.
