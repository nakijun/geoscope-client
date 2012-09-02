unit unitCoVIDEOData;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, VIDEODataServer_TLB, StdVcl, MMSystem;

const
  idVIDEODataObj = 1;
  idAUDIODataObj = 1;
  
type
  TcoVIDEOData = class(TAutoObject, IVIDEODataProvider)
  protected
    procedure GetVideoData(idObj: Integer; out FrameData: PSafeArray; out FrameID: Integer); safecall;
    procedure GetVideoDataParams(idObj: Integer; out Width, Height, UpdateInterval, CompressionTypeID: Integer); safecall;
    procedure GetAudioDataParams(idObj: Integer; out Header: PSafeArray; out PacketInterval, CompressionTypeID: Integer); safecall;
    procedure GetAudioData(idObj: Integer; out Packet: PSafeArray; out PacketID: Integer); safecall;
    procedure Open(idTComponent, idComponent, idOperation: Integer;
      const UserPassword: WideString); safecall;
    function hasAudio: WordBool; safecall;
    function hasVideo: WordBool; safecall;
    { Protected declarations }
  private
    flValid: boolean;

    procedure Initialize; override;
  end;

implementation
uses
  SysUtils,
  ComServ,
  unitVIDEODataServer;

var
  ProxySpacesManager: IProxySpacesManager = nil;


const
  MaxQueryTime = 5000;
var
  LastConnectionTime: TDateTime = 0;

procedure TcoVIDEOData.Initialize;
var
  D: integer;
begin
if LastConnectionTime <> 0
 then begin
  D:=Round((Now-LastConnectionTime)*24*3600*1000);
  if D < MaxQueryTime then Sleep(MaxQueryTime-D);
  end;
flValid:=false;
LastConnectionTime:=Now;
end;

procedure TcoVIDEOData.Open(idTComponent, idComponent, idOperation: Integer; const UserPassword: WideString);
begin
ProxySpacesManager.CheckComponentUserOperation(idTComponent,idComponent, idOperation, UserPassword);
flValid:=true;
end;

procedure TcoVIDEOData.GetVideoDataParams(idObj: Integer; out Width,Height, UpdateInterval, CompressionTypeID: Integer);
begin
if NOT flValid
 then begin
  Sleep(333);
  UpdateInterval:=100; //. avoid reflector failure
  Exit; //. ->
  end;
case idObj of
idVIDEODataObj:
  if (fmVIDEODataServer <> nil)
   then begin
    fmVIDEODataServer.AVIProcessing.Lock.Enter;
    try
    Width:=0;
    Height:=0;
    UpdateInterval:=fmVIDEODataServer.AVIProcessing.VideoMsPerFrame;
    CompressionTypeID:=0;
    finally
    fmVIDEODataServer.AVIProcessing.Lock.Leave;
    end;
    end
   else
    Raise Exception.Create('could not get data params'); //. =>
else
  Raise Exception.Create('unknown object'); //. =>
end;
end;

procedure TcoVIDEOData.GetVideoData(idObj: Integer; out FrameData: PSafeArray; out FrameID: Integer);
var
  VarBound: TVarArrayBound;
  SrsPtr: pointer;
  SrsSize: integer;
  PA: PSafeArray;
  DataPtr: pointer;
begin
if NOT flValid
 then begin
  Sleep(333);
  Exit; //. ->
  end;
case idObj of
idVIDEODataObj:
  if (fmVIDEODataServer <> nil)
   then begin
    fmVIDEODataServer.AVIProcessing.Lock.Enter;
    try
    FillChar(VarBound, SizeOf(VarBound), 0);
    SrsPtr:=fmVIDEODataServer.AVIProcessing.VideoData;
    SrsSize:=fmVIDEODataServer.AVIProcessing.VideoDataSize;
    VarBound.ElementCount:=SrsSize;
    PA:=SafeArrayCreate(varByte, 1, VarBound);
    SafeArrayAccessData(PA, DataPtr);
    asm
       PUSH ESI
       PUSH EDI
       PUSH ECX
       MOV EDI,DataPtr
       MOV ESI,SrsPtr
       MOV ECX,SrsSize
       CLD
       REP MOVSB
       POP ECX
       POP EDI
       POP ESI
    end;
    SafeArrayUnAccessData(PA);
    FrameID:=fmVIDEODataServer.AVIProcessing.CurrentVideoFrame;
    finally
    fmVIDEODataServer.AVIProcessing.Lock.Leave;
    end;
    FrameData:=PA;
    end
   else
    Raise Exception.Create('could not get data params'); //. =>
else
  Raise Exception.Create('unknown object'); //. =>
end;
end;

procedure TcoVIDEOData.GetAudioDataParams(idObj: Integer; out Header: PSafeArray; out PacketInterval, CompressionTypeID: Integer);
var
  VarBound: TVarArrayBound;
  SrsPtr: pointer;
  SrsSize: integer;
  PA: PSafeArray;
  DataPtr: pointer;
begin
if NOT flValid
 then begin
  Sleep(333);
  Exit; //. ->
  end;
case idObj of
idVIDEODataObj:
  if (fmVIDEODataServer <> nil)
   then begin
    fmVIDEODataServer.AVIProcessing.Lock.Enter;
    try
    FillChar(VarBound, SizeOf(VarBound), 0);
    SrsPtr:=fmVIDEODataServer.AVIProcessing.pWFX;
    SrsSize:=TWaveFormatEx(fmVIDEODataServer.AVIProcessing.pWFX^).cbSize; //. WAV header size
    VarBound.ElementCount:=SrsSize;
    PA:=SafeArrayCreate(varByte, 1, VarBound);
    SafeArrayAccessData(PA, DataPtr);
    asm
       PUSH ESI
       PUSH EDI
       PUSH ECX
       MOV EDI,DataPtr
       MOV ESI,SrsPtr
       MOV ECX,SrsSize
       CLD
       REP MOVSB
       POP ECX
       POP EDI
       POP ESI
    end;
    SafeArrayUnAccessData(PA);
    Header:=PA;
    PacketInterval:=fmVIDEODataServer.AVIProcessing.AudioMsPerFrame;
    CompressionTypeID:=0;
    finally
    fmVIDEODataServer.AVIProcessing.Lock.Leave;
    end;
    end
   else
    Raise Exception.Create('could not get data params'); //. =>
else
  Raise Exception.Create('unknown object'); //. =>
end;
end;

procedure TcoVIDEOData.GetAudioData(idObj: Integer; out Packet: PSafeArray; out PacketID: Integer);
var
  VarBound: TVarArrayBound;
  SrsPtr: pointer;
  SrsSize: integer;
  PA: PSafeArray;
  DataPtr: pointer;
begin
if NOT flValid
 then begin
  Sleep(333);
  Exit; //. ->
  end;
case idObj of
idAUDIODataObj:
  if (fmVIDEODataServer <> nil)
   then begin
    fmVIDEODataServer.AVIProcessing.Lock.Enter;
    try
    FillChar(VarBound, SizeOf(VarBound), 0);
    SrsPtr:=fmVIDEODataServer.AVIProcessing.AudioData;
    SrsSize:=fmVIDEODataServer.AVIProcessing.AudioDataSize;
    VarBound.ElementCount:=SrsSize;
    PA:=SafeArrayCreate(varByte, 1, VarBound);
    SafeArrayAccessData(PA, DataPtr);
    asm
       PUSH ESI
       PUSH EDI
       PUSH ECX
       MOV EDI,DataPtr
       MOV ESI,SrsPtr
       MOV ECX,SrsSize
       CLD
       REP MOVSB
       POP ECX
       POP EDI
       POP ESI
    end;
    SafeArrayUnAccessData(PA);
    PacketID:=fmVIDEODataServer.AVIProcessing.CurrentAudioFrame;
    finally
    fmVIDEODataServer.AVIProcessing.Lock.Leave;
    end;
    Packet:=PA;
    end
   else
    Raise Exception.Create('could not get data params'); //. =>
else
  Raise Exception.Create('unknown object'); //. =>
end;
end;


function TcoVIDEOData.hasAudio: WordBool;
begin
Result:=true;
end;

function TcoVIDEOData.hasVideo: WordBool;
begin
Result:=true;
end;

var
  IUnk: IUnknown;
initialization
CoInitializeEx(nil,COINIT_MULTITHREADED);
//.
IUnk:=CocoSpace.CreateRemote('');
try
IUnk.QueryInterface(IID_IProxySpacesManager,ProxySpacesManager);
if ProxySpacesManager = nil then Raise Exception.Create('could not get IProxySpacesManager'); //. =>
finally
IUnk:=nil;
end;
//.
TAutoObjectFactory.Create(ComServer, TcoVIDEOData, Class_coVIDEOData, ciMultiInstance, tmFree);

finalization
ProxySpacesManager:=nil;
//.
CoUnInitialize;


end.
