unit unitSpaceUpdatesUserNotificator;

interface

uses
  Windows,
  Messages,
  SysUtils,
  SyncObjs,
  Variants,
  Classes,
  Sockets,
  IdException,
  IdSocks,
  IdStack,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  ComCtrls,
  ExtCtrls,
  Menus,
  StdCtrls,
  ImgList, Buttons;

const
  UpdatesUserNotificatorFileName = 'UpdatesUserNotificator.cfg';
  ComponentOperationsStrings: array[TComponentOperation] of string = ('Created','Destroyed','Updated','Inserted','Removed');
  RevisionActsStrings: array[TRevisionAct] of string = ('Inserted','Removed','Changed','Refreshed','Validated','InsertedWithDetailes','RemovedWithDetailes','ChangedWithDetailes','RefreshedWithDetails','ContentIsChanged','ContentIsChangedWithDetails');

//. -----------------------------------------------------------
type
  TUpdatesUserNotificatorComponent = packed record
    idTComponent: smallint;
    idComponent: Int64;
    Operation: SmallInt;
    //. visualization
    VisualizationPtr: TPtr;
    VisualizationAct: SmallInt;
  end;
//. -----------------------------------------------------------

  TNameOfComponentSavedItem = string[99];

  TNameOfReflectionSavedItem = string[99];

  TComponentSavedItem = packed record
    CID: TUpdatesUserNotificatorComponent;
    Name: TNameOfComponentSavedItem;
    TimeOut: TDateTime;
    Enabled: boolean;
    LastOperation: SmallInt;
    LastOperationTime: TDateTime;
  end;

  TUpdatesUserNotificatorWindowCoords = packed record
    X0: double;
    Y0: double;
    X1: double;
    Y1: double;
    X2: double;
    Y2: double;
    X3: double;
    Y3: double;
  end;

  TWindowSavedItem = packed record
    WND: TUpdatesUserNotificatorWindowCoords;
    Name: TNameOfReflectionSavedItem;
    Enabled: boolean;
  end;


Type
  TSpaceUpdatesUserNotificator = class
  private
    Space: TProxySpace;
    flInitialized: boolean;
    UpdatedComponentItemsCount: integer;

    function IsValid: boolean;
  public
    Lock: TCriticalSection;
    Components: pointer;
    ComponentsSize: integer;
    Windows: pointer;
    WindowsSize: integer;
    Windows_ComponentsList: TList;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    function IsComponentExist(const pidTComponent: integer; const pidComponent: integer; out ptrItem: pointer): boolean;
    function IsVisualizationExist(const pptrObj: TPtr; out ptrItem: pointer): boolean;
    function IsWindowExist(const pWindow: TUpdatesUserNotificatorWindowCoords): boolean;
    function WindowsContainers_ObjContainerCoordsIsNotOutside(const Obj_CC: TContainerCoord): boolean;
    procedure GetWindowsContainersCoords(out CCs: TContainerCoordArray);
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);
    procedure Load;
    procedure Save;
    //.
    procedure DoOnComponentOperation(const pidTObj,pidObj: integer; const Operation: TComponentOperation);
    procedure DoOnVisualizationOperation(const pptrObj: TPtr; const pAct: TRevisionAct);
  end;

  TfmSpaceUpdatesUserNotificator = class(TForm)
    lvCompoennts_Popup: TPopupMenu;
    Addcomponentfromclipboard1: TMenuItem;
    Removeselected1: TMenuItem;
    Clear1: TMenuItem;
    DisableAll1: TMenuItem;
    EnableAll1: TMenuItem;
    N1: TMenuItem;
    Validatechanges1: TMenuItem;
    lvWindows_Popup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    lvWindows_ImageList: TImageList;
    Checker: TTimer;
    Component1: TMenuItem;
    Visualization1: TMenuItem;
    foralloperation1: TMenuItem;
    forUpdateoperation1: TMenuItem;
    forDestroyoperation1: TMenuItem;
    foralloperation2: TMenuItem;
    forUpdateoperation2: TMenuItem;
    forDestroyoperation2: TMenuItem;
    Addallwindows1: TMenuItem;
    Addallcomponent1: TMenuItem;
    Foralloperations1: TMenuItem;
    PageControl: TPageControl;
    tsComponentNotifications: TTabSheet;
    tsTimeoutNotifications: TTabSheet;
    tsNotificationsObjects: TTabSheet;
    Panel2: TPanel;
    lvNotifications: TListView;
    Panel1: TPanel;
    lbNotificationExists: TLabel;
    imgNotificationExists: TImage;
    bbRemoveSelectedNotification: TBitBtn;
    bbRemoveAllNotifications: TBitBtn;
    pnlUserComponents: TPanel;
    Splitter1: TSplitter;
    lvComponents: TListView;
    lvWindows: TListView;
    cbComponentNotificationsDisable: TCheckBox;
    Panel3: TPanel;
    bbRemoveSelectedTimeoutNotification: TBitBtn;
    bbRemoveAllTimeoutNotifications: TBitBtn;
    cbTimeoutNotificationsDisable: TCheckBox;
    lvTimeoutNotifications: TListView;
    N2: TMenuItem;
    N3: TMenuItem;
    SetTimeOutonselected1: TMenuItem;
    procedure Removeselected1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure lvComponentsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DisableAll1Click(Sender: TObject);
    procedure EnableAll1Click(Sender: TObject);
    procedure Validatechanges1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure lvWindowsDblClick(Sender: TObject);
    procedure lvNotificationsDblClick(Sender: TObject);
    procedure CheckerTimer(Sender: TObject);
    procedure bbRemoveSelectedNotificationClick(Sender: TObject);
    procedure bbRemoveAllNotificationsClick(Sender: TObject);
    procedure foralloperation1Click(Sender: TObject);
    procedure forUpdateoperation1Click(Sender: TObject);
    procedure forDestroyoperation1Click(Sender: TObject);
    procedure foralloperation2Click(Sender: TObject);
    procedure forUpdateoperation2Click(Sender: TObject);
    procedure forDestroyoperation2Click(Sender: TObject);
    procedure Addallwindows1Click(Sender: TObject);
    procedure Foralloperations1Click(Sender: TObject);
    procedure SetTimeOutonselected1Click(Sender: TObject);
    procedure bbRemoveSelectedTimeoutNotificationClick(Sender: TObject);
    procedure bbRemoveAllTimeoutNotificationsClick(Sender: TObject);
    procedure lvTimeoutNotificationsDblClick(Sender: TObject);
  private
    { Private declarations }
    ImageList: TImageList;
    flChanged: boolean;

    procedure Clear;
    procedure CheckAndValidateChanges;
    procedure Save;
    procedure ClearComponents;
    procedure ClearWindows;
    procedure UpdateNotifications;
    procedure UpdateTimeoutNotifications;
  public
    UpdatesUserNotificator: TSpaceUpdatesUserNotificator;
    
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Update; reintroduce;
    procedure InsertNewComponent(const pidTComponent,pidComponent: integer; const Operation: SmallInt; const Act: SmallInt);
    procedure lvComponents_RemoveComponent(ComponentItem: TListItem);
    procedure lvComponents_SetTimeoutForComponent(ComponentItem: TListItem; const Timeout: TDateTime);
    procedure lvComponents_RemoveAll;
    procedure lvComponents_EnableAll;
    procedure lvComponents_DisableAll;
    procedure InsertNewWindow(const pWindow: TUpdatesUserNotificatorWindowCoords);
    procedure lvWindows_RemoveWindow(WindowItem: TListItem);
    procedure lvWindows_RemoveAll;
    procedure lvWindows_EnableAll;
    procedure lvWindows_DisableAll;
  end;

  function ConvertWindowCoordToContainerCoord(const pCoord: TUpdatesUserNotificatorWindowCoords): TContainerCoord;

  
implementation
Uses
  INIFiles,
  MMSystem,
  Functionality,
  TypesFunctionality,
  unitTimeDialog;

{$R *.dfm}

function ConvertWindowCoordToContainerCoord(const pCoord: TUpdatesUserNotificatorWindowCoords): TContainerCoord;
begin
with pCoord,Result do begin
Xmin:=X0;Ymin:=Y0;Xmax:=X0;Ymax:=Y0;
if X1 < Xmin
 then Xmin:=X1
 else
  if X1 > Xmax
   then Xmax:=X1;
if Y1 < Ymin
 then Ymin:=Y1
 else
  if Y1 > Ymax
   then Ymax:=Y1;
if X2 < Xmin
 then Xmin:=X2
 else
  if X2 > Xmax
   then Xmax:=X2;
if Y2 < Ymin
 then Ymin:=Y2
 else
  if Y2 > Ymax
   then Ymax:=Y2;
if X3 < Xmin
 then Xmin:=X3
 else
  if X3 > Xmax
   then Xmax:=X3;
if Y3 < Ymin
 then Ymin:=Y3
 else
  if Y3 > Ymax
   then Ymax:=Y3;
end;
end;

{TSpaceUpdatesUserNotificator}
Constructor TSpaceUpdatesUserNotificator.Create(const pSpace: TProxySpace);
begin
Inherited Create;
//.
Lock:=TCriticalSection.Create;
Space:=pSpace;
flInitialized:=false;
//.
Components:=nil;
Windows:=nil;
Windows_ComponentsList:=TList.Create;
//.
UpdatedComponentItemsCount:=0;
end;

Destructor TSpaceUpdatesUserNotificator.Destroy;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
if (Windows_ComponentsList <> nil)
 then begin
  for I:=0 to Windows_ComponentsList.Count-1 do begin
    ptrDestroyItem:=Windows_ComponentsList[I];
    FreeMem(ptrDestroyItem,SizeOf(TComponentSavedItem));
    end;
  Windows_ComponentsList.Destroy;
  end;
if (Components <> nil) then FreeMem(Components,ComponentsSize);
if (Windows <> nil) then FreeMem(Windows,WindowsSize);
finally
Lock.Leave;
end;
//.
Lock.Free;
//.
Inherited;
end;

function TSpaceUpdatesUserNotificator.IsValid: boolean;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(Pointer(Integer(Components)+I*SizeOf(TComponentSavedItem))^) do
  if (Enabled)
   then begin
    Result:=true;
    Exit; //. ->
    end;
for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^) do
  if (Enabled)
   then begin
    Result:=true;
    Exit; //. ->
    end;
Result:=false;
finally
Lock.Leave;
end;
end;

function TSpaceUpdatesUserNotificator.IsWindowExist(const pWindow: TUpdatesUserNotificatorWindowCoords): boolean;
var
  ptrItem: pointer;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (Windows <> nil)
 then begin
  ptrItem:=Windows;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(ptrItem^).WND do begin
    if (TWindowSavedItem(ptrItem^).Enabled AND ((X0 = pWindow.X0) AND (Y0 = pWindow.Y0) AND (X1 = pWindow.X1) AND (Y1 = pWindow.Y1) AND (X2 = pWindow.X2) AND (Y2 = pWindow.Y2) AND (X3 = pWindow.X3) AND (Y3 = pWindow.Y3)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next Window
    Inc(Integer(ptrItem),SizeOf(TWindowSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

function TSpaceUpdatesUserNotificator.WindowsContainers_ObjContainerCoordsIsNotOutside(const Obj_CC: TContainerCoord): boolean;
var
  ptrItem: pointer;
  I: integer;
  WND_CC: TContainerCoord;
begin
Result:=false;
Lock.Enter;
try
if (Windows <> nil)
 then begin
  ptrItem:=Windows;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(ptrItem^) do begin
    if (Enabled)
     then begin
      if (NOT ((WND.X0 = 0) AND (WND.Y0 = 0) AND (WND.X1 = 0) AND (WND.Y1 = 0) AND (WND.X2 = 0) AND (WND.Y2 = 0) AND (WND.X3 = 0) AND (WND.Y3 = 0)))
       then begin
        WND_CC:=ConvertWindowCoordToContainerCoord(WND);
        Result:=(NOT ContainerCoord_IsObjectOutside(WND_CC,Obj_CC));
        end
       else Result:=true;
      if (Result) then Exit; //. ->
      end;
    //. next Window
    Inc(Integer(ptrItem),SizeOf(TWindowSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

procedure TSpaceUpdatesUserNotificator.GetWindowsContainersCoords(out CCs: TContainerCoordArray);
var
  Cnt: integer;
  I: integer;
begin
Lock.Enter;
try
if (Windows <> nil)
 then begin
  Cnt:=0;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^) do if (Enabled) then Inc(Cnt);
  SetLength(CCs,Cnt);
  Cnt:=0;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^) do if (Enabled) then begin
    CCs[Cnt]:=ConvertWindowCoordToContainerCoord(WND);
    Inc(Cnt);
    end;
  end
 else SetLength(CCs,0);
finally
Lock.Leave;
end;
end;

function TSpaceUpdatesUserNotificator.IsComponentExist(const pidTComponent: integer; const pidComponent: integer; out ptrItem: pointer): boolean;
var
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    if (TComponentSavedItem(ptrItem^).Enabled AND (((idTComponent = pidTComponent) AND (idComponent = pidComponent)) OR (idComponent = 0)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

function TSpaceUpdatesUserNotificator.IsVisualizationExist(const pptrObj: TPtr; out ptrItem: pointer): boolean;
var
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    if (TComponentSavedItem(ptrItem^).Enabled AND ((VisualizationPtr = pptrObj) OR (idComponent = 0)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

procedure TSpaceUpdatesUserNotificator.LoadFromStream(const Stream: TStream);
var
  CC,WC: integer;
  I: integer;
  ptrItem: pointer;
  Functionality: TComponentFunctionality;
begin
Lock.Enter;
try
if (Components <> nil)
 then begin
  FreeMem(Components,ComponentsSize);
  Components:=nil;
  end;
if (Windows <> nil)
 then begin
  FreeMem(Windows,WindowsSize);
  Windows:=nil;
  end;
if (Stream.Size > 0)
 then begin
  Stream.Position:=0;
  Stream.Read(CC,SizeOf(CC));
  if (CC > 0)
   then begin
    ComponentsSize:=CC*SizeOf(TComponentSavedItem);
    GetMem(Components,ComponentsSize);
    Stream.Read(Components^,ComponentsSize);
    //. validate components
    ptrItem:=Components;
    for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
      VisualizationPtr:=nilPtr;
      if (idComponent <> 0)
       then
        try
        Functionality:=TComponentFunctionality_Create(idTComponent,idComponent);
        with Functionality do
        try
        if (Functionality is TBaseVisualizationFunctionality)
         then VisualizationPtr:=TBaseVisualizationFunctionality(Functionality).Ptr
         else VisualizationPtr:=nilPtr;
        finally
        Release;
        end;
        except
          end;
      //.
      TComponentSavedItem(ptrItem^).LastOperation:=-1;
      TComponentSavedItem(ptrItem^).LastOperationTime:=Now;
      //. next component
      Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
      end;
    end;
  if (Stream.Position < Stream.Size)
   then begin
    Stream.Read(WC,SizeOf(WC));
    if (WC > 0)
     then begin
      WindowsSize:=WC*SizeOf(TWindowSavedItem);
      GetMem(Windows,WindowsSize);
      Stream.Read(Windows^,WindowsSize);
      end;
    end;
  end;
flInitialized:=true;
finally
Lock.Leave;
end;
end;

procedure TSpaceUpdatesUserNotificator.SaveToStream(const Stream: TStream);
var
  CC,WC: integer;
begin
Lock.Enter;
try
if (NOT flInitialized) then Raise Exception.Create('could not save: datas has not been loaded'); //. =>
Stream.Size:=0;
if (Components <> nil)
 then begin
  CC:=(ComponentsSize DIV SizeOf(TComponentSavedItem));
  Stream.Write(CC,SizeOf(CC));
  Stream.Write(Components^,ComponentsSize);
  end
 else begin
  CC:=0;
  Stream.Write(CC,SizeOf(CC));
  end;
if (Windows <> nil)
 then begin
  WC:=(WindowsSize DIV SizeOf(TWindowSavedItem));
  Stream.Write(WC,SizeOf(WC));
  Stream.Write(Windows^,WindowsSize);
  end
 else begin
  WC:=0;
  Stream.Write(WC,SizeOf(WC));
  end;
finally
Lock.Leave;
end;
end;

procedure TSpaceUpdatesUserNotificator.Load;
var
  MS: TMemoryStream;
begin
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile(UpdatesUserNotificatorFileName);
MS:=TMemoryStream.Create;
try
if (FileExists(ProfileFile)) then MS.LoadFromFile(ProfileFile);
LoadFromStream(MS);
finally
MS.Destroy;
end;
finally
Destroy;
end;
end;

procedure TSpaceUpdatesUserNotificator.Save;
var
  MS: TMemoryStream;
begin
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile(UpdatesUserNotificatorFileName);
MS:=TMemoryStream.Create;
try
SaveToStream(MS);
MS.Position:=0;
MS.SaveToFile(ProfileFile);
finally
MS.Destroy;
end;
finally
Destroy;
end;
end;

procedure TSpaceUpdatesUserNotificator.DoOnComponentOperation(const pidTObj,pidObj: integer; const Operation: TComponentOperation);
var
  ptrItem: pointer;
begin
Lock.Enter;
try
if (NOT flInitialized) then Exit; //. ->
if (IsComponentExist(pidTObj,pidObj, ptrItem) AND TComponentSavedItem(ptrItem^).Enabled AND ((TComponentSavedItem(ptrItem^).CID.Operation = -1) OR (TComponentOperation(TComponentSavedItem(ptrItem^).CID.Operation) = Operation)))
 then begin
  TComponentSavedItem(ptrItem^).LastOperation:=SmallInt(Operation);
  TComponentSavedItem(ptrItem^).LastOperationTime:=Now;
  Inc(UpdatedComponentItemsCount);
  end;
finally
Lock.Leave;
end;
end;

procedure TSpaceUpdatesUserNotificator.DoOnVisualizationOperation(const pptrObj: TPtr; const pAct: TRevisionAct);
var
  ptrItem: pointer;
  I: integer;
  Obj_CC: TContainerCoord;
  flFound: boolean;
  ptrNewComponentItem: pointer;
  Obj: TSpaceObj;
  idTROOT,idROOT: integer;
  idTOwner,idOwner: integer;
begin
Lock.Enter;
try
//. process components
if (NOT flInitialized) then Exit; //. ->
if (IsVisualizationExist(pptrObj, ptrItem) AND TComponentSavedItem(ptrItem^).Enabled AND ((TComponentSavedItem(ptrItem^).CID.VisualizationAct = -1) OR (TRevisionAct(TComponentSavedItem(ptrItem^).CID.VisualizationAct) = pAct)))
 then begin
  TComponentSavedItem(ptrItem^).LastOperation:=SmallInt(pAct);
  TComponentSavedItem(ptrItem^).LastOperationTime:=Now;
  Inc(UpdatedComponentItemsCount);
  Exit; //. ->
  end;
//. process windows
if (Windows <> nil)
 then
  if (NOT (pAct in [actRemove,actRemoveRecursively]))
   then begin
    try
    Space.ReadObj(Obj,SizeOf(Obj),pptrObj);
    Space.Obj_GetMinMax(Obj_CC.Xmin,Obj_CC.Ymin,Obj_CC.Xmax,Obj_CC.Ymax, Obj);
    if (WindowsContainers_ObjContainerCoordsIsNotOutside(Obj_CC))
     then begin
      flFound:=false;
      for I:=0 to Windows_ComponentsList.Count-1 do with TComponentSavedItem(Windows_ComponentsList[I]^) do
        if (CID.VisualizationPtr = pptrObj)
         then begin
          CID.VisualizationAct:=SmallInt(pAct);
          LastOperation:=SmallInt(pAct);
          LastOperationTime:=Now;
          flFound:=true;
          Break; //. >
          end;
      if (NOT flFound)
       then begin
        GetMem(ptrNewComponentItem,SizeOf(TComponentSavedItem));
        with TComponentSavedItem(ptrNewComponentItem^) do begin
        CID.idTComponent:=Obj.idTObj;
        CID.idComponent:=Obj.idObj;
        CID.VisualizationPtr:=pptrObj;
        CID.VisualizationAct:=SmallInt(pAct);
        TimeOut:=0;
        Enabled:=true;
        LastOperation:=SmallInt(pAct);
        LastOperationTime:=Now;
        //. assigning the name
        Space.Obj_GetRoot(Space.Obj_IDType(CID.VisualizationPtr),Space.Obj_ID(CID.VisualizationPtr), idTROOT,idROOT);
        try
        with TComponentFunctionality_Create(idTROOT,idROOT) do
        try
        if (GetOwner(idTOwner,idOwner))
         then with TComponentFunctionality_Create(idTOwner,idOwner) do
          try
          TComponentSavedItem(ptrNewComponentItem^).Name:=Name;
          finally
          Release;
          end
         else TComponentSavedItem(ptrNewComponentItem^).Name:=Name;
        finally
        Release;
        end;
        except
          TComponentSavedItem(ptrNewComponentItem^).Name:='?';
          end;
        end;
        Windows_ComponentsList.Add(ptrNewComponentItem);
        end;
      Inc(UpdatedComponentItemsCount);
      end;
    except
      end;
    end
   else begin
    for I:=0 to Windows_ComponentsList.Count-1 do with TComponentSavedItem(Windows_ComponentsList[I]^) do
      if (CID.VisualizationPtr = pptrObj)
       then begin
        CID.VisualizationAct:=SmallInt(pAct);
        LastOperation:=SmallInt(pAct);
        LastOperationTime:=Now;
        Inc(UpdatedComponentItemsCount);
        Break; //. >
        end;
    end;
finally
Lock.Leave;
end;
end;


{TfmSpaceUpdatesUserNotificator}
Constructor TfmSpaceUpdatesUserNotificator.Create(const pSpace: TProxySPace);
begin
Inherited Create(nil);
UpdatesUserNotificator:=TSpaceUpdatesUserNotificator.Create(pSpace);
//.
ImageList:=TImageList.Create(Self);
with ImageList do begin
Width:=32;
Height:=32;
end;
lvComponents.SmallImages:=ImageList;
lvComponents.LargeImages:=ImageList;
//.
//. lvNotifications.SmallImages:=ImageList;
//. lvNotifications.LargeImages:=ImageList;
//.
flChanged:=false;
//.
Left:=(Screen.Width-Width) DIV 2;
Top:=0;
end;

Destructor TfmSpaceUpdatesUserNotificator.Destroy;
begin
if (flChanged) then Save();
Clear();
//.
UpdatesUserNotificator.Free;
Inherited;
end;

procedure TfmSpaceUpdatesUserNotificator.Clear;
begin
ClearComponents;
ClearWindows;
end;

procedure TfmSpaceUpdatesUserNotificator.ClearComponents;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvComponents do begin
Items.BeginUpdate;
try
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TComponentSavedItem));
  end;
Items.Clear;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmSpaceUpdatesUserNotificator.ClearWindows;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvWindows do begin
Items.BeginUpdate;
try
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TWindowSavedItem));
  end;
Items.Clear;
finally
Items.EndUpdate;
end;
end
end;

procedure TfmSpaceUpdatesUserNotificator.Save;
var
  I: integer;
  ptrItem: pointer;
begin
with lvComponents do begin
UpdatesUserNotificator.Lock.Enter;
try
if (UpdatesUserNotificator.Components <> nil)
 then begin
  FreeMem(UpdatesUserNotificator.Components,UpdatesUserNotificator.ComponentsSize);
  UpdatesUserNotificator.ComponentsSize:=0;
  UpdatesUserNotificator.Components:=nil;
  end;
if (Items.Count > 0)
 then begin
  UpdatesUserNotificator.ComponentsSize:=Items.Count*SizeOf(TComponentSavedItem);
  GetMem(UpdatesUserNotificator.Components,UpdatesUserNotificator.ComponentsSize);
  for I:=0 to Items.Count-1 do begin
    ptrItem:=Items[I].Data;
    TComponentSavedItem(Pointer(Integer(UpdatesUserNotificator.Components)+I*SizeOf(TComponentSavedItem))^):=TComponentSavedItem(ptrItem^);
    end;
  end;
UpdatesUserNotificator.Save();
finally
UpdatesUserNotificator.Lock.Leave;
end;
end;
with lvWindows do begin
UpdatesUserNotificator.Lock.Enter;
try
if (UpdatesUserNotificator.Windows <> nil)
 then begin
  FreeMem(UpdatesUserNotificator.Windows,UpdatesUserNotificator.WindowsSize);
  UpdatesUserNotificator.WindowsSize:=0;
  UpdatesUserNotificator.Windows:=nil;
  end;
if (Items.Count > 0)
 then begin
  UpdatesUserNotificator.WindowsSize:=Items.Count*SizeOf(TWindowSavedItem);
  GetMem(UpdatesUserNotificator.Windows,UpdatesUserNotificator.WindowsSize);
  for I:=0 to Items.Count-1 do begin
    ptrItem:=Items[I].Data;
    TWindowSavedItem(Pointer(Integer(UpdatesUserNotificator.Windows)+I*SizeOf(TWindowSavedItem))^):=TWindowSavedItem(ptrItem^);
    end;
  end;
UpdatesUserNotificator.Save();
finally
UpdatesUserNotificator.Lock.Leave;
end;
end;
flChanged:=false;
end;

procedure TfmSpaceUpdatesUserNotificator.Update;
var
  I: integer;
  ptrItem: pointer;
begin
if flChanged then Save;
Clear();
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with lvComponents do begin
Items.BeginUpdate;
try
UpdatesUserNotificator.Lock.Enter;
try
for I:=0 to (UpdatesUserNotificator.ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with Items.Add do
  try
  GetMem(ptrItem,SizeOf(TComponentSavedItem));
  TComponentSavedItem(ptrItem^):=TComponentSavedItem(Pointer(Integer(UpdatesUserNotificator.Components)+I*SizeOf(TComponentSavedItem))^);
  Data:=ptrItem;
  Caption:=TComponentSavedItem(ptrItem^).Name;
  if (TComponentSavedItem(ptrItem^).CID.Operation = -1)
   then SubItems.Add('ALL')
   else
    case TComponentOperation(TComponentSavedItem(ptrItem^).CID.Operation) of
    opUpdate: SubItems.Add('Update');
    opDestroy: SubItems.Add('Destroy');
    else
      SubItems.Add('--');
    end;
  if (TComponentSavedItem(ptrItem^).TimeOut <> 0)
   then SubItems.Add(IntToStr(Trunc(TComponentSavedItem(ptrItem^).TimeOut*24.0))+'h. '+IntToStr(Round(Frac(TComponentSavedItem(ptrItem^).TimeOut*24.0)*60.0))+'min.')
   else SubItems.Add('none');
  if (TComponentSavedItem(ptrItem^).CID.idComponent <> 0)
   then with TComponentFunctionality_Create(TComponentSavedItem(ptrItem^).CID.idTComponent,TComponentSavedItem(ptrItem^).CID.idComponent) do
    try
    ImageIndex:=TypeFunctionality.ImageList_Index;
    finally
    Release;
    end
   else ImageIndex:=-1;
  Checked:=TComponentSavedItem(ptrItem^).Enabled;
  except
    On E: Exception do Caption:='error: '+E.Message;
    end;
finally
UpdatesUserNotificator.Lock.Leave;
end;
finally
Items.EndUpdate;
end;
end;
with lvWindows do begin
Items.BeginUpdate;
try
UpdatesUserNotificator.Lock.Enter;
try
for I:=0 to (UpdatesUserNotificator.WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with Items.Add do
  try
  GetMem(ptrItem,SizeOf(TWindowSavedItem));
  TWindowSavedItem(ptrItem^):=TWindowSavedItem(Pointer(Integer(UpdatesUserNotificator.Windows)+I*SizeOf(TWindowSavedItem))^);
  Data:=ptrItem;
  Caption:=TWindowSavedItem(ptrItem^).Name;
  ImageIndex:=0;
  Checked:=TWindowSavedItem(ptrItem^).Enabled;
  except
    On E: Exception do Caption:='error: '+E.Message;
    end;
finally
UpdatesUserNotificator.Lock.Leave;
end;
finally
Items.EndUpdate;
end;
end;
flChanged:=false;
end;

procedure TfmSpaceUpdatesUserNotificator.CheckAndValidateChanges;
var
  I: integer;
begin
if (flChanged) then Exit; //. ->
for I:=0 to lvComponents.Items.Count-1 do with lvComponents.Items[I] do begin
  if (Checked <> TComponentSavedItem(Data^).Enabled)
   then begin
    TComponentSavedItem(Data^).Enabled:=Checked;
    flChanged:=true;
    end;
  if (Caption <> TComponentSavedItem(Data^).Name)
   then begin
    TComponentSavedItem(Data^).Name:=Caption;
    flChanged:=true;
    end;
  end;
for I:=0 to lvWindows.Items.Count-1 do with lvWindows.Items[I] do begin
  if (Checked <> TWindowSavedItem(Data^).Enabled)
   then begin
    TWindowSavedItem(Data^).Enabled:=Checked;
    flChanged:=true;
    end;
  if (Caption <> TWindowSavedItem(Data^).Name)
   then begin
    TWindowSavedItem(Data^).Name:=Caption;
    flChanged:=true;
    end;
  end;
end;

procedure TfmSpaceUpdatesUserNotificator.InsertNewComponent(const pidTComponent,pidComponent: integer; const Operation: SmallInt; const Act: SmallInt);
var
  ptrNewItem: pointer;
  Functionality: TComponentFunctionality;
begin
if (UpdatesUserNotificator.IsComponentExist(pidTComponent,pidComponent, ptrNewItem)) then Raise Exception.Create('component already in list'); //. =>
//. check for object
if (pidComponent <> 0)
 then begin
  with TComponentFunctionality_Create(pidTComponent,pidComponent) do
  try
  Check;
  finally
  Release;
  end;
  //.
  GetMem(ptrNewItem,SizeOf(TComponentSavedItem));
  with TComponentSavedItem(ptrNewItem^) do begin
  CID.idTComponent:=pidTComponent;
  CID.idComponent:=pidComponent;
  CID.Operation:=Operation;
  CID.VisualizationPtr:=nilPtr;
  Functionality:=TComponentFunctionality_Create(CID.idTComponent,CID.idComponent);
  with Functionality do
  try
  if (Functionality is TBaseVisualizationFunctionality)
   then begin
    CID.VisualizationPtr:=TBaseVisualizationFunctionality(Functionality).Ptr;
    CID.VisualizationAct:=Act;
    end;
  //.
  TComponentSavedItem(ptrNewItem^).Name:=Functionality.Name;
  TimeOut:=0;
  Enabled:=true;
  with lvComponents.Items.Add do begin
  Caption:=TComponentSavedItem(ptrNewItem^).Name;
  if (TComponentSavedItem(ptrNewItem^).CID.Operation = -1)
   then SubItems.Add('ALL')
   else
    case TComponentOperation(TComponentSavedItem(ptrNewItem^).CID.Operation) of
    opUpdate: SubItems.Add('Update');
    opDestroy: SubItems.Add('Destroy');
    else
      SubItems.Add('--');
    end;
  if (TComponentSavedItem(ptrNewItem^).TimeOut <> 0)
   then SubItems.Add(IntToStr(Trunc(TComponentSavedItem(ptrNewItem^).TimeOut*24.0))+'h. '+IntToStr(Round(Frac(TComponentSavedItem(ptrNewItem^).TimeOut*24.0)*60.0))+'min.')
   else SubItems.Add('none');
  Data:=ptrNewItem;
  ImageIndex:=TypeFunctionality.ImageList_Index;
  Checked:=TComponentSavedItem(ptrNewItem^).Enabled;
  flChanged:=true;
  EditCaption();
  end;
  finally
  Release;
  end;
  LastOperation:=-1;
  LastOperationTime:=Now;
  end;
  end
 else begin
  GetMem(ptrNewItem,SizeOf(TComponentSavedItem));
  with TComponentSavedItem(ptrNewItem^) do begin
  CID.idTComponent:=pidTComponent;
  CID.idComponent:=pidComponent;
  CID.Operation:=Operation;
  CID.VisualizationPtr:=nilPtr;
  //.
  TComponentSavedItem(ptrNewItem^).Name:='All components';
  TimeOut:=0;
  Enabled:=true;
  with lvComponents.Items.Add do begin
  Caption:=TComponentSavedItem(ptrNewItem^).Name;
  if (TComponentSavedItem(ptrNewItem^).CID.Operation = -1)
   then SubItems.Add('ALL')
   else
    case TComponentOperation(TComponentSavedItem(ptrNewItem^).CID.Operation) of
    opUpdate: SubItems.Add('Update');
    opDestroy: SubItems.Add('Destroy');
    else
      SubItems.Add('--');
    end;
  if (TComponentSavedItem(ptrNewItem^).TimeOut <> 0)
   then SubItems.Add(IntToStr(Trunc(TComponentSavedItem(ptrNewItem^).TimeOut*24.0))+'h. '+IntToStr(Round(Frac(TComponentSavedItem(ptrNewItem^).TimeOut*24.0)*60.0))+'min.')
   else SubItems.Add('none');
  Data:=ptrNewItem;
  ImageIndex:=-1;
  Checked:=TComponentSavedItem(ptrNewItem^).Enabled;
  flChanged:=true;
  end;
  LastOperation:=-1;
  LastOperationTime:=Now;
  end;
  end;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponents_SetTimeoutForComponent(ComponentItem: TListItem; const Timeout: TDateTime);
var
  ptrItem: pointer;
begin
if (ComponentItem = nil) then Exit; //. ->
ptrItem:=ComponentItem.Data;
TComponentSavedItem(ptrItem^).TimeOut:=Timeout;
//.
if (TComponentSavedItem(ptrItem^).TimeOut <> 0)
 then ComponentItem.SubItems[1]:=IntToStr(Trunc(TComponentSavedItem(ptrItem^).TimeOut*24.0))+'h. '+IntToStr(Round(Frac(TComponentSavedItem(ptrItem^).TimeOut*24.0)*60.0))+'min.'
 else ComponentItem.SubItems[1]:='none';
//.
flChanged:=true;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponents_RemoveComponent(ComponentItem: TListItem);
var
  ptrRemoveItem: pointer;
  I: integer;
begin
if (ComponentItem = nil) then Exit; //. ->
ptrRemoveItem:=ComponentItem.Data;
//.
ComponentItem.Delete;
//. remove from notifications lists
for I:=0 to lvNotifications.Items.Count-1 do
  if (
        (TComponentSavedItem(lvNotifications.Items[I].Data^).CID.idTComponent = TComponentSavedItem(ptrRemoveItem^).CID.idTComponent) AND
        (TComponentSavedItem(lvNotifications.Items[I].Data^).CID.idComponent = TComponentSavedItem(ptrRemoveItem^).CID.idComponent) AND
        (TComponentSavedItem(lvNotifications.Items[I].Data^).CID.Operation = TComponentSavedItem(ptrRemoveItem^).CID.Operation)
      )
   then begin
    lvNotifications.Items.Delete(I);
    Break; //. >
    end;
for I:=0 to lvTimeoutNotifications.Items.Count-1 do
  if (
        (TComponentSavedItem(lvTimeoutNotifications.Items[I].Data^).CID.idTComponent = TComponentSavedItem(ptrRemoveItem^).CID.idTComponent) AND
        (TComponentSavedItem(lvTimeoutNotifications.Items[I].Data^).CID.idComponent = TComponentSavedItem(ptrRemoveItem^).CID.idComponent) AND
        (TComponentSavedItem(lvTimeoutNotifications.Items[I].Data^).CID.Operation = TComponentSavedItem(ptrRemoveItem^).CID.Operation)
      )
   then begin
    lvTimeoutNotifications.Items.Delete(I);
    Break; //. >
    end;
//.
FreeMem(ptrRemoveItem,SizeOf(TComponentSavedItem));
flChanged:=true;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponents_RemoveAll;
begin
ClearComponents();
flChanged:=true;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponents_EnableAll;
var
  I: integer;
begin
for I:=0 to lvComponents.Items.Count-1 do lvComponents.Items[I].Checked:=true;
//.
CheckAndValidateChanges;
//.
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponents_DisableAll;
var
  I: integer;
begin
for I:=0 to lvComponents.Items.Count-1 do lvComponents.Items[I].Checked:=false;
//.
CheckAndValidateChanges;
//.
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.InsertNewWindow(const pWindow: TUpdatesUserNotificatorWindowCoords);
var
  ptrNewItem: pointer;
begin
if (UpdatesUserNotificator.IsWindowExist(pWindow)) then Raise Exception.Create('window is already exist in the list'); //. =>
//.
GetMem(ptrNewItem,SizeOf(TWindowSavedItem));
with TWindowSavedItem(ptrNewItem^) do begin
WND:=pWindow;
if (NOT ((pWindow.X0 = 0) AND (pWindow.Y0 = 0) AND (pWindow.X1 = 0) AND (pWindow.Y1 = 0) AND (pWindow.X2 = 0) AND (pWindow.Y2 = 0) AND (pWindow.X3 = 0) AND (pWindow.Y3 = 0)))
 then TWindowSavedItem(ptrNewItem^).Name:='New UpdatesUserNotificator window'
 else TWindowSavedItem(ptrNewItem^).Name:='All Windows';
Enabled:=true;
with lvWindows.Items.Add do begin
Caption:=TWindowSavedItem(ptrNewItem^).Name;
Data:=ptrNewItem;
ImageIndex:=0;
Checked:=TWindowSavedItem(ptrNewItem^).Enabled;
flChanged:=true;
if (NOT ((pWindow.X0 = 0) AND (pWindow.Y0 = 0) AND (pWindow.X1 = 0) AND (pWindow.Y1 = 0) AND (pWindow.X2 = 0) AND (pWindow.Y2 = 0) AND (pWindow.X3 = 0) AND (pWindow.Y3 = 0)))
 then EditCaption();
end;
end;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvWindows_RemoveWindow(WindowItem: TListItem);
var
  ptrRemoveItem: pointer;
begin
if (WindowItem = nil) then Exit; //. ->
ptrRemoveItem:=WindowItem.Data;
WindowItem.Delete;
FreeMem(ptrRemoveItem,SizeOf(TWindowSavedItem));
flChanged:=true;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvWindows_RemoveAll;
begin
ClearWindows();
flChanged:=true;
//.
Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvWindows_EnableAll;
var
  I: integer;
begin
for I:=0 to lvWindows.Items.Count-1 do lvWindows.Items[I].Checked:=true;
//.
CheckAndValidateChanges;
//.
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvWindows_DisableAll;
var
  I: integer;
begin
for I:=0 to lvWindows.Items.Count-1 do lvWindows.Items[I].Checked:=false;
//.
CheckAndValidateChanges;
//.
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.Removeselected1Click(Sender: TObject);
begin
if ((lvComponents.Selected <> nil) AND (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes))
 then lvComponents_RemoveComponent(lvComponents.Selected);
end;

procedure TfmSpaceUpdatesUserNotificator.DisableAll1Click(Sender: TObject);
begin
if (MessageDlg('disable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_DisableAll;
end;

procedure TfmSpaceUpdatesUserNotificator.EnableAll1Click(Sender: TObject);
begin
if (MessageDlg('enable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_EnableAll;
end;

procedure TfmSpaceUpdatesUserNotificator.Clear1Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_RemoveAll();
end;

procedure TfmSpaceUpdatesUserNotificator.lvComponentsDblClick(Sender: TObject);
begin
if (lvComponents.Selected = nil) then Exit; //. ->
with TComponentSavedItem(lvComponents.Selected.Data^).CID do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check();
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
end;

procedure TfmSpaceUpdatesUserNotificator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
CheckAndValidateChanges();
if (flChanged) then Save();
end;


procedure TfmSpaceUpdatesUserNotificator.Validatechanges1Click(Sender: TObject);
begin
CheckAndValidateChanges();
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem1Click(Sender: TObject);
var
  W: TReflectionWindowStruc;
  Window: TUpdatesUserNotificatorWindowCoords;
begin
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector'); //. =>
if (NOT (TypesSystem.Reflector is TReflector)) then Raise Exception.Create('default reflector is not a 2d reflector'); //. =>
TReflector(TypesSystem.Reflector).ReflectionWindow.GetWindow(true, W);
//.
Window.X0:=W.X0; Window.Y0:=W.Y0;
Window.X1:=W.X1; Window.Y1:=W.Y1;
Window.X2:=W.X2; Window.Y2:=W.Y2;
Window.X3:=W.X3; Window.Y3:=W.Y3;
//.
InsertNewWindow(Window);
end;

procedure TfmSpaceUpdatesUserNotificator.Addallwindows1Click(Sender: TObject);
var
  Window: TUpdatesUserNotificatorWindowCoords;
begin
Window.X0:=0; Window.Y0:=0;
Window.X1:=0; Window.Y1:=0;
Window.X2:=0; Window.Y2:=0;
Window.X3:=0; Window.Y3:=0;
//.
InsertNewWindow(Window);
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem2Click(Sender: TObject);
begin
if ((lvWindows.Selected <> nil) AND (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes))
 then lvWindows_RemoveWindow(lvWindows.Selected);
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem3Click(Sender: TObject);
begin
if (MessageDlg('disable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_DisableAll;
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem4Click(Sender: TObject);
begin
if (MessageDlg('enable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_EnableAll;
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem5Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_RemoveAll();
end;

procedure TfmSpaceUpdatesUserNotificator.MenuItem7Click(Sender: TObject);
begin
CheckAndValidateChanges();
if (flChanged) then Save();
end;

procedure TfmSpaceUpdatesUserNotificator.lvWindowsDblClick(Sender: TObject);
var
  W: TReflectionWindowStrucEx;
begin
if (lvWindows.Selected = nil) then Exit; //. ->
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector to show UpdatesUserNotificator window'); //. =>
if (NOT (TypesSystem.Reflector is TReflector)) then Raise Exception.Create('default reflector is not a 2d reflector'); //. =>
//.
with TWindowSavedItem(lvWindows.Selected.Data^).WND do begin
W.X0:=X0; W.Y0:=Y0;
W.X1:=X1; W.Y1:=Y1;
W.X2:=X2; W.Y2:=Y2;
W.X3:=X3; W.Y3:=Y3;
end;
//.
TReflector(TypesSystem.Reflector).SetReflectionByWindow(W);
end;

procedure TfmSpaceUpdatesUserNotificator.UpdateNotifications;
var
  I,J: integer;
  ptrItem: pointer;
  TheSameItemFound: boolean;
  TheSameItemIndex: integer;
  Source,Target: TListItem;
begin
with UpdatesUserNotificator do begin
Lock.Enter;
try
if (NOT flInitialized)
 then begin
  Load();
  //.
  Update();
  end;
//.
if (UpdatedComponentItemsCount > 0)
 then begin
  lvNotifications.Items.BeginUpdate;
  try
  if (Components <> nil)
   then begin
    ptrItem:=Components;
    for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
      if (TComponentSavedItem(ptrItem^).Enabled AND (TComponentSavedItem(ptrItem^).LastOperation >= 0))
       then with TComponentSavedItem(ptrItem^) do begin
        //. check for the same item
        TheSameItemFound:=false;
        for J:=0 to lvNotifications.Items.Count-1 do
          if (lvNotifications.Items[J].Data = ptrItem)
           then begin
            TheSameItemIndex:=J;
            TheSameItemFound:=true;
            Break; //. >
            end;
        //.
        if (TheSameItemFound)
         then begin
          Source:=lvNotifications.Items[TheSameItemIndex];
          Target:=lvNotifications.Items.Insert(0);
          Target.Assign(Source);
          Source.Free;
          end
         else begin
          Target:=lvNotifications.Items.Insert(0);
          with Target do begin
          Data:=ptrItem;
          SubItems.Add('');
          SubItems.Add('');
          ImageIndex:=-1;
          end;
          end;
        with Target do begin
        Caption:=FormatDateTime('YY/MM/DD HH:NN:SS',Now);
        if (CID.VisualizationPtr <> nilPtr)
         then SubItems[0]:=RevisionActsStrings[TRevisionAct(TComponentSavedItem(ptrItem^).LastOperation)] // process as visualization
         else SubItems[0]:=ComponentOperationsStrings[TComponentOperation(TComponentSavedItem(ptrItem^).LastOperation)]; // process as component
        SubItems[1]:=TComponentSavedItem(ptrItem^).Name;
        end;
        end;
      TComponentSavedItem(ptrItem^).LastOperation:=-1;
      //. next component
      Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
      end;
    end;
  if (Windows <> nil)
   then 
    for I:=0 to Windows_ComponentsList.Count-1 do with TComponentSavedItem(Windows_ComponentsList[I]^).CID do begin
      if (TComponentSavedItem(Windows_ComponentsList[I]^).Enabled AND (TComponentSavedItem(Windows_ComponentsList[I]^).LastOperation >= 0))
       then with TComponentSavedItem(Windows_ComponentsList[I]^) do begin
        //. check for the same item
        TheSameItemFound:=false;
        for J:=0 to lvNotifications.Items.Count-1 do
          if (lvNotifications.Items[J].Data = Windows_ComponentsList[I])
           then begin
            TheSameItemIndex:=J;
            TheSameItemFound:=true;
            Break; //. >
            end;
        //.
        if (TheSameItemFound)
         then begin
          Source:=lvNotifications.Items[TheSameItemIndex];
          Target:=lvNotifications.Items.Insert(0);
          Target.Assign(Source);
          Source.Free;
          end
         else begin
          Target:=lvNotifications.Items.Insert(0);
          with Target do begin
          Data:=Windows_ComponentsList[I];
          SubItems.Add('');
          SubItems.Add('');
          ImageIndex:=-1;
          end;
          end;
        with Target do begin
        Caption:=FormatDateTime('YY/MM/DD HH:NN:SS',Now);
        SubItems[0]:=RevisionActsStrings[TRevisionAct(TComponentSavedItem(Windows_ComponentsList[I]^).LastOperation)];
        SubItems[1]:=TComponentSavedItem(Windows_ComponentsList[I]^).Name;
        end;
        end;
      TComponentSavedItem(Windows_ComponentsList[I]^).LastOperation:=-1;
      end;
  if (lvNotifications.Items.Count > 0)
   then with lvNotifications.Items[0] do begin
    Focused:=true;
    Selected:=true;
    end;
  finally
  lvNotifications.Items.EndUpdate;
  end;
  //.
  UpdatedComponentItemsCount:=0;
  //.
  if (NOT Self.cbComponentNotificationsDisable.Checked)
   then begin
    tsComponentNotifications.PageControl.ActivePageIndex:=0;
    if (NOT Self.Visible) then Self.Show();
    Self.BringToFront();
    end;
  end;
finally
Lock.Leave;
end;
end;
end;

procedure TfmSpaceUpdatesUserNotificator.UpdateTimeoutNotifications;
var
  flShowTimeoutNotifications: boolean;
  I,J: integer;
  ptrItem: pointer;
  TheSameItemFound: boolean;
  TheSameItemIndex: integer;
  Source,Target: TListItem;
  dT: TDateTime;
begin
with UpdatesUserNotificator do begin
Lock.Enter;
try
if (NOT flInitialized)
 then begin
  Load();
  //.
  Update();
  end;
//.
flShowTimeoutNotifications:=false;
lvTimeoutNotifications.Items.BeginUpdate;
try
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    dT:=(Now-TComponentSavedItem(ptrItem^).LastOperationTime);
    if (TComponentSavedItem(ptrItem^).Enabled AND ((TComponentSavedItem(ptrItem^).TimeOut <> 0) AND (dT >= TComponentSavedItem(ptrItem^).TimeOut)))
     then with TComponentSavedItem(ptrItem^) do begin
      TComponentSavedItem(ptrItem^).LastOperationTime:=Now;
      //. check for the same item
      TheSameItemFound:=false;
      for J:=0 to lvTimeoutNotifications.Items.Count-1 do
        if (lvTimeoutNotifications.Items[J].Data = ptrItem)
         then begin
          TheSameItemIndex:=J;
          TheSameItemFound:=true;
          Break; //. >
          end;
      //.
      if (TheSameItemFound)
       then begin
        Source:=lvTimeoutNotifications.Items[TheSameItemIndex];
        Target:=lvTimeoutNotifications.Items.Insert(0);
        Target.Assign(Source);
        Source.Free;
        end
       else begin
        Target:=lvTimeoutNotifications.Items.Insert(0);
        with Target do begin
        Data:=ptrItem;
        SubItems.Add('');
        SubItems.Add('');
        ImageIndex:=-1;
        end;
        end;
      with Target do begin
      Caption:=FormatDateTime('YY/MM/DD HH:NN:SS',Now);
      SubItems[0]:='no updates for '+IntToStr(Trunc(dT*24.0))+'h. '+IntToStr(Round(Frac(dT*24.0)*60.0))+'min.';
      SubItems[1]:=TComponentSavedItem(ptrItem^).Name;
      end;
      flShowTimeoutNotifications:=true;
      end;
    TComponentSavedItem(ptrItem^).LastOperation:=-1;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
if (lvTimeoutNotifications.Items.Count > 0)
 then with lvTimeoutNotifications.Items[0] do begin
  Focused:=true;
  Selected:=true;
  end;
finally
lvTimeoutNotifications.Items.EndUpdate;
end;
//.
if (NOT Self.cbTimeoutNotificationsDisable.Checked AND flShowTimeoutNotifications)
 then begin
  tsTimeoutNotifications.PageControl.ActivePageIndex:=1;
  if (NOT Self.Visible) then Self.Show();
  Self.BringToFront();
  end;
finally
Lock.Leave;
end;
end;
end;

procedure TfmSpaceUpdatesUserNotificator.lvNotificationsDblClick(Sender: TObject);
begin
if (lvNotifications.Selected = nil) then Exit; //. ->
with TComponentSavedItem(lvNotifications.Selected.Data^).CID do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check();
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
end;

procedure TfmSpaceUpdatesUserNotificator.CheckerTimer(Sender: TObject);
begin
UpdateNotifications();
UpdateTimeoutNotifications();
//.
if (lvNotifications.Items.Count > 0)
 then begin
  if (NOT lbNotificationExists.Visible)
   then begin
    sndPlaySound(PChar(UpdatesUserNotificator.Space.WorkLocale+PathLib+'\'+'WAV'+'\'+'notify.wav'),SND_NODEFAULT OR SND_ASYNC{ OR SND_LOOP});
    lbNotificationExists.Show;
    end;
  imgNotificationExists.Visible:=(NOT imgNotificationExists.Visible);
  end
 else begin
  lbNotificationExists.Hide;
  imgNotificationExists.Hide;
  end;
end;

procedure TfmSpaceUpdatesUserNotificator.bbRemoveSelectedNotificationClick(Sender: TObject);
begin
if (lvNotifications.Selected = nil) then Exit; //. ->
lvNotifications.Selected.Delete();
end;

procedure TfmSpaceUpdatesUserNotificator.bbRemoveAllNotificationsClick(Sender: TObject);
begin
lvNotifications.Items.Clear();
end;

procedure TfmSpaceUpdatesUserNotificator.foralloperation1Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,-1,-2);
end;
end;

procedure TfmSpaceUpdatesUserNotificator.forUpdateoperation1Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,SmallInt(opUpdate),-2);
end;
end;

procedure TfmSpaceUpdatesUserNotificator.forDestroyoperation1Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,SmallInt(opDestroy),-2);
end;
end;

procedure TfmSpaceUpdatesUserNotificator.foralloperation2Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,-1,-1);
end;
end;

procedure TfmSpaceUpdatesUserNotificator.forUpdateoperation2Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,SmallInt(opUpdate),-1);
end;
end;

procedure TfmSpaceUpdatesUserNotificator.forDestroyoperation2Click(Sender: TObject);
begin
with TTypesSystem(UpdatesUserNotificator.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj,SmallInt(opDestroy),SmallInt(actRemove));
end;
end;

procedure TfmSpaceUpdatesUserNotificator.Foralloperations1Click(Sender: TObject);
begin
InsertNewComponent(0,0,-1,-2);
end;

procedure TfmSpaceUpdatesUserNotificator.SetTimeOutonselected1Click(Sender: TObject);
var
  Time: TDateTime;
  R: boolean;
begin
if (lvComponents.Selected = nil) then Exit; //. ->
with TfmTimeDialog.Create do
try
Caption:='Enter Timeout';
R:=TimeDialog(Time);
finally
Destroy;
end;
if (R) then lvComponents_SetTimeoutForComponent(lvComponents.Selected,Time);
end;

procedure TfmSpaceUpdatesUserNotificator.bbRemoveSelectedTimeoutNotificationClick(Sender: TObject);
begin
if (lvTimeoutNotifications.Selected = nil) then Exit; //. ->
lvTimeoutNotifications.Selected.Delete();
end;

procedure TfmSpaceUpdatesUserNotificator.bbRemoveAllTimeoutNotificationsClick(Sender: TObject);
begin
lvTimeoutNotifications.Items.Clear();
end;

procedure TfmSpaceUpdatesUserNotificator.lvTimeoutNotificationsDblClick(Sender: TObject);
begin
if (lvTimeoutNotifications.Selected = nil) then Exit; //. ->
with TComponentSavedItem(lvTimeoutNotifications.Selected.Data^).CID do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check();
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
end;


end.

