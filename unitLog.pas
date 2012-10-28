unit unitLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCGrids, StdCtrls, DBCtrls, ExtCtrls, Db, ADODB,
  Buttons, ImgList, ComCtrls, RxGIF, Gauges, Menus;

const
  PathLog = 'Log';
  SmallPacket = 300;

type
  TWindow = record
    Xmn,Ymn: integer;
    Size: integer;
    flOff: boolean;
    OnColor: TColor;
  end;
  TWindows = array[0..22] of TWindow;
const
  _Windows: TWindows = (
    (Xmn: 219; Ymn: 64; Size: 8;  flOff: false),
    (Xmn: 218; Ymn: 80; Size: 8;  flOff: false),
    (Xmn: 234; Ymn: 64; Size: 8;  flOff: false),
    (Xmn: 270; Ymn: 19; Size: 8;  flOff: false),
    (Xmn: 279; Ymn: 19; Size: 8;  flOff: false),
    (Xmn: 279; Ymn: 28; Size: 8;  flOff: false),
    (Xmn: 263; Ymn: 37; Size: 8;  flOff: false),
    (Xmn: 279; Ymn: 37; Size: 8;  flOff: false),
    (Xmn: 270; Ymn: 55; Size: 8;  flOff: false),
    (Xmn: 279; Ymn: 64; Size: 8;  flOff: false),
    (Xmn: 270; Ymn: 73; Size: 8;  flOff: false),
    (Xmn: 369; Ymn: 55; Size: 8;  flOff: false),
    (Xmn: 378; Ymn: 64; Size: 8;  flOff: false),
    (Xmn: 378; Ymn: 73; Size: 8;  flOff: false),
    (Xmn: 369; Ymn: 82; Size: 8;  flOff: false),
    (Xmn: 405; Ymn: 37; Size: 8;  flOff: false),
    (Xmn: 419; Ymn: 46; Size: 8;  flOff: false),
    (Xmn: 405; Ymn: 55; Size: 8;  flOff: false),
    (Xmn: 419; Ymn: 63; Size: 8;  flOff: false),
    (Xmn: 405; Ymn: 63; Size: 8;  flOff: false),
    (Xmn: 419; Ymn: 80; Size: 8;  flOff: false),
    (Xmn: 450; Ymn: 84; Size: 8;  flOff: false),
    (Xmn: 459; Ymn: 76; Size: 8;  flOff: false)
  );

type
  TSignalTrack = array[0..31] of word;

const
  _SignalTrack: TSignalTrack = (61,112,94,124,85,132,94,147,79,159,94,172,69,193,94,207,54,249,94,258,9,291,94,360,46,389,94,401,26,430,94,500);

type
  TfmLog = class;

  TWindowProcessing = class(TThread)
  private
    Form: TfmLog;
    Windows: TWindows;

    procedure Init;
  public
    Constructor Create(pForm: TfmLog);
    Destructor Destroy; override;
    procedure Execute; override;
  end;

  TSignalProcessing = class(TThread)
  private
    Form: TfmLog;
    LastPosition: TPoint;
    CurrentPosition: TPoint;
    SignalRadius: integer;
    LastSignalStep: integer;
    SignalStep: integer;
    SignalTrack: TSignalTrack;
    SignalTrackIndex: integer;
    flXStep: boolean;
    flLastXStep: boolean;
    OwnSignalProcessing: TSignalProcessing;
    RecursionCount: integer;
    dX,dY: integer;
    CC: TControlCanvas;

    procedure Init;
  public
    Constructor Create(pForm: TfmLog; const pRecursionCount: integer);
    Destructor Destroy; override;
    procedure Execute; override;
  end;



  TfmLog = class(TForm)
    Bevel3: TBevel;
    Panel: TPanel;
    cbLog: TComboBox;
    lbVersion: TLabel;
    Gauge: TPanel;
    pnlLogin: TPanel;
    Label1: TLabel;
    edUserName: TEdit;
    edUserPassword: TEdit;
    sbCancel: TSpeedButton;
    imgLOGO: TImage;
    sbRegisterNewUser: TSpeedButton;
    sbAnonymousEnter: TSpeedButton;
    sbEnter: TSpeedButton;
    pbOperationProgress: TProgressBar;
    ggLoading: TGauge;
    lbLoadingDataSize: TLabel;
    lbLoadingOrTransmitting: TLabel;
    lbCurOperation: TLabel;
    pnlServerURL: TPanel;
    Label2: TLabel;
    edServerURL: TEdit;
    sbTestConnection: TSpeedButton;
    ServersHistory_Popup: TPopupMenu;
    sbExit: TSpeedButton;
    sbAbout: TSpeedButton;
    sbServerHistory: TSpeedButton;
    lbLogoHint: TLabel;
    popupProgramConfiguration: TPopupMenu;
    Programconfiguration1: TMenuItem;
    Deletestoredcontent1: TMenuItem;
    N1: TMenuItem;
    sbCheckUserAccount: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbCancelClick(Sender: TObject);
    procedure sbRegisterNewUserClick(Sender: TObject);
    procedure sbAnonymousEnterClick(Sender: TObject);
    procedure sbEnterClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure sbAboutClick(Sender: TObject);
    procedure sbTestConnectionClick(Sender: TObject);
    procedure sbServerHistoryClick(Sender: TObject);
    procedure Programconfiguration1Click(Sender: TObject);
    procedure Deletestoredcontent1Click(Sender: TObject);
    procedure sbCheckUserAccountClick(Sender: TObject);
  private
    { Private declarations }
    Space: TObject;
    LastVisibility: boolean;
    ///////WP: TWindowProcessing;
    SP: TSignalProcessing;

    procedure UpdateGaugeSize;
    function flEnableRegisterButton: boolean;
    function ProcessMessage(var Msg: TMsg): Boolean;
    procedure ProcessMessages;
    procedure ServerHistory__Popup_ItemClick(Sender: TObject);
  public
    { Public declarations }
    StartTime: TDateTime;
    flInOperation: boolean;
    OperationsCount: integer;
    flExceptionsOccured: boolean;
    flRegistrationRequired: boolean;
    flCancelOperation: boolean;
    ReceivePacketCount: integer;
    BytesReceived: integer;
    TransmitePacketCount: integer;
    BytesTransmitted: integer;

    Constructor Create(pSpace: TObject);
    Destructor Destroy; override;

    procedure Log_Write(const S: string);
    procedure Save;
    procedure ShowLoginPanel;
    procedure HideLoginPanel;
    procedure OperationStarting(const strOperation: string);
    procedure OperationProgress(const Percent: integer);
    procedure OperationDone;
    procedure DoOnDataReceiving(Read: Integer; Total: Integer);
    procedure DoOnDataTransmitting(Sent: Integer; Total: Integer);
  end;

implementation
Uses
  SyncObjs,
  unitConfiguration,
  unitAbout,
  unitMODELServersHistory,
  unitServerConnectionTest,
  unitProxySpace,
  unitReflector,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitMODELUserBillingAccountPanel;

{$R *.DFM}


{TWindowProcessing}
Constructor TWindowProcessing.Create(pForm: TfmLog);
begin
Form:=pForm;
Windows:=_Windows;
Init;
Inherited Create(false);
end;

Destructor TWindowProcessing.Destroy;
begin
Inherited;
end;

procedure TWindowProcessing.Init;
begin
end;

procedure TWindowProcessing.Execute;
const
  OffColor = clGray+1;
var
  I: integer;
  J,K: integer;
  dX,dY: integer;
begin  
dX:=Form.imgLogo.Left;
dY:=Form.imgLogo.Top;
with TControlCanvas.Create do
try
Control:=Form.Panel;
repeat
  if Form.Visible
   then
    for I:=Low(Windows) to High(Windows) do with Windows[I] do begin
      if Random(300) = 10
       then
        if NOT flOff
         then begin
          OnColor:=Pixels[dX+Xmn+3,dY+Ymn+3];
          for J:=Ymn to Ymn+Size do
            for K:=Xmn to Xmn+Size do
             if Pixels[dX+K,dY+J] = OnColor then Pixels[dX+K,dY+J]:=OffColor;
          flOff:=true;
          end
         else begin
          for J:=Ymn to Ymn+Size do
            for K:=Xmn to Xmn+Size do
             if Pixels[dX+K,dY+J] = OffColor then Pixels[dX+K,dY+J]:=OnColor;
          flOff:=false;
          end;
      end;
  Sleep(100);
until Terminated;
finally
Destroy;
end;
end;


{TSignalProcessing}
Constructor TSignalProcessing.Create(pForm: TfmLog; const pRecursionCount: integer);
begin
Form:=pForm;
LastPosition.X:=-1;
OwnSignalProcessing:=nil;
RecursionCount:=pRecursionCount;
dX:=Form.imgLogo.Left;
dY:=Form.imgLogo.Top;
CC:=TControlCanvas.Create;
CC.Control:=Form.Panel;
Init;
Inherited Create(false);
end;

Destructor TSignalProcessing.Destroy;
begin
OwnSignalProcessing.Free;
//.
Inherited;
if LastPosition.X >= 0 then CC.CopyRect(Rect(dX+LastPosition.X-SignalRadius,dY+LastPosition.Y-SignalRadius,dX+LastPosition.X+SignalRadius,dY+LastPosition.Y+SignalRadius), CC, Rect(dX+LastPosition.X-SignalRadius,dY+LastPosition.Y-SignalRadius,dX+LastPosition.X+SignalRadius,dY+LastPosition.Y+SignalRadius));
CC.Destroy;
end;

procedure TSignalProcessing.Init;
begin
//. clear last place;
if LastPosition.X >= 0 then CC.CopyRect(Rect(dX+LastPosition.X-SignalRadius,dY+LastPosition.Y-SignalRadius,dX+LastPosition.X+SignalRadius,dY+LastPosition.Y+SignalRadius), CC, Rect(dX+LastPosition.X-SignalRadius,dY+LastPosition.Y-SignalRadius,dX+LastPosition.X+SignalRadius,dY+LastPosition.Y+SignalRadius));
//.
SignalRadius:=3;
SignalTrack:=_SignalTrack;
LastPosition.X:=0;
with CurrentPosition do begin
X:=0;
Y:=SignalTrack[0];
end;
SignalStep:=2;
LastSignalStep:=SignalStep;
SignalTrackIndex:=1;
flXStep:=true;
flLastXStep:=flXStep;
end;


procedure TSignalProcessing.Execute;
var
  I: integer;
  RN: integer;
begin Exit; /// ? 
I:=0;
RN:=2000+Random(50);
repeat
  //. draw
  if flXStep
   then begin
    if SignalStep > 0
     then
      if (LastPosition.X+SignalStep) <= SignalTrack[SignalTrackIndex]
       then
        CurrentPosition.X:=(LastPosition.X+SignalStep)
       else begin
        Inc(SignalTrackIndex);
        if SignalTrackIndex > High(TSignalTrack)
         then Init
         else begin
          if LastPosition.Y > SignalTrack[SignalTrackIndex] then SignalStep:=-SignalStep;
          flXStep:=false;
          end;
        end;
    end
   else begin
    if SignalStep > 0
     then
      if (LastPosition.Y+SignalStep) <= SignalTrack[SignalTrackIndex]
       then
        CurrentPosition.Y:=(LastPosition.Y+SignalStep)
       else begin
        Inc(SignalTrackIndex);
        if SignalTrackIndex > High(TSignalTrack)
         then Init
         else begin
          SignalStep:=Abs(SignalStep);
          flXStep:=true;
          end;
        end
     else
      if (LastPosition.Y+SignalStep) > SignalTrack[SignalTrackIndex]
       then
        CurrentPosition.Y:=(LastPosition.Y+SignalStep)
       else begin
        Inc(SignalTrackIndex);
        if SignalTrackIndex > High(TSignalTrack)
         then Init
         else begin
          SignalStep:=Abs(SignalStep);
          flXStep:=true;
          end;
        end;
    end;
  with CC do begin
  CopyMode:=cmPatInvert;
  CopyRect(Rect(dX+CurrentPosition.X-SignalRadius,dY+CurrentPosition.Y-SignalRadius,dX+CurrentPosition.X+SignalRadius,dY+CurrentPosition.Y+SignalRadius), CC, Rect(dX+CurrentPosition.X-SignalRadius,dY+CurrentPosition.Y-SignalRadius,dX+CurrentPosition.X+SignalRadius,dY+CurrentPosition.Y+SignalRadius));
  end;
  //. restore last
  if LastPosition.X >= 0
    then begin
     {/// ?- if flLastXStep
      then
       Form.Canvas.CopyRect(Rect(LastPosition.X-SignalRadius,LastPosition.Y-SignalRadius,LastPosition.X-SignalRadius+LastSignalStep,LastPosition.Y+SignalRadius), Form.imgLogo.Picture.Bitmap.Canvas, Rect(LastPosition.X-SignalRadius,LastPosition.Y-SignalRadius,LastPosition.X-SignalRadius+LastSignalStep,LastPosition.Y+SignalRadius))
      else
       if LastSignalStep > 0
        then
         Form.Canvas.CopyRect(Rect(LastPosition.X-SignalRadius,LastPosition.Y-SignalRadius,LastPosition.X+SignalRadius,LastPosition.Y-SignalRadius+LastSignalStep), Form.imgLogo.Picture.Bitmap.Canvas, Rect(LastPosition.X-SignalRadius,LastPosition.Y-SignalRadius,LastPosition.X+SignalRadius,LastPosition.Y-SignalRadius+LastSignalStep))
        else
         Form.Canvas.CopyRect(Rect(LastPosition.X-SignalRadius,LastPosition.Y+SignalRadius,LastPosition.X+SignalRadius,LastPosition.Y+SignalRadius-LastSignalStep), Form.imgLogo.Picture.Bitmap.Canvas, Rect(LastPosition.X-SignalRadius,LastPosition.Y+SignalRadius,LastPosition.X+SignalRadius,LastPosition.Y+SignalRadius-LastSignalStep));}
     LastPosition:=CurrentPosition;
     LastSignalStep:=SignalStep;
     flLastXStep:=flXStep;
     end;
  Sleep(33);
  Inc(I);
  if (I = RN) AND (RecursionCount < 1) then OwnSignalProcessing:=TSignalProcessing.Create(Form,RecursionCount+1);
until Terminated;
end;



{TfmTitle}
Constructor TfmLog.Create(pSpace: TObject);
var
  SL: TStringList;
  I: integer;
  MenuItem: TMenuItem;
begin
Inherited Create(nil);
StartTime:=Now;
Space:=pSpace;
cbLog.Items.Clear;
LastVisibility:=false;
OperationsCount:=0;
flExceptionsOccured:=false;
flRegistrationRequired:=false;
ReceivePacketCount:=0;
BytesReceived:=0;
TransmitePacketCount:=0;
BytesTransmitted:=0;
if flEnableRegisterButton
 then sbRegisterNewUser.Enabled:=true
 else sbRegisterNewUser.Enabled:=false;
ControlStyle:=ControlStyle+[csOpaque];
///////WP:=TWindowProcessing.Create(Self);
SP:=nil;
//.
SL:=TStringList.Create;
try
with TMODELServersHistory.Create do
try
LoadTo(SL)
finally
Destroy;
end;
for I:=0 to SL.Count-1 do begin
  MenuItem:=TMenuItem.Create(ServersHistory_Popup);
  MenuItem.Caption:=SL[I];
  MenuItem.Tag:=I;
  MenuItem.OnClick:=ServerHistory__Popup_ItemClick;
  ServersHistory_Popup.Items.Add(MenuItem);
  end;
finally
SL.Destroy;
end;
end;

Destructor TfmLog.Destroy;
begin
SP.Free;
///////WP.Free;         
Log_Write('end of work.');
if TProxySpace(Space).UserName = 'ROOT'
 then begin
  Log_Write('------------------ Report ------------------');
  Log_Write('UPTIME = '+FormatDateTime('HH:NN.SS',Now-StartTime));
  Log_Write('Receive_PacketCount = '+IntToStr(ReceivePacketCount));
  Log_Write('Bytes_Received = '+IntToStr(BytesReceived));
  Log_Write('Transmite_PacketCount = '+IntToStr(TransmitePacketCount));
  Log_Write('Bytes_Transmitted = '+IntToStr(BytesTransmitted));
  Log_Write('--------------------------------------------');
  end;
Save;
Inherited;
end;

function TfmLog.flEnableRegisterButton: boolean;
begin
/// ? Result:=FileExists(TProxySpace(Space).WorkLocale+'\'+PathLib+'\TLB\retsiger.tlb');
Result:=true;
end;


procedure TfmLog.Save;
var
  FLog: TextFile;
  I: integer;
begin
//. запись LOGа в файл
{$IFNDEF SOAPServer}
with cbLog do begin
AssignFile(FLog,TProxySpace(Space).WorkLocale+'\'+PathLog+'\Last.log');Rewrite(FLog);
try
for I:=0 to Items.Count-1 do WriteLn(FLog,Items[I]);
finally
CloseFile(FLog);
end;
end;
{$ENDIF}
end;

procedure TfmLog.Log_Write(const S: string);
begin
if Visible
 then begin
  Gauge.SetFocus;
  cbLog.Enabled:=true;
  end;
with cbLog do begin
ItemIndex:=Items.Add(S);
Text:=S;
SelStart:=Length(Text);
SelLength:=0;
end;
lbCurOperation.Caption:=ANSILowerCase(S);
lbCurOperation.Update;
UpdateGaugeSize;
Update();
Save;
end;

procedure TfmLog.ShowLoginPanel;
begin
pnlLogin.Show;
sbServerHistory.Show;
end;

procedure TfmLog.HideLoginPanel;
begin
pnlLogin.Hide;
sbServerHistory.Hide;
sbExit.Hide;
sbAbout.Hide;
pnlServerURL.Hide;
lbLogoHint.Hide;
end;

procedure TfmLog.OperationStarting(const strOperation: string);

  procedure UpdateWindows;
  var
    I: integer;
  begin
  for I:=0 to Screen.FormCount-1 do Screen.Forms[I].Update;
  end;

begin
if (GetCurrentThreadID <> MainThreadID) then Exit; //. ->
if (OperationsCount = 0)
 then begin
  LastVisibility:=Visible;
  flInOperation:=true;
  flCancelOperation:=false;
  pbOperationProgress.Hide;
  Height:=pnlServerURL.Top+pnlServerURL.Height+3;
  ggLoading.Progress:=0;
  lbLoadingOrTransmitting.Caption:='data transfer';
  lbLoadingDataSize.Caption:='0/0 Kb';
  Log_Write(strOperation);
  sbCancel.Show;
  lbLoadingOrTransmitting.Show;
  ggLoading.Show;
  lbLoadingDataSize.Show;
  Screen.Cursor:=crDefault;
  {pbOperationProgress.Position:=pbOperationProgress.Min;
  pbOperationProgress.Show;}
  /// ? sbCancel.Show;
  UpdateWindows;
  Show;
  Repaint;
  //.
  SP.Free;
  SP:=TSignalProcessing.Create(Self,1);
  end;
Inc(OperationsCount);
end;

procedure TfmLog.OperationProgress(const Percent: integer);
begin  
if (GetCurrentThreadID <> MainThreadID) then Exit; //. ->
if OperationsCount > 1 then Exit; //. ->
//.
SP.Free;
SP:=nil;
imgLogo.Invalidate;
imgLogo.Update;
//.
pbOperationProgress.Position:=Percent;
pbOperationProgress.Show;
inherited Update;
Repaint;
end;

procedure TfmLog.OperationDone;
begin
if (GetCurrentThreadID <> MainThreadID) then Exit; //. ->
Dec(OperationsCount);
if OperationsCount = 0
 then begin
  //.
  SP.Free;
  SP:=nil;
  //.
  sbCancel.Hide;
  //.
  Visible:=LastVisibility;
  pbOperationProgress.Position:=pbOperationProgress.Max;
  flInOperation:=false;
  Repaint;
  end;
end;

procedure TfmLog.UpdateGaugeSize;
const
  MinWidth = 20;
var
  MesWidth: integer;
  GaugeWidth: integer;
begin
with lbCurOperation do begin
Canvas.Font:=Font;
MesWidth:=Canvas.TextWidth(lbCurOperation.Caption)+5;
GaugeWidth:=Width-MesWidth;
if GaugeWidth < MinWidth then GaugeWidth:=MinWidth;
Gauge.Left:=Left+(Width-GaugeWidth);
Gauge.Width:=GaugeWidth;
end;
end;

procedure TfmLog.FormCreate(Sender: TObject);
var
  hFile: integer;
  FileDate: integer;
  TypesLibDate: TDateTime;
begin
{$I+}
{$IFDEF ExternalTypes}
try
hFile:=FileOpen(TypesLib,fmShareDenyNone);
FileDate:=FileGetDate(hFile);
FileClose(hFile);
TypesLibDate:=FileDateToDateTime(FileDate);
lbVersion.Caption:='Built_by_'+FormatDateTime('DD.MM.YYYY',TypesLibDate);
except
  end;
{$ENDIF}
end;

procedure TfmLog.edUserNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Close;
  Key:=#0;
  end;
end;

procedure TfmLog.sbCancelClick(Sender: TObject);
begin
flCancelOperation:=true;
end;

procedure TfmLog.sbRegisterNewUserClick(Sender: TObject);
begin
flRegistrationRequired:=true;
edUserName.Text:='Anonymous';
edUserPassword.Text:='ra3tkq';
Close;
end;

procedure TfmLog.sbAnonymousEnterClick(Sender: TObject);
begin
edUserName.Text:='Anonymous';
edUserPassword.Text:='ra3tkq';
Close;
end;

procedure TfmLog.sbEnterClick(Sender: TObject);
begin
Close;
end;


function TfmLog.ProcessMessage(var Msg: TMsg): Boolean;
begin
with Application do begin
  Result := False;
  if PeekMessage(Msg, Self.Handle, WM_MOUSEFIRST, WM_MOUSELAST, PM_REMOVE) then
  begin
    Result := True;
    if Msg.message = WM_LBUTTONDOWN then flCancelOperation:=true else 
    if Msg.Message <> WM_QUIT then
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end
    else
      Application.Terminate;
  end;
end;
end;

procedure TfmLog.ProcessMessages;
var
  Msg: TMsg;
begin
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  ReleaseCapture;
  while ProcessMessage(Msg) do {loop};
end;

procedure TfmLog.DoOnDataReceiving(Read: Integer; Total: Integer);
begin 
//.
Inc(ReceivePacketCount);
if Read = Total then Inc(BytesReceived,Read);
//.
if (GetCurrentThreadID <> MainThreadID) OR NOT flInOperation then Exit; //. ->
if Total > SmallPacket
 then begin
  lbLoadingOrTransmitting.Caption:='current loading';
  ggLoading.Progress:=Round(100*Read/Total);
  if Total > 1024
   then lbLoadingDataSize.Caption:=IntToStr(Round(Read/1024))+'/'+IntToStr(Round(Total/1024))+' Kb'
   else lbLoadingDataSize.Caption:=IntToStr(Read)+'/'+IntToStr(Total)+' bt';
  lbLoadingDataSize.Update;
  /// ? if Read = Total then Exit; //. ->
  end;
//. check for cancel
ProcessMessages;
if flCancelOperation
 then begin
  flCancelOperation:=false;
  Inc(BytesReceived,Read);
  Raise EAbort.Create('loading terminated by user'); //. =>
  end;
end;

procedure TfmLog.DoOnDataTransmitting(Sent: Integer; Total: Integer);
begin
//.
Inc(TransmitePacketCount);
if Sent = Total then Inc(BytesTransmitted,Sent);
//.
if (GetCurrentThreadID <> MainThreadID) OR NOT flInOperation then Exit; //. ->
if Total > SmallPacket
 then begin
  lbLoadingOrTransmitting.Caption:='transmitting';
  ggLoading.Progress:=Round(100*Sent/Total);
  if Total > 1024
   then lbLoadingDataSize.Caption:=IntToStr(Round(Sent/1024))+'/'+IntToStr(Round(Total/1024))+' Kb'
   else lbLoadingDataSize.Caption:=IntToStr(Sent)+'/'+IntToStr(Total)+' bt';
  lbLoadingDataSize.Update;
  /// ? if Sent = Total then Exit; //. ->
  end;
//. check for cancel
ProcessMessages;
if flCancelOperation
 then begin
  flCancelOperation:=false;
  Inc(BytesTransmitted,Sent);
  Raise EAbort.Create('sending terminated by user'); //. =>
  end;
end;


procedure TfmLog.sbExitClick(Sender: TObject);
begin
Space.Free; //. уничтожаем пространство
//. halt
IsConsole:=true;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmLog.sbAboutClick(Sender: TObject);
begin
with TfmAbout.Create(nil) do Show;
end;

procedure TfmLog.sbTestConnectionClick(Sender: TObject);
begin
{$IFNDEF EmbeddedServer}
with TfmServerConnectionTest.Create(edServerURL.Text) do begin
AlphaBlend:=false;
Show;
end;
{$ELSE}
Raise Exception.Create('operation unavailable in embedded server mode'); //. =>
{$ENDIF}
end;

procedure TfmLog.sbCheckUserAccountClick(Sender: TObject);
var
  {$IFNDEF EmbeddedServer}
  MODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
  {$ENDIF}
  UserID: integer;
  SC: TCursor;
begin
{$IFNDEF EmbeddedServer}
MODELServerSOAPFunctionality:=GetITMODELServerSOAPFunctionality(edServerURL.Text);
UserID:=MODELServerSOAPFunctionality.GetUserID(edUserName.Text,edUserPassword.Text,0,edUserName.Text,edUserPassword.Text);
//.
with TfmMODELUserBillingAccountPanel.Create(edServerURL.Text,edUserName.Text,edUserPassword.Text,UserID) do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Update();
finally
Screen.Cursor:=SC;
end;
ShowModal();
finally
Destroy();
end;
{$ELSE}
Raise Exception.Create('operation unavailable in embedded server mode'); //. =>
{$ENDIF}
end;

procedure TfmLog.sbServerHistoryClick(Sender: TObject);
begin
ServersHistory_Popup.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfmLog.ServerHistory__Popup_ItemClick(Sender: TObject);
var
  ServerURL: WideString;
  ServerSpaceID: integer;
  UserName,UserPassword: WideString;
begin
with TMODELServersHistory.Create do
try
GetItem((Sender as TMenuItem).Tag,  ServerURL, ServerSpaceID, UserName,UserPassword);
edServerURL.Text:=ServerURL;
edUserName.Text:=UserName;
edUserPassword.Text:=UserPassword;
finally
Destroy;
end;
end;

procedure TfmLog.Programconfiguration1Click(Sender: TObject);
begin
ProgramConfiguration.GetPanel().ShowModal();
end;

procedure TfmLog.Deletestoredcontent1Click(Sender: TObject);
begin
if (MessageDlg('Delete context ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes)
 then begin
  TProxySpaceSavedUserContext.DestroyAllContext();
  ShowMessage('Context has been deleted.');
  end;
end;


end.
