unit unitGeoCrdSystemPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TGeoCrdSystemPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    sbGeodesyPoints: TSpeedButton;
    Label3: TLabel;
    sbProjectionDATA: TSpeedButton;
    Label4: TLabel;
    edGeoSpaceID: TEdit;
    sbUpdate: TSpeedButton;
    edGeoSpaceName: TEdit;
    sbSelectGeoSpace: TSpeedButton;
    cbDatum: TComboBox;
    cbProjection: TComboBox;
    sbGeoSpace: TSpeedButton;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbGeodesyPointsClick(Sender: TObject);
    procedure sbProjectionDATAClick(Sender: TObject);
    procedure edGeoSpaceIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbUpdateClick(Sender: TObject);
    procedure sbSelectGeoSpaceClick(Sender: TObject);
    procedure cbDatumChange(Sender: TObject);
    procedure cbProjectionChange(Sender: TObject);
    procedure sbGeoSpaceClick(Sender: TObject);
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
uses
  GeoTransformations,
  unitTGeoSpaceInstanceSelector,
  unitProjectionDATAPanel,
  unitGEOCrdSystemGeodesyPointsPanel;

{$R *.DFM}


Constructor TGeoCrdSystemPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: integer;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
//.
cbDatum.Items.Clear();
for I:=0 to DatumsCount-1 do cbDatum.Items.Add(Datums[I].DatumName);
cbDatum.Text:=Datums[23].DatumName; //. default: WGS-84
//.
cbProjection.Items.Clear();
for I:=0 to ProjectionsCount-1 do cbProjection.Items.Add(Projections[I].Name);
cbProjection.Text:=Projections[0].Name; //. default: LatLong
//.
if (flReadOnly) then DisableControls();
Update;
end;

destructor TGeoCrdSystemPanelProps.Destroy;
begin
Inherited;
end;

procedure TGeoCrdSystemPanelProps._Update;
var
  _GeoSpaceID: integer;
begin
Inherited;
edName.Text:=TGeoCrdSystemFunctionality(ObjFunctionality).Name;
_GeoSpaceID:=TGeoCrdSystemFunctionality(ObjFunctionality).GeoSpaceID;
edGeoSpaceID.Text:=IntToStr(_GeoSpaceID);
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,_GeoSpaceID)) do
try
try
Check();
edGeoSpaceName.Text:=Name;
edGeoSpaceName.Hint:=edGeoSpaceName.Text;
except
  edGeoSpaceName.Text:='';
  edGeoSpaceName.Hint:=edGeoSpaceName.Text;
  end;
finally
Release;
end;
cbDatum.Text:=TGeoCrdSystemFunctionality(ObjFunctionality).Datum;
cbProjection.Text:=TGeoCrdSystemFunctionality(ObjFunctionality).Projection;
//. ensure that geo-crd-system has been placed in cache
TSystemTGeoCrdSystem(ObjFunctionality.TypeSystem).Component_CheckCachedState(ObjFunctionality.idObj);
end;

procedure TGeoCrdSystemPanelProps.edGeoSpaceIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  TGeoCrdSystemFunctionality(ObjFunctionality).GeoSpaceID:=StrToInt(edGeoSpaceID.Text);
  end;
end;
end;

procedure TGeoCrdSystemPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoCrdSystemFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoCrdSystemPanelProps.cbDatumChange(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
TGeoCrdSystemFunctionality(ObjFunctionality).Datum:=cbDatum.Text;
end;

procedure TGeoCrdSystemPanelProps.cbProjectionChange(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
TGeoCrdSystemFunctionality(ObjFunctionality).Projection:=cbProjection.Text;
end;

procedure TGeoCrdSystemPanelProps.sbProjectionDATAClick(Sender: TObject);
begin
with TfmProjectionDATAPanel.Create(ObjFunctionality.idObj) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TGeoCrdSystemPanelProps.sbGeodesyPointsClick(Sender: TObject);
begin
with TfmGEOCrdSystemGeodesyPointsPanel.Create(ObjFunctionality.idObj) do Show;
end;

procedure TGeoCrdSystemPanelProps.sbUpdateClick(Sender: TObject);
begin
ObjFunctionality.NotifyOnComponentUpdate();
end;

procedure TGeoCrdSystemPanelProps.sbSelectGeoSpaceClick(Sender: TObject);
var
  NewGeoSpaceID: integer;
begin
with TfmTGeoSpaceInstanceSelector.Create do
try
if (Select(NewGeoSpaceID))
 then TGeoCrdSystemFunctionality(ObjFunctionality).GeoSpaceID:=NewGeoSpaceID;
finally
Destroy;
end;
end;

procedure TGeoCrdSystemPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TGeoCrdSystemPanelProps.Controls_ClearPropData;
begin
edGeoSpaceID.Text:='';
edGeoSpaceName.Text:='';
edName.Text:='';
cbDatum.Text:='';
cbProjection.Text:='';
end;

procedure TGeoCrdSystemPanelProps.sbGeoSpaceClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTGeoSpace,TGeoCrdSystemFunctionality(ObjFunctionality).GeoSpaceID) do
try
Check();
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show;
end;
finally
Release;
end;
end;


end.
