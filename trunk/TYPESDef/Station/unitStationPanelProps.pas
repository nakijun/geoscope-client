unit UnitStationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, TypesDefines,TypesFunctionality,Functionality,
  Db, SpaceObjInterpretation, RXCtrls;

type
  TStationPanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    DBEditName: TDBEdit;
    LabelNumeration: TLabel;
    DBEditBegNumber: TDBEdit;
    LabelNumeration1: TLabel;
    DBEditEndNumber: TDBEdit;
    BitBtnMainLines: TBitBtn;
    BitBtnReports: TBitBtn;
    BitBtnResource: TBitBtn;
    Bevel: TBevel;
    BitBtn1: TBitBtn;
    RxLabel5: TRxLabel;
    BitBtn2: TBitBtn;
    procedure DBEditKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnMainLinesClick(Sender: TObject);
    procedure BitBtnResourceClick(Sender: TObject);
    procedure BitBtnReportsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
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
/// +telecom
{Uses
  UnitConnector_Resource,
  UnitFormStationOrCross_MainLines,
  UnitStationReports,
  UnitStationAKsMap,
  UnitStationAKsDamages;}

{$R *.DFM}

Constructor TStationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TStationPanelProps.Destroy;
begin
Inherited;
end;

procedure TStationPanelProps._Update;
begin
Inherited;
end;

procedure TStationPanelProps.BitBtnMainLinesClick(Sender: TObject);
begin
/// +telecom
{with TFormStationOrCross_MainLines.Create(TComponentFunctionality(ObjFunctionality).TypeFunctionality.Space, TComponentFunctionality(ObjFunctionality).TypeFunctionality.idType,TComponentFunctionality(ObjFunctionality).idObj) do begin
Show;
Destroy;
end;}
end;

procedure TStationPanelProps.BitBtnResourceClick(Sender: TObject);
begin
with TComponentFunctionality(ObjFunctionality).Space, Functionality.TypesSystem.Reflector do begin
/// +telecom
(*with TFormConnectorsSpace.Create(idTStation,TComponentFunctionality(ObjFunctionality).idObj, TypesSystem.Reflector) do begin
try
Edit;
except
  {иногда возникает неизвестно почему}
  Beep;
  end;
end;*)
end;
end;

procedure TStationPanelProps.DBEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D
 then {/// + with QueryProps do begin
  EnterSQL('UPDATE '+TComponentFunctionality(ObjFunctionality).TypeFunctionality.TableName+' SET Name = "'+DBEditName.Text+'",BegNumber = "'+DBEditBegNumber.Text+'",EndNumber = "'+DBEditEndNumber.Text+'" WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
  ExecSQL;
  end;}
end;

procedure TStationPanelProps.BitBtnReportsClick(Sender: TObject);
begin
/// +telecom
{with TFormStationsReports.Create(TComponentFunctionality(ObjFunctionality).Space, TComponentFunctionality(ObjFunctionality).idObj) do begin
ShowModal;
Destroy;
end;}
end;

procedure TStationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TStationPanelProps.BitBtn1Click(Sender: TObject);
begin
/// +telecom
{with TStationAKsMap.Create(TComponentFunctionality(ObjFunctionality).idObj) do begin
ShowModal;
Destroy;
end}
end;

procedure TStationPanelProps.BitBtn2Click(Sender: TObject);
begin
/// +telecom
{with TStationAKsDamages.Create(TComponentFunctionality(ObjFunctionality).idObj) do begin
ShowModal;
Destroy;
end}
end;

procedure TStationPanelProps.Controls_ClearPropData;
begin
DBEditName.Text:='';
DBEditBegNumber.Text:='';
DBEditEndNumber.Text:='';
end;

end.
