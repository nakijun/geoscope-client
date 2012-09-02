unit unitVIDEOVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TVIDEOVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    Label1: TLabel;
    edDataServer: TEdit;
    Label2: TLabel;
    edObjectID: TEdit;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure edDataServerKeyPress(Sender: TObject; var Key: Char);
    procedure edObjectIDKeyPress(Sender: TObject; var Key: Char);
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

Constructor TVIDEOVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TVIDEOVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TVIDEOVisualizationPanelProps._Update;
begin
Inherited;
edDataServer.Text:=TVIDEOVisualizationFunctionality(ObjFunctionality).DataServer;
edObjectID.Text:=IntToStr(TVIDEOVisualizationFunctionality(ObjFunctionality).ObjectID);
end;

procedure TVIDEOVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TVIDEOVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVIDEOVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TVIDEOVisualizationPanelProps.edDataServerKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then TVIDEOVisualizationFunctionality(ObjFunctionality).DataServer:=edDataServer.Text;
end;

procedure TVIDEOVisualizationPanelProps.edObjectIDKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then TVIDEOVisualizationFunctionality(ObjFunctionality).ObjectID:=StrToInt(edObjectID.Text);
end;

procedure TVIDEOVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TVIDEOVisualizationPanelProps.Controls_ClearPropData;
begin
edDataServer.Text:='';
edObjectID.Text:='';
end;


end.
