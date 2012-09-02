unit UnitCrossPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, SpaceObjInterpretation, RXCtrls;

type
  TCrossPanelProps = class(TSpaceObjPanelProps)
    DBEditName: TDBEdit;
    BitBtnMainLines: TBitBtn;
    BitBtnResource: TBitBtn;
    Bevel: TBevel;
    RxLabel5: TRxLabel;
    bbStartCrossIOperator: TBitBtn;
    bbSearch: TBitBtn;
    bbStatistics: TBitBtn;
    procedure BitBtnMainLinesClick(Sender: TObject);
    procedure BitBtnResourceClick(Sender: TObject);
    procedure bbStartCrossIOperatorClick(Sender: TObject);
    procedure bbSearchClick(Sender: TObject);
    procedure bbStatisticsClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure DoSearching;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

var
  CrossPanelProps: TCrossPanelProps;

implementation
/// +telecom
{Uses
  unitConnector_Resource,
  unitFormStationOrCross_MainLines,
  unitDauOperator,
  unitCrossPanelSearching,
  unitCrossStatistics;}

{$R *.DFM}

Constructor TCrossPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCrossPanelProps.Destroy;
begin
Inherited;
end;

procedure TCrossPanelProps._Update;
begin
Inherited;
end;


procedure TCrossPanelProps.BitBtnMainLinesClick(Sender: TObject);
begin
/// +telecom
{with TFormStationOrCross_MainLines.Create(TComponentFunctionality(ObjFunctionality).Space, idTCross,TComponentFunctionality(ObjFunctionality).idObj) do begin
Show;
Destroy;
end;}
end;

procedure TCrossPanelProps.BitBtnResourceClick(Sender: TObject);
begin
with TypesSystem.Reflector do begin
/// +telecom
{with TFormConnectorsSpace.Create(idTCross,TComponentFunctionality(ObjFunctionality).idObj, TypesSystem.Reflector) do begin
try
Edit;
except
  // иногда возникает неизвестно почему
  Beep;
  end;
end;}
end;
end;

procedure TCrossPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCrossPanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
end;

procedure TCrossPanelProps.bbStartCrossIOperatorClick(Sender: TObject);
begin
/// +telecom
{with TfmDauOperator.Create do Show;
Close;}
end;

procedure TCrossPanelProps.DoSearching;
begin
/// +telecom
{with TfmCrossPanelSearching.Create(ObjFunctionality as TCrossFunctionality) do begin
ShowModal;
Destroy;
end;}
end;

procedure TCrossPanelProps.bbSearchClick(Sender: TObject);
begin
DoSearching;
end;

procedure TCrossPanelProps.bbStatisticsClick(Sender: TObject);
begin
/// +telecom with TfmCrossStatistics.Create(TCrossFunctionality(ObjFunctionality)) do Show;
end;

end.
