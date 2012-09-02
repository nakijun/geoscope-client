unit unitOffersServerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TOffersServerPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    sbGetMailROBOT: TSpeedButton;
    Bevel1: TBevel;
    Label2: TLabel;
    procedure sbGetMailROBOTClick(Sender: TObject);
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
{/// ? Uses
  unitMailROBOT;}

{$R *.DFM}

Constructor TOffersServerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOffersServerPanelProps.Destroy;
begin
Inherited;
end;

procedure TOffersServerPanelProps._Update;
begin
Inherited;
end;

procedure TOffersServerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOffersServerPanelProps.Controls_ClearPropData;
begin
end;

procedure TOffersServerPanelProps.sbGetMailROBOTClick(Sender: TObject);
begin
/// ? with TfmMailROBOT.Create(TOffersServerFunctionality(ObjFunctionality)) do Show;
end;

end.
