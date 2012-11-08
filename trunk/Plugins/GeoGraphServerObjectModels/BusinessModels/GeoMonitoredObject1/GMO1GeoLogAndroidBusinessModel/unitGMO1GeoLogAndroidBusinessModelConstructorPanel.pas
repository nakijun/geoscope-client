unit unitGMO1GeoLogAndroidBusinessModelConstructorPanel;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  unitBusinessModel,
  unitGMO1BusinessModel,
  unitGMO1GeoLogAndroidBusinessModel, Buttons;

type
  TTGMO1GeoLogAndroidBusinessModelConstructorPanel = class(TGMO1BusinessModelConstructorPanel)
    edGeoSpaceID: TEdit;
    edidTVisualization: TEdit;
    edidVisualization: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edCheckpointInterval: TEdit;
    Label6: TLabel;
    edGeoDistanceThreshold: TEdit;
    Label4: TLabel;
    edHintID: TEdit;
    Label8: TLabel;
    edUserAlertID: TEdit;
    Label9: TLabel;
    edOnlineFlagID: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    cbDeviceDatumID: TComboBox;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    edDeviceConnectorServiceProviderID: TEdit;
    Label11: TLabel;
    edDeviceConnectorServiceNumber: TEdit;
    Label13: TLabel;
    edDeviceDescriptorVendorID: TEdit;
    Label14: TLabel;
    edDeviceDescriptorModelID: TEdit;
    Label15: TLabel;
    edDeviceDescriptorSerialNumber: TEdit;
    Label16: TLabel;
    edDeviceDescriptorProductionDate: TEdit;
    Label17: TLabel;
    edDeviceDescriptorHWVersion: TEdit;
    Label18: TLabel;
    edDeviceDescriptorSWVersion: TEdit;
    edGeoSpaceName: TEdit;
    sbSelectGeoSpace: TSpeedButton;
    Label19: TLabel;
    edLocationIsAvailableFlagID: TEdit;
    procedure sbSelectGeoSpaceClick(Sender: TObject);
  private
    { Private declarations }
    GeoSpaceID: integer;
    CheckpointInterval: integer;
    idTVisualization: integer;
    idVisualization: integer;
    idHint: integer;
    idUserAlert: integer;
    idOnlineFlag: integer;
    idLocationIsAvailableFlag: integer;
    //.
    DeviceDatumID: integer;
    DeviceDescriptorVendorID: dword;
    DeviceDescriptorModelID: dword;
    DeviceDescriptorSerialNumber: dword;
    DeviceDescriptorProductionDate: TDateTime;
    DeviceDescriptorHWVersion: dword;
    DeviceDescriptorSWVersion: dword;
    DeviceConnectorServiceProviderID: word;
    DeviceConnectorServiceNumber: double;
    DeviceConnectorServiceTariff: word;
    GeoDistanceThreshold: integer;
  public
    { Public declarations }
    Constructor Create(const pBusinessModelClass: TBusinessModelClass); override;
    procedure Preset(const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer); override;
    procedure Preset1(const idGeoSpace: integer; const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer); override;
    procedure ValidateValues(); override;
    function Construct(const pidGeographServer: integer; const pidGeoGraphServerObject: integer): integer; override;
  end;

implementation
uses
  TypesDefines,
  FunctionalityImport,
  unitGEOGraphServerController,
  unitObjectModel,
  unitTGeoSpaceInstanceSelector;

{$R *.dfm}


//. transferred from GeoTransformations.pas
//. Datums
Type
  TEllipsoid = record
    ID: integer;
    DatumName: string;
    Ellipsoide_EquatorialRadius: Extended;
    Ellipsoid_EccentricitySquared: Extended;
  end;

Const //. well-known Datums definition
  DatumsCount = 24;
  Datums: array[0..DatumsCount-1] of TEllipsoid = (
    (ID: -1;    DatumName: 'Placeholder';           Ellipsoide_EquatorialRadius: 0;            Ellipsoid_EccentricitySquared: 0), //. to allow array indices to match id numbers
    (ID: 1;     DatumName: 'Airy';                  Ellipsoide_EquatorialRadius: 6377563.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 2;     DatumName: 'Australian National';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 3;     DatumName: 'Bessel 1841';           Ellipsoide_EquatorialRadius: 6377397.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 4;     DatumName: 'Bessel 1841 (Nambia)';  Ellipsoide_EquatorialRadius: 6377484.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 5;     DatumName: 'Clarke 1866';           Ellipsoide_EquatorialRadius: 6378206.0;    Ellipsoid_EccentricitySquared: 0.006768658),
    (ID: 6;     DatumName: 'Clarke 1880';           Ellipsoide_EquatorialRadius: 6378249.0;    Ellipsoid_EccentricitySquared: 0.006803511),
    (ID: 7;     DatumName: 'Everest';               Ellipsoide_EquatorialRadius: 6377276.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 8;     DatumName: 'Fischer 1960 (Mercury)';Ellipsoide_EquatorialRadius: 6378166.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 9;     DatumName: 'Fischer 1968';          Ellipsoide_EquatorialRadius: 6378150.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 10;    DatumName: 'GRS-1967';              Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694605),
    (ID: 11;    DatumName: 'GRS-1980';              Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438),
    (ID: 12;    DatumName: 'Helmert 1906';          Ellipsoide_EquatorialRadius: 6378200.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 13;    DatumName: 'Hough';                 Ellipsoide_EquatorialRadius: 6378270.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 14;    DatumName: 'International';         Ellipsoide_EquatorialRadius: 6378388.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 15;    DatumName: 'SK-42';                 Ellipsoide_EquatorialRadius: 6378245.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 16;    DatumName: 'Modified Airy';         Ellipsoide_EquatorialRadius: 6377340.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 17;    DatumName: 'Modified Everest';      Ellipsoide_EquatorialRadius: 6377304.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 18;    DatumName: 'Modified Fischer 1960'; Ellipsoide_EquatorialRadius: 6378155.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 19;    DatumName: 'South American 1969';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 20;    DatumName: 'WGS-60';                Ellipsoide_EquatorialRadius: 6378165.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 21;    DatumName: 'WGS-66';                Ellipsoide_EquatorialRadius: 6378145.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 22;    DatumName: 'WGS-72';                Ellipsoide_EquatorialRadius: 6378135.0;    Ellipsoid_EccentricitySquared: 0.006694318),
    (ID: 23;    DatumName: 'WGS-84';                Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438)
  );


Constructor TTGMO1GeoLogAndroidBusinessModelConstructorPanel.Create(const pBusinessModelClass: TBusinessModelClass);
var
  I: integer;
begin
Inherited Create(pBusinessModelClass);
//.
cbDeviceDatumID.Items.Clear;
for I:=0 to DatumsCount-1 do cbDeviceDatumID.Items.Add(Datums[I].DatumName);
cbDeviceDatumID.ItemIndex:=23; //. default: WGS-84
end;

procedure TTGMO1GeoLogAndroidBusinessModelConstructorPanel.Preset(const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer);
begin
Preset1(2{Yandex.Maps}, idTVisualization,idVisualization, idHint, idUserAlert, idOnlineFlag,idLocationIsAvailableFlag);
end;

procedure TTGMO1GeoLogAndroidBusinessModelConstructorPanel.Preset1(const idGeoSpace: integer; const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer); 
begin
edGeoSpaceID.Text:=IntToStr(idGeoSpace);
edidTVisualization.Text:=IntToStr(idTVisualization);
edidVisualization.Text:=IntToStr(idVisualization);
edHintID.Text:=IntToStr(idHint);
edUserAlertID.Text:=IntToStr(idUserAlert);
edOnlineFlagID.Text:=IntToStr(idOnlineFlag);
edLocationIsAvailableFlagID.Text:=IntToStr(idLocationIsAvailableFlag);
end;

procedure TTGMO1GeoLogAndroidBusinessModelConstructorPanel.ValidateValues();
begin
try
GeoSpaceID:=StrToInt(edGeoSpaceID.Text);
except
  Raise Exception.Create('Object Geo-Space ID has a wrong number.'); //. =>
  end;
DeviceDatumID:=cbDeviceDatumID.ItemIndex;
//.
try
CheckpointInterval:=StrToInt(edCheckpointInterval.Text);
except
  Raise Exception.Create('CheckpointInterval type has a wrong number.'); // =>
  end;
//.
try
GeoDistanceThreshold:=StrToInt(edGeoDistanceThreshold.Text);
except
  Raise Exception.Create('DistanceThreshold type has a wrong number.'); //. =>
  end;
//.
try
idTVisualization:=StrToInt(edidTVisualization.Text);
except
  Raise Exception.Create('Visualization type has a wrong number.'); //. =>
  end;
//.
try
idVisualization:=StrToInt(edidVisualization.Text);
except
  Raise Exception.Create('Visualization ID has a wrong number.'); //. =>
  end;
//.
try
idHint:=StrToInt(edHintID.Text);
except
  Raise Exception.Create('Hint ID has a wrong number.'); //. =>
  end;
//.
try
idUserAlert:=StrToInt(edUserAlertID.Text);
except
  Raise Exception.Create('UserAlert ID has a wrong number.'); //. =>
  end;
//.
try
idOnlineFlag:=StrToInt(edOnlineFlagID.Text);
except
  Raise Exception.Create('OnlineFlag ID has a wrong number.'); //. =>
  end;
//.
try
idLocationIsAvailableFlag:=StrToInt(edLocationIsAvailableFlagID.Text);
except
  Raise Exception.Create('LocationIsAvailableFlag ID has a wrong number.'); //. =>
  end;
//.
if (cbDeviceDatumID.ItemIndex = -1)
 then begin
  Raise Exception.Create('Object datum is not selected.'); //. =>
  end;
//.
//.
try
DeviceDescriptorVendorID:=StrToInt(edDeviceDescriptorVendorID.Text);
except
  DeviceDescriptorVendorID:=1;
  //. Raise Exception.Create('Vendor ID has a wrong number.'); //. =>
  end;
//.
try
DeviceDescriptorModelID:=StrToInt(edDeviceDescriptorModelID.Text);
except
  DeviceDescriptorModelID:=1;
  //. Raise Exception.Create('Model ID has a wrong number.'); //. =>
  end;
//.
try
DeviceDescriptorSerialNumber:=StrToInt(edDeviceDescriptorSerialNumber.Text);
except
  DeviceDescriptorSerialNumber:=0
  //. Raise Exception.Create('Serial number has a wrong number.'); //. =>
  end;
//.
try
if (edDeviceDescriptorProductionDate.Text <> '')
 then DeviceDescriptorProductionDate:=StrToDateTime(edDeviceDescriptorProductionDate.Text)
 else DeviceDescriptorProductionDate:=Now;
except
  DeviceDescriptorProductionDate:=Now;
  //. Raise Exception.Create('Production date has a wrong value.'); //. =>
  end;
//.
try
DeviceDescriptorHWVersion:=StrToInt(edDeviceDescriptorHWVersion.Text);
except
  DeviceDescriptorHWVersion:=0;
  //. Raise Exception.Create('HWVersion has a wrong number.'); //. =>
  end;
//.
try
DeviceDescriptorSWVersion:=StrToInt(edDeviceDescriptorSWVersion.Text);
except
  DeviceDescriptorSWVersion:=0;
  //. Raise Exception.Create('SWVersion has a wrong number.'); //. =>
  end;
//.
try
DeviceConnectorServiceProviderID:=StrToInt(edDeviceConnectorServiceProviderID.Text);
except
  DeviceConnectorServiceProviderID:=0;
  //. Raise Exception.Create('ServiceProvider ID has a wrong number.'); //. =>
  end;
//.
try
DeviceConnectorServiceNumber:=StrToFloat(edDeviceConnectorServiceNumber.Text);
except
  DeviceConnectorServiceNumber:=0;
  //. Raise Exception.Create('Number has a wrong number.'); //. =>
  end;
end;

function TTGMO1GeoLogAndroidBusinessModelConstructorPanel.Construct(const pidGeographServer: integer; const pidGeoGraphServerObject: integer): integer;
var
  _GeoGraphServerID: integer;
  _ObjectID: integer;
  _BusinessModelID: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  ObjectBusinessModel: TGMO1GeoLogAndroidBusinessModel;
  Visualization: TObjectDescriptor;
begin
Result:=0;
//.
ValidateValues();
//.
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,pidGeoGraphServer)) do
try
try
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,pidGeoGraphServerObject)) do
try
//. store old values
_GeoGraphServerID:=GeoGraphServerID;
_ObjectID:=ObjectID;
_BusinessModelID:=BusinessModelID;
//. set GeoGraphServer to the GeoGraphServerObject component (it checks write user access)
GeoGraphServerID:=pidGeoGraphServer;
//. Register new object 
Result:=RegisterObject2('Obj'+FormatDateTime('DDMMYYHHNNSS',Now),BusinessModelClass.ObjectTypeID,BusinessModelClass.ID,pidGeoGraphServerObject{ComponentID});
//. set Object to the GeoGraphServerObject component
ObjectID:=Result; //. attach Self to the GeoGraphServer
//. set Business model of constructed object to the GeoGraphServerObject component
BusinessModelID:=BusinessModelClass.ID;
//. wait for GeoGraphServer updates own list of objects (config params TimeToUpdateConfiguration for GeoGraphServer)
Sleep(10000{must be more than TimeToUpdateConfiguration});
//. setup model properties
ServerObjectController:=TGEOGraphServerObjectController.Create(pidGeoGraphServerObject,Result,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
try
ObjectModel:=TObjectModel.GetModel(BusinessModelClass.ObjectTypeID,ServerObjectController);
try
ObjectBusinessModel:=TGMO1GeoLogAndroidBusinessModel(TBusinessModel.GetModel(ObjectModel,BusinessModelClass.ID));
try
ObjectBusinessModel.CheckpointInterval:=CheckpointInterval;
ObjectBusinessModel.GeoSpaceID:=GeoSpaceID;
ObjectBusinessModel.DeviceDatumID:=DeviceDatumID;
//.
ObjectBusinessModel.DeviceDescriptorVendor:=DeviceDescriptorVendorID;
ObjectBusinessModel.DeviceDescriptorModel:=DeviceDescriptorModelID;
ObjectBusinessModel.DeviceDescriptorSerialNumber:=DeviceDescriptorSerialNumber;
ObjectBusinessModel.DeviceDescriptorProductionDate:=DeviceDescriptorProductionDate;
ObjectBusinessModel.DeviceDescriptorHWVersion:=DeviceDescriptorHWVersion;
ObjectBusinessModel.DeviceDescriptorSWVersion:=DeviceDescriptorSWVersion;
//.
ObjectBusinessModel.DeviceConnectionServiceProviderID:=DeviceConnectorServiceProviderID;
ObjectBusinessModel.DeviceConnectionServiceNumber:=DeviceConnectorServiceNumber;
//.
ObjectBusinessModel.DeviceGeoDistanceThreshold:=GeoDistanceThreshold;
Visualization.idTObj:=idTVisualization;
Visualization.idObj:=idVisualization;
ObjectBusinessModel.Visualization:=Visualization;
ObjectBusinessModel.HintID:=idHint;
ObjectBusinessModel.UserAlertID:=idUserAlert;
ObjectBusinessModel.OnlineFlagID:=idOnlineFlag;
ObjectBusinessModel.LocationIsAvailableFlagID:=idLocationIsAvailableFlag;
finally
ObjectBusinessModel.Destroy;
end;
finally
ObjectModel.Destroy();
end;
finally
ServerObjectController.Destroy();
end;
finally
Release;
end;
except
  //. restore old params
  with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,pidGeoGraphServerObject)) do
  try
  GeoGraphServerID:=_GeoGraphServerID;
  ObjectID:=_ObjectID;
  BusinessModelID:=_BusinessModelID;
  finally
  Release;
  end;
  //.
  if (Result <> 0) then UnRegisterObject(Result);
  Raise; //. =>
  end;
finally
Release;
end;
//. unregister last object if exists
if ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))
 then with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,_GeoGraphServerID)) do
  try
  UnRegisterObject(_ObjectID);
  finally
  Release;
  end;
end;

procedure TTGMO1GeoLogAndroidBusinessModelConstructorPanel.sbSelectGeoSpaceClick(Sender: TObject);
var
  GeoSpaceID: integer;
  GeoSpaceName: string;
begin
with TfmTGeoSpaceInstanceSelector.Create do
try
if (Select(GeoSpaceID,GeoSpaceName))
 then begin
  edGeoSpaceID.Text:=IntToStr(GeoSpaceID);
  edGeoSpaceName.Text:=GeoSpaceName;
  end
finally
Destroy;
end;
end;


end.
