unit unitGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredObject1Model,
  unitGMO1BusinessModel,
  ExtCtrls;

const
  ProgramFolder = 'Geo.Log';
  ProgramTempFolder = 'TempDATA\'+ProgramFolder;
  
type
  TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel = class(TBusinessModelDeviceInitializerPanel)
    Timer: TTimer;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    StaticText1: TStaticText;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    StaticText2: TStaticText;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    StaticText3: TStaticText;
    btnUploadProgram: TBitBtn;
    Panel10: TPanel;
    GeoLog_cbflEnabled: TCheckBox;
    Label1: TLabel;
    edGeoSpace: TEdit;
    GeoLog_cbflServerConnection: TCheckBox;
    Bevel1: TBevel;
    GeoLog_cbflSaveQueue: TCheckBox;
    Label2: TLabel;
    GeoLog_edQueueTransmitInterval: TEdit;
    Label3: TLabel;
    GeoLog_edGPSModuleProviderReadInterval: TEdit;
    Label4: TLabel;
    GeoLog_edGPSModuleMapID: TEdit;
    procedure TimerTimer(Sender: TObject);
    procedure btnUploadProgramClick(Sender: TObject);
    procedure GeoLog_cbflEnabledClick(Sender: TObject);
  private
    { Private declarations }
    BusinessModel: TGMO1BusinessModel;
    //.
    GeoGraphServerAddress: string;
    ObjectUserID: integer;
    ObjectUserPassword: string;
    ObjectID: integer;
    ObjectGeoSpaceID: integer;

    procedure Initialize(const TargetFolder: string);
  public
    { Public declarations }
    Constructor Create(const pBusinessModel: TGMO1BusinessModel);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;


implementation
Uses
  ActiveX,
  StrUtils,
  MSXML,
  FileCtrl,
  DateUtils,
  GlobalSpaceDefines,
  FunctionalityImport,
  TypesDefines,
  unitReleaseLoader;

{$R *.dfm}


{TfmObjectDeviceInitialConfiguration}
Constructor TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.Create(const pBusinessModel: TGMO1BusinessModel);
begin
Inherited Create(nil);
BusinessModel:=pBusinessModel;
//.
Update();
end;

Destructor TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.Destroy;
begin
Inherited;
end;

procedure TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.Update;

var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  ObjectComponentID: integer;
  MapID: integer;
begin
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,BusinessModel.ObjectModel.ObjectController.idGeoGraphServerObject)) do
try
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,GeoGraphServerID)) do
try
GeoGraphServerAddress:=Address;
Object_GetProperties1(ObjectID, ObjectName,ObjectType,BusinessType,ObjectComponentID);
finally
Release;
end;
finally
Release;
end;
//.
BusinessModel.ObjectModel.ObjectSchema.RootComponent.LoadAll();
BusinessModel.ObjectModel.ObjectDeviceSchema.RootComponent.LoadAll();
//.
ObjectUserID:=ProxySpace_UserID();
ObjectUserPassword:=ProxySpace_UserPassword();
ObjectID:=BusinessModel.ObjectModel.ObjectController.ObjectID;
ObjectGeoSpaceID:=BusinessModel.ObjectModel.ObjectGeoSpaceID(); edGeoSpace.Text:=IntToStr(ObjectGeoSpaceID);
//.
case ObjectGeoSpaceID of
2:  MapID:=8;  //. Yandex.Maps
88: MapID:=6;  //. Native maps
89: MapID:=11; //. OpenStreet.Maps
90: MapID:=12; //. Google.Maps
91: MapID:=13; //. Navitel.Maps
else
  MapID:=0;
end;
GeoLog_edGPSModuleMapID.Text:=IntToStr(MapID);
end;

procedure TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.Initialize(const TargetFolder: string);
const
  GeoEyeConfigurationFile = 'PROFILEs\Default\GeoEye.Configuration';
  GeoEyeConfigurationFileVersion = 1;
  //.
  GeoLogConfigurationFile = 'PROFILEs\Default\Device.xml';
  GeoLogConfigurationFileVersion = 1;

  function GetProgramPackageURL(): string;
  const
    Localization = 'RU';

    function ConvertReleaseLevelToDateTime(const S: string): TDateTime;
    var
      Days,Months,Years,Hours,Mins: integer;
    begin
    if (Length(S) < 6) then Raise Exception.Create('wrong ReleaseLevel string'); //. =>
    Days:=StrToInt(S[1]+S[2]);
    Months:=StrToInt(S[3]+S[4]);
    Years:=2000+StrToInt(S[5]+S[6]);
    Hours:=0;
    Mins:=0;
    if (Length(S) >= 8)
     then Hours:=StrToInt(S[7]+S[8])
     else
      if (Length(S) >= 10)
       then Mins:=StrToInt(S[9]+S[10]);
    Result:=EncodeDateTime(Years,Months,Days,Hours,Mins,0,0);
    end;

  var
    ReleasesData: TByteArray;
    MS: TMemoryStream;
    OLEStream: IStream;
    Doc: IXMLDOMDocument;
    RootNode: IXMLDOMNode;
    VersionNode: IXMLDOMNode;
    Version: integer;
    ReleasesNode,ReleaseNode,ReleaseSeverityNode,ReleaseDescriptionNode,ReleaseURLsNode,ReleaseURLNode: IXMLDOMNode;
    I: integer;
    ReleaseLevelString: string;
    ReleaseLevel: double;
    ReleaseSeverity: integer;
    ReleaseDescriptionString: string;
  begin
  Result:='';
  //.
  with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,ProxySpace_UserID())) do
  try
  ClientProgram_GetReleases(Integer(mucpModel2GeoLogAndroidClient),Localization,{out} ReleasesData);
  finally
  Release;
  end;
  //.
  if (Length(ReleasesData) = 0) then Exit; //. ->
  //.
  MS:=TMemoryStream.Create;
  try
  MS.Write(Pointer(@ReleasesData[0])^,Length(ReleasesData));
  MS.Position:=0;
  OLEStream:=TStreamAdapter.Create(MS);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version < 1) then Raise Exception.Create('unsupported releases data version'); //. =>
  ReleasesNode:=RootNode.selectSingleNode('Releases');
  for I:=0 to ReleasesNode.childNodes.length-1 do begin
    ReleaseNode:=ReleasesNode.childNodes[I];
    //.
    ReleaseLevelString:=ReleaseNode.nodeName;
    ReleaseLevelString:=Copy(ReleaseLevelString,2,Length(ReleaseLevelString)-1);
    ReleaseLevel:=ConvertReleaseLevelToDateTime(ReleaseLevelString);
    //.
    ReleaseSeverityNode:=ReleaseNode.selectSingleNode('Severity');
    ReleaseSeverity:=ReleaseSeverityNode.nodeTypedValue;
    //. get release first URL
    ReleaseDescriptionNode:=ReleaseNode.selectSingleNode('Description');
    ReleaseDescriptionString:=ReleaseDescriptionNode.nodeTypedValue;
    //.
    ReleaseURLsNode:=ReleaseNode.selectSingleNode('URLs');
    if (ReleaseURLsNode.childNodes.length > 0)
     then begin
      Result:=ReleaseURLsNode.childNodes[Random(ReleaseURLsNode.childNodes.length)].nodeTypedValue;
      Exit; //. ->
      end;
    end;
  finally
  MS.Destroy;
  end;
  end;

  function ParseServerAddress(const ServerAddress: string;  out ServerIP: string; out ServerPort: integer): boolean;
  var
    I: integer;
  begin
  Result:=false;
  I:=Pos(':',ServerAddress);
  if (I > 0)
   then begin
    ServerPort:=StrToIntDef(Copy(ServerAddress, I+1, Length(ServerAddress)-I), 0);
    ServerIP:=Copy(ServerAddress, 1, I-1);
    Result:=true;
    end;
  end;

var
  ServerAddress: string;
  Idx: integer;
  ServerPort: integer;
  GeoSpaceID: integer;
  GeoLog_flEnabled: boolean;
  GeoLog_flServerConnection: boolean;
  GeoLog_ServerAddress: string;
  GeoLog_ServerPort: integer;
  GeoLog_ConnectorModule_LoopSleepTime: integer;
  GeoLog_QueueTransmitInterval: integer;
  GeoLog_flSaveQueue: boolean;
  GeoLog_GPSModuleProviderReadInterval: integer;
  GeoLog_GPSModuleMapID: integer;
  //.
  ProgramPackageURL: string;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
begin
ServerAddress:=ProxySpace_SOAPServerURL();
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
Idx:=Pos('http://',ServerAddress);
if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
//.
ServerPort:=80;
//.
GeoSpaceID:=StrToInt(edGeoSpace.Text);
//.
GeoLog_flEnabled:=GeoLog_cbflEnabled.Checked;
//.
GeoLog_flServerConnection:=GeoLog_cbflServerConnection.Checked;
//.
ParseServerAddress(GeoGraphServerAddress,{out} GeoLog_ServerAddress,{out} GeoLog_ServerPort);
//.
GeoLog_ConnectorModule_LoopSleepTime:=3000; //. default 3 seconds
//.
GeoLog_QueueTransmitInterval:=StrToInt(GeoLog_edQueueTransmitInterval.Text);
//.
GeoLog_flSaveQueue:=GeoLog_cbflSaveQueue.Checked;
//.
GeoLog_GPSModuleProviderReadInterval:=StrToInt(GeoLog_edGPSModuleProviderReadInterval.Text);
//.
GeoLog_GPSModuleMapID:=StrToInt(GeoLog_edGPSModuleMapID.Text);
//.
ProgramPackageURL:=GetProgramPackageURL();
if (ProgramPackageURL = '') then Raise Exception.Create('could not get program package url'); //. =>
try
with TfmReleaseLoader.Create(ProgramPackageURL,ProgramTempFolder) do
try
ShowModal();
if (NOT flCompleted) then Exit; //. ->
finally
Destroy();
end;
//. modify GeoEye configuration
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(ProgramTempFolder+'\'+GeoEyeConfigurationFile);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> GeoEyeConfigurationFileVersion) then Raise Exception.Create('unsupported file version, File: '+GeoEyeConfigurationFile+', Version: '+IntToStr(Version)); //. =>
RootNode.selectSingleNode('ServerAddress').nodeTypedValue:=ServerAddress;
RootNode.selectSingleNode('ServerPort').nodeTypedValue:=ServerPort;
RootNode.selectSingleNode('UserID').nodeTypedValue:=ObjectUserID;
RootNode.selectSingleNode('UserPassword').nodeTypedValue:=ObjectUserPassword;
RootNode.selectSingleNode('GeoSpaceID').nodeTypedValue:=GeoSpaceID;
if (GeoLog_flEnabled) then RootNode.selectSingleNode('GeoLog_flEnabled').nodeTypedValue:='1' else RootNode.selectSingleNode('GeoLog_flEnabled').nodeTypedValue:='0';
if (GeoLog_flServerConnection) then RootNode.selectSingleNode('GeoLog_flServerConnection').nodeTypedValue:='1' else RootNode.selectSingleNode('GeoLog_flServerConnection').nodeTypedValue:='0';
RootNode.selectSingleNode('GeoLog_ServerAddress').nodeTypedValue:=GeoLog_ServerAddress;
RootNode.selectSingleNode('GeoLog_ServerPort').nodeTypedValue:=GeoLog_ServerPort;
RootNode.selectSingleNode('GeoLog_ObjectID').nodeTypedValue:=ObjectID;
Doc.Save(ProgramTempFolder+'\'+GeoEyeConfigurationFile);
//. modify GeoLog configuration
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(ProgramTempFolder+'\'+GeoLogConfigurationFile);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> GeoLogConfigurationFileVersion) then Raise Exception.Create('unsupported file version, File: '+GeoLogConfigurationFile+', Version: '+IntToStr(Version)); //. =>
if (GeoLog_flEnabled) then RootNode.selectSingleNode('flEnabled').nodeTypedValue:='1' else RootNode.selectSingleNode('flEnabled').nodeTypedValue:='0';
RootNode.selectSingleNode('UserID').nodeTypedValue:=ObjectUserID;
RootNode.selectSingleNode('UserPassword').nodeTypedValue:=ObjectUserPassword;
RootNode.selectSingleNode('ObjectID').nodeTypedValue:=ObjectID;
if (GeoLog_flServerConnection) then RootNode.selectSingleNode('ConnectorModule/flServerConnectionEnabled').nodeTypedValue:='1' else RootNode.selectSingleNode('ConnectorModule/flServerConnectionEnabled').nodeTypedValue:='0';
RootNode.selectSingleNode('ConnectorModule/ServerAddress').nodeTypedValue:=GeoLog_ServerAddress;
RootNode.selectSingleNode('ConnectorModule/ServerPort').nodeTypedValue:=GeoLog_ServerPort;
RootNode.selectSingleNode('ConnectorModule/TransmitInterval').nodeTypedValue:=GeoLog_QueueTransmitInterval*1000;
if (GeoLog_flSaveQueue) then RootNode.selectSingleNode('ConnectorModule/flOutgoingSetOperationsQueueIsEnabled').nodeTypedValue:='1' else RootNode.selectSingleNode('ConnectorModule/flOutgoingSetOperationsQueueIsEnabled').nodeTypedValue:='0';
RootNode.selectSingleNode('ConnectorModule/LoopSleepTime').nodeTypedValue:=GeoLog_ConnectorModule_LoopSleepTime;
RootNode.selectSingleNode('GPSModule/Provider_ReadInterval').nodeTypedValue:=GeoLog_GPSModuleProviderReadInterval*1000;
RootNode.selectSingleNode('GPSModule/MapID').nodeTypedValue:=GeoLog_GPSModuleMapID;
Doc.Save(ProgramTempFolder+'\'+GeoLogConfigurationFile);
//. copy prepared folder into target
unitReleaseLoader.CopyFolder(ProgramTempFolder,TargetFolder+'\'+ProgramFolder);
finally
unitReleaseLoader.DeleteFolder(ProgramTempFolder);
end;
//.
ShowMessage('Program has been copied to the android device.');
end;

procedure TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.btnUploadProgramClick(Sender: TObject);
var
  DiskPath: string;
begin
if (NOT SelectDirectory('Select android device flash disk letter: ','',DiskPath)) then Exit; //. ->
Initialize(DiskPath);
end;

procedure TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.TimerTimer(Sender: TObject);
begin
Self.BringToFront();
end;

procedure TfmGMO1GeoLogAndroidBusinessModelDeviceInitializerPanel.GeoLog_cbflEnabledClick(Sender: TObject);
begin
if (GeoLog_cbflEnabled.Checked)
 then begin
  GeoLog_cbflServerConnection.Enabled:=true;
  GeoLog_cbflSaveQueue.Enabled:=(NOT GeoLog_cbflServerConnection.Checked);
  GeoLog_edQueueTransmitInterval.Enabled:=true;
  GeoLog_edGPSModuleProviderReadInterval.Enabled:=true;
  GeoLog_edGPSModuleMapID.Enabled:=true;
  end
 else begin
  GeoLog_cbflServerConnection.Enabled:=false;
  GeoLog_cbflSaveQueue.Enabled:=false;
  GeoLog_edQueueTransmitInterval.Enabled:=false;
  GeoLog_edGPSModuleProviderReadInterval.Enabled:=false;
  GeoLog_edGPSModuleMapID.Enabled:=false;
  end;
end;


end.
