unit unitTelecomServicePanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DB, DBTables, ImgList,
  Functionality, SpaceObjInterpretation;

type
  TTelecomServicePanelProps = class(TSpaceObjPanelProps)
    Image1: TImage;
    Panel1: TPanel;
    twMode: TTreeView;
    pnlFindByTLFNumber: TPanel;
    Label1: TLabel;
    edTLFNumber: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    FindByTLFNumber_lvResult: TListView;
    Bevel1: TBevel;
    ImageList: TImageList;
    pnlFindByClientName: TPanel;
    Label2: TLabel;
    Bevel2: TBevel;
    edClientName: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    FindByClient_lvResult: TListView;
    edPoint: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edStreet: TEdit;
    Label5: TLabel;
    edHouse: TEdit;
    Label6: TLabel;
    edCorps: TEdit;
    Label7: TLabel;
    edApartment: TEdit;
    procedure edTLFNumberKeyPress(Sender: TObject; var Key: Char);
    procedure twModeClick(Sender: TObject);
    procedure edClientNameKeyPress(Sender: TObject; var Key: Char);
    procedure FindByTLFNumber_lvResultDblClick(Sender: TObject);
    procedure FindByClient_lvResultDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearAllModes;
    procedure SelectFindByTLFNumberMode;
    procedure SelectFindByClientName;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure FindByTLFNumber(const TLFNumber: integer);
    procedure FindByClient(const ClientName: string; const TLFPoint: string; const TLFStreet: string; const TLFHouse: string; const TLFCorps: string; const TLFApartment: string);
  end;

implementation
Uses
  TypesDefines, TypesFunctionality;

{$R *.dfm}

Constructor TTelecomServicePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
//.
ClearAllModes;
//. set default
{/// - Show;
twMode.Items[0].Item[1].Selected:=true;
SelectFindByClientName;}
//.
end;

destructor TTelecomServicePanelProps.Destroy;
begin
Inherited;
end;

procedure TTelecomServicePanelProps._Update;
begin
Inherited;
end;

procedure TTelecomServicePanelProps.ClearAllModes;
begin
pnlFindByTLFNumber.Hide;
pnlFindByClientName.Hide;
end;

procedure TTelecomServicePanelProps.SelectFindByTLFNumberMode;
begin
ClearAllModes;
FindByTLFNumber_lvResult.Clear;
pnlFindByTLFNumber.Show;
edTLFNumber.SetFocus;
end;

procedure TTelecomServicePanelProps.SelectFindByClientName;
begin
ClearAllModes;
FindByClient_lvResult.Clear;
pnlFindByClientName.Show;
edClientName.SetFocus;
end;

procedure TTelecomServicePanelProps.FindByTLFNumber(const TLFNumber: integer);
var
  sStreet: string;
  sHome: string;
  SC: TCursor;
begin
end;

procedure TTelecomServicePanelProps.FindByClient(const ClientName: string; const TLFPoint: string; const TLFStreet: string; const TLFHouse: string; const TLFCorps: string; const TLFApartment: string);
const
  OutputMaxCount = 1000;
var
  SQLExpr: WideString;
  sStreet: string;
  sHome: string;
  I: integer;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
finally
Screen.Cursor:=SC;
end;
end;


procedure TTelecomServicePanelProps.twModeClick(Sender: TObject);
begin
if twMode.Items[0].Item[0].Selected
 then SelectFindByTLFNumberMode
 else
  if twMode.Items[0].Item[1].Selected
   then SelectFindByClientName
   else ClearAllModes;
end;

procedure TTelecomServicePanelProps.edTLFNumberKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then FindByTLFNumber(StrToInt(edTLFNumber.Text));
end;

procedure TTelecomServicePanelProps.edClientNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then FindByClient(edClientName.Text, edPoint.Text,edStreet.Text,edHouse.Text,edCorps.Text,edApartment.Text);
end;

procedure TTelecomServicePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTelecomServicePanelProps.Controls_ClearPropData;
begin
end;


procedure TTelecomServicePanelProps.FindByTLFNumber_lvResultDblClick(Sender: TObject);
var
  idClient: integer;
begin
if FindByTLFNumber_lvResult.Selected = nil then Exit; //. ->
idClient:=Integer(FindByTLFNumber_lvResult.Selected.Data);
with TClientFunctionality(TComponentFunctionality_Create(idTClient,idClient)) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TTelecomServicePanelProps.FindByClient_lvResultDblClick(Sender: TObject);
var
  idTLF: integer;
begin
if FindByClient_lvResult.Selected = nil then Exit; //. ->
idTLF:=Integer(FindByClient_lvResult.Selected.Data);
with TTLFFunctionality(TComponentFunctionality_Create(idTTLF,idTLF)) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;


end.
