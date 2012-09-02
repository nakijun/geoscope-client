unit unitUserTaskManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls,
  GlobalSpaceDefines,
  FunctionalityImport,
  TypesDefines, StdCtrls, ExtCtrls;


Const
    MODELUSER_TASK_PRIORITY_Normal      = 0;
    MODELUSER_TASK_PRIORITY_Minor       = 1;
    MODELUSER_TASK_PRIORITY_Major       = 2;
    MODELUSER_TASK_PRIORITY_Critical    = 3;
    //.
    MODELUSER_TASK_STATUS_Open                  = 1;  //. new task opened
    MODELUSER_TASK_STATUS_Accepted              = 2;  //. task accepted to process
    MODELUSER_TASK_STATUS_Rejected              = 3;  //. task rejected
    MODELUSER_TASK_STATUS_Processing            = 4;  //. task in process (work in progress)
    MODELUSER_TASK_STATUS_Completed             = 5;  //. task is completed with result
    MODELUSER_TASK_STATUS_Cancelled             = 6;  //. task is cencelled
    MODELUSER_TASK_STATUS_Errored               = 7;  //. task data error
    MODELUSER_TASK_STATUS_OutOfExperience       = 8;  //. task is out of experience of user
    MODELUSER_TASK_STATUS_NotNeeded             = 9;  //. task is not needed
    MODELUSER_TASK_STATUS_Deferred              = 10; //. task is deferred
    MODELUSER_TASK_STATUS_Redirected            = 11; //. task is redirected
    MODELUSER_TASK_STATUS_Dispatched            = 12; //. task has been dispatched to user
    MODELUSER_TASK_STATUS_UserNotAvailable      = 13; //. task user is not available
    MODELUSER_TASK_STATUS_ServerPreprocessed    = 14; //. task is preprocessed by server
    MODELUSER_TASK_STATUS_NeedInfo              = 15; //. task required more task information
    MODELUSER_TASK_STATUS_Consulting            = 16; //. task expert consulting with another expert
    MODELUSER_TASK_STATUS_ReceivedByExpert      = 17; //. expert received task
    //.
    MODELUSER_TASK_TYPE_GMMDCardioExpert        = 1;
    //.
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGAnalysis            = 1;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation        = 2;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterAnalysis         = 3;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation     = 4;

const
    WM_UPDATETASKS = WM_USER+1;
    TasksDataVersion = 1;
    lvTasks_Color = clWhite;
    lvTasks_FontColor = clBlack;


type
  TUserTasksDataLoading = class;

  TTaskItem = record
    id: integer;
    idOwner: integer;
    Priority: integer;
    TType: integer;
    Service: integer;
    Comment: shortstring;
    Status: integer;
    StatusReason: integer;
    StatusTimeStamp: TDateTime;
    StatusComment: shortstring;
    ResultCode: integer;
    ResultComment: shortstring;
    ResultTimeStamp: TDateTime;
  end;

  TTasks = array of TTaskItem;

  TfmUserTaskManager = class(TForm)
    lvTasks: TListView;
    Panel1: TPanel;
    cbTaskEnabledUser: TCheckBox;
    pnlActiveState: TPanel;
    pnlNewTaskState: TPanel;
    NewTaskStateUpdater: TTimer;
    procedure lvTasksDblClick(Sender: TObject);
    procedure lvTasksAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure NewTaskStateUpdaterTimer(Sender: TObject);
    procedure cbTaskEnabledUserClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Tasks: TTasks;
    TasksDataLoading: TUserTasksDataLoading;
    Updater: TComponentPresentUpdater;

    procedure wmUPDATETASKS(var Message: TMessage); message WM_UPDATETASKS;
    procedure UpdateActiveState(const flActive: boolean);
    procedure UpdateNewTaskState(const flNewTask: boolean);
    procedure DoOnTaskReceivedByExpert(const Task: TTaskItem); 
  public
    idUser: integer;
    TaskHandlers: TList;
    { Public declarations }
    Constructor Create();
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
    procedure UpdateInfo;
    procedure lvTasks_UpdateByData(const Data: TByteArray);
    procedure DoTask(const Task: TTaskItem);
  end;

  TUserTaskHandler = class(TForm)
  private
    { Private declarations }
  public
    flPanel: boolean;
    fmUserTaskManager: TfmUserTaskManager;
    Task: TTaskItem;
    { Public declarations }
    Constructor Create(const pfmUserTaskManager: TfmUserTaskManager; const pTask: TTaskItem; const pflPanel: boolean = true);
    Destructor Destroy(); override;
    class procedure DoOnTaskReceivedByExpert(const idUser: integer; const idTask: integer); virtual; abstract;
  end;

  TUserTasksDataLoading = class(TThread)
  private
    fmUserTaskManager: TfmUserTaskManager;
    idUser: integer;
    TasksData: TByteArray;
    //.
    ThreadException: Exception;

    Constructor Create(const pfmUserTaskManager: TfmUserTaskManager);
    Destructor Destroy; override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute; override;
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    procedure DoOnLoading();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel;
  end;


var
  fmUserTaskManager: TfmUserTaskManager;
  procedure Initialize();

implementation
uses
  unitGMMDCardioExpertTask,
  MMSystem;

{$R *.dfm}


{TfmUserTaskManager}
Constructor TfmUserTaskManager.Create();
var
  F: Extended;
  I: integer;
begin
Inherited Create(nil);
idUser:=ProxySpace_UserID();
TasksDataLoading:=nil;
Updater:=TComponentPresentUpdater_Create(idTMODELUser,idUser, Update,nil);
TaskHandlers:=TList.Create();
//.
F:=Width/Screen.Width;
Left:=0;
Top:=0;
Width:=Screen.Width;
for I:=0 to lvTasks.Columns.Count-1 do lvTasks.Columns[I].Width:=Trunc(lvTasks.Columns[I].Width/F);
//.
Update();
end;

Destructor TfmUserTaskManager.Destroy();
begin
if (TaskHandlers <> nil)
 then begin
  while (TaskHandlers.Count > 0) do TUserTaskHandler(TaskHandlers[0]).Destroy(); 
  FreeAndNil(TaskHandlers);
  end;
Updater.Free();
if (TasksDataLoading <> nil)
 then begin
  TasksDataLoading.Cancel();
  TasksDataLoading.fmUserTaskManager:=nil;
  TasksDataLoading:=nil;
  end;
Inherited;
end;

procedure TfmUserTaskManager.Update();
begin
PostMessage(Handle, WM_UPDATETASKS,0,0)
end;

procedure TfmUserTaskManager.wmUPDATETASKS(var Message: TMessage);
begin
if (TasksDataLoading <> nil) then TasksDataLoading.Cancel();
TasksDataLoading:=TUserTasksDataLoading.Create(Self);
end;

procedure TfmUserTaskManager.UpdateInfo;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
UpdateActiveState(TaskEnabled);
finally
Release();
end;
end;

procedure TfmUserTaskManager.lvTasks_UpdateByData(const Data: TByteArray);
var
  LastTasks: TTasks;
  LastSelectedTaskID: integer;
  //.
  Version: integer;
  ItemsCount: integer;
  //.
  Idx: integer;
  I: integer;
  SS: byte;
  S: string;
  flNewTaskArrived: boolean;

  function LastTasks_ActiveTaskExists(const idTask: integer): boolean;
  var
    I: integer;
  begin
  Result:=false;
  for I:=0 to Length(LastTasks)-1 do
    if ((LastTasks[I].Status = MODELUSER_TASK_STATUS_Open) AND (LastTasks[I].id = idTask))
     then begin
      Result:=true;
      Exit; //. ->
      end;
  end;

begin
LastTasks:=Tasks;
//.
if (Data = nil)
 then begin
  SetLength(Tasks,0);
  lvTasks.Items.Clear();
  //.                                                             
  UpdateNewTaskState(false);
  //.
  Exit; //. ->
  end;
flNewTaskArrived:=false;
Idx:=0;
Version:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Version));
if (Version <> TasksDataVersion) then Raise Exception.Create('unknown tasks data version'); //. =>
//.
lvTasks.Items.BeginUpdate();
try
LastSelectedTaskID:=0;
if (lvTasks.ItemIndex <> -1) then LastSelectedTaskID:=Integer(lvTasks.Items[lvTasks.ItemIndex].Data);
lvTasks.Items.Clear();
//.
ItemsCount:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(ItemsCount));
SetLength(Tasks,ItemsCount);
for I:=0 to ItemsCount-1 do with Tasks[I] do begin
  id:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(id));
  idOwner:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(idOwner));
  Priority:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Priority));
  TType:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(TType));
  Service:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Service));
  SS:=Data[Idx]; Inc(Idx); SetLength(Comment,SS); if (SS > 0) then Move(Pointer(@Data[Idx])^,Pointer(@Comment[1])^,SS); Inc(Idx,SS);
  Status:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Status));
  StatusReason:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(StatusReason));
  StatusTimeStamp:=TDateTime(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(StatusTimeStamp));
  SS:=Data[Idx]; Inc(Idx); SetLength(StatusComment,SS); if (SS > 0) then Move(Pointer(@Data[Idx])^,Pointer(@StatusComment[1])^,SS); Inc(Idx,SS);
  ResultCode:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(ResultCode));
  SS:=Data[Idx]; Inc(Idx); SetLength(ResultComment,SS); if (SS > 0) then Move(Pointer(@Data[Idx])^,Pointer(@ResultComment[1])^,SS); Inc(Idx,SS);
  ResultTimeStamp:=TDateTime(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(ResultTimeStamp));
  //.
  with lvTasks.Items.Add do begin
  Data:=Pointer(id);
  //.
  Caption:=IntToStr(id);
  //.
  SubItems.Add(FormatDateTime('YY.MM.DD HH.NN',StatusTimeStamp));
  //.
  case (Priority) of
  MODELUSER_TASK_PRIORITY_Normal:       S:='Normal';
  MODELUSER_TASK_PRIORITY_Minor:        S:='Minor';
  MODELUSER_TASK_PRIORITY_Major:        S:='Major';
  MODELUSER_TASK_PRIORITY_Critical:     S:='Critical';
  else
    S:='Unknown';
  end;
  SubItems.Add(S);
  //.
  case (TType) of
  MODELUSER_TASK_TYPE_GMMDCardioExpert: S:='Cardio';
  else
    S:=IntToStr(TType);
  end;
  SubItems.Add(S);
  //.
  case (Service) of
  MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGAnalysis:             S:='ECG analysis';
  MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation:         S:='ECG consultation';
  MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterAnalysis:          S:='Holter analysis';
  MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation:      S:='Holter consultation';
  else
    S:=IntToStr(Service);
  end;
  SubItems.Add(S);
  //.
  SubItems.Add(Comment);
  //.
  case (Status) of
  MODELUSER_TASK_STATUS_Open:                   S:='Open';
  MODELUSER_TASK_STATUS_Accepted:               S:='Accepted';
  MODELUSER_TASK_STATUS_Rejected:               S:='Rejected';
  MODELUSER_TASK_STATUS_Processing:             S:='Processing';
  MODELUSER_TASK_STATUS_Completed:              S:='Completed';
  MODELUSER_TASK_STATUS_Cancelled:              S:='Cancelled';
  MODELUSER_TASK_STATUS_Errored:                S:='Error';
  MODELUSER_TASK_STATUS_OutOfExperience:        S:='out of experience';
  MODELUSER_TASK_STATUS_NotNeeded:              S:='Not needed';
  MODELUSER_TASK_STATUS_Deferred:               S:='Deferred';
  MODELUSER_TASK_STATUS_Redirected:             S:='Redirected';
  MODELUSER_TASK_STATUS_Dispatched:             S:='Dispatched';
  MODELUSER_TASK_STATUS_UserNotAvailable:       S:='User not available';
  MODELUSER_TASK_STATUS_ServerPreprocessed:     S:='Server preprocessed';
  MODELUSER_TASK_STATUS_NeedInfo:               S:='Need info';
  MODELUSER_TASK_STATUS_Consulting:             S:='Consulting';
  MODELUSER_TASK_STATUS_ReceivedByExpert:       S:='Received';
  else
    S:='Unknown';
  end;
  SubItems.Add(S);
  //.
  SubItems.Add(StatusComment);
  //.
  if (Status = MODELUSER_TASK_STATUS_Completed)
   then begin
    SubItems.Add(FormatDateTime('YY.MM.DD HH.NN',ResultTimeStamp));
    if (ResultCode >= 0)
     then SubItems.Add('OK')
     else SubItems.Add('Error: '+IntToStr(ResultCode));
    SubItems.Add(ResultComment);
    end
   else begin
    SubItems.Add('');
    SubItems.Add('');
    SubItems.Add('');
    end;
  end;
  if (id = LastSelectedTaskID) then lvTasks.ItemIndex:=I;
  if ((Status = MODELUSER_TASK_STATUS_Open) AND (NOT flNewTaskArrived) AND (NOT LastTasks_ActiveTaskExists(id))) then flNewTaskArrived:=true;
  end;
if (ItemsCount > 0) then Show();
finally
lvTasks.Items.EndUpdate();
end;
//.
UpdateNewTaskState(flNewTaskArrived);
if (flNewTaskArrived)
 then begin
  end;
end;

procedure TfmUserTaskManager.DoOnTaskReceivedByExpert(const Task: TTaskItem);
begin
case Task.TType of
MODELUSER_TASK_TYPE_GMMDCardioExpert: TfmGMMDCardioExpertTask.DoOnTaskReceivedByExpert(idUser,Task.id);
end;
end;

procedure TfmUserTaskManager.DoTask(const Task: TTaskItem);
var
  Handler: TUserTaskHandler;
  I: integer;
begin
for I:=0 to TaskHandlers.Count-1 do
  if (TUserTaskHandler(TaskHandlers[I]).Task.id = Task.id)
   then begin
    TUserTaskHandler(TaskHandlers[I]).BringToFront();
    if (TUserTaskHandler(TaskHandlers[I]).WindowState = wsMinimized) then TUserTaskHandler(TaskHandlers[I]).WindowState:=wsNormal;
    Exit; //. ->
    end;
//.
Handler:=nil;
case Task.TType of
MODELUSER_TASK_TYPE_GMMDCardioExpert: begin
  Handler:=TfmGMMDCardioExpertTask.Create(Self,Task);
  end;
else
  Raise Exception.Create('unknown task type, TaskType: '+IntToStr(Task.TType)); //. =>
end;
if (Handler <> nil)
 then begin
  Handler.Show();
  end;
end;

procedure TfmUserTaskManager.UpdateActiveState(const flActive: boolean);
begin
if (flActive)
 then pnlActiveState.Color:=clGreen
 else pnlActiveState.Color:=clSilver;
//.
cbTaskEnabledUser.Enabled:=false;
cbTaskEnabledUser.Checked:=flActive;
cbTaskEnabledUser.Enabled:=true;
end;

Type
  TAlertSoundNotifying = class(TThread)
  private
    Constructor Create();
    procedure Execute; override;
  end;

Constructor TAlertSoundNotifying.Create();
begin
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
  sndPlaySound(PChar('Lib'+'\'+'WAV'+'\'+'notify.wav'),SND_NODEFAULT OR SND_SYNC{ OR SND_LOOP});
  if ((I >= 3) AND (SecondsIdle() < 2)) then Exit; //. ->
  end;
end;

procedure TfmUserTaskManager.UpdateNewTaskState(const flNewTask: boolean);
begin
if (flNewTask)
 then begin
  pnlNewTaskState.Color:=clRed;
  NewTaskStateUpdater.Enabled:=true;
  TAlertSoundNotifying.Create();
  end
 else begin
  NewTaskStateUpdater.Enabled:=false;
  pnlNewTaskState.Color:=clSilver;
  end;
end;

procedure TfmUserTaskManager.FormShow(Sender: TObject);
begin
UpdateInfo();
end;

procedure TfmUserTaskManager.lvTasksAdvancedCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
case (Tasks[Item.Index].Priority) of
MODELUSER_TASK_PRIORITY_Normal: begin
  Sender.Canvas.Brush.Color:=TColor($00DAECD2);
  Sender.Canvas.Font.Color:=clBlack;
  end;
MODELUSER_TASK_PRIORITY_Minor: begin
  Sender.Canvas.Brush.Color:=TColor($00CBD8F3);
  Sender.Canvas.Font.Color:=clBlack;
  end;
MODELUSER_TASK_PRIORITY_Major: begin
  Sender.Canvas.Brush.Color:=TColor($0075A9FF);
  Sender.Canvas.Font.Color:=clBlack;
  end;
MODELUSER_TASK_PRIORITY_Critical: begin
  Sender.Canvas.Brush.Color:=TColor($00332EFE);
  Sender.Canvas.Font.Color:=clWhite;
  end;
else begin
  Sender.Canvas.Brush.Color:=lvTasks_Color;
  Sender.Canvas.Font.Color:=lvTasks_FontColor;
  end
end;
end;

procedure TfmUserTaskManager.lvTasksDblClick(Sender: TObject);
var
  SC: TCursor;
begin
if (lvTasks.ItemIndex = -1) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
DoTask(Tasks[lvTasks.ItemIndex]);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmUserTaskManager.NewTaskStateUpdaterTimer(Sender: TObject);
begin
if ((NewTaskStateUpdater.Tag MOD 2) = 0)
 then pnlNewTaskState.Color:=clRed
 else pnlNewTaskState.Color:=clSilver;
NewTaskStateUpdater.Tag:=NewTaskStateUpdater.Tag+1;
end;

procedure TfmUserTaskManager.cbTaskEnabledUserClick(Sender: TObject);
begin
if (NOT cbTaskEnabledUser.Enabled) then Exit; //. ->
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
TaskEnabled:=cbTaskEnabledUser.Checked;
finally
Release();
end;
UpdateActiveState(cbTaskEnabledUser.Checked);
end;


{TUserTaskHandler}
Constructor TUserTaskHandler.Create(const pfmUserTaskManager: TfmUserTaskManager; const pTask: TTaskItem; const pflPanel: boolean = true);
begin
flPanel:=pflPanel;
Inherited Create(nil);
fmUserTaskManager:=pfmUserTaskManager;
Task:=pTask;
end;

Destructor TUserTaskHandler.Destroy();
begin
Inherited;
end;

{TUserTasksDataLoading}
Constructor TUserTasksDataLoading.Create(const pfmUserTaskManager: TfmUserTaskManager);
begin
fmUserTaskManager:=pfmUserTaskManager;
idUser:=fmUserTaskManager.idUser;
TasksData:=nil;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TUserTasksDataLoading.Destroy;
begin
Cancel();
Inherited;
end;

procedure TUserTasksDataLoading.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TUserTasksDataLoading.Execute;
var
  Task: TTaskItem;
  //.
  Version: integer;
  ItemsCount: integer;
  //.
  Idx: integer;
  I: integer;
  SS: byte;
  S: string;
begin
try
if (Terminated) then Exit; //. ->
TasksData:=nil;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Tasks_GetData(TasksDataVersion,true,{out} TasksData);
finally
Destroy();
end;
//. preprocess tasks data
if (TasksData <> nil)
 then begin
  Idx:=0;
  Version:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(Version));
  if (Version <> TasksDataVersion) then Raise Exception.Create('unknown tasks data version'); //. =>
  //.
  ItemsCount:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(ItemsCount));
  for I:=0 to ItemsCount-1 do with Task do begin
    id:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(id));
    idOwner:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(idOwner));
    Priority:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(Priority));
    TType:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(TType));
    Service:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(Service));
    SS:=TasksData[Idx]; Inc(Idx); SetLength(Comment,SS); if (SS > 0) then Move(Pointer(@TasksData[Idx])^,Pointer(@Comment[1])^,SS); Inc(Idx,SS);
    Status:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(Status));
    StatusReason:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(StatusReason));
    StatusTimeStamp:=TDateTime(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(StatusTimeStamp));
    SS:=TasksData[Idx]; Inc(Idx); SetLength(StatusComment,SS); if (SS > 0) then Move(Pointer(@TasksData[Idx])^,Pointer(@StatusComment[1])^,SS); Inc(Idx,SS);
    ResultCode:=Integer(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(ResultCode));
    SS:=TasksData[Idx]; Inc(Idx); SetLength(ResultComment,SS); if (SS > 0) then Move(Pointer(@TasksData[Idx])^,Pointer(@ResultComment[1])^,SS); Inc(Idx,SS);
    ResultTimeStamp:=TDateTime(Pointer(@TasksData[Idx])^); Inc(Idx,SizeOf(ResultTimeStamp));
    //.
    if (Status = MODELUSER_TASK_STATUS_Open)
     then fmUserTaskManager.DoOnTaskReceivedByExpert(Task);
    end;
  end;
//.
if (Terminated) then Exit; //. ->
Synchronize(DoOnLoading);
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TUserTasksDataLoading.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TUserTasksDataLoading.DoOnLoading;
begin
if (Terminated) then Exit; //. ->
//.
fmUserTaskManager.lvTasks_UpdateByData(TasksData);
end;

procedure TUserTasksDataLoading.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('error while loading tasks data, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TUserTasksDataLoading.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TUserTasksDataLoading.Finalize();
begin
if (fmUserTaskManager = nil) then Exit; //. ->
//.
if (fmUserTaskManager.TasksDataLoading = Self) then fmUserTaskManager.TasksDataLoading:=nil;
end;

procedure TUserTasksDataLoading.Cancel;
begin
Terminate;
end;


procedure Initialize();
begin
fmUserTaskManager:=TfmUserTaskManager.Create();
end;


Initialization
fmUserTaskManager:=nil;

finalization
FreeAndNil(fmUserTaskManager);

end.
