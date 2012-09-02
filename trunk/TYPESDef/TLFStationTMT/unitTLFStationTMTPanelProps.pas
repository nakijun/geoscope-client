unit unitTLFStationTMTPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls;

type
  TTLFStationTMTPanelProps = class(TSpaceObjPanelProps)
    RxLabel5: TRxLabel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    edHostName: TEdit;
    Bevel: TBevel;
    RxLabel2: TRxLabel;
    edIDTEstChanel: TEdit;
    procedure edHostNameKeyPress(Sender: TObject; var Key: Char);
    procedure edIDTEstChanelKeyPress(Sender: TObject; var Key: Char);
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

Constructor TTLFStationTMTPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
Update;
end;

destructor TTLFStationTMTPanelProps.Destroy;
begin
Inherited;
end;

procedure TTLFStationTMTPanelProps._Update;
begin
Inherited;
edHostName.Text:=TTLFStationTMTFunctionality(ObjFunctionality).HostName;
edIDTestChanel.Text:=TTLFStationTMTFunctionality(ObjFunctionality).TestChanel;
end;

procedure TTLFStationTMTPanelProps.edHostNameKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D
 then TTLFStationTMTFunctionality(ObjFunctionality).HostName:=(Sender as TEdit).Text;
end;

procedure TTLFStationTMTPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTLFStationTMTPanelProps.Controls_ClearPropData;
begin
edHostName.Text:='';
end;

procedure TTLFStationTMTPanelProps.edIDTEstChanelKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D
 then TTLFStationTMTFunctionality(ObjFunctionality).TestChanel:=(Sender as TEdit).Text;
end;

end.
