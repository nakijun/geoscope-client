unit unitAddressPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  RXCtrls;

type
  TAddressPanelProps = class(TSpaceObjPanelProps)
    cbPoint: TComboBox;
    Bevel: TBevel;
    RxLabel2: TRxLabel;
    RxLabel1: TRxLabel;
    cbStreet: TComboBox;
    edHouse: TEdit;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    edCorps: TEdit;
    RxLabel5: TRxLabel;
    edEntrance: TEdit;
    RxLabel6: TRxLabel;
    edApartment: TEdit;
    procedure cbPointChange(Sender: TObject);
    procedure cbStreetChange(Sender: TObject);
    procedure edHouseKeyPress(Sender: TObject; var Key: Char);
    procedure edCorpsKeyPress(Sender: TObject; var Key: Char);
    procedure edEntranceKeyPress(Sender: TObject; var Key: Char);
    procedure edApartmentKeyPress(Sender: TObject; var Key: Char);
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

Constructor TAddressPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TAddressPanelProps.Destroy;
begin
Inherited;
end;

procedure TAddressPanelProps._Update;
var
  PointsTypeNames,StreetsTypeNames: TStringList;
  idP,idS: integer;
  I: integer;
begin
Inherited;
with TTAddressFunctionality(ObjFunctionality.TypeFunctionality) do begin
Points_GetTypeNames(PointsTypeNames);
Streets_GetTypeNames(StreetsTypeNames);
end;
with TAddressFunctionality(ObjFunctionality) do begin
idP:=idPoint;
cbPoint.Items.Assign(PointsTypeNames);
PointsTypeNames.Destroy;
for I:=0 to cbPoint.Items.Count-1 do
  if Integer(cbPoint.Items.Objects[I]) = idP
   then begin
    cbPoint.ItemIndex:=I;
    Break;
    end;
idS:=idStreet;
cbStreet.Items.Assign(StreetsTypeNames);
StreetsTypeNames.Destroy;
for I:=0 to cbStreet.Items.Count-1 do
  if Integer(cbStreet.Items.Objects[I]) = idS
   then begin
    cbStreet.ItemIndex:=I;
    Break;
    end;
edHouse.Text:=House;
I:=Corps;
if I <> 0
 then edCorps.Text:=IntToStr(I)
 else edCorps.Text:='';
edApartment.Text:=Apartment;
I:=Entrance;
if I <> 0
 then edEntrance.Text:=IntToStr(I)
 else edEntrance.Text:='';
end;
end;

procedure TAddressPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TAddressPanelProps.Controls_ClearPropData;
begin
cbPoint.ItemIndex:=-1;
cbStreet.ItemIndex:=-1;
edHouse.Text:='';
edCorps.Text:='';
edApartment.Text:='';
edEntrance.Text:='';
end;

procedure TAddressPanelProps.cbPointChange(Sender: TObject);
begin
if cbPoint.ItemIndex <> -1
 then begin
  Updater.Disable;
  try
  TAddressFunctionality(ObjFunctionality).idPoint:=Integer(cbPoint.Items.Objects[cbPoint.ItemIndex]);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TAddressPanelProps.cbStreetChange(Sender: TObject);
begin
if cbStreet.ItemIndex <> -1
 then begin
  Updater.Disable;
  try
  TAddressFunctionality(ObjFunctionality).idStreet:=Integer(cbStreet.Items.Objects[cbStreet.ItemIndex]);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TAddressPanelProps.edHouseKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TAddressFunctionality(ObjFunctionality).House:=edHouse.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TAddressPanelProps.edCorpsKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  if edCorps.Text <> ''
   then TAddressFunctionality(ObjFunctionality).Corps:=StrToInt(edHouse.Text)
   else TAddressFunctionality(ObjFunctionality).Corps:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TAddressPanelProps.edEntranceKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  if edEntrance.Text <> ''
   then TAddressFunctionality(ObjFunctionality).Entrance:=StrToInt(edEntrance.Text)
   else TAddressFunctionality(ObjFunctionality).Entrance:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TAddressPanelProps.edApartmentKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TAddressFunctionality(ObjFunctionality).Apartment:=edApartment.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

end.
