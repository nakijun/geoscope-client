unit unitGeoPositionReceiver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, SyncObjs, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Menus, GlobalSpaceDefines, unitProxySpace, unitReflector, Functionality, unitXYToGeoCrdConvertor;

const
  ConfigurationFileName = 'GeoPositionReceiverConfiguration.xml';
type
  TPositioningSystem = (psUnknown,psGPS,psGLONASS);

  TOnPositionReceivedProc = procedure (const DatumID: integer; const Latitude,Longitude,Altitude: double) of object;

  TPSProcessor = class;

  TfmGeoPositionReceiver = class(TForm)
    gbReceiverPort: TGroupBox;
    cbReceiverPort: TComboBox;
    gbReceiverProtocol: TGroupBox;
    rbGPS: TRadioButton;
    rbGLONASS: TRadioButton;
    pnlDATAProcessors: TPanel;
    pnlGPSProcessor: TPanel;
    Panel1: TPanel;
    bPSProcessorStartStop: TBitBtn;
    Label1: TLabel;
    edGPSProcessorLatitude: TEdit;
    Label2: TLabel;
    edGPSProcessorLongitude: TEdit;
    Label3: TLabel;
    edGPSProcessorSpeed: TEdit;
    Label4: TLabel;
    edGPSProcessorBearing: TEdit;
    Label5: TLabel;
    edGPSProcessorTime: TEdit;
    memoGPSProcessorSatelliteInfo: TMemo;
    Label6: TLabel;
    cbShowAtReflectorCenter: TCheckBox;
    Updater: TTimer;
    lbGPSProcessorState: TLabel;
    lbGPSProcessorStatus: TLabel;
    Label7: TLabel;
    edGPSProcessorPrecision: TEdit;
    pnlGLONASSProcessor: TPanel;
    Label8: TLabel;
    stObjectVisualization_Popup: TPopupMenu;
    Setbyclipboardcomponent1: TMenuItem;
    Clear1: TMenuItem;
    stObjectVisualization: TStaticText;
    Label9: TLabel;
    edUpdateTimeInterval: TEdit;
    procedure rbGPSClick(Sender: TObject);
    procedure rbGLONASSClick(Sender: TObject);
    procedure bPSProcessorStartStopClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure Setbyclipboardcomponent1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure edUpdateTimeIntervalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fmXYToGeoCrdConvertor: TfmXYToGeoCrdConvertor;
    PositioningSystem: TPositioningSystem;
    PSProcessor: TPSProcessor;
    flProcessing: boolean;
    flLastFixPositionIsExists: boolean;
    UpdateTimeInterval: integer;
    LastFixTimeStamp: TDateTime;
    LastFix_Latitude: double;
    LastFix_Longitude: double;
    LastFix_Altitude: double;
    LastFix_X: double;
    LastFix_Y: double;
    ObjectVisualization_idTObj: integer;
    ObjectVisualization_idObj: integer;
    ObjectVisualization_X0: double;
    ObjectVisualization_Y0: double;
    ObjectVisualization_X1: double;
    ObjectVisualization_Y1: double;

    procedure DoOnPositionReceived(const DatumID: integer; const Latitude,Longitude,Altitude: double);
    procedure UpdateObjectVisualizationData;
    procedure LoadConfiguration;
    procedure SaveConfiguration;
  public
    { Public declarations }
    Constructor Create(const pfmXYToGeoCrdConvertor: TfmXYToGeoCrdConvertor);
    Destructor Destroy(); override;
  end;

  TPSProcessor = class(TThread)
  public
    Lock: TCriticalSection;
    PortName: string;
    ErrorMessage: string;
    flFixIsObtained: boolean;
    Latitude: double;
    Longitude: double;
    Altitute: double;
    OnPositionReceived: TOnPositionReceivedProc;

    Constructor Create(const pPortName: string);
    Destructor Destroy; override;
  end;

  TGPSProcessor = class(TPSProcessor)
  public
    Bearing: double;
    Speed: double;
    Time: TDateTime;
    HDOP: double;
    PDOP: double;
    VDOP: double;
    SatellitesInfo: string;

    procedure Execute; override;
    function ParseSentence(const Sentence: string): boolean;
  end;

const
  PositioningSystemDatums: array[TPositioningSystem] of integer = (0,23{WGS-84},15{SK-42}); //. values form GeoTransformation.pas

implementation
uses
  Registry,
  StrUtils,
  Math,
  MSXML;

{$R *.dfm}

{TfmGeoPositionReceiver}
Constructor TfmGeoPositionReceiver.Create(const pfmXYToGeoCrdConvertor: TfmXYToGeoCrdConvertor);
var
  Reg: TRegistry;
  I: integer;
begin
Inherited Create(nil);
fmXYToGeoCrdConvertor:=pfmXYToGeoCrdConvertor;
//. prepare receiver com ports checkbox
cbReceiverPort.Items.BeginUpdate;
try
cbReceiverPort.Items.Clear;
reg:=TRegistry.Create;
try
reg.Access:=KEY_READ;
reg.RootKey:=HKEY_LOCAL_MACHINE;
if (reg.OpenKey('Hardware\DeviceMap\SerialComm',False))
 then
  try
  reg.GetValueNames(cbReceiverPort.Items);
  for I:=0 to cbReceiverPort.Items.Count-1 do cbReceiverPort.Items[I]:=reg.ReadString(cbReceiverPort.Items[I]);
  finally
  reg.CloseKey;
  end;
finally
reg.Destroy;
end;
finally
cbReceiverPort.Items.EndUpdate;
end;
//.
PositioningSystem:=psUnknown;
//.
flLastFixPositionIsExists:=false;
PSProcessor:=nil;
flProcessing:=false;
UpdateTimeInterval:=5;
ObjectVisualization_idObj:=0;
//.
edUpdateTimeInterval.Text:=IntToStr(UpdateTimeInterval);
//.
LoadConfiguration();
end;

Destructor TfmGeoPositionReceiver.Destroy();
begin
PSProcessor.Free;
//.
SaveConfiguration();
Inherited;
end;

procedure TfmGeoPositionReceiver.LoadConfiguration;
var
  FileName: string;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
  PortName: string;
  I: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
FileName:='Reflector'+'\'+IntToStr(fmXYToGeoCrdConvertor.Reflector.id)+'\'+ConfigurationFileName;
with TProxySpaceUserProfile.Create(fmXYToGeoCrdConvertor.Reflector.Space) do
try
if (FileExists(ProfileFolder+'\'+FileName))
 then begin
  SetProfileFile(FileName);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProfileFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/PortName');
  PortName:=Node.nodeTypedValue;
  for I:=0 to cbReceiverPort.Items.Count-1 do
    if (cbReceiverPort.Items[I] = PortName)
     then begin
      cbReceiverPort.ItemIndex:=I;
      Break; //. ->
      end;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/PositioningSystem');
  PositioningSystem:=Node.nodeTypedValue;
  case PositioningSystem of
  psGPS: rbGPS.Checked:=true;
  psGLONASS: rbGLONASS.Checked:=true;
  end;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/ObjectVisualization/idTVisualization');
  ObjectVisualization_idTObj:=Node.nodeTypedValue;
  Node:=Doc.documentElement.selectSingleNode('/ROOT/ObjectVisualization/idVisualization');
  ObjectVisualization_idObj:=Node.nodeTypedValue;
  if (ObjectVisualization_idObj <> 0)
   then
    try
    VF:=TComponentFunctionality_Create(ObjectVisualization_idTObj,ObjectVisualization_idObj);
    try
    if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
    //.
    if (VF.GetOwner(idTOwner,idOwner))
     then with TComponentFunctionality_Create(idTOwner,idOwner) do
      try
      _Name:=Name;
      finally
      Release;
      end
     else _Name:=VF.Name;
    //.
    UpdateObjectVisualizationData();
    //.
    stObjectVisualization.Caption:=_Name;
    finally
    VF.Release;
    end;
    except
      ObjectVisualization_idObj:=0;
      stObjectVisualization.Caption:='none';
      end
   else begin
    stObjectVisualization.Caption:='none';
    end;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/ShowPosition');
  cbShowAtReflectorCenter.Checked:=Node.nodeTypedValue;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/UpdateTimeInterval');
  UpdateTimeInterval:=Node.nodeTypedValue;
  edUpdateTimeInterval.Text:=IntToStr(UpdateTimeInterval);
  end;
finally
Destroy;
end;
end;

procedure TfmGeoPositionReceiver.SaveConfiguration;
var
  FileName: string;
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  Node,SubNode: IXMLDOMElement;
begin
FileName:='Reflector'+'\'+IntToStr(fmXYToGeoCrdConvertor.Reflector.id)+'\'+ConfigurationFileName;
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
Node:=Doc.createElement('PortName');
if (cbReceiverPort.ItemIndex <> -1)
 then Node.nodeTypedValue:=cbReceiverPort.Items[cbReceiverPort.ItemIndex]
 else Node.nodeTypedValue:='?';
Root.appendChild(Node);
//.
Node:=Doc.createElement('PositioningSystem');
Node.nodeTypedValue:=PositioningSystem;
Root.appendChild(Node);
//.
Node:=Doc.createElement('ObjectVisualization');
SubNode:=Doc.createElement('idTVisualization');
SubNode.nodeTypedValue:=ObjectVisualization_idTObj;
Node.appendChild(SubNode);
SubNode:=Doc.createElement('idVisualization');
SubNode.nodeTypedValue:=ObjectVisualization_idObj;
Node.appendChild(SubNode);
Root.appendChild(Node);
//.
Node:=Doc.createElement('ShowPosition');
Node.nodeTypedValue:=cbShowAtReflectorCenter.Checked;
Root.appendChild(Node);
//.
Node:=Doc.createElement('UpdateTimeInterval');
Node.nodeTypedValue:=UpdateTimeInterval;
Root.appendChild(Node);
//. save xml document
with TProxySpaceUserProfile.Create(fmXYToGeoCrdConvertor.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+FileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
end;

procedure TfmGeoPositionReceiver.rbGPSClick(Sender: TObject);
begin
PositioningSystem:=psGPS;
//.
pnlGLONASSProcessor.Hide;
//.
pnlGPSProcessor.Show;
end;

procedure TfmGeoPositionReceiver.rbGLONASSClick(Sender: TObject);
begin
PositioningSystem:=psGLONASS;
//.
pnlGPSProcessor.Hide;
//.
pnlGLONASSProcessor.Show;
end;

procedure TfmGeoPositionReceiver.bPSProcessorStartStopClick(Sender: TObject);
begin
if (NOT flProcessing)
 then begin
  if (cbReceiverPort.ItemIndex = -1) then Exit; //. ->
  case PositioningSystem of
  psGPS: begin
   PSProcessor:=TGPSProcessor.Create(cbReceiverPort.Items[cbReceiverPort.ItemIndex]);
   PSProcessor.OnPositionReceived:=DoOnPositionReceived;
   end;
  else
    Exit; //. ->
  end;
  gbReceiverPort.Enabled:=false;
  gbReceiverProtocol.Enabled:=false;
  bPSProcessorStartStop.Caption:='Stop';
  flProcessing:=true;
  end
 else begin
  FreeAndNil(PSProcessor);
  gbReceiverPort.Enabled:=true;
  gbReceiverProtocol.Enabled:=true;
  bPSProcessorStartStop.Caption:='Start';
  flProcessing:=false;
  end;
end;

procedure TfmGeoPositionReceiver.UpdaterTimer(Sender: TObject);
begin
if (NOT Visible) then Exit; //. ->
if (flProcessing)
 then
  case PositioningSystem of
  psGPS: with TGPSProcessor(PSProcessor) do begin
    Lock.Enter;
    try
    if (flFixIsObtained)
     then begin
      lbGPSProcessorState.Font.Color:=clGreen;
      lbGPSProcessorState.Caption:='Online';
      end
     else begin
      lbGPSProcessorState.Font.Color:=clRed;
      lbGPSProcessorState.Caption:='offline';
      end;
    if (ErrorMessage <> '')
     then begin
      lbGPSProcessorStatus.Font.Color:=clRed;
      lbGPSProcessorStatus.Caption:=ErrorMessage;
      lbGPSProcessorStatus.Hint:=ErrorMessage;
      end
     else begin
      lbGPSProcessorStatus.Font.Color:=clGreen;
      lbGPSProcessorStatus.Caption:='';
      lbGPSProcessorStatus.Hint:='';
      end;
    edGPSProcessorLatitude.Text:=FormatFloat('0.00000',Latitude);
    edGPSProcessorLongitude.Text:=FormatFloat('0.00000',Longitude);
    edGPSProcessorPrecision.Text:=FormatFloat('0.0',HDOP*6.0);
    edGPSProcessorSpeed.Text:=FormatFloat('0.00000',Speed);
    edGPSProcessorBearing.Text:=FormatFloat('0.00000',Bearing);
    edGPSProcessorTime.Text:=FormatDateTime('HH:NN:SS',Time);
    memoGPSProcessorSatelliteInfo.Text:=SatellitesInfo+#$0D#$0A+'HDOP: '+FormatFloat('0.0',HDOP)+#$0D#$0A+'PDOP: '+FormatFloat('0.0',PDOP)+#$0D#$0A+'VDOP: '+FormatFloat('0.0',VDOP);
    finally
    Lock.Leave;
    end;
    end;
  else
    Exit; //. ->
  end
 else
  case PositioningSystem of
  psGPS: begin
    if (cbReceiverPort.ItemIndex <> -1)
     then begin
      lbGPSProcessorState.Font.Color:=clRed;
      lbGPSProcessorState.Caption:='not started';
      lbGPSProcessorStatus.Font.Color:=clGreen;
      lbGPSProcessorStatus.Caption:='';
      lbGPSProcessorStatus.Hint:='';
      end;
    end;
  else
    Exit; //. ->
  end;
end;

procedure TfmGeoPositionReceiver.DoOnPositionReceived(const DatumID: integer; const Latitude,Longitude,Altitude: double);
var
  X,Y: Extended;
  X2,Y2: Extended;
  dX01,dY01,dX20,dY20: double;
  Alpha,Betta,Angle: double;
begin
if ((NOT flLastFixPositionIsExists) OR ((Now-LastFixTimeStamp) > (UpdateTimeInterval/(24.0*3600.0))))
 then begin //. set object visualization position and reflector center
  if (fmXYToGeoCrdConvertor.AbsoluteConvertGeoGrdToXY(DatumID,Latitude,Longitude,Altitude,  X,Y) AND ((X <> ObjectVisualization_X0) OR (Y <> ObjectVisualization_Y0)))
   then begin
    if (cbShowAtReflectorCenter.Checked) then fmXYToGeoCrdConvertor.Reflector.ShiftingSetReflection(X,Y);
    if (ObjectVisualization_idObj <> 0)
     then begin
      X2:=X;
      Y2:=Y;
      dX01:=ObjectVisualization_X0-ObjectVisualization_X1; dY01:=ObjectVisualization_Y0-ObjectVisualization_Y1;
      dX20:=X2-ObjectVisualization_X0; dY20:=Y2-ObjectVisualization_Y0;
      //.
      if (dX01 <> 0)
       then begin
        Alpha:=Arctan(dY01/dX01);
        if (dX01 < 0) then Alpha:=Alpha+PI;
        end
       else
        if (dY01 >= 0) then Alpha:= PI/2.0 else Alpha:=-PI/2;
      if (dX20 <> 0)
       then begin
        Betta:=Arctan(dY20/dX20);
        if (dX20 < 0) then Betta:=Betta+PI;
        end
       else
        if (dY20 >= 0) then Betta:=PI/2.0 else Betta:=-PI/2.0;
      Angle:=-(Alpha-Betta);
      //.
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualization_idTObj,ObjectVisualization_idObj)) do
      try
      Rotate(ObjectVisualization_X0,ObjectVisualization_Y0, Angle);
      SetPosition(X,Y,0);
      finally
      Release;
      end;
      //.
      ObjectVisualization_X1:=ObjectVisualization_X0; ObjectVisualization_Y1:=ObjectVisualization_Y0;
      ObjectVisualization_X0:=X2; ObjectVisualization_Y0:=Y2;
      end;
    end;
  //.
  LastFix_Latitude:=Latitude;
  LastFix_Longitude:=Longitude;
  LastFix_Altitude:=Altitude;
  LastFixTimeStamp:=Now;
  flLastFixPositionIsExists:=true;
  end;
end;

procedure TfmGeoPositionReceiver.UpdateObjectVisualizationData;
var
  BA: TByteArray;
  BAPtr: pointer;
  NodesCount: integer;
begin
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualization_idTObj,ObjectVisualization_idObj)) do
try
GetNodes(BA);
BAPtr:=Pointer(@BA[0]);
NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
if (NodesCount < 2) then Raise Exception.Create('TfmGeoPositionReceiver.UpdateObjectVisualizationData: visualization nodes number are less than 2'); //. =>
ObjectVisualization_X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(ObjectVisualization_X0));
ObjectVisualization_Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(ObjectVisualization_Y0));
ObjectVisualization_X1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(ObjectVisualization_X1));
ObjectVisualization_Y1:=Double(BAPtr^);
finally
Release;
end;
end;

procedure TfmGeoPositionReceiver.edUpdateTimeIntervalKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  UpdateTimeInterval:=StrToInt(edUpdateTimeInterval.Text);
  edUpdateTimeInterval.Font.Color:=clBlack;
  end
 else edUpdateTimeInterval.Font.Color:=clGreen;
end;


{TPSProcessor}
Constructor TPSProcessor.Create(const pPortName: string);
begin
Lock:=TCriticalSection.Create;
PortName:=pPortName;
ErrorMessage:='';
flFixIsObtained:=false;
Inherited Create(false);
end;

Destructor TPSProcessor.Destroy;
begin
Inherited;
Lock.Free;
end;


{TGPSProcessor}
procedure TGPSProcessor.Execute;
const
  ReadBufferSize = 256;
var
  hPort: THandle;
  DCB: TDCB;
  Timeouts: TCommTimeouts;
  LastStr: string;
  ReadBuffer: array [0..ReadBufferSize-1] of byte;
  BytesRead: dword;
  I: integer;
begin
try
hPort:=CreateFile(PChar('\\.\'+PortName), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
if (hPort = INVALID_HANDLE_VALUE) then Raise Exception.Create('could not open com port'); //. =>
try
if (NOT GetCommState(hPort, DCB)) then Raise Exception.Create('could not get comm state'); //. =>
DCB.BaudRate:=4800;
if (NOT SetCommState(hPort, DCB)) then Raise Exception.Create('could not set comm state'); //. =>
Timeouts.ReadIntervalTimeout:=0;
Timeouts.ReadTotalTimeoutMultiplier:=0;
Timeouts.ReadTotalTimeoutConstant:=3000;
Timeouts.WriteTotalTimeoutMultiplier:=0;
Timeouts.WriteTotalTimeoutConstant:=0;
if (NOT SetCommTimeouts(hPort,Timeouts)) then Raise Exception.Create('could not set comm timeouts'); //. =>
LastStr:='';
while (NOT Terminated) do begin
  if (ReadFile(hPort, ReadBuffer,Length(ReadBuffer),  BytesRead, nil) AND (BytesRead = Length(ReadBuffer)))
   then
    for I:=0 to Length(ReadBuffer)-1 do begin
      if (ReadBuffer[I] = $0D)
       then begin
        try
        ParseSentence(LastStr); //. parse line from receiver
        except
          On E: Exception do begin
            Lock.Enter;
            try
            ErrorMessage:='Parse error: '+E.Message;
            finally
            Lock.Leave;
            end;
            end;
          end;
        LastStr:='';
        end
       else
        if (NOT (ReadBuffer[I] IN [$0A]))
         then LastStr:=LastStr+Char(ReadBuffer[I]);
      end
   else begin
    Lock.Enter;
    try
    flFixIsObtained:=false;
    ErrorMessage:='Port reading timeout';
    finally
    Lock.Leave;
    end;
    LastStr:='';
    end;
  end;
finally
CloseHandle(hPort);
end;
except
  On E: Exception do begin
    Lock.Enter;
    try
    flFixIsObtained:=false;
    ErrorMessage:=E.Message;
    finally
    Lock.Leave;
    end;
    end;
  end;
end;

function TGPSProcessor.ParseSentence(const Sentence: string): boolean;
//*********************************************************************
//**  A high-precision NMEA interpreter
//**  Written by Jon Person, author of "GPS.NET" (www.gpsdotnet.com)
//**  Ported to the Delphi by Alexander Ponomarev (www.gisar.sf.net)
//*********************************************************************

  function Split(Str: string; const SubStr: string): TStringList;
  var
    S, Tmp: string;
    Slist: TStringList;
    I: Integer;
  begin
    Slist := TStringList.Create;
    S := Str;
    while (length(S) > 0) do
    begin
      I := ansipos(substr, S);
      if (I = 0) then
      begin
        Slist.Add(s);
        delete(S, 1, length(S));
      end
      else
      begin
        Tmp := S;
        delete(Tmp, I, length(Tmp));
        Slist.Add(Tmp);
        delete(S, 1, I + length(SubStr)-1);
      end;
    end;
    Result := Slist;
  end;

  function IsSentenceValid(const Sentence: string): boolean;
  var
    StoredCheckSum: string;
    CheckSum: integer;
    I: integer;
    RealCheckSum: string;
  begin
  StoredCheckSum:=AnsiRightStr(Sentence,Length(Sentence)-AnsiPos('*',Sentence));
  //.
  CheckSum:=0;
  for I:=1 to Length(Sentence) do
    if (Sentence[I] = '$')
     then
     else
      if (Sentence[I] = '*')
       then Break //. ->
       else
        if (Checksum = 0)
         then Checksum:=Ord(Sentence[I])
         else Checksum:=Checksum XOR Ord(Sentence[I]);
  RealCheckSum:=IntToHex(Checksum,2);
  //.
  Result:=(StoredCheckSum = RealCheckSum);
  end;

  function GetWords(const Sentence: string): TStringList;
  var
    S: string;
    I: integer;
  begin
  Result:=Split(Sentence,',');
  //. remove "*CRC" at the end of last word
  if (Result.Count > 0)
   then begin
    S:=Result[Result.Count-1];
    I:=AnsiPos('*',S);
    if (I > 0)
     then begin
      S:=AnsiLeftStr(S,I-1);
      Result[Result.Count-1]:=S
      end;
    end;
  end;

  function ParseGPRMC(const SentenceWords: TStringList): boolean;
  var
    _Lat,_Long,_Alt: double;
    _Precision: double;
    UtcHours: integer;
    UtcMinutes: integer;
    UtcSeconds: integer;
    UtcMilliseconds: integer;
  begin
  Result:=false;
  //. Do we have enough values to parse satellite-derived time?
  if ((SentenceWords.Count >= 1) AND (SentenceWords[1] <> ''))
   then begin
    //. Extract hours, minutes, seconds and milliseconds
    UtcHours:=StrToInt(AnsiMidStr(SentenceWords[1], 0,2));
    UtcMinutes:=StrToInt(AnsiMidStr(SentenceWords[1], 2,2));
    UtcSeconds:=StrToInt(AnsiMidStr(SentenceWords[1], 4,2));
    UtcMilliseconds:=0;
    //. Extract milliseconds if it is available
    if (Length(SentenceWords[1]) > 7) then UtcMilliseconds:=StrToInt(AnsiRightStr(SentenceWords[1],Length(SentenceWords[1])-7));
    Lock.Enter;
    try
    Time:=UtcHours/24.0+UtcMinutes/(24.0*60.0)+UtcSeconds/(24.0*60.0*60)+UtcMilliseconds/(24.0*60.0*60*1000);
    finally
    Lock.Leave;
    end;
    end;
  //. Does the device currently have a satellite fix?
  if ((SentenceWords.Count >= 2) AND (SentenceWords[2] <> ''))
   then
    if (SentenceWords[2] = 'A')
     then begin
      Lock.Enter;
      try
      flFixIsObtained:=true;
      finally
      Lock.Leave;
      end;
      end
     else
      if (SentenceWords[2] = 'V')
       then begin
        Lock.Enter;
        try
        flFixIsObtained:=false;
        finally
        Lock.Leave;
        end;
        end;
  //. Do we have enough values to describe our location?
  if ((SentenceWords.Count >= 6) AND ((SentenceWords[3] <> '') AND (SentenceWords[4] <> '') AND (SentenceWords[5] <> '') AND (SentenceWords[6] <> '')))
   then begin
    //. Extract latitude and longitude
    _Lat:=StrToFloat(AnsiLeftStr(SentenceWords[3],2));
    _Lat:=_Lat+(StrToFloat(AnsiRightStr(SentenceWords[3],Length(SentenceWords[3])-2))/60.0);
    if (SentenceWords[4] <> 'N') then _Lat:=-_Lat;
    _Long:=StrToFloat(AnsiLeftStr(SentenceWords[5],3));
    _Long:=_Long+(StrToFloat(AnsiRightStr(SentenceWords[5],Length(SentenceWords[5])-3))/60.0);
    if (SentenceWords[6] <> 'E') then _Long:=-_Long;
    //.
    Lock.Enter;
    try
    Latitude:=_Lat;
    Longitude:=_Long;
    finally
    Lock.Leave;
    end;
    //.
    if ((flFixIsObtained) AND (Assigned(OnPositionReceived)))
     then
      try
      OnPositionReceived(PositioningSystemDatums[psGPS],_Lat,_Long,0);
      except
        On E: Exception do begin
          Lock.Enter;
          try
          ErrorMessage:='error on set position: '+E.Message;
          finally
          Lock.Leave;
          end;
          end;
        end;
    end;
  //. Do we have enough information to extract the current speed?
  if ((SentenceWords.Count >= 7) AND (SentenceWords[7] <> ''))
   then begin
    //. Parse the speed and convert it to MPH
    Lock.Enter;
    try
    Speed:=StrToFloat(SentenceWords[7])*1.150779{MPHPerKnot};
    finally
    Lock.Leave;
    end;
    end;
  //. Do we have enough information to extract bearing?
  if ((SentenceWords.Count >= 8) AND (SentenceWords[8] <> ''))
   then begin
    // Indicate that the sentence was recognized
    Lock.Enter;
    try
    Bearing:=StrToFloat(SentenceWords[8]);
    finally
    Lock.Leave;
    end;
    end;
  Result:=true;
  end;

  function ParseGPGSV(const SentenceWords: TStringList): boolean;
  var
    PseudoRandomCode: integer;
    Azimuth: integer;
    Elevation: integer;
    SignalToNoiseRatio: integer;
    _SatellitesInfo: string;
    Count: integer;
  begin
  Result:=false;
  //. Divide the sentence into words
  _SatellitesInfo:='';
  //. Each sentence contains four blocks of satellite information.  Read each block
  //. and report each satellite's information
  Count:=0;
  for Count:=1 to 4 do begin
    //. Does the sentence have enough words to analyze?
    if ((SentenceWords.Count - 1) >= (Count * 4 + 3))
     then begin
      //. Proceed with analyzing the block.  Does it contain any information?
      if ((SentenceWords[Count * 4] <> '') AND (SentenceWords[Count * 4 + 1] <> '') AND (SentenceWords[Count * 4 + 2] <> '') AND (SentenceWords[Count * 4 + 3] <> ''))
       then begin
        //. Extract satellite information and report it
        PseudoRandomCode:=StrToInt(SentenceWords[Count * 4]);
        Elevation:=StrToInt(SentenceWords[Count * 4 + 1]);
        Azimuth:=StrToInt(SentenceWords[Count * 4 + 2]);
        SignalToNoiseRatio:=StrToInt(SentenceWords[Count * 4 + 3]);
        //. Set satellite's information
        _SatellitesInfo:=_SatellitesInfo+'  #'+IntToStr(PseudoRandomCode)+' - Azim: '+IntToStr(Azimuth)+', Elev: '+IntToStr(Elevation);
        if (SignalToNoiseRatio > 0) then _SatellitesInfo:=_SatellitesInfo+', Signal: '+IntToStr(SignalToNoiseRatio)+'%';
        _SatellitesInfo:=_SatellitesInfo+#$0D#$0A;
        end;
      end;
    end;
  Lock.Enter;
  try
  SatellitesInfo:=_SatellitesInfo;
  finally
  Lock.Leave;
  end;
  //. Indicate that the sentence was recognized
  Result:=true;
  end;

  function ParseGPGSA(const SentenceWords: TStringList): boolean;
  begin
  Result:=false;
  if ((SentenceWords.Count >= 15) AND (SentenceWords[15] <> ''))
   then begin
    Lock.Enter;
    try
    PDOP:=StrToFloat(SentenceWords[15]);
    finally
    Lock.Leave;
    end;
    end;
  if ((SentenceWords.Count >= 16) AND (SentenceWords[16] <> ''))
   then begin
    Lock.Enter;
    try
    HDOP:=StrToFloat(SentenceWords[16]);
    finally
    Lock.Leave;
    end;
    end;
  if ((SentenceWords.Count >= 17) AND (SentenceWords[17] <> ''))
   then begin
    Lock.Enter;
    try
    VDOP:=StrToFloat(SentenceWords[17]);
    finally
    Lock.Leave;
    end;
    end;
  Result:=true;
  end;

var
  SentenceWords: TStringList;
begin
Result:=false;
if (NOT IsSentenceValid(Sentence)) then Exit; //. ->
SentenceWords:=GetWords(Sentence);
try
if (SentenceWords[0] = '$GPRMC') then Result:=ParseGPRMC(SentenceWords) else
if (SentenceWords[0] = '$GPGSV') then Result:=ParseGPGSV(SentenceWords) else
if (SentenceWords[0] = '$GPGSA') then Result:=ParseGPGSA(SentenceWords) ;
finally
SentenceWords.Destroy;
end;
end;


procedure TfmGeoPositionReceiver.Setbyclipboardcomponent1Click(Sender: TObject);
var
  VisualizationType,VisualizationID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
if (flProcessing) then Exception.Create('could set the visualization during processing'); //. =>
if (NOT TypesSystem.ClipBoard_flExist) then Exit; //. ->
VisualizationType:=TypesSystem.Clipboard_Instance_idTObj;
VisualizationID:=TypesSystem.Clipboard_Instance_idObj;
VF:=TComponentFunctionality_Create(VisualizationType,VisualizationID);
try
if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
//.
if (VF.GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:=VF.Name;
//.
ObjectVisualization_idTObj:=VF.idTObj;
ObjectVisualization_idObj:=VF.idObj;
UpdateObjectVisualizationData();
//.
stObjectVisualization.Caption:=_Name;
finally
VF.Release;
end;
end;

procedure TfmGeoPositionReceiver.Clear1Click(Sender: TObject);
begin
if (flProcessing) then Exception.Create('could set the visualization during processing'); //. =>
ObjectVisualization_idObj:=0;
stObjectVisualization.Caption:='none';
end;

end.
