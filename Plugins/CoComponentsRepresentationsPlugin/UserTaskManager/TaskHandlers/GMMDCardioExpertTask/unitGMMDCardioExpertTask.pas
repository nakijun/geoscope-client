unit unitGMMDCardioExpertTask;

interface

uses
  Classes, Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitUserTaskManager,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredMedDeviceModel,
  unitGMMDBusinessModel,
  unitGMMDCardiographBusinessModel,
  StdCtrls, Buttons, ExtCtrls, Grids, Outline, DirOutln;
  ///////unitECGProcDll; //. ECG signal processor window

const
  ObjectWaitingTime = 10; //. seconds
  MeasurementDatabaseFolder = 'GeographServer';
type
  TMeasurementDataLoading = class;

  TTaskParamsV1 = record
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
  end;

  TfmGMMDCardioExpertTask = class(TUserTaskHandler)
    GroupBox1: TGroupBox;
    gbStatus: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbTaskStatus: TComboBox;
    edStatusComment: TEdit;
    btnSetTaskStatus: TBitBtn;
    btnLocateDevice: TBitBtn;
    btnShowDevicePanel: TBitBtn;
    pnlMeasurement: TPanel;
    pnlResult: TPanel;
    memoResult: TMemo;
    btnSetResult: TBitBtn;
    btnConsultacy: TBitBtn;
    btnRedirect: TBitBtn;
    btnCloseConsultation: TBitBtn;
    btnShowObjectPanel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSetResultClick(Sender: TObject);
    procedure btnSetTaskStatusClick(Sender: TObject);
    procedure cbTaskStatusChange(Sender: TObject);
    procedure btnLocateDeviceClick(Sender: TObject);
    procedure btnShowDevicePanelClick(Sender: TObject);
    procedure btnRedirectClick(Sender: TObject);
    procedure btnCloseConsultationClick(Sender: TObject);
    procedure btnConsultacyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnShowObjectPanelClick(Sender: TObject);
  private
    { Private declarations }
    TaskData: TByteArray;
    //.
    TaskParams: TTaskParamsV1;
    //.
    MeasurementBaseFolder: string;
    MeasurementFolder: string;
    MeasurementDataLoading: TMeasurementDataLoading;
    //.
    ObjectModel: TGeoMonitoredMedDeviceModel;
    ObjectBusinessModel: TGMMDBusinessModel;
    //.
    ECGProcessorIndex: integer;

    class procedure LoadTaskData(const idUser: integer; const idTask: integer; out TaskData: TByteArray; out TaskParams: TTaskParamsV1);
    function TaskIsConsultation(): boolean;
    procedure SetLayout();
    procedure StartMeasurementLoading();
    procedure gbStatus_Update(const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
    procedure LocateTaskDevice();
    procedure ShowTaskDevicePanel();
    procedure DoOnMeasurementLoaded();
    procedure CloseConsultation();
  public
    { Public declarations }
    Constructor Create(const pfmUserTaskManager: TfmUserTaskManager; const pTask: TTaskItem; const pflPanel: boolean = true);
    Destructor Destroy(); override;
    class procedure SetTaskStatus(const idUser: integer; const idTask: integer; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string); overload;
    procedure SetTaskStatus(const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string; const flWaitForObject: boolean = true); overload;
    procedure SetTaskResult(const pResultCode: integer; const pResultComment: string);
    class procedure DoOnTaskReceivedByExpert(const idUser: integer; const idTask: integer); override;
    procedure RequestConsultacyTask(const RecipientUserID: integer);
    procedure RedirectTask(const RecipientUserID: integer);
  end;

  TMeasurementDataLoading = class(TThread)
  private
    fmGMMDCardioExpertTask: TfmGMMDCardioExpertTask;
    //.
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
    //.
    MeasurementBaseFolder: string;
    //.
    ThreadException: Exception;

    Constructor Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    procedure DoOnStart();
    procedure DoOnLoading();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
  end;

  TStatusToObjectSending = class(TThread)
  private
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
    //.
    StatusCode: integer;
    StatusReason: integer;
    StatusComment: string;

    Constructor Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
    procedure Execute; override;
    function WaitForFinish(const WaitingTime: integer): boolean;
  end;

  TStatusToDeviceSending = class(TThread)
  private
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
    //.
    StatusCode: integer;
    StatusReason: integer;
    StatusComment: string;

    Constructor Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
    procedure Execute; override;
    function WaitForFinish(const WaitingTime: integer): boolean;
  end;

  TResultToObjectSending = class(TThread)
  private
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
    //.
    ResultCode: integer;
    ResultComment: string;

    Constructor Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pResultCode: integer; const pResultComment: string);
    procedure Execute; override;
    function WaitForFinish(const WaitingTime: integer): boolean;
  end;

  TResultToDeviceSending = class(TThread)
  private
    GeographServerID: integer;
    GeographServerObjectID: integer;
    ObjectID: integer;
    ObjectType: integer;
    BusinessModel: integer;
    ObjectMeasurementID: string;
    //.
    ResultCode: integer;
    ResultComment: string;

    Constructor Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pResultCode: integer; const pResultComment: string);
    procedure Execute; override;
    function WaitForFinish(const WaitingTime: integer): boolean;
  end;


implementation
uses
  TypesDefines,
  CoFunctionality,
  unitCoGeoMonitorObjectPanelProps,
  unitTMODELUserInstanceSelector,
  AbArcTyp,
  AbZipTyp,
  AbUnzPrc,
  AbUtils,
  StrUtils,
  ShellAPI;

{$R *.dfm}


function GetTempDir(): string;
var
  Buffer: array[0..1023] of Char;
begin
SetString(Result, Buffer, GetTempPath(SizeOf(Buffer), Buffer));
end;


{TZipArchive}
type
  TZipArchive = class(TAbZipArchive)
  private
    Constructor CreateFromStream( aStream : TStream; const ArchiveName : string );
    procedure DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
  end;

Constructor TZipArchive.CreateFromStream(aStream: TStream; const ArchiveName: string);
begin
inherited CreateFromStream(aStream,ArchiveName);
ExtractHelper:=DoExtractHelper;
end;

procedure TZipArchive.DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
begin
AbUnzip(Sender,TAbZipItem(Item),NewName);
end;


{TfmGMMDCardioExpertTask}
Constructor TfmGMMDCardioExpertTask.Create(const pfmUserTaskManager: TfmUserTaskManager; const pTask: TTaskItem; const pflPanel: boolean = true);
var
  ServerObjectController: TGEOGraphServerObjectController;
begin
Inherited Create(pfmUserTaskManager,pTask,pflPanel);
MeasurementDataLoading:=nil;
LoadTaskData(fmUserTaskManager.idUser,Task.id,{out} TaskData,{out} TaskParams);
//.
if (TaskParams.ObjectType <> GeoMonitoredMedDeviceModelID) then Raise Exception.Create('object model is not a GeoMonitoredMedDeviceModel'); //. =>
if (TaskParams.BusinessModel <> TGMMDCardiographBusinessModel.ID) then Raise Exception.Create('business model is not a GMMDCardiographBusinessModel'); //. =>
//.
ServerObjectController:=TGEOGraphServerObjectController.Create(TaskParams.GeographServerObjectID,TaskParams.ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
//.
ObjectBusinessModel.Free();
ObjectModel.Free();
ObjectModel:=(TObjectModel.GetModel(TaskParams.ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
///? ObjectBusinessModel:=(TBusinessModel.GetModel(ObjectModel,BusinessModel) as TGMMDBusinessModel);
//.
ECGProcessorIndex:=0;
//.
if (flPanel)
 then begin
  with TaskParams do MeasurementBaseFolder:=GetTempDir()+'\'+MeasurementDatabaseFolder+'\'+'INSTANCEs'+'\'+IntToStr(GeographServerID)+'\'+'Objects'+'\'+IntToStr(ObjectID)+'\'+'MedDeviceData';
  MeasurementFolder:=MeasurementBaseFolder+'\'+TaskParams.ObjectMeasurementID;
  if (NOT DirectoryExists(MeasurementFolder))
   then begin
    ForceDirectories(MeasurementBaseFolder);
    StartMeasurementLoading();
    end
   else DoOnMeasurementLoaded();
  //.
  SetLayout();
  //. set default position
  Left:=fmUserTaskManager.Left;
  Top:=fmUserTaskManager.Top+fmUserTaskManager.Height;
  Width:=fmUserTaskManager.Width;
  Height:=Screen.WorkAreaHeight-Top;
  end;
//.
if (flPanel) then fmUserTaskManager.TaskHandlers.Add(Self);
end;

Destructor TfmGMMDCardioExpertTask.Destroy();
begin
if (flPanel) then fmUserTaskManager.TaskHandlers.Remove(Self);
//.
if (MeasurementDataLoading <> nil)
 then begin
  MeasurementDataLoading.Cancel();
  MeasurementDataLoading.fmGMMDCardioExpertTask:=nil;
  MeasurementDataLoading:=nil;
  end;
//.
if (ECGProcessorIndex <> 0)
 then begin
  ///////unitECGProcDll.Close(ECGProcessorIndex);
  ECGProcessorIndex:=0;
  end;
//.
ObjectBusinessModel.Free();
ObjectModel.Free();
//.
Inherited;
end;

class procedure TfmGMMDCardioExpertTask.LoadTaskData(const idUser: integer; const idTask: integer; out TaskData: TByteArray; out TaskParams: TTaskParamsV1);
var
  Idx: integer;
  Version: integer;
  SS: byte;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Tasks_Item_GetTaskData(idTask,{out} TaskData);
Idx:=0;
Version:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(Version));
case (Version) of
1: with TaskParams do begin
  GeographServerID:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(GeographServerID));
  GeographServerObjectID:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(GeographServerObjectID));
  ObjectID:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(ObjectID));
  ObjectType:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(ObjectType));
  BusinessModel:=Integer(Pointer(@TaskData[Idx])^); Inc(Idx,SizeOf(BusinessModel));
  SS:=TaskData[Idx]; Inc(Idx); SetLength(ObjectMeasurementID,SS); if (SS > 0) then Move(Pointer(@TaskData[Idx])^,Pointer(@ObjectMeasurementID[1])^,SS); Inc(Idx,SS);
  end;
else
  Raise Exception.Create('unknown task data version'); //. =>
end;
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.FormShow(Sender: TObject);
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser)) do
try
//. set status to processing
if (Task.Status <> MODELUSER_TASK_STATUS_Processing)
 then begin
  Task.Status:=MODELUSER_TASK_STATUS_Processing;
  Task.StatusReason:=0;
  Task.StatusComment:=FullName;
  SetTaskStatus(Task.Status,Task.StatusReason,Task.StatusComment);
  end;
//.
finally
Release();
end;
//.
gbStatus_Update(Task.Status,Task.StatusReason,Task.StatusComment);
end;

function TfmGMMDCardioExpertTask.TaskIsConsultation(): boolean;
begin
Result:=(Task.Service IN [MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation,MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation]);
end;

procedure TfmGMMDCardioExpertTask.SetLayout();
begin
if (NOT TaskIsConsultation())
 then begin
  gbStatus.Show();
  btnRedirect.Show();
  btnSetResult.Show();
  memoResult.Show();
  btnCloseConsultation.Hide;
  end
 else begin
  gbStatus.Hide();
  btnRedirect.Hide();
  btnSetResult.Hide();
  memoResult.Hide();
  btnCloseConsultation.Show;
  end;
end;

procedure TfmGMMDCardioExpertTask.StartMeasurementLoading();
begin
if (MeasurementDataLoading <> nil) then MeasurementDataLoading.Cancel();
MeasurementDataLoading:=TMeasurementDataLoading.Create(Self);
end;

procedure TfmGMMDCardioExpertTask.DoOnMeasurementLoaded();
begin
pnlMeasurement.Caption:='measurement is loaded from server';
//.
///////ECGProcessorIndex:=unitECGProcDll.Open(PChar(MeasurementFolder),pnlMeasurement.Handle);
//.
///////ShellExecute(pnlMeasurement.Handle,'open',PChar(MeasurementFolder),nil,nil, SW_SHOW);
end;

class procedure TfmGMMDCardioExpertTask.SetTaskStatus(const idUser: integer; const idTask: integer; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
var
  TaskData: TByteArray;
  TaskParams: TTaskParamsV1;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  MIDBA: TByteArray;
begin
LoadTaskData(idUser,idTask,{out} TaskData,{out} TaskParams);
//. set task status in GeographServer 
ServerObjectController:=TGEOGraphServerObjectController.Create(TaskParams.GeographServerObjectID,TaskParams.ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(TaskParams.ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
SetLength(MIDBA,Length(TaskParams.ObjectMeasurementID));
Move(Pointer(@TaskParams.ObjectMeasurementID[1])^,Pointer(@MIDBA[0])^,Length(MIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value:=pStatusCode;
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value1:=pStatusReason;
DeviceRootComponent.MedDeviceModule.DataStatus.StringValue:=pStatusComment;
DeviceRootComponent.MedDeviceModule.DataStatusProperty.WriteByAddressDataCUAC(MIDBA);
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
//. set status for user task
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Tasks_Item_SetStatus1(idTask, pStatusCode,pStatusReason,pStatusComment);
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.SetTaskStatus(const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string; const flWaitForObject: boolean);
var
  ObjectSending: TStatusToObjectSending;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser)) do
try
//. set status
if (NOT TaskIsConsultation())
 then begin
  ObjectSending:=TStatusToObjectSending.Create(Self,pStatusCode,pStatusReason,pStatusComment); //. sending status to object
  if (flWaitForObject)
   then if (NOT ObjectSending.WaitForFinish(ObjectWaitingTime)) then Raise Exception.Create('server response timeout'); //. =>
  end;
//.
Tasks_Item_SetStatus1(Task.id, pStatusCode,pStatusReason,pStatusComment);
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.SetTaskResult(const pResultCode: integer; const pResultComment: string);
var
  ObjectSending: TResultToObjectSending;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser)) do
try
//. set result (status to completed)
if (NOT TaskIsConsultation())
 then begin
  ObjectSending:=TResultToObjectSending.Create(Self,pResultCode,pResultComment); //. sending result to object
  if (NOT ObjectSending.WaitForFinish(ObjectWaitingTime)) then Raise Exception.Create('server response timeout'); //. =>
  end;
//.
Tasks_Item_SetResult(Task.id, pResultCode,pResultComment);
finally
Release();
end;
end;

class procedure TfmGMMDCardioExpertTask.DoOnTaskReceivedByExpert(const idUser: integer; const idTask: integer);
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
SetTaskStatus(idUser,idTask,MODELUSER_TASK_STATUS_ReceivedByExpert,0,FullName);
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.CloseConsultation();
begin
SetTaskStatus(MODELUSER_TASK_STATUS_NotNeeded,0,'Consultation is closed');
end;

procedure TfmGMMDCardioExpertTask.RequestConsultacyTask(const RecipientUserID: integer);
var
  SUF: TMODELUserFunctionality;
  ConsultancyTaskService: integer;
begin
case (Task.Service) of
MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGAnalysis:               ConsultancyTaskService:=MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation;
MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterAnalysis:            ConsultancyTaskService:=MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation;
MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation:           ConsultancyTaskService:=MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation;
MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation:        ConsultancyTaskService:=MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation;
else
  Raise Exception.Create('unknown service'); //. =>
end;
//.
SUF:=TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser));
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,RecipientUserID)) do
try
Tasks_AddNew(Task.Priority,Task.TType,ConsultancyTaskService,TaskData,'consultation from: '+SUF.FullName);
//. set status to consultating
SetTaskStatus(MODELUSER_TASK_STATUS_Consulting,0,FullName);
finally
Release();
end;
finally
SUF.Release();
end;
end;

procedure TfmGMMDCardioExpertTask.RedirectTask(const RecipientUserID: integer);
var
  SUF: TMODELUserFunctionality;
begin
SUF:=TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser));
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,RecipientUserID)) do
try
Tasks_AddNew(Task.Priority,Task.TType,Task.Service,TaskData,'redirected from: '+SUF.FullName);
//. set status to redirected
SetTaskStatus(MODELUSER_TASK_STATUS_Redirected,0,FullName);
finally
Release();
end;
finally
SUF.Release();
end;
end;

procedure TfmGMMDCardioExpertTask.gbStatus_Update(const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
var
  I: integer;
begin
cbTaskStatus.Items.BeginUpdate();
try
cbTaskStatus.Items.Clear();
cbTaskStatus.Items.AddObject('Open',TObject(MODELUSER_TASK_STATUS_Open));
cbTaskStatus.Items.AddObject('Accepted',TObject(MODELUSER_TASK_STATUS_Accepted));
cbTaskStatus.Items.AddObject('Rejected',TObject(MODELUSER_TASK_STATUS_Rejected));
cbTaskStatus.Items.AddObject('Processing',TObject(MODELUSER_TASK_STATUS_Processing));
//. cbTaskStatus.Items.AddObject('Completed',TObject(MODELUSER_TASK_STATUS_Completed));
cbTaskStatus.Items.AddObject('Cancelled',TObject(MODELUSER_TASK_STATUS_Cancelled));
cbTaskStatus.Items.AddObject('Errored',TObject(MODELUSER_TASK_STATUS_Errored));
cbTaskStatus.Items.AddObject('Out of experience',TObject(MODELUSER_TASK_STATUS_OutOfExperience));
cbTaskStatus.Items.AddObject('Not needed',TObject(MODELUSER_TASK_STATUS_NotNeeded));
cbTaskStatus.Items.AddObject('Deferred',TObject(MODELUSER_TASK_STATUS_Deferred));
//. cbTaskStatus.Items.AddObject('Redirected',TObject(MODELUSER_TASK_STATUS_Redirected));
cbTaskStatus.Items.AddObject('Need info',TObject(MODELUSER_TASK_STATUS_NeedInfo));
//. cbTaskStatus.Items.AddObject('Consulting',TObject(MODELUSER_TASK_STATUS_Consulting));
//.
for I:=0 to cbTaskStatus.Items.Count-1 do
  if (Integer(cbTaskStatus.Items.Objects[I]) = pStatusCode)
   then begin
    cbTaskStatus.ItemIndex:=I;
    Break; //. >
    end;
edStatusComment.Text:=pStatusComment;
finally
cbTaskStatus.Items.EndUpdate();
end;
end;

procedure TfmGMMDCardioExpertTask.LocateTaskDevice();
var
  SC: TCursor;
  idTOwner,idOwner: integer;
  CL: TComponentsList;
  VisualizationType,VisualizationID: integer;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
with TComponentFunctionality_Create(idTGeoGraphServerObject,TaskParams.GeographServerObjectID) do
try
if (GetOwner({out} idTOwner,idOwner))
 then begin
  with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  if (QueryComponents(TBase2DVisualizationFunctionality,CL))
   then
    try
    VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
    VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
    //.
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
    try
    ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(Ptr);
    finally
    Release;
    end;
    finally
    CL.Destroy;
    end
   else Raise Exception.Create('visualization-component is not found'); //. =>
  finally
  Release();
  end;
  end
 else Raise Exception.Create('no owner found'); //. =>
finally
Release();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGMMDCardioExpertTask.ShowTaskDevicePanel();
var
  SC: TCursor;
  idTOwner,idOwner: integer;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
with TComponentFunctionality_Create(idTGeoGraphServerObject,TaskParams.GeographServerObjectID) do
try
if (GetOwner({out} idTOwner,idOwner))
 then begin
  if (idTOwner = idTCoComponent)
   then with TCoGeoMonitorObjectPanelProps.Create(idOwner) do begin
    Position:=poScreenCenter;
    Show();
    end
   else with TComponentFunctionality_Create(idTOwner,idOwner) do
    try
    TPanelProps_Create(false,0,nil,nilObject).Show();
    finally
    Release();
    end;
  end
 else Raise Exception.Create('no owner found'); //. =>
finally
Release();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGMMDCardioExpertTask.btnLocateDeviceClick(Sender: TObject);
begin
LocateTaskDevice();
//.
Close();
end;

procedure TfmGMMDCardioExpertTask.btnShowObjectPanelClick(Sender: TObject);

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    StartIndex: integer;
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  StartIndex:=1;
  SS:='';
  for I:=StartIndex to Length(S) do
    if (S[I] in ['/'])
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

var
  SL: TStringList;
  OID: integer;
begin
if (NOT SplitStrings(TaskParams.ObjectMeasurementID,{out} SL)) then Exit; //. ->
try
OID:=StrToInt(SL[0]);
finally
SL.Destroy();
end;
if (OID = 0) then Raise Exception.Create('measurement object is unknown'); //. =>
//.
with TMeasurementObjectFunctionality(TComponentFunctionality_Create(idTMeasurementObject,OID)) do
try
TPanelProps_Create(false,0,nil,nilObject).Show();
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.btnShowDevicePanelClick(Sender: TObject);
begin
ShowTaskDevicePanel();
end;

procedure TfmGMMDCardioExpertTask.cbTaskStatusChange(Sender: TObject);
begin
edStatusComment.Text:=cbTaskStatus.Items[cbTaskStatus.ItemIndex];
end;

procedure TfmGMMDCardioExpertTask.btnSetTaskStatusClick(Sender: TObject);
var
  StatusCode: integer;
  StatusReason: integer;
  StatusComment: string;
begin
if (cbTaskStatus.ItemIndex = -1) then Raise Exception.Create('no status code selected'); //. =>
StatusCode:=Integer(cbTaskStatus.Items.Objects[cbTaskStatus.ItemIndex]);
StatusReason:=0;
StatusComment:=edStatusComment.Text;
//.
SetTaskStatus(StatusCode,StatusReason,StatusComment);
//.
if (StatusCode IN [MODELUSER_TASK_STATUS_Open,MODELUSER_TASK_STATUS_Accepted,MODELUSER_TASK_STATUS_Processing,MODELUSER_TASK_STATUS_Deferred,MODELUSER_TASK_STATUS_Consulting])
 then ShowMessage('Status has been set')
 else Close();
end;

procedure TfmGMMDCardioExpertTask.btnConsultacyClick(Sender: TObject);
var
  SC: TCursor;
  idRedirectUser: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser)) do
try
with TfmTMODELUserInstanceSelector.Create() do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
edDomains.Text:=Domains;
SearchByDomains(edDomains.Text);
btnOK.Caption:='Consultation';
finally
Screen.Cursor:=SC;
end;
//.
if (Select({out} idRedirectUser))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  RequestConsultacyTask(idRedirectUser);
  finally
  Screen.Cursor:=SC;
  end;
  //.
  ShowMessage('Consultation has been requested.');
  end;
finally
Destroy();
end;
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.btnRedirectClick(Sender: TObject);
var
  SC: TCursor;
  idRedirectUser: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,fmUserTaskManager.idUser)) do
try
with TfmTMODELUserInstanceSelector.Create() do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
edDomains.Text:=Domains;
SearchByDomains(edDomains.Text);
btnOK.Caption:='Redirect';
finally
Screen.Cursor:=SC;
end;
//.
if (Select({out} idRedirectUser))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  RedirectTask(idRedirectUser);
  finally
  Screen.Cursor:=SC;
  end;
  //.
  Self.Close();
  end;
finally
Destroy();
end;
finally
Release();
end;
end;

procedure TfmGMMDCardioExpertTask.btnSetResultClick(Sender: TObject);
var
  Result: string;
begin
if (ECGProcessorIndex <> 0)
 then begin
  ///////Result:=String(unitECGProcDll.Close(ECGProcessorIndex));
  ECGProcessorIndex:=0;
  end;
SetTaskResult(0,Result);
//.
Close();
end;

procedure TfmGMMDCardioExpertTask.btnCloseConsultationClick(Sender: TObject);
begin
CloseConsultation();
//.
Close();
end;

procedure TfmGMMDCardioExpertTask.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


{TMeasurementDataLoading}
Constructor TMeasurementDataLoading.Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask);
begin
fmGMMDCardioExpertTask:=pfmGMMDCardioExpertTask;
//.
GeographServerID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerID;
GeographServerObjectID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerObjectID;
ObjectID:=pfmGMMDCardioExpertTask.TaskParams.ObjectID;
ObjectType:=pfmGMMDCardioExpertTask.TaskParams.ObjectType;
BusinessModel:=pfmGMMDCardioExpertTask.TaskParams.BusinessModel;
ObjectMeasurementID:=pfmGMMDCardioExpertTask.TaskParams.ObjectMeasurementID;
//.
MeasurementBaseFolder:=pfmGMMDCardioExpertTask.MeasurementBaseFolder;
//.
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TMeasurementDataLoading.Destroy();
begin
Cancel();
Inherited;
end;

procedure TMeasurementDataLoading.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TMeasurementDataLoading.Execute();
var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  OMIDBA: TByteArray;
  MS: TMemoryStream;
  I: integer;
  FN: string;
  FA: Integer;
begin
try
if (Terminated) then Exit; //. ->
//.
Synchronize(DoOnStart);
//.
ServerObjectController:=TGEOGraphServerObjectController.Create(GeographServerObjectID,ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
if (Terminated) then Exit; //. ->
//.
SetLength(OMIDBA,Length(ObjectMeasurementID));
Move(Pointer(@ObjectMeasurementID[1])^,Pointer(@OMIDBA[0])^,Length(OMIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataProperty.ReadByAddressDataCUAC(OMIDBA);
//.
if (Terminated) then Exit; //. ->
//.
if (Length(DeviceRootComponent.MedDeviceModule.Data.Value) > 0)
 then begin
  MS:=TMemoryStream.Create();
  with MS do
  try
  Write(Pointer(@DeviceRootComponent.MedDeviceModule.Data.Value[0])^,Length(DeviceRootComponent.MedDeviceModule.Data.Value));
  //.
  if (Terminated) then Exit; //. ->
  //. unpacking to measurement folder
  MS.Position:=0;
  with TZipArchive.CreateFromStream(MS,'') do
  try
  ExtractOptions:=ExtractOptions+[eoRestorePath];
  BaseDirectory:=MeasurementBaseFolder;
  Load();
  for I:=0 to ItemList.Count-1 do begin
    FN:=AnsiReplaceStr(ItemList[I].FileName,'/','\');      
    ForceDirectories(BaseDirectory+'\'+ExtractFilePath(FN));
    if ((ItemList[I].ExternalFileAttributes AND faDirectory) <> faDirectory)
     then begin
      FN:=BaseDirectory+'\'+ItemList[I].FileName;
      if (FileExists(FN))
       then begin
        if (NOT DeleteFile(FN))
         then begin
          FA:=FileGetAttr(FN);
          FA:=(FA AND (NOT faReadOnly));
          FileSetAttr(FN,FA);
          if (NOT DeleteFile(FN)) then Raise Exception.Create('could not delete old file: '+FN); //. =>
          end;
        end;
      Extract(ItemList[I],ItemList[I].FileName);
      end;
    end;
  finally
  Destroy();
  end;
  finally
  Destroy();
  end;
  end;
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
//.
if (Terminated) then Exit; //. ->
//.
Synchronize(DoOnLoading);
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TMeasurementDataLoading.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TMeasurementDataLoading.DoOnStart();
begin
if (Terminated) then Exit; //. ->
//.
fmGMMDCardioExpertTask.pnlMeasurement.Caption:='measurement is loading';
end;

procedure TMeasurementDataLoading.DoOnLoading();
begin
if (Terminated) then Exit; //. ->
//.
fmGMMDCardioExpertTask.DoOnMeasurementLoaded();
end;

procedure TMeasurementDataLoading.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('error while loading measurement, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TMeasurementDataLoading.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TMeasurementDataLoading.Finalize();
begin
if (fmGMMDCardioExpertTask = nil) then Exit; //. ->
//.
if (fmGMMDCardioExpertTask.MeasurementDataLoading = Self) then fmGMMDCardioExpertTask.MeasurementDataLoading:=nil;
end;

procedure TMeasurementDataLoading.Cancel();
begin
Terminate;
end;


{TStatusToObjectSending}
Constructor TStatusToObjectSending.Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
begin
GeographServerID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerID;
GeographServerObjectID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerObjectID;
ObjectID:=pfmGMMDCardioExpertTask.TaskParams.ObjectID;
ObjectType:=pfmGMMDCardioExpertTask.TaskParams.ObjectType;
BusinessModel:=pfmGMMDCardioExpertTask.TaskParams.BusinessModel;
ObjectMeasurementID:=pfmGMMDCardioExpertTask.TaskParams.ObjectMeasurementID;
//.
StatusCode:=pStatusCode;
StatusReason:=pStatusReason;
StatusComment:=pStatusComment;
//.
FreeOnTerminate:=false;
Inherited Create(false);
end;

procedure TStatusToObjectSending.Execute;
var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  OMIDBA: TByteArray;
begin
ServerObjectController:=TGEOGraphServerObjectController.Create(GeographServerObjectID,ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
SetLength(OMIDBA,Length(ObjectMeasurementID));
Move(Pointer(@ObjectMeasurementID[1])^,Pointer(@OMIDBA[0])^,Length(OMIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value:=StatusCode;
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value1:=StatusReason;
DeviceRootComponent.MedDeviceModule.DataStatus.StringValue:=StatusComment;
DeviceRootComponent.MedDeviceModule.DataStatusProperty.WriteByAddressDataCUAC(OMIDBA);
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
end;

function TStatusToObjectSending.WaitForFinish(const WaitingTime: integer): boolean;
begin
Result:=(WaitForSingleObject(Handle, WaitingTime*1000) = WAIT_OBJECT_0);
if (Result)
 then
  try
  if (FatalException <> nil) then Raise Exception.Create(Exception(FatalException).Message); //. =>
  finally
  Destroy();
  end
 else FreeOnTerminate:=true; //. release thread for free
end;


{TStatusToDeviceSending}
Constructor TStatusToDeviceSending.Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pStatusCode: integer; const pStatusReason: integer; const pStatusComment: string);
begin
GeographServerID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerID;
GeographServerObjectID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerObjectID;
ObjectID:=pfmGMMDCardioExpertTask.TaskParams.ObjectID;
ObjectType:=pfmGMMDCardioExpertTask.TaskParams.ObjectType;
BusinessModel:=pfmGMMDCardioExpertTask.TaskParams.BusinessModel;
ObjectMeasurementID:=pfmGMMDCardioExpertTask.TaskParams.ObjectMeasurementID;
//.
StatusCode:=pStatusCode;
StatusReason:=pStatusReason;
StatusComment:=pStatusComment;
//.
FreeOnTerminate:=false;
Inherited Create(false);
end;

procedure TStatusToDeviceSending.Execute;
var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  OMIDBA: TByteArray;
begin
ServerObjectController:=TGEOGraphServerObjectController.Create(GeographServerObjectID,ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
SetLength(OMIDBA,Length(ObjectMeasurementID));
Move(Pointer(@ObjectMeasurementID[1])^,Pointer(@OMIDBA[0])^,Length(OMIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value:=StatusCode;
DeviceRootComponent.MedDeviceModule.DataStatus.Int32Value1:=StatusReason;
DeviceRootComponent.MedDeviceModule.DataStatus.StringValue:=StatusComment;
DeviceRootComponent.MedDeviceModule.DataStatusProperty.WriteDeviceByAddressDataCUAC(OMIDBA);
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
end;

function TStatusToDeviceSending.WaitForFinish(const WaitingTime: integer): boolean;
begin
Result:=(WaitForSingleObject(Handle, WaitingTime*1000) = WAIT_OBJECT_0);
if (Result)
 then
  try
  if (FatalException <> nil) then Raise Exception.Create(Exception(FatalException).Message); //. =>
  finally
  Destroy();
  end
 else FreeOnTerminate:=true; //. release thread for free
end;


{TResultToObjectSending}
Constructor TResultToObjectSending.Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pResultCode: integer; const pResultComment: string);
begin
GeographServerID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerID;
GeographServerObjectID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerObjectID;
ObjectID:=pfmGMMDCardioExpertTask.TaskParams.ObjectID;
ObjectType:=pfmGMMDCardioExpertTask.TaskParams.ObjectType;
BusinessModel:=pfmGMMDCardioExpertTask.TaskParams.BusinessModel;
ObjectMeasurementID:=pfmGMMDCardioExpertTask.TaskParams.ObjectMeasurementID;
//.
ResultCode:=pResultCode;
ResultComment:=pResultComment;
//.
FreeOnTerminate:=false;
Inherited Create(false);
end;

procedure TResultToObjectSending.Execute;
var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  OMIDBA: TByteArray;
begin
ServerObjectController:=TGEOGraphServerObjectController.Create(GeographServerObjectID,ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
SetLength(OMIDBA,Length(ObjectMeasurementID));
Move(Pointer(@ObjectMeasurementID[1])^,Pointer(@OMIDBA[0])^,Length(OMIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataAnalysis.Int32Value:=ResultCode;
DeviceRootComponent.MedDeviceModule.DataAnalysis.StringValue:=ResultComment;
DeviceRootComponent.MedDeviceModule.DataAnalysisProperty.WriteByAddressDataCUAC(OMIDBA);
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
end;

function TResultToObjectSending.WaitForFinish(const WaitingTime: integer): boolean;
begin
Result:=(WaitForSingleObject(Handle, WaitingTime*1000) = WAIT_OBJECT_0);
if (Result)
 then
  try
  if (FatalException <> nil) then Raise Exception.Create(Exception(FatalException).Message); //. =>
  finally
  Destroy();
  end
 else FreeOnTerminate:=true; //. release thread for free
end;

{TResultToDeviceSending}
Constructor TResultToDeviceSending.Create(const pfmGMMDCardioExpertTask: TfmGMMDCardioExpertTask; const pResultCode: integer; const pResultComment: string);
begin
GeographServerID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerID;
GeographServerObjectID:=pfmGMMDCardioExpertTask.TaskParams.GeographServerObjectID;
ObjectID:=pfmGMMDCardioExpertTask.TaskParams.ObjectID;
ObjectType:=pfmGMMDCardioExpertTask.TaskParams.ObjectType;
BusinessModel:=pfmGMMDCardioExpertTask.TaskParams.BusinessModel;
ObjectMeasurementID:=pfmGMMDCardioExpertTask.TaskParams.ObjectMeasurementID;
//.
ResultCode:=pResultCode;
ResultComment:=pResultComment;
//.
FreeOnTerminate:=false;
Inherited Create(false);
end;

procedure TResultToDeviceSending.Execute;
var
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TGeoMonitoredMedDeviceModel;
  DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;
  OMIDBA: TByteArray;
begin
ServerObjectController:=TGEOGraphServerObjectController.Create(GeographServerObjectID,ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=(TObjectModel.GetModel(ObjectType,ServerObjectController,true) as TGeoMonitoredMedDeviceModel);
try
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
SetLength(OMIDBA,Length(ObjectMeasurementID));
Move(Pointer(@ObjectMeasurementID[1])^,Pointer(@OMIDBA[0])^,Length(OMIDBA));
ObjectModel.Lock.Enter();
try
DeviceRootComponent.MedDeviceModule.DataAnalysis.Int32Value:=ResultCode;
DeviceRootComponent.MedDeviceModule.DataAnalysis.StringValue:=ResultComment;
DeviceRootComponent.MedDeviceModule.DataAnalysisProperty.WriteDeviceByAddressDataCUAC(OMIDBA);
finally
ObjectModel.Lock.Leave();
end;
finally
ObjectModel.Destroy();
end;
end;

function TResultToDeviceSending.WaitForFinish(const WaitingTime: integer): boolean;
begin
Result:=(WaitForSingleObject(Handle, WaitingTime*1000) = WAIT_OBJECT_0);
if (Result)
 then
  try
  if (FatalException <> nil) then Raise Exception.Create(Exception(FatalException).Message); //. =>
  finally
  Destroy();
  end
 else FreeOnTerminate:=true; //. release thread for free
end;


end.

