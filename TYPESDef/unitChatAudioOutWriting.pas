
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2004 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit unitChatAudioOutWriting;

interface

uses
  Windows, ActiveX, SyncObjs, MMSystem, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  GlobalSpaceDefines, Dialogs, ExtCtrls, StdCtrls, Gauges, Buttons;

type
  TfmChatAudioOutWriting = class;

  TItem = packed record
    DATAPtr: pointer;
    DATASize: integer;
  end;

  TWritingBuffer = class(TThread)
  private
    Lock: TCriticalSection;
    fmChatAudioOutWriting: TfmChatAudioOutWriting;
    Items: pointer;
    ItemsCount: integer;
    ItemsSize: integer;
    evtItemInserted: THandle;
    WritePosition: integer;
    ReadPosition: integer;

    Constructor Create(pfmChatAudioOutWriting: TfmChatAudioOutWriting; const pItemsCount: integer);
    Destructor Destroy; override;
    procedure Clear;
    procedure Execute; override;
    procedure Insert(const pDATAPtr: pointer; const pDATASize: integer);
    procedure SkipItems;
    function UnReadCount: integer;
  end;

  TfmChatAudioOutWriting = class(TForm)
    Updater: TTimer;
    cbOutOn: TCheckBox;
    Label2: TLabel;
    cbWritingDevices: TComboBox;
    imgOutOff: TImage;
    imgOutOn: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ggWritingBufferUtilizing: TGauge;
    sbPauseContinue: TSpeedButton;
    imgOutOnPaused: TImage;
    imgOutOnDisabled: TImage;
    lbReadingBufferUtilizing: TLabel;
    lbReceiving: TLabel;
    Bevel3: TBevel;
    memoOUT: TMemo;
    sbSkipBuffer: TSpeedButton;
    Label1: TLabel;
    edEncryptionInfo: TEdit;
    imgOutOnSignal: TImage;
    sbStop: TSpeedButton;
    procedure UpdaterTimer(Sender: TObject);
    procedure sbPauseContinueClick(Sender: TObject);
    procedure sbSkipBufferClick(Sender: TObject);
    procedure sbStopClick(Sender: TObject);
  private
    { Private declarations }
    HWO: HWaveOut;
    wh:  TWaveHdr;
    evtDone: THandle;
    WritingBuffer: TWritingBuffer;
    WroteSize: integer;
    flStatisticsUpdating: boolean;
  public
    { Public declarations }
    flWriting: boolean;
    flDisabled: boolean;
    flPaused: boolean;
    flSignal: boolean;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;

    procedure Update;
    procedure Start(DATA: PSafeArray; DATASize: Integer);
    procedure Stop;
    procedure InsertDATAPacket(const DATA: PSafeArray; const DATASize: Integer);
    procedure DoOnDATAPacket(const DATAPtr: pointer; const DATASize: Integer);
    procedure UpdateStatistics;
    procedure SetPause(const pflPause: boolean);
  end;


  function TransmitData(DATAType: TTransmitDataType; DATA: PSafeArray; DATASize: Integer; const EncryptionInfo: WideString): boolean;

var
  fmChatAudioOutWriting: TfmChatAudioOutWriting = nil;

implementation
Uses
  unitChatAudioInReading;

{$R *.dfm}



{TWritingBuffer}
Constructor TWritingBuffer.Create(pfmChatAudioOutWriting: TfmChatAudioOutWriting; const pItemsCount: integer);
var
  I: integer;
begin
Lock:=TCriticalSection.Create;
fmChatAudioOutWriting:=pfmChatAudioOutWriting;
ItemsCount:=pItemsCount;
ItemsSize:=ItemsCount*SizeOf(TItem);
Items:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,ItemsSize));
for I:=0 to ItemsCount-1 do with TItem(Pointer(Integer(Items)+I*SizeOf(TItem))^) do begin
  DATAPtr:=nil;
  DATASize:=0;
  end;
WritePosition:=0;
ReadPosition:=0;
evtItemInserted:=CreateEvent(nil,false,false,nil);
Inherited Create(false);
end;

Destructor TWritingBuffer.Destroy;
var
  EC: dword;
begin
//. terminating thread
Inherited;
{GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);}
//.
CloseHandle(evtItemInserted);
Clear;
GlobalFree(Integer(Items));
Lock.Free;
end;

procedure TWritingBuffer.Clear;
var
  I: integer;
begin
for I:=0 to ItemsCount-1 do with TItem(Pointer(Integer(Items)+I*SizeOf(TItem))^) do begin
  if DATAPtr <> nil
   then begin
    GlobalFree(Integer(DATAPtr));
    DATAPtr:=nil;
    end;
  DATASize:=0;
  end;
end;

procedure TWritingBuffer.Execute;
var
  R: word;
  flBufferFilled: boolean;
  DATAPtr: pointer;
  DATASize: integer;
begin
DATAPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,SignalBufferMaxSize));
try
repeat
  R:=WaitForSingleObject(evtItemInserted, 100);
  if R = WAIT_OBJECT_0
   then
    repeat
      Lock.Enter;
      try
      flBufferFilled:=ReadPosition <> WritePosition;
      finally
      Lock.Leave;
      end;
      if NOT flBufferFilled then Break; //. >
      //.
      Lock.Enter;
      try
      //. move packet
      Move(TItem(Pointer(Integer(Items)+ReadPosition)^).DATAPtr^,DATAPtr^, TItem(Pointer(Integer(Items)+ReadPosition)^).DATASize);
      DATASize:=TItem(Pointer(Integer(Items)+ReadPosition)^).DATASize;
      //.
      Inc(ReadPosition,SizeOf(TItem));
      if ReadPosition >= ItemsSize then ReadPosition:=0;
      flBufferFilled:=ReadPosition <> WritePosition;
      finally
      Lock.Leave;
      end;
      fmChatAudioOutWriting.DoOnDATAPacket(DATAPtr,DATASize);
      //.
    until Terminated;
until Terminated;
finally
GlobalFree(Integer(DATAPtr));
end;
end;

procedure TWritingBuffer.Insert(const pDATAPtr: pointer; const pDATASize: integer);
begin
Lock.Enter;
try
with TItem(Pointer(Integer(Items)+WritePosition)^) do begin
if DATASize < pDATASize
 then begin
  if DATAPtr <> nil then GlobalFree(Integer(DATAPtr));
  DATAPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,pDATASize));
  end;
Move(pDATAPtr^,DATAPtr^, pDATASize);
DATASize:=pDATASize;
end;
Inc(WritePosition,SizeOf(TItem));
if WritePosition >= ItemsSize then WritePosition:=0;
finally
Lock.Leave;
end;
//.
SetEvent(evtItemInserted);
end;

procedure TWritingBuffer.SkipItems;
begin
Lock.Enter;
try
ReadPosition:=WritePosition;
finally
Lock.Leave;
end;
end;

function TWritingBuffer.UnReadCount: integer;
begin
Lock.Enter;
try
Result:=WritePosition-ReadPosition;
finally
Lock.Leave;
end;
if Result < 0 then Result:=ItemsSize+Result;
Result:=Result div SizeOf(TItem);
end;



{TfmChatAudioOutWriting}

//. out device callback
procedure waveOutProc(hwo: HWAVEOUT; uMsg: UINT; dwInstance, dwParam1,dwParam2: DWORD); stdcall;
begin
if (fmChatAudioOutWriting = nil) then Exit; //. ->
with fmChatAudioOutWriting do
if flWriting and (uMsg=MM_WOM_DONE) then SetEvent(evtDone);
end;

function TransmitData(DATAType: TTransmitDataType; DATA: PSafeArray; DATASize: Integer; const EncryptionInfo: WideString): boolean;
begin
Result:=false;
if fmChatAudioOutWriting = nil then Exit; //. ->
if EncryptionInfo <> fmChatAudioOutWriting.edEncryptionInfo.Text then Raise Exception.Create('access is denied'); //. =>
case DATAType of
tdtChatAudioHeader: begin
  fmChatAudioOutWriting.Start(DATA,DATASize);
  Result:=true;
  end;
tdtChatAudioPacket: begin
  fmChatAudioOutWriting.InsertDATAPacket(DATA,DATASize);
  Result:=true;
  end;
tdtChatAudioStopPacket: begin
  fmChatAudioOutWriting.Stop;
  Result:=true;
  end;
end;
end;


Constructor TfmChatAudioOutWriting.Create(AOwner: TComponent);
begin
Inherited;
WritingBuffer:=nil;
flStatisticsUpdating:=false;
flWriting:=false;
Update;
end;

Destructor TfmChatAudioOutWriting.Destroy;
begin
if flWriting then Stop;
Inherited;
end;

procedure TfmChatAudioOutWriting.Update;
var
   WaveNums, i: integer;
   WaveOutCaps: TWaveOutCaps;   // структура в которую помещается информация об устройстве
begin
//.
cbWritingDevices.Items.Clear;
WaveNums:=waveOutGetNumDevs;
if WaveNums > 0
 then
  for i:=0 to WaveNums-1 do begin
    waveInGetDevCaps(i,@WaveOutCaps,sizeof(TWaveOutCaps));
    // добавляем наименование устройства
    cbWritingDevices.Items.Add(PChar(@WaveOutCaps.szPname));
    end;
if cbWritingDevices.Items.Count > 0
 then begin
  cbWritingDevices.ItemIndex:=0;
  end;
//.
end;

procedure TfmChatAudioOutWriting.Start(DATA: PSafeArray; DATASize: Integer);
var
  DATAPtr: pointer;
  WF: TWaveFormatEx;
begin
if flWriting then Raise Exception.Create('could not start: writing is already started'); //. =>
if cbWritingDevices.ItemIndex = -1 then Raise Exception.Create('unknown device'); //. =>
SafeArrayAccessData(DATA, DATAPtr);
try
WF:=TWaveFormatEx(DATAPtr^);
finally
SafeArrayUnAccessData(DATA);
end;
//. open out device
if waveOutOpen(@HWO,cbWritingDevices.ItemIndex,@WF,Cardinal(@waveOutProc),0,CALLBACK_FUNCTION) <> MMSYSERR_NOERROR then Raise Exception.Create('could not open device'); //. =>
//. prepare device header
wh.lpData:=nil;
wh.dwBufferLength:=0;
wh.dwUser:=0;
wh.dwFlags:=0;
wh.dwLoops:=1;
wh.lpNext:=nil;
wh.reserved:=0;
if waveOutPrepareHeader(hwo,@wh,sizeof(TWaveHdr)) <> MMSYSERR_NOERROR then Raise Exception.Create('could not prepare header'); //. =>
//. create done event
evtDone:=CreateEvent(nil,true,false,nil);
//. create writing buffer
WritingBuffer.Free;
WritingBuffer:=TWritingBuffer.Create(Self,10);
//.
cbWritingDevices.Enabled:=false;
//.
flPaused:=false;
flDisabled:=false;
flSignal:=false;
flWriting:=true;
end;

procedure TfmChatAudioOutWriting.Stop;
begin
if NOT flWriting then Raise Exception.Create('could not stop: writing is not started'); //. =>
//.
WritingBuffer.Free;
WritingBuffer:=nil;
//. close done event
CloseHandle(evtDone);
//.
if waveOutReset(hwo) <> MMSYSERR_NOERROR then Raise Exception.Create('could not reset device'); //. =>}
///if waveOutUnPrepareHeader(hwo,@wh,sizeof(TWaveHdr)) <> MMSYSERR_NOERROR then Raise Exception.Create('could not unprepare header'); //. =>
if waveOutClose(hwo) <> MMSYSERR_NOERROR then Raise Exception.Create('could not close device'); //. =>
//.
cbWritingDevices.Enabled:=true;
//.
flWriting:=false;
end;

procedure TfmChatAudioOutWriting.InsertDATAPacket(const DATA: PSafeArray; const DATASize: Integer);
var
  DATAPtr: pointer;
begin
if NOT flWriting then Raise Exception.Create('writing stopped'); //. =>
/// ? if flDisabled then Exit; //. ->
while flDisabled do Sleep(10);
SafeArrayAccessData(DATA, DATAPtr);
try
WritingBuffer.Insert(DATAPtr,DATASize);
finally
SafeArrayUnAccessData(DATA);
end;
end;

procedure TfmChatAudioOutWriting.DoOnDATAPacket(const DATAPtr: pointer; const DATASize: Integer);
begin
wh.lpData:=DATAPtr;
wh.dwBufferLength:=DATASize;
ResetEvent(evtDone);
flSignal:=true;
try
if waveOutWrite(hwo,@wh,SizeOf(wh)) <> MMSYSERR_NOERROR then Raise Exception.Create('could not write device'); //. =>
//. wait for end of play
WaitForSingleObject(evtDone, INFINITE);
//.
WroteSize:=WroteSize+DATASize;
finally
flSignal:=false;
end;
end;

procedure TfmChatAudioOutWriting.SetPause(const pflPause: boolean);
begin
if pflPause
 then begin
  if waveOutPause(hwo) <> MMSYSERR_NOERROR then Raise Exception.Create('could not stop device'); //. =>
  end
 else begin
  if waveOutRestart(hwo) <> MMSYSERR_NOERROR then Raise Exception.Create('could not start device'); //. =>
  end;
flPaused:=pflPause;
end;

procedure TfmChatAudioOutWriting.UpdateStatistics;
var
  S: string;
begin
flStatisticsUpdating:=true;
try
MemoOUT.Hint:='received, bytes: '+IntToStr(WroteSize);
if flWriting
 then begin
  imgOutOff.Hide;
  if flDisabled
   then begin
    imgOutOn.Hide;
    imgOutOnPaused.Hide;
    sbPauseContinue.Hide;
    sbSkipBuffer.Hide;
    imgOutOnDisabled.Show;
    end
   else
    if flPaused
     then begin
      sbPauseContinue.Caption:='>';
      imgOutOn.Hide;
      imgOutOnDisabled.Hide;
      imgOutOnPaused.Show;
      end
     else begin
      sbPauseContinue.Caption:='||';
      imgOutOnPaused.Hide;
      imgOutOnDisabled.Hide;
      imgOutOn.Show;
      end;
  if flSignal
   then begin
    S:=lbReceiving.Caption;
    if Random(2) = 0
     then S:=' '+S
     else S:=')'+S;
    if Length(S) > 30 then SetLength(S,30);
    lbReceiving.Caption:=S;
    lbReceiving.Show;
    if NOT flPaused then imgOutOnSignal.Show;
    end
   else begin
    lbReceiving.Hide;
    imgOutOnSignal.Hide;
    end;
  sbStop.Show;
  sbPauseContinue.Show;
  sbSkipBuffer.Show;
  cbOutOn.Enabled:=true;
  flDisabled:=NOT cbOutOn.Checked;
  lbReadingBufferUtilizing.Show;
  end
 else begin
  imgOutOn.Hide;
  imgOutOnPaused.Hide;
  imgOutOnDisabled.Hide;
  imgOutOnSignal.Hide;
  sbStop.Hide;
  sbPauseContinue.Hide;
  sbSkipBuffer.Hide;
  imgOutOff.Show;
  cbOutOn.Enabled:=false;
  lbReceiving.Hide;
  lbReadingBufferUtilizing.Hide;
  end;
if WritingBuffer <> nil
 then with WritingBuffer do begin
  ggWritingBufferUtilizing.Progress:=Round(100*UnReadCount/ItemsCount);
  ggWritingBufferUtilizing.Show;
  end
 else
  ggWritingBufferUtilizing.Hide;
finally
flStatisticsUpdating:=false;
end;
end;

procedure TfmChatAudioOutWriting.UpdaterTimer(Sender: TObject);
begin
UpdateStatistics;
end;

procedure TfmChatAudioOutWriting.sbPauseContinueClick(Sender: TObject);
begin
if flWriting then SetPause(NOT flPaused);
end;

procedure TfmChatAudioOutWriting.sbSkipBufferClick(Sender: TObject);
begin
if WritingBuffer <> nil then WritingBuffer.SkipItems;
end;


procedure TfmChatAudioOutWriting.sbStopClick(Sender: TObject);
begin
Stop;
end;

end.
