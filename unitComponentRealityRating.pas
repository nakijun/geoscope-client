unit unitComponentRealityRating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  GlobalSpaceDefines, Functionality, StdCtrls, ComCtrls;

const
  WM_UPDATEPANEL = WM_USER+1;
  WM_HIDEPANEL = WM_USER+2;
  
type
  TfmComponentRealityRating = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lvRating: TListView;
    Panel3: TPanel;
    Label1: TLabel;
    edAvarageRate: TEdit;
    Label2: TLabel;
    edRateCount: TEdit;
    cbMyRate: TComboBox;
    edRateReason: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnSetMyRate: TButton;
    edCancel: TButton;
    procedure btnSetMyRateClick(Sender: TObject);
    procedure edCancelClick(Sender: TObject);
  private
    { Private declarations }
    ObjFunctionality: TComponentFunctionality;
    Updater: TComponentPresentUpdater;
    
    procedure _Update;
    procedure PostHideMessage;
    procedure wmUPDATE(var Message: TMessage); message WM_UPDATEPANEL;
    procedure wmHIDE(var Message: TMessage); message WM_HIDEPANEL;
    function SetMyRate(): boolean;
  public
    { Public declarations }
    Constructor Create(const pidTComponent,pidComponent: integer);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;


implementation


{$R *.dfm}


{TfmComponentRealityRating}
Constructor TfmComponentRealityRating.Create(const pidTComponent,pidComponent: integer);
begin
Inherited Create(nil);
ObjFunctionality:=TComponentFunctionality_Create(pidTComponent,pidComponent);
Updater:=ObjFunctionality.TPresentUpdater_Create(Update,PostHideMessage);
//.
Update();
end;

Destructor TfmComponentRealityRating.Destroy;
begin
if (ObjFunctionality <> nil) then ObjFunctionality.Release();
Inherited;
end;

procedure TfmComponentRealityRating.Update;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmUpdate(WM) else PostMessage(Handle, WM_UPDATEPANEL,0,0);
end;

procedure TfmComponentRealityRating.wmUPDATE(var Message: TMessage);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
_Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmComponentRealityRating._Update;
var
  RatingData: TByteArray;
  DataPtr: pointer;
  RateCount: integer;
  AvrRate: Extended;
  I: integer;
  _UserID: integer;
  _Rate: integer;
  _RateTimeStamp: double;
  _RateReason: ShortString;
  _RateReasonLength: byte;
begin
ObjFunctionality.RealityRating_GetData({out} RatingData);
//.
lvRating.Items.BeginUpdate();
try
lvRating.Items.Clear();
if (Length(RatingData) > 0)
 then begin
  DataPtr:=Pointer(@RatingData[0]);
  RateCount:=Integer(DataPtr^); Inc(DWord(DataPtr),SizeOf(RateCount));
  AvrRate:=0.0;
  for I:=0 to RateCount-1 do begin
    _UserID:=Integer(DataPtr^); Inc(DWord(DataPtr),SizeOf(_UserID));
    _Rate:=Integer(DataPtr^); Inc(DWord(DataPtr),SizeOf(_Rate));
    _RateTimeStamp:=Double(DataPtr^); Inc(DWord(DataPtr),SizeOf(_RateTimeStamp));
    _RateReasonLength:=Byte(DataPtr^); Inc(DWord(DataPtr),SizeOf(_RateReasonLength));
    SetLength(_RateReason,_RateReasonLength);
    if (_RateReasonLength > 0)
     then begin
      Move(DataPtr^,Pointer(@_RateReason[1])^,_RateReasonLength);
      Inc(DWord(DataPtr),_RateReasonLength);
      end;
    //.
    AvrRate:=AvrRate+_Rate;
    //.
    with lvRating.Items.Add do begin
    Caption:=FormatDateTime('YYYY/MM/DD',TDateTime(_RateTimeStamp));
    SubItems.Add(IntToStr(_UserID));
    SubItems.Add(IntToStr(_Rate)+' %');
    SubItems.Add(_RateReason);
    end;
    end;
  AvrRate:=AvrRate/RateCount;
  //.
  edAvarageRate.Text:=FormatFloat('0.00',AvrRate)+' %';
  edRateCount.Text:=IntToStr(RateCount);
  end
 else begin
  edAvarageRate.Text:='N/A';
  edRateCount.Text:='0';
  end;
finally
lvRating.Items.EndUpdate();
end;
end;

procedure TfmComponentRealityRating.PostHideMessage;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmHide(WM) else PostMessage(Handle, WM_HIDEPANEL,0,0);
end;

procedure TfmComponentRealityRating.wmHIDE(var Message: TMessage);
begin
Close();
end;

function TfmComponentRealityRating.SetMyRate(): boolean;
var
  MyRate: integer;
begin
Result:=false;
try
MyRate:=StrToInt(cbMyRate.Text);
except
  ShowMessage('wrong percentage number');
  Exit; //. ->
  end;
if (NOT (0 <= MyRate) AND (MyRate <= 100))
 then begin
  ShowMessage('percentage number out of scope');
  Exit; //. ->
  end;
if ((MyRate <> 0) AND (edRateReason.Text = ''))
 then begin
  ShowMessage('rate reason is not specified');
  Exit; //. ->
  end;
ObjFunctionality.RealityRating_AddUserRate(MyRate,edRateReason.Text);
Result:=true;
end;

procedure TfmComponentRealityRating.btnSetMyRateClick(Sender: TObject);
begin
SetMyRate();
end;

procedure TfmComponentRealityRating.edCancelClick(Sender: TObject);
begin
Close();
end;


end.
