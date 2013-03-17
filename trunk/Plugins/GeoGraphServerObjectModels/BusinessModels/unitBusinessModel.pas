unit unitBusinessModel;
interface
uses
  SysUtils,
  Classes,
  Windows,
  Messages,
  SyncObjs,
  Controls,
  Forms,
  Graphics,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitObjectModel;

Const
  WM_UPDATECONTROLPANEL = WM_USER+1;
  WM_CLOSECONTROLPANEL = WM_USER+2;

Type
  TBusinessModelConstructorPanel = class;
  TBusinessModelControlPanel = class;
  TBusinessModelCustomControlPanel = class(TForm);
  TBusinessModelDeviceInitializerPanel = class;

  TBusinessModelClass = class of TBusinessModel;

  TBusinessModel = class(TBaseBusinessModel)
  public
    ObjectModel: TObjectModel;
    ControlPanelLock: TCriticalSection;
    Updater: TComponentPresentUpdater;
    ControlPanel: TBusinessModelControlPanel;

    class function ID: integer; virtual; abstract;
    class function Name: string; virtual; abstract;
    class function ObjectTypeID: integer; virtual; abstract;
    class function ObjectTypeName: string; virtual; abstract;
    class function GetModelBaseClass(const pObjectModelID: integer): TBusinessModelClass;
    class function GetModelClass(const pObjectModelID: integer; const pModelID: integer): TBusinessModelClass; overload;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; overload; virtual; abstract;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; virtual;
    class procedure GetModels(out SL: TStringList); virtual; abstract;
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; virtual; abstract;
    class function CreateCustomControlPanel(const idCoComponent: integer): TBusinessModelCustomControlPanel; virtual;
    class procedure GetIconSet(const Version: integer; out Icon: TBitmap; out Icon_flFree: boolean); virtual;

    Constructor Create(const pObjectModel: TObjectModel);
    Destructor Destroy; override;
    procedure Update; virtual;
    procedure Close; virtual;
    function GetControlPanel: TBusinessModelControlPanel; virtual;
    function  Object_GetInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function  Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; virtual;
    function IsObjectOnline: boolean; virtual;
    function LoadTrack(const BeginDate,EndDate: TDateTime; const TrackPrefix: string; const TrackColor: TColor; const TrackCoComponentID: integer; const flAddObjectModelTrackEvents,flAddBusinessModelTrackEvents: boolean): pointer; virtual;
  end;

  TBusinessModelControlPanel = class(TForm)
  private
    procedure wmUPDATECONTROLPANEL(var Message: TMessage); message WM_UPDATECONTROLPANEL;
    procedure wmCLOSECONTROLPANEL(var Message: TMessage); message WM_CLOSECONTROLPANEL;
  public
    flUpdating: boolean;
    ObjectName: string;
    ObjectCoComponentID: integer;

    Constructor Create(const pModel: TBusinessModel);
    Destructor Destroy; override;
    procedure PostUpdate; virtual;
    procedure PostClose;
    procedure Update; reintroduce; virtual;
  end;

  TBusinessModelConstructorPanel = class(TForm)
  public
    BusinessModelClass: TBusinessModelClass;

    Constructor Create(const pBusinessModelClass: TBusinessModelClass); virtual;
    procedure Preset(const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer); virtual; abstract;
    procedure Preset1(const idGeoSpace: integer; const idTVisualization,idVisualization: integer; const idHint: integer; const idUserAlert: integer; const idOnlineFlag: integer; const idLocationIsAvailableFlag: integer); virtual; abstract;
    procedure ValidateValues(); virtual; abstract;
    function Construct(const pUserID: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServer: integer; const pidGeoGraphServerObject: integer): integer; overload; virtual; abstract;
    function Construct(const pidGeographServer: integer; const pidGeoGraphServerObject: integer): integer; overload;
  end;

  TBusinessModelDeviceInitializerPanel = class(TForm);


implementation
uses
  TypesDefines,
  //.
  unitGMOBusinessModel,
  unitGMO1BusinessModel,
  unitEnforaObjectBusinessModel,
  unitEnforaMT3000ObjectBusinessModel,
  unitEnforaMiniMTObjectBusinessModel,
  unitNavixyObjectBusinessModel,
  unitGMMDBusinessModel,
  unitGSTraqObjectBusinessModel;


{TBusinessModel}
class function TBusinessModel.GetModelBaseClass(const pObjectModelID: integer): TBusinessModelClass;
begin
if (pObjectModelID = TGMOBusinessModel.ObjectTypeID)
 then Result:=TGMOBusinessModel else
if (pObjectModelID = TGMO1BusinessModel.ObjectTypeID)
 then Result:=TGMO1BusinessModel else
if (pObjectModelID = TEnforaObjectBusinessModel.ObjectTypeID)
 then Result:=TEnforaObjectBusinessModel else
if (pObjectModelID = TEnforaMT3000ObjectBusinessModel.ObjectTypeID)
 then Result:=TEnforaMT3000ObjectBusinessModel else
if (pObjectModelID = TEnforaMiniMTObjectBusinessModel.ObjectTypeID)
 then Result:=TEnforaMiniMTObjectBusinessModel else
if (pObjectModelID = TNavixyObjectBusinessModel.ObjectTypeID)
 then Result:=TNavixyObjectBusinessModel else
if (pObjectModelID = TGMMDBusinessModel.ObjectTypeID)
 then Result:=TGMMDBusinessModel else
if (pObjectModelID = TGSTraqObjectBusinessModel.ObjectTypeID)
 then Result:=TGSTraqObjectBusinessModel
 else Result:=nil;
end;

class function TBusinessModel.GetModelClass(const pObjectModelID: integer; const pModelID: integer): TBusinessModelClass; 
var
  ModelBaseClass: TBusinessModelClass;
begin
ModelBaseClass:=GetModelBaseClass(pObjectModelID);
if (ModelBaseClass = nil)
 then Result:=nil
 else Result:=ModelBaseClass.GetModelClass(pModelID);
end;

class function TBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
var
  ModelBaseClass: TBusinessModelClass;
begin
ModelBaseClass:=GetModelBaseClass(pObjectModel.ID);
if (ModelBaseClass = nil)
 then Result:=nil
 else Result:=ModelBaseClass.GetModel(pObjectModel,pModelID);
end;

class function TBusinessModel.CreateCustomControlPanel(const idCoComponent: integer): TBusinessModelCustomControlPanel; 
begin
Result:=nil;
end;

class procedure TBusinessModel.GetIconSet(const Version: integer; out Icon: TBitmap; out Icon_flFree: boolean);
begin
Icon:=nil;
Icon_flFree:=false;
end;

Constructor TBusinessModel.Create(const pObjectModel: TObjectModel);
begin
Inherited Create();
ControlPanelLock:=TCriticalSection.Create;
ObjectModel:=pObjectModel;
ControlPanel:=nil;                           
Updater:=TComponentPresentUpdater_Create(idTGeoGraphServerObject,ObjectModel.ObjectController.idGeoGraphServerObject, Update,Close);
//.
Update();
end;

Destructor TBusinessModel.Destroy;
begin
Updater.Free;
ControlPanel.Free;
ControlPanelLock.Free;
Inherited;
end;

procedure TBusinessModel.Update;
begin
ControlPanelLock.Enter;
try
if (ControlPanel <> nil) then ControlPanel.PostUpdate();
finally
ControlPanelLock.Leave;
end;
end;

procedure TBusinessModel.Close;
begin
ControlPanelLock.Enter;
try
if (ControlPanel <> nil) then ControlPanel.PostClose();
finally
ControlPanelLock.Leave;
end;
end;

function TBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
Result:=nil;
end;

function TBusinessModel.Object_GetInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
begin
Info:=nil;
Result:=false;
end;

function TBusinessModel.Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; 
begin
Info:=nil;
Result:=false;
end;

function TBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=nil;
end;

function TBusinessModel.IsObjectOnline: boolean;
begin
Result:=false;
end;

function TBusinessModel.LoadTrack(const BeginDate,EndDate: TDateTime; const TrackPrefix: string; const TrackColor: TColor; const TrackCoComponentID: integer; const flAddObjectModelTrackEvents,flAddBusinessModelTrackEvents: boolean): pointer;
var
  DaysCount: integer;
  TrackName: string;
  CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc;
  CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc;
begin
DaysCount:=Trunc(EndDate)-Trunc(BeginDate)+1;
if (DaysCount < 1) then Raise Exception.Create('invalid date interval'); //. =>
//.
TrackName:=TrackPrefix+'('+FormatDateTime('DD.MM.YY',BeginDate)+'-'+FormatDateTime('DD.MM.YY',EndDate)+')';
if (flAddObjectModelTrackEvents) then CreateObjectModelTrackEventFunc:=ObjectModel.CreateTrackEvent else CreateObjectModelTrackEventFunc:=nil;
if (flAddBusinessModelTrackEvents) then CreateBusinessModelTrackEventFunc:=CreateTrackEvent else CreateBusinessModelTrackEventFunc:=nil;
Result:=ObjectModel.Log_CreateTrackByDays(BeginDate,DaysCount,TrackName,TrackColor,TrackCoComponentID,CreateObjectModelTrackEventFunc,CreateBusinessModelTrackEventFunc);
end;


{TBusinessModelControlPanel}
Constructor TBusinessModelControlPanel.Create(const pModel: TBusinessModel);
begin
Inherited Create(nil);
ObjectName:='';
ObjectCoComponentID:=0;
flUpdating:=false;
end;

Destructor TBusinessModelControlPanel.Destroy;
begin
Inherited;
end;

procedure TBusinessModelControlPanel.Update;
var
  flUpdatingOld: boolean;
begin
flUpdatingOld:=flUpdating;
try
flUpdating:=true;
Inherited Update();
finally
flUpdating:=flUpdatingOld;
end;
end;

procedure TBusinessModelControlPanel.PostUpdate;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmUPDATECONTROLPANEL(WM) else PostMessage(Handle, WM_UPDATECONTROLPANEL,0,0);
end;

procedure TBusinessModelControlPanel.PostClose;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmCLOSECONTROLPANEL(WM) else PostMessage(Handle, WM_CLOSECONTROLPANEL,0,0);
end;

procedure TBusinessModelControlPanel.wmUPDATECONTROLPANEL(var Message: TMessage);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
try
Update();
except
  On E: Exception do ProxySpace__EventLog_WriteMinorEvent('ObjectModelControlPanel','Unable to update a control panel.',E.Message);
  end;
//.
finally
Screen.Cursor:=SC;
end;
end;

procedure TBusinessModelControlPanel.wmCLOSECONTROLPANEL(var Message: TMessage);
begin
Close();
end;


{TBusinessModelConstructorPanel}
Constructor TBusinessModelConstructorPanel.Create(const pBusinessModelClass: TBusinessModelClass);
begin
Inherited Create(nil);
BusinessModelClass:=pBusinessModelClass;
end;

function TBusinessModelConstructorPanel.Construct(const pidGeographServer: integer; const pidGeoGraphServerObject: integer): integer;
begin
Result:=Construct(ProxySpace_UserID(),ProxySpace_UserName(),ProxySpace_UserPassword(), pidGeographServer,pidGeoGraphServerObject);
end;


end.
