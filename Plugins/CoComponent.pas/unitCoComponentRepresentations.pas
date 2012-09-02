unit unitCoComponentRepresentations;
Interface
Uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  SyncObjs,
  Graphics,
  Controls,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality;


Const
  WM_UPDATEPANEL = WM_USER+1;
  WM_HIDEPANEL = WM_USER+2;
  ID_SHOWCOMPONENTPANEL = WM_USER+3;
  ID_DESTROYCOMPONENT = WM_USER+4;
  ID_COPYTOCLIPBOARD = WM_USER+5;

Type
  TCoComponentPanelProps = class;

  TCoComponentSchema = class(TList)
  private
    PropsPanel: TCoComponentPanelProps;
  public
    idTObj: integer;
    idObj: integer;
    Updater: TComponentPresentUpdater;
    Details: TList;

    Constructor Create(const pPropsPanel: TCoComponentPanelProps; const pidTObj,pidObj: integer); virtual;
    Destructor Destroy; override;
    procedure UpdateComponents;
    procedure ClearComponents;
    function IsComponentInside(const idTComponent,idComponent: integer): boolean;
  end;

  TCoComponentPanelProps = class(TForm)
  private
    procedure DoOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DoOnDblClick(Sender: TObject);
    procedure DoOnClose(Sender: TObject; var Action: TCloseAction);
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure wmUPDATE(var Message: TMessage); message WM_UPDATEPANEL;
    procedure wmHIDE(var Message: TMessage); message WM_HIDEPANEL;
    procedure PostHideMessage;
  public
    Lock: TCriticalSection;
    ///- Updater: TComponentPresentUpdater;
    Schema: TCoComponentSchema;
    idCoComponent: integer;
    flFreeOnClose: boolean;

    Constructor Create(const pidCoComponent: integer); virtual;
    Destructor Destroy; override;
    procedure Update;
    procedure _Update; virtual; abstract;
    procedure DestroyComponent(); virtual;
  end;

  TCoComponentReflect = class(TCoComponentSchema)
  private
    CoComponentFunctionalityClass: TClass;
    CoComponentFunctionality: TCoComponentFunctionality;

    Constructor Create(pCoComponentFunctionalityClass: TClass; const pidObj: integer);
    Destructor Destroy; override;
    procedure UpdateCoComponentFunctionality;
  end;


  procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
  function CoComponentReflectList_ReflectV0(CoComponentFunctionalityClass: TClass; const pidObj: integer;  pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean;

  procedure Finalize();

  
var
  CoComponentPanelPropsList: TThreadList = nil;
  CoComponentReflectList: TThreadList = nil;
  flFinalizing: boolean = false;

Implementation
Uses
  Dialogs;


{TCoComponentSchema}
Constructor TCoComponentSchema.Create(const pPropsPanel: TCoComponentPanelProps; const pidTObj,pidObj: integer);
begin
Inherited Create;
PropsPanel:=pPropsPanel;
idTObj:=pidTObj;
idObj:=pidObj;
Details:=nil;
//. UpdateComponents;
if (PropsPanel <> nil)
 then
  if ((idTObj = idTCoComponent) AND (idObj = PropsPanel.idCoComponent))
   then Updater:=TComponentPresentUpdater_Create(idTObj,idObj, PropsPanel.Update,PropsPanel.PostHideMessage) //. for root component
   else Updater:=TComponentPresentUpdater_Create(idTObj,idObj, PropsPanel.Update,nil)
 else Updater:=TComponentPresentUpdater_Create(idTObj,idObj, nil,nil);
end;

Destructor TCoComponentSchema.Destroy;
begin
Updater.Free;
ClearComponents;
Inherited;
end;

procedure TCoComponentSchema.UpdateComponents;
var
  CF: TComponentFunctionality;
  ComponentsList: TComponentsList;
  I: integer;
  NewCoComponentSchema: TCoComponentSchema;
  DetailsList: TComponentsList;
begin
ClearComponents;
//.
CF:=TComponentFunctionality_Create(idTObj,idObj);
with CF do
try
GetComponentsList(ComponentsList);
try
for I:=0 to ComponentsList.Count-1 do with TItemComponentsList(ComponentsList[I]^) do begin
  NewCoComponentSchema:=TCoComponentSchema.Create(PropsPanel, idTComponent,idComponent);
  Self.Add(NewCoComponentSchema);
  end;
//. get details
{//. commented due to the speed penalties if ObjectIsInheritedFrom(CF,TBase2DVisualizationFunctionality)
 then with TBase2DVisualizationFunctionality(CF) do
  if GetDetailsList(DetailsList)
   then
    try
    Details:=TList.Create;
    try
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do begin
      NewCoComponentSchema:=TCoComponentSchema.Create(PropsPanel, idTComponent,idComponent);
      Details.Add(NewCoComponentSchema);
      end;
    except
      Details.Destroy;
      Details:=nil;
      Raise; //. =>
      end;
    finally
    DetailsList.Destroy;
    end;}
finally
ComponentsList.Destroy;
end;
finally
Release;
end;
end;

procedure TCoComponentSchema.ClearComponents;
var
  I: Integer;
begin
if Details <> nil
 then with Details do begin
  for I:=0 to Count-1 do TObject(List[I]).Destroy;
  Details:=nil;
  end;
for I:=0 to Count-1 do TObject(List[I]).Destroy;
Clear;
end;

function TCoComponentSchema.IsComponentInside(const idTComponent,idComponent: integer): boolean;
var
  I: Integer;
begin
Result:=false;
for I:=0 to Count-1 do with TCoComponentSchema(List[I]) do begin
  Result:=((idTObj = idTComponent) AND (idObj = idComponent));
  if Result then Exit; //. ->
  Result:=IsComponentInside(idTComponent,idComponent);
  if Result then Exit; //. ->
  end;
if Details <> nil
 then
  for I:=0 to Details.Count-1 do with TCoComponentSchema(Details[I]) do begin
    Result:=((idTObj = idTComponent) AND (idObj = idComponent));
    if Result then Exit; //. ->
    end;
end;


{TCoComponentPanelProps}
Constructor TCoComponentPanelProps.Create(const pidCoComponent: integer);
var
  SysMenu: THandle;
begin
Inherited Create(nil);
Lock:=TCriticalSection.Create;
idCoComponent:=pidCoComponent;
flFreeOnClose:=true;
OnClose:=DoOnClose;
OnMouseDown:=DoOnMouseDown;
OnDblClick:=DoOnDblClick;
SysMenu:=GetSystemMenu(Handle,False);
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_DESTROYCOMPONENT, 'Destroy object');
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_COPYTOCLIPBOARD, 'Copy to clipboard');
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_SHOWCOMPONENTPANEL, 'Show Component Panel');
//.
CoComponentPanelPropsList.Add(Self);
Schema:=TCoComponentSchema.Create(Self, idTCoComponent,idCoComponent);
end;

Destructor TCoComponentPanelProps.Destroy;
begin
Schema.Free;
CoComponentPanelPropsList.Remove(Self);
Lock.Free;
Inherited;
end;

procedure TCoComponentPanelProps.Update;
var
  SC: TCursor;
begin
Lock.Enter;
try
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
if GetCurrentThreadID <> MainThreadID
 then  PostMessage(Handle, WM_UPDATEPANEL,0,0)
 else _Update;
finally
Screen.Cursor:=SC;
end;
finally
Lock.Leave;
end;
end;

procedure TCoComponentPanelProps.wmSysCommand(var Message: TMessage);
begin
case Message.wParam of
ID_SHOWCOMPONENTPANEL: DoOnDblClick(nil);
ID_DESTROYCOMPONENT: begin
  if (MessageDlg('Do you want to destroy this object ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
   then DestroyComponent();
  end;
ID_COPYTOCLIPBOARD: begin
  ProxySpace__TypesSystem_SetClipboardComponent(idTCoComponent,idCoComponent);
  end;
end;
inherited;
end;

procedure TCoComponentPanelProps.wmUPDATE(var Message: TMessage);
begin
_Update;
end;

procedure TCoComponentPanelProps.wmHIDE(var Message: TMessage);
begin
Free;
end;

procedure TCoComponentPanelProps.PostHideMessage;
begin
PostMessage(Handle, WM_HIDEPANEL,0,0)
end;

procedure TCoComponentPanelProps.DoOnClose(Sender: TObject; var Action: TCloseAction);
begin
if flFreeOnClose then Action:=caFree;
end;

procedure TCoComponentPanelProps.DoOnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
case Button of
mbRight: DoOnDblClick(nil);
end;
end;

procedure TCoComponentPanelProps.DoOnDblClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTCoComponent,idCoComponent) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TCoComponentPanelProps.DestroyComponent();
begin
with TTypeFunctionality_Create(idTCoComponent) do
try
DestroyInstance(idCoComponent);
finally
Release;
end;
end;


{TCoComponentReflect}
Constructor TCoComponentReflect.Create(pCoComponentFunctionalityClass: TClass; const pidObj: integer);
begin
Inherited Create(nil, idTCoComponent,pidObj);
CoComponentFunctionalityClass:=pCoComponentFunctionalityClass;
CoComponentFunctionality:=nil;
UpdateCoComponentFunctionality;
end;

Destructor TCoComponentReflect.Destroy;
begin
if CoComponentFunctionality <> nil then CoComponentFunctionality.Release;
Inherited;
end;

procedure TCoComponentReflect.UpdateCoComponentFunctionality;
begin
if CoComponentFunctionality <> nil then CoComponentFunctionality.Release;
CoComponentFunctionality:=TCoComponentFunctionality(CoComponentFunctionalityClass.NewInstance);
CoComponentFunctionality.Create(idObj);
end;




procedure CoComponentPanelPropsList_DoOnComponentOperation(const pidTObj,pidObj: integer; const Operation: TComponentOperation);

  procedure DoOnUpdate;
  var
    I: integer;
  begin
  with CoComponentPanelPropsList.LockList do
  try
  for I:=0 to Count-1 do with TCoComponentPanelProps(List[I]) do
    if Schema.IsComponentInside(pidTObj,pidObj) then Update;
  finally
  CoComponentPanelPropsList.UnlockList;
  end;
  end;

  procedure DoOnDestroy;
  var
    I: integer;
  begin
  if pidTObj <> idTCoComponent then Exit; //. ->
  with CoComponentPanelPropsList.LockList do
  try
  for I:=0 to Count-1 do with TCoComponentPanelProps(List[I]) do
    if idCoComponent = pidObj then Close;
  finally
  CoComponentPanelPropsList.UnlockList;
  end;
  end;

begin
case Operation of
opCreate: ;
opUpdate: DoOnUpdate;
opDestroy: DoOnDestroy;
end;
end;

procedure CoComponentPanelPropsList_Free();
begin
if (CoComponentPanelPropsList <> nil)
 then begin
  with CoComponentPanelPropsList.LockList() do
  try
  while Count > 0 do TObject(List[0]).Destroy();
  finally
  CoComponentPanelPropsList.UnlockList();
  end;
  FreeAndNil(CoComponentPanelPropsList);
  end;
end;

procedure CoComponentReflectList_DoOnComponentOperation(const pidTObj,pidObj: integer; const Operation: TComponentOperation);

  procedure DoOnUpdate;
  var
    I: integer;
  begin
  with CoComponentReflectList.LockList do
  try
  for I:=0 to Count-1 do with TCoComponentReflect(List[I]) do begin
    if IsComponentInside(pidTObj,pidObj) then UpdateCoComponentFunctionality;
    end;
  finally
  CoComponentReflectList.UnlockList;
  end;
  end;

begin
case Operation of
opCreate: ;
opUpdate: DoOnUpdate;
opDestroy: ;
end;
end;

function CoComponentReflectList_ReflectV0(CoComponentFunctionalityClass: TClass; const pidObj: integer;  pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean;
var
  I: integer;
  NewCoComponentReflect: TCoComponentReflect;
begin
Result:=false;
with CoComponentReflectList.LockList do
try
for I:=0 to Count-1 do with TCoComponentReflect(List[I]) do begin
  if idObj = pidObj
   then begin
    Result:=CoComponentFunctionality.Visualization_ReflectV0(pFigure,pAdditionalFigure, pReflectionWindow, pAttractionWindow, pCanvas);
    Exit; //. ->
    end
  end;
//. create new item
NewCoComponentReflect:=TCoComponentReflect.Create(CoComponentFunctionalityClass,pidObj);
Add(NewCoComponentReflect);
Result:=NewCoComponentReflect.CoComponentFunctionality.Visualization_ReflectV0(pFigure,pAdditionalFigure, pReflectionWindow, pAttractionWindow, pCanvas);
finally
CoComponentReflectList.UnlockList;
end;
end;

procedure CoComponentReflectList_Free();
begin
if (CoComponentReflectList <> nil)
 then begin
  with CoComponentReflectList.LockList() do
  try
  while Count > 0 do begin
    TObject(List[0]).Destroy();
    Delete(0);
    end;
  finally
  CoComponentReflectList.UnlockList();
  end;
  FreeAndNil(CoComponentReflectList);
  end;
end;


procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
CoComponentPanelPropsList_DoOnComponentOperation(idTObj,idObj, Operation);
CoComponentReflectList_DoOnComponentOperation(idTObj,idObj, Operation);
end;


procedure Finalize();
begin
CoComponentReflectList_Free();
CoComponentPanelPropsList_Free();
end;


Initialization
CoComponentPanelPropsList:=TThreadList.Create();
CoComponentReflectList:=TThreadList.Create();

Finalization
flFinalizing:=true;
Finalize();
end.
