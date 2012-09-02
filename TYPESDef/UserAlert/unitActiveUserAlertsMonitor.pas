unit unitActiveUserAlertsMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality,
  ComCtrls, ImgList, Menus;

const
  WM_DOONALERTOPERATION = WM_USER+1;
type
  TfmActiveUserAlerts = class(TForm)
    lvActiveUserAlerts: TListView;
    lvActiveUserAlerts_ImageList: TImageList;
    lvActiveUserAlerts_PopupMenu: TPopupMenu;
    Showalertpropertiespanel1: TMenuItem;
    Showalertownerpropertiespanel1: TMenuItem;
    procedure lvActiveUserAlertsDblClick(Sender: TObject);
    procedure Showalertpropertiespanel1Click(Sender: TObject);
    procedure Showalertownerpropertiespanel1Click(Sender: TObject);
    procedure lvActiveUserAlertsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    UserAlertTypeSystemPresentUpdater: TTypeSystemPresentUpdater;

    procedure lvActiveUserAlerts_Update;
    procedure lvActiveUserAlerts_UpdateItem(Item: TListItem);
    procedure lvActiveUserAlerts_InvalidateItem(Item: TListItem; const ErrorMessage: string);
    procedure lvActiveUserAlerts_DoOnAlertOperation(const idUserAlert: integer; const Operation: TComponentOperation);
    procedure _lvActiveUserAlerts_DoOnAlertOperation(const idUserAlert: integer; const Operation: TComponentOperation);
    procedure wmDoOnAlertOperation(var Message: TMessage); message WM_DOONALERTOPERATION;
    procedure ShowAlertOwnerPropsPanel(const idUserAlert: integer);
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;

implementation
uses
  MMSystem;

{$R *.dfm}


Constructor TfmActiveUserAlerts.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
UserAlertTypeSystemPresentUpdater:=TTypeSystemPresentUpdater.Create(SystemTUserAlert, _lvActiveUserAlerts_DoOnAlertOperation);
end;

Destructor TfmActiveUserAlerts.Destroy;
begin
UserAlertTypeSystemPresentUpdater.Free;
Inherited;
end;

procedure TfmActiveUserAlerts.Update;
begin
lvActiveUserAlerts_Update;
end;

procedure TfmActiveUserAlerts.lvActiveUserAlerts_Update;
var
  ActiveUserAlerts: TList;
  I: integer;
  NewItem: TListItem;
begin
with TTUserAlertFunctionality.Create do
try
GetActiveInstanceList(ActiveUserAlerts);
try
with lvActiveUserAlerts.Items do begin
Clear;
BeginUpdate;
try
for I:=0 to ActiveUserAlerts.Count-1 do begin
  NewItem:=Add;
  NewItem.Data:=ActiveUserAlerts[I];
  lvActiveUserAlerts_UpdateItem(NewItem);
  end;
finally
EndUpdate;
end;
end
finally
ActiveUserAlerts.Destroy;
end;
finally
Release;
end;
//. sorting by severity
lvActiveUserAlerts.Columns[1].Tag:=1;
lvActiveUserAlertsColumnClick(nil,lvActiveUserAlerts.Columns[1]);
end;

procedure TfmActiveUserAlerts.lvActiveUserAlerts_UpdateItem(Item: TListItem);
var
  DT: TDateTime;
  idUser: integer;
begin
try
with Item,TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,Integer(Item.Data))) do
try
ImageIndex:=0;
DT:=TimeStamp;
if (DT > 0)
 then Caption:=FormatDateTime('DD/MM/YY HH:NN:SS',DT)
 else Caption:='?';
SubItems.Clear;
SubItems.Add(IntToStr(Severity));
idUser:=UserID;
if (idUser <> 0)
 then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
  try
  SubItems.Add(Name);
  finally
  Release;
  end
 else SubItems.Add('?');
SubItems.Add(Description);
SubItems.Add(IntToStr(idObj));
finally
Release;
end;
except
  on E: Exception do lvActiveUserAlerts_InvalidateItem(Item,E.Message);
  end;
end;

procedure TfmActiveUserAlerts.lvActiveUserAlerts_InvalidateItem(Item: TListItem; const ErrorMessage: string);
begin
with Item do begin
Caption:='?';
SubItems.Clear;
SubItems.Add('?');
SubItems.Add('?');
SubItems.Add('ERROR: '+ErrorMessage);
SubItems.Add(IntToStr(Integer(Data)));
end;
end;

procedure TfmActiveUserAlerts._lvActiveUserAlerts_DoOnAlertOperation(const idUserAlert: integer; const Operation: TComponentOperation);
begin
PostMessage(Handle, WM_DOONALERTOPERATION,WPARAM(idUserAlert),LPARAM(Operation));
end;

procedure TfmActiveUserAlerts.wmDoOnAlertOperation(var Message: TMessage);
begin
lvActiveUserAlerts_DoOnAlertOperation(Integer(Message.WParam), TComponentOperation(Message.LParam));
end;


Type
  TAlertSoundNotifying = class(TThread)
  private
    Space: TProxySpace;
    
    Constructor Create(const pSpace: TProxySpace);
    procedure Execute; override;
  end;

Constructor TAlertSoundNotifying.Create(const pSpace: TProxySpace);
begin
Space:=pSpace;
FreeOnTerminate:=true;
Inherited Create(false);
end;

procedure TAlertSoundNotifying.Execute;
const
  Count = 100;

  function SecondsIdle(): DWord;
  var
    liInfo: TLastInputInfo;
  begin
  liInfo.cbSize:=SizeOf(TLastInputInfo) ;
  GetLastInputInfo(liInfo) ;
  Result:=((GetTickCount - liInfo.dwTime) DIV 1000)
  end;

var
  I: integer;
begin
for I:=1 to Count do begin
  sndPlaySound(PChar(Space.WorkLocale+PathLib+'\'+'WAV'+'\'+'notify.wav'),SND_NODEFAULT OR SND_SYNC{ OR SND_LOOP});
  if ((I >= 5) AND (SecondsIdle() < 2)) then Exit; //. ->
  end;
end;

procedure TfmActiveUserAlerts.lvActiveUserAlerts_DoOnAlertOperation(const idUserAlert: integer; const Operation: TComponentOperation);
var
  NewItem: TListItem;
  I: integer;

  procedure Insert(const idUserAlert: integer);
  begin
  NewItem:=lvActiveUserAlerts.Items.Add;
  NewItem.Data:=Pointer(idUserAlert);
  lvActiveUserAlerts_UpdateItem(NewItem);
  //. sorting by severity
  lvActiveUserAlerts.Columns[1].Tag:=1;
  lvActiveUserAlertsColumnClick(nil,lvActiveUserAlerts.Columns[1]);
  end;

  procedure NotifyOnAlertSignalled(const idUserAlert: integer);
  begin
  //. play sound
  TAlertSoundNotifying.Create(Space);
  //. show alert owner props panel
  ShowAlertOwnerPropsPanel(idUserAlert);
  end;

begin
case Operation of
opCreate: begin
  NotifyOnAlertSignalled(idUserAlert);
  //.
  Insert(idUserAlert);
  end;
opDestroy: with lvActiveUserAlerts do
  for I:=0 to Items.Count-1 do
    if (Integer(Items[I].Data) = idUserAlert)
     then begin
      Items[I].Delete;
      Exit; //. ->
      end;
opUpdate: with lvActiveUserAlerts do
  try
  with TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,idUserAlert)) do
  try
  if (Active)
   then begin
    if (Space.ProxySpaceServerType = pssClient) then NotifyOnAlertSignalled(idUserAlert);
    //.
    for I:=0 to Items.Count-1 do
      if (Integer(Items[I].Data) = idUserAlert)
       then begin
        lvActiveUserAlerts_UpdateItem(Items[I]);
        Exit; //. ->
        end;
    Insert(idUserAlert);
    end
   else lvActiveUserAlerts_DoOnAlertOperation(idUserAlert, opDestroy);
  finally
  Release;
  end;
  except
    on E: Exception do begin
      for I:=0 to Items.Count-1 do
        if (Integer(Items[I].Data) = idUserAlert)
         then begin
          lvActiveUserAlerts_InvalidateItem(Items[I],E.Message);
          Exit; //. ->
          end;
      end;
    end;
end;
end;

procedure TfmActiveUserAlerts.lvActiveUserAlertsDblClick(Sender: TObject);
var
  idUserAlert: integer;
begin
if (lvActiveUserAlerts.Selected = nil) then Exit; //. ->
idUserAlert:=Integer(lvActiveUserAlerts.Selected.Data);
ShowAlertOwnerPropsPanel(idUserAlert);
end;

procedure TfmActiveUserAlerts.ShowAlertOwnerPropsPanel(const idUserAlert: integer);

  procedure ShowOwnerPanelProps(const idTOwner,idOwner: integer);
  begin
  with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  finally
  Release;
  end;
  end;

var
  idTOwner,idOwner: integer;
  CoComponentPanelProps: TForm;
begin
with TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,idUserAlert)) do
try
if (NOT GetOwner(idTOwner,idOwner))
 then begin
  idTOwner:=idTObj;
  idOwner:=idObj;
  end;
finally
Release;
end;
//. show props panel
if (idTOwner <> idTCoComponent)
 then
  ShowOwnerPanelProps(idTOwner,idOwner)
 else begin
  CoComponentPanelProps:=nil;
  Space.Log.OperationStarting('loading ..........');
  try
  try
  CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idOwner),idOwner);
  except
    FreeAndNil(CoComponentPanelProps);
    end;
  finally
  Space.Log.OperationDone;
  end;
  if (CoComponentPanelProps <> nil)
   then with CoComponentPanelProps do begin
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Self.OnKeyDown;
    OnKeyUp:=Self.OnKeyUp;
    Show;
    end
   else ShowOwnerPanelProps(idTOwner,idOwner);
  end
end;

procedure TfmActiveUserAlerts.Showalertpropertiespanel1Click(Sender: TObject);

  procedure ShowOwnerPanelProps(const idTOwner,idOwner: integer);
  begin
  with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  finally
  Release;
  end;
  end;

var
  idUserAlert: integer;
begin
if (lvActiveUserAlerts.Selected = nil) then Exit; //. ->
idUserAlert:=Integer(lvActiveUserAlerts.Selected.Data);
ShowOwnerPanelProps(idTUserAlert,idUserAlert);
end;

procedure TfmActiveUserAlerts.Showalertownerpropertiespanel1Click(Sender: TObject);

  procedure ShowOwnerPanelProps(const idTOwner,idOwner: integer);
  begin
  with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Self.OnKeyDown;
  OnKeyUp:=Self.OnKeyUp;
  Show;
  end;
  finally
  Release;
  end;
  end;

var
  idUserAlert,idTOwner,idOwner: integer;
begin
if (lvActiveUserAlerts.Selected = nil) then Exit; //. ->
idUserAlert:=Integer(lvActiveUserAlerts.Selected.Data);
with TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,idUserAlert)) do
try
if (NOT GetOwner(idTOwner,idOwner))
 then begin
  idTOwner:=idTObj;
  idOwner:=idObj;
  end;
finally
Release;
end;
ShowOwnerPanelProps(idTOwner,idOwner);
end;

function lvActiveUserAlerts_SortByTime(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item1.Caption,Item2.Caption);
end;

function lvActiveUserAlerts_SortByTimeDesc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item2.Caption,Item1.Caption);
end;

function lvActiveUserAlerts_SortBySeverity(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item1.SubItems[0],Item2.SubItems[0]);
end;

function lvActiveUserAlerts_SortBySeverityDesc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item2.SubItems[0],Item1.SubItems[0]);
end;

function lvActiveUserAlerts_SortByUser(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item1.SubItems[1],Item2.SubItems[1]);
end;

function lvActiveUserAlerts_SortByUserDesc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item2.SubItems[1],Item1.SubItems[1]);
end;

function lvActiveUserAlerts_SortByDescription(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item1.SubItems[2],Item2.SubItems[2]);
end;

function lvActiveUserAlerts_SortByDescriptionDesc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item2.SubItems[2],Item1.SubItems[2]);
end;

function lvActiveUserAlerts_SortByID(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item1.SubItems[3],Item2.SubItems[3]);
end;

function lvActiveUserAlerts_SortByIDDesc(Item1, Item2: TListItem; ParamSort: integer): integer; stdcall;
begin
Result:=CompareText(Item2.SubItems[3],Item1.SubItems[3]);
end;



procedure TfmActiveUserAlerts.lvActiveUserAlertsColumnClick(Sender: TObject; Column: TListColumn);
begin
case Column.Index of
0: if (Column.Tag = 0)
 then begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByTime, 0);
  Column.Tag:=1;
  end
 else begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByTimeDesc, 0);
  Column.Tag:=0;
  end;
1: if (Column.Tag = 0)
 then begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortBySeverity, 0);
  Column.Tag:=1;
  end
 else begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortBySeverityDesc, 0);
  Column.Tag:=0;
  end;
2: if (Column.Tag = 0)
 then begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByUser, 0);
  Column.Tag:=1;
  end
 else begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByUserDesc, 0);
  Column.Tag:=0;
  end;
3: if (Column.Tag = 0)
 then begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByDescription, 0);
  Column.Tag:=1;
  end
 else begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByDescriptionDesc, 0);
  Column.Tag:=0;
  end;
4: if (Column.Tag = 0)
 then begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByID, 0);
  Column.Tag:=1;
  end
 else begin
  lvActiveUserAlerts.CustomSort(@lvActiveUserAlerts_SortByIDDesc, 0);
  Column.Tag:=0;
  end;
end;
end;

procedure TfmActiveUserAlerts.FormShow(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Update();
finally
Screen.Cursor:=SC;
end;
end;


end.
