unit unitSpaceFunctionalComServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, SOAPClient_TLB, StdVcl;

type
  TcoSpaceFunctionalServer = class(TAutoObject, IcoSpaceFunctionalServer,ISpaceProvider,IGeoSpaceFunctionality,IGeoCrdSystemFunctionality,IMapFormatObjectFunctionality, ICoComponent,ITCoGeoMonitorObjectFunctionality,ICoGeoMonitorObjectFunctionality)
  private
    function __GeoSpaceConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: double; Y: double; out DatumID: integer; out Latitude: Extended; out Longitude: Extended): WordBool;
    function __GeoCrdSystemConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; out DatumID: integer; out Latitude: Extended; out Longitude: Extended): WordBool; safecall;
  protected
    //. SpaceFunctionalServer
    procedure InitializeServer; safecall;
      procedure IcoSpaceFunctionalServer.Initialize = InitializeServer;
    procedure FinalizeServer; safecall;
      procedure IcoSpaceFunctionalServer.Finalize = FinalizeServer;
    function Context_VisualizationCount: Integer; safecall;
    function Check(Code: Integer): Integer; safecall;
    //. SpaceProvider
    procedure UpdateProxySpace(const pUserName: WideString; const pUserPassword: WideString); safecall;
    procedure GetSpaceWindowOnBitmap(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; BitmapDataType: Integer; out BitmapData: PSafeArray); safecall;
    procedure GetSpaceWindowOnBitmap1(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray); safecall;
    procedure GetSpaceWindowOnBitmapSegmented(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; DivX: Integer; DivY: Integer; SegmentsOrder: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray); safecall;
    procedure GetSpaceWindowOnBitmapSegmentedWithHints(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVersion: Integer; VisualizationUserData: PSafeArray; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; DivX: Integer; DivY: Integer; SegmentsOrder: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray; out DynamicHintData: PSafeArray); safecall;
    procedure GetSpaceWindowHints(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVersion: Integer; VisualizationUserData: PSafeArray; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; flUpdateProxySpace: WordBool; out DynamicHintData: PSafeArray); safecall;
    procedure GetSpaceWindowBitmapObjectAtPosition(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; X: Integer; Y: Integer; out ObjectPtr: Integer); safecall;
    //. GeoSpace
    function GeoSpaceConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: Double; Y: Double; out Latitude: Double; out Longitude: Double): WordBool; safecall;
      function IGeoSpaceFunctionality.ConvertXYToLatLong = GeoSpaceConverter_ConvertXYToLatLong;
    function GeoSpaceConverter_ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: Double; Y: Double; DatumID: integer; out Latitude: Double; out Longitude: Double): WordBool; safecall;
      function IGeoSpaceFunctionality.ConvertXYToDatumLatLong = GeoSpaceConverter_ConvertXYToDatumLatLong;
    function GeoSpaceConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
      function IGeoSpaceFunctionality.ConvertLatLongToXY = GeoSpaceConverter_ConvertLatLongToXY;
    function GeoSpaceConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
      function IGeoSpaceFunctionality.ConvertDatumLatLongToXY = GeoSpaceConverter_ConvertDatumLatLongToXY;
    //. GeoCrdSystem
    function GeoCrdSystemConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; out Latitude: Double; out Longitude: Double): WordBool; safecall;
      function IGeoCrdSystemFunctionality.ConvertXYToLatLong = GeoCrdSystemConverter_ConvertXYToLatLong;
    function GeoCrdSystemConverter_ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; DatumID: integer; out Latitude: Double; out Longitude: Double): WordBool; safecall;
      function IGeoCrdSystemFunctionality.ConvertXYToDatumLatLong = GeoCrdSystemConverter_ConvertXYToDatumLatLong;
    function GeoCrdSystemConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
      function IGeoCrdSystemFunctionality.ConvertLatLongToXY = GeoCrdSystemConverter_ConvertLatLongToXY;
    function GeoCrdSystemConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool; safecall;
      function IGeoCrdSystemFunctionality.ConvertDatumLatLongToXY = GeoCrdSystemConverter_ConvertDatumLatLongToXY;
    //. MapFormatObject
    procedure MapFormatObject_Compile(const pUserName: WideString; const pUserPassword: WideString; idMapFormatObject: Integer); safecall;
      procedure IMapFormatObjectFunctionality.Compile = MapFormatObject_Compile;
    procedure MapFormatObject_Build(const pUserName: WideString; const pUserPassword: WideString; idMapFormatObject: Integer; flUsePrototype: WordBool); safecall;
      procedure IMapFormatObjectFunctionality.Build = MapFormatObject_Build;
    //.
    //. ICoComponent
    procedure CoComponent_GetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; out Data: PSafeArray); safecall;
      procedure ICoComponent.GetData = CoComponent_GetData;
    procedure CoComponent_SetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; Data: PSafeArray); safecall;
      procedure ICoComponent.SetData = CoComponent_SetData;
    procedure CoComponent_CheckCoType(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer);
    //. ITCoGeoMonitorObjectFunctionality
    procedure TCoGeoMonitorObjectFunctionality_Construct(pUserID: Integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectBusinessModel: WideString; const pName: WideString; pGeoSpaceID: Integer; pSecurityIndex: Integer;  out oComponentID: Integer; out oGeographServerAddress: WideString; out oGeographServerObjectID: Integer); safecall;
      procedure ITCoGeoMonitorObjectFunctionality.Construct = TCoGeoMonitorObjectFunctionality_Construct;
    //. ICoGeoMonitorObjectFunctionality
    procedure CoGeoMonitorObjectFunctionality_GetTrackData(const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; GeoSpaceID: integer; BeginTime: Double; EndTime: Double; DataType: Integer; out Data: PSafeArray); safecall;
      procedure ICoGeoMonitorObjectFunctionality.GetTrackData = CoGeoMonitorObjectFunctionality_GetTrackData;
  public
    procedure Initialize; override;
  end;

  function GeoSpaceConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
  function GeoSpaceConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;

implementation
uses
  Windows,
  SysUtils,
  Classes,
  SyncObjs,
  Math,
  ComServ,
  Graphics,
  ZLibEx,
  GDIPOBJ, GDIPAPI, //. GDI+ support
  JPEG,
  PNGImage,
  unitSpaceFunctionalServer,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  Functionality,
  TypesDefines,
  TypesFunctionality,
  GeoTransformations;

var
  CrdSysConvertor_Lock: TCriticalSection = nil;
  CrdSysConvertorPool: TList = nil;
  CrdSysConvertor: TCrdSysConvertor = nil;

  
procedure CopyMem(SrsPtr,DistPtr: pointer; Size: integer); pascal;
begin
asm
   PUSH ESI
   PUSH EDI
   PUSH ECX
   MOV ESI,SrsPtr
   MOV EDI,DistPtr
   MOV ECX,Size
   CLD
   REP MOVSB
   POP ECX
   POP EDI
   POP ESI
end;
end;


Type
  TThreadID = DWORD;

  TCOMThreadInitializer = class
  private
    Lock: TCriticalSection;
    InitializedThreads_Size: integer;
    InitializedThreads_SizeDelta: integer;
    InitializedThreads: array of TThreadID;
    InitializedThreads_Count: integer;

    class function InitializeGDIPlus(): ULONG;
    class procedure FinalizeGDIPlus(const GDIPlusToken: ULONG);

    Constructor Create();
    Destructor Destroy(); override;
    function ThreadIsInitialized(const pThreadID: TThreadID): boolean;
    procedure InitializeThread(const pThreadID: TThreadID);
    procedure _CheckThreadInitialization(const pThreadID: TThreadID);
    procedure GrowInitializedThreadsSize();
  end;

var
  COMThreadInitializer: TCOMThreadInitializer = nil;

{TCOMThreadInitializer}
Constructor TCOMThreadInitializer.Create();
begin
Inherited Create();
Lock:=TCriticalSection.Create();
InitializedThreads_Size:=200;
InitializedThreads_SizeDelta:=100;
SetLength(InitializedThreads,InitializedThreads_Size);
InitializedThreads_Count:=0;
end;

Destructor TCOMThreadInitializer.Destroy();
begin
Lock.Free();
Inherited;
end;

function TCOMThreadInitializer.ThreadIsInitialized(const pThreadID: TThreadID): boolean;
var
  I: integer;
begin
Result:=false;
Lock.Enter();
try
for I:=0 to InitializedThreads_Count-1 do
  if (InitializedThreads[I] = pThreadID)
   then begin
    Result:=true;
    Exit; //. ->
    end;
finally
Lock.Leave();
end;
end;

procedure TCOMThreadInitializer.InitializeThread(const pThreadID: TThreadID);
var
  GDIPlusToken: ULONG;
begin
//. init GDI+ for current thead (thread: pThreadID)
GDIPlusToken:=InitializeGDIPlus();
//.
Lock.Enter();
try
if (InitializedThreads_Count >= InitializedThreads_Size) then GrowInitializedThreadsSize();
InitializedThreads[InitializedThreads_Count]:=pThreadID;
Inc(InitializedThreads_Count);
finally
Lock.Leave();
end;
end;

procedure TCOMThreadInitializer._CheckThreadInitialization(const pThreadID: TThreadID);
begin
if (NOT ThreadIsInitialized(pThreadID)) then InitializeThread(pThreadID);
end;

procedure TCOMThreadInitializer.GrowInitializedThreadsSize();
begin
InitializedThreads_Size:=InitializedThreads_Size+InitializedThreads_SizeDelta;
SetLength(InitializedThreads,InitializedThreads_Size);
end;

class function TCOMThreadInitializer.InitializeGDIPlus(): ULONG;
begin
//. init GDI+ for current thead (thread: pThreadID)
StartupInput.DebugEventCallback:=nil;
StartupInput.SuppressBackgroundThread:=False;
StartupInput.SuppressExternalCodecs:=False;
StartupInput.GdiplusVersion:=1;
GdiplusStartup(Result,@StartupInput,nil);
end;

class procedure TCOMThreadInitializer.FinalizeGDIPlus(const GDIPlusToken: ULONG);
begin
GdiplusShutdown(GDIPlusToken);
end;

  
{TcoSpaceFunctionalServer}
procedure TcoSpaceFunctionalServer.Initialize;
begin
end;

procedure TcoSpaceFunctionalServer.InitializeServer; safecall;
begin
if (fmSpaceFunctionalServerPanel <> nil) then SendMessage(fmSpaceFunctionalServerPanel.Handle, WM_INITIALIZESERVER, 0,0);
end;

procedure TcoSpaceFunctionalServer.FinalizeServer; safecall;
begin
if (fmSpaceFunctionalServerPanel <> nil) then SendMessage(fmSpaceFunctionalServerPanel.Handle, WM_FINALIZESERVER, 0,0);
end;

function TcoSpaceFunctionalServer.Context_VisualizationCount: Integer; safecall;
begin
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Result:=unitProxySpace.ProxySpace.ObjectsContextRegistry.ObjectsCount();
end;

function TcoSpaceFunctionalServer.Check(Code: Integer): Integer; safecall;
begin
Result:=0;
case Code of
0: Exit; //. ->
end;
end;

procedure TcoSpaceFunctionalServer.UpdateProxySpace(const pUserName: WideString; const pUserPassword: WideString);
var
  Space: TProxySpace;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
Space.StayUpToDate();
end;
 
procedure TcoSpaceFunctionalServer.GetSpaceWindowOnBitmap(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; BitmapDataType: Integer; out BitmapData: PSafeArray);
begin
GetSpaceWindowOnBitmapSegmented(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, HidedLaysArray, VisibleFactor, DynamicHintVisibility, Width, Height, 1,1,0, BitmapDataType, false, {out} BitmapData);
end;

procedure TcoSpaceFunctionalServer.GetSpaceWindowOnBitmap1(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray); safecall;
begin
GetSpaceWindowOnBitmapSegmented(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, HidedLaysArray, VisibleFactor, DynamicHintVisibility, Width, Height, 1,1,0, BitmapDataType, flUpdateProxySpace, {out} BitmapData);
end;

procedure TcoSpaceFunctionalServer.GetSpaceWindowOnBitmapSegmented(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; Width: Integer; Height: Integer; DivX: Integer; DivY: Integer; SegmentsOrder: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray);
var
  Space: TProxySpace;
  GDIPlusToken: ULONG;
  _HidedLaysArray: TByteArray;
  DATAPtr: pointer;
  BMP: TBitmap;
  DynamicHintData: TMemoryStream;
  ActualityInterval: TComponentActualityInterval; 
  JPEG: TJpegImage;
  PNG: TPNGObject;
  SS: TMemoryStream;
  ZCS: TZCompressionStream;
  MS: TMemoryStream;
  VarBound: TVarArrayBound;
  SegmentBMP: TBitmap;
  SegmentX,SegmentY: byte;
  SI: integer;
  SegmentPosition: word;
  SegmentSize: DWord;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
BitmapData:=nil;
try
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//.
GDIPlusToken:=TCOMThreadInitializer.InitializeGDIPlus(); //. initialize GDI+
try
if (HidedLaysArray <> nil)
 then begin
  SetLength(_HidedLaysArray,HidedLaysArray.rgsabound[0].cElements);
  SafeArrayAccessData(HidedLaysArray,DATAPtr);
  CopyMem(DATAPtr,@_HidedLaysArray[0],Length(_HidedLaysArray));
  SafeArrayUnAccessData(HidedLaysArray);
  end
 else _HidedLaysArray:=nil;
//.
BMP:=TBitmap.Create();
BMP.Canvas.Lock();
try
BMP.Width:=Width;
BMP.Height:=Height;
//.
if (flUpdateProxySpace)
 then Space.StayUpToDate();
//. get map screenshot
ActualityInterval.BeginTimestamp:=Now-TimeZoneDelta;
ActualityInterval.EndTimestamp:=MaxDouble;
Space.User_ReflectSpaceWindowOnBitmap(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, _HidedLaysArray, VisibleFactor,DynamicHintVisibility,0{no hint data},nil{VisualizationUserData},ActualityInterval, BMP.Width,BMP.Height, BMP,{out} DynamicHintData);
//.
MS:=TMemoryStream.Create();
try
case BitmapDataType of
1: begin //. bitmap row format
  BMP.SaveToStream(MS);
  end;
101: begin //. jpeg, quality: 100
  JPEG:=TJpegImage.Create;
  try
  JPEG.Assign(BMP);
  JPEG.CompressionQuality:=100;
  JPEG.SaveToStream(MS);
  finally
  JPEG.Destroy;
  end;
  end;
102: begin //. zipped jpeg, quality: 100
  SS:=TMemoryStream.Create();
  try
  JPEG:=TJpegImage.Create;
  try
  JPEG.Assign(BMP);
  JPEG.CompressionQuality:=100;
  JPEG.SaveToStream(SS);
  finally
  JPEG.Destroy;
  end;
  ZCS:=TZCompressionStream.Create(MS,zcMax);
  try
  ZCS.Write(SS.Memory^,SS.Size);
  finally
  ZCS.Destroy();
  end;
  finally
  SS.Destroy();
  end;
  end;
200: begin //. png
  PNG:=TPNGObject.Create();
  try
  PNG.TransparentColor:=clEmptySpace;
  PNG.Assign(BMP);
  PNG.CompressionLevel:=9; //. max compression
  //.
  PNG.SaveToStream(MS);
  finally
  PNG.Destroy();
  end;
  end;
201: begin //. segmented png
  SegmentBMP:=TBitmap.Create();
  SegmentBMP.Canvas.Lock();
  try
  SegmentBMP.Width:=(BMP.Width DIV DivX);
  SegmentBMP.Height:=(BMP.Height DIV DivY);
  PNG:=TPNGObject.Create();
  try
  SS:=TMemoryStream.Create();
  try
  case SegmentsOrder of
  0: begin //.
    for SegmentX:=0 to DivX-1 do begin
      SI:=SegmentX*SegmentBMP.Width;
      for SegmentY:=0 to DivY-1 do begin
        BitBlt(SegmentBMP.Canvas.Handle, 0,0,SegmentBMP.Width,SegmentBMP.Height,  BMP.Canvas.Handle, SI,SegmentY*SegmentBMP.Height, SRCCOPY);
        PNG.Assign(SegmentBMP);
        PNG.CompressionLevel:=9; //. max compression
        //.
        SS.Position:=0;
        PNG.SaveToStream(SS);
        SegmentPosition:=Word((SegmentX AND $FF) OR ((SegmentY AND $FF) SHL 8));
        SegmentSize:=SS.Position;
        MS.Write(SegmentPosition,SizeOf(SegmentPosition));
        MS.Write(SegmentSize,SizeOf(SegmentSize));
        SS.Position:=0;
        MS.CopyFrom(SS,SegmentSize);
        end;
      end;
    end;
  1: begin //.
    for SegmentY:=0 to DivY-1 do begin
      SI:=SegmentY*SegmentBMP.Height;
      for SegmentX:=0 to DivX-1 do begin
        BitBlt(SegmentBMP.Canvas.Handle, 0,0,SegmentBMP.Width,SegmentBMP.Height,  BMP.Canvas.Handle, SegmentX*SegmentBMP.Width,SI, SRCCOPY);
        PNG.Assign(SegmentBMP);
        PNG.CompressionLevel:=9; //. max compression
        //.
        SS.Position:=0;
        PNG.SaveToStream(SS);
        SegmentPosition:=Word((SegmentX AND $FF) OR ((SegmentY AND $FF) SHL 8));
        SegmentSize:=SS.Position;
        MS.Write(SegmentPosition,SizeOf(SegmentPosition));
        MS.Write(SegmentSize,SizeOf(SegmentSize));
        SS.Position:=0;
        MS.CopyFrom(SS,SegmentSize);
        end;
      end;
    end;
  end;
  finally
  SS.Destroy();
  end;
  finally
  PNG.Destroy;
  end;
  finally
  SegmentBMP.Canvas.Unlock();
  SegmentBMP.Destroy();
  end;
  end;
else
  Raise Exception.Create('unknown bitmap data type'); //. =>
end;
FillChar(VarBound, SizeOf(VarBound), 0);
VarBound.ElementCount:=MS.Size;
BitmapData:=SafeArrayCreate(varByte, 1, VarBound);
SafeArrayAccessData(BitmapData, DATAPtr);
try
Move(MS.Memory^,DATAPtr^,MS.Size);
finally
SafeArrayUnAccessData(BitmapData);
end;
finally
MS.Destroy;
end;
finally
BMP.Canvas.Unlock();
BMP.Destroy;
end;
finally
TCOMThreadInitializer.FinalizeGDIPlus(GDIPlusToken);
end;
except
  if (BitmapData <> nil)
   then begin
    SafeArrayDestroy(BitmapData);
    BitmapData:=nil;
    end;
  Raise; //. =>
  end;
end;

procedure TcoSpaceFunctionalServer.GetSpaceWindowHints(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVersion: Integer; VisualizationUserData: PSafeArray; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; flUpdateProxySpace: WordBool; out DynamicHintData: PSafeArray);
var
  Space: TProxySpace;
  GDIPlusToken: ULONG;
  _HidedLaysArray: TByteArray;
  _VisualizationUserData: TByteArray;
  _ActualityInterval: TComponentActualityInterval;
  DATAPtr: pointer;
  _DynamicHintData: TMemoryStream;
  VarBound: TVarArrayBound;
  RS: TMemoryStream;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
DynamicHintData:=nil;
try
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//.
GDIPlusToken:=TCOMThreadInitializer.InitializeGDIPlus(); //. initialize GDI+
try
if (HidedLaysArray <> nil)
 then begin
  SetLength(_HidedLaysArray,HidedLaysArray.rgsabound[0].cElements);
  SafeArrayAccessData(HidedLaysArray,DATAPtr);
  CopyMem(DATAPtr,@_HidedLaysArray[0],Length(_HidedLaysArray));
  SafeArrayUnAccessData(HidedLaysArray);
  end
 else _HidedLaysArray:=nil;
if (VisualizationUserData <> nil)
 then begin
  SetLength(_VisualizationUserData,VisualizationUserData.rgsabound[0].cElements);
  SafeArrayAccessData(VisualizationUserData,DATAPtr);
  CopyMem(DATAPtr,@_VisualizationUserData[0],Length(_VisualizationUserData));
  SafeArrayUnAccessData(VisualizationUserData);
  end
 else _VisualizationUserData:=nil;
_ActualityInterval.BeginTimestamp:=ActualityInterval_BeginTimestamp;
_ActualityInterval.EndTimestamp:=ActualityInterval_EndTimestamp;
//.
if (flUpdateProxySpace)
 then Space.StayUpToDate();
//. 
Space.User_ReflectSpaceWindowOnBitmap(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, _HidedLaysArray, VisibleFactor,100{100% dinamic hints visibility},DynamicHintVersion,_VisualizationUserData,_ActualityInterval, Width,Height, nil,{out} _DynamicHintData);
try
if (_DynamicHintData <> nil)
 then begin
  RS:=TMemoryStream.Create();
  try
  //. compress data
  with TZCompressionStream.Create(RS, zcMax) do
  try
  Write(_DynamicHintData.Memory^,_DynamicHintData.Size);
  finally
  Destroy;
  end;
  //.
  FillChar(VarBound, SizeOf(VarBound), 0);
  VarBound.ElementCount:=RS.Size;
  DynamicHintData:=SafeArrayCreate(varByte, 1, VarBound);
  SafeArrayAccessData(DynamicHintData, DATAPtr);
  try
  Move(RS.Memory^,DATAPtr^,RS.Size);
  finally
  SafeArrayUnAccessData(DynamicHintData);
  end;
  finally
  RS.Destroy();
  end;
  end;
finally
_DynamicHintData.Free();
end;
finally
TCOMThreadInitializer.FinalizeGDIPlus(GDIPlusToken);
end;
except
  if (DynamicHintData <> nil)
   then begin
    SafeArrayDestroy(DynamicHintData);
    DynamicHintData:=nil;
    end;
  Raise; //. =>
  end;
end;

procedure TcoSpaceFunctionalServer.GetSpaceWindowOnBitmapSegmentedWithHints(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVersion: Integer; VisualizationUserData: PSafeArray; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; DivX: Integer; DivY: Integer; SegmentsOrder: Integer; BitmapDataType: Integer; flUpdateProxySpace: WordBool; out BitmapData: PSafeArray; out DynamicHintData: PSafeArray);
var
  Space: TProxySpace;
  GDIPlusToken: ULONG;
  _HidedLaysArray: TByteArray;
  _VisualizationUserData: TByteArray;
  _ActualityInterval: TComponentActualityInterval;
  DATAPtr: pointer;
  BMP: TBitmap;
  _DynamicHintData: TMemoryStream;
  JPEG: TJpegImage;
  PNG: TPNGObject;
  SS: TMemoryStream;
  ZCS: TZCompressionStream;
  MS: TMemoryStream;
  VarBound: TVarArrayBound;
  SegmentBMP: TBitmap;
  SegmentX,SegmentY: byte;
  SI: integer;
  SegmentPosition: word;
  SegmentSize: DWord;
  RS: TMemoryStream;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
BitmapData:=nil;
DynamicHintData:=nil;
try
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//.
GDIPlusToken:=TCOMThreadInitializer.InitializeGDIPlus(); //. initialize GDI+
try
if (HidedLaysArray <> nil)
 then begin
  SetLength(_HidedLaysArray,HidedLaysArray.rgsabound[0].cElements);
  SafeArrayAccessData(HidedLaysArray,DATAPtr);
  CopyMem(DATAPtr,@_HidedLaysArray[0],Length(_HidedLaysArray));
  SafeArrayUnAccessData(HidedLaysArray);
  end
 else _HidedLaysArray:=nil;
if (VisualizationUserData <> nil)
 then begin
  SetLength(_VisualizationUserData,VisualizationUserData.rgsabound[0].cElements);
  SafeArrayAccessData(VisualizationUserData,DATAPtr);
  CopyMem(DATAPtr,@_VisualizationUserData[0],Length(_VisualizationUserData));
  SafeArrayUnAccessData(VisualizationUserData);
  end
 else _VisualizationUserData:=nil;
_ActualityInterval.BeginTimestamp:=ActualityInterval_BeginTimestamp;
_ActualityInterval.EndTimestamp:=ActualityInterval_EndTimestamp;
//.
BMP:=TBitmap.Create();
BMP.Canvas.Lock();
try
BMP.Width:=Width;
BMP.Height:=Height;
//.
if (flUpdateProxySpace)
 then Space.StayUpToDate();
//. get map screenshot
Space.User_ReflectSpaceWindowOnBitmap(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, _HidedLaysArray, VisibleFactor,100{100% dinamic hints visibility},DynamicHintVersion,_VisualizationUserData,_ActualityInterval, BMP.Width,BMP.Height, BMP,{out} _DynamicHintData);
try
MS:=TMemoryStream.Create();
try
case BitmapDataType of
1: begin //. bitmap row format
  BMP.SaveToStream(MS);
  end;
101: begin //. jpeg, quality: 100
  JPEG:=TJpegImage.Create;
  try
  JPEG.Assign(BMP);
  JPEG.CompressionQuality:=100;
  JPEG.SaveToStream(MS);
  finally
  JPEG.Destroy;
  end;
  end;
102: begin //. zipped jpeg, quality: 100
  SS:=TMemoryStream.Create();
  try
  JPEG:=TJpegImage.Create;
  try
  JPEG.Assign(BMP);
  JPEG.CompressionQuality:=100;
  JPEG.SaveToStream(SS);
  finally
  JPEG.Destroy;
  end;
  ZCS:=TZCompressionStream.Create(MS,zcMax);
  try
  ZCS.Write(SS.Memory^,SS.Size);
  finally
  ZCS.Destroy();
  end;
  finally
  SS.Destroy();
  end;
  end;
200: begin //. png
  BMP.TransparentColor:=clEmptySpace;
  BMP.Transparent:=true;
  BMP.TransparentMode:=tmFixed;
  //.
  PNG:=TPNGObject.Create();
  try
  PNG.Assign(BMP);
  PNG.CompressionLevel:=9; //. max compression
  //.
  PNG.SaveToStream(MS);
  finally
  PNG.Destroy();
  end;
  end;
201: begin //. png
  SegmentBMP:=TBitmap.Create();
  SegmentBMP.Canvas.Lock();
  try
  SegmentBMP.Width:=(BMP.Width DIV DivX);
  SegmentBMP.Height:=(BMP.Height DIV DivY);
  PNG:=TPNGObject.Create();
  try
  SS:=TMemoryStream.Create();
  try
  case SegmentsOrder of
  0: begin //.
    for SegmentX:=0 to DivX-1 do begin
      SI:=SegmentX*SegmentBMP.Width;
      for SegmentY:=0 to DivY-1 do begin
        BitBlt(SegmentBMP.Canvas.Handle, 0,0,SegmentBMP.Width,SegmentBMP.Height,  BMP.Canvas.Handle, SI,SegmentY*SegmentBMP.Height, SRCCOPY);
        PNG.Assign(SegmentBMP);
        PNG.CompressionLevel:=9; //. max compression
        //.
        SS.Position:=0;
        PNG.SaveToStream(SS);
        SegmentPosition:=Word((SegmentX AND $FF) OR ((SegmentY AND $FF) SHL 8));
        SegmentSize:=SS.Position;
        MS.Write(SegmentPosition,SizeOf(SegmentPosition));
        MS.Write(SegmentSize,SizeOf(SegmentSize));
        SS.Position:=0;
        MS.CopyFrom(SS,SegmentSize);
        end;
      end;
    end;
  1: begin //.
    for SegmentY:=0 to DivY-1 do begin
      SI:=SegmentY*SegmentBMP.Height;
      for SegmentX:=0 to DivX-1 do begin
        BitBlt(SegmentBMP.Canvas.Handle, 0,0,SegmentBMP.Width,SegmentBMP.Height,  BMP.Canvas.Handle, SegmentX*SegmentBMP.Width,SI, SRCCOPY);
        PNG.Assign(SegmentBMP);
        PNG.CompressionLevel:=9; //. max compression
        //.
        SS.Position:=0;
        PNG.SaveToStream(SS);
        SegmentPosition:=Word((SegmentX AND $FF) OR ((SegmentY AND $FF) SHL 8));
        SegmentSize:=SS.Position;
        MS.Write(SegmentPosition,SizeOf(SegmentPosition));
        MS.Write(SegmentSize,SizeOf(SegmentSize));
        SS.Position:=0;
        MS.CopyFrom(SS,SegmentSize);
        end;
      end;
    end;
  end;
  finally
  SS.Destroy();
  end;
  finally
  PNG.Destroy;
  end;
  finally
  SegmentBMP.Canvas.Unlock();
  SegmentBMP.Destroy();
  end;
  end;
else
  Raise Exception.Create('unknown bitmap data type'); //. =>
end;
FillChar(VarBound, SizeOf(VarBound), 0);
VarBound.ElementCount:=MS.Size;
BitmapData:=SafeArrayCreate(varByte, 1, VarBound);
SafeArrayAccessData(BitmapData, DATAPtr);
try
Move(MS.Memory^,DATAPtr^,MS.Size);
finally
SafeArrayUnAccessData(BitmapData);
end;
finally
MS.Destroy;
end;
if (_DynamicHintData <> nil)
 then begin
  RS:=TMemoryStream.Create();
  try
  //. compress data
  with TZCompressionStream.Create(RS, zcMax) do
  try
  Write(_DynamicHintData.Memory^,_DynamicHintData.Size);
  finally
  Destroy;
  end;
  //.
  FillChar(VarBound, SizeOf(VarBound), 0);
  VarBound.ElementCount:=RS.Size;
  DynamicHintData:=SafeArrayCreate(varByte, 1, VarBound);
  SafeArrayAccessData(DynamicHintData, DATAPtr);
  try
  Move(RS.Memory^,DATAPtr^,RS.Size);
  finally
  SafeArrayUnAccessData(DynamicHintData);
  end;
  finally
  RS.Destroy();
  end;
  end;
finally
_DynamicHintData.Free();
end;
finally
BMP.Canvas.Unlock();
BMP.Destroy;
end;
finally
TCOMThreadInitializer.FinalizeGDIPlus(GDIPlusToken);
end;
except
  if (BitmapData <> nil)
   then begin
    SafeArrayDestroy(BitmapData);
    BitmapData:=nil;
    end;
  if (DynamicHintData <> nil)
   then begin
    SafeArrayDestroy(DynamicHintData);
    DynamicHintData:=nil;
    end;
  Raise; //. =>
  end;
end;

procedure TcoSpaceFunctionalServer.GetSpaceWindowBitmapObjectAtPosition(const pUserName: WideString; const pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: PSafeArray; VisibleFactor: Integer; DynamicHintVisibility: Double; ActualityInterval_BeginTimestamp: Double; ActualityInterval_EndTimestamp: Double; Width: Integer; Height: Integer; X: Integer; Y: Integer; out ObjectPtr: Integer);
var
  Space: TProxySpace;
  GDIPlusToken: ULONG;
  _HidedLaysArray: TByteArray;
  _ActualityInterval: TComponentActualityInterval;
  DATAPtr: pointer;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//.
GDIPlusToken:=TCOMThreadInitializer.InitializeGDIPlus(); //. initialize GDI+
try
if (HidedLaysArray <> nil)
 then begin
  SetLength(_HidedLaysArray,HidedLaysArray.rgsabound[0].cElements);
  SafeArrayAccessData(HidedLaysArray,DATAPtr);
  CopyMem(DATAPtr,@_HidedLaysArray[0],Length(_HidedLaysArray));
  SafeArrayUnAccessData(HidedLaysArray);
  end
 else _HidedLaysArray:=nil;
_ActualityInterval.BeginTimestamp:=ActualityInterval_BeginTimestamp;
_ActualityInterval.EndTimestamp:=ActualityInterval_EndTimestamp;
//.
ObjectPtr:=Space.User_SpaceWindowBitmap_ObjectAtPosition(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, _HidedLaysArray, VisibleFactor,DynamicHintVisibility, _ActualityInterval, Width,Height, X,Y);
finally
TCOMThreadInitializer.FinalizeGDIPlus(GDIPlusToken);
end;
end;

function TcoSpaceFunctionalServer.__GeoSpaceConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: double; Y: Double; out DatumID: integer; out Latitude: Extended; out Longitude: Extended): WordBool;
var
  Space: TProxySpace;
  idGeoCrdSystem: integer;
  I: integer;
  _Latitude,_Longitude: Extended;
begin
Result:=false;
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByXYLocally(GeoSpaceID, X,Y,  idGeoCrdSystem);
CrdSysConvertor_Lock.Enter;
try
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
      CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
      //. add new converter to the pool
      CrdSysConvertorPool.Insert(0,CrdSysConvertor);
      end;
    if ((CrdSysConvertor <> nil) AND (NOT CrdSysConvertor.GeoToXY_LoadPoints(Latitude,Longitude))) then CrdSysConvertor:=nil;
    end;
  end;
//.
if (CrdSysConvertor <> nil)
 then begin
  CrdSysConvertor.ConvertXYToGeo(X,Y, _Latitude,_Longitude);
  DatumID:=CrdSysConvertor.DatumID;
  Latitude:=_Latitude;
  Longitude:=_Longitude;
  Result:=true;
  end;
finally
CrdSysConvertor_Lock.Leave;
end;
finally
Release;
end;
end;

function TcoSpaceFunctionalServer.GeoSpaceConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: Double; Y: Double; out Latitude: Double; out Longitude: Double): WordBool;
var
  DatumID: integer;
  _Lat,_Long: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=__GeoSpaceConverter_ConvertXYToLatLong(pUserName,pUserPassword,GeoSpaceID, X,Y,  DatumID,_Lat,_Long);
if (Result)
 then begin
  Latitude:=_Lat;
  Longitude:=_Long;
  end;
end;

function GeoSpaceConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  Space: TProxySpace;
  idGeoCrdSystem: integer;
  I: integer;
  _X,_Y: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=false;
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(GeoSpaceID, Latitude,Longitude,  idGeoCrdSystem);
CrdSysConvertor_Lock.Enter;
try
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
      CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
      //. add new converter to the pool
      CrdSysConvertorPool.Insert(0,CrdSysConvertor);
      end;
    if ((CrdSysConvertor <> nil) AND (NOT CrdSysConvertor.GeoToXY_LoadPoints(Latitude,Longitude))) then CrdSysConvertor:=nil;
    end;
  end;
if (CrdSysConvertor <> nil)
 then begin
  CrdSysConvertor.ConvertGeoToXY(Latitude,Longitude, _X,_Y);
  X:=_X;
  Y:=_Y;
  Result:=true;
  end;
finally
CrdSysConvertor_Lock.Leave;
end;
finally
Release;
end;
//.
end;

function TcoSpaceFunctionalServer.GeoSpaceConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  Space: TProxySpace;
  idGeoCrdSystem: integer;
  I: integer;
  _X,_Y: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=false;
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(GeoSpaceID, Latitude,Longitude,  idGeoCrdSystem);
CrdSysConvertor_Lock.Enter;
try
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
      CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
      //. add new converter to the pool
      CrdSysConvertorPool.Insert(0,CrdSysConvertor);
      end;
    if ((CrdSysConvertor <> nil) AND (NOT CrdSysConvertor.GeoToXY_LoadPoints(Latitude,Longitude))) then CrdSysConvertor:=nil;
    end;
  end;
if (CrdSysConvertor <> nil)
 then begin
  CrdSysConvertor.ConvertGeoToXY(Latitude,Longitude, _X,_Y);
  X:=_X;
  Y:=_Y;
  Result:=true;
  end;
finally
CrdSysConvertor_Lock.Leave;
end;
finally
Release;
end;
//.
end;

function TcoSpaceFunctionalServer.GeoSpaceConverter_ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; X: Double; Y: Double; DatumID: integer; out Latitude: Double; out Longitude: Double): WordBool;
var
  GeoSpaceDatumID: integer;
  S_Lat,S_Long,S_Alt: Extended;
  D_Lat,D_Long,D_Alt: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=__GeoSpaceConverter_ConvertXYToLatLong(pUserName,pUserPassword,GeoSpaceID, X,Y,  GeoSpaceDatumID,S_Lat,S_Long);
if (Result)
 then begin
  S_Alt:=0;
  TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(GeoSpaceDatumID,S_Lat,S_Long,S_Alt,DatumID, D_Lat,D_Long,D_Alt);
  Latitude:=D_Lat;
  Longitude:=D_Long;
  end;
end;

function GeoSpaceConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  GeoSpaceDatumID: integer;
  S_Lat,S_Long,S_Alt: Extended;
  D_Lat,D_Long,D_Alt: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//. convert incoming coordinates to the GeoSpace Datum coordinates
S_Lat:=Latitude;
S_Long:=Longitude;
S_Alt:=0;
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID,S_Lat,S_Long,S_Alt,GeoSpaceDatumID, D_Lat,D_Long,D_Alt);
//.
Result:=GeoSpaceConverter_ConvertLatLongToXY(pUserName,pUserPassword,GeoSpaceID, D_Lat,D_Long,  X,Y);
end;

function TcoSpaceFunctionalServer.GeoSpaceConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  GeoSpaceDatumID: integer;
  S_Lat,S_Long,S_Alt: Extended;
  D_Lat,D_Long,D_Alt: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,GeoSpaceID)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//. convert incoming coordinates to the GeoSpace Datum coordinates
S_Lat:=Latitude;
S_Long:=Longitude;
S_Alt:=0;
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID,S_Lat,S_Long,S_Alt,GeoSpaceDatumID, D_Lat,D_Long,D_Alt);
//.
Result:=GeoSpaceConverter_ConvertLatLongToXY(pUserName,pUserPassword,GeoSpaceID, D_Lat,D_Long,  X,Y);
end;

function TcoSpaceFunctionalServer.__GeoCrdSystemConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; out DatumID: integer; out Latitude: Extended; out Longitude: Extended): WordBool;
var
  Space: TProxySpace;
  I: integer;
  _Latitude,_Longitude: Extended;
begin
Result:=false;
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
CrdSysConvertor_Lock.Enter;
try
CrdSysConvertor:=nil;
//.
for I:=0 to CrdSysConvertorPool.Count-1 do
  if (TCrdSysConvertor(CrdSysConvertorPool[I]).idCrdSys = GeoCrdSystemID)
   then begin
    CrdSysConvertor:=CrdSysConvertorPool[I];
    Break; //. >
    end;
if (CrdSysConvertor = nil)
 then begin
  CrdSysConvertor:=TCrdSysConvertor.Create(Space,GeoCrdSystemID);
  //. add new converter to the pool
  CrdSysConvertorPool.Insert(0,CrdSysConvertor);
  end;
if ((CrdSysConvertor <> nil) AND (NOT CrdSysConvertor.GeoToXY_LoadPoints(Latitude,Longitude))) then CrdSysConvertor:=nil;
//.
if (CrdSysConvertor <> nil)
 then begin
  CrdSysConvertor.ConvertXYToGeo(X,Y, _Latitude,_Longitude);
  DatumID:=CrdSysConvertor.DatumID;
  Latitude:=_Latitude;
  Longitude:=_Longitude;
  Result:=true;
  end;
finally
CrdSysConvertor_Lock.Leave;
end;
end;

function TcoSpaceFunctionalServer.GeoCrdSystemConverter_ConvertXYToLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; out Latitude: Double; out Longitude: Double): WordBool;
var
  DatumID: integer;
  _Lat,_Long: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=__GeoSpaceConverter_ConvertXYToLatLong(pUserName,pUserPassword,GeoCrdSystemID, X,Y,  DatumID,_Lat,_Long);
if (Result)
 then begin
  Latitude:=_Lat;
  Longitude:=_Long;
  end;
end;

function TcoSpaceFunctionalServer.GeoCrdSystemConverter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  Space: TProxySpace;
  I: integer;
  _X,_Y: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=false;
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
Space:=unitProxySpace.ProxySpace;
CrdSysConvertor_Lock.Enter;
try
CrdSysConvertor:=nil;
//.
for I:=0 to CrdSysConvertorPool.Count-1 do
  if (TCrdSysConvertor(CrdSysConvertorPool[I]).idCrdSys = GeoCrdSystemID)
   then begin
    CrdSysConvertor:=CrdSysConvertorPool[I];
    Break; //. >
    end;
if (CrdSysConvertor = nil)
 then begin
  CrdSysConvertor:=TCrdSysConvertor.Create(Space,GeoCrdSystemID);
  //. add new converter to the pool
  CrdSysConvertorPool.Insert(0,CrdSysConvertor);
  end;
if ((CrdSysConvertor <> nil) AND (NOT CrdSysConvertor.GeoToXY_LoadPoints(Latitude,Longitude))) then CrdSysConvertor:=nil;
//.
if (CrdSysConvertor <> nil)
 then begin
  CrdSysConvertor.ConvertGeoToXY(Latitude,Longitude, _X,_Y);
  X:=_X;
  Y:=_Y;
  Result:=true;
  end;
finally
CrdSysConvertor_Lock.Leave;
end;
end;

function TcoSpaceFunctionalServer.GeoCrdSystemConverter_ConvertXYToDatumLatLong(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; X: Double; Y: Double; DatumID: integer; out Latitude: Double; out Longitude: Double): WordBool;
var
  GeoCrdSystemDatumID: integer;
  S_Lat,S_Long,S_Alt: Extended;
  D_Lat,D_Long,D_Alt: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
Result:=__GeoSpaceConverter_ConvertXYToLatLong(pUserName,pUserPassword,GeoCrdSystemID, X,Y,  GeoCrdSystemDatumID,S_Lat,S_Long);
if (Result)
 then begin
  S_Alt:=0;
  TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(GeoCrdSystemDatumID,S_Lat,S_Long,S_Alt,DatumID, D_Lat,D_Long,D_Alt);
  Latitude:=D_Lat;
  Longitude:=D_Long;
  end;
end;

function TcoSpaceFunctionalServer.GeoCrdSystemConverter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoCrdSystemID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): WordBool;
var
  GeoCrdSystemGeoSpaceID: integer;
  GeoCrdSystemName,GeoCrdSystemDatum,GeoCrdSystemProjection: string;
  GeoCrdSystemProjectionData: TMemoryStream;
  GeoCrdSystemDatumID: integer;
  S_Lat,S_Long,S_Alt: Extended;
  D_Lat,D_Long,D_Alt: Extended;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//. get GeoCrdSystem Datum ID
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,GeoCrdSystemID)) do
try
GetDataLocally(GeoCrdSystemGeoSpaceID,GeoCrdSystemName,GeoCrdSystemDatum,GeoCrdSystemProjection,GeoCrdSystemProjectionData);
FreeAndNil(GeoCrdSystemProjectionData);
finally
Release;
end;
GeoCrdSystemDatumID:=Datums_GetItemByName(GeoCrdSystemDatum);
if (GeoCrdSystemDatumID = -1) then Exception.Create('TcoProxySpaceClient.GeoCrdSystemConverter_ConvertDatumLatLongToXY error: unknown datum of GeoCrdSystem'); //. =>
//. convert incoming coordinates to the GeoSpace Datum coordinates
S_Lat:=Latitude;
S_Long:=Longitude;
S_Alt:=0;
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID,S_Lat,S_Long,S_Alt,GeoCrdSystemDatumID, D_Lat,D_Long,D_Alt);
//.
Result:=GeoSpaceConverter_ConvertLatLongToXY(pUserName,pUserPassword,GeoCrdSystemID, D_Lat,D_Long,  X,Y);
end;

procedure TcoSpaceFunctionalServer.MapFormatObject_Compile(const pUserName: WideString; const pUserPassword: WideString; idMapFormatObject: Integer); safecall;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idMapFormatObject)) do
try
_UserName:=pUserName;
_UserPassword:=pUserPassword;
Compile();
finally
Release;
end;
end;

procedure TcoSpaceFunctionalServer.MapFormatObject_Build(const pUserName: WideString; const pUserPassword: WideString; idMapFormatObject: Integer; flUsePrototype: WordBool); safecall;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idMapFormatObject)) do
try
_UserName:=pUserName;
_UserPassword:=pUserPassword;
Build(flUsePrototype);
finally
Release;
end;
end;

procedure TcoSpaceFunctionalServer.CoComponent_CheckCoType(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer);
begin
with (TComponentFunctionality_Create(idTCoComponent,idCoComponent) as TCoComponentFunctionality) do
try
_UserName:=pUserName;
_UserPassword:=pUserPassword;
//.
if (idCoType() <> pidCoType) then Raise Exception.Create('wrong CoType requested'); //. =>
finally
Release;
end;
end;

procedure TcoSpaceFunctionalServer.CoComponent_GetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; out Data: PSafeArray); safecall;
var
  Space: TProxySpace;
  _Data: TByteArray;
  VarBound: TVarArrayBound;
  DATAPtr: pointer;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
//.
CoComponent_CheckCoType(pUserName,pUserPassword,idCoComponent,pidCoType);
//.
Space:=unitProxySpace.ProxySpace;
try
Space.Plugins__CoComponent_GetData(pUserName,pUserPassword, idCoComponent, pidCoType, DataType,{out} _Data);
//.
if (Length(_Data) > 0)
 then begin
  FillChar(VarBound, SizeOf(VarBound), 0);
  VarBound.ElementCount:=Length(_Data);
  Data:=SafeArrayCreate(varByte, 1, VarBound);
  SafeArrayAccessData(Data, DATAPtr);
  try
  Move(Pointer(@_Data[0])^,DATAPtr^,Length(_Data));
  finally
  SafeArrayUnAccessData(Data);
  end;
  end
 else Data:=nil;
except
  on E: Exception do Raise Exception.Create(E.Message); //. =>
  end
end;

procedure TcoSpaceFunctionalServer.CoComponent_SetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; Data: PSafeArray); safecall;
var
  _Data: TByteArray;
  DATAPtr: pointer;
  Space: TProxySpace;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
//.
CoComponent_CheckCoType(pUserName,pUserPassword,idCoComponent,pidCoType);
//.
if (Data <> nil)
 then begin
  SetLength(_Data,Data.rgsabound[0].cElements);
  SafeArrayAccessData(Data,DATAPtr);
  CopyMem(DATAPtr,@_Data[0],Length(_Data));
  SafeArrayUnAccessData(Data);
  end
 else _Data:=nil;
Space:=unitProxySpace.ProxySpace;
try
Space.Plugins__CoComponent_SetData(pUserName,pUserPassword, idCoComponent, pidCoType, DataType, _Data);
except
  on E: Exception do Raise Exception.Create(E.Message); //. =>
  end
end;

procedure TcoSpaceFunctionalServer.TCoGeoMonitorObjectFunctionality_Construct(pUserID: Integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectBusinessModel: WideString; const pName: WideString; pGeoSpaceID: Integer; pSecurityIndex: Integer;  out oComponentID: Integer; out oGeographServerAddress: WideString; out oGeographServerObjectID: Integer); safecall;
var
  Space: TProxySpace;
  _GeographServerAddress: string;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
//.
Space:=unitProxySpace.ProxySpace;
try
Space.Plugins__CoGeoMonitorObjects_Constructor_Construct(pUserID,pUserName,pUserPassword, pObjectBusinessModel,pName,pGeoSpaceID,pSecurityIndex, {out} oComponentID,{out} _GeographServerAddress,{out} oGeographServerObjectID);
oGeographServerAddress:=_GeographServerAddress;
except
  on E: Exception do Raise Exception.Create(E.Message); //. =>
  end
end;

procedure TcoSpaceFunctionalServer.CoGeoMonitorObjectFunctionality_GetTrackData(const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; GeoSpaceID: integer; BeginTime: Double; EndTime: Double; DataType: Integer; out Data: PSafeArray); safecall;
var
  Space: TProxySpace;
  _Data: TByteArray;
  VarBound: TVarArrayBound;
  DATAPtr: pointer;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
if (unitProxySpace.ProxySpace = nil) then Raise Exception.Create('ProxySpace is not initialized'); //. =>
//.
Space:=unitProxySpace.ProxySpace;
try
Space.Plugins__CoGeoMonitorObject_GetTrackData(pUserName,pUserPassword, idCoGeoMonitorObject, GeoSpaceID, BeginTime,EndTime, DataType,{out} _Data); 
//.
if (Length(_Data) > 0)
 then begin
  FillChar(VarBound, SizeOf(VarBound), 0);
  VarBound.ElementCount:=Length(_Data);
  Data:=SafeArrayCreate(varByte, 1, VarBound);
  SafeArrayAccessData(Data, DATAPtr);
  try
  Move(Pointer(@_Data[0])^,DATAPtr^,Length(_Data));
  finally
  SafeArrayUnAccessData(Data);
  end;
  end
 else Data:=nil;
except
  on E: Exception do Raise Exception.Create(E.Message); //. =>
  end
end;



procedure Initialize();
var
  R: HResult;
begin
CrdSysConvertor_Lock:=TCriticalSection.Create;
CrdSysConvertorPool:=TList.Create;
//.
CoInitializeEx(nil, COINIT_MULTITHREADED);
R:=CoInitializeSecurity(
            nil,
            -1,
            nil,
            nil,
            1,
            2,
            nil,
            0,
            nil
          );
//.
TAutoObjectFactory.Create(ComServer, TcoSpaceFunctionalServer, Class_coSpaceFunctionalServer, ciMultiInstance, tmFree);
end;

procedure Finalize();
var
  I: integer;
begin
CoUnInitialize();
//.
if (CrdSysConvertorPool <> nil)
 then begin
  for I:=0 to CrdSysConvertorPool.Count-1 do TObject(CrdSysConvertorPool[I]).Destroy();
  CrdSysConvertorPool.Destroy();
  end;
CrdSysConvertor_Lock.Free();
end;


Initialization
ComServer.UIInteractive:=false;
Initialize();

Finalization
Finalize();


end.
