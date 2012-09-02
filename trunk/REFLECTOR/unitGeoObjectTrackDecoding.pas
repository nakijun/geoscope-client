unit unitGeoObjectTrackDecoding;

interface

uses
  Classes,
  MSXML,
  NativeXML,
  GlobalSpaceDefines,
  unitObjectModel;

  {Track routines}
  procedure Track_GetTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
  procedure Track_GetObjectModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
  procedure Track_GetBusinessModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
  procedure Track_GetBusinessModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
  function  Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const EventSeverity: TObjectTrackEventSeverity; out Events: TObjectTrackEvents): boolean; overload;
  function  Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const TagBase,TagLength: integer; out Events: TObjectTrackEvents): boolean; overload;


type
  TTrackStopsAndMovementsAnalysisIntervalPosition = record
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    X,Y: TCrd;
  end;

  TTrackStopsAndMovementsAnalysisIntervalDescriptor = record
    Position: TTrackStopsAndMovementsAnalysisIntervalPosition;
    Duration: TDateTime;
    Distance: double;
    MinSpeed: double;
    MaxSpeed: double;
    AvrSpeed: double;
    flMovement: boolean;
  end;

  TTrackStopsAndMovementsAnalysisInterval = class
    Position: TTrackStopsAndMovementsAnalysisIntervalPosition;
    Duration: TDateTime;
    Distance: double;
    MinSpeed: double;
    MaxSpeed: double;
    AvrSpeed: double;
    flMovement: boolean;

    function GetDescriptor(): TTrackStopsAndMovementsAnalysisIntervalDescriptor;
  end;

  TTrackStopsAndMovementsAnalysis = class
  public
    Items: TList;
    ProcessedCount: integer;

    Constructor Create();
    Destructor Destroy(); override;
    procedure Clear();
    procedure Process(const ptrGeoObjectTrack: pointer);
    function StopsDuration(): double;
    function MovementsDuration(): double;
    function  FromXMLNode(const Node: IXMLDOMNode): boolean; overload;
    function  FromXMLNode(const Node: TXMLNode): boolean; overload;
    procedure ToXMLNode(const Doc: IXMLDOMDocument; const Node: IXMLDOMElement);
  end;

  TFuelConsumptionRateTableItem = record
    Speed: double;
    Consumption: double;
  end;

  TFuelConsumptionRateTable = class
  public
    Items: array of TFuelConsumptionRateTableItem;

    Constructor Create(const Data: TMemoryStream);
    Destructor Destroy(); override;
    function GetSpeedConsumption(const Speed: double): double;
  end;


implementation
uses
  SysUtils,
  Math,
  TypesDefines,
  GeoTransformations;


{Object Track routines}
procedure Track_GetTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
var
  ptrItem: pointer;
begin
BeginTime:=0.0;
EndTime:=0.0;
with TGeoObjectTrack(ptrTrack^) do begin
if (Nodes = nil) then Exit; //. ->
BeginTime:=MaxDouble;
EndTime:=-MaxDouble;
ptrItem:=Nodes;
while (ptrItem <> nil) do with TObjectTrackNode(ptrItem^) do begin
  if (TimeStamp <> EmptyTime)
   then begin
    if (TimeStamp < BeginTime) then BeginTime:=TimeStamp;
    if (TimeStamp > EndTime) then EndTime:=TimeStamp;
    end;
  //.
  ptrItem:=Next;
  end;
end;
end;

procedure Track_GetObjectModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
var
  ptrItem: pointer;
begin
BeginTime:=0.0;
EndTime:=0.0;
with TGeoObjectTrack(ptrTrack^) do begin
if (ObjectModelEvents = nil) then Exit; //. ->
BeginTime:=MaxDouble;
EndTime:=-MaxDouble;
ptrItem:=ObjectModelEvents;
while (ptrItem <> nil) do with TObjectTrackEvent(ptrItem^) do begin
  if (TimeStamp <> EmptyTime)
   then begin
    if (TimeStamp < BeginTime) then BeginTime:=TimeStamp;
    if (TimeStamp > EndTime) then EndTime:=TimeStamp;
    end;
  //.
  ptrItem:=Next;
  end;
end;
end;

procedure Track_GetBusinessModelEventsTimestamps(const ptrTrack: pointer; out BeginTime,EndTime: TDateTime);
var
  ptrItem: pointer;
begin
BeginTime:=0.0;
EndTime:=0.0;
with TGeoObjectTrack(ptrTrack^) do begin
if (BusinessModelEvents = nil) then Exit; //. ->
BeginTime:=MaxDouble;
EndTime:=-MaxDouble;
ptrItem:=BusinessModelEvents;
while (ptrItem <> nil) do with TObjectTrackEvent(ptrItem^) do begin
  if (TimeStamp <> EmptyTime)
   then begin
    if (TimeStamp < BeginTime) then BeginTime:=TimeStamp;
    if (TimeStamp > EndTime) then EndTime:=TimeStamp;
    end;
  //.
  ptrItem:=Next;
  end;
end;
end;

procedure Track_GetBusinessModelEventsInfo(const ptrTrack: pointer; out InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer);
var
  ptrEvent: pointer;
begin
InfoEventsCounter:=0;
MinorEventsCounter:=0;
MajorEventsCounter:=0;
CriticalEventsCounter:=0;
//.
with TGeoObjectTrack(ptrTrack^) do begin
ptrEvent:=BusinessModelEvents;
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
end;

function Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const EventSeverity: TObjectTrackEventSeverity; out Events: TObjectTrackEvents): boolean;
var
  EndTimeStamp: TDateTime;
  ptrItem: pointer;
  EL: TList;
  I: integer;
begin
Result:=false;
Events:=nil;
EndTimeStamp:=pTimeStamp+IntervalDuration;
EL:=TList.Create();
try
with TGeoObjectTrack(ptrTrack^) do begin
if (BusinessModelEvents = nil) then Exit; //. ->
ptrItem:=BusinessModelEvents;
while (ptrItem <> nil) do with TObjectTrackEvent(ptrItem^) do begin
  if ((Severity = EventSeverity) AND ((pTimeStamp <= TimeStamp) AND (TimeStamp <= EndTimeStamp)))
   then begin
    EL.Add(ptrItem);
    Result:=true;
    end;
  //.
  ptrItem:=Next;
  end;
end;
if (Result)
 then begin
  SetLength(Events,EL.Count);
  for I:=0 to EL.Count-1 do Events[I]:=TObjectTrackEvent(EL[I]^);
  end;
finally
EL.Destroy();
end;
end;

function Track_GetNearestBusinessModelEvents(const ptrTrack: pointer; const pTimeStamp: TDateTime; const IntervalDuration: TDateTime; const TagBase,TagLength: integer; out Events: TObjectTrackEvents): boolean;
var
  EndTimeStamp: TDateTime;
  ptrItem: pointer;
  EL: TList;
  TagEnd: integer;
  I: integer;
begin
Result:=false;
Events:=nil;
EndTimeStamp:=pTimeStamp+IntervalDuration;
TagEnd:=TagBase+TagLength;
EL:=TList.Create();
try
with TGeoObjectTrack(ptrTrack^) do begin
if (BusinessModelEvents = nil) then Exit; //. ->
ptrItem:=BusinessModelEvents;
while (ptrItem <> nil) do with TObjectTrackEvent(ptrItem^) do begin
  if (((pTimeStamp <= TimeStamp) AND (TimeStamp <= EndTimeStamp)) AND ((TagBase <= EventTag) AND (EventTag < TagEnd)))
   then begin
    EL.Add(ptrItem);
    Result:=true;
    end;
  //.
  ptrItem:=Next;
  end;
end;
if (Result)
 then begin
  SetLength(Events,EL.Count);
  for I:=0 to EL.Count-1 do Events[I]:=TObjectTrackEvent(EL[I]^);
  end;
finally
EL.Destroy();
end;
end;


{TTrackStopsAndMovementsAnalysisInterval}
function TTrackStopsAndMovementsAnalysisInterval.GetDescriptor(): TTrackStopsAndMovementsAnalysisIntervalDescriptor;
begin
Result.Position:=Position;
Result.Duration:=Duration;
Result.Distance:=Distance;
Result.MinSpeed:=MinSpeed;
Result.MaxSpeed:=MaxSpeed;
Result.AvrSpeed:=AvrSpeed;
Result.flMovement:=flMovement;
end;


{TTrackStopsAndMovementsAnalysis}
Constructor TTrackStopsAndMovementsAnalysis.Create();
begin
Inherited Create();
Items:=TList.Create();
ProcessedCount:=0;
end;

Destructor TTrackStopsAndMovementsAnalysis.Destroy();
begin
if (Items <> nil)
 then begin
  Clear();
  FreeAndNil(Items);
  end;
Inherited;
end;

procedure TTrackStopsAndMovementsAnalysis.Clear();
var
  I: integer;
begin
for I:=0 to Items.Count-1 do TObject(Items[I]).Destroy();
Items.Clear();
end;

procedure TTrackStopsAndMovementsAnalysis.Process(const ptrGeoObjectTrack: pointer);
const
  AnalysisElementDuration = (1.0/(24*3600))*10; //. seconds
  //.
  AnalysisDuration = (1.0/(24*60))*5; //. minutes
  AnalysisDurationCounter = Trunc(AnalysisDuration/AnalysisElementDuration);
  AnalysisDistance = 50.0; //. meters
  //.
  Elements_MaxSize = 1000000;

Type
  TElement = record
    Latitude: double;
    Longitude: double;
    Distance: double;
  end;

  TElements = array of TElement;

  procedure CalculateIntervalParams(const Elements: TElements; const BeginIndex,EndIndex: integer; out Duration: TDateTime; out Distance: double; out MinSpeed,MaxSpeed,AvrSpeed: double);
  var
    I: integer;
    Speed: double;
    Sz: integer;
  begin
  Sz:=(EndIndex-BeginIndex);
  Duration:=Sz*AnalysisElementDuration;
  Distance:=0.0;
  AvrSpeed:=0.0;
  MinSpeed:=MaxDouble;
  MaxSpeed:=MinDouble;
  for I:=BeginIndex to EndIndex-1 do begin
    Distance:=Distance+Elements[I].Distance;
    Speed:=(1/24000.0)*(Elements[I].Distance/AnalysisElementDuration);
    AvrSpeed:=AvrSpeed+Speed;
    if (Speed < MinSpeed) then MinSpeed:=Speed;
    if (Speed > MaxSpeed) then MaxSpeed:=Speed;
    end;
  AvrSpeed:=AvrSpeed/Sz;
  end;

label
  MExit;
var
  GeoCrdConverter: TGeoCrdConverter;
  CurrentInterval: TTrackStopsAndMovementsAnalysisInterval;
  TrackBeginTimestamp,TrackEndTimestamp: TDateTime;
  Elements: TElements;
  Elements_Size: integer;
  Elements_Index: integer;
  BeginNode,EndNode,LastEndNode: pointer;
  Ts: TDateTime;
  Lat,NewLat,Long,NewLong,Distance,Distance_Lat,Distance_Long: Extended;
  T,dT,dLat,dLong: Extended;
  LI,I: integer;
  Radius: Extended;
  flMovement: boolean;
  TrackObjectModelEventsBeginTimestamp,TrackObjectModelEventsEndTimestamp: TDateTime;
  TrackBusinessModelEventsBeginTimestamp,TrackBusinessModelEventsEndTimestamp: TDateTime;
  LastIntervalEndTimeStamp,LastEventTimeStamp,ProcessingTimeStamp: TDateTime;
begin
try
Clear();
//.
with TGeoObjectTrack(ptrGeoObjectTrack^) do begin
BeginNode:=Nodes;
if (BeginNode = nil) then Exit; //. ->
//.
GeoCrdConverter:=TGeoCrdConverter.Create(DatumID);
try
CurrentInterval:=nil;
try
Track_GetTimestamps(ptrGeoObjectTrack,{out} TrackBeginTimestamp,TrackEndTimestamp);
Elements_Size:=Trunc((TrackEndTimestamp-TrackBeginTimestamp)/AnalysisElementDuration);
if (Elements_Size > Elements_MaxSize) then Elements_Size:=Elements_MaxSize;
SetLength(Elements,Elements_Size);
Elements_Index:=0;
//.
Ts:=TObjectTrackNode(BeginNode^).TimeStamp+AnalysisElementDuration;
Lat:=TObjectTrackNode(BeginNode^).Latitude;
Long:=TObjectTrackNode(BeginNode^).Longitude;
Distance:=0.0;
Distance_Lat:=TObjectTrackNode(BeginNode^).Latitude;
Distance_Long:=TObjectTrackNode(BeginNode^).Longitude;
EndNode:=BeginNode;
LastEndNode:=EndNode;
repeat
  EndNode:=TObjectTrackNode(EndNode^).Next;
  if (EndNode = nil) then Break; //. >
  //. workaround for retransmitted fixes
  if (TObjectTrackNode(EndNode^).TimeStamp <= TObjectTrackNode(LastEndNode^).TimeStamp) then Continue; //. ^
  //.
  if (TObjectTrackNode(EndNode^).TimeStamp < Ts)
   then begin
    Distance:=Distance+GeoCrdConverter.GetDistance(Distance_Lat,Distance_Long, TObjectTrackNode(EndNode^).Latitude,TObjectTrackNode(EndNode^).Longitude);
    Distance_Lat:=TObjectTrackNode(EndNode^).Latitude;
    Distance_Long:=TObjectTrackNode(EndNode^).Longitude;
    //.
    LastEndNode:=EndNode;
    //.
    Continue; //. ^
    end;
  //.
  dT:=(TObjectTrackNode(EndNode^).Timestamp-TObjectTrackNode(LastEndNode^).Timestamp);
  dLat:=(TObjectTrackNode(EndNode^).Latitude-TObjectTrackNode(LastEndNode^).Latitude);
  dLong:=(TObjectTrackNode(EndNode^).Longitude-TObjectTrackNode(LastEndNode^).Longitude);
  //.
  while (TObjectTrackNode(EndNode^).TimeStamp >= Ts) do begin
    T:=Ts-TObjectTrackNode(LastEndNode^).Timestamp;
    NewLat:=(TObjectTrackNode(LastEndNode^).Latitude+T*dLat/dT);
    NewLong:=(TObjectTrackNode(LastEndNode^).Longitude+T*dLong/dT);
    Distance:=Distance+GeoCrdConverter.GetDistance(Distance_Lat,Distance_Long, NewLat,NewLong);
    //.
    Elements[Elements_Index].Latitude:=Lat;
    Elements[Elements_Index].Longitude:=Long;
    Elements[Elements_Index].Distance:=Distance;
    Inc(Elements_Index);
    if (Elements_Index >= Elements_Size) then GoTo MExit; //. ->
    //.
    Distance:=0.0;
    Lat:=NewLat;
    Long:=NewLong;
    Distance_Lat:=Lat;
    Distance_Long:=Long;
    Ts:=Ts+AnalysisElementDuration;
    end;
  //.
  LastEndNode:=EndNode;
until (false);
MExit:
Elements_Size:=Elements_Index;
//.
Elements_Index:=0;
LI:=(Elements_Size-AnalysisDurationCounter);
I:=0;
while (I < LI) do begin
  Radius:=GeoCrdConverter.GetDistance(Elements[I].Latitude,Elements[I].Longitude, Elements[I+AnalysisDurationCounter].Latitude,Elements[I+AnalysisDurationCounter].Longitude);
  flMovement:=(Radius >= AnalysisDistance);
  //.
  if ((CurrentInterval = nil) OR (flMovement <> CurrentInterval.flMovement))
   then begin
    ///? Inc(I,(AnalysisDurationCounter-1));
    //.
    if (CurrentInterval <> nil)
     then begin
      ///? with CurrentInterval do CalculateIntervalParams(Elements, Elements_Index,I,{out} Duration,Distance,MinSpeed,MaxSpeed,AvrSpeed);
      with CurrentInterval do CalculateIntervalParams(Elements, Elements_Index,I+(AnalysisDurationCounter-1),{out} Duration,Distance,MinSpeed,MaxSpeed,AvrSpeed);
      //.
      CurrentInterval:=nil;
      end;
    //.
    Elements_Index:=I;
    //.
    CurrentInterval:=TTrackStopsAndMovementsAnalysisInterval.Create();
    CurrentInterval.flMovement:=flMovement;
    //.
    CurrentInterval.Position.TimeStamp:=TrackBeginTimestamp+(Elements_Index*AnalysisElementDuration);
    CurrentInterval.Position.Latitude:=Elements[Elements_Index].Latitude;
    CurrentInterval.Position.Longitude:=Elements[Elements_Index].Longitude;
    //.
    Items.Add(CurrentInterval);
    end;
  //.
  Inc(I);
  end;
if (CurrentInterval <> nil)
 then begin
  with CurrentInterval do CalculateIntervalParams(Elements, Elements_Index,Elements_Size,{out} Duration,Distance,MinSpeed,MaxSpeed,AvrSpeed);
  //.
  CurrentInterval:=nil;
  end;
//. process additional stop interval at the and of track
if (Items.Count > 0)
 then begin
  LastEventTimeStamp:=TrackEndTimestamp;
  if (ObjectModelEvents <> nil)
   then begin
    Track_GetObjectModelEventsTimestamps(ptrGeoObjectTrack,{out} TrackObjectModelEventsBeginTimestamp,TrackObjectModelEventsEndTimestamp);
    if (TrackObjectModelEventsEndTimestamp > LastEventTimeStamp) then LastEventTimeStamp:=TrackObjectModelEventsEndTimestamp;
    end;
  if (BusinessModelEvents <> nil)
   then begin
    Track_GetBusinessModelEventsTimestamps(ptrGeoObjectTrack,{out} TrackBusinessModelEventsBeginTimestamp,TrackBusinessModelEventsEndTimestamp);
    if (TrackBusinessModelEventsEndTimestamp > LastEventTimeStamp) then LastEventTimeStamp:=TrackBusinessModelEventsEndTimestamp;
    end;
  ProcessingTimeStamp:=Now-TimeZoneDelta;
  if (Trunc(LastEventTimeStamp) = Trunc(ProcessingTimeStamp)) then LastEventTimeStamp:=ProcessingTimeStamp; //. shift end time to processing time
  //.
  with TTrackStopsAndMovementsAnalysisInterval(Items[Items.Count-1]) do begin
  LastIntervalEndTimeStamp:=Position.TimeStamp+Duration;
  dT:=(LastEventTimeStamp-LastIntervalEndTimeStamp);
  if (dT > 0) ///- (dT > AnalysisDuration)
   then
    if (NOT flMovement)
     then Duration:=Duration+dT
     else begin
      CurrentInterval:=TTrackStopsAndMovementsAnalysisInterval.Create();
      CurrentInterval.flMovement:=false;
      //.
      CurrentInterval.Position.TimeStamp:=LastIntervalEndTimeStamp;
      CurrentInterval.Position.Latitude:=Distance_Lat;
      CurrentInterval.Position.Longitude:=Distance_Long;
      CurrentInterval.Duration:=dT;
      //.
      Items.Add(CurrentInterval);
      //.
      CurrentInterval:=nil;
      end;
  end;
  end;
finally
CurrentInterval.Free();
end;
finally
GeoCrdConverter.Destroy();
end;
end;
finally
Inc(ProcessedCount);
end;
end;

function TTrackStopsAndMovementsAnalysis.StopsDuration(): double;
var
  I: integer;
begin
Result:=0.0;
for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do
  if (NOT flMovement)
   then Result:=Result+Duration;
end;

function TTrackStopsAndMovementsAnalysis.MovementsDuration(): double;
var
  I: integer;
begin
Result:=0.0;
for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do
  if (flMovement)
   then Result:=Result+Duration;
end;

function TTrackStopsAndMovementsAnalysis.FromXMLNode(const Node: IXMLDOMNode): boolean;
var
  I: integer;
  ItemNode: IXMLDOMNode;
  NewItem: TTrackStopsAndMovementsAnalysisInterval;
begin
Result:=false;
Clear();
//.
try
Items.Capacity:=Node.childNodes.length;
for I:=0 to Node.childNodes.length-1 do begin
  ItemNode:=Node.childNodes[I];
  //.
  try
  NewItem:=TTrackStopsAndMovementsAnalysisInterval.Create();
  NewItem.Position.TimeStamp:=ItemNode.selectSingleNode('TimeStamp').nodeTypedValue;
  NewItem.Position.Latitude:=ItemNode.selectSingleNode('Latitude').nodeTypedValue;
  NewItem.Position.Longitude:=ItemNode.selectSingleNode('Longitude').nodeTypedValue;
  NewItem.Position.X:=ItemNode.selectSingleNode('X').nodeTypedValue;
  NewItem.Position.Y:=ItemNode.selectSingleNode('Y').nodeTypedValue;
  NewItem.Duration:=ItemNode.selectSingleNode('Duration').nodeTypedValue;
  NewItem.Distance:=ItemNode.selectSingleNode('Distance').nodeTypedValue;
  NewItem.MinSpeed:=ItemNode.selectSingleNode('MinSpeed').nodeTypedValue;
  NewItem.MaxSpeed:=ItemNode.selectSingleNode('MaxSpeed').nodeTypedValue;
  NewItem.AvrSpeed:=ItemNode.selectSingleNode('AvrSpeed').nodeTypedValue;
  NewItem.flMovement:=ItemNode.selectSingleNode('flMovement').nodeTypedValue;
  except
    FreeAndNil(NewItem);
    Raise; //. =>
    end;
  //.
  Items.Add(NewItem);
  end;
except
  Clear();
  Raise; //. =>
  end;
Result:=true;
end;

function TTrackStopsAndMovementsAnalysis.FromXMLNode(const Node: TXMLNode): boolean;
var
  I: integer;
  ItemNode: TXMLNode;
  NewItem: TTrackStopsAndMovementsAnalysisInterval;
begin
Result:=false;
Clear();
//.
try
Items.Capacity:=Node.ChildContainerCount;
for I:=0 to Node.ChildContainerCount-1 do begin
  ItemNode:=Node.ChildContainers[I];
  //.
  try
  NewItem:=TTrackStopsAndMovementsAnalysisInterval.Create();
  NewItem.Position.TimeStamp:=ItemNode.NodeByName('TimeStamp').ValueAsFloat;
  NewItem.Position.Latitude:=ItemNode.NodeByName('Latitude').ValueAsFloat;
  NewItem.Position.Longitude:=ItemNode.NodeByName('Longitude').ValueAsFloat;
  NewItem.Position.X:=ItemNode.NodeByName('X').ValueAsFloat;
  NewItem.Position.Y:=ItemNode.NodeByName('Y').ValueAsFloat;
  NewItem.Duration:=ItemNode.NodeByName('Duration').ValueAsFloat;
  NewItem.Distance:=ItemNode.NodeByName('Distance').ValueAsFloat;
  NewItem.MinSpeed:=ItemNode.NodeByName('MinSpeed').ValueAsFloat;
  NewItem.MaxSpeed:=ItemNode.NodeByName('MaxSpeed').ValueAsFloat;
  NewItem.AvrSpeed:=ItemNode.NodeByName('AvrSpeed').ValueAsFloat;
  NewItem.flMovement:=ItemNode.NodeByName('flMovement').ValueAsBool;
  except
    FreeAndNil(NewItem);
    Raise; //. =>
    end;
  //.
  Items.Add(NewItem);
  end;
except
  Clear();
  Raise; //. =>
  end;
Result:=true;
end;

procedure TTrackStopsAndMovementsAnalysis.ToXMLNode(const Doc: IXMLDOMDocument; const Node: IXMLDOMElement);
var
  I: integer;
  ItemNode: IXMLDOMElement;
  PropNode: IXMLDOMElement;
begin
for I:=0 to Items.Count-1 do with TTrackStopsAndMovementsAnalysisInterval(Items[I]) do begin
  ItemNode:=Doc.CreateElement('I'+IntToStr(I));
  //.
  PropNode:=Doc.CreateElement('TimeStamp');             PropNode.nodeTypedValue:=Double(Position.TimeStamp);    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Latitude');              PropNode.nodeTypedValue:=Position.Latitude;             ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Longitude');             PropNode.nodeTypedValue:=Position.Longitude;            ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('X');                     PropNode.nodeTypedValue:=Position.X;                    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Y');                     PropNode.nodeTypedValue:=Position.Y;                    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Duration');              PropNode.nodeTypedValue:=Double(Duration);              ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Distance');              PropNode.nodeTypedValue:=Distance;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('MinSpeed');              PropNode.nodeTypedValue:=MinSpeed;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('MaxSpeed');              PropNode.nodeTypedValue:=MaxSpeed;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('AvrSpeed');              PropNode.nodeTypedValue:=AvrSpeed;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('flMovement');            PropNode.nodeTypedValue:=flMovement;                    ItemNode.appendChild(PropNode);
  //.
  Node.appendChild(ItemNode);
  end;
end;


{TFuelConsumptionRateTable}
Constructor TFuelConsumptionRateTable.Create(const Data: TMemoryStream);

  procedure ParseString(const S: string; out Speed,Consumption: double);
  var
    SS,SC: string;
    I: integer;
  begin
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] <> ' ')
     then SS:=SS+S[I]
     else Break; //. >
  SC:='';
  for I:=I+1 to Length(S) do
    if (S[I] <> ' ')
     then SC:=SC+S[I]
     else Break; //. >
  Speed:=StrToFloat(SS);
  Consumption:=StrToFloat(SC);
  end;

var
  I: integer;
begin
Inherited Create();
//.
if (Data <> nil)
 then
  try
  with TStringList.Create() do
  try
  LoadFromStream(Data);
  Text:=Trim(Text);
  SetLength(Items,Count);
  for I:=0 to Length(Items)-1 do ParseString(Strings[I],{out} Items[I].Speed,Items[I].Consumption);
  finally
  Destroy();
  end;
  except
    SetLength(Items,0);
    end
 else SetLength(Items,0);
end;

Destructor TFuelConsumptionRateTable.Destroy();
begin
Inherited;
end;

function TFuelConsumptionRateTable.GetSpeedConsumption(const Speed: double): double;
var
  I: integer;
begin
Result:=0.0;
if (Length(Items) = 0) then Exit; //. ->
if (Speed < Items[0].Speed) then Exit; //. ->
if (Speed > Items[Length(Items)-1].Speed)
 then begin
  Result:=Items[Length(Items)-1].Consumption;
  Exit; //. ->
  end;
for I:=0 to Length(Items)-2 do
  if ((Items[I].Speed <= Speed) AND (Speed < Items[I+1].Speed))
   then begin
    Result:=Items[I].Consumption+(Speed-Items[I].Speed)*((Items[I+1].Consumption-Items[I].Consumption)/(Items[I+1].Speed-Items[I].Speed));
    Exit; //. ->
    end;
end;


end.
