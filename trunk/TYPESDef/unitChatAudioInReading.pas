
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

unit unitChatAudioInReading;

interface

uses
  Windows, SyncObjs, MMSystem, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Gauges, Buttons, unitSignalChanels, ComCtrls;

  
Const
  SignalBufferMaxSize = 1000000;
  WM_STOP = WM_USER+1;
  
Type
  TModeDescr=record
     Channels: integer;
     Rate: integer;
     Bits: integer;
     mode: DWORD;          // код режима работы
     descr: string[32];    // словесное описание
  end;

  TOnFormatPrepared = procedure (const Format: TWaveFormatEx; const EncryptionInfo: WideString) of object;
  TOnBufferFilled = procedure (BufferPtr: pointer; BufferSize: integer; const EncryptionInfo: WideString) of object;
  TOnReadingStop = procedure (const EncryptionInfo: WideString) of object;

  TfmChatAudioInReading = class;

  TReadingBuffer = class(TThread)
  private
    Lock: TCriticalSection;
    fmChatAudioInReading: TfmChatAudioInReading;
    ItemSize: integer;
    Items: pointer;
    ItemsCount: integer;
    ItemsSize: integer;
    evtItemInserted: THandle;
    WritePosition: integer;
    ReadPosition: integer;
    flTransmitError: boolean;

    Constructor Create(pfmChatAudioInReading: TfmChatAudioInReading; const pItemSize: integer; const pItemsCount: integer);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure Insert(const ItemPtr: pointer; const pItemSize: integer);
    procedure SkipItems;
    function UnReadCount: integer;
  end;

  TfmChatAudioInReading = class(TForm)
    Timer: TTimer;
    cbInOn: TCheckBox;
    Label2: TLabel;
    cbReadingDevices: TComboBox;
    lbReadingModes: TListBox;
    imgInOff: TImage;
    imgInOn: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    ggReadingBufferUtilizing: TGauge;
    sbPauseContinue: TSpeedButton;
    lbReadingBufferUtilizing: TLabel;
    lbTransmitting: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label1: TLabel;
    edKvant: TEdit;
    memoIN: TMemo;
    sbSkipBuffer: TSpeedButton;
    Label4: TLabel;
    edEncryptionInfo: TEdit;
    pnlSignalDetecting: TPanel;
    tbSignalDifferent: TTrackBar;
    Label6: TLabel;
    tbSignalHysteresis: TTrackBar;
    Label7: TLabel;
    tbSignalAnalizingLength: TTrackBar;
    Label5: TLabel;
    imgInOnSignal: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure cbReadingDevicesChange(Sender: TObject);
    procedure cbInOnClick(Sender: TObject);
    procedure sbPauseContinueClick(Sender: TObject);
    procedure sbSkipBufferClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
  private
    { Private declarations }
    ReadSize: integer;
    ReadBuffer0Ptr: pointer;
    ReadBuffer1Ptr: pointer;
    Channels: integer;
    BitsPerSample: integer;
    Rate: integer;
    device: integer;
    wfx:      TWaveFormatEx;
    WH0,WH1:  TWaveHdr;
    ReadingWHPtr: pointer;
    hwi:      HWAVEIN;
    flReadingCancelling: boolean;
    ReadingBuffer: TReadingBuffer;
    SignalDetector: TSignalDetector;

    procedure wmStop(var Message: TMessage); message WM_STOP;
  public
    { Public declarations }
    flReading: boolean;
    flPaused: boolean;
    flSignal: boolean;
    OnFormatPrepared: TOnFormatPrepared;
    OnBufferFilled: TOnBufferFilled;
    OnReadingStop: TOnReadingStop;
    WaveDataLength: integer;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;

    procedure Update;
    procedure Start;
    procedure Stop;
    procedure UpdateStatistics;
    procedure SetPause(const pflPause: boolean);
  end;


var
  fmChatAudioInReading: TfmChatAudioInReading = nil;

implementation

{$R *.dfm}



{TReadingBuffer}
Constructor TReadingBuffer.Create(pfmChatAudioInReading: TfmChatAudioInReading; const pItemSize: integer; const pItemsCount: integer);
begin
Lock:=TCriticalSection.Create;
fmChatAudioInReading:=pfmChatAudioInReading;
ItemSize:=pItemSize;
ItemsCount:=pItemsCount;
ItemsSize:=ItemSize*ItemsCount;
Items:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,ItemSize*ItemsCount));
WritePosition:=0;
ReadPosition:=0;
evtItemInserted:=CreateEvent(nil,false,false,nil);
Inherited Create(false);
end;

Destructor TReadingBuffer.Destroy;
var
  EC: dword;
begin
//. terminating thread
Inherited;
{GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);}
//.
CloseHandle(evtItemInserted);
GlobalFree(Integer(Items));
Lock.Free;
end;

procedure TReadingBuffer.Execute;
var
  R: word;
  flBufferFilled: boolean;
  ItemPtr: pointer;
  Selections: TSelections;
  SelectionSize: integer;
  SignalBufferPtr: pointer;
  SignalBufferSize: integer;
  SignalBufferWritePtr: pointer;
  SignalCountDown: integer;

  procedure ProcessItem(const ItemPtr: pointer; const ItemSize: integer);
  var
    I,J: integer;
    P: Extended;
  begin
  with fmChatAudioInReading do begin
  I:=0;
  while I < ItemSize do begin
    for J:=0 to Length(Selections)-1 do
      //. get selection
      case SelectionSize of
      1: begin
        Selections[J].Value:=Byte(Pointer(Integer(ItemPtr)+I)^);
        Inc(I,SizeOf(Byte));
        end;
      2: begin
        Selections[J].Value:=Word(Pointer(Integer(ItemPtr)+I)^);
        Inc(I,SizeOf(Word));
        end;
      else
        Raise Exception.Create('unknown selection size'); //. =>
      end;
    //. insert selection into the detector
    SignalDetector.DoOnAddSelections(Selections);
    //.
    P:=SignalDetector.P;
    if P > tbSignalDifferent.Position
     then begin
      SignalCountDown:=Round(wfx.nAvgBytesPerSec*(tbSignalHysteresis.Position/1000));
      flSignal:=true;
      end;
    //.
    if SignalCountDown > 0
     then begin
      with TChanel(SignalDetector[0]).CyclicBuffer do
      for J:=0 to Length(Selections)-1 do
        //. get selection
        case SelectionSize of
        1: begin
          Byte(SignalBufferWritePtr^):=Byte(TSelection(Pointer(Integer(BufferPtr)+BufferHeadOffset)^).Value);
          SignalBufferWritePtr:=Pointer(Integer(SignalBufferWritePtr)+SizeOf(Byte));
          Inc(SignalBufferSize,SizeOf(Byte));
          end;
        2: begin
          Word(SignalBufferWritePtr^):=Word(TSelection(Pointer(Integer(BufferPtr)+BufferHeadOffset)^).Value);
          SignalBufferWritePtr:=Pointer(Integer(SignalBufferWritePtr)+SizeOf(Word));
          Inc(SignalBufferSize,SizeOf(Word));
          end;
        else
          Raise Exception.Create('unknown selection size'); //. =>
        end;
      if SignalBufferSize >= SignalBufferMaxSize
       then begin
        //. Transmitting full buffer
        flTransmitError:=false;
        try
        if Assigned(OnBufferFilled) then OnBufferFilled(SignalBufferPtr,SignalBufferSize, edEncryptionInfo.Text);
        except
          flTransmitError:=true;
          PostMessage(fmChatAudioInReading.Handle, WM_STOP, 0,0);
          end;
        //.
        SignalBufferWritePtr:=SignalBufferPtr;
        SignalBufferSize:=0;
        end;
      //.
      Dec(SignalCountDown);
      end
     else
      if (SignalBufferSize > 0)
       then begin
        //. Transmitting
        flTransmitError:=false;
        try
        if Assigned(OnBufferFilled) then OnBufferFilled(SignalBufferPtr,SignalBufferSize, edEncryptionInfo.Text);
        except
          flTransmitError:=true;
          PostMessage(fmChatAudioInReading.Handle, WM_STOP, 0,0);
          end;
        //.
        SignalBufferWritePtr:=SignalBufferPtr;
        SignalBufferSize:=0;
        flSignal:=false;
        end;
    //.
    end;
  end;
  end;

begin
with fmChatAudioInReading do begin
ItemPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,ItemSize));
try
SignalBufferPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,SignalBufferMaxSize));
try
SignalBufferWritePtr:=SignalBufferPtr;
SignalBufferSize:=0;
SignalCountDown:=0;
//.
SelectionSize:=BitsPerSample div 8;
SignalDetector:=TSignalDetector.Create(nil);
SignalDetector.SetParams(Channels,Round(Rate/tbSignalAnalizingLength.Position));
SetLength(Selections,SignalDetector.Count);
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
      Move(Pointer(Integer(Items)+ReadPosition)^,ItemPtr^, ItemSize);
      Inc(ReadPosition,ItemSize);
      if ReadPosition >= ItemsSize then ReadPosition:=0;
      finally
      Lock.Leave;
      end;
      //. process item
      ProcessItem(ItemPtr,ItemSize);
      //.
    until Terminated;
until Terminated;
finally
SignalDetector.Destroy;
end;
finally
GlobalFree(Integer(SignalBufferPtr));
end;
finally
GlobalFree(Integer(ItemPtr));
end;
end;
end;

procedure TReadingBuffer.Insert(const ItemPtr: pointer; const pItemSize: integer);
begin
Lock.Enter;
try
Move(ItemPtr^,Pointer(Integer(Items)+WritePosition)^, pItemSize);
Inc(WritePosition,ItemSize);
if WritePosition >= ItemsSize then WritePosition:=0;
finally
Lock.Leave;
end;
//.
SetEvent(evtItemInserted);
end;

procedure TReadingBuffer.SkipItems;
begin
Lock.Enter;
try
ReadPosition:=WritePosition;
finally
Lock.Leave;
end;
end;

function TReadingBuffer.UnReadCount: integer;
begin
Lock.Enter;
try
Result:=WritePosition-ReadPosition;
finally
Lock.Leave;
end;
if Result < 0 then Result:=ItemsSize+Result;
Result:=Result div ItemSize;
end;



const
// массив содержит сопоставления режима работы и словесного описания
   modes: array [1..6] of TModeDescr=((Channels: 1; Rate: 11025; Bits: 8; mode: WAVE_FORMAT_1M08; descr:'11.025 kHz, mono, 8-bit'),
                               /// +        (Channels: 1; Rate: 11025; Bits: 16; mode: WAVE_FORMAT_1M16; descr:'11.025 kHz, mono, 16-bit'),
                                       (Channels: 2; Rate: 11025; Bits: 8; mode: WAVE_FORMAT_1S08; descr:'11.025 kHz, stereo, 8-bit'),
                               /// +        (Channels: 2; Rate: 11025; Bits: 16; mode: WAVE_FORMAT_1S16; descr:'11.025 kHz, stereo, 16-bit'),
                                       (Channels: 1; Rate: 22050; Bits: 8; mode: WAVE_FORMAT_2M08; descr:'22.05 kHz, mono, 8-bit'),
                               /// +        (Channels: 1; Rate: 22050; Bits: 16; mode: WAVE_FORMAT_2M16; descr:'22.05 kHz, mono, 16-bit'),
                                       (Channels: 2; Rate: 22050; Bits: 8; mode: WAVE_FORMAT_2S08; descr:'22.05 kHz, stereo, 8-bit'),
                               /// +        (Channels: 2; Rate: 22050; Bits: 16; mode: WAVE_FORMAT_2S16; descr:'22.05 kHz, stereo, 16-bit'),
                                       (Channels: 1; Rate: 44100; Bits: 8; mode: WAVE_FORMAT_4M08; descr:'44.1 kHz, mono, 8-bit'),
                               /// +        (Channels: 1; Rate: 44100; Bits: 16; mode: WAVE_FORMAT_4M16; descr:'44.1 kHz, mono, 16-bit'),
                                       (Channels: 2; Rate: 44100; Bits: 8; mode: WAVE_FORMAT_4S08; descr:'44.1 kHz, stereo, 8-bit'));
                               /// +        (Channels: 2; Rate: 44100; Bits: 16; mode: WAVE_FORMAT_4S16; descr:'44.1 kHz, stereo, 16-bit'));


{TfmChatAudioInReading}

//. in device callback
procedure waveInProc(hwo: HWAVEIN; uMsg: UINT; dwInstance, dwParam1,dwParam2: DWORD); stdcall;
var
  p: pointer;
begin
if (fmChatAudioInReading = nil) then Exit; //. ->
with fmChatAudioInReading do
case uMsg of
WIM_OPEN: begin
  end;
WIM_DATA: if flReading then begin
  p:=ReadingWHPtr;
  if NOT flReadingCancelling
   then begin
    if ReadingWHPtr = @WH0 then ReadingWHPtr:=@WH1 else ReadingWHPtr:=@WH0;
    waveInAddBuffer(hwi,ReadingWHPtr,sizeof(TWaveHdr));
    end;
  //.
  ReadingBuffer.Insert(TWaveHdr(p^).lpData,TWaveHdr(p^).dwBytesRecorded);
  ReadSize:=ReadSize+TWaveHdr(p^).dwBytesRecorded;
  //.
  end;
WIM_CLOSE: begin
  GlobalFree(Integer(ReadBuffer0Ptr));
  GlobalFree(Integer(ReadBuffer1Ptr));
  try
  if Assigned(OnReadingStop) then OnReadingStop(fmChatAudioInReading.edEncryptionInfo.Text);
  except
    end;
  end;
end;
end;


Constructor TfmChatAudioInReading.Create(AOwner: TComponent);
begin
Inherited;
flReading:=false;
OnFormatPrepared:=nil;
OnBufferFilled:=nil;
OnReadingStop:=nil;
ReadingBuffer:=nil;
Update;
end;

Destructor TfmChatAudioInReading.Destroy;
begin
if flReading then Stop;
Inherited;
end;

procedure TfmChatAudioInReading.Update;
var
   WaveNums, i: integer;
   WaveInCaps: TWaveInCaps;   //. структура в которую помещается информация об устройстве
begin
//.
cbReadingDevices.Items.Clear;
WaveNums:=waveInGetNumDevs;
if WaveNums > 0
 then
  for i:=0 to WaveNums-1 do begin
    waveInGetDevCaps(i,@WaveInCaps,sizeof(TWaveInCaps));
    // добавляем наименование устройства
    cbReadingDevices.Items.Add(PChar(@WaveInCaps.szPname));
    end;
if cbReadingDevices.Items.Count > 0
 then begin
  cbReadingDevices.ItemIndex:=0;
  cbReadingDevices.OnChange(self);
  end;
//.
end;

procedure TfmChatAudioInReading.Start;
var
  Result: MMResult;
begin
if flReading then Raise Exception.Create('could not start: reading already started'); //. =>
if cbReadingDevices.ItemIndex = -1 then Raise Exception.Create('unknown device'); //. =>
if lbReadingModes.ItemIndex = -1 then Raise Exception.Create('unknown mode'); //. =>
//. preset params
Channels:=modes[lbReadingModes.ItemIndex+1].Channels;
Rate:=modes[lbReadingModes.ItemIndex+1].Rate;
BitsPerSample:=modes[lbReadingModes.ItemIndex+1].Bits;
Device:=cbReadingDevices.ItemIndex;
//. размер буфера для хранения записи
WaveDataLength:=Rate*Channels*BitsPerSample div 8; //. 1 second
WaveDataLength:=WaveDataLength div Round(1000/StrToInt(edKvant.Text));
//. open
ReadBuffer0Ptr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,WaveDataLength));
ReadBuffer1Ptr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,WaveDataLength));
//. инициализация структуры данных
wfx.nChannels:=Channels;       // один канал - МОНО, 2- СТЕРЕО
wfx.wFormatTag:=WAVE_FORMAT_PCM;// формат данных - PCM
wfx.nSamplesPerSec:=Rate;           // sample rate, Hz
wfx.wBitsPerSample:=BitsPerSample;  // бит/выборку
wfx.nBlockAlign:=wfx.nChannels*wfx.wBitsPerSample div 8;
wfx.nAvgBytesPerSec:=RATE*wfx.nChannels*wfx.wBitsPerSample div 8;
wfx.cbSize:=WaveDataLength;              // в данном случае длина буфера
Result:=waveInOpen(@hwi,device,@wfx,Cardinal(@waveInProc),0,CALLBACK_FUNCTION);
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not open device'); //. =>
if Assigned(OnFormatPrepared) then OnFormatPrepared(wfx,edEncryptionInfo.Text);
// готовим заголовоки для буферов
WH0.lpData:=ReadBuffer0Ptr;
WH0.dwBufferLength:=WaveDataLength*sizeof(byte);
WH0.dwUser:=0;
WH0.dwFlags:=0;
Result:=waveInPrepareHeader(hwi,@WH0,sizeof(TWaveHdr));
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not prepare header'); //. =>
WH1.lpData:=ReadBuffer1Ptr;
WH1.dwBufferLength:=WaveDataLength*sizeof(byte);
WH1.dwUser:=0;
WH1.dwFlags:=0;
Result:=waveInPrepareHeader(hwi,@WH1,sizeof(TWaveHdr));
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not prepare header'); //. =>
//.
ReadingBuffer.Free;
ReadingBuffer:=TReadingBuffer.Create(Self,WaveDataLength,Round(1000*(1000/StrToInt(edKvant.Text))));
try
//. ставим буфер в очередь на загрузку
ReadingWHPtr:=@WH0;
Result:=waveInAddBuffer(hwi,ReadingWHPtr,sizeof(TWaveHdr));
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not execute waveInAddBuffer'); //. =>
//. запускае оцифровку
Result:=waveInStart(hwi);
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not execute waveInStart'); //. =>
//.
ReadSize:=0;
cbReadingDevices.Enabled:=false;
lbReadingModes.Enabled:=false;
edKvant.Enabled:=false;
tbSignalAnalizingLength.Enabled:=false;
//.
flReadingCancelling:=false;
flPaused:=false;
flReading:=true;
except
  ReadingBuffer.Destroy;
  ReadingBuffer:=nil;
  Raise; //. =>
  end;
end;

procedure TfmChatAudioInReading.Stop;
var
  Result: MMResult;
begin
if NOT flReading then Raise Exception.Create('could not stop: reading is not started'); //. =>
flReadingCancelling:=true;
Result:=waveInReset(hwi);
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not reset device'); //. =>
Result:=waveInClose(hwi);
if Result <> MMSYSERR_NOERROR then Raise Exception.Create('could not close device'); //. =>
//.
ReadingBuffer.Free;
ReadingBuffer:=nil;
//.
cbReadingDevices.Enabled:=true;
lbReadingModes.Enabled:=true;
edKvant.Enabled:=true;
tbSignalAnalizingLength.Enabled:=true;
//.
flReading:=false;
end;

procedure TfmChatAudioInReading.wmStop(var Message: TMessage);
begin
//.
if flReading then Stop;
cbInOn.Checked:=false;
//.
Application.MessageBox('transmitting is stopped','Information',MB_OK);
end;

procedure TfmChatAudioInReading.SetPause(const pflPause: boolean);
begin
if pflPause
 then begin
  if waveInStop(hwi) <> MMSYSERR_NOERROR then Raise Exception.Create('could not stop device'); //. =>
  end
 else begin
  if waveInStart(hwi) <> MMSYSERR_NOERROR then Raise Exception.Create('could not start device'); //. =>
  end;
flPaused:=pflPause;
end;

procedure TfmChatAudioInReading.UpdateStatistics;
var
  S: string;
begin
memoIN.Hint:='read, bytes: '+IntToStr(ReadSize);
if flReading
 then begin
  imgInOn.Show;
  imgInOff.Hide;
  sbPauseContinue.Show;
  sbSkipBuffer.Show;
  if NOT flPaused
   then sbPauseContinue.Caption:='||'
   else sbPauseContinue.Caption:='>';
  //.
  if flSignal
   then begin
    S:=lbTransmitting.Caption;
    if Random(2) = 0
     then S:=' '+S
     else S:=')'+S;
    if Length(S) > 30 then SetLength(S,30);
    lbTransmitting.Caption:=S;
    lbTransmitting.Show;
    imgInOnSignal.Show;
    end
   else begin
    lbTransmitting.Hide;
    imgInOnSignal.Hide;
    end;
  //.
  end
 else begin
  imgInOff.Show;
  imgInOn.Hide;
  imgInOnSignal.Hide;
  sbPauseContinue.Hide;
  sbSkipBuffer.Hide;
  lbTransmitting.Hide;
  end;
if ReadingBuffer <> nil
 then with ReadingBuffer do begin
  ggReadingBufferUtilizing.Progress:=Round(100*UnReadCount/ItemsCount);
  lbReadingBufferUtilizing.Show;
  ggReadingBufferUtilizing.Show;
  end
 else begin
  ggReadingBufferUtilizing.Hide;
  lbReadingBufferUtilizing.Hide;
  end;
end;

procedure TfmChatAudioInReading.TimerTimer(Sender: TObject);
begin
UpdateStatistics;
end;

procedure TfmChatAudioInReading.cbReadingDevicesChange(Sender: TObject);
var
   i: integer;
   WaveInCaps: TWaveInCaps;   // структура в которую помещается информация об устройстве
begin
lbReadingModes.Clear;
for i:=1 to High(modes) do begin
  waveInGetDevCaps(cbReadingDevices.ItemIndex,@WaveInCaps,sizeof(TWaveInCaps));
  //. выводим поддерживаемые устройством режимы работы
  if (modes[i].mode and WaveInCaps.dwFormats) = modes[i].mode then lbReadingModes.Items.Add(modes[i].descr);
  end;
if lbReadingModes.Items.Count > 0 then lbReadingModes.ItemIndex:=0;
end;

procedure TfmChatAudioInReading.cbInOnClick(Sender: TObject);
begin
if cbInOn.Checked
 then begin
  if NOT flReading
   then
    try
    Start;
    except
      cbInOn.Checked:=false;
      Raise; //. =>
      end;
  end
 else begin
  if flReading then Stop;
  end;
end;

procedure TfmChatAudioInReading.sbPauseContinueClick(Sender: TObject);
begin
if flReading then SetPause(NOT flPaused);
end;

procedure TfmChatAudioInReading.sbSkipBufferClick(Sender: TObject);
begin
if ReadingBuffer <> nil then ReadingBuffer.SkipItems;
end;

procedure TfmChatAudioInReading.TrackBarChange(Sender: TObject);
begin
with TTrackBar(Sender) do Hint:=IntToStr(Position);
end;


end.
