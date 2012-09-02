unit unitCUSTOMVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TCUSTOMVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edMODULEName: TEdit;
    edFunctionName: TEdit;
    edFunctionVersion: TEdit;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure edMODULENameKeyPress(Sender: TObject; var Key: Char);
    procedure edFunctionNameKeyPress(Sender: TObject; var Key: Char);
    procedure edFunctionVersionKeyPress(Sender: TObject; var Key: Char);
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

Constructor TCUSTOMVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCUSTOMVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TCUSTOMVisualizationPanelProps._Update;
begin
Inherited;
with TCUSTOMVisualizationFunctionality(ObjFunctionality) do begin
edMODULEName.Text:=MODULEName;
edFunctionName.Text:=FunctionName;
edFunctionVersion.Text:=IntToStr(FunctionVersion);
end;
end;

procedure TCUSTOMVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCUSTOMVisualizationPanelProps.Controls_ClearPropData;
begin
edMODULEName.Text:='';
edFunctionName.Text:='';
edFunctionVersion.Text:='';
end;

procedure TCUSTOMVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TBaseVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TBaseVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TCUSTOMVisualizationPanelProps.edMODULENameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCUSTOMVisualizationFunctionality(ObjFunctionality).MODULEName:=edMODULEName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCUSTOMVisualizationPanelProps.edFunctionNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCUSTOMVisualizationFunctionality(ObjFunctionality).FunctionName:=edFunctionName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCUSTOMVisualizationPanelProps.edFunctionVersionKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCUSTOMVisualizationFunctionality(ObjFunctionality).FunctionVersion:=StrToInt(edFunctionVersion.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;


end.
