unit unitGeoMonitoredObject1Model;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  MSXML,
  ActiveX,
  Forms,
  GlobalSpaceDefines,
  unitGEOGraphServerController,
  unitObjectModel;

Const
  GeoMonitoredObject1ModelID = 101;
                                                      
Const
  UnavailableFixPrecision = 1000000000.0;
  UnknownFixPrecision     = -1000000000.0;
  
Type
  TGeoMonitoredObject1Component = class;                 
  TGeoMonitoredObject1DeviceComponent = class;

  //. Object schema side
  TVisualizationComponent = class(TSchemaComponent)
  public
    Descriptor:         TComponentObjectDescriptorValue;
    LastXYPosition:     TComponentXYCrdValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConfigurationData = packed record
    GeoSpaceID: integer;
    idTVisualization: integer;
    idVisualization: integer;
    idHint: integer;
    idUserAlert: integer;
    idOnlineFlag: integer;
    idLocationIsAvailableFlag: integer;
  end;

  TConfigurationValue = class(TComponentValue)
  private
    ObjectComponent: TGeoMonitoredObject1Component;
  public
    Value: TConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TGeoMonitoredObject1Component = class(TSchemaComponent)
  public
    GeoSpaceID:                 TComponentInt32Value;
    Visualization:              TVisualizationComponent;
    Hint:                       TComponentInt32Value;
    UserAlert:                  TComponentInt32Value;
    OnlineFlag:                 TComponentInt32Value;
    LocationIsAvailableFlag:    TComponentInt32Value;
    //. referenced values
    Configuration:      TConfigurationValue;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TGeoMonitoredObject1Schema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. Object device schema side
  TDeviceDescriptor = class(TSchemaComponent)
  public
    Vendor: TComponentUInt32Value;
    Model: TComponentUInt32Value;
    SerialNumber: TComponentUInt32Value;
    ProductionDate: TComponentDoubleValue;
    HWVersion: TComponentUInt32Value;
    SWVersion: TComponentUInt32Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TBatteryModule = class(TSchemaComponent)
  public
    Voltage: TComponentTimestampedUInt16Value;
    Charge: TComponentTimestampedUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectorModuleServiceProvider = class(TSchemaComponent)
  public
    ProviderID: TComponentUInt16Value;
    Number: TComponentDoubleValue;
    Account: TComponentTimestampedUInt16Value;
    Signal: TComponentTimestampedUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectorModuleConfiguration = class
  public
    LoopSleepTime: integer;
    TransmitInterval: integer;

    Constructor Create(const BA: TByteArray);
    function  ToByteArray(): TByteArray;
    procedure FromByteArray(const BA: TByteArray);
  end;

  TConnectorModuleConfigurationDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TConnectorModule = class(TSchemaComponent)
  public
    ServiceProvider: TConnectorModuleServiceProvider;
    CheckPointInterval: TComponentInt16Value;
    LastCheckpointTime: TComponentDoubleValue;
    IsOnline: TComponentTimestampedBooleanValue;
    //. referenced values
    ConfigurationDataValue: TConnectorModuleConfigurationDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPSFixData = packed record
    Timestamp: double;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
  end;

  TGPSFixDataValue = class(TComponentValue)
  public
    Value: TGPSFixData;
    LastValue: TGPSFixData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIData = packed record
    Timestamp: Double;
    MapID: DWord;
    POIID: DWord;
    POIType: DWord;
    POIName: shortstring;
    flPrivate: boolean;
  end;

  TMapPOIDataValue = class(TComponentValue)
  public
    Value: TMapPOIData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOITextData = packed record
    Timestamp: Double;
    Value: string;
  end;

  TMapPOITextValue = class(TComponentValue)
  public
    Value: TMapPOITextData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIImageData = packed record
    Timestamp: Double;
    Data: TByteArray;
  end;

  TMapPOIImageValue = class(TComponentValue)
  public
    Value: TMapPOIImageData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIDataFileData = packed record
    Timestamp: Double;
    FileName: string;
    Data: TByteArray;
  end;

  TMapPOIDataFileValue = class(TComponentValue)
  public
    Value: TMapPOIDataFileData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TGPSModuleMapPOIComponent = class(TSchemaComponent)
  public
    MapPOIData: TMapPOIDataValue;
    Text: TMapPOITextValue;
    Image: TMapPOIImageValue;
    DataFile: TMapPOIDataFileValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TFixMarkData = packed record
    Timestamp: Double;
    ObjID: DWord;
    ID: DWord;
  end;

  TFixMarkDataValue = class(TComponentValue)
  public
    Value: TFixMarkData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TGPSModuleFixMarkComponent = class(TSchemaComponent)
  public
    FixMarkData: TFixMarkDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPSModuleConfiguration = class
  public
    Provider_ReadInterval: integer;
    MapID: integer;
    MapPOI_Image_ResX: integer;
    MapPOI_Image_ResY: integer;
    MapPOI_Image_Quality: integer;
    MapPOI_Image_Format: string;
    MapPOI_MediaFragment_Audio_SampleRate: integer;
    MapPOI_MediaFragment_Audio_BitRate: integer;
    MapPOI_MediaFragment_Video_ResX: integer;
    MapPOI_MediaFragment_Video_ResY: integer;
    MapPOI_MediaFragment_Video_FrameRate: integer;
    MapPOI_MediaFragment_Video_BitRate: integer;
    MapPOI_MediaFragment_MaxDuration: integer;
    MapPOI_MediaFragment_Format: string;

    Constructor Create(const BA: TByteArray);
    function  ToByteArray(): TByteArray;
    procedure FromByteArray(const BA: TByteArray);
  end;

  TGPSModuleConfigurationDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TGPSModuleMode = (
    GPSMODULEMODE_DISABLED      = 0,
    GPSMODULEMODE_ENABLED       = 1
  );

  TGPSModuleStatus = (
    GPSMODULESTATUS_PERMANENTLYUNAVAILABLE      = -2,
    GPSMODULESTATUS_TEMPORARILYUNAVAILABLE      = -1,
    GPSMODULESTATUS_UNKNOWN                     = 0,
    GPSMODULESTATUS_AVAILABLE                   = 1
  );

  TGPSModule = class(TSchemaComponent)
  public
    Mode: TComponentTimestampedUInt16Value;
    Status: TComponentTimestampedInt16Value;
    DatumID: TComponentInt32Value;
    DistanceThreshold: TComponentInt16Value;
    GPSFixData: TGPSFixDataValue;
    MapPOI: TGPSModuleMapPOIComponent;
    FixMark: TGPSModuleFixMarkComponent;
    //. referenced values
    ConfigurationDataValue: TGPSModuleConfigurationDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPIModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPOModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TADCModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleArrayValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDACModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleArrayValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TVideoRecorderModuleConfiguration = class
  public
    flEnabled: boolean;
    Name: string;
    Measurement_MaxDuration: double;
    Measurement_LifeTime: double;
    Measurement_AutosaveInterval: double;
    Camera_Audio_SampleRate: integer;
    Camera_Audio_BitRate: integer;
    Camera_Video_ResX: integer;
    Camera_Video_ResY: integer;
    Camera_Video_FrameRate: integer;
    Camera_Video_BitRate: integer;

    Constructor Create(const BA: TByteArray);
    function  ToByteArray(): TByteArray;
    procedure FromByteArray(const BA: TByteArray);
  end;

  TVideoRecorderModuleConfigurationDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TVideoRecorderMeasurementsListValue = class(TComponentTimestampedANSIStringValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TVideoRecorderMeasurementDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TVideoRecorderModuleMode = (
    VIDEORECORDERMODULEMODE_UNKNOWN                     = 0,
    VIDEORECORDERMODULEMODE_H264STREAM1_AMRNBSTREAM1    = 1,
    VIDEORECORDERMODULEMODE_MODE_MPEG4                  = 2,
    VIDEORECORDERMODULEMODE_MODE_3GP                    = 3
  );

  TVideoRecorderModule = class(TSchemaComponent)
  public
    Mode: TComponentTimestampedUInt16Value;
    Active: TComponentTimestampedBooleanValue;
    Recording: TComponentTimestampedBooleanValue;
    Audio: TComponentTimestampedBooleanValue;
    Video: TComponentTimestampedBooleanValue;
    Transmitting: TComponentTimestampedBooleanValue;
    Saving: TComponentTimestampedBooleanValue;
    SDP: TComponentTimestampedANSIStringValue;
    Receivers: TComponentTimestampedANSIStringValue;
    SavingServer: TComponentTimestampedANSIStringValue;
    //. referenced values
    ConfigurationDataValue: TVideoRecorderModuleConfigurationDataValue;
    MeasurementsListValue: TVideoRecorderMeasurementsListValue;
    MeasurementDataValue: TVideoRecorderMeasurementDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TFileSystemDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TFileSystemModule = class(TSchemaComponent)
  public
    //. referenced values
    FileSystemDataValue: TFileSystemDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TControlDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TControlModule = class(TSchemaComponent)
  public
    //. referenced values
    ControlDataValue: TControlDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDeviceConfigurationData = packed record
    idGeographServerObject: Int64;
    CheckpointInterval: smallint;
    GeoDistanceThreshold: smallint;
  end;

  TDeviceConfigurationValue = class(TComponentValue)
  private
    DeviceComponent: TGeoMonitoredObject1DeviceComponent;
  public
    Value: TDeviceConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TDeviceCheckpointData1 = packed record
    CheckpointInterval: smallint;
    GPSFixData: TGPSFixData;
  end;

  TDeviceCheckpointValue1 = class(TComponentValue)
  private
    DeviceComponent: TGeoMonitoredObject1DeviceComponent;
  public
    Value: TDeviceCheckpointData1;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;


  TGPIValueFixData = packed record
    GPIValue: TComponentTimestampedUInt16Data;
    GPSFixData: TGPSFixData;
  end;

  TGPIValueFixValue = class(TComponentValue)
  private
    DeviceComponent: TGeoMonitoredObject1DeviceComponent;
  public
    Value: TGPIValueFixData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;


  TGeoMonitoredObject1DeviceComponent = class(TSchemaComponent)
  public
    DeviceDescriptor:           TDeviceDescriptor;
    BatteryModule:              TBatteryModule;
    ConnectorModule:            TConnectorModule;
    GPSModule:                  TGPSModule;
    GPIModule:                  TGPIModule;
    GPOModule:                  TGPOModule;
    ADCModule:                  TADCModule;
    DACModule:                  TDACModule;
    VideoRecorderModule:        TVideoRecorderModule;
    FileSystemModule:           TFileSystemModule;
    ControlModule:              TControlModule;
    //. referenced values
    Configuration:      TDeviceConfigurationValue;
    Checkpoint1:        TDeviceCheckpointValue1;
    GPIValueFixValue:   TGPIValueFixValue;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TGeoMonitoredObject1DeviceSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. MODEL
  TGeoMonitoredObject1Model = class(TObjectModel)
  public
    class function ID: integer; override;
    class function Name: string; override;

    Constructor Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
    function GetControlPanel(): TObjectModelControlPanel; override;
    function IsObjectOnline: boolean; override;
    function ObjectVisualization: TObjectDescriptor; override;
    function ObjectGeoSpaceID: integer; override;
    function ObjectDatumID: integer; override;
    procedure Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double); override;
    function DeviceConnectorServiceProviderNumber: double;
    procedure GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
    //. Connection Module
    function  ConnectorModule_GetConfiguration(): TByteArray;
    procedure ConnectorModule_SetConfiguration(const ConfigurationData: TByteArray);
    //. GPS Module
    function  GPSModule_GetConfiguration(): TByteArray;
    procedure GPSModule_SetConfiguration(const ConfigurationData: TByteArray);
    //. Video recorder
    function  VideoRecorder_GetConfiguration(): TByteArray;
    procedure VideoRecorder_SetConfiguration(const ConfigurationData: TByteArray);
    function  VideoRecorder_Measurements_GetList(): string;
    procedure VideoRecorder_Measurements_Delete(const MeasurementIDs: string);
    procedure VideoRecorder_Measurements_MoveToDataServer(const MeasurementIDs: string);
    function  VideoRecorder_Measurement_GetData(const MeasurementID: string; const Flags: integer = 0): TByteArray;
    function  VideoRecorder_Measurement_GetDataFragment(const MeasurementID: string; const StartTimestamp: double; const FinishTimestamp: double; const Flags: integer = 0): TByteArray;
    //. File System
    function  FileSystem_GetDirList(const Dir: string): string;
    function  FileSystem_GetFileData(const FileFullName: string): TByteArray;
    procedure FileSystem_CreateDir(const NewDir: string);
    procedure FileSystem_SetFileData(const FileFullName: string; const FileData: TByteArray);
    procedure FileSystem_DeleteFile(const FileFullName: string);
    function  FileSystem_StartFTPFileTransfer(const ServerAddress: string; const UserName: string; const UserPassword: string; const BaseDirectory: string; const FileFullName: string): string;
    procedure FileSystem_CancelFTPFileTransfer(const TransferID: string);
    procedure FileSystem_GetFTPFileTransferState(const TransferID: string; out Code: integer; out Message: string);
    //. Control Module
    function  ControlModule_GetDeviceStateInfo(): string;
    function  ControlModule_GetDeviceLogData(): TByteArray;
    procedure ControlModule_RestartDevice();
    procedure ControlModule_RestartDeviceProcess();
  end;

const
  VideoRecorderModuleModeStrings: array[TVideoRecorderModuleMode] of string = ('?','H264 media stream','MPEG4 registrator','3GP registrator');

Implementation
uses
  unitGeoMonitoredObject1ControlPanel;


//. Object schema side

{TVisualizationValue}
Constructor TVisualizationComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin                                                             
Inherited Create(pOwner,pID,'Visualization');
Descriptor      :=TComponentObjectDescriptorValue.Create(Self,1,'Descriptor');
LastXYPosition  :=TComponentXYCrdValue.Create           (Self,2,'LastXYPosition');
end;


{TConfigurationValue}
Constructor TConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.GeoSpaceID:=0;
Value.idTVisualization:=0;
Value.idVisualization:=0;
Value.idHint:=0;
Value.idUserAlert:=0;
Value.idOnlineFlag:=0;
Value.idLocationIsAvailableFlag:=0;
flVirtualValue:=true;
ObjectComponent:=TGeoMonitoredObject1Component(Owner);
end;

procedure TConfigurationValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TConfigurationData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TConfigurationValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TConfigurationData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TGeoMonitoredObject1Component}
Constructor TGeoMonitoredObject1Component.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,1,'GeoMonitoredObject1Component');
GeoSpaceID              :=TComponentInt32Value.Create   (Self,1,'GeoSpaceID');
Visualization           :=TVisualizationComponent.Create(Self,2);
Hint                    :=TComponentInt32Value.Create   (Self,3,'Hint');
UserAlert               :=TComponentInt32Value.Create   (Self,4,'UserAlert');
OnlineFlag              :=TComponentInt32Value.Create   (Self,5,'OnlineFlag');
LocationIsAvailableFlag :=TComponentInt32Value.Create   (Self,6,'LocationIsAvailableFlag');
//. referenced values
Configuration           :=TConfigurationValue.Create    (Self,1000);
end;


{TGeoMonitoredObject1Schema}
Constructor TGeoMonitoredObject1Schema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='ObjectSchema';
RootComponent:=TGeoMonitoredObject1Component.Create(Self);
end;


//. Object Device schema side

{TDeviceDescriptor}
Constructor TDeviceDescriptor.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DeviceDescriptor');
Vendor:=TComponentUInt32Value.Create(Self,1,'Vendor');
Model:=TComponentUInt32Value.Create(Self,2,'Model');
SerialNumber:=TComponentUInt32Value.Create(Self,3,'SerialNumber');
ProductionDate:=TComponentDoubleValue.Create(Self,4,'ProductionDate');
HWVersion:=TComponentUInt32Value.Create(Self,5,'HWVersion');
SWVersion:=TComponentUInt32Value.Create(Self,6,'SWVersion');
end;


{TBatteryModule}
Constructor TBatteryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'BatteryModule');
Voltage:=TComponentTimestampedUInt16Value.Create(Self,1,'Voltage');
Charge:=TComponentTimestampedUInt16Value.Create(Self,2,'Charge');
end;


{TConnectorModuleServiceProvider}
Constructor TConnectorModuleServiceProvider.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ServiceProvider');
ProviderID:=TComponentUInt16Value.Create(Self,1,'ProviderID');
Number:=TComponentDoubleValue.Create(Self,2,'Number');
Account:=TComponentTimestampedUInt16Value.Create(Self,3,'Account');
Signal:=TComponentTimestampedUInt16Value.Create(Self,4,'Signal');
end;


{TConnectorModuleConfiguration}
Constructor TConnectorModuleConfiguration.Create(const BA: TByteArray);
begin
Inherited Create();
LoopSleepTime:=1000*1; //. milliseconds
TransmitInterval:=1000*5; //. milliseconds
//.
FromByteArray(BA);
end;

procedure TConnectorModuleConfiguration.FromByteArray(const BA: TByteArray);
var
  MS: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
begin
if (Length(BA) = 0) then Exit; //. ->
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@BA[0])^,Length(BA));
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
if (Version <> 1) then Raise Exception.Create('unknown version'); //. =>
//.
Node:=RootNode.selectSingleNode('LoopSleepTime');
LoopSleepTime:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('TransmitInterval');
TransmitInterval:=Node.nodeTypedValue;
finally
MS.Destroy();
end;
end;

function TConnectorModuleConfiguration.ToByteArray(): TByteArray;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
  MS: TMemoryStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=1;
Root.appendChild(VersionNode);
//.
Node:=Doc.createElement('LoopSleepTime');
Node.nodeTypedValue:=LoopSleepTime;
Root.appendChild(Node);
//.
Node:=Doc.createElement('TransmitInterval');
Node.nodeTypedValue:=TransmitInterval;
Root.appendChild(Node);
//.
MS:=TMemoryStream.Create();
try
OLEStream:=TStreamAdapter.Create(MS);
Doc.Save(OLEStream);
SetLength(Result,MS.Size);
if (MS.Size > 0)
 then begin
  MS.Position:=0;
  MS.Read(Pointer(@Result[0])^,Length(Result));
  end;
finally
MS.Destroy();
end;
end;


{TConnectorModuleModuleConfigurationDataValue}
Constructor TConnectorModuleConfigurationDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConfigurationData');
flVirtualValue:=true;
end;

function TConnectorModuleConfigurationDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'ConnectorModule Configuration, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TConnectorModule}
Constructor TConnectorModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConnectorModule');
ServiceProvider:=TConnectorModuleServiceProvider.Create(Self,1);
CheckPointInterval:=TComponentInt16Value.Create(Self,2,'CheckPointInterval');
LastCheckpointTime:=TComponentDoubleValue.Create(Self,3,'LastCheckpointTime');
IsOnline:=TComponentTimestampedBooleanValue.Create(Self,4,'IsOnline');
//. referencing items
ConfigurationDataValue:=TConnectorModuleConfigurationDataValue.Create(Self,1001);
end;


{TGPSFixData}
function GPSFixData_IsNull(const Data: TGPSFixData): boolean;
begin
Result:=((Data.Latitude = 0.0) AND (Data.Longitude = 0.0));
end;


{TGPSFixDataValue}
Constructor TGPSFixDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TGPSFixDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
Value:=TGPSFixData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPSFixDataValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TGPSFixData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPSFixDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.TimeStamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Latitude');
Value.Latitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Longitude');
Value.Longitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Altitude');
Value.Altitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Speed');
Value.Speed:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Bearing');
Value.Bearing:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Precision');
Value.Precision:=SubNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPSFixDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TGPSFixDataValue.ToTrackNode(): pointer;
begin
if (GPSFixData_IsNull(Value))
 then begin
  Result:=nil;
  Exit; //. ->
  end; 
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Latitude:=Value.Latitude;
Longitude:=Value.Longitude;
Altitude:=Value.Altitude;
Speed:=Value.Speed;
Bearing:=Value.Bearing;
Precision:=Value.Precision;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPSFixDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+#$0D#$0A+
           'Latitude: '+FormatFloat('0.00000',Value.Latitude)+#$0D#$0A+
           'Longitude: '+FormatFloat('0.00000',Value.Longitude)+#$0D#$0A+
           'Altitude: '+FormatFloat('0.00000',Value.Altitude)+#$0D#$0A+
           'Speed: '+FormatFloat('0.00000',Value.Speed)+#$0D#$0A+
           'Bearing: '+FormatFloat('0.00000',Value.Bearing)+#$0D#$0A+
           'Precision: '+FormatFloat('0.00000',Value.Precision);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIDataValue}
Constructor TMapPOIDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TMapPOIDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  LI,I: integer;
begin
if ((Index+8+4+4+4+256+1) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.TimeStamp:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.TimeStamp));
//.
Value.MapID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.MapID));
//.
Value.POIID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.POIID));
//.
Value.POIType:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.POIType)); LI:=Index;
//.
SetLength(Value.POIName,BA[Index]); Inc(Index);
if (Length(Value.POIName) > 0)
 then
  for I:=1 to Length(Value.POIName) do begin
    Value.POIName[I]:=Char(BA[Index]);
    Inc(Index);
    if (Index > Length(BA)) then Break; //. >
    end;
Index:=LI+256;
//.
Value.flPrivate:=(BA[Index] <> 0); Inc(Index);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TMapPOIDataValue.ToByteArray(): TByteArray;
var
  I: integer;
  V: byte;
begin
SetLength(Result,8+4+4+4+256+1);
Owner.Schema.ObjectModel.Lock.Enter;
try
Double(Pointer(@Result[0])^):=Value.Timestamp;
//.
DWord(Pointer(@Result[8])^):=Value.MapID;
//.
DWord(Pointer(@Result[12])^):=Value.POIID;
//.
DWord(Pointer(@Result[16])^):=Value.POIType;
//.
Result[20]:=Byte(Length(Value.POIName));
for I:=0 to Length(Value.POIName)-1 do Result[21+I]:=Ord(Value.POIName[1+I]);
//.
if (Value.flPrivate) then V:=1 else V:=0;
Result[8+4+4+4+256]:=V;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TMapPOIDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.Timestamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('MapID');
Value.MapID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIID');
Value.POIID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIType');
Value.POIType:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIName');
Value.POIName:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('flPrivate');
Value.flPrivate:=(SubNode.nodeTypedValue <> '0');
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TMapPOIDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIDataValue.ToTrackEvent(): pointer;
var
  PS: string;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));                
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
if (Value.flPrivate) then PS:='yes' else PS:='no';
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+#$0D#$0A+
           'MapID: '+IntToStr(Value.MapID)+#$0D#$0A+
           'POIType: '+IntToHex(Value.POIType,4)+#$0D#$0A+
           'POIName: '+Value.POIName+#$0D#$0A+
           'Private: '+PS;
flBelongsToLastLocation:=true;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOITextValue}
Constructor TMapPOITextValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Text');
flVirtualValue:=true;
end;

procedure TMapPOITextValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
Value.Value:=ValueNode.SelectSingleNode('Data').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOITextValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOITextValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Text: '+Value.Value;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIImageValue}
Constructor TMapPOIImageValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Image');
flVirtualValue:=true;
end;

procedure TMapPOIImageValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOIImageValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIImageValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', POI Image';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIDataFileValue}
Constructor TMapPOIDataFileValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DataFile');
flVirtualValue:=true;
end;

procedure TMapPOIDataFileValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOIDataFileValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIDataFileValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', POI DataFile';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TGPSModuleMapPOIComponent}
Constructor TGPSModuleMapPOIComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MapPOI');
MapPOIData:=TMapPOIDataValue.Create(Self,1,'Data');
Text:=TMapPOITextValue.Create(Self,1001);
Image:=TMapPOIImageValue.Create(Self,1000);
DataFile:=TMapPOIDataFileValue.Create(Self,1002);
end;


{TFixMarkDataValue}
Constructor TFixMarkDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TFixMarkDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  LI,I: integer;
begin
if ((Index+8+4+4) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.Timestamp:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.Timestamp));
//.
Value.ObjID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.ObjID));
//.
Value.ID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.ID));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TFixMarkDataValue.ToByteArray(): TByteArray;
var
  I: integer;
  V: byte;
begin
SetLength(Result,8+4+4);
Owner.Schema.ObjectModel.Lock.Enter;
try
Double(Pointer(@Result[0])^):=Value.Timestamp;
//.
DWord(Pointer(@Result[8])^):=Value.ObjID;
//.
DWord(Pointer(@Result[12])^):=Value.ID;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TFixMarkDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;             
try
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.Timestamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('ObjID');
Value.ObjID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('ID');
Value.ID:=SubNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TFixMarkDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TFixMarkDataValue.ToTrackEvent(): pointer;
var
  PS: string;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+
           'ObjID: '+IntToStr(Value.ObjID)+#$0D#$0A+
           'ID: '+IntToStr(Value.ID);
flBelongsToLastLocation:=true;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

{TGPSModuleFixMarkComponent}
Constructor TGPSModuleFixMarkComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'FixMark');
FixMarkData:=TFixMarkDataValue.Create(Self,1,'Data');
end;


{TGPSModuleConfiguration}
Constructor TGPSModuleConfiguration.Create(const BA: TByteArray);
begin
Inherited Create();
Provider_ReadInterval:=1000*5; //. milliseconds
MapID:=0;
MapPOI_Image_ResX:=640;
MapPOI_Image_ResY:=480;
MapPOI_Image_Quality:=75;
MapPOI_Image_Format:='jpg';
MapPOI_MediaFragment_Audio_SampleRate:=-1;
MapPOI_MediaFragment_Audio_BitRate:=-1;
MapPOI_MediaFragment_Video_ResX:=640;
MapPOI_MediaFragment_Video_ResY:=480;
MapPOI_MediaFragment_Video_FrameRate:=10;
MapPOI_MediaFragment_Video_BitRate:=-1;
MapPOI_MediaFragment_MaxDuration:=-1;
MapPOI_MediaFragment_Format:='3gp';
//.
FromByteArray(BA);
end;

procedure TGPSModuleConfiguration.FromByteArray(const BA: TByteArray);
var
  MS: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
begin
if (Length(BA) = 0) then Exit; //. ->
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@BA[0])^,Length(BA));
MS.Position:=0;
DecimalSeparator:='.';
OLEStream:=TStreamAdapter.Create(MS);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 1) then Raise Exception.Create('unknown version'); //. =>
//.
Node:=RootNode.selectSingleNode('Provider_ReadInterval');
Provider_ReadInterval:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapID');
MapID:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/Image/IResX');
if (Node <> nil) then MapPOI_Image_ResX:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/Image/IResY');
if (Node <> nil) then MapPOI_Image_ResY:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/Image/IQuality');
if (Node <> nil) then MapPOI_Image_Quality:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/Image/IFormat');
if (Node <> nil) then MapPOI_Image_Format:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Audio/MFSampleRate');
if (Node <> nil) then MapPOI_MediaFragment_Audio_SampleRate:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Audio/MFABitRate');
if (Node <> nil) then MapPOI_MediaFragment_Audio_BitRate:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Video/MFResX');
if (Node <> nil) then MapPOI_MediaFragment_Video_ResX:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Video/MFResY');
if (Node <> nil) then MapPOI_MediaFragment_Video_ResY:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Video/MFFrameRate');
if (Node <> nil) then MapPOI_MediaFragment_Video_FrameRate:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/Video/MFVBitRate');
if (Node <> nil) then MapPOI_MediaFragment_Video_BitRate:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/MFMaxDuration');
if (Node <> nil) then MapPOI_MediaFragment_MaxDuration:=Node.nodeTypedValue;
//.
Node:=RootNode.selectSingleNode('MapPOI/MediaFragment/MFFormat');
if (Node <> nil) then MapPOI_MediaFragment_Format:=Node.nodeTypedValue;
finally
MS.Destroy();
end;
end;

function TGPSModuleConfiguration.ToByteArray(): TByteArray;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  Node,MapPOINode,ImageNode,MediaFragmentNode,AudioNode,VideoNode: IXMLDOMElement;
  OLEStream: IStream;
  MS: TMemoryStream;
begin
DecimalSeparator:='.';
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=1;
Root.appendChild(VersionNode);
//.
Node:=Doc.createElement('Provider_ReadInterval');
Node.nodeTypedValue:=Provider_ReadInterval;
Root.appendChild(Node);
//.
Node:=Doc.createElement('MapID');
Node.nodeTypedValue:=MapID;
Root.appendChild(Node);
//.
MapPOINode:=Doc.createElement('MapPOI');
  ImageNode:=Doc.createElement('Image');
    //.
    Node:=Doc.createElement('IResX');
    Node.nodeTypedValue:=MapPOI_Image_ResX;
    ImageNode.appendChild(Node);
    //.
    Node:=Doc.createElement('IResY');
    Node.nodeTypedValue:=MapPOI_Image_ResY;
    ImageNode.appendChild(Node);
    //.
    Node:=Doc.createElement('IQuality');
    Node.nodeTypedValue:=MapPOI_Image_Quality;
    ImageNode.appendChild(Node);
    //.
    Node:=Doc.createElement('IFormat');
    Node.nodeTypedValue:=MapPOI_Image_Format;
    ImageNode.appendChild(Node);
  MapPOINode.appendChild(ImageNode);
  //.
  MediaFragmentNode:=Doc.createElement('MediaFragment');
    AudioNode:=Doc.createElement('Audio');
      Node:=Doc.createElement('MFSampleRate');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Audio_SampleRate;
      AudioNode.appendChild(Node);
      //.
      Node:=Doc.createElement('MFABitRate');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Audio_BitRate;
      AudioNode.appendChild(Node);
    MediaFragmentNode.appendChild(AudioNode);
    VideoNode:=Doc.createElement('Video');
      Node:=Doc.createElement('MFResX');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Video_ResX;
      VideoNode.appendChild(Node);
      //.
      Node:=Doc.createElement('MFResY');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Video_ResY;
      VideoNode.appendChild(Node);
      //.
      Node:=Doc.createElement('MFFrameRate');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Video_FrameRate;
      VideoNode.appendChild(Node);
      //.
      Node:=Doc.createElement('MFVBitRate');
      Node.nodeTypedValue:=MapPOI_MediaFragment_Video_BitRate;
      VideoNode.appendChild(Node);
    MediaFragmentNode.appendChild(VideoNode);
    //.
    Node:=Doc.createElement('MFMaxDuration');
    Node.nodeTypedValue:=MapPOI_MediaFragment_MaxDuration;
    MediaFragmentNode.appendChild(Node);
    //.
    Node:=Doc.createElement('MFFormat');
    Node.nodeTypedValue:=MapPOI_MediaFragment_Format;
    MediaFragmentNode.appendChild(Node);
  MapPOINode.appendChild(MediaFragmentNode);
Root.appendChild(MapPOINode);
//.
MS:=TMemoryStream.Create();
try
OLEStream:=TStreamAdapter.Create(MS);
Doc.Save(OLEStream);
SetLength(Result,MS.Size);
if (MS.Size > 0)
 then begin
  MS.Position:=0;
  MS.Read(Pointer(@Result[0])^,Length(Result));
  end;
finally
MS.Destroy();
end;
end;


{TGPSModuleConfigurationDataValue}
Constructor TGPSModuleConfigurationDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConfigurationData');
flVirtualValue:=true;
end;

function TGPSModuleConfigurationDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'GPSModule Configuration, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TGPSModule}
Constructor TGPSModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPSModule');
Mode                    :=TComponentTimestampedUInt16Value.Create       (Self,1,'Mode');
Status                  :=TComponentTimestampedInt16Value.Create        (Self,2,'Status');
DatumID                 :=TComponentInt32Value.Create                   (Self,3,'DatumID');
DistanceThreshold       :=TComponentInt16Value.Create                   (Self,4,'DistanceThreshold');
GPSFixData              :=TGPSFixDataValue.Create                       (Self,5,'GPSFixData');
MapPOI                  :=TGPSModuleMapPOIComponent.Create              (Self,6);
FixMark                 :=TGPSModuleFixMarkComponent.Create             (Self,7);
//. referencing items
ConfigurationDataValue:=TGPSModuleConfigurationDataValue.Create(Self,1001);
end;


{TGPIModule}
Constructor TGPIModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPIModule');
Value:=TComponentTimestampedUInt16Value.Create(Self,1,'Value');
end;


{TGPOModule}
Constructor TGPOModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPOModule');
Value:=TComponentTimestampedUInt16Value.Create(Self,1,'Value');
end;


{TADCModule}
Constructor TADCModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ADCModule');
Value:=TComponentTimestampedDoubleArrayValue.Create(Self,1,'Value');
end;


{TDACModule}
Constructor TDACModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DACModule');
Value:=TComponentTimestampedDoubleArrayValue.Create(Self,1,'Value');
end;


{TVideoRecorderModuleConfiguration}
Constructor TVideoRecorderModuleConfiguration.Create(const BA: TByteArray);
begin
Inherited Create();
Name:='My Configuration';
flEnabled:=true;
Measurement_MaxDuration:=1.0; //. hours
Measurement_LifeTime:=2.0; //. days
Measurement_AutosaveInterval:=1000.0; //. days
Camera_Audio_SampleRate:=-1;
Camera_Audio_BitRate:=-1;
Camera_Video_ResX:=640;
Camera_Video_ResY:=480;
Camera_Video_FrameRate:=10;
Camera_Video_BitRate:=-1;
//.
FromByteArray(BA);
end;

procedure TVideoRecorderModuleConfiguration.FromByteArray(const BA: TByteArray);
var
  MS: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node,MeasurementNode,CameraNode,AudioNode,VideoNode: IXMLDOMNode;
begin
if (Length(BA) = 0) then Exit; //. ->
MS:=TMemoryStream.Create();
try
MS.Write(Pointer(@BA[0])^,Length(BA));
MS.Position:=0;
DecimalSeparator:='.';
OLEStream:=TStreamAdapter.Create(MS);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 1) then Raise Exception.Create('unknown version'); //. =>
//.
Node:=RootNode.selectSingleNode('flVideoRecorderModuleIsEnabled');
flEnabled:=(Node.nodeTypedValue <> 0);
//.
Node:=RootNode.selectSingleNode('Name');
Name:=Node.nodeTypedValue;
//.
MeasurementNode:=RootNode.selectSingleNode('Measurement');
  Node:=MeasurementNode.selectSingleNode('MaxDuration');
  Measurement_MaxDuration:=Node.nodeTypedValue;
  //.
  Node:=MeasurementNode.selectSingleNode('LifeTime');
  Measurement_LifeTime:=Node.nodeTypedValue;
  //.
  Node:=MeasurementNode.selectSingleNode('AutosaveInterval');
  Measurement_AutosaveInterval:=Node.nodeTypedValue;
//.
CameraNode:=RootNode.selectSingleNode('Camera');
  AudioNode:=CameraNode.selectSingleNode('Audio');
    Node:=AudioNode.selectSingleNode('SampleRate');
    Camera_Audio_SampleRate:=Node.nodeTypedValue;
    //.
    Node:=AudioNode.selectSingleNode('ABitRate');
    Camera_Audio_BitRate:=Node.nodeTypedValue;
  VideoNode:=CameraNode.selectSingleNode('Video');
    Node:=VideoNode.selectSingleNode('ResX');
    Camera_Video_ResX:=Node.nodeTypedValue;
    //.
    Node:=VideoNode.selectSingleNode('ResY');
    Camera_Video_ResY:=Node.nodeTypedValue;
    //.
    Node:=VideoNode.selectSingleNode('FrameRate');
    Camera_Video_FrameRate:=Node.nodeTypedValue;
    //.
    Node:=VideoNode.selectSingleNode('VBitRate');
    Camera_Video_BitRate:=Node.nodeTypedValue;
finally
MS.Destroy();
end;
end;

function TVideoRecorderModuleConfiguration.ToByteArray(): TByteArray;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  Node,MeasurementNode,CameraNode,AudioNode,VideoNode: IXMLDOMElement;
  OLEStream: IStream;
  MS: TMemoryStream;
begin
DecimalSeparator:='.';
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=1;
Root.appendChild(VersionNode);
//.
Node:=Doc.createElement('flVideoRecorderModuleIsEnabled');
if (flEnabled) then Node.nodeTypedValue:=1 else Node.nodeTypedValue:=0; 
Root.appendChild(Node);
//.
Node:=Doc.createElement('Name');
Node.nodeTypedValue:=Name;
Root.appendChild(Node);
//.
MeasurementNode:=Doc.createElement('Measurement');
  Node:=Doc.createElement('MaxDuration');
  Node.nodeTypedValue:=Measurement_MaxDuration;
  MeasurementNode.appendChild(Node);
  //.
  Node:=Doc.createElement('LifeTime');
  Node.nodeTypedValue:=Measurement_LifeTime;
  MeasurementNode.appendChild(Node);
  //.
  Node:=Doc.createElement('AutosaveInterval');
  Node.nodeTypedValue:=Measurement_AutosaveInterval;
  MeasurementNode.appendChild(Node);
Root.appendChild(MeasurementNode);
//.
CameraNode:=Doc.createElement('Camera');
  AudioNode:=Doc.createElement('Audio');
    Node:=Doc.createElement('SampleRate');
    Node.nodeTypedValue:=Camera_Audio_SampleRate;
    AudioNode.appendChild(Node);
    //.
    Node:=Doc.createElement('ABitRate');
    Node.nodeTypedValue:=Camera_Audio_BitRate;
    AudioNode.appendChild(Node);
  CameraNode.appendChild(AudioNode);
  VideoNode:=Doc.createElement('Video');
    Node:=Doc.createElement('ResX');
    Node.nodeTypedValue:=Camera_Video_ResX;
    VideoNode.appendChild(Node);
    //.
    Node:=Doc.createElement('ResY');
    Node.nodeTypedValue:=Camera_Video_ResY;
    VideoNode.appendChild(Node);
    //.
    Node:=Doc.createElement('FrameRate');
    Node.nodeTypedValue:=Camera_Video_FrameRate;
    VideoNode.appendChild(Node);
    //.
    Node:=Doc.createElement('VBitRate');
    Node.nodeTypedValue:=Camera_Video_BitRate;
    VideoNode.appendChild(Node);
  CameraNode.appendChild(VideoNode);
Root.appendChild(CameraNode);
//.
MS:=TMemoryStream.Create();
try
OLEStream:=TStreamAdapter.Create(MS);
Doc.Save(OLEStream);
SetLength(Result,MS.Size);
if (MS.Size > 0)
 then begin
  MS.Position:=0;
  MS.Read(Pointer(@Result[0])^,Length(Result));
  end;
finally
MS.Destroy();
end;
end;


{TVideoRecorderModuleConfigurationDataValue}
Constructor TVideoRecorderModuleConfigurationDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConfigurationData');
flVirtualValue:=true;
end;

function TVideoRecorderModuleConfigurationDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Video-recorder Configuration, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TVideoRecorderMeasurementsListValue}
Constructor TVideoRecorderMeasurementsListValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MeasurementsList');
flVirtualValue:=true;
end;

function TVideoRecorderMeasurementsListValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Video-recorder measurements list';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TVideoRecorderMeasurementDataValue}
Constructor TVideoRecorderMeasurementDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MeasurementData');
flVirtualValue:=true;
end;

function TVideoRecorderMeasurementDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Video-recorder measurement, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TVideoRecorderModule}
Constructor TVideoRecorderModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'VideoRecorderModule');
Mode:=TComponentTimestampedUInt16Value.Create(Self,1,'Mode');
Active:=TComponentTimestampedBooleanValue.Create(Self,2,'Active');
Recording:=TComponentTimestampedBooleanValue.Create(Self,3,'Recording');
Audio:=TComponentTimestampedBooleanValue.Create(Self,4,'Audio');
Video:=TComponentTimestampedBooleanValue.Create(Self,5,'Video');
Transmitting:=TComponentTimestampedBooleanValue.Create(Self,6,'Transmitting');
Saving:=TComponentTimestampedBooleanValue.Create(Self,7,'Saving');
SDP:=TComponentTimestampedANSIStringValue.Create(Self,8,'SDP');
Receivers:=TComponentTimestampedANSIStringValue.Create(Self,9,'Re4ceivers');
SavingServer:=TComponentTimestampedANSIStringValue.Create(Self,10,'SavingServer');
//. referencing items
ConfigurationDataValue:=TVideoRecorderModuleConfigurationDataValue.Create(Self,1001);
MeasurementsListValue:=TVideoRecorderMeasurementsListValue.Create(Self,1100);
MeasurementDataValue:=TVideoRecorderMeasurementDataValue.Create(Self,1101);
end;


{TFileSystemDataValue}
Constructor TFileSystemDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'FileSystemData');
flVirtualValue:=true;
end;

function TFileSystemDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'File system data, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TFileSystemModule}
Constructor TFileSystemModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'FileSystemModule');
//. referencing items
FileSystemDataValue:=TFileSystemDataValue.Create(Self,1000);
end;


{TControlDataValue}
Constructor TControlDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ControlData');
flVirtualValue:=true;
end;

function TControlDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Control data, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TControlModule}
Constructor TControlModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ControlModule');
//. referencing items
ControlDataValue:=TControlDataValue.Create(Self,1000);
end;


{TDeviceConfigurationValue}
Constructor TDeviceConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.idGeographServerObject:=0;
Value.CheckpointInterval:=0;
Value.GeoDistanceThreshold:=0;
flVirtualValue:=true;
DeviceComponent:=TGeoMonitoredObject1DeviceComponent(Owner);
end;

procedure TDeviceConfigurationValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TDeviceConfigurationData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.ConnectorModule.CheckPointInterval.Value:=Value.CheckpointInterval;
DeviceComponent.GPSModule.DistanceThreshold.Value:=Value.GeoDistanceThreshold;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TDeviceConfigurationValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TDeviceConfigurationData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceConfigurationValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.ConnectorModule.CheckPointInterval.FromXMLNode(ValueNode);
SubNode:=ValueNode.SelectSingleNode('GeoDistanceThreshold');
DeviceComponent.GPSModule.DistanceThreshold.Value:=SubNode.nodeTypedValue;
Value.CheckpointInterval:=DeviceComponent.ConnectorModule.CheckPointInterval.Value;
Value.GeoDistanceThreshold:=DeviceComponent.GPSModule.DistanceThreshold.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceConfigurationValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TDeviceConfigurationValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='CheckpointInterval: '+IntToStr(Value.CheckpointInterval)+' sec'+#$0D#$0A+'GeoDistanceThreshold: '+IntToStr(Value.GeoDistanceThreshold)+' m';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TDeviceCheckpointValue1}
Constructor TDeviceCheckpointValue1.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'CheckpointValue1');
FillChar(Value,SizeOf(Value),0);
flVirtualValue:=true;
DeviceComponent:=TGeoMonitoredObject1DeviceComponent(Owner);
end;

procedure TDeviceCheckpointValue1.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TDeviceCheckpointData1(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.ConnectorModule.CheckPointInterval.Value:=Value.CheckpointInterval;
DeviceComponent.GPSModule.GPSFixData.Value:=Value.GPSFixData;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TDeviceCheckpointValue1.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TDeviceCheckpointData1(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceCheckpointValue1.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.ConnectorModule.CheckPointInterval.FromXMLNode(ValueNode);
DeviceComponent.GPSModule.GPSFixData.FromXMLNode(ValueNode);
Value.CheckpointInterval:=DeviceComponent.ConnectorModule.CheckPointInterval.Value;
Value.GPSFixData:=DeviceComponent.GPSModule.GPSFixData.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceCheckpointValue1.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TDeviceCheckpointValue1.ToTrackNode(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Latitude:=Value.GPSFixData.Latitude;
Longitude:=Value.GPSFixData.Longitude;
Altitude:=Value.GPSFixData.Altitude;
Speed:=Value.GPSFixData.Speed;
Bearing:=Value.GPSFixData.Bearing;
Precision:=Value.GPSFixData.Precision;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;                              
end;
end;

function TDeviceCheckpointValue1.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='CheckpointInterval: '+IntToStr(Value.CheckpointInterval)+' sec'+#$0D#$0A+
           'Timestamp: '+FormatFloat('0.00000',Value.GPSFixData.Timestamp)+#$0D#$0A+
           'Latitude: '+FormatFloat('0.00000',Value.GPSFixData.Latitude)+#$0D#$0A+
           'Longitude: '+FormatFloat('0.00000',Value.GPSFixData.Longitude)+#$0D#$0A+
           'Altitude: '+FormatFloat('0.00000',Value.GPSFixData.Altitude)+#$0D#$0A+
           'Speed: '+FormatFloat('0.00000',Value.GPSFixData.Speed)+#$0D#$0A+
           'Bearing: '+FormatFloat('0.00000',Value.GPSFixData.Bearing)+#$0D#$0A+
           'Precision: '+FormatFloat('0.00000',Value.GPSFixData.Precision);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TGPIValueFixValue}
Constructor TGPIValueFixValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPIValueFix');
FillChar(Value,SizeOf(Value),0);
flVirtualValue:=true;
DeviceComponent:=TGeoMonitoredObject1DeviceComponent(Owner);
end;

procedure TGPIValueFixValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TGPIValueFixData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.GPIModule.Value.Value:=Value.GPIValue;
DeviceComponent.GPSModule.GPSFixData.Value:=Value.GPSFixData;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPIValueFixValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TGPIValueFixData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPIValueFixValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.GPIModule.Value.FromXMLNode(ValueNode);
DeviceComponent.GPSModule.GPSFixData.FromXMLNode(ValueNode);
Value.GPIValue:=DeviceComponent.GPIModule.Value.Value;
Value.GPSFixData:=DeviceComponent.GPSModule.GPSFixData.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPIValueFixValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TGPIValueFixValue.ToTrackNode(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Latitude:=Value.GPSFixData.Latitude;
Longitude:=Value.GPSFixData.Longitude;
Altitude:=Value.GPSFixData.Altitude;
Speed:=Value.GPSFixData.Speed;
Bearing:=Value.GPSFixData.Bearing;
Precision:=Value.GPSFixData.Precision;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPIValueFixValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='GPIValue: '+IntToStr(Value.GPIValue.Value)+#$0D#$0A+
           'Timestamp: '+FormatFloat('0.00000',Value.GPIValue.Timestamp)+#$0D#$0A+
           'Latitude: '+FormatFloat('0.00000',Value.GPSFixData.Latitude)+#$0D#$0A+
           'Longitude: '+FormatFloat('0.00000',Value.GPSFixData.Longitude)+#$0D#$0A+
           'Altitude: '+FormatFloat('0.00000',Value.GPSFixData.Altitude)+#$0D#$0A+
           'Speed: '+FormatFloat('0.00000',Value.GPSFixData.Speed)+#$0D#$0A+
           'Bearing: '+FormatFloat('0.00000',Value.GPSFixData.Bearing)+#$0D#$0A+
           'Precision: '+FormatFloat('0.00000',Value.GPSFixData.Precision);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TGeoMonitoredObject1DeviceComponent}
Constructor TGeoMonitoredObject1DeviceComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,2,'GeoMonitoredObject1DeviceComponent');
//. items
//. components
DeviceDescriptor        :=TDeviceDescriptor.Create              (Self,1);
BatteryModule           :=TBatteryModule.Create                 (Self,2);
ConnectorModule         :=TConnectorModule.Create              (Self,3);
GPSModule               :=TGPSModule.Create                     (Self,4);
GPIModule               :=TGPIModule.Create                     (Self,5);
GPOModule               :=TGPOModule.Create                     (Self,6);
ADCModule               :=TADCModule.Create                     (Self,7);
DACModule               :=TDACModule.Create                     (Self,8);
VideoRecorderModule     :=TVideoRecorderModule.Create           (Self,9);
FileSystemModule        :=TFileSystemModule.Create              (Self,10);
ControlModule           :=TControlModule.Create                 (Self,11);
//. referencing items
Configuration           :=TDeviceConfigurationValue.Create      (Self,1000);
Checkpoint1             :=TDeviceCheckpointValue1.Create        (Self,1100);
GPIValueFixValue        :=TGPIValueFixValue.Create              (Self,1200);
end;

                                                       
{TGeoMonitoredObject1DeviceSchema}
Constructor TGeoMonitoredObject1DeviceSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='DeviceSchema';
RootComponent:=TGeoMonitoredObject1DeviceComponent.Create(Self);
end;


//. summary object model

{TGeoMonitoredObject1Model}
class function TGeoMonitoredObject1Model.ID: integer;
begin
Result:=GeoMonitoredObject1ModelID;
end;

class function TGeoMonitoredObject1Model.Name: string;
begin
Result:='Model2';
end;

Constructor TGeoMonitoredObject1Model.Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
begin
Inherited Create(pObjectController,flFreeController);
flComponentUserAccessControl:=true;
ObjectSchema:=TGeoMonitoredObject1Schema.Create(Self);
ObjectDeviceSchema:=TGeoMonitoredObject1DeviceSchema.Create(Self);
end;

function TGeoMonitoredObject1Model.GetControlPanel(): TObjectModelControlPanel;
begin
if (ControlPanel = nil)
 then ControlPanel:=TGeoMonitoredObject1ControlPanel.Create(Self);
Result:=ControlPanel;
end;

function TGeoMonitoredObject1Model.IsObjectOnline: boolean;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.IsOnline.BoolValue.Value;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObject1Model.ObjectVisualization: TObjectDescriptor;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObject1Component(ObjectSchema.RootComponent).Visualization.Descriptor.Value;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObject1Model.ObjectGeoSpaceID: integer;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObject1Component(ObjectSchema.RootComponent).GeoSpaceID.Value;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObject1Model.ObjectDatumID: integer;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
finally
Lock.Leave;
end;
end;

procedure TGeoMonitoredObject1Model.Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
begin
Lock.Enter;
try
DatumID:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
//.
TimeStamp:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.TimeStamp;
Latitude:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Latitude;
Longitude:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Longitude;
Altitude:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Altitude;
Speed:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Speed;
Bearing:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Bearing;
Precision:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Precision;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObject1Model.DeviceConnectorServiceProviderNumber: double;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ServiceProvider.Number.Value;
finally
Lock.Leave;
end;
end;

procedure TGeoMonitoredObject1Model.GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
Type
  TGeoDataItem = packed record //. from Reflector\unitXYToGeoCrdConvertor.pas
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
  end;

  //. operation's log parsing routine
  function ProcessOperationsLogItemForTrackItem(const OperationsLogItem: IXMLDOMNode; out GeoDataItem: TGeoDataItem): boolean;
  var
    SIDStr: string;
    Node,GPSFixDataNode: IXMLDOMNode;
  begin
  Result:=false;
  SIDStr:=OperationsLogItem.nodeName;
  //. check for operation
  if (SIDStr <> 'SET') then Exit; //. ->
  //.
  Node:=OperationsLogItem.selectSingleNode('Component');
  if (Node = nil) then Exit; //. ->                               
  if (Node.nodeTypedValue = '2.1100'{Checkpoint1 address})
   then begin
    GPSFixDataNode:=OperationsLogItem.selectSingleNode('CheckpointValue1/GPSFixData');
    Node:=GPSFixDataNode.selectSingleNode('TimeStamp');
    GeoDataItem.TimeStamp:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Latitude');
    GeoDataItem.Latitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Longitude');
    GeoDataItem.Longitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Altitude');
    GeoDataItem.Altitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Speed');
    GeoDataItem.Speed:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Bearing');
    GeoDataItem.Bearing:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Precision');
    GeoDataItem.Precision:=TDateTime(Node.nodeTypedValue);
    //.
    Result:=true;
    end;
  end;

var
  LogDataStream: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  OperationsLogNode: IXMLDOMNode;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  GeoDataItem: TGeoDataItem;
begin
GeoDataStream:=nil;
ObjectController.ObjectOperation_GetDayLogData(DayDate, 0{XML format}, LogDataStream);
try
LogDataStream.Position:=0;
OLEStream:=TStreamAdapter.Create(LogDataStream);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if VersionNode <> nil
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Raise Exception.Create('unknown day log version'); //. =>
OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
GeoDataStream:=TMemoryStream.Create();
try
for I:=0 to OperationsLogNode.childNodes.length-1 do begin
  OperationsLogItemNode:=OperationsLogNode.childNodes[I];
  if (ProcessOperationsLogItemForTrackItem(OperationsLogItemNode, GeoDataItem))
   then GeoDataStream.Write(GeoDataItem,SizeOf(GeoDataItem));
  end;
except
  FreeAndNil(GeoDataStream);
  Raise; //. =>
  end;
finally
LogDataStream.Destroy;
end;
end;

function TGeoMonitoredObject1Model.ConnectorModule_GetConfiguration(): TByteArray;
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ConfigurationDataValue.ReadDeviceCUAC();
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ConfigurationDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.ConnectorModule_SetConfiguration(const ConfigurationData: TByteArray);
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ConfigurationDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ConfigurationDataValue.Value.Value:=ConfigurationData;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ConnectorModule.ConfigurationDataValue.WriteDeviceCUAC();
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.GPSModule_GetConfiguration(): TByteArray;
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.ConfigurationDataValue.ReadDeviceCUAC();
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.ConfigurationDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.GPSModule_SetConfiguration(const ConfigurationData: TByteArray);
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.ConfigurationDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.ConfigurationDataValue.Value.Value:=ConfigurationData;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.ConfigurationDataValue.WriteDeviceCUAC();
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.VideoRecorder_GetConfiguration(): TByteArray;
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.ConfigurationDataValue.ReadDeviceCUAC();
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.ConfigurationDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.VideoRecorder_SetConfiguration(const ConfigurationData: TByteArray);
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.ConfigurationDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.ConfigurationDataValue.Value.Value:=ConfigurationData;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.ConfigurationDataValue.WriteDeviceCUAC();
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.VideoRecorder_Measurements_GetList(): string;
begin
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementsListValue.ReadDeviceCUAC();
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementsListValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.VideoRecorder_Measurements_Delete(const MeasurementIDs: string);
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='1,'+MeasurementIDs; //. delete command
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
//.
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Value:=nil;
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.WriteDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is locked'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.VideoRecorder_Measurements_MoveToDataServer(const MeasurementIDs: string);
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='2,'+MeasurementIDs; //. move command
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
//.
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Value:=nil;
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.WriteDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is locked'); //. =>
    -1000003: Raise Exception.Create('data server saver is disabled'); //. =>
    -1000004: Raise Exception.Create('data server saver is busy'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.VideoRecorder_Measurement_GetData(const MeasurementID: string; const Flags: integer = 0): TByteArray;
var
  FS: string;
  Params: String;
  AddressData: TByteArray;
begin
FS:=IntToStr(Flags);
Params:='1,'+MeasurementID+','+FS; //. get measurement data command
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
//.
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.VideoRecorder_Measurement_GetDataFragment(const MeasurementID: string; const StartTimestamp: double; const FinishTimestamp: double; const Flags: integer = 0): TByteArray;
var
  FS: string;
  Params: String;
  AddressData: TByteArray;
begin
FS:=IntToStr(Flags);
Params:='1,'+MeasurementID+','+FS+','+FloatToStr(StartTimestamp)+','+FloatToStr(FinishTimestamp);//. get measurement data fragment command
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
//.
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).VideoRecorderModule.MeasurementDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.FileSystem_GetDirList(const Dir: string): string;
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:='1,'+Dir;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.ReadDeviceByAddressDataCUAC(AddressData);
BA:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value;
finally
Lock.Leave();
end;
SetLength(Result,Length(BA));
Move(Pointer(@BA[0])^,Pointer(@Result[1])^,Length(BA));
end;

function TGeoMonitoredObject1Model.FileSystem_GetFileData(const FileFullName: string): TByteArray;
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='2,'+FileFullName;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.FileSystem_CreateDir(const NewDir: string);
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='1,'+NewDir;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value:=nil;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.WriteDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.FileSystem_SetFileData(const FileFullName: string; const FileData: TByteArray);
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='2,'+FileFullName;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value:=FileData;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.WriteDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.FileSystem_DeleteFile(const FileFullName: string);
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:='3,'+FileFullName;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value:=nil;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.WriteDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.FileSystem_StartFTPFileTransfer(const ServerAddress: string; const UserName: string; const UserPassword: string; const BaseDirectory: string; const FileFullName: string): string;
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:='11,'+ServerAddress+','+UserName+','+UserPassword+','+BaseDirectory+','+FileFullName;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    -1000101: Raise Exception.Create('FTP transfer is busy'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
BA:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value;
finally
Lock.Leave();
end;
SetLength(Result,Length(BA));
Move(Pointer(@BA[0])^,Pointer(@Result[1])^,Length(BA));
end;

procedure TGeoMonitoredObject1Model.FileSystem_CancelFTPFileTransfer(const TransferID: string);
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='13,'+TransferID;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.ReadDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.FileSystem_GetFTPFileTransferState(const TransferID: string; out Code: integer; out Message: string);
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:='12,'+TransferID;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.ReadDeviceByAddressDataCUAC(AddressData);
BA:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).FileSystemModule.FileSystemDataValue.Value.Value;
finally
Lock.Leave();
end;
Code:=Integer(Pointer(@BA[0])^);
SetLength(Message,Length(BA)-SizeOf(Code));
Move(Pointer(@BA[4])^,Pointer(@Message[1])^,Length(Message));
end;

function TGeoMonitoredObject1Model.ControlModule_GetDeviceStateInfo(): string;
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:='2';
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
BA:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Value;
SetLength(Result,Length(BA));
Move(Pointer(@BA[0])^,Pointer(@Result[1])^,Length(Result));
finally
Lock.Leave();
end;
end;

function TGeoMonitoredObject1Model.ControlModule_GetDeviceLogData(): TByteArray;
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='3';
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.ReadDeviceByAddressDataCUAC(AddressData);
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('data is not found'); //. =>
    -1000002: Raise Exception.Create('data is too big'); //. =>
    else
      Raise; //. +>
    end;
  else
    Raise; //. =>
  end;
Result:=TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Value;
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.ControlModule_RestartDevice();
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='1';
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Value:=nil;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.WriteDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;

procedure TGeoMonitoredObject1Model.ControlModule_RestartDeviceProcess();
var
  Params: String;
  AddressData: TByteArray;
begin
Params:='0';
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Timestamp:=Now-TimeZoneDelta;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.Value.Value:=nil;
TGeoMonitoredObject1DeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlDataValue.WriteDeviceByAddressDataCUAC(AddressData);
finally
Lock.Leave();
end;
end;


end.
