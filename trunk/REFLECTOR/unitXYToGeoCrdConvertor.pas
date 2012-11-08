unit unitXYToGeoCrdConvertor;

interface

uses
  Windows, SyncObjs, Messages, SysUtils, Variants, Classes, ActiveX, MSXML, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace, Functionality, unitReflector, TypesDefines, TypesFunctionality,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Animate, GIFCtrl,
  GeoTransformations,
  unitPolylineFigure,
  unitGEOGraphServerController,
  unitObjectModel,
  unitGeoObjectTrackAnalysisDefaultsPanel,
  unitGeoObjectTrackDecoding,
  unitInplaceHintPanel,
  unitTimeIntervalSlider;

const
  GeoSpaceIDFile = 'LastUsedGeoSpace.cfg';
  MaxDistanceForGeodesyPointsReload = 10000.0;
  MaxDistanceError = 100.0;
  MaxTracksCount = 10;
const
  NodeMarkerR = 4;
  PolyLineWidth = 1;
  SplineLineWidth = 3;
  StopMarkerR = 14;
  MovementMarkerR = 2;
  MaxPointsPerSpline = 1000;
  SelectedNodeMarkerR = NodeMarkerR+3;
  SelectedNodeMarkerColor = TColor($006A00D5);
  SelectedStopMarkerR = StopMarkerR+3;
  SelectedMovementMarkerR = 4*MovementMarkerR;
  SelectedStopOrMovementMarkerColor = TColor($006A00D5);

type
  TfmXYToGeoCrdConvertor = class;

  TDistanceNode = record
    ptrNext: pointer;
    X: double;
    Y: double;
    Lat: double;
    Long: double;
    DistanceToNext: double;
  end;

  TDistanceNodes = class
  public
    Convertor: TfmXYToGeoCrdConvertor;
    Lock: TCriticalSection;
    Nodes: pointer;
    SummaryDistance: double;

    Constructor Create(const pConvertor: TfmXYToGeoCrdConvertor);
    Destructor Destroy; override;
    function Count: integer;
    procedure Clear;
    procedure AddNode(const pX,pY: double; const pLat,pLong: double);
    procedure RemoveLast;
    function S: double;
    function GetLastNodeCrd(out oLat,oLong: double): boolean;
    procedure ProcessNodes;
    procedure Show;
  end;

  TTrackNodeDescriptor = record
    ptrTrack: pointer;
    Track: TGeoObjectTrack;
    NodePtr: pointer;
    NodeIndex: integer;
    Node: TObjectTrackNode;
    //.
    X: double;
    Y: double;
  end;

  TTrackStopOrMovementIntervalDescriptor = record
    ptrTrack: pointer;
    Track: TGeoObjectTrack;
    IntervalPtr: pointer;
    IntervalIndex: integer;
    Interval: TTrackStopsAndMovementsAnalysisIntervalDescriptor;
    //.
    X: double;
    Y: double;
    X1: double;
    Y1: double;
  end;

  TGeoObjectTracks = class;

  TTrackNodeInplaceHint = class(TThread)
  private
    GeoObjectTracks: TGeoObjectTracks;
    TrackNode: TTrackNodeDescriptor;
    PosX: integer;
    PosY: integer;
    Panel: TInplaceHintPanel;
    flRestartDelaying: boolean;
    //.
    HintText: string;
    //.
    ThreadException: Exception;

    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks; const pTrackNode: TTrackNodeDescriptor; const pPosX,pPosY: integer);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure RestartDelaying();
    procedure SetPosition(const pPosX,pPosY: integer);
    procedure DoOnProcessingStart();
    procedure DoOnProcessingStageCompleted();
    procedure DoOnProcessingFinish();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
    procedure CancelAndHide();
  end;

  TTrackStopOrMovementIntervalInplaceHint = class(TThread)
  private
    GeoObjectTracks: TGeoObjectTracks;
    TrackStopOrMovementInterval: TTrackStopOrMovementIntervalDescriptor;
    NearestEvents: TObjectTrackEvents;
    PosX: integer;
    PosY: integer;
    Panel: TInplaceHintPanel;
    flRestartDelaying: boolean;
    //.
    HintText: string;
    //.
    ThreadException: Exception;

    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks; const pTrackStopOrMovementInterval: TTrackStopOrMovementIntervalDescriptor; const pPosX,pPosY: integer);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure RestartDelaying();
    procedure SetPosition(const pPosX,pPosY: integer);
    procedure DoOnProcessingStart();
    procedure DoOnProcessingStageCompleted();
    procedure DoOnProcessingFinish();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
    procedure CancelAndHide();
  end;

  TGeoObjectTracks = class
  private
    FileName: string;
    TracksFileName: string;
    ShowTrack_FWR: TPolylineFigure;
    SelectedTrackNode: TTrackNodeDescriptor;
    SelectedTrackNode_InplaceHint: TTrackNodeInplaceHint;
    SelectedTrackStopOrMovementInterval: TTrackStopOrMovementIntervalDescriptor;
    SelectedTrackStopOrMovementInterval_InplaceHint: TTrackStopOrMovementIntervalInplaceHint;

    function GetNextTrackID: integer;
  public
    Convertor: TfmXYToGeoCrdConvertor;
    Lock: TCriticalSection;
    Tracks: pointer;
    ChangesCount: integer;
    TracksChangesCount: integer;
    ItemsTracksChangesCount: integer;
    AnalysisDefaults: TGeoObjectTrackAnalysisDefaults;
    flShowTracksNodes: boolean;
    flShowTracksNodesTimeHints: boolean;
    flShowTracksObjectModelEvents: boolean;
    flShowTracksBusinessModelEvents: boolean;
    ObjectModelEventSeveritiesToShow: TObjectTrackEventSeverities;
    BusinessModelEventSeveritiesToShow: TObjectTrackEventSeverities;

    Constructor Create(const pConvertor: TfmXYToGeoCrdConvertor);
    Destructor Destroy; override;
    procedure Clear;
    procedure Load;
    procedure Save;
    procedure LoadItemsTracks;
    procedure ClearItemsTracks;
    procedure SaveItemsTracks;
    procedure RecalculateItemsTrackBindings;
    procedure EnableDisableItems(const pflEnabled: boolean);
    function AddNewTrackFromFile(const ObjectLogFileName: string; const pTrackName: string; const pTrackColor: TColor): pointer;
    function AddNewTrackFromGeoDataStream(const GeoDataStream: TMemoryStream; const GeoDataDatumID: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer): pointer;
    procedure InsertTrack(const ptrTrack: pointer);
    procedure RemoveTrack(const ptrRemoveTrack: pointer);
    procedure RecalculateTrackBindings(const ptrTrack: pointer);
    function GetTrackByName(const pTrackName: string): pointer;
    procedure SetTrackProperties(const ptrTrack: pointer; const pTrackName: string; const pColor: TColor);
    procedure GetTrackInfo(const ptrTrack: pointer; out Size: integer; out Length: double);
    function GetTrackSize(const ptrTrack: pointer): integer;
    function GetTrackLength(const ptrTrack: pointer): double;
    procedure GetTrackTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
    function GetTrackIntervalLength(const ptrTrack: pointer; const IntervalBegin,IntervalEnd: integer): double;
    procedure GetTrackIntervalTimestamps(const ptrTrack: pointer; const IntervalBegin,IntervalEnd: integer; out BeginTime,EndTime: TDateTime);
    procedure GetTrackObjectModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
    procedure GetTrackObjectModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
    procedure GetTrackBusinessModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
    procedure GetTrackBusinessModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
    function  Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const EventSeverity: TObjectTrackEventSeverity; out Events: TObjectTrackEvents): boolean; overload;
    function  Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const TagBase,TagLength: integer; out Events: TObjectTrackEvents): boolean; overload;
    procedure Track_Reflection_SetInterval(const ptrTrack: pointer; const TimeStamp: TDateTime; const Duration: TDateTime);
    procedure Track_Reflection_GetFlags(const ptrTrack: pointer; out flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents: boolean);
    procedure Track_Reflection_SetFlags(const ptrTrack: pointer; const flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents: boolean);
    procedure ShowTracks(const pCanvas: TCanvas; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
    function GetTrackPanel(const ptrTrack: pointer; const pTimeStamp: TDateTime): TForm; overload;
    function GetTrackPanel(const ptrTrack: pointer; const pInterval: TTimeInterval): TForm; overload;
    function SelectTrackNode(const pX,pY: integer): boolean;
    procedure ShowSelectedTrackNode(const pCanvas: TCanvas);
    procedure ClearSelectedTrackNode();
    function IsSelectedTrackNode(out ptrSelectedTrack: pointer; out ptrSelectedTrackNode: pointer): boolean; overload;
    function IsSelectedTrackNode(): boolean; overload;
    procedure StartSelectedTrackNodeHint(const pX,pY: integer);
    function IsSelectedTrackNodeHinting(): boolean;
    procedure ClearSelectedTrackNodeHint();
    function SelectTrackStopOrMovementInterval(const pX,pY: integer): boolean;
    procedure ShowSelectedTrackStopOrMovementInterval(const pCanvas: TCanvas);
    procedure ClearSelectedTrackStopOrMovementInterval();
    function IsSelectedTrackStopOrMovementInterval(out ptrSelectedTrack: pointer; out ptrSelectedTrackStopOrMovementInterval: pointer): boolean; overload;
    function IsSelectedTrackStopOrMovementInterval(): boolean; overload;
    procedure StartSelectedTrackStopOrMovementIntervalHint(const pX,pY: integer);
    function IsSelectedTrackStopOrMovementIntervalHinting(): boolean;
    procedure ClearSelectedTrackStopOrMovementIntervalHint();
    procedure ClearSelectedItems();
    procedure ShowControlPanel;
    function CreateControlPanel(const pCoComponentID: integer): TForm;
    procedure UpdateReflectorView;
  end;

  TfmXYToGeoCrdConvertor = class(TForm)
    gbDistances: TGroupBox;
    reDistances: TRichEdit;
    Label4: TLabel;
    edDistanceSummary: TEdit;
    sbClearDistanceNodes: TSpeedButton;
    sbRemoveLastDistanceNode: TSpeedButton;
    Label11: TLabel;
    edSquareSummary: TEdit;
    Label5: TLabel;
    edDistanceFromLastNode: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbCalculateDistance: TSpeedButton;
    sbSetReflector: TSpeedButton;
    Label6: TLabel;
    sbTracks: TSpeedButton;
    sbShowGeoCrdSystemPropsPanel: TSpeedButton;
    Label12: TLabel;
    sbPositioning: TSpeedButton;
    sbSelectGeoSpace: TSpeedButton;
    sbGeoSpace: TSpeedButton;
    edGeoSpaceID: TEdit;
    edLatitude: TEdit;
    edLongitude: TEdit;
    pnlCompass: TPanel;
    gaCompass: TRxGIFAnimator;
    lbCompassAngle: TLabel;
    sbAlignToNorth: TSpeedButton;
    edScale: TEdit;
    edGeoSpaceName: TEdit;
    edCrdSystemName: TEdit;
    sbCrdMesh: TSpeedButton;
    sbSearchComponents: TSpeedButton;
    sbGeoMonitorObjectTreePanel: TSpeedButton;
    procedure edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure sbSetReflectorClick(Sender: TObject);
    procedure sbCalculateDistanceClick(Sender: TObject);
    procedure sbRemoveLastDistanceNodeClick(Sender: TObject);
    procedure sbClearDistanceNodesClick(Sender: TObject);
    procedure sbAlignToNorthClick(Sender: TObject);
    procedure sbTracksClick(Sender: TObject);
    procedure sbShowGeoCrdSystemPropsPanelClick(Sender: TObject);
    procedure sbPositioningClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure sbGeoSpaceClick(Sender: TObject);
    procedure sbSelectGeoSpaceClick(Sender: TObject);
    procedure sbCrdMeshClick(Sender: TObject);
    procedure sbSearchComponentsClick(Sender: TObject);
    procedure sbGeoMonitorObjectTreePanelClick(Sender: TObject);
  private
    { Private declarations }
    flGeoSpaceIDChanged: boolean;
    CrdSysConvertorPool: TList;
    TransformFactor: Extended;
    Scale: double;
    CompassAngle: Extended;

    procedure LoadGeoSpaceID;
    procedure SaveGeoSpaceID;
    function CrdToStr(const Crd: Extended): string;
    procedure GetReflectorCenterXY(out Xc,Yc: double);
  public
    { Public declarations }
    Reflector: TReflector;
    GeoSpaceID: integer;
    GeoSpaceName: string;
    GeoSpaceDatumID: integer;
    CrdSysConvertor: TCrdSysConvertor;
    DistanceNodes: TDistanceNodes;
    CurrentPos_flXYCalculated: boolean;
    CurrentPos_X: double;
    CurrentPos_Y: double;
    CurrentPos_flLatLongCalculated: boolean;
    CurrentPos_Lat: Extended;
    CurrentPos_Long: Extended;
    CurrentPos_DistanceFromLastNode: double;
    GeoObjectTracks: TGeoObjectTracks;
    PositioningPanel: TForm;

    Constructor Create(const pReflector: TReflector);
    Destructor Destroy; override;
    procedure Update; reintroduce;
    procedure RecalculateReflectorCenterCrdAndScale();
    procedure SetReflectorPositionByGeoCrd;
    procedure LocatePosition(const Lat,Long: Extended);
    procedure UpdateCompass;
    function ConvertXYToGeoCrd(const X,Y: Extended; out Lat,Long: Extended): boolean; overload;
    function ConvertGeoGrdToXY(const Lat,Long: Extended; out X,Y: Extended): boolean; overload;
    function ConvertXYToGeoCrd(const X,Y: Extended; out DatumID: integer; out Lat,Long: Extended): boolean; overload;
    function ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long: Extended; out X,Y: Extended): boolean; overload;
    function AbsoluteConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: Extended; out X,Y: Extended): boolean; overload;
    function AbsoluteConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: Extended; const pGeoSpaceID: integer; out X,Y: Extended): boolean; overload;
  end;

  function SpeedColor(Speed: double): TColor;

implementation
Uses
  Math,
  NativeXML,
  unitEventLog,
  unitSpline,
  unitTGeoSpaceInstanceSelector,
  unitGeoObjectTracksPanel,
  unitGeoObjectTrackStatisticsPanel,
  unitGeoObjectTrackControlPanel,
  unitGeoPositionReceiver,
  unitGeoSpaceMapFormatObjectSearchPanel;

{$R *.dfm}


{TDistanceNodes}
Constructor TDistanceNodes.Create(const pConvertor: TfmXYToGeoCrdConvertor);
begin
Inherited Create;
Convertor:=pConvertor;
Lock:=TCriticalSection.Create;
Nodes:=nil;
SummaryDistance:=-1;
end;

Destructor TDistanceNodes.Destroy;
begin
Clear();
Lock.Free;
Inherited;
end;

function TDistanceNodes.Count: integer;
var
  ptrNode: pointer;
begin
Result:=0;
Lock.Enter;
try
ptrNode:=Nodes;
while (ptrNode <> nil) do with TDistanceNode(ptrNode^) do begin
  Inc(Result);
  //. next
  ptrNode:=ptrNext;
  end;
finally
Lock.Leave;
end;
end;

procedure TDistanceNodes.Clear;
var
  ptrDestroyNode: pointer;
begin
Lock.Enter;
try
while (Nodes <> nil) do begin
  ptrDestroyNode:=Nodes;
  Nodes:=TDistanceNode(ptrDestroyNode^).ptrNext;
  FreeMem(ptrDestroyNode,SizeOf(TDistanceNode));
  end;
finally
Lock.Leave;
end;
end;

procedure TDistanceNodes.AddNode(const pX,pY: double; const pLat,pLong: double);
var
  ptrNewNode,ptrptrNode: pointer;
begin
Lock.Enter;
try
ptrptrNode:=@Nodes;
while (Pointer(ptrptrNode^) <> nil) do with TDistanceNode(Pointer(ptrptrNode^)^) do begin
  if ((Lat = pLat) AND (Long = pLong)) then Exit; //. ->
  ptrptrNode:=@TDistanceNode(Pointer(ptrptrNode^)^).ptrNext;
  end;
//.
GetMem(ptrNewNode,SizeOf(TDistanceNode));
with TDistanceNode(ptrNewNode^) do begin
ptrNext:=nil;
X:=pX;
Y:=pY;
Lat:=pLat;
Long:=pLong;
DistanceToNext:=-1;
end;
Pointer(ptrptrNode^):=ptrNewNode;
finally
Lock.Leave;
end;
end;

function TDistanceNodes.S: double;

  procedure ProcessSide(const N0,N1: TDistanceNode; var Square: double);
  begin
  Square:=Square+(N1.Y+N0.Y)*(N1.X-N0.X);
  end;

var
  ptrLastNode,ptrNode: pointer;
begin
Result:=0;
Lock.Enter;
try
if (Nodes <> nil)
 then begin
  ptrLastNode:=Nodes;
  ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
  if (ptrNode <> nil)
   then begin
    repeat
      ProcessSide(TDistanceNode(ptrLastNode^),TDistanceNode(ptrNode^), Result);
      //. next interval
      ptrLastNode:=ptrNode;
      ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
    until (ptrNode = nil);
    ProcessSide(TDistanceNode(ptrLastNode^),TDistanceNode(Nodes^), Result);
    end;
  end;
finally
Lock.Leave;
end;
Result:=Result/2.0;
if (Result < 0) then Result:=-Result;
end;

procedure TDistanceNodes.RemoveLast;
var
  ptrptrDestroyNode,ptrptrNode: pointer;
begin
Lock.Enter;
try
ptrptrDestroyNode:=nil;
ptrptrNode:=@Nodes;
while (Pointer(ptrptrNode^) <> nil) do begin
  ptrptrDestroyNode:=ptrptrNode;
  ptrptrNode:=@TDistanceNode(Pointer(ptrptrNode^)^).ptrNext;
  end;
if (ptrptrDestroyNode <> nil)
 then begin
  FreeMem(Pointer(ptrptrDestroyNode^),SizeOf(TDistanceNode));
  Pointer(ptrptrDestroyNode^):=nil;
  end;
finally
Lock.Leave;
end;
end;

function TDistanceNodes.GetLastNodeCrd(out oLat,oLong: double): boolean;
var
  ptrNode,ptrLastNode: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrLastNode:=nil;
ptrNode:=Nodes;
while (ptrNode <> nil) do begin
  ptrLastNode:=ptrNode;
  //. next
  ptrNode:=TDistanceNode(ptrNode^).ptrNext;
  end;
if (ptrLastNode <> nil)
 then with TDistanceNode(ptrLastNode^) do begin
  oLat:=Lat;
  oLong:=Long;
  Result:=true;
  end;
finally
Lock.Leave;
end;
end;

procedure TDistanceNodes.ProcessNodes;
var
  ptrLastNode,ptrNode: pointer;
begin
SummaryDistance:=-1;
Lock.Enter;
try
if (Nodes <> nil)
 then begin
  ptrLastNode:=Nodes;
  ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
  if (ptrNode <> nil)
   then begin
    SummaryDistance:=0;
    repeat
      with TDistanceNode(ptrLastNode^) do begin
      DistanceToNext:=Convertor.CrdSysConvertor.GetDistance(Lat,Long, TDistanceNode(ptrNode^).Lat,TDistanceNode(ptrNode^).Long);
      SummaryDistance:=SummaryDistance+DistanceToNext;
      end;
      with TDistanceNode(ptrNode^) do DistanceToNext:=-1;
      //. next interval
      ptrLastNode:=ptrNode;
      ptrNode:=TDistanceNode(ptrLastNode^).ptrNext;
    until (ptrNode = nil);
    end
   else with TDistanceNode(ptrLastNode^) do DistanceToNext:=-1;
  end;
finally
Lock.Leave;
end;
end;

procedure TDistanceNodes.Show;
var
  ptrNode: pointer;
  NodeIndex: integer;
  Sq: double;
begin
Lock.Enter;
try
with Convertor.reDistances do begin
Lines.BeginUpdate;
try
Lines.Clear;
NodeIndex:=0;
ptrNode:=Nodes;
while (ptrNode <> nil) do with TDistanceNode(ptrNode^) do begin
  Convertor.reDistances.SelAttributes.Color:=clNavy;
  Convertor.reDistances.SelAttributes.Style:=[];
  Lines.Add(IntToStr(NodeIndex)+':  ('+Convertor.CrdToStr(Lat)+'; '+Convertor.CrdToStr(Long)+')');
  if (DistanceToNext >= 0)
   then begin
    Convertor.reDistances.SelAttributes.Color:=clRed;
    Convertor.reDistances.SelAttributes.Style:=[fsBold];
    Lines.Add('     | Distance = '+FormatFloat('0.000',DistanceToNext)+' m');
    end;
  //. next
  ptrNode:=ptrNext;
  Inc(NodeIndex);
  end;
finally
Lines.EndUpdate;
end;
end;
finally
Lock.Leave;
end;
if (SummaryDistance >= 0) then Convertor.edDistanceSummary.Text:=FormatFloat('0.000',SummaryDistance) else Convertor.edDistanceSummary.Text:='';
Sq:=S*sqr(Convertor.TransformFactor);
if (Sq > 0) then Convertor.edSquareSummary.Text:=FormatFloat('0.000',Sq) else Convertor.edSquareSummary.Text:='';
end;


{TGeoObjectTracks}
Constructor TGeoObjectTracks.Create(const pConvertor: TfmXYToGeoCrdConvertor);
begin
Inherited Create();
Convertor:=pConvertor;
FileName:='Reflector'+'\'+IntToStr(Convertor.Reflector.id)+'\'+'GeoObjectTracks.xml';
TracksFileName:='Reflector'+'\'+IntToStr(Convertor.Reflector.id)+'\'+'GeoObjectTrackItems.xml';
Lock:=TCriticalSection.Create;
ShowTrack_FWR:=TPolylineFigure.Create();
Tracks:=nil;
ChangesCount:=0;
TracksChangesCount:=0;
ItemsTracksChangesCount:=0;
AnalysisDefaults:=TGeoObjectTrackAnalysisDefaults.Create(Convertor.Reflector.Space);
flShowTracksNodes:=true;
flShowTracksNodesTimeHints:=false;
flShowTracksObjectModelEvents:=false;
flShowTracksBusinessModelEvents:=true;
ObjectModelEventSeveritiesToShow:=[otesInfo,otesMinor,otesMajor,otesCritical];
BusinessModelEventSeveritiesToShow:=[otesMajor,otesCritical];
try
Load();
//. load tracks
LoadItemsTracks;
except
  On E: Exception do EventLog.WriteMinorEvent('ReflectorObjectTracks','Exception on loading object tracks (idReflector = '+IntToStr(Convertor.Reflector.ID)+').',E.Message);
  end;
//.
SelectedTrackNode.ptrTrack:=nil;
SelectedTrackNode.NodePtr:=nil;
SelectedTrackNode.NodeIndex:=-1;
SelectedTrackNode_InplaceHint:=nil;
//.
SelectedTrackStopOrMovementInterval.ptrTrack:=nil;
SelectedTrackStopOrMovementInterval.IntervalPtr:=nil;
SelectedTrackStopOrMovementInterval.IntervalIndex:=-1;
SelectedTrackStopOrMovementInterval_InplaceHint:=nil;
end;

Destructor TGeoObjectTracks.Destroy;
begin
if (SelectedTrackStopOrMovementInterval_InplaceHint <> nil) then SelectedTrackStopOrMovementInterval_InplaceHint.CancelAndHide();
//.
if (SelectedTrackNode_InplaceHint <> nil) then SelectedTrackNode_InplaceHint.CancelAndHide();
//.
if (ItemsTracksChangesCount > 0)
 then SaveItemsTracks(); //. save tracks
//.
if (TracksChangesCount > 0)
 then Save(); //. save tracks
//.
Clear();
AnalysisDefaults.Free();
ShowTrack_FWR.Free();
Lock.Free();
Inherited;
end;

procedure TGeoObjectTracks.Clear;
var
  ptrDestroyTrack: pointer;
begin
Lock.Enter;
try
if (Tracks = nil) then Exit; //. ->
while (Tracks <> nil) do begin
  ptrDestroyTrack:=Tracks;
  Tracks:=TGeoObjectTrack(ptrDestroyTrack^).Next;
  TObjectModel.Log_DestroyTrack(ptrDestroyTrack);
  end;
Inc(TracksChangesCount);
Inc(ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.Load;
var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ItemsNode: IXMLDOMNode;
  I: integer;
  ItemNode: IXMLDOMNode;
  ptrptrNewItem: pointer;
  ptrNewItem: pointer;
begin
Lock.Enter;
try
Clear();
with TProxySpaceUserProfile.Create(Convertor.Reflector.Space) do
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
  ptrptrNewItem:=@Tracks;
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    //. create new item and insert
    GetMem(ptrNewItem,SizeOf(TGeoObjectTrack));
    try
    FillChar(ptrNewItem^, SizeOf(TGeoObjectTrack), #0);
    with TGeoObjectTrack(ptrNewItem^) do begin
    Next:=nil;
    ID:=ItemNode.selectSingleNode('ID').nodeTypedValue;
    if (ItemNode.selectSingleNode('idTOwner') <> nil)
     then idTOwner:=ItemNode.selectSingleNode('idTOwner').nodeTypedValue
     else idTOwner:=0;
    if (ItemNode.selectSingleNode('idOwner') <> nil)
     then idOwner:=ItemNode.selectSingleNode('idOwner').nodeTypedValue
     else idOwner:=0;
    flEnabled:=ItemNode.selectSingleNode('Enabled').nodeTypedValue;
    TrackName:=ItemNode.selectSingleNode('TrackName').nodeTypedValue;
    DatumID:=ItemNode.selectSingleNode('DatumID').nodeTypedValue;
    Color:=ItemNode.selectSingleNode('Color').nodeTypedValue;
    if (ItemNode.selectSingleNode('CoComponentID') <> nil)
     then CoComponentID:=ItemNode.selectSingleNode('CoComponentID').nodeTypedValue
     else CoComponentID:=0;
    //.
    if (ItemNode.selectSingleNode('Reflection_IntervalTimestamp') <> nil)
     then Reflection_IntervalTimestamp:=ItemNode.selectSingleNode('Reflection_IntervalTimestamp').nodeTypedValue
     else Reflection_IntervalTimestamp:=0.0;
    if (ItemNode.selectSingleNode('Reflection_IntervalDuration') <> nil)
     then Reflection_IntervalDuration:=ItemNode.selectSingleNode('Reflection_IntervalDuration').nodeTypedValue
     else Reflection_IntervalDuration:=0.0;
    if (ItemNode.selectSingleNode('Reflection_flShowTrack') <> nil)
     then Reflection_flShowTrack:=ItemNode.selectSingleNode('Reflection_flShowTrack').nodeTypedValue
     else Reflection_flShowTrack:=false;
    if (ItemNode.selectSingleNode('Reflection_flShowTrackNodes') <> nil)
     then Reflection_flShowTrackNodes:=ItemNode.selectSingleNode('Reflection_flShowTrackNodes').nodeTypedValue
     else Reflection_flShowTrackNodes:=true;
    if (ItemNode.selectSingleNode('Reflection_flSpeedColoredTrack') <> nil)
     then Reflection_flSpeedColoredTrack:=ItemNode.selectSingleNode('Reflection_flSpeedColoredTrack').nodeTypedValue
     else Reflection_flSpeedColoredTrack:=false;
    if (ItemNode.selectSingleNode('Reflection_flShowStopsAndMovementsGraph') <> nil)
     then Reflection_flShowStopsAndMovementsGraph:=ItemNode.selectSingleNode('Reflection_flShowStopsAndMovementsGraph').nodeTypedValue
     else Reflection_flShowStopsAndMovementsGraph:=true;
    if (ItemNode.selectSingleNode('Reflection_flHideMovementsGraph') <> nil)
     then Reflection_flHideMovementsGraph:=ItemNode.selectSingleNode('Reflection_flHideMovementsGraph').nodeTypedValue
     else Reflection_flHideMovementsGraph:=true;
    if (ItemNode.selectSingleNode('Reflection_flShowObjectModelEvents') <> nil)
     then Reflection_flShowObjectModelEvents:=ItemNode.selectSingleNode('Reflection_flShowObjectModelEvents').nodeTypedValue
     else Reflection_flShowObjectModelEvents:=false;
    if (ItemNode.selectSingleNode('Reflection_flShowBusinessModelEvents') <> nil)
     then Reflection_flShowBusinessModelEvents:=ItemNode.selectSingleNode('Reflection_flShowBusinessModelEvents').nodeTypedValue
     else Reflection_flShowBusinessModelEvents:=false;
    end;
    //.
    Pointer(ptrptrNewItem^):=ptrNewItem;
    ptrptrNewItem:=@TGeoObjectTrack(ptrNewItem^).Next;
    except
      TObjectModel.Log_DestroyTrack(ptrNewItem);
      end;
    end;
  end;
TracksChangesCount:=0;
finally
Destroy;
end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.Save;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  ptrItem: pointer;
  I: integer;
  ItemNode: IXMLDOMElement;
  //.
  PropNode: IXMLDOMElement;
begin
Lock.Enter();
try
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
ItemsNode:=Doc.createElement('Items');
Root.appendChild(ItemsNode);
I:=0;
ptrItem:=Tracks;
while (ptrItem <> nil) do with TGeoObjectTrack(ptrItem^) do begin
  //. create item
  ItemNode:=Doc.CreateElement('Item'+IntToStr(I));
  //.
  PropNode:=Doc.CreateElement('ID');                     PropNode.nodeTypedValue:=ID;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('idTOwner');               PropNode.nodeTypedValue:=idTOwner;                ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('idOwner');                PropNode.nodeTypedValue:=idOwner;                 ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Enabled');                PropNode.nodeTypedValue:=flEnabled;               ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('TrackName');              PropNode.nodeTypedValue:=TrackName;               ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('DatumID');                PropNode.nodeTypedValue:=DatumID;                 ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Color');                  PropNode.nodeTypedValue:=Color;                   ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('CoComponentID');          PropNode.nodeTypedValue:=CoComponentID;           ItemNode.appendChild(PropNode);
  //.
  Reflection_IntervalTimestamp:=0.0;
  Reflection_IntervalDuration:=0.0;
  PropNode:=Doc.CreateElement('Reflection_IntervalTimestamp');                  PropNode.nodeTypedValue:=Double(Reflection_IntervalTimestamp);           ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_IntervalDuration');                   PropNode.nodeTypedValue:=Double(Reflection_IntervalDuration);            ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flShowTrack');                        PropNode.nodeTypedValue:=Reflection_flShowTrack;                         ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flShowTrackNodes');                   PropNode.nodeTypedValue:=Reflection_flShowTrackNodes;                    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flSpeedColoredTrack');                PropNode.nodeTypedValue:=Reflection_flSpeedColoredTrack;                 ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flShowStopsAndMovementsGraph');       PropNode.nodeTypedValue:=Reflection_flShowStopsAndMovementsGraph;        ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flHideMovementsGraph');               PropNode.nodeTypedValue:=Reflection_flHideMovementsGraph;                ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flShowObjectModelEvents');            PropNode.nodeTypedValue:=Reflection_flShowObjectModelEvents;             ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Reflection_flShowBusinessModelEvents');          PropNode.nodeTypedValue:=Reflection_flShowBusinessModelEvents;           ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  //. next item
  Inc(I);
  if (I > MaxTracksCount) then Break; //. >
  ptrItem:=Next;
  end;
//. save xml document
with TProxySpaceUserProfile.Create(Convertor.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+FileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
TracksChangesCount:=0;
finally
Lock.Leave();
end;
end;

procedure TGeoObjectTracks.LoadItemsTracks;
var
  Doc: TNativeXml;
  VersionNode: TXmlNode;
  Version: integer;
  ItemsNode: TXmlNode;
  ptrItem: pointer;
  ItemNode: TXmlNode;
  I: integer;
  TrackNode: TXmlNode;
  TrackNodesNode: TXmlNode;
  ptrNewTrackItem: pointer;
  ptrptrLastTrackItem: pointer;
  ObjectModelEventsNode: TXmlNode;
  EventNode,EventPropNode: TXmlNode;
  ptrNewTrackEvent: pointer;
  ptrptrLastTrackEvent: pointer;
  BusinessModelEventsNode: TXmlNode;
  StopsAndMovementsAnalysisNode: TXmlNode;
  TS: double;
begin
Lock.Enter;
try
ClearItemsTracks;
with TProxySpaceUserProfile.Create(Convertor.Reflector.Space) do
try
if (FileExists(ProfileFolder+'\'+TracksFileName))
 then begin
  SetProfileFile(TracksFileName);
  Doc:=TNativeXml.Create(nil);
  try
  Doc.LoadFromFile(ProfileFile);
  Doc.Root.NodeByName('Version');
  VersionNode:=Doc.Root.NodeByName('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.ValueAsInteger
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  ItemsNode:=Doc.Root.NodeByName('Tracks');
  ptrItem:=Tracks;
  while (ptrItem <> nil) do with TGeoObjectTrack(ptrItem^) do begin
    ItemNode:=ItemsNode.NodeByName('ID'+IntToStr(ID));
    if (ItemNode <> nil)
     then begin
       //. load track nodes
      TrackNodesNode:=ItemNode.NodeByName('Nodes');
      ptrptrLastTrackItem:=@Nodes;
      for I:=0 to TrackNodesNode.ChildContainerCount-1 do begin
        TrackNode:=TrackNodesNode.ChildContainers[I];
        //. create new track item and insert
        try
        GetMem(ptrNewTrackItem,SizeOf(TObjectTrackNode));
        FillChar(ptrNewTrackItem^,SizeOf(TObjectTrackNode),0);
        with TObjectTrackNode(ptrNewTrackItem^) do begin
        Next:=nil;
        TS:=TrackNode.NodeByName('TimeStamp').ValueAsFloat;
        TimeStamp:=TDateTime(TS);
        Latitude:=TrackNode.NodeByName('Latitude').ValueAsFloat;
        Longitude:=TrackNode.NodeByName('Longitude').ValueAsFloat;
        Altitude:=TrackNode.NodeByName('Altitude').ValueAsFloat;
        Speed:=TrackNode.NodeByName('Speed').ValueAsFloat;
        Bearing:=TrackNode.NodeByName('Bearing').ValueAsFloat;
        Precision:=TrackNode.NodeByName('Precision').ValueAsFloat;
        X:=TrackNode.NodeByName('X').ValueAsFloat;
        Y:=TrackNode.NodeByName('Y').ValueAsFloat;
        end;
        except
          FreeMem(ptrNewTrackItem,SizeOf(TObjectTrackNode));
          Continue; //. ^
          end;
        Pointer(ptrptrLastTrackItem^):=ptrNewTrackItem;
        ptrptrLastTrackItem:=@TObjectTrackNode(ptrNewTrackItem^).Next;
        end;
      //. load object model events
      ObjectModelEventsNode:=ItemNode.NodeByName('ObjectModelEvents');
      if (ObjectModelEventsNode <> nil)
       then begin
        ptrptrLastTrackEvent:=@ObjectModelEvents;
        for I:=0 to ObjectModelEventsNode.ChildContainerCount-1 do begin
          EventNode:=ObjectModelEventsNode.ChildContainers[I];
          //. create new track item and insert
          GetMem(ptrNewTrackEvent,SizeOf(TObjectTrackEvent));
          FillChar(ptrNewTrackEvent^,SizeOf(TObjectTrackEvent),0);
          with TObjectTrackEvent(ptrNewTrackEvent^) do begin
          Next:=nil;
          TS:=EventNode.NodeByName('TimeStamp').ValueAsFloat;
          TimeStamp:=TDateTime(TS);
          Severity:=TObjectTrackEventSeverity(EventNode.NodeByName('Severity').ValueAsInteger);
          EventPropNode:=EventNode.NodeByName('Tag');
          if (EventPropNode <> nil) then EventTag:=EventPropNode.ValueAsInteger else EventTag:=EVENTTAG_NONE;
          EventMessage:=EventNode.NodeByName('Message').Value;
          EventInfo:=EventNode.NodeByName('Info').Value;
          EventPropNode:=EventNode.NodeByName('Extra');
          if (EventPropNode <> nil)
           then begin
            SetLength(EventExtra,EventPropNode.BufferLength);
            if (Length(EventExtra) > 0)
             then EventPropNode.BufferRead(Pointer(@EventExtra[0])^,Length(EventExtra),xbeBase64);
            end
           else SetLength(EventExtra,0);
          X:=EventNode.NodeByName('X').ValueAsFloat;
          Y:=EventNode.NodeByName('Y').ValueAsFloat;
          end;
          Pointer(ptrptrLastTrackEvent^):=ptrNewTrackEvent;
          ptrptrLastTrackEvent:=@TObjectTrackEvent(ptrNewTrackEvent^).Next;
          end;
        end;
      //. load business model events
      BusinessModelEventsNode:=ItemNode.NodeByName('BusinessModelEvents');
      if (BusinessModelEventsNode <> nil)
       then begin
        ptrptrLastTrackEvent:=@BusinessModelEvents;
        for I:=0 to BusinessModelEventsNode.ChildContainerCount-1 do begin
          EventNode:=BusinessModelEventsNode.ChildContainers[I];
          //. create new track item and insert
          GetMem(ptrNewTrackEvent,SizeOf(TObjectTrackEvent));
          FillChar(ptrNewTrackEvent^,SizeOf(TObjectTrackEvent),0);
          with TObjectTrackEvent(ptrNewTrackEvent^) do begin
          Next:=nil;
          TS:=EventNode.NodeByName('TimeStamp').ValueAsFloat;
          TimeStamp:=TDateTime(TS);
          Severity:=TObjectTrackEventSeverity(EventNode.NodeByName('Severity').ValueAsInteger);
          EventPropNode:=EventNode.NodeByName('Tag');
          if (EventPropNode <> nil) then EventTag:=EventPropNode.ValueAsInteger else EventTag:=EVENTTAG_NONE;
          EventMessage:=EventNode.NodeByName('Message').Value;
          EventInfo:=EventNode.NodeByName('Info').Value;
          EventPropNode:=EventNode.NodeByName('Extra');
          if (EventPropNode <> nil)
           then begin
            SetLength(EventExtra,EventPropNode.BufferLength);
            if (Length(EventExtra) > 0)
             then EventPropNode.BufferRead(Pointer(@EventExtra[0])^,Length(EventExtra),xbeBase64);
            end
           else SetLength(EventExtra,0);
          X:=EventNode.NodeByName('X').ValueAsFloat;
          Y:=EventNode.NodeByName('Y').ValueAsFloat;
          end;
          Pointer(ptrptrLastTrackEvent^):=ptrNewTrackEvent;
          ptrptrLastTrackEvent:=@TObjectTrackEvent(ptrNewTrackEvent^).Next;
          end;
        end;
      //. load StopsAndMovements Analysis
      StopsAndMovementsAnalysis:=TTrackStopsAndMovementsAnalysis.Create();
      try
      StopsAndMovementsAnalysisNode:=ItemNode.NodeByName('StopsAndMovementsAnalysis');
      if ((StopsAndMovementsAnalysisNode = nil) OR (NOT TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).FromXMLNode(StopsAndMovementsAnalysisNode)))
       then TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).Process(ptrItem);
      except
        FreeAndNil(StopsAndMovementsAnalysis);
        Raise; //. =>
        end;
      end;
    //. next
    ptrItem:=Next;
    end;
  finally
  Doc.Destroy();
  end;
  end;
Inc(ChangesCount);
ItemsTracksChangesCount:=0;
finally
Destroy;
end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.ClearItemsTracks;
var
  ptrItem: pointer;
  ptrRemoveTrackItem: pointer;
begin
Lock.Enter;
try
if (Tracks = nil) then Exit; //. ->
ptrItem:=Tracks;
while (ptrItem <> nil) do with TGeoObjectTrack(ptrItem^) do begin
  while (Nodes <> nil) do begin
    ptrRemoveTrackItem:=Nodes;
    Nodes:=TObjectTrackNode(ptrRemoveTrackItem^).Next;
    FreeMem(ptrRemoveTrackItem,SizeOf(TObjectTrackNode));
    end;
  while (ObjectModelEvents <> nil) do begin
    ptrRemoveTrackItem:=ObjectModelEvents;
    ObjectModelEvents:=TObjectTrackEvent(ptrRemoveTrackItem^).Next;
    //.
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventExtra,0);
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventMessage,0);
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventInfo,0);
    FreeMem(ptrRemoveTrackItem,SizeOf(TObjectTrackEvent));
    end;
  while (BusinessModelEvents <> nil) do begin
    ptrRemoveTrackItem:=BusinessModelEvents;
    BusinessModelEvents:=TObjectTrackEvent(ptrRemoveTrackItem^).Next;
    //.
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventExtra,0);
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventMessage,0);
    SetLength(TObjectTrackEvent(ptrRemoveTrackItem^).EventInfo,0);
    FreeMem(ptrRemoveTrackItem,SizeOf(TObjectTrackEvent));
    end;
  FreeAndNil(StopsAndMovementsAnalysis);
  //. next
  ptrItem:=Next;
  end;
Inc(ChangesCount);
Inc(ItemsTracksChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.SaveItemsTracks;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  ptrItem: pointer;
  TrackNode: IXMLDOMElement;
  ptrTrackItem: pointer;
  TC,I: integer;
  NodeNode: IXMLDOMElement;
  TrackNodesNode: IXMLDOMElement;
  ptrTrackEvent: pointer;
  ObjectModelEventsNode: IXMLDOMElement;
  BusinessModelEventsNode: IXMLDOMElement;
  StopsAndMovementsAnalysisNode: IXMLDOMElement;
  //.
  TS: double;
  PropNode: IXMLDOMElement;
begin
Lock.Enter;
try
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
ItemsNode:=Doc.createElement('Tracks');
Root.appendChild(ItemsNode);
TC:=0;
ptrItem:=Tracks;
while (ptrItem <> nil) do with TGeoObjectTrack(ptrItem^) do begin
  if (Nodes <> nil)
   then begin
    //. create track
    TrackNode:=Doc.CreateElement('ID'+IntToStr(ID));
    //. add object track nodes
    TrackNodesNode:=Doc.CreateElement('Nodes'); 
    I:=0;
    ptrTrackItem:=Nodes;
    repeat
      NodeNode:=Doc.CreateElement('N'+IntToStr(I)); //. create track item
      TS:=TObjectTrackNode(ptrTrackItem^).TimeStamp;
      PropNode:=Doc.CreateElement('TimeStamp');       PropNode.nodeTypedValue:=TS;                                                    NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Latitude');        PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Latitude;              NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Longitude');       PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Longitude;             NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Altitude');        PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Altitude;              NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Speed');           PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Speed;                 NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Bearing');         PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Bearing;               NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Precision');       PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Precision;             NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('X');               PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).X;                     NodeNode.appendChild(PropNode);
      PropNode:=Doc.CreateElement('Y');               PropNode.nodeTypedValue:=TObjectTrackNode(ptrTrackItem^).Y;                     NodeNode.appendChild(PropNode);
      //. add track item
      TrackNodesNode.appendChild(NodeNode);
      //. Next
      ptrTrackItem:=TObjectTrackNode(ptrTrackItem^).Next;
      Inc(I);
    until (ptrTrackItem = nil);
    TrackNode.appendChild(TrackNodesNode);
    //. add object model events
    if (ObjectModelEvents <> nil)
     then begin
      ObjectModelEventsNode:=Doc.CreateElement('ObjectModelEvents');
      I:=0;
      ptrTrackEvent:=ObjectModelEvents;
      repeat
        NodeNode:=Doc.CreateElement('N'+IntToStr(I)); //. create track item
        TS:=TObjectTrackEvent(ptrTrackEvent^).TimeStamp;
        PropNode:=Doc.CreateElement('TimeStamp');       PropNode.nodeTypedValue:=TS;                                                                                                            NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Severity');        PropNode.nodeTypedValue:=Integer(TObjectTrackEvent(ptrTrackEvent^).Severity);                                                           NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Tag');             PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventTag;                                                                    NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Message');         PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventMessage;                                                                NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Info');            PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventInfo;                                                                   NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Extra');           PropNode.Set_dataType('bin.base64'); PropNode.nodeTypedValue:=ByteArray_ToVariant(TObjectTrackEvent(ptrTrackEvent^).EventExtra);        NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('X');               PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).X;                                                                           NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Y');               PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).Y;                                                                           NodeNode.appendChild(PropNode);
        //. add track item
        ObjectModelEventsNode.appendChild(NodeNode);
        //. Next
        ptrTrackEvent:=TObjectTrackEvent(ptrTrackEvent^).Next;
        Inc(I);
      until (ptrTrackEvent = nil);
      TrackNode.appendChild(ObjectModelEventsNode);
      end;
    //. add business model events
    if (BusinessModelEvents <> nil)
     then begin
      BusinessModelEventsNode:=Doc.CreateElement('BusinessModelEvents');
      I:=0;
      ptrTrackEvent:=BusinessModelEvents;
      repeat
        NodeNode:=Doc.CreateElement('N'+IntToStr(I)); //. create track item
        TS:=TObjectTrackEvent(ptrTrackEvent^).TimeStamp;
        PropNode:=Doc.CreateElement('TimeStamp');       PropNode.nodeTypedValue:=TS;                                                                                                            NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Severity');        PropNode.nodeTypedValue:=Integer(TObjectTrackEvent(ptrTrackEvent^).Severity);                                                           NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Tag');             PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventTag;                                                                    NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Message');         PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventMessage;                                                                NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Info');            PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).EventInfo;                                                                   NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Extra');           PropNode.Set_dataType('bin.base64'); PropNode.nodeTypedValue:=ByteArray_ToVariant(TObjectTrackEvent(ptrTrackEvent^).EventExtra);        NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('X');               PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).X;                                                                           NodeNode.appendChild(PropNode);
        PropNode:=Doc.CreateElement('Y');               PropNode.nodeTypedValue:=TObjectTrackEvent(ptrTrackEvent^).Y;                                                                           NodeNode.appendChild(PropNode);
        //. add track item
        BusinessModelEventsNode.appendChild(NodeNode);
        //. Next
        ptrTrackEvent:=TObjectTrackEvent(ptrTrackEvent^).Next;
        Inc(I);
      until (ptrTrackEvent = nil);
      TrackNode.appendChild(BusinessModelEventsNode);
      end;
    //. save StopsAndMovements Analysis
    if (StopsAndMovementsAnalysis <> nil)                
     then begin
      StopsAndMovementsAnalysisNode:=Doc.CreateElement('StopsAndMovementsAnalysis');
      TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).ToXMLNode(Doc,StopsAndMovementsAnalysisNode);
      TrackNode.appendChild(StopsAndMovementsAnalysisNode);
      end;
    //. add track
    ItemsNode.appendChild(TrackNode);
    end;
  //. Next
  Inc(TC);
  if (TC > MaxTracksCount) then Break; //. >  
  ptrItem:=Next;
  end;
//. save xml document
with TProxySpaceUserProfile.Create(Convertor.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+TracksFileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
ItemsTracksChangesCount:=0;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.RecalculateItemsTrackBindings;
var
  ptrItem: pointer;
begin
Lock.Enter;
try
ptrItem:=Tracks;
while (ptrItem <> nil) do begin
  RecalculateTrackBindings(ptrItem);
  //. Next
  ptrItem:=TGeoObjectTrack(ptrItem^).Next;
  end;
Inc(ItemsTracksChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.EnableDisableItems(const pflEnabled: boolean);
var
  ptrItem: pointer;
begin
Lock.Enter;
try
ptrItem:=Tracks;
while (ptrItem <> nil) do with TGeoObjectTrack(ptrItem^) do begin
  flEnabled:=pflEnabled;
  //. next
  ptrItem:=Next;
  end;
Inc(ChangesCount);
//.
Save();
finally
Lock.Leave;
end;
UpdateReflectorView();
end;

function TGeoObjectTracks.AddNewTrackFromFile(const ObjectLogFileName: string; const pTrackName: string; const pTrackColor: TColor): pointer;
type
  TTrackItem = packed record
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Precision: double;
  end;

var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  GeoSpaceDatumID: integer;
  ObjectDatumID: integer;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ptrNewTrack: pointer;
  ptrptrLastTrackNode: pointer;
  ptrptrLastTrackObjectModelEvent: pointer;
  OperationsLogNode: IXMLDOMNode;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  OperationsLogItem: string;
  flSetCommand: boolean;
  ElementAddress: TAddress;
  AddressIndex: integer;
  ObjectModelElement: TComponentElement;
  TimeStamp: TDateTime;
  ptrTrackNode: pointer;
  ptrTrackEvent: pointer;
  idGeoCrdSystem: integer;
  CrdSysConvertor: TCrdSysConvertor;
  _Lat,_Long,_Alt: Extended;
  flTransformPointsLoaded: boolean;
  _X,_Y: Extended;
  ptrApproxNode0,ptrApproxNode1: pointer;
  F: double;
begin
if (NOT FileExists(ObjectLogFileName)) then Raise Exception.Create('Object log file is not found'); //. =>
//.
ServerObjectController:=TGEOGraphServerObjectController.Create(5,64,Convertor.Reflector.Space.UserID,Convertor.Reflector.Space.UserName,Convertor.Reflector.Space.UserPassword,'',0,false);
try
ObjectModel:=TObjectModel.GetModel(1{///////ObjectType},ServerObjectController);
try
ObjectModel.ObjectDeviceSchema.RootComponent.ReadAll();
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,Convertor.GeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//.
ObjectDatumID:=ObjectModel.ObjectDatumID;
//.
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(ObjectLogFileName);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if VersionNode <> nil
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Exit; //. ->
OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
//.
GetMem(ptrNewTrack,SizeOf(TGeoObjectTrack));
try
FillChar(ptrNewTrack^, SizeOf(TGeoObjectTrack), #0);
with TGeoObjectTrack(ptrNewTrack^) do begin
Next:=nil;
TrackName:=pTrackName;
flEnabled:=true;
//.
DatumID:=ObjectDatumID;
//.
Nodes:=nil;
ptrptrLastTrackNode:=@Nodes;
//.
ObjectModelEvents:=nil;
ptrptrLastTrackObjectModelEvent:=@ObjectModelEvents;
//.
BusinessModelEvents:=nil;
//.
Color:=pTrackColor;
CoComponentID:=0;
end;
CrdSysConvertor:=nil;
try
for I:=0 to OperationsLogNode.childNodes.length-1 do begin
  OperationsLogItemNode:=OperationsLogNode.childNodes[I];
  OperationsLogItem:=OperationsLogItemNode.nodeName;
  if ((OperationsLogItem = 'SET') OR (OperationsLogItem = 'GET'))
   then begin
    flSetCommand:=(OperationsLogItem = 'SET');
    ElementAddress:=TSchemaComponent.GetAddressFromString(OperationsLogItemNode.selectSingleNode('Component').nodeTypedValue);
    AddressIndex:=0;
    ObjectModelElement:=ObjectModel.ObjectDeviceSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex);
    if (ObjectModelElement <> nil)
     then begin
      TimeStamp:=OperationsLogItemNode.selectSingleNode('Time').nodeTypedValue;
      ObjectModelElement.FromXMLNodeByAddress(ElementAddress, AddressIndex, OperationsLogItemNode);
      ptrTrackNode:=ObjectModelElement.ToTrackNode;
      ptrTrackEvent:=ObjectModelElement.ToTrackEvent;
      //. add new track node
      if (ptrTrackNode <> nil)
       then begin
        TObjectTrackNode(ptrTrackNode^).TimeStamp:=TimeStamp;
        //. prepare node local X,Y 
        TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(ObjectDatumID, TObjectTrackNode(ptrTrackNode^).Latitude,TObjectTrackNode(ptrTrackNode^).Longitude,TObjectTrackNode(ptrTrackNode^).Altitude,  GeoSpaceDatumID,  _Lat,_Long,_Alt);
        //. get appropriate geo coordinate system
        with TTGeoCrdSystemFunctionality.Create do
        try
        GetInstanceByLatLongLocally(Convertor.GeoSpaceID, _Lat,_Long,  idGeoCrdSystem);
        finally
        Release;
        end;
        if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
         then begin
          FreeAndNil(CrdSysConvertor);
          //.
          if (idGeoCrdSystem <> 0)
           then begin
            CrdSysConvertor:=TCrdSysConvertor.Create(Convertor.Reflector.Space,idGeoCrdSystem);
            flTransformPointsLoaded:=false;
            end;
          end;
        if (CrdSysConvertor <> nil)
         then begin
          ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
          if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
           then begin
            CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
            flTransformPointsLoaded:=true;
            end;
          //.
          CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, _X,_Y);
          TObjectTrackNode(ptrTrackNode^).X:=_X;
          TObjectTrackNode(ptrTrackNode^).Y:=_Y;
          //. insert new node to the list 
          Pointer(ptrptrLastTrackNode^):=ptrTrackNode;
          ptrptrLastTrackNode:=@TObjectTrackNode(ptrTrackNode^).Next;
          end
         else FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
        end;
      //. add new track event
      if (ptrTrackEvent <> nil)
       then begin
        TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=TimeStamp;
        if (flSetCommand)
         then TObjectTrackEvent(ptrTrackEvent^).EventMessage:='SET '+TObjectTrackEvent(ptrTrackEvent^).EventMessage
         else TObjectTrackEvent(ptrTrackEvent^).EventMessage:='GET '+TObjectTrackEvent(ptrTrackEvent^).EventMessage;
        //. add new event to the list
        Pointer(ptrptrLastTrackObjectModelEvent^):=ptrTrackEvent;
        ptrptrLastTrackObjectModelEvent:=@TObjectTrackEvent(ptrTrackEvent^).Next;
        end;
      end;
    end;
  end;
//. calculating X,Y for object model events
ptrApproxNode1:=TGeoObjectTrack(ptrNewTrack^).Nodes;
if (ptrApproxNode1 <> nil)
 then begin
  ptrApproxNode0:=nil;
  ptrTrackEvent:=TGeoObjectTrack(ptrNewTrack^).ObjectModelEvents;
  while (ptrTrackEvent <> nil) do with TObjectTrackEvent(ptrTrackEvent^) do begin
    while (NOT ((ptrApproxNode1 = nil) OR (TimeStamp < TObjectTrackNode(ptrApproxNode1^).TimeStamp))) do begin
      ptrApproxNode0:=ptrApproxNode1;
      ptrApproxNode1:=TObjectTrackNode(ptrApproxNode1^).Next;
      end;
    if (ptrApproxNode0 = nil)
     then begin
      X:=TObjectTrackNode(ptrApproxNode1^).X;
      Y:=TObjectTrackNode(ptrApproxNode1^).Y;
      end
     else
      if (ptrApproxNode1 = nil)
       then begin
        X:=TObjectTrackNode(ptrApproxNode0^).X;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y;
        end
       else begin //. linear approximation by time
        F:=(TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp)/(TObjectTrackNode(ptrApproxNode1^).TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp);
        X:=TObjectTrackNode(ptrApproxNode0^).X+(TObjectTrackNode(ptrApproxNode1^).X-TObjectTrackNode(ptrApproxNode0^).X)*F;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y+(TObjectTrackNode(ptrApproxNode1^).Y-TObjectTrackNode(ptrApproxNode0^).Y)*F;
        end;
    //. next event
    ptrTrackEvent:=Next;
    end;
  end;
finally
CrdSysConvertor.Free;
end;
except
  TObjectModel.Log_DestroyTrack(ptrNewTrack);
  Raise; //. =>
  end;
Lock.Enter;
try
//.
TGeoObjectTrack(ptrNewTrack^).ID:=GetNextTrackID();
TGeoObjectTrack(ptrNewTrack^).Next:=Tracks;
Tracks:=ptrNewTrack;
Inc(TracksChangesCount);
Inc(ChangesCount);
Inc(ItemsTracksChangesCount);
//.
Result:=ptrNewTrack;
Save();
finally
Lock.Leave;
end;
finally
ObjectModel.Destroy;
end;
finally
ServerObjectController.Destroy;
end;
UpdateReflectorView();
end;

function TGeoObjectTracks.AddNewTrackFromGeoDataStream(const GeoDataStream: TMemoryStream; const GeoDataDatumID: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer): pointer;
type
  TGeoDataItem = packed record
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
  end;

var
  GeoSpaceDatumID: integer;
  GeoDataItem: TGeoDataItem;
  GeoDataItemsCount: integer;
  ptrNewTrack: pointer;
  ptrptrLastTrackItem: pointer;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  CrdSysConvertor: TCrdSysConvertor;
  flTransformPointsLoaded: boolean;
  I: integer;
  _X,_Y: Extended;
  ptrNewTrackItem: pointer;
  ptrTrack: pointer;
begin
GetMem(ptrNewTrack,SizeOf(TGeoObjectTrack));
try
FillChar(ptrNewTrack^, SizeOf(TGeoObjectTrack), #0);
with TGeoObjectTrack(ptrNewTrack^) do begin
Next:=nil;
TrackName:=pTrackName;
flEnabled:=true;
Nodes:=nil;
ptrptrLastTrackItem:=@Nodes;
Color:=pTrackColor;
CoComponentID:=TrackCoComponentID;
end;
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,Convertor.GeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//.
CrdSysConvertor:=nil;
try
GeoDataItemsCount:=(GeoDataStream.Size DIV SizeOf(TGeoDataItem));
GeoDataStream.Position:=0;
for I:=0 to GeoDataItemsCount-1 do begin
  GeoDataStream.Read(GeoDataItem,SizeOf(GeoDataItem));
  //.
  TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(GeoDataDatumID, GeoDataItem.Latitude,GeoDataItem.Longitude,GeoDataItem.Altitude,  GeoSpaceDatumID,  _Lat,_Long,_Alt);
  GeoDataItem.Latitude:=_Lat;
  GeoDataItem.Longitude:=_Long;
  GeoDataItem.Altitude:=_Alt;
  //. get appropriate geo coordinate system
  with TTGeoCrdSystemFunctionality.Create do
  try
  GetInstanceByLatLongLocally(Convertor.GeoSpaceID, GeoDataItem.Latitude,GeoDataItem.Longitude,  idGeoCrdSystem);
  finally
  Release;
  end;
  if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
   then begin
    FreeAndNil(CrdSysConvertor);
    //.
    if (idGeoCrdSystem <> 0)
     then begin
      CrdSysConvertor:=TCrdSysConvertor.Create(Convertor.Reflector.Space,idGeoCrdSystem);
      flTransformPointsLoaded:=false;
      end;
    end;
  if (CrdSysConvertor <> nil)
   then begin
    ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
    if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(GeoDataItem.Latitude,GeoDataItem.Longitude)))
     then begin
      CrdSysConvertor.GeoToXY_LoadPoints(GeoDataItem.Latitude,GeoDataItem.Longitude);
      flTransformPointsLoaded:=true;
      end;
    //.
    CrdSysConvertor.ConvertGeoToXY(GeoDataItem.Latitude,GeoDataItem.Longitude, _X,_Y);
    GetMem(ptrNewTrackItem,SizeOf(TObjectTrackNode));
    with TObjectTrackNode(ptrNewTrackItem^) do begin
    Next:=nil;
    TimeStamp:=GeoDataItem.TimeStamp;
    X:=_X;
    Y:=_Y;
    end;
    Pointer(ptrptrLastTrackItem^):=ptrNewTrackItem;
    ptrptrLastTrackItem:=@TObjectTrackNode(ptrNewTrackItem^).Next;
    end;
  end;
finally
CrdSysConvertor.Free;
end;
except
  TObjectModel.Log_DestroyTrack(ptrNewTrack);
  Raise; //. =>
  end;
//. try to remove item with the same name
ptrTrack:=GetTrackByName(pTrackName);
if (ptrTrack <> nil) then RemoveTrack(ptrTrack);
//.
Lock.Enter;
try
//.
TGeoObjectTrack(ptrNewTrack^).ID:=GetNextTrackID();
TGeoObjectTrack(ptrNewTrack^).Next:=Tracks;
Tracks:=ptrNewTrack;
Inc(TracksChangesCount);
Inc(ChangesCount);
Inc(ItemsTracksChangesCount);
//.
Result:=ptrNewTrack;
Save();
finally
Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TGeoObjectTracks.InsertTrack(const ptrTrack: pointer);
var
  ptrSameTrack: pointer;
begin
with TGeoObjectTrack(ptrTrack^) do 
if (StopsAndMovementsAnalysis = nil)
 then begin
  StopsAndMovementsAnalysis:=TTrackStopsAndMovementsAnalysis.Create();
  TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).Process(ptrTrack);
  end;
RecalculateTrackBindings(ptrTrack);
//. try to remove item with the same name
ptrSameTrack:=GetTrackByName(TGeoObjectTrack(ptrTrack^).TrackName);
if (ptrSameTrack <> nil) then RemoveTrack(ptrSameTrack);
//.
Lock.Enter();
try
//.
with TGeoObjectTrack(ptrTrack^) do begin
ID:=GetNextTrackID();
Reflection_IntervalDuration:=0.0;
Reflection_flShowTrack:=AnalysisDefaults.Reflection_flShowTrack;
Reflection_flShowTrackNodes:=AnalysisDefaults.Reflection_flShowTrackNodes;
Reflection_flSpeedColoredTrack:=AnalysisDefaults.Reflection_flSpeedColoredTrack;
Reflection_flShowStopsAndMovementsGraph:=AnalysisDefaults.Reflection_flShowStopsAndMovementsGraph;
Reflection_flHideMovementsGraph:=AnalysisDefaults.Reflection_flHideMovementsGraph;
Reflection_flShowObjectModelEvents:=AnalysisDefaults.Reflection_flShowObjectModelEvents;
Reflection_flShowBusinessModelEvents:=AnalysisDefaults.Reflection_flShowBusinessModelEvents;
end;
//.
TGeoObjectTrack(ptrTrack^).Next:=Tracks;
Tracks:=ptrTrack;
//.
Inc(TracksChangesCount);
Inc(ChangesCount);
Inc(ItemsTracksChangesCount);
//.
Save();
finally
Lock.Leave();
end;
UpdateReflectorView();
end;

procedure TGeoObjectTracks.RemoveTrack(const ptrRemoveTrack: pointer);
var
  flRemoved: boolean;
  ptrptrItem: pointer;
  ptrRemoveItem: pointer;
begin
flRemoved:=false;
Lock.Enter;
try
ptrptrItem:=@Tracks;
while (Pointer(ptrptrItem^) <> nil) do begin
  ptrRemoveItem:=Pointer(ptrptrItem^);
  if (ptrRemoveItem = ptrRemoveTrack)
   then begin
    Pointer(ptrptrItem^):=TGeoObjectTrack(ptrRemoveItem^).Next;
    TObjectModel.Log_DestroyTrack(ptrRemoveItem);
    flRemoved:=true;
    Break; //. >
    end
   else ptrptrItem:=@TGeoObjectTrack(ptrRemoveItem^).Next;
  end;
Inc(TracksChangesCount);
Inc(ChangesCount);
Inc(ItemsTracksChangesCount);
//.
if (flRemoved)
 then begin
  if (ptrRemoveTrack = SelectedTrackNode.ptrTrack)
   then begin
    SelectedTrackNode.ptrTrack:=nil;
    SelectedTrackNode.NodePtr:=nil;
    SelectedTrackNode.NodeIndex:=-1;
    //.
    SelectedTrackStopOrMovementInterval.ptrTrack:=nil;
    SelectedTrackStopOrMovementInterval.IntervalPtr:=nil;
    SelectedTrackStopOrMovementInterval.IntervalIndex:=-1;
    end;
  Save();
  end;
finally
Lock.Leave;
end;
if (flRemoved) then UpdateReflectorView();
end;

procedure TGeoObjectTracks.RecalculateTrackBindings(const ptrTrack: pointer);
var
  ptrTrackNode: pointer;
  CrdSysConvertor: TCrdSysConvertor;
  flTransformPointsLoaded: boolean;
  Latitude,Longitude,Altitude: Extended;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  _X,_Y: Extended;
  I: integer;
  ptrTrackEvent: pointer;
  ptrApproxNode0,ptrApproxNode1: pointer;
  F: double;
begin
if (Convertor.GeoSpaceDatumID = 0) then Exit; //. ->
with TGeoObjectTrack(ptrTrack^) do begin
//. process track nodes for new X,Y
CrdSysConvertor:=nil;
try
ptrTrackNode:=Nodes;
while (ptrTrackNode <> nil) do with TObjectTrackNode(ptrTrackNode^) do begin
  //. prepare node local X,Y
  TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Latitude,Longitude,Altitude,  Convertor.GeoSpaceDatumID,  _Lat,_Long,_Alt);
  //. get appropriate geo coordinate system
  with TTGeoCrdSystemFunctionality.Create do
  try
  GetInstanceByLatLongLocally(Convertor.GeoSpaceID, _Lat,_Long,  idGeoCrdSystem);
  finally
  Release;
  end;
  if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
   then begin
    FreeAndNil(CrdSysConvertor);
    //.
    if (idGeoCrdSystem <> 0)
     then begin
      CrdSysConvertor:=TCrdSysConvertor.Create(Convertor.Reflector.Space,idGeoCrdSystem);
      flTransformPointsLoaded:=false;
      end;
    end;
  if (CrdSysConvertor <> nil)
   then begin
    ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
    if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
     then begin
      CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
      flTransformPointsLoaded:=true;
      end;
    //.
    CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, _X,_Y);
    //. set new X,Y
    X:=_X;
    Y:=_Y;
    end;
  //. next node
  ptrTrackNode:=Next;
  end;
//. recalculating 
if (StopsAndMovementsAnalysis <> nil)
 then with TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis) do
  for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do begin
    Latitude:=Position.Latitude;
    Longitude:=Position.Longitude;
    //.
    if (NOT flMovement AND (I < (Items.Count-1)))
     then begin //. position to center of stop
      Latitude:=(Latitude+TTrackStopsAndMovementsAnalysisInterval(Items[I+1]).Position.Latitude)/2.0;
      Longitude:=(Longitude+TTrackStopsAndMovementsAnalysisInterval(Items[I+1]).Position.Longitude)/2.0;
      end;
    //. prepare node local X,Y
    TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Latitude,Longitude,0.0{Altitude},  Convertor.GeoSpaceDatumID,  _Lat,_Long,_Alt);
    //. get appropriate geo coordinate system
    with TTGeoCrdSystemFunctionality.Create do
    try
    GetInstanceByLatLongLocally(Convertor.GeoSpaceID, _Lat,_Long,  idGeoCrdSystem);
    finally
    Release;
    end;
    if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
     then begin
      FreeAndNil(CrdSysConvertor);
      //.
      if (idGeoCrdSystem <> 0)
       then begin
        CrdSysConvertor:=TCrdSysConvertor.Create(Convertor.Reflector.Space,idGeoCrdSystem);
        flTransformPointsLoaded:=false;
        end;
      end;
    if (CrdSysConvertor <> nil)
     then begin
      ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
      if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
       then begin
        CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
        flTransformPointsLoaded:=true;
        end;
      //.
      CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, _X,_Y);
      //. set new X,Y
      Position.X:=_X;
      Position.Y:=_Y;
      end;
    end;
//. recalculating X,Y for object model events
ptrApproxNode1:=Nodes;
if (ptrApproxNode1 <> nil)
 then begin
  ptrApproxNode0:=nil;
  ptrTrackEvent:=ObjectModelEvents;
  while (ptrTrackEvent <> nil) do with TObjectTrackEvent(ptrTrackEvent^) do begin
    while (NOT ((ptrApproxNode1 = nil) OR (TimeStamp < TObjectTrackNode(ptrApproxNode1^).TimeStamp))) do begin
      ptrApproxNode0:=ptrApproxNode1;
      ptrApproxNode1:=TObjectTrackNode(ptrApproxNode1^).Next;
      end;
    if (ptrApproxNode0 = nil)
     then begin
      X:=TObjectTrackNode(ptrApproxNode1^).X;
      Y:=TObjectTrackNode(ptrApproxNode1^).Y;
      end
     else
      if (ptrApproxNode1 = nil)
       then begin
        X:=TObjectTrackNode(ptrApproxNode0^).X;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y;
        end
       else begin
        if (NOT flBelongsToLastLocation)
         then begin//. linear approximation by time
          F:=(TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp)/(TObjectTrackNode(ptrApproxNode1^).TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp);
          X:=TObjectTrackNode(ptrApproxNode0^).X+(TObjectTrackNode(ptrApproxNode1^).X-TObjectTrackNode(ptrApproxNode0^).X)*F;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y+(TObjectTrackNode(ptrApproxNode1^).Y-TObjectTrackNode(ptrApproxNode0^).Y)*F;
          end
         else begin
          X:=TObjectTrackNode(ptrApproxNode0^).X;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y;
          end;
        end;
    //. next event
    ptrTrackEvent:=Next;
    end;
  end;
//. recalculating X,Y for business model events
ptrApproxNode1:=Nodes;
if (ptrApproxNode1 <> nil)
 then begin
  ptrApproxNode0:=nil;
  ptrTrackEvent:=BusinessModelEvents;
  while (ptrTrackEvent <> nil) do with TObjectTrackEvent(ptrTrackEvent^) do begin
    while (NOT ((ptrApproxNode1 = nil) OR (TimeStamp < TObjectTrackNode(ptrApproxNode1^).TimeStamp))) do begin
      ptrApproxNode0:=ptrApproxNode1;
      ptrApproxNode1:=TObjectTrackNode(ptrApproxNode1^).Next;
      end;
    if (ptrApproxNode0 = nil)
     then begin
      X:=TObjectTrackNode(ptrApproxNode1^).X;
      Y:=TObjectTrackNode(ptrApproxNode1^).Y;
      end
     else
      if (ptrApproxNode1 = nil)
       then begin
        X:=TObjectTrackNode(ptrApproxNode0^).X;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y;
        end
       else begin
        if (NOT flBelongsToLastLocation)
         then begin//. linear approximation by time
          F:=(TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp)/(TObjectTrackNode(ptrApproxNode1^).TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp);
          X:=TObjectTrackNode(ptrApproxNode0^).X+(TObjectTrackNode(ptrApproxNode1^).X-TObjectTrackNode(ptrApproxNode0^).X)*F;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y+(TObjectTrackNode(ptrApproxNode1^).Y-TObjectTrackNode(ptrApproxNode0^).Y)*F;
          end
         else begin
          X:=TObjectTrackNode(ptrApproxNode0^).X;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y;
          end;
        end;
    //. next event
    ptrTrackEvent:=Next;
    end;
  end;
finally
CrdSysConvertor.Free;
end;
end;
end;

function TGeoObjectTracks.GetTrackByName(const pTrackName: string): pointer;
var
  ptrTrack: pointer;
begin
Result:=nil;
Lock.Enter;
try
ptrTrack:=Tracks;
while (ptrTrack <> nil) do with TGeoObjectTrack(ptrTrack^) do begin
  if (TrackName = pTrackName)
   then begin
    Result:=ptrTrack;
    Exit; //. ->
    end;
  //. next track
  ptrTrack:=Next;
  end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.SetTrackProperties(const ptrTrack: pointer; const pTrackName: string; const pColor: TColor);
begin
Lock.Enter;
try
with TGeoObjectTrack(ptrTrack^) do begin
TrackName:=pTrackName;
Color:=pColor;
end;
Inc(TracksChangesCount);
Inc(ChangesCount);
Save();
finally
Lock.Leave;
end;
UpdateReflectorView();
end;

procedure TGeoObjectTracks.GetTrackInfo(const ptrTrack: pointer; out Size: integer; out Length: double);
var
  ptrLastItem,ptrItem: pointer;
  ZeroDouble: double;
  dL: double;
begin
Size:=0;
Length:=0.0;
ptrLastItem:=nil;
ZeroDouble:=0.0;
Lock.Enter;
try
with TGeoObjectTrack(ptrTrack^) do begin
ptrItem:=Nodes;
with TGeoCrdConverter.Create(DatumID) do
try
while (ptrItem <> nil) do begin
  if (NOT ((TObjectTrackNode(ptrItem^).Latitude = ZeroDouble) AND (TObjectTrackNode(ptrItem^).Longitude = ZeroDouble)))
   then begin
    if (ptrLastItem <> nil)
     then begin
      if (NOT ((TObjectTrackNode(ptrLastItem^).Latitude = TObjectTrackNode(ptrItem^).Latitude) AND (TObjectTrackNode(ptrLastItem^).Longitude = TObjectTrackNode(ptrItem^).Longitude)))
       then begin
        dL:=GetDistance(TObjectTrackNode(ptrLastItem^).Latitude,TObjectTrackNode(ptrLastItem^).Longitude, TObjectTrackNode(ptrItem^).Latitude,TObjectTrackNode(ptrItem^).Longitude);
        Length:=Length+dL;
        end;
      end;
    ptrLastItem:=ptrItem;
    end;
  //. next interval
  Inc(Size);
  ptrItem:=TObjectTrackNode(ptrItem^).Next;
  end;
finally
Destroy;
end;
end;
finally
Lock.Leave;
end;
end;

function TGeoObjectTracks.GetTrackSize(const ptrTrack: pointer): integer;
var
  Length: double;
begin
GetTrackInfo(ptrTrack, Result,Length);
end;

function TGeoObjectTracks.GetTrackLength(const ptrTrack: pointer): double;
var
  Size: integer;
begin
GetTrackInfo(ptrTrack, Size,Result);
end;

procedure TGeoObjectTracks.GetTrackTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
begin
Lock.Enter;
try
Track_GetTimestamps(ptrTrack,{out} BeginTime,EndTime);
finally
Lock.Leave;
end;
end;

function TGeoObjectTracks.GetTrackIntervalLength(const ptrTrack: pointer; const IntervalBegin,IntervalEnd: integer): double;
var
  ptrLastItem,ptrItem: pointer;
  NodeIndex: integer;
  dL: double;
begin
Result:=0.0;
Lock.Enter;
try
with TGeoObjectTrack(ptrTrack^) do
if (Nodes <> nil)
 then begin
  ptrLastItem:=Nodes;
  ptrItem:=TObjectTrackNode(ptrLastItem^).Next;
  if (ptrItem <> nil)
   then begin
    NodeIndex:=1;
    with TGeoCrdConverter.Create(DatumID) do
    try
    repeat
      if  ((IntervalBegin <= (NodeIndex-1)) AND (NodeIndex <= IntervalEnd))
            AND
          (NOT ((TObjectTrackNode(ptrLastItem^).Latitude = TObjectTrackNode(ptrItem^).Latitude) AND (TObjectTrackNode(ptrLastItem^).Longitude = TObjectTrackNode(ptrItem^).Longitude)))
       then begin
        dL:=GetDistance(TObjectTrackNode(ptrLastItem^).Latitude,TObjectTrackNode(ptrLastItem^).Longitude, TObjectTrackNode(ptrItem^).Latitude,TObjectTrackNode(ptrItem^).Longitude);
        Result:=Result+dL;
        end;
      //. next interval
      Inc(NodeIndex);
      ptrLastItem:=ptrItem;
      ptrItem:=TObjectTrackNode(ptrItem^).Next;
    until (ptrItem = nil);
    finally
    Destroy;
    end;
    end;
  end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.GetTrackIntervalTimestamps(const ptrTrack: pointer; const IntervalBegin,IntervalEnd: integer; out BeginTime,EndTime: TDateTime);
var
  ptrItem: pointer;
  NodeCount: integer;
begin
Lock.Enter;
try
BeginTime:=MinDouble;
EndTime:=MaxDouble;
with TGeoObjectTrack(ptrTrack^) do begin
NodeCount:=0;
ptrItem:=Nodes;
while (ptrItem <> nil) do with TObjectTrackNode(ptrItem^) do begin
  if (NodeCount >= IntervalBegin)
   then begin
    if (NodeCount = IntervalBegin)
     then BeginTime:=TimeStamp
     else
      if (NodeCount = IntervalEnd)
       then begin
        EndTime:=TimeStamp;
        Exit; //. ->
        end;
    end;
  //.
  Inc(NodeCount);
  ptrItem:=Next;
  end;
end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.GetTrackObjectModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
var
  ptrEvent: pointer;
begin
InfoEventsCounter:=0;
MinorEventsCounter:=0;
MajorEventsCounter:=0;
CriticalEventsCounter:=0;
//.
Lock.Enter;
try
with TGeoObjectTrack(ptrTrack^) do begin
ptrEvent:=ObjectModelEvents;
while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^) do begin
  case (Severity) of
  otesInfo:     Inc(InfoEventsCounter);
  otesMinor:    Inc(MinorEventsCounter);
  otesMajor:    Inc(MajorEventsCounter);
  otesCritical: Inc(CriticalEventsCounter);
  end;
  //.
  ptrEvent:=Next;
  end;
end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.GetTrackObjectModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
begin
Lock.Enter;
try
Track_GetObjectModelEventsTimestamps(ptrTrack,{out} BeginTime,EndTime);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.GetTrackBusinessModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
begin
Lock.Enter;
try
Track_GetBusinessModelEventsInfo(ptrTrack,{out} InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.GetTrackBusinessModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
begin
Lock.Enter;
try
Track_GetBusinessModelEventsTimestamps(ptrTrack,{out} BeginTime,EndTime);
finally
Lock.Leave;
end;
end;

function TGeoObjectTracks.Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const EventSeverity: TObjectTrackEventSeverity; out Events: TObjectTrackEvents): boolean;
begin
Lock.Enter;
try
Result:=unitGeoObjectTrackDecoding.Track_GetNearestBusinessModelEvents(ptrTrack, pTimeStamp,IntervalDuration, EventSeverity,{out} Events);
finally
Lock.Leave;
end;
end;

function TGeoObjectTracks.Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const TagBase,TagLength: integer; out Events: TObjectTrackEvents): boolean;
begin
Lock.Enter;
try
Result:=unitGeoObjectTrackDecoding.Track_GetNearestBusinessModelEvents(ptrTrack, pTimeStamp,IntervalDuration, TagBase,TagLength,{out} Events);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectTracks.Track_Reflection_SetInterval(const ptrTrack: pointer; const TimeStamp: TDateTime; const Duration: TDateTime);
begin
Lock.Enter();
try
with TGeoObjectTrack(ptrTrack^) do begin
Reflection_IntervalTimestamp:=Timestamp;
Reflection_IntervalDuration:=Duration;
end;
Inc(TracksChangesCount);
finally
Lock.Leave();
end;
UpdateReflectorView();
end;

procedure TGeoObjectTracks.Track_Reflection_GetFlags(const ptrTrack: pointer; out flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents: boolean);
begin
Lock.Enter();
try
with TGeoObjectTrack(ptrTrack^) do begin
flShowTrack:=Reflection_flShowTrack;
flShowTrackNodes:=Reflection_flShowTrackNodes;
flSpeedColoredTrack:=Reflection_flSpeedColoredTrack;
flShowStopsAndMovementsGraph:=Reflection_flShowStopsAndMovementsGraph;
flHideMovementsGraph:=Reflection_flHideMovementsGraph;
flShowObjectModelEvents:=Reflection_flShowObjectModelEvents;
flShowBusinessModelEvents:=Reflection_flShowBusinessModelEvents;
end;
finally
Lock.Leave();
end;
end;

procedure TGeoObjectTracks.Track_Reflection_SetFlags(const ptrTrack: pointer; const flShowTrack,flShowTrackNodes,flSpeedColoredTrack,flShowStopsAndMovementsGraph,flHideMovementsGraph,flShowObjectModelEvents,flShowBusinessModelEvents: boolean);
begin
Lock.Enter();
try
with TGeoObjectTrack(ptrTrack^) do begin
Reflection_flShowTrack:=flShowTrack;
Reflection_flShowTrackNodes:=flShowTrackNodes;
Reflection_flSpeedColoredTrack:=flSpeedColoredTrack;
Reflection_flShowStopsAndMovementsGraph:=flShowStopsAndMovementsGraph;
Reflection_flHideMovementsGraph:=flHideMovementsGraph;
Reflection_flShowObjectModelEvents:=flShowObjectModelEvents;
Reflection_flShowBusinessModelEvents:=flShowBusinessModelEvents;
end;
Inc(TracksChangesCount);
finally
Lock.Leave();
end;
UpdateReflectorView();
end;

procedure ConvertNode(const RW: TReflectionWindowStrucEx; X,Y: Extended; out Xs,Ys: Extended);
var
  QdA2: Extended;
  X_C,X_QdC,X_A1,X_QdB2: Extended;
  Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
begin
with RW do begin
X:=X*cfTransMeter;
Y:=Y*cfTransMeter;
QdA2:=sqr(X-X0)+sqr(Y-Y0);
X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
X_C:=Sqrt(X_QdC);
X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
Y_C:=Sqrt(Y_QdC);
Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
end;
end;

function InterpolateColor(Col1, Col2: longint; Frac: double): longint;
begin
Result:=Round((Col1 shr 16 and $FF) * (1 - Frac) + (Col2 shr 16 and $FF) * Frac) shl 16 + Round((Col1 shr 8 and $FF) * (1 - Frac) + (Col2 shr 8 and $FF) * Frac) shl 8 + Round((Col1 and $FF) * (1 - Frac) + (Col2 and $FF) * Frac);
end;

function SpeedColor(Speed: double): TColor;
const
  Interval0_SpeedLimit = 5.0; //. Km/h
  Interval0_LowSpeedColor = TColor($00000100);
  Interval0_HighSpeedColor = clGreen;
  //.
  Interval1_SpeedLimit = 60.0; //. Km/h
  Interval1_LowSpeedColor = clNavy;
  Interval1_HighSpeedColor = clRed;
begin
if (Speed < Interval0_SpeedLimit)
 then begin
  Result:=InterpolateColor(Interval0_LowSpeedColor,Interval0_HighSpeedColor, Speed/Interval0_SpeedLimit);
  Exit; //. ->
  end;
//.
if (Speed > Interval1_SpeedLimit) then Speed:=Interval1_SpeedLimit;
Result:=InterpolateColor(Interval1_LowSpeedColor,Interval1_HighSpeedColor, (Speed-Interval0_SpeedLimit)/(Interval1_SpeedLimit-Interval0_SpeedLimit));
end;

procedure GetTerminators(const X0,Y0,X1,Y1: Extended; const X,Y: Extended; const Dist: Extended; out TX,TY,T1X,T1Y: Extended);
var
  Line_Length: Extended;
  diffX1X0,diffY1Y0: Extended;
  V: Extended;
  S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
begin
diffX1X0:=X1-X0;
diffY1Y0:=Y1-Y0;
if Abs(diffY1Y0) > Abs(diffX1X0)
 then begin
  V:=Dist/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
  TX:=(V)+X;
  TY:=(-V)*(diffX1X0/diffY1Y0)+Y;
  T1X:=(-V)+X;
  T1Y:=(V)*(diffX1X0/diffY1Y0)+Y;
  end
 else begin
  if diffX1X0 = 0
   then begin
    TX:=X;TY:=Y;
    T1X:=X;T1Y:=Y;
    Exit; ///??? проверь последствия
    end;
  V:=Dist/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
  TY:=(V)+Y;
  TX:=(-V)*(diffY1Y0/diffX1X0)+X;
  T1Y:=(-V)+Y;
  T1X:=(V)*(diffY1Y0/diffX1X0)+X;
  end;
end;

procedure TGeoObjectTracks.ShowTracks(const pCanvas: TCanvas; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
const
  WindowZone = 100; //. расширяем зону окна, поскольку используем сплайн для отображения трека
var
  Window: TWindow;
  RW: TReflectionWindowStrucEx;

  procedure Track_Draw(const ptrTrack: pointer);

    function IsNodeVisible(const RW: TReflectionWindowStrucEx; const Xs,Ys: Extended): boolean;
    begin
    with RW do
    Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
    end;

    procedure ShowTrackNodes();

      procedure ShowNodeMarker(const Node: unitPolylineFigure.TScreenNode; const flNextNode: boolean; const NextNode: unitPolylineFigure.TScreenNode; const LightColor: TColor);
      var
        L,AL,dX,dY: Extended;
        TX,TY,T1X,T1Y: Extended;
        Triangle: array[0..2] of Windows.TPoint;
      begin
      pCanvas.Pen.Style:=psSolid;
      pCanvas.Pen.Color:=LightColor;
      pCanvas.Pen.Width:=1;
      pCanvas.Brush.Style:=bsSolid;
      pCanvas.Brush.Color:=Node.Color;
      if (flNextNode)
       then begin
        dX:=NextNode.X-Node.X; dY:=NextNode.Y-Node.Y;
        L:=Sqrt(sqr(dX)+sqr(dY)); AL:=NodeMarkerR*2;
        dX:=AL*dX/L; dY:=AL*dY/L;
        GetTerminators(Node.X,Node.Y,NextNode.X,NextNode.Y, Node.X-dX/2.0,Node.Y-dY/2.0, NodeMarkerR, {out} TX,TY,T1X,T1Y);
        //.
        Triangle[0].X:=Trunc(TX); Triangle[0].Y:=Trunc(TY);
        Triangle[1].X:=Trunc(T1X); Triangle[1].Y:=Trunc(T1Y);
        Triangle[2].X:=Trunc(Node.X+dX); Triangle[2].Y:=Trunc(Node.Y+dY);
        pCanvas.Polygon(Triangle);
        end
       else pCanvas.Ellipse(Round(Node.X)-NodeMarkerR,Round(Node.Y)-NodeMarkerR,Round(Node.X)+NodeMarkerR,Round(Node.Y)+NodeMarkerR);
      end;

    type
      TNodeColor = record
        Node: TNode;
        Color: TColor;
      end;

    var
      IntervalEndTimeStamp: TDateTime;
      ptrItem: pointer;
      Node: unitPolylineFigure.TNode;
      I: integer;
      //. spline approximated track
      XAprNodes,YAprNodes: TAprNodes;
      XSPLCoefs,YSPLCoefs: TSPLCoefs;
      Time,TimeSummary: double;
      TimeDelta: double;
      R,G,B: byte;
      ColorDelta: byte;
      LightColor: TColor;

      procedure DefaultTrackDraw;
      var
        PL: array of Windows.TPoint;
        I: integer;
      begin
      pCanvas.Pen.Width:=PolyLineWidth;
      SetLength(PL,ShowTrack_FWR.CountScreenNodes);
      for I:=0 to ShowTrack_FWR.CountScreenNodes-1 do begin
        PL[I].X:=ShowTrack_FWR.ScreenNodes[I].X;
        PL[I].Y:=ShowTrack_FWR.ScreenNodes[I].Y;
        end;
      pCanvas.Polyline(PL);
      end;

    const
      GradientPortionSize = 16;
    var
      GradientPortion: array of Windows.TPoint;
      GradientOrgSize,GradientSize,GradientIndex: integer;
      Color0,Color1: TColor;
      Color0Index,Color1Index: integer;
      J: integer;
    begin
    with TGeoObjectTrack(ptrTrack^) do
    if (Nodes <> nil)
     then begin
      IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
      ShowTrack_FWR.Clear();
      ptrItem:=Nodes;
      while (ptrItem <> nil) do with TObjectTrackNode(ptrItem^) do begin
        if (((Reflection_flShowTrack AND (Reflection_IntervalDuration = 0.0)) OR ((Reflection_IntervalTimestamp <= TimeStamp) AND (TimeStamp <= IntervalEndTimestamp))) AND (NOT ((X = 0.0) AND (Y = 0.0))))
         then begin
          ConvertNode(RW, X,Y, Node.X,Node.Y);
          Node.Color:=SpeedColor(Speed);
          ShowTrack_FWR.Insert(Node);
          end;
        //.
        ptrItem:=Next;
        end;
      ShowTrack_FWR.AttractToLimits(Window, nil);
      ShowTrack_FWR.Optimize();
      //.
      for I:=0 to ShowTrack_FWR.CountScreenNodes-1 do begin
        LightColor:=ShowTrack_FWR.ScreenNodes[I].Color;
        R:=(LightColor AND 255); G:=((LightColor SHR 8) AND 255); B:=((LightColor SHR 16) AND 255);
        ColorDelta:=R; if (G > ColorDelta) then ColorDelta:=G; if (B > ColorDelta) then ColorDelta:=B;
        ColorDelta:=255-ColorDelta;
        Inc(R,ColorDelta); Inc(G,ColorDelta); Inc(B,ColorDelta);
        LightColor:=R+(G SHL 8)+(B SHL 16); //. increase color light
        //.
        if (Reflection_flShowTrackNodes)
         then
          if (I < (ShowTrack_FWR.CountScreenNodes-1))
           then ShowNodeMarker(ShowTrack_FWR.ScreenNodes[I],true,ShowTrack_FWR.ScreenNodes[I+1],LightColor)
           else ShowNodeMarker(ShowTrack_FWR.ScreenNodes[I],false,ShowTrack_FWR.ScreenNodes[I],LightColor);
        end;
      //. show track
      if (ShowTrack_FWR.CountScreenNodes > 1)
       then begin
        pCanvas.Pen.Style:=psSolid;
        pCanvas.Pen.Color:=Color;
        pCanvas.Brush.Style:=bsClear;
        //.
        if (GetCurrentThreadID = MainThreadID)
         then DefaultTrackDraw()
         else
          try
          SetLength(XAprNodes,ShowTrack_FWR.CountScreenNodes);
          SetLength(YAprNodes,ShowTrack_FWR.CountScreenNodes);
          //.
          TimeDelta:=10*(1/(3600.0*24));
          TimeSummary:=TimeDelta*(ShowTrack_FWR.CountScreenNodes-1);
          Time:=Now;
          for I:=0 to ShowTrack_FWR.CountScreenNodes-1 do begin
            ///? Time:=TimeStamp;
            XAprNodes[I].X:=Time;
            XAprNodes[I].Y:=ShowTrack_FWR.ScreenNodes[I].X;
            YAprNodes[I].X:=Time;
            YAprNodes[I].Y:=ShowTrack_FWR.ScreenNodes[I].Y;
            Time:=Time+TimeDelta;
            end;
          {///? last versionTimeSummary:=0;
          XAprNodes[0].X:=TimeSummary;
          XAprNodes[0].Y:=ShowTrack_FWR.ScreenNodes[0].X;
          +YAprNodes[0].X:=TimeSummary;
          YAprNodes[0].Y:=ShowTrack_FWR.ScreenNodes[0].Y;
          for I:=1 to ShowTrack_FWR.CountScreenNodes-1 do begin
            TimeSummary:=TimeSummary+Sqrt(sqr(ShowTrack_FWR.ScreenNodes[I].X-ShowTrack_FWR.ScreenNodes[I-1].X)+sqr(ShowTrack_FWR.ScreenNodes[I].Y-ShowTrack_FWR.ScreenNodes[I-1].Y));
            XAprNodes[I].X:=TimeSummary;
            XAprNodes[I].Y:=ShowTrack_FWR.ScreenNodes[I].X;
            YAprNodes[I].X:=TimeSummary;
            YAprNodes[I].Y:=ShowTrack_FWR.ScreenNodes[I].Y;
            end;}
          //.
          GetQubeSPLCoefficients(XAprNodes, 0{LAMBDA0},0{MUN}, 0{ADiff},0{BDiff},  {out} XSPLCoefs);
          GetQubeSPLCoefficients(YAprNodes, 0{LAMBDA0},0{MUN}, 0{ADiff},0{BDiff},  {out} YSPLCoefs);
          //.
          TimeDelta:=TimeSummary/MaxPointsPerSpline;
          ShowTrack_FWR.Clear();
          Time:=XAprNodes[0].X;
          for I:=0 to Length(XSPLCoefs)-1 do begin
            ///? TimeDelta:=(XAprNodes[I+1].X-XAprNodes[I].X)/10.0;
            while (Time <= XAprNodes[I+1].X) do begin
              Node.X:=SPL(XSPLCoefs[I], XAprNodes[I].X,XAprNodes[I].Y, Time);
              Node.Y:=SPL(YSPLCoefs[I], YAprNodes[I].X,YAprNodes[I].Y, Time);
              Node.Color:=ShowTrack_FWR.ScreenNodes[I].Color;
              ShowTrack_FWR.Insert(Node);
              //.
              Time:=Time+TimeDelta;
              end;
            end;
          ShowTrack_FWR.AttractToLimits(Window, nil);
          ShowTrack_FWR.Optimize();
          //.
          pCanvas.Pen.Width:=SplineLineWidth;
          Color0Index:=0;
          Color0:=ShowTrack_FWR.ScreenNodes[0].Color;
          I:=1;
          while (I < ShowTrack_FWR.CountScreenNodes) do begin
            if (ShowTrack_FWR.ScreenNodes[I].Color <> Color0)
             then begin
              Color1:=ShowTrack_FWR.ScreenNodes[I].Color;
              Color1Index:=I;
              //.
              GradientOrgSize:=Color1Index-Color0Index+1;
              GradientSize:=GradientOrgSize;
              GradientIndex:=0;
              SetLength(GradientPortion,GradientPortionSize);
              while (GradientSize >= GradientPortionSize) do begin
                for J:=0 to GradientPortionSize-1 do begin
                  GradientPortion[J].X:=ShowTrack_FWR.ScreenNodes[Color0Index+GradientIndex+J].X;
                  GradientPortion[J].Y:=ShowTrack_FWR.ScreenNodes[Color0Index+GradientIndex+J].Y;
                  end;
                //.
                if (Reflection_flSpeedColoredTrack)
                 then pCanvas.Pen.Color:=InterpolateColor(Color0,Color1,GradientIndex/GradientOrgSize)
                 else pCanvas.Pen.Color:=Color;
                pCanvas.Pen.Width:=SplineLineWidth;
                pCanvas.Polyline(GradientPortion);
                //.
                LightColor:=pCanvas.Pen.Color;
                R:=(LightColor AND 255); G:=((LightColor SHR 8) AND 255); B:=((LightColor SHR 16) AND 255);
                ColorDelta:=R; if (G > ColorDelta) then ColorDelta:=G; if (B > ColorDelta) then ColorDelta:=B;
                ColorDelta:=255-ColorDelta; ColorDelta:=(ColorDelta SHR 1);
                Inc(R,ColorDelta); Inc(G,ColorDelta); Inc(B,ColorDelta);
                LightColor:=R+(G SHL 8)+(B SHL 16); //. increase color light
                pCanvas.Pen.Color:=LightColor;
                pCanvas.Pen.Width:=1;
                pCanvas.Polyline(GradientPortion);
                //.
                Inc(GradientIndex,GradientPortionSize-1);
                Dec(GradientSize,GradientPortionSize-1);
                end;
              if (GradientSize > 0)
               then begin
                SetLength(GradientPortion,GradientSize);
                for J:=0 to GradientSize-1 do begin
                  GradientPortion[J].X:=ShowTrack_FWR.ScreenNodes[Color0Index+GradientIndex+J].X;
                  GradientPortion[J].Y:=ShowTrack_FWR.ScreenNodes[Color0Index+GradientIndex+J].Y;
                  end;
                //.
                if (Reflection_flSpeedColoredTrack)
                 then pCanvas.Pen.Color:=InterpolateColor(Color0,Color1,GradientIndex/GradientOrgSize)
                 else pCanvas.Pen.Color:=Color;
                pCanvas.Pen.Width:=SplineLineWidth;
                pCanvas.Polyline(GradientPortion);
                //.
                LightColor:=pCanvas.Pen.Color;
                R:=(LightColor AND 255); G:=((LightColor SHR 8) AND 255); B:=((LightColor SHR 16) AND 255);
                ColorDelta:=R; if (G > ColorDelta) then ColorDelta:=G; if (B > ColorDelta) then ColorDelta:=B;
                ColorDelta:=255-ColorDelta; ColorDelta:=(ColorDelta SHR 1);
                Inc(R,ColorDelta); Inc(G,ColorDelta); Inc(B,ColorDelta);
                LightColor:=R+(G SHL 8)+(B SHL 16); //. increase color light
                pCanvas.Pen.Color:=LightColor;
                pCanvas.Pen.Width:=1;
                pCanvas.Polyline(GradientPortion);
                end;
              //.
              Color0:=Color1;
              Color0Index:=Color1Index;
              end;
            //.
            Inc(I);
            end;
          //.
          GradientSize:=I-Color0Index;
          SetLength(GradientPortion,GradientSize);
          for J:=0 to GradientSize-1 do begin
            GradientPortion[J].X:=ShowTrack_FWR.ScreenNodes[Color0Index+J].X;
            GradientPortion[J].Y:=ShowTrack_FWR.ScreenNodes[Color0Index+J].Y;
            end;
          //.
          pCanvas.Pen.Color:=Color0;
          pCanvas.Pen.Width:=SplineLineWidth;
          pCanvas.Polyline(GradientPortion);
          //.
          LightColor:=pCanvas.Pen.Color;
          R:=(LightColor AND 255); G:=((LightColor SHR 8) AND 255); B:=((LightColor SHR 16) AND 255);
          ColorDelta:=R; if (G > ColorDelta) then ColorDelta:=G; if (B > ColorDelta) then ColorDelta:=B;
          ColorDelta:=255-ColorDelta; ColorDelta:=(ColorDelta SHR 1);
          Inc(R,ColorDelta); Inc(G,ColorDelta); Inc(B,ColorDelta);
          LightColor:=R+(G SHL 8)+(B SHL 16); //. increase color light
          pCanvas.Pen.Color:=LightColor;
          pCanvas.Pen.Width:=1;
          pCanvas.Polyline(GradientPortion);
          except
            DefaultTrackDraw();
            end;
        end;
      end;
    end;

    procedure ShowEventMarker(const NX,NY: integer);
    const
      MarkerR = 2;
    var
      NodeStr: string;
    begin
    pCanvas.Pen.Style:=psSolid;
    pCanvas.Pen.Color:=clBlack;
    pCanvas.Pen.Width:=1;
    pCanvas.Brush.Style:=bsSolid;
    pCanvas.Brush.Color:=clYellow;
    pCanvas.Rectangle(NX-MarkerR,NY-MarkerR,NX+MarkerR,NY+MarkerR);
    end;

    procedure DrawEventHint(const pCanvas: TCanvas; const X,Y: integer; const TimeStamp: TDateTime; const Caption: string; const Description: string; const SeverityColor,SeverityFontColor: TColor; out ExtentRight: integer);
    const
      ExtentOffset = 3;
      CaptionFontSize = 10;
      CaptionHeight = 16;
      TimeStampFontSize = 8;
      TimeStampHeight = 16;
      CaptionAndTimeStampFreeSpace = 24;
      DescriptionFontSize = 10;
      DescriptionDelimiterSize = 3;
      MinTextWidth = 200;
      PointerOfsY = 16;
      PointerOfsX = ExtentOffset+CaptionHeight+DescriptionDelimiterSize;
    var
      TimeStampStr: string;
      Color: TColor;
      Left,Top: integer;
      Right,Bottom: integer;
      CaptionExtent,TimeStampExtent,DescriptionExtent: TRect;
      TimeStampExtentWidth: integer;
      PointerRadius: integer;
      ClippingRegion,ClippingRegion1,ClippingRegion2,ClippingRegion3: HRGN;
      PenStyleOld: TPenStyle;
      BrushStyleOld: TBrushStyle;
    begin
    TimeStampStr:='['+FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp)+']';
    //.
    Color:=clInfoBk;
    //. calculate Left-Top
    Left:=X;
    Top:=Y-PointerOfsY;
    //. calculate caption extent
    CaptionExtent.Left:=Left+PointerOfsX+ExtentOffset;
    CaptionExtent.Top:=Top+ExtentOffset;
    CaptionExtent.Right:=CaptionExtent.Left+MinTextWidth;
    CaptionExtent.Bottom:=CaptionExtent.Top+CaptionHeight;
    pCanvas.Font.Name:='Tahoma';
    pCanvas.Font.Size:=CaptionFontSize;
    pCanvas.Font.Style:=[fsBold];
    DrawText(pCanvas.Handle, PChar(Caption), Length(Caption), CaptionExtent, DT_LEFT OR DT_VCENTER OR DT_SINGLELINE OR DT_CALCRECT);
    CaptionExtent.Bottom:=CaptionExtent.Top+CaptionHeight;
    //. calculate timestamp extent
    TimeStampExtent.Left:=CaptionExtent.Left;
    TimeStampExtent.Top:=CaptionExtent.Top;
    TimeStampExtent.Right:=CaptionExtent.Right;
    TimeStampExtent.Bottom:=CaptionExtent.Bottom;
    pCanvas.Font.Name:='Tahoma';
    pCanvas.Font.Size:=TimeStampFontSize;
    pCanvas.Font.Style:=[fsBold];
    DrawText(pCanvas.Handle, PChar(TimeStampStr), Length(TimeStampStr), TimeStampExtent, DT_RIGHT OR DT_VCENTER OR DT_SINGLELINE OR DT_CALCRECT);
    TimeStampExtent.Bottom:=TimeStampExtent.Top+CaptionHeight;
    TimeStampExtentWidth:=TimeStampExtent.Right-TimeStampExtent.Left;
    TimeStampExtent.Left:=CaptionExtent.Right+CaptionAndTimeStampFreeSpace;
    TimeStampExtent.Right:=TimeStampExtent.Left+TimeStampExtentWidth;
    CaptionExtent.Right:=TimeStampExtent.Right;
    //.
    if ((CaptionExtent.Right-CaptionExtent.Left) < MinTextWidth)
     then begin
      CaptionExtent.Right:=CaptionExtent.Left+MinTextWidth;
      TimeStampExtent.Right:=CaptionExtent.Right;
      TimeStampExtent.Left:=TimeStampExtent.Right-TimeStampExtentWidth;
      end;
    //. calculate description extent
    DescriptionExtent.Left:=Left+PointerOfsX+ExtentOffset;
    DescriptionExtent.Top:=CaptionExtent.Bottom+DescriptionDelimiterSize;
    DescriptionExtent.Right:=CaptionExtent.Right;
    DescriptionExtent.Bottom:=DescriptionExtent.Top+32{it will be resized};
    pCanvas.Font.Name:='Tahoma';
    pCanvas.Font.Size:=DescriptionFontSize;
    pCanvas.Font.Style:=[];
    DrawText(pCanvas.Handle, PChar(Description), Length(Description), DescriptionExtent, DT_LEFT OR DT_WORDBREAK OR DT_CALCRECT);
    //. ajust summary size
    if (DescriptionExtent.Right > CaptionExtent.Right)
     then begin
      CaptionExtent.Right:=DescriptionExtent.Right;
      TimeStampExtent.Right:=CaptionExtent.Right;
      TimeStampExtent.Left:=TimeStampExtent.Right-TimeStampExtentWidth;
      end;
    Right:=CaptionExtent.Right+ExtentOffset;
    Bottom:=DescriptionExtent.Bottom+ExtentOffset;
    //.
    PointerRadius:=PointerOfsY;
    try
    ClippingRegion:=CreateEllipticRgn(Left-PointerOfsX,Top+PointerOfsY-1,Left+PointerOfsX+1,Top+PointerOfsY+2*PointerRadius);
    try
    if (PointerOfsY > 0) then ClippingRegion1:=CreateEllipticRgn(Left-PointerOfsX,Top+PointerOfsY-2*PointerRadius,Left+PointerOfsX+1,Top+PointerOfsY);
    try
    ClippingRegion2:=CreateRectRgn(Left-1,Top+PointerOfsY+PointerRadius-2,Left+PointerOfsX,Bottom+1);
    try
    ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_DIFF);
    if (PointerOfsY > 0) then ExtSelectClipRgn(pCanvas.Handle, ClippingRegion1, RGN_DIFF);
    ExtSelectClipRgn(pCanvas.Handle, ClippingRegion2, RGN_DIFF);
    //. drawing
    pCanvas.Brush.Color:=Color;
    pCanvas.Pen.Color:=pCanvas.Brush.Color;
    pCanvas.Rectangle(Left,Top,Right,Bottom);
    PenStyleOld:=pCanvas.Pen.Style;
    BrushStyleOld:=pCanvas.Brush.Style;
    try
    pCanvas.Pen.Color:=clBlack;
    pCanvas.Pen.Style:=psDot;
    pCanvas.Brush.Style:=bsClear;
    pCanvas.Rectangle(Rect(Left+PointerOfsX+1,Top+1,Right-1,Bottom-1));
    finally
    pCanvas.Brush.Style:=BrushStyleOld;
    pCanvas.Pen.Style:=PenStyleOld;
    end;
    //. draw caption
    pCanvas.Font.Size:=CaptionFontSize;
    pCanvas.Font.Color:=SeverityFontColor;
    pCanvas.Brush.Color:=SeverityColor;
    pCanvas.Pen.Color:=pCanvas.Brush.Color;
    pCanvas.Font.Style:=[fsBold];
    pCanvas.Rectangle(CaptionExtent);
    DrawText(pCanvas.Handle, PChar(Caption), Length(Caption), CaptionExtent, DT_LEFT OR DT_VCENTER OR DT_SINGLELINE);
    //. draw timestamp
    pCanvas.Font.Size:=TimeStampFontSize;
    pCanvas.Font.Color:=clSilver;
    pCanvas.Brush.Color:=SeverityColor;
    pCanvas.Pen.Color:=pCanvas.Brush.Color;
    pCanvas.Font.Style:=[fsBold];
    DrawText(pCanvas.Handle, PChar(TimeStampStr), Length(TimeStampStr), TimeStampExtent, DT_LEFT OR DT_VCENTER OR DT_SINGLELINE);
    //. draw description
    pCanvas.Font.Size:=DescriptionFontSize;
    pCanvas.Font.Color:=clBlack;
    pCanvas.Brush.Color:=Color;
    pCanvas.Pen.Color:=pCanvas.Brush.Color;
    pCanvas.Font.Style:=[];
    DrawText(pCanvas.Handle, PChar(Description), Length(Description), DescriptionExtent, DT_LEFT OR DT_WORDBREAK);
    finally
    DeleteObject(ClippingRegion2);
    end;
    finally
    if (PointerOfsY > 0) then DeleteObject(ClippingRegion1);
    end;
    finally
    DeleteObject(ClippingRegion);
    end;
    finally
    SelectClipRgn(pCanvas.Handle, 0);
    end;
    //.
    ExtentRight:=Right;
    end;

    procedure ShowTrackObjectModelEvents();
    var
      IntervalEndTimestamp: TDateTime;
      ptrEvent: pointer;
      ptrLastEvent: pointer;
      LastEventExtentRight: integer;
      Xs,Ys: Extended;
      Xr,Yr: integer;
    begin
    with TGeoObjectTrack(ptrTrack^) do
    if (ObjectModelEvents <> nil)
     then begin
      IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
      ptrLastEvent:=nil;
      ptrEvent:=ObjectModelEvents;
      while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^) do begin
        if (((Reflection_IntervalDuration = 0.0) OR ((Reflection_IntervalTimestamp <= TimeStamp) AND (TimeStamp <= IntervalEndTimestamp))) AND (Severity in ObjectModelEventSeveritiesToShow))
         then begin
          ConvertNode(RW, X,Y, Xs,Ys);
          if (IsNodeVisible(RW, Xs,Ys))
           then begin
            Xr:=Round(Xs);
            Yr:=Round(Ys);
            ShowEventMarker(Xr,Yr);
            if ((ptrLastEvent <> nil) AND ((TObjectTrackEvent(ptrLastEvent^).X = X) AND (TObjectTrackEvent(ptrLastEvent^).Y = Y)))
             then Xr:=LastEventExtentRight;
            DrawEventHint(pCanvas, Xr,Yr, TimeStamp+TimeZoneDelta, EventMessage, EventInfo, ObjectTrackEventSeverityColors[Severity],ObjectTrackEventSeverityFontColors[Severity], LastEventExtentRight);
            //.
            ptrLastEvent:=ptrEvent;
            end;
          end;
        //.
        if (ptrCancelFlag <> nil)
         then begin
          if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
        if (Now > BestBeforeTime) then Exit; //. ->
        //. next event
        ptrEvent:=Next;
        end;
      end;
    end;

    procedure ShowTrackBusinessModelEvents();
    var
      IntervalEndTimestamp: TDateTime;
      ptrEvent: pointer;
      ptrLastEvent: pointer;
      LastEventExtentRight: integer;
      Xs,Ys: Extended;
      Xr,Yr: integer;
    begin
    with TGeoObjectTrack(ptrTrack^) do
    if (BusinessModelEvents <> nil)
     then begin
      IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
      ptrLastEvent:=nil;
      ptrEvent:=BusinessModelEvents;
      while (ptrEvent <> nil) do with TObjectTrackEvent(ptrEvent^) do begin
        if (((Reflection_IntervalDuration = 0.0) OR ((Reflection_IntervalTimestamp <= TimeStamp) AND (TimeStamp <= IntervalEndTimestamp))) AND (Severity in BusinessModelEventSeveritiesToShow))
         then begin
          ConvertNode(RW, X,Y, Xs,Ys);
          if (IsNodeVisible(RW, Xs,Ys))
           then begin
            Xr:=Round(Xs);
            Yr:=Round(Ys);
            ShowEventMarker(Xr,Yr);
            if ((ptrLastEvent <> nil) AND ((TObjectTrackEvent(ptrLastEvent^).X = X) AND (TObjectTrackEvent(ptrLastEvent^).Y = Y)))
             then Xr:=LastEventExtentRight;
            DrawEventHint(pCanvas, Xr,Yr, TimeStamp+TimeZoneDelta, EventMessage, EventInfo, ObjectTrackEventSeverityColors[Severity],ObjectTrackEventSeverityFontColors[Severity], LastEventExtentRight);
            //.
            ptrLastEvent:=ptrEvent;
            end;
          end;
        //.
        if (ptrCancelFlag <> nil)
         then begin
          if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
          end;
        if (Now > BestBeforeTime) then Exit; //. ->
        //. next event
        ptrEvent:=Next;
        end;
      end;
    end;

    procedure ShowStopsAndMovementsGraph();

      procedure DrawMovements(const FWR: TPolylineFigure);
      var
        _Color: TColor;
        {///? R,G,B: byte;
        ColorDelta: byte;
        LightColor: TColor;}
        R2: integer;
        X0,Y0,X1,Y1: Extended;
        I: integer;
        //.
        Xt,Yt: Extended;
        L,AL,dX,dY: Extended;
        TX,TY,T1X,T1Y: Extended;
        Triangle: array[0..2] of Windows.TPoint;
      begin
      _Color:=TGeoObjectTrack(ptrTrack^).Color;
      {///? LightColor:=pCanvas.Pen.Color;
      R:=(LightColor AND 255); G:=((LightColor SHR 8) AND 255); B:=((LightColor SHR 16) AND 255);
      ColorDelta:=R; if (G > ColorDelta) then ColorDelta:=G; if (B > ColorDelta) then ColorDelta:=B;
      ColorDelta:=255-ColorDelta; ColorDelta:=(ColorDelta SHR 1);
      Inc(R,ColorDelta); Inc(G,ColorDelta); Inc(B,ColorDelta);
      LightColor:=R+(G SHL 8)+(B SHL 16); //. increase color light}
      R2:=2*StopMarkerR;
      for I:=0 to FWR.CountScreenNodes-2 do
        if ((NOT TGeoObjectTrack(ptrTrack^).Reflection_flHideMovementsGraph) OR (FWR.ScreenNodes[I+1].Color = clNone{selected}))
         then begin
          X0:=FWR.ScreenNodes[I].X; Y0:=FWR.ScreenNodes[I].Y;
          X1:=FWR.ScreenNodes[I+1].X; Y1:=FWR.ScreenNodes[I+1].Y;
          dX:=(X1-X0); dY:=(Y1-Y0);
          L:=Sqrt(sqr(dX)+sqr(dY));
          X1:=X1-StopMarkerR*(dX/L); Y1:=Y1-StopMarkerR*(dY/L);
          //.
          pCanvas.Pen.Width:=MovementMarkerR;
          if (FWR.ScreenNodes[I+1].Color <> clNone)
           then pCanvas.Pen.Color:=FWR.ScreenNodes[I+1].Color
           else pCanvas.Pen.Color:=clRed; //. selected
          pCanvas.MoveTo(Trunc(X0),Trunc(Y0)); pCanvas.LineTo(Trunc(X1),Trunc(Y1));
          //.
          if ((L-R2) > 0)
           then begin
            Xt:=X1-StopMarkerR*(dX/L); Yt:=Y1-StopMarkerR*(dY/L);
            dX:=X1-Xt; dY:=Y1-Yt;
            L:=Sqrt(sqr(dX)+sqr(dY)); AL:=StopMarkerR;
            dX:=AL*dX/L; dY:=AL*dY/L;
            GetTerminators(Xt,Yt,X1,Y1, Xt-dX/2.0,Yt-dY/2.0, (StopMarkerR DIV 3), {out} TX,TY,T1X,T1Y);
            //.
            Triangle[0].X:=Trunc(TX); Triangle[0].Y:=Trunc(TY);
            Triangle[1].X:=Trunc(T1X); Triangle[1].Y:=Trunc(T1Y);
            Triangle[2].X:=Trunc(Xt+dX); Triangle[2].Y:=Trunc(Yt+dY);
            pCanvas.Pen.Width:=MovementMarkerR;
            if (FWR.ScreenNodes[I+1].Color <> clNone)
             then pCanvas.Brush.Color:=clSilver
             else pCanvas.Brush.Color:=pCanvas.Pen.Color;
            pCanvas.Polygon(Triangle);
            end;
          if (FWR.ScreenNodes[I+1].Color <> clNone) //. not selected ?
           then begin
            pCanvas.Pen.Color:=clSilver;
            pCanvas.Pen.Width:=1;
            pCanvas.MoveTo(Trunc(X0),Trunc(Y0)); pCanvas.LineTo(Trunc(X1),Trunc(Y1));
            end;
          end;
      end;

      procedure DrawStopMarker(const Node: unitPolylineFigure.TScreenNode);
      var
        S: string;
        TE: TSize;
      begin
      pCanvas.Pen.Style:=psSolid;
      pCanvas.Pen.Color:=clBlack;
      pCanvas.Pen.Width:=1;
      pCanvas.Brush.Style:=bsSolid;
      if (Node.Color <> clNone)
       then pCanvas.Brush.Color:=Node.Color
       else pCanvas.Brush.Color:=clRed; //. selected
      pCanvas.Ellipse(Round(Node.X)-StopMarkerR,Round(Node.Y)-StopMarkerR,Round(Node.X)+StopMarkerR,Round(Node.Y)+StopMarkerR);
      //.
      S:='P';
      pCanvas.Font.Name:='Tahoma';
      pCanvas.Font.Size:=14;
      pCanvas.Font.Style:=[];
      pCanvas.Font.Color:=clBlack;
      TE:=pCanvas.TextExtent(S);
      pCanvas.Brush.Style:=bsClear;
      pCanvas.TextOut(Round(Node.X-TE.cx/2.0),Round(Node.Y-TE.cy/2.0),S);
      pCanvas.Brush.Style:=bsSolid;
      end;

    var
      IntervalEndTimestamp: TDateTime;
      Node: unitPolylineFigure.TNode;
      I: integer;
    begin
    with TGeoObjectTrack(ptrTrack^) do
    if (StopsAndMovementsAnalysis <> nil)
     then with TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis) do begin
      IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
      ShowTrack_FWR.Clear();
      for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do if (NOT flMovement) then
        if (NOT ((Position.X = 0.0) AND (Position.Y = 0.0)))
         then begin
          ConvertNode(RW, Position.X,Position.Y, Node.X,Node.Y);
          if ((Reflection_IntervalDuration <> 0.0) AND (NOT (((Position.TimeStamp+Duration) < Reflection_IntervalTimestamp) OR (Position.TimeStamp > IntervalEndTimestamp))))
           then Node.Color:=clNone //. selected
           else Node.Color:=Color;
          ShowTrack_FWR.Insert(Node);
          end;
      ShowTrack_FWR.AttractToLimits(Window, nil);
      ShowTrack_FWR.Optimize();
      //.
      DrawMovements(ShowTrack_FWR);
      for I:=0 to ShowTrack_FWR.CountScreenNodes-1 do DrawStopMarker(ShowTrack_FWR.ScreenNodes[I]);
      end;
    end;

  begin
  with TGeoObjectTrack(ptrTrack^) do begin
  if (flShowTracksNodes AND (Reflection_flShowTrack OR (Reflection_IntervalDuration > 0.0))) then ShowTrackNodes();
  //.
  if (ptrCancelFlag <> nil)
   then begin
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  if (Now > BestBeforeTime) then Exit; //. ->
  //.
  if (Reflection_flShowStopsAndMovementsGraph) then ShowStopsAndMovementsGraph();
  //.
  if (ptrCancelFlag <> nil)
   then begin
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  if (Now > BestBeforeTime) then Exit; //. ->
  //.
  if (flShowTracksObjectModelEvents AND (GetCurrentThreadID <> MainThreadID) AND Reflection_flShowObjectModelEvents) then ShowTrackObjectModelEvents();
  //.
  if (ptrCancelFlag <> nil)
   then begin
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  if (Now > BestBeforeTime) then Exit; //. ->
  //.
  if (flShowTracksBusinessModelEvents AND (GetCurrentThreadID <> MainThreadID) AND Reflection_flShowBusinessModelEvents) then ShowTrackBusinessModelEvents();
  end;
  end;

  
var
  SavedPenStyle: TPenStyle;
  SavedBrushStyle: TBrushStyle;
  ptrTrack: pointer;
begin
Convertor.Reflector.ReflectionWindow.GetWindow(false, RW);
Window:=TWindow.Create(RW.Xmn-WindowZone,RW.Ymn-WindowZone,RW.Xmx+WindowZone,RW.Ymx+WindowZone);
try
pCanvas.Lock;
SavedPenStyle:=pCanvas.Pen.Style;
SavedBrushStyle:=pCanvas.Brush.Style;
try
Lock.Enter;
try
ptrTrack:=Tracks;
while (ptrTrack <> nil) do with TGeoObjectTrack(ptrTrack^) do begin
  if (flEnabled) then Track_Draw(ptrTrack);
  //.
  if (ptrCancelFlag <> nil)
   then begin
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  if (Now > BestBeforeTime) then Exit; //. ->
  //. next track
  ptrTrack:=Next;
  end;
finally
Lock.Leave;
end;
finally
pCanvas.Brush.Style:=SavedBrushStyle;
pCanvas.Pen.Style:=SavedPenStyle;
pCanvas.Unlock;
end;
finally
Window.Destroy;
end;
end;

function TGeoObjectTracks.GetTrackPanel(const ptrTrack: pointer; const pTimeStamp: TDateTime): TForm;
var
  fmGeoObjectTrackControlPanel: TfmGeoObjectTrackControlPanel;
begin
Lock.Enter();
try
fmGeoObjectTrackControlPanel:=TfmGeoObjectTrackControlPanel(TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel);
finally
Lock.Leave();
end;
if (fmGeoObjectTrackControlPanel = nil)
 then begin
  fmGeoObjectTrackControlPanel:=TfmGeoObjectTrackControlPanel.Create(Self,ptrTrack);
  //.
  Lock.Enter();
  try
  FreeAndNil(TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel);
  TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel:=fmGeoObjectTrackControlPanel;
  finally
  Lock.Leave();
  end;
  end;
fmGeoObjectTrackControlPanel.SelectTime(pTimeStamp);
//.
Result:=fmGeoObjectTrackControlPanel;
end;

function TGeoObjectTracks.GetTrackPanel(const ptrTrack: pointer; const pInterval: TTimeInterval): TForm;
var
  fmGeoObjectTrackControlPanel: TfmGeoObjectTrackControlPanel;
begin
Lock.Enter();
try
fmGeoObjectTrackControlPanel:=TfmGeoObjectTrackControlPanel(TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel);
finally
Lock.Leave();
end;
if (fmGeoObjectTrackControlPanel = nil)
 then begin
  fmGeoObjectTrackControlPanel:=TfmGeoObjectTrackControlPanel.Create(Self,ptrTrack);
  //.
  Lock.Enter();
  try
  FreeAndNil(TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel);
  TGeoObjectTrack(ptrTrack^).Reflection_PropsPanel:=fmGeoObjectTrackControlPanel;
  finally
  Lock.Leave();
  end;
  end;
fmGeoObjectTrackControlPanel.SelectTime(pInterval.Time);
fmGeoObjectTrackControlPanel.SelectTimeInterval(pInterval);
//.
Result:=fmGeoObjectTrackControlPanel;
end;

function TGeoObjectTracks.SelectTrackNode(const pX,pY: integer): boolean;
var
  Window: TWindow;
  RW: TReflectionWindowStrucEx;
  NewSelectedTrackNode: TTrackNodeDescriptor;

  function IsNodeVisible(const RW: TReflectionWindowStrucEx; const Xs,Ys: Extended): boolean;
  begin
  with RW do
  Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
  end;

  procedure ProcessTrack(const ptrTrack: pointer);
  var
    IntervalEndTimeStamp: TDateTime;
    ptrItem: pointer;
    NodeIndex: integer;
    Node: TNode;
  begin
  with TGeoObjectTrack(ptrTrack^) do
  if (Nodes <> nil)
   then begin
    IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
    NodeIndex:=0;
    ptrItem:=Nodes;
    while (ptrItem <> nil) do with TObjectTrackNode(ptrItem^) do begin
      if (((Reflection_IntervalDuration = 0.0) OR ((Reflection_IntervalTimestamp <= TimeStamp) AND (TimeStamp <= IntervalEndTimestamp))) AND (NOT ((X = 0.0) AND (Y = 0.0))))
       then begin
        ConvertNode(RW, X,Y, Node.X,Node.Y);
        if (IsNodeVisible(RW, Node.X,Node.Y))
         then begin
          if (((Abs(Node.X-pX) <= NodeMarkerR) AND (Abs(Node.Y-pY) <= NodeMarkerR)) AND ((sqr(Node.X-pX)+sqr(Node.Y-pY)) <= sqr(NodeMarkerR)))
           then begin
            NewSelectedTrackNode.ptrTrack:=ptrTrack;
            NewSelectedTrackNode.Track:=TGeoObjectTrack(ptrTrack^);
            NewSelectedTrackNode.NodePtr:=ptrItem;
            NewSelectedTrackNode.NodeIndex:=NodeIndex;
            NewSelectedTrackNode.Node:=TObjectTrackNode(ptrItem^);
            NewSelectedTrackNode.X:=Node.X;
            NewSelectedTrackNode.Y:=Node.Y;
            end
          end;
        end;
      //.
      Inc(NodeIndex);
      ptrItem:=Next;
      end;
    end;
  end;

var
  ptrTrack: pointer;
begin
NewSelectedTrackNode.ptrTrack:=nil;
NewSelectedTrackNode.NodePtr:=nil;
NewSelectedTrackNode.NodeIndex:=-1;
//.
Convertor.Reflector.ReflectionWindow.GetWindow(false, RW);
Window:=TWindow.Create(RW.Xmn,RW.Ymn,RW.Xmx,RW.Ymx);
try
Lock.Enter();
try
ptrTrack:=Tracks;
while (ptrTrack <> nil) do with TGeoObjectTrack(ptrTrack^) do begin
  if (flEnabled AND (Reflection_flShowTrack OR (Reflection_IntervalDuration > 0.0))) then ProcessTrack(ptrTrack);
  //. next track
  ptrTrack:=Next;
  end;
finally
Lock.Leave();
end;
finally
Window.Destroy;
end;
//.
if ((NewSelectedTrackNode.ptrTrack <> SelectedTrackNode.ptrTrack) OR (NewSelectedTrackNode.NodePtr <> SelectedTrackNode.NodePtr))
 then begin
  SelectedTrackNode:=NewSelectedTrackNode;
  Result:=true;
  end
 else Result:=false;
end;

procedure TGeoObjectTracks.ShowSelectedTrackNode(const pCanvas: TCanvas);
begin
if (SelectedTrackNode.ptrTrack = nil) then Exit; //. ->
//.
pCanvas.Lock;
try
pCanvas.Pen.Width:=1;
pCanvas.Pen.Color:=clWhite;
pCanvas.Brush.Color:=SelectedNodeMarkerColor;
pCanvas.Ellipse(Rect(Trunc(SelectedTrackNode.X-SelectedNodeMarkerR),Trunc(SelectedTrackNode.Y-SelectedNodeMarkerR),Trunc(SelectedTrackNode.X+SelectedNodeMarkerR),Trunc(SelectedTrackNode.Y+SelectedNodeMarkerR)));
finally
pCanvas.Unlock;
end;
end;

procedure TGeoObjectTracks.ClearSelectedTrackNode();
begin
SelectedTrackNode.ptrTrack:=nil;
SelectedTrackNode.NodePtr:=nil;
SelectedTrackNode.NodeIndex:=-1;
//.
if (SelectedTrackNode_InplaceHint <> nil) then SelectedTrackNode_InplaceHint.CancelAndHide();
end;

function TGeoObjectTracks.IsSelectedTrackNode(out ptrSelectedTrack: pointer; out ptrSelectedTrackNode: pointer): boolean;
begin
ptrSelectedTrack:=SelectedTrackNode.ptrTrack;
ptrSelectedTrackNode:=SelectedTrackNode.NodePtr;
Result:=(ptrSelectedTrack <> nil);
end;

function TGeoObjectTracks.IsSelectedTrackNode(): boolean;
begin
Result:=(SelectedTrackNode.NodePtr <> nil);
end;

procedure TGeoObjectTracks.StartSelectedTrackNodeHint(const pX,pY: integer);
begin
if (SelectedTrackNode_InplaceHint <> nil) then SelectedTrackNode_InplaceHint.CancelAndHide();
//.
if (SelectedTrackNode.ptrTrack <> nil) then SelectedTrackNode_InplaceHint:=TTrackNodeInplaceHint.Create(Self, SelectedTrackNode, pX,pY);
end;

function TGeoObjectTracks.IsSelectedTrackNodeHinting(): boolean;
begin
Result:=(SelectedTrackNode_InplaceHint <> nil);
end;

procedure TGeoObjectTracks.ClearSelectedTrackNodeHint();
begin
if (SelectedTrackNode_InplaceHint <> nil)
 then begin
  SelectedTrackNode_InplaceHint.CancelAndHide();
  SelectedTrackNode_InplaceHint:=nil;
  end;
end;

function TGeoObjectTracks.SelectTrackStopOrMovementInterval(const pX,pY: integer): boolean;
var
  Window: TWindow;
  RW: TReflectionWindowStrucEx;
  NewSelectedTrackStopOrMovementInterval: TTrackStopOrMovementIntervalDescriptor;

  function IsNodeVisible(const RW: TReflectionWindowStrucEx; const Xs,Ys: Extended): boolean;
  begin
  with RW do
  Result:=(((Xmn <= Xs) AND (Xs <= Xmx)) AND ((Ymn <= Ys) AND (Ys <= Ymx)));
  end;

  function Line_GetPointDist(const X0,Y0,X1,Y1: Extended; const X,Y: Extended; out D: Extended): boolean;
  var
     C,QdC,A1,QdA2,QdB2,QdD: Extended;
  begin
  QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X1)+sqr(Y-Y1);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  QdD:=QdA2-Sqr(A1);
  if ((QdA2-QdD) < QdC) AND ((QdB2-QdD) < QdC)
   then begin
    D:=Sqrt(QdD);
    Result:=true;
    end
   else Result:=false;
  end;

  procedure ProcessTrack(const ptrTrack: pointer);
  var
    IntervalEndTimeStamp: TDateTime;
    ptrItem: pointer;
    Node,Node1: TNode;
    I: integer;
    D: Extended;
  begin
  with TGeoObjectTrack(ptrTrack^) do
  if (StopsAndMovementsAnalysis <> nil)
   then with TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis) do begin
    IntervalEndTimeStamp:=Reflection_IntervalTimestamp+Reflection_IntervalDuration;
    for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do
      if (flMovement)
       then begin
        if (((NOT Reflection_flHideMovementsGraph) OR (NOT (((Position.TimeStamp+Duration) < Reflection_IntervalTimestamp) OR (Position.TimeStamp > IntervalEndTimestamp)))) AND (I < (Items.Count-1)) AND (NOT ((Position.X = 0.0) AND (Position.Y = 0.0))))
         then begin
          if (I > 0)
           then ConvertNode(RW, TTrackStopsAndMovementsAnalysisInterval(Items[I-1]).Position.X,TTrackStopsAndMovementsAnalysisInterval(Items[I-1]).Position.Y, Node.X,Node.Y)
           else ConvertNode(RW, Position.X,Position.Y, Node.X,Node.Y);
          ConvertNode(RW, TTrackStopsAndMovementsAnalysisInterval(Items[I+1]).Position.X,TTrackStopsAndMovementsAnalysisInterval(Items[I+1]).Position.Y, Node1.X,Node1.Y);
          if (Line_GetPointDist(Node.X,Node.Y,Node1.X,Node1.Y, pX,pY, {out} D) AND (D <= MovementMarkerR))
           then begin
            NewSelectedTrackStopOrMovementInterval.ptrTrack:=ptrTrack;
            NewSelectedTrackStopOrMovementInterval.Track:=TGeoObjectTrack(ptrTrack^);
            NewSelectedTrackStopOrMovementInterval.IntervalPtr:=Items[I];
            NewSelectedTrackStopOrMovementInterval.IntervalIndex:=I;
            NewSelectedTrackStopOrMovementInterval.Interval:=GetDescriptor();
            NewSelectedTrackStopOrMovementInterval.X:=Node.X;
            NewSelectedTrackStopOrMovementInterval.Y:=Node.Y;
            NewSelectedTrackStopOrMovementInterval.X1:=Node1.X;
            NewSelectedTrackStopOrMovementInterval.Y1:=Node1.Y;
            end;
          end;
        end;
    for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do
      if (NOT flMovement)
       then begin
        if ({((Reflection_IntervalDuration = 0.0) OR ((Reflection_IntervalTimestamp <= TimeStamp) AND (TimeStamp <= IntervalEndTimestamp))) AND ///?}(NOT ((Position.X = 0.0) AND (Position.Y = 0.0))))
         then begin
          ConvertNode(RW, Position.X,Position.Y, Node.X,Node.Y);
          if (IsNodeVisible(RW, Node.X,Node.Y))
           then begin
            if (((Abs(Node.X-pX) <= StopMarkerR) AND (Abs(Node.Y-pY) <= StopMarkerR)) AND ((sqr(Node.X-pX)+sqr(Node.Y-pY)) <= sqr(StopMarkerR)))
             then begin
              NewSelectedTrackStopOrMovementInterval.ptrTrack:=ptrTrack;
              NewSelectedTrackStopOrMovementInterval.Track:=TGeoObjectTrack(ptrTrack^);
              NewSelectedTrackStopOrMovementInterval.IntervalPtr:=Items[I];
              NewSelectedTrackStopOrMovementInterval.IntervalIndex:=I;
              NewSelectedTrackStopOrMovementInterval.Interval:=GetDescriptor();
              NewSelectedTrackStopOrMovementInterval.X:=Node.X;
              NewSelectedTrackStopOrMovementInterval.Y:=Node.Y;
              end
            end;
          end;
        end;
    end;
  end;

var
  ptrTrack: pointer;
begin
NewSelectedTrackStopOrMovementInterval.ptrTrack:=nil;
NewSelectedTrackStopOrMovementInterval.IntervalPtr:=nil;
NewSelectedTrackStopOrMovementInterval.IntervalIndex:=-1;
//.
Convertor.Reflector.ReflectionWindow.GetWindow(false, RW);
Window:=TWindow.Create(RW.Xmn,RW.Ymn,RW.Xmx,RW.Ymx);
try
Lock.Enter();
try
ptrTrack:=Tracks;
while (ptrTrack <> nil) do with TGeoObjectTrack(ptrTrack^) do begin
  if (flEnabled AND Reflection_flShowStopsAndMovementsGraph) then ProcessTrack(ptrTrack);
  //. next track
  ptrTrack:=Next;
  end;
finally
Lock.Leave();
end;
finally
Window.Destroy;
end;
//.
if ((NewSelectedTrackStopOrMovementInterval.ptrTrack <> SelectedTrackStopOrMovementInterval.ptrTrack) OR (NewSelectedTrackStopOrMovementInterval.IntervalPtr <> SelectedTrackStopOrMovementInterval.IntervalPtr))
 then begin
  SelectedTrackStopOrMovementInterval:=NewSelectedTrackStopOrMovementInterval;
  Result:=true;
  end
 else Result:=false;
end;

procedure TGeoObjectTracks.ShowSelectedTrackStopOrMovementInterval(const pCanvas: TCanvas);
var
  X0,Y0,X1,Y1: Extended;
  Xt,Yt: Extended;
  L,AL,dX,dY: Extended;
  TX,TY,T1X,T1Y: Extended;
  Triangle: array[0..2] of Windows.TPoint;
begin
if (SelectedTrackStopOrMovementInterval.ptrTrack = nil) then Exit; //. ->
//.
if (NOT SelectedTrackStopOrMovementInterval.Interval.flMovement)
 then begin
  pCanvas.Lock;
  try
  pCanvas.Pen.Color:=SelectedStopOrMovementMarkerColor;
  pCanvas.Pen.Width:=(SelectedStopMarkerR-StopMarkerR)*2;
  pCanvas.Brush.Style:=bsClear;
  pCanvas.Ellipse(Rect(Trunc(SelectedTrackStopOrMovementInterval.X-SelectedStopMarkerR),Trunc(SelectedTrackStopOrMovementInterval.Y-SelectedStopMarkerR),Trunc(SelectedTrackStopOrMovementInterval.X+SelectedStopMarkerR),Trunc(SelectedTrackStopOrMovementInterval.Y+SelectedStopMarkerR)));
  pCanvas.Brush.Style:=bsSolid;
  finally
  pCanvas.Unlock;
  end;
  end
 else begin
  X0:=SelectedTrackStopOrMovementInterval.X; Y0:=SelectedTrackStopOrMovementInterval.Y;
  X1:=SelectedTrackStopOrMovementInterval.X1; Y1:=SelectedTrackStopOrMovementInterval.Y1;
  dX:=(X1-X0); dY:=(Y1-Y0);
  L:=Sqrt(sqr(dX)+sqr(dY));
  X1:=X1-StopMarkerR*(dX/L); Y1:=Y1-StopMarkerR*(dY/L);
  //.
  pCanvas.Pen.Width:=SelectedMovementMarkerR;
  pCanvas.Pen.Color:=SelectedStopOrMovementMarkerColor;
  pCanvas.MoveTo(Trunc(X0),Trunc(Y0)); pCanvas.LineTo(Trunc(X1),Trunc(Y1));
  //.
  if ((L-2*StopMarkerR) > 0)
   then begin
    Xt:=X1-StopMarkerR*(dX/L); Yt:=Y1-StopMarkerR*(dY/L);
    dX:=X1-Xt; dY:=Y1-Yt;
    L:=Sqrt(sqr(dX)+sqr(dY)); AL:=StopMarkerR;
    dX:=AL*dX/L; dY:=AL*dY/L;
    GetTerminators(Xt,Yt,X1,Y1, Xt-dX/2.0,Yt-dY/2.0, (StopMarkerR DIV 3), {out} TX,TY,T1X,T1Y);
    //.
    Triangle[0].X:=Trunc(TX); Triangle[0].Y:=Trunc(TY);
    Triangle[1].X:=Trunc(T1X); Triangle[1].Y:=Trunc(T1Y);
    Triangle[2].X:=Trunc(Xt+dX); Triangle[2].Y:=Trunc(Yt+dY);
    pCanvas.Pen.Width:=MovementMarkerR;
    pCanvas.Brush.Color:=clSilver;
    pCanvas.Polygon(Triangle);
    end;
  pCanvas.Pen.Color:=clSilver;
  pCanvas.Pen.Width:=1;
  pCanvas.MoveTo(Trunc(X0),Trunc(Y0)); pCanvas.LineTo(Trunc(X1),Trunc(Y1));
  end;
end;

procedure TGeoObjectTracks.ClearSelectedTrackStopOrMovementInterval();
begin
SelectedTrackStopOrMovementInterval.ptrTrack:=nil;
SelectedTrackStopOrMovementInterval.IntervalPtr:=nil;
SelectedTrackStopOrMovementInterval.IntervalIndex:=-1;
//.
if (SelectedTrackStopOrMovementInterval_InplaceHint <> nil) then SelectedTrackStopOrMovementInterval_InplaceHint.CancelAndHide();
end;

function TGeoObjectTracks.IsSelectedTrackStopOrMovementInterval(out ptrSelectedTrack: pointer; out ptrSelectedTrackStopOrMovementInterval: pointer): boolean;
begin
ptrSelectedTrack:=SelectedTrackStopOrMovementInterval.ptrTrack;
ptrSelectedTrackStopOrMovementInterval:=SelectedTrackStopOrMovementInterval.IntervalPtr;
Result:=(ptrSelectedTrack <> nil);
end;

function TGeoObjectTracks.IsSelectedTrackStopOrMovementInterval(): boolean;
begin
Result:=(SelectedTrackStopOrMovementInterval.IntervalPtr <> nil);
end;

procedure TGeoObjectTracks.StartSelectedTrackStopOrMovementIntervalHint(const pX,pY: integer);
begin
if (SelectedTrackStopOrMovementInterval_InplaceHint <> nil) then SelectedTrackStopOrMovementInterval_InplaceHint.CancelAndHide();
//.
if (SelectedTrackStopOrMovementInterval.ptrTrack <> nil) then SelectedTrackStopOrMovementInterval_InplaceHint:=TTrackStopOrMovementIntervalInplaceHint.Create(Self, SelectedTrackStopOrMovementInterval, pX,pY);
end;

function TGeoObjectTracks.IsSelectedTrackStopOrMovementIntervalHinting(): boolean;
begin
Result:=(SelectedTrackStopOrMovementInterval_InplaceHint <> nil);
end;

procedure TGeoObjectTracks.ClearSelectedTrackStopOrMovementIntervalHint();
begin
if (SelectedTrackStopOrMovementInterval_InplaceHint <> nil)
 then begin
  SelectedTrackStopOrMovementInterval_InplaceHint.CancelAndHide();
  SelectedTrackStopOrMovementInterval_InplaceHint:=nil;
  end;
end;

procedure TGeoObjectTracks.ClearSelectedItems();
begin
ClearSelectedTrackNode();
ClearSelectedTrackStopOrMovementInterval();
end;

procedure TGeoObjectTracks.ShowControlPanel;
begin
with TfmGeoObjectTracksPanel.Create(Self) do begin
BorderStyle:=bsDialog;
Position:=poScreenCenter;
FormStyle:=fsStayOnTop;
Show();
end;
end;

function TGeoObjectTracks.CreateControlPanel(const pCoComponentID: integer): TForm;
begin
Result:=TfmGeoObjectTracksPanel.Create(Self,pCoComponentID);
end;

procedure TGeoObjectTracks.UpdateReflectorView;
begin
Convertor.Reflector.Reflecting.RecalcReflect();
end;

function TGeoObjectTracks.GetNextTrackID: integer;
var
  ptrTrack: pointer;
begin
Result:=0;
ptrTrack:=Tracks;
while (ptrTrack <> nil) do with TGeoObjectTrack(ptrTrack^) do begin
  if (ID > Result) then Result:=ID;
  //. next track
  ptrTrack:=Next;
  end;
Inc(Result);
end;


{TTrackNodeInplaceHint}
Constructor TTrackNodeInplaceHint.Create(const pGeoObjectTracks: TGeoObjectTracks; const pTrackNode: TTrackNodeDescriptor; const pPosX,pPosY: integer);
begin
GeoObjectTracks:=pGeoObjectTracks;
TrackNode:=pTrackNode;
PosX:=pPosX;
PosY:=pPosY;
Panel:=nil;
flRestartDelaying:=false;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TTrackNodeInplaceHint.Destroy();
begin
Cancel();
Inherited;
end;

procedure TTrackNodeInplaceHint.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TTrackNodeInplaceHint.RestartDelaying();
begin
flRestartDelaying:=true;
end;

procedure TTrackNodeInplaceHint.SetPosition(const pPosX,pPosY: integer);
begin
PosX:=pPosX;
PosY:=pPosY;
//.
if (Panel <> nil) then Panel.SetPosition(PosX,PosY);
end;

procedure TTrackNodeInplaceHint.Execute();
const
  BeforeHintDelay = Trunc(10*0.7){seconds};
  HintVisibilityTimeout = 10*60{seconds};
var
  I: integer;
  idTOwner,idOwner: integer;
  HintInfo: TByteArray;
  S: string;
  LocationInfo: string;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
if (Terminated) then Exit; //. ->
try
for I:=0 to BeforeHintDelay-1 do begin
  Sleep(100);
  if (Terminated) then Exit; //. ->
  end;
//.
HintText:='TrackName:';
HintText:=HintText+#$0D#$0A+TrackNode.Track.TrackName+#$0D#$0A;
//.
Synchronize(DoOnProcessingStart);
//. loading hint
HintText:=HintText+#$0D#$0A+'Time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TrackNode.Node.TimeStamp+TimeZoneDelta)+#$0D#$0A;
HintText:=HintText+'Altitude: '+FormatFloat('00.0',TrackNode.Node.Altitude)+' m'+#$0D#$0A;
HintText:=HintText+'Speed: '+FormatFloat('00.0',TrackNode.Node.Speed)+' km/h'+#$0D#$0A;
HintText:=HintText+'Precision: '+FormatFloat('00.0',TrackNode.Node.Precision)+' m'+#$0D#$0A;
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//.
HintText:=HintText+#$0D#$0A+'Location:';
S:=HintText;
HintText:=HintText+#$0D#$0A+'loading...';
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//.
try
with TGeoCrdConverter.Create(TrackNode.Track.DatumID) do
try
GeoCoder_LatLongToNearestObjects(GEOCODER_YANDEXMAPS, TrackNode.Node.Latitude,TrackNode.Node.Longitude,{out} LocationInfo);
finally
Destroy();
end;
if (LocationInfo = '') then LocationInfo:='- not found -';
except
  on E: Exception do LocationInfo:='!ERROR: '+E.Message;
  end;
HintText:=S;
HintText:=HintText+#$0D#$0A+LocationInfo;
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//.
if (HintText = '') then Exit; //. ->
//.
while (flRestartDelaying) do begin
  flRestartDelaying:=false;
  //.
  for I:=0 to BeforeHintDelay-1 do begin
    Sleep(100);
    if (flRestartDelaying) then Break; //. >
    if (Terminated) then Exit; //. ->
    end;
  end;
//.
if (Terminated) then Exit; //. ->
Synchronize(DoOnProcessingFinish);
//. keep hint panel visible for a time
for I:=0 to HintVisibilityTimeout-1 do begin
  Sleep(100);
  if (Terminated) then Break; //. >
  end;   
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
finally
CoUnInitialize;
end;
end;

procedure TTrackNodeInplaceHint.DoOnProcessingStart();
begin
if (Terminated) then Exit; //. ->
Panel:=TInplaceHintPanel.Create(GeoObjectTracks.Convertor.Reflector,HintText,PosX,PosY);
Panel.Parent:=GeoObjectTracks.Convertor.Reflector;
Panel.Show();
Panel.SendToBack();
Panel.UpdateLayout();
//.
Screen.Cursor:=crAppStart;
end;

procedure TTrackNodeInplaceHint.DoOnProcessingStageCompleted();
begin
if (Terminated) then Exit; //. ->
Panel.SetHintText(HintText);
end;

procedure TTrackNodeInplaceHint.DoOnProcessingFinish();
begin
Screen.Cursor:=crDefault;
//.
if (Terminated) then Exit; //. ->
Panel.SetHintText(HintText);
end;

procedure TTrackNodeInplaceHint.DoOnException();
begin
if (Terminated) then Exit; //. ->
if (GeoObjectTracks.Convertor.Reflector.Space.State <> psstWorking) then Exit; //. ->
Application.MessageBox(PChar('error while loading object hint, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TTrackNodeInplaceHint.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TTrackNodeInplaceHint.Finalize();
begin
FreeAndNil(Panel);
Screen.Cursor:=crDefault;
//.
if (GeoObjectTracks.SelectedTrackNode_InplaceHint = Self) then GeoObjectTracks.SelectedTrackNode_InplaceHint:=nil;
end;

procedure TTrackNodeInplaceHint.Cancel();
begin
Terminate();
end;

procedure TTrackNodeInplaceHint.CancelAndHide();
begin
Terminate();
FreeAndNil(Panel);
end;


{TTrackStopOrMovementIntervalInplaceHint}
Constructor TTrackStopOrMovementIntervalInplaceHint.Create(const pGeoObjectTracks: TGeoObjectTracks; const pTrackStopOrMovementInterval: TTrackStopOrMovementIntervalDescriptor; const pPosX,pPosY: integer);
begin
GeoObjectTracks:=pGeoObjectTracks;
TrackStopOrMovementInterval:=pTrackStopOrMovementInterval;
if (NOT GeoObjectTracks.Track_GetNearestBusinessModelEvents(TrackStopOrMovementInterval.ptrTrack, TrackStopOrMovementInterval.Interval.Position.TimeStamp,TrackStopOrMovementInterval.Interval.Duration, EVENTTAG_POI_ADDTEXT,1, {out} NearestEvents)) then NearestEvents:=nil;
PosX:=pPosX;
PosY:=pPosY;
Panel:=nil;
flRestartDelaying:=false;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TTrackStopOrMovementIntervalInplaceHint.Destroy();
begin
Cancel();
Inherited;
end;

procedure TTrackStopOrMovementIntervalInplaceHint.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TTrackStopOrMovementIntervalInplaceHint.RestartDelaying();
begin
flRestartDelaying:=true;
end;

procedure TTrackStopOrMovementIntervalInplaceHint.SetPosition(const pPosX,pPosY: integer);
begin
PosX:=pPosX;
PosY:=pPosY;
//.
if (Panel <> nil) then Panel.SetPosition(PosX,PosY);
end;

procedure TTrackStopOrMovementIntervalInplaceHint.Execute();
const
  BeforeHintDelay = Trunc(10*0.7){seconds};
  HintVisibilityTimeout = 10*60{seconds};
var
  I: integer;
  idTOwner,idOwner: integer;
  HintInfo: TByteArray;
  S: string;
  LocationInfo: string;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
if (Terminated) then Exit; //. ->
try
for I:=0 to BeforeHintDelay-1 do begin
  Sleep(100);
  if (Terminated) then Exit; //. ->
  end;
//.
HintText:='TrackName:';
HintText:=HintText+#$0D#$0A+TrackStopOrMovementInterval.Track.TrackName+#$0D#$0A;
if (TrackStopOrMovementInterval.Interval.flMovement)
  then HintText:=HintText+'Movement'+#$0D#$0A
  else HintText:=HintText+'Stop'+#$0D#$0A;
//.
Synchronize(DoOnProcessingStart);
//. loading hint
HintText:=HintText+#$0D#$0A+'Time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TrackStopOrMovementInterval.Interval.Position.TimeStamp+TimeZoneDelta)+#$0D#$0A;
HintText:=HintText+'Duration: '+FormatFloat('00.0',TrackStopOrMovementInterval.Interval.Duration*24.0*60.0)+' min'+#$0D#$0A;
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//. get nearest event
if (Length(NearestEvents) > 0)
 then begin
  HintText:=HintText+#$0D#$0A+'Critical events:';
  for I:=0 to Length(NearestEvents)-1 do HintText:=HintText+#$0D#$0A+NearestEvents[I].EventMessage;
  HintText:=HintText+#$0D#$0A;
  end;
//.
HintText:=HintText+#$0D#$0A+'Location:';
S:=HintText;
HintText:=HintText+#$0D#$0A+'loading...';
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//.
try
with TGeoCrdConverter.Create(TrackStopOrMovementInterval.Track.DatumID) do
try
GeoCoder_LatLongToNearestObjects(GEOCODER_YANDEXMAPS, TrackStopOrMovementInterval.Interval.Position.Latitude,TrackStopOrMovementInterval.Interval.Position.Longitude,{out} LocationInfo);
finally
Destroy();
end;
if (LocationInfo = '') then LocationInfo:='- not found -';
except
  on E: Exception do LocationInfo:='!ERROR: '+E.Message;
  end;
HintText:=S;
HintText:=HintText+#$0D#$0A+LocationInfo;
Synchronize(DoOnProcessingStageCompleted);
if (Terminated) then Exit; //. ->
//.
if (HintText = '') then Exit; //. ->
//.
while (flRestartDelaying) do begin
  flRestartDelaying:=false;
  //.
  for I:=0 to BeforeHintDelay-1 do begin
    Sleep(100);
    if (flRestartDelaying) then Break; //. >
    if (Terminated) then Exit; //. ->
    end;
  end;
//.
if (Terminated) then Exit; //. ->
Synchronize(DoOnProcessingFinish);
//. keep hint panel visible for a time
for I:=0 to HintVisibilityTimeout-1 do begin
  Sleep(100);
  if (Terminated) then Break; //. >
  end;   
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
finally
CoUnInitialize;
end;
end;

procedure TTrackStopOrMovementIntervalInplaceHint.DoOnProcessingStart();
begin
if (Terminated) then Exit; //. ->
Panel:=TInplaceHintPanel.Create(GeoObjectTracks.Convertor.Reflector,HintText,PosX,PosY);
Panel.Parent:=GeoObjectTracks.Convertor.Reflector;
Panel.Show();
Panel.SendToBack();
Panel.UpdateLayout();
//.
Screen.Cursor:=crAppStart;
end;

procedure TTrackStopOrMovementIntervalInplaceHint.DoOnProcessingStageCompleted();
begin
if (Terminated) then Exit; //. ->
Panel.SetHintText(HintText);
end;

procedure TTrackStopOrMovementIntervalInplaceHint.DoOnProcessingFinish();
begin
Screen.Cursor:=crDefault;
//.
if (Terminated) then Exit; //. ->
Panel.SetHintText(HintText);
end;

procedure TTrackStopOrMovementIntervalInplaceHint.DoOnException();
begin
if (Terminated) then Exit; //. ->
if (GeoObjectTracks.Convertor.Reflector.Space.State <> psstWorking) then Exit; //. ->
Application.MessageBox(PChar('error while loading object hint, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TTrackStopOrMovementIntervalInplaceHint.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TTrackStopOrMovementIntervalInplaceHint.Finalize();
begin
FreeAndNil(Panel);
Screen.Cursor:=crDefault;
//.
if (GeoObjectTracks.SelectedTrackStopOrMovementInterval_InplaceHint = Self) then GeoObjectTracks.SelectedTrackStopOrMovementInterval_InplaceHint:=nil;
end;

procedure TTrackStopOrMovementIntervalInplaceHint.Cancel();
begin
Terminate();
end;

procedure TTrackStopOrMovementIntervalInplaceHint.CancelAndHide();
begin
Terminate();
FreeAndNil(Panel);
end;


{TfmXYToGeoCrdConvertor}
Constructor TfmXYToGeoCrdConvertor.Create(const pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
CrdSysConvertorPool:=TList.Create;
CrdSysConvertor:=nil;
TransformFactor:=0;
Scale:=-1;
CurrentPos_flXYCalculated:=false;
CurrentPos_flLatLongCalculated:=false;
CurrentPos_DistanceFromLastNode:=-1;
DistanceNodes:=TDistanceNodes.Create(Self);
GeoObjectTracks:=TGeoObjectTracks.Create(Self);
PositioningPanel:=nil;
Update();
end;

Destructor TfmXYToGeoCrdConvertor.Destroy;
var
  I: integer;
begin
if (flGeoSpaceIDChanged) then SaveGeoSpaceID();
PositioningPanel.Free;
GeoObjectTracks.Free;
DistanceNodes.Free;
if (CrdSysConvertorPool <> nil)
 then begin
  for I:=0 to CrdSysConvertorPool.Count-1 do TCrdSysConvertor(CrdSysConvertorPool[I]).Destroy;
  CrdSysConvertorPool.Destroy;
  end;
Inherited;
end;

procedure TfmXYToGeoCrdConvertor.Update;
begin
LoadGeoSpaceID();
//.
edGeoSpaceID.Text:=IntToStr(GeoSpaceID);
edGeoSpaceName.Text:=GeoSpaceName;
edGeoSpaceName.Hint:=edGeoSpaceName.Text;
end;

procedure TfmXYToGeoCrdConvertor.RecalculateReflectorCenterCrdAndScale();
var
  Xc,Yc: double;
  _GeoSpaceID: integer;
  idGeoCrdSystem: integer;
  SC: TCursor;
  I: integer;
  GeoCrdSystem_GeoSpaceID: integer;
  GeoCrdSystem_Name: string;
  GeoCrdSystem_Datum: string;
  GeoCrdSystem_Projection: string;
  GeoCrdSystem_ProjectionData: TMemoryStream;
  PointsLoad_Lat,PointsLoad_Long,Lat,Long: Extended;
  Lat0,Long0: double;
  Scale_X,Scale_Y: Extended;
  Scale_Lat,Scale_Long: Extended;
  ScaleDistance: Extended;
  RW: TReflectionWindowStrucEx;
begin
GetReflectorCenterXY(Xc,Yc);
CurrentPos_X:=Xc;
CurrentPos_Y:=Yc;
CurrentPos_flXYCalculated:=true;
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByXYLocally(Xc,Yc,{out} _GeoSpaceID,{out} idGeoCrdSystem);
//. changing GeoSpaceID if new one found
if ((_GeoSpaceID <> 0) AND (_GeoSpaceID <> GeoSpaceID))
 then begin
  GeoSpaceID:=_GeoSpaceID;
  //.
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  SaveGeoSpaceID();
  //.
  Update();
  UpdateCompass();
  finally
  Screen.Cursor:=SC;
  end;
  end;
//.
if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
 then begin
  CrdSysConvertor:=nil;
  //.
  if (idGeoCrdSystem <> 0)
   then begin
    for I:=0 to CrdSysConvertorPool.Count-1 do
      if (TCrdSysConvertor(CrdSysConvertorPool[I]).idCrdSys = idGeoCrdSystem)
       then begin
        CrdSysConvertor:=CrdSysConvertorPool[I];
        Break; //. >
        end;
    if (CrdSysConvertor = nil)
     then begin
      SC:=Screen.Cursor;
      try
      Screen.Cursor:=crHourGlass;
      //.
      CrdSysConvertor:=TCrdSysConvertor.Create(Reflector.Space,idGeoCrdSystem);
      if (NOT CrdSysConvertor.XYToGeo_LoadPoints(Xc,Yc)) then FreeAndNil(CrdSysConvertor);
      //. add new converter to the pool
      if (CrdSysConvertor <> nil) then CrdSysConvertorPool.Insert(0,CrdSysConvertor);
      finally
      Screen.Cursor:=SC;
      end;
      end;
    //. show geo-crd system name
    with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idGeoCrdSystem)) do
    try
    GetDataLocally(GeoCrdSystem_GeoSpaceID,GeoCrdSystem_Name,GeoCrdSystem_Datum,GeoCrdSystem_Projection,GeoCrdSystem_ProjectionData);
    try
    edCrdSystemName.Text:=GeoCrdSystem_Name;
    edCrdSystemName.Hint:=edCrdSystemName.Text;
    finally
    GeoCrdSystem_ProjectionData.Free;
    end;
    finally
    Release;
    end;
    end;
  end;
finally
Release;
end;
//.
if (CrdSysConvertor = nil)
 then begin
  TransformFactor:=0;
  Scale:=-1;
  CurrentPos_flLatLongCalculated:=false;
  CurrentPos_DistanceFromLastNode:=-1;
  edCrdSystemName.Text:='?';
  edCrdSystemName.Hint:=edCrdSystemName.Text;
  edLatitude.Text:='?';
  edLongitude.Text:='?';
  edDistanceFromLastNode.Text:='?';
  edScale.Text:='?';
  Exit; //. ->
  end;
if (CrdSysConvertor.ConvertXYToGeo(Xc,Yc, Lat,Long))
 then begin
  //. getting the coordinates
  if (CrdSysConvertor.flLinearApproximationCrdSys)
   then begin
    CrdSysConvertor.ConvertXYToGeo(CrdSysConvertor.XYToGeo_Points_X,CrdSysConvertor.XYToGeo_Points_Y, PointsLoad_Lat,PointsLoad_Long);
    if (CrdSysConvertor.GetDistance(PointsLoad_Lat,PointsLoad_Long, Lat,Long) > MaxDistanceForGeodesyPointsReload)
     then CrdSysConvertor.XYToGeo_LoadPoints(Xc,Yc);
    CrdSysConvertor.ConvertXYToGeo(Xc,Yc, Lat,Long);
    end;
  CurrentPos_Lat:=Lat;
  CurrentPos_Long:=Long;
  CurrentPos_flLatLongCalculated:=true;
  edLatitude.Text:=CrdToStr(Lat);
  edLongitude.Text:=CrdToStr(Long);
  if (DistanceNodes.GetLastNodeCrd(Lat0,Long0))
   then begin
    CurrentPos_DistanceFromLastNode:=CrdSysConvertor.GetDistance(Lat0,Long0, Lat,Long);
    edDistanceFromLastNode.Text:=FormatFloat('0.000',CurrentPos_DistanceFromLastNode);
    end
   else begin
    CurrentPos_DistanceFromLastNode:=-1;
    edDistanceFromLastNode.Text:='';
    end;
  //. getting the scale
  Reflector.ReflectionWindow.GetWindow(true, RW);
  Scale_X:=(RW.X1+RW.X2)/2.0;
  Scale_Y:=(RW.Y1+RW.Y2)/2.0;
  CrdSysConvertor.ConvertXYToGeo(Scale_X,Scale_Y, Scale_Lat,Scale_Long);
  ScaleDistance:=CrdSysConvertor.GetDistance(Scale_Lat,Scale_Long, Lat,Long);
  TransformFactor:=ScaleDistance/(Sqrt(sqr(RW.X1-RW.X0)+sqr(RW.Y1-RW.Y0))/2.0);
  Scale:=ScaleDistance/((RW.Xmx-RW.Xmn)/2.0);
  edScale.Text:=FormatFloat('0',Scale*(Screen.PixelsPerInch/2.5));
  end
 else begin
  TransformFactor:=0;
  Scale:=-1;
  CurrentPos_flLatLongCalculated:=false;
  edLatitude.Text:='?';
  edLongitude.Text:='?';
  edDistanceFromLastNode.Text:='?';
  edScale.Text:='?';
  end;
//.
Inherited Update();
end;

function TfmXYToGeoCrdConvertor.ConvertXYToGeoCrd(const X,Y: Extended; out Lat,Long: Extended): boolean;
begin
Result:=false;
if (CrdSysConvertor = nil) then Exit; //. ->
Result:=(CrdSysConvertor.ConvertXYToGeo(X,Y, Lat,Long));
end;

function TfmXYToGeoCrdConvertor.ConvertGeoGrdToXY(const Lat,Long: Extended; out X,Y: Extended): boolean;
begin
Result:=false;
if (CrdSysConvertor = nil) then Exit; //. ->
CrdSysConvertor.GeoToXY_Points:=CrdSysConvertor.XYToGeo_Points;
Result:=CrdSysConvertor.ConvertGeoToXY(Lat,Long, X,Y);
end;

function TfmXYToGeoCrdConvertor.ConvertXYToGeoCrd(const X,Y: Extended; out DatumID: integer; out Lat,Long: Extended): boolean;
begin
Result:=false;
if (CrdSysConvertor = nil) then Exit; //. ->
Result:=(CrdSysConvertor.ConvertXYToGeo(X,Y, Lat,Long));
if (Result) then DatumID:=CrdSysConvertor.DatumID;
end;

function TfmXYToGeoCrdConvertor.ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long: Extended; out X,Y: Extended): boolean;
var
  _Lat,_Long,_Alt: Extended;
begin
Result:=false;
if (CrdSysConvertor = nil) then Exit; //. ->
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,0, CrdSysConvertor.DatumID,  _Lat,_Long,_Alt);
CrdSysConvertor.GeoToXY_Points:=CrdSysConvertor.XYToGeo_Points;
Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
end;

function TfmXYToGeoCrdConvertor.AbsoluteConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: Extended; out X,Y: Extended): boolean;
var
  GeoSpaceDatumID: integer;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  flTransformPointsLoaded: boolean;
begin
Result:=false;
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//.
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,Alt, GeoSpaceDatumID,  _Lat,_Long,_Alt);
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(GeoSpaceID, _Lat,_Long,  idGeoCrdSystem);
finally
Release();
end;
if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
 then begin
  FreeAndNil(CrdSysConvertor);
  //.
  if (idGeoCrdSystem <> 0)
   then begin
    CrdSysConvertor:=TCrdSysConvertor.Create(Reflector.Space,idGeoCrdSystem);
    flTransformPointsLoaded:=false;
    end;
  end;
if (CrdSysConvertor <> nil)
 then begin
  ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
  if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
   then begin
    CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
    flTransformPointsLoaded:=true;
    end;
  //.
  Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
  end;
end;

function TfmXYToGeoCrdConvertor.AbsoluteConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: Extended; const pGeoSpaceID: integer; out X,Y: Extended): boolean;
var
  GeoSpaceDatumID: integer;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  CrdSysConvertor: TCrdSysConvertor;
begin
Result:=false;
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,pGeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release();
end;
//.
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,Alt, GeoSpaceDatumID,  _Lat,_Long,_Alt);
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(pGeoSpaceID, _Lat,_Long,{out} idGeoCrdSystem);
finally
Release();
end;
if (idGeoCrdSystem = 0) then Exit; //. ->
CrdSysConvertor:=TCrdSysConvertor.Create(Reflector.Space,idGeoCrdSystem);
try
if (CrdSysConvertor.flLinearApproximationCrdSys) then CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
//.
Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
finally
CrdSysConvertor.Destroy();
end;
end;

procedure GetCrd(const ValueStr: string; out Value: Extended);
var
  NS: string;
  I: integer;
  C: Char;
begin
Value:=0;
C:=DecimalSeparator;DecimalSeparator:='.';
try
//. degree
NS:='';
I:=1;
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> '°'
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+StrToInt(NS) else Raise Exception.Create('could not recognize a degrees'); //. =>
//. minuts
Inc(I); //. skip [.]
NS:='';
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> ''''
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+StrToInt(NS)/60 else Raise Exception.Create('could not recognize a minuts'); //. =>
//. seconds
Inc(I); //. skip [']
NS:='';
while I <= Length(ValueStr) do begin
  if ValueStr[I] <> ''''
   then begin if (ValueStr[I] <> '_') AND (ValueStr[I] <> ' ') then NS:=NS+ValueStr[I] end
   else Break; //. >
  Inc(I);
  end;
if NS <> '' then Value:=Value+((1/60)/60)*(StrToFloat(NS)) else Raise Exception.Create('could not recognize a seconds'); //. =>
finally
DecimalSeparator:=C;
end;
//.
end;

procedure TfmXYToGeoCrdConvertor.SetReflectorPositionByGeoCrd();
var
  Lat,Long: Extended;
  X,Y: Extended;
begin
if (CrdSysConvertor = nil) then Exit; //. ->
GetCrd(edLatitude.Text,Lat);
GetCrd(edLongitude.Text,Long);
CrdSysConvertor.GeoToXY_LoadPoints(Lat,Long);
if (CrdSysConvertor.ConvertGeoToXY(Lat,Long, X,Y))
 then begin
  Reflector.ShiftingSetReflection(X,Y);
  RecalculateReflectorCenterCrdAndScale;
  end
 else Raise Exception.Create('can not convert to XY'); //. =>
end;

procedure TfmXYToGeoCrdConvertor.LocatePosition(const Lat,Long: Extended);
var
  X,Y: Extended;
begin
if (CrdSysConvertor = nil) then Exit; //. ->
CrdSysConvertor.GeoToXY_LoadPoints(Lat,Long);
if (CrdSysConvertor.ConvertGeoToXY(Lat,Long, X,Y))
 then begin
  Reflector.ShiftingSetReflection(X,Y);
  RecalculateReflectorCenterCrdAndScale();
  end
 else Raise Exception.Create('can not convert to XY'); //. =>
end;

procedure TfmXYToGeoCrdConvertor.LoadGeoSpaceID;
var
  FN: string;
  TF: TextFile;
  S: string;
begin
with TProxySpaceUserProfile.Create(Reflector.Space) do
try
FN:='Reflector'+'\'+IntToStr(Reflector.id)+'\'+GeoSpaceIDFile;
if (FileExists(ProfileFolder+'\'+FN))
 then begin
  SetProfileFile(FN);
  AssignFile(TF,ProfileFile); Reset(TF);
  try
  ReadLn(TF,S);
  GeoSpaceID:=StrToInt(S);
  finally
  CloseFile(TF)
  end;
  end
 else GeoSpaceID:=88; //. default - Russia map
if (GeoSpaceID <> 0)
 then begin //. get GeoSpace Datum ID
  with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
  try
  GeoSpaceName:=Name;
  GeoSpaceDatumID:=GetDatumIDLocally();
  finally
  Release;
  end;
  end
 else begin
  GeoSpaceName:='';
  GeoSpaceDatumID:=0;
  end;
finally
Destroy;
end;
flGeoSpaceIDChanged:=false;
end;

procedure TfmXYToGeoCrdConvertor.SaveGeoSpaceID;
var
  FN: string;
  TF: TextFile;
begin
with TProxySpaceUserProfile.Create(Reflector.Space) do
try
FN:=ProfileFolder+'\'+'Reflector'+'\'+IntToStr(Reflector.id)+'\'+GeoSpaceIDFile;
ForceDirectories(ExtractFilePath(FN));
AssignFile(TF,FN); Rewrite(TF);
try
WriteLn(TF,IntToStr(GeoSpaceID));
finally
CloseFile(TF)
end;
finally
Destroy;
end;
//.
flGeoSpaceIDChanged:=false;
end;

function TfmXYToGeoCrdConvertor.CrdToStr(const Crd: Extended): string;
begin
Result:=IntToStr(Trunc(Crd))+'°'+IntToStr(Trunc(60*Frac(Abs(Crd))))+''''+IntToStr(Trunc(60*Frac(60*Frac(Abs(Crd)))))+FormatFloat('.###############',Frac(60*Frac(60*Frac(Abs(Crd)))))+'''''';
end;

procedure TfmXYToGeoCrdConvertor.GetReflectorCenterXY(out Xc,Yc: double);
begin
Reflector.ReflectionWindow.Lock.Enter;
try
with Reflector.ReflectionWindow do begin
Xc:=Xcenter/cfTransMeter;
Yc:=Ycenter/cfTransMeter;
end;
finally
Reflector.ReflectionWindow.Lock.Leave;
end;
end;

procedure TfmXYToGeoCrdConvertor.edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  try
  GeoSpaceID:=StrToInt(edGeoSpaceID.Text);
  flGeoSpaceIDChanged:=true;
  except
    edGeoSpaceID.Text:=IntToStr(GeoSpaceID);
    Raise; //. ->
    end;
  //.
  if (GeoSpaceID <> 0)
   then begin //. get GeoSpace Datum ID
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
    try
    GeoSpaceName:=Name;
    GeoSpaceDatumID:=GetDatumIDLocally();
    finally
    Release;
    end;
    end
   else begin
    GeoSpaceName:='';
    GeoSpaceDatumID:=0;
    end;
  edGeoSpaceName.Text:=GeoSpaceName;
  edGeoSpaceName.Hint:=edGeoSpaceName.Text;
  //. recalculate all tracks
  GeoObjectTracks.RecalculateItemsTrackBindings();
  GeoObjectTracks.Save();
  //.
  CrdSysConvertor:=nil;
  //.
  RecalculateReflectorCenterCrdAndScale;
  UpdateCompass;
  //.
  Reflector.Reflecting.RecalcReflect();
  end;
end;

procedure TfmXYToGeoCrdConvertor.FormShow(Sender: TObject);
var
  Xc,Yc: double;
begin
GetReflectorCenterXY(Xc,Yc);
//.
CrdSysConvertor:=nil;
//.
RecalculateReflectorCenterCrdAndScale;
UpdateCompass;
end;

procedure TfmXYToGeoCrdConvertor.sbSetReflectorClick(Sender: TObject);
begin
SetReflectorPositionByGeoCrd();
end;

procedure TfmXYToGeoCrdConvertor.sbCalculateDistanceClick(Sender: TObject);
var
  Xc,Yc: double;
  Lat,Long: Extended;
begin
GetCrd(edLatitude.Text,Lat);
GetCrd(edLongitude.Text,Long);
GetReflectorCenterXY(Xc,Yc);
DistanceNodes.AddNode(Xc,Yc, Lat,Long);
DistanceNodes.ProcessNodes();
CurrentPos_flXYCalculated:=false;
if (NOT gbDistances.Visible)
 then begin
  ClientHeight:=ClientHeight+gbDistances.Height;
  Top:=Top-gbDistances.Height;
  gbDistances.Show();
  //.
  if ((Reflector.fmElectedObjectsGallery <> nil) AND (Reflector.fmElectedObjectsGallery.Visible))
   then Reflector.fmElectedObjectsGallery.Top:=Top-Reflector.fmElectedObjectsGallery.Height;
  end;
DistanceNodes.Show();
//.
Reflector.Reflecting.RecalcReflect();
end;

procedure TfmXYToGeoCrdConvertor.sbRemoveLastDistanceNodeClick(Sender: TObject);
begin
DistanceNodes.RemoveLast();
DistanceNodes.ProcessNodes();
DistanceNodes.Show();
if (DistanceNodes.Nodes = nil) then edDistanceFromLastNode.Text:='';
//.
Reflector.Reflecting.RecalcReflect();
end;

procedure TfmXYToGeoCrdConvertor.sbClearDistanceNodesClick(Sender: TObject);
begin
DistanceNodes.Clear();
DistanceNodes.ProcessNodes();
DistanceNodes.Show();
edDistanceFromLastNode.Text:='';
if (gbDistances.Visible)
 then begin
  gbDistances.Hide();
  Top:=Top+gbDistances.Height;
  ClientHeight:=ClientHeight-gbDistances.Height;
  //.
  if ((Reflector.fmElectedObjectsGallery <> nil) AND (Reflector.fmElectedObjectsGallery.Visible))
   then Reflector.fmElectedObjectsGallery.Top:=Top-Reflector.fmElectedObjectsGallery.Height;
  end;
//.
Reflector.Reflecting.RecalcReflect();
end;

procedure TfmXYToGeoCrdConvertor.UpdateCompass;
var
  X,Y: Extended;
  Xc,Yc: Extended;
  Lat,Long, Lat1,Long1: Extended;
  Angle: Extended;
  Grd: integer;
  Index: integer;
begin
Reflector.ReflectionWindow.Lock.Enter;
try
with Reflector.ReflectionWindow do begin
X:=(X1+X2)/(2.0*cfTransMeter);
Y:=(Y1+Y2)/(2.0*cfTransMeter);
Xc:=Xcenter/cfTransMeter;
Yc:=Ycenter/cfTransMeter;
end;
finally
Reflector.ReflectionWindow.Lock.Leave;
end;
//.
if (NOT (ConvertXYToGeoCrd(Xc,Yc, Lat,Long) AND ConvertXYToGeoCrd(X,Y, Lat1,Long1))) then Exit; //. ->
if (Lat1-Lat) <> 0
 then begin
  Angle:=Arctan((Long1-Long)/(Lat1-Lat));
  if ((Lat1-Lat) < 0) AND ((Long1-Long) > 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) < 0) AND ((Long1-Long) < 0) then Angle:=Angle+PI else
  if ((Lat1-Lat) > 0) AND ((Long1-Long) < 0) then Angle:=Angle+2*PI;
  end
 else
  if (Long1-Long) >= 0
   then Angle:=PI/2
   else Angle:=3*PI/2;
Angle:=(2*PI-Angle)+PI/2;
while Angle > 2*PI do Angle:=Angle-2*PI;
CompassAngle:=Angle;
Index:=Round(gaCompass.Image.Count*(Angle/(2*PI)));
if Index = gaCompass.Image.Count then Index:=0;
gaCompass.FrameIndex:=Index;
gaCompass.Update;
Grd:=Round(Angle*180/PI); if Grd = 360 then Grd:=0;
lbCompassAngle.Caption:=' '+IntToStr(Grd)+'°';
lbCompassAngle.Update();
end;

procedure TfmXYToGeoCrdConvertor.sbAlignToNorthClick(Sender: TObject);
var
  Lat,Long, Lat1,Long1: Extended;
  _X1,_Y1: Extended;
  X0,Y0, X1,Y1: Extended;
  Geo_X0,Geo_Y0, Geo_X1,Geo_Y1: Extended;
  ALFA,BETTA,GAMMA: Extended;
begin
Reflector.ReflectionWindow.Lock.Enter;
try
with Reflector.ReflectionWindow do begin
Geo_X0:=Xcenter/cfTransMeter;
Geo_Y0:=Ycenter/cfTransMeter;
end;
X1:=(Reflector.ReflectionWindow.X1+Reflector.ReflectionWindow.X2)/(2.0*cfTransMeter);
Y1:=(Reflector.ReflectionWindow.Y1+Reflector.ReflectionWindow.Y2)/(2.0*cfTransMeter);
finally
Reflector.ReflectionWindow.Lock.Leave;
end;
//.
if (NOT (ConvertXYToGeoCrd(Geo_X0,Geo_Y0, Lat,Long) AND (ConvertGeoGrdToXY(Lat,Long+(1.0{Grad}), _X1,_Y1)))) then Exit; //. ->
Geo_X1:=_X1;
Geo_Y1:=_Y1;
X0:=Geo_X0;
Y0:=Geo_Y0;
if ((Geo_X1-Geo_X0) <> 0)
 then
  ALFA:=Arctan((Geo_Y1-Geo_Y0)/(Geo_X1-Geo_X0))
 else
  if ((Geo_Y1-Geo_Y0) >= 0)
   then ALFA:=PI/2
   else ALFA:=-PI/2;
if ((X1-X0) <> 0)
 then
  BETTA:=Arctan((Y1-Y0)/(X1-X0))
 else
  if ((Y1-Y0) >= 0)
   then BETTA:=PI/2
   else BETTA:=-PI/2;
GAMMA:=(ALFA-BETTA);
if ((Geo_X1-Geo_X0)*(X1-X0) < 0)
 then
  if ((Geo_Y1-Geo_Y0)*(Y1-Y0) >= 0)
   then GAMMA:=GAMMA-PI
   else GAMMA:=GAMMA+PI;
with Reflector do begin
GAMMA:=-GAMMA;
if (GAMMA < -PI)
 then
  GAMMA:=GAMMA+2*PI
 else
  if (GAMMA > PI)
   then
    GAMMA:=GAMMA-2*PI;
while (Abs(GAMMA) > PI/32) do begin
  RotateReflection(PI/32*(GAMMA/Abs(GAMMA)));
  GAMMA:=GAMMA-PI/32*(GAMMA/Abs(GAMMA));
  end;
RotateReflection(GAMMA);
end;
end;

procedure TfmXYToGeoCrdConvertor.sbCrdMeshClick(Sender: TObject);
begin
Reflector.Reflecting.RecalcReflect();
end;

procedure TfmXYToGeoCrdConvertor.sbGeoMonitorObjectTreePanelClick(Sender: TObject);
var
  Panel: TForm;
begin
Panel:=Reflector.Space.Plugins__CoGeoMonitorObjects_GetTreePanel();
if (Panel = nil) then Exit; //. ->
Panel.Left:=0;
Panel.Top:=(Screen.WorkAreaHeight-Panel.Height) DIV 2;
Panel.Show();
end;

procedure TfmXYToGeoCrdConvertor.sbTracksClick(Sender: TObject);
begin
GeoObjectTracks.ShowControlPanel();
end;

procedure TfmXYToGeoCrdConvertor.sbGeoSpaceClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID) do
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

procedure TfmXYToGeoCrdConvertor.sbSelectGeoSpaceClick(Sender: TObject);
var
  GSIS: TfmTGeoSpaceInstanceSelector;
  NewGeoSpaceID: integer;
  SC: TCursor;
  LastDatumID: integer;
  LastLat,LastLong: Extended;
  flCoordsAvailable: boolean;
  X,Y: Extended;
begin
GSIS:=nil;
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
GSIS:=TfmTGeoSpaceInstanceSelector.Create();
finally
Screen.Cursor:=SC;
end;
//.
if ((GSIS.Select(NewGeoSpaceID,GeoSpaceName)) AND (NewGeoSpaceID <> GeoSpaceID))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  LastDatumID:=GeoSpaceDatumID; 
  try
  GetCrd(edLatitude.Text,{out} LastLat);
  GetCrd(edLongitude.Text,{out} LastLong);
  flCoordsAvailable:=true;
  except
    flCoordsAvailable:=false;
    end;
  //.
  GeoSpaceID:=NewGeoSpaceID;
  flGeoSpaceIDChanged:=true;
  edGeoSpaceID.Text:=IntToStr(GeoSpaceID);
  //.
  if (GeoSpaceID <> 0)
   then begin //. get GeoSpace Datum ID
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
    try
    GeoSpaceName:=Name;
    GeoSpaceDatumID:=GetDatumIDLocally();
    finally
    Release;
    end;
    end
   else begin
    GeoSpaceName:='';
    GeoSpaceDatumID:=0;
    end;
  edGeoSpaceName.Text:=GeoSpaceName;
  edGeoSpaceName.Hint:=edGeoSpaceName.Text;
  //. recalculate all tracks
  GeoObjectTracks.RecalculateItemsTrackBindings();
  GeoObjectTracks.Save();
  //.
  CrdSysConvertor:=nil;
  //. set position to the last coordinates
  if (flCoordsAvailable AND (LastDatumID <> 0) AND AbsoluteConvertGeoGrdToXY(LastDatumID,LastLat,LastLong,0.0{altitude},{out} X,Y))
   then Reflector.ShiftingSetReflection(X,Y);
  //.
  RecalculateReflectorCenterCrdAndScale();
  UpdateCompass();
  //.
  Reflector.Reflecting.RecalcReflect();
  finally
  Screen.Cursor:=SC;
  end;
  end;
finally
GSIS.Free();
end;
end;

procedure TfmXYToGeoCrdConvertor.sbShowGeoCrdSystemPropsPanelClick(Sender: TObject);
begin
if (CrdSysConvertor <> nil)
 then with TComponentFunctionality_Create(idTGeoCrdSystem,CrdSysConvertor.idCrdSys) do
  try
  with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show;
  end;
  finally
  Release;
  end;
end;

procedure TfmXYToGeoCrdConvertor.sbPositioningClick(Sender: TObject);
begin
if (PositioningPanel = nil) then PositioningPanel:=TfmGeoPositionReceiver.Create(Self);
PositioningPanel.Show();
end;

procedure TfmXYToGeoCrdConvertor.FormHide(Sender: TObject);
begin
if (PositioningPanel <> nil) then PositioningPanel.Hide();
end;

procedure TfmXYToGeoCrdConvertor.sbSearchComponentsClick(Sender: TObject);
var
  GeoSpaceFunctionality: TGeoSpaceFunctionality;
begin
GeoSpaceFunctionality:=TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID));
with GeoSpaceFunctionality do
try
Check();
with TfmGeoSpaceMapFormatObjectSearchPanel.Create(GeoSpaceFunctionality) do Show();
finally
Release;
end;
end;


end.
