
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2011 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

{
  ѕ–ј¬»Ћќ: если измен€ешь значение какого-либо свойства, используй блокировку
           обновител€ панели (
           Updater.Disable;
           try
           ....
           except
             Updater.Enabled;
             Raise; //.=>
             end;
           ), если не хочешь чтобы Control
           обновилс€ дважды.
}
Unit SpaceObjInterpretation;
Interface
Uses
  GlobalSpaceDefines, UnitProxySpace, unitReflector, SysUtils, SyncObjs, ShellAPI, TypInfo, DBClient, Windows, Messages, Controls, Forms, StdCtrls, extctrls, Functionality , Classes, Menus, Dialogs, Graphics, Buttons;

const
  ZoneResize_RightMargin = 10;
  ZoneResize_BottomMargin = 10;

  cfFitScreen = 0.9;

  PathPanelsProps = 'TypesDef';

  PropsPanelsUpdating_MinComponentsCount = 1;

  WM_UPDATEPANEL = WM_USER+1;
  WM_HIDEPANEL = WM_USER+2;
  ID_COPYTOCLIPBOARD = WM_USER+3;

type
  TSpaceObjPanelProps = class;
  TSpaceObjPanelsProps = class;

  TPanelPropsDesigner = class
  private
    PanelProps: TSpaceObjPanelProps;
    timerCheckingPanelState: TTimer;
    DFMFileName: string;
    DFMFileDate: TDateTime;

    procedure TimerTick(Sender: TObject);
    function IsDFMFileWasChanged: boolean;
    procedure Start;
    procedure ValidatePanel; //. загружает панель от dfm - файла
  public
    flActive: boolean;

    Constructor Create(pPanelProps: TSpaceObjPanelProps);
    Destructor Destroy; override;
  end;

  TDesignHandleKind = (dhkLeft,dhkLeftTop,dhkTop,dhkTopRight,dhkRight,dhkRightBottom,dhkBottom,dhkBottomLeft);

  TDesignHandle = class(TForm)
  private
    Kind: TDesignHandleKind;
    Owner: TSpaceObjPanelProps;
    LastPos: TPoint;
    flSizeChanged: boolean;
    flPositionChanged: boolean;

    Constructor Create(pOwner: TSpaceObjPanelProps; pKind: TDesignHandleKind);
    procedure UpdatePosition;
    procedure GetCenter(out X,Y: integer);
    procedure Paint(Sender: TObject);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Updater_Tick(Sender: TObject);
  end;

  TPropsPanelsUpdating = class(TThread)
  private
    ComponentIndex: integer;
    MinX,MinY, MaxX,MaxY: integer;
    ObjFunctionality: TComponentFunctionality;
    fmProgress: TForm;
    flDone: boolean;
  public
    ComponentCount: integer;
    PanelProps: TSpaceObjPanelProps;
    flCancel: boolean;
    ReformPanelPropsCount: integer;

    Constructor Create(const pPanelProps: TSpaceObjPanelProps);
    Destructor Destroy; override;
    procedure Execute; override;
    function WaitFor: boolean;
    function IsProcessing: boolean;
    procedure DoOnStart;
    procedure DoOnFinish;
    procedure DoOnProgress;
    procedure ShowPanel;
    procedure AdjustBounds;
    procedure ReAdjustBounds;
    procedure ReformPanelProps;
  end;

  TSpaceObjPanelProps = class(TAbstractSpaceObjPanelProps)
  private
    flControlsChanged: boolean;
    Designer: TPanelPropsDesigner;
    CursorSaveForCreating: TCursor;
    flProgressForm: boolean;
    flUsePropsPanelsUpdating: boolean;
    PropsPanelsUpdating: TPropsPanelsUpdating;
    Handles: TList;

    procedure setflFreeOnClose(Value: boolean); override;

    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);

    function LoadPosition: boolean;
    function LoadSize: boolean;
    procedure SavePosition;
    procedure SaveSize;
    procedure LoadPanelFromStream(Stream: TStream);
    procedure SavePanelToStream(Stream: TStream);
    procedure SavePanel;
    procedure SetPanelAsDefault;

    procedure ReformOwnPanelsProps;

    procedure wmUPDATE(var Message: TMessage); message WM_UPDATEPANEL;
    procedure wmHIDE(var Message: TMessage); message WM_HIDEPANEL;
    procedure wmDropFiles(var msg : TMessage); message WM_DROPFILES;
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure PanelClose(Sender: TObject; var Action: TCloseAction);
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure ShowGrid;
    procedure PostHideMessage;

    procedure ImportAndInsertComponentsFromFile(ImportFileName: string);
  public
    ObjFunctionality: TComponentFunctionality;
    ProxyObjectFunctionality: TComponentFunctionality;
    idOwnerObjectProp: integer;
    OwnerPanelsProps: TSpaceObjPanelsProps;
    PanelsProps: TSpaceObjPanelsProps;
    Updater: TComponentPresentUpdater;
    UpdatesCount: integer;
    flReadOnly: boolean;
    PositionChanged: boolean;
    SizeChanged: boolean;
    popupComponentsPanel: TPopupMenu;
    MSPointer_X: integer;
    MSPointer_Y: integer;
    flUseGrid: boolean;
    GridSize: integer;

    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); virtual;
    function CreateFromResource: boolean;
    destructor Destroy; override;
    procedure Update; override;
    procedure _Update; override;
    procedure SaveChanges; override;
    procedure ShowPanelControlElements; virtual;
    procedure NormalizeSize;

    procedure Handles_Prepare;
    procedure Handles_Update;
    procedure Handles_Free;

    procedure PopupMenuItem_RealityRatingClick(Sender: TObject);
    procedure PopupMenuItem_UpdateNotificationSubscriptionClick(Sender: TObject);
    procedure PopupMenuItem_TagClick(Sender: TObject);
    procedure PopupMenuItem_CloseClick(Sender: TObject);
    procedure PopupMenuItem_CopyClick(Sender: TObject);
    procedure PopupMenuItem_PasteClick(Sender: TObject);
    procedure PopupMenuItem_PasteByReferenceClick(Sender: TObject);
    procedure PopupMenuItem_ToCloneClick(Sender: TObject);
    procedure PopupMenuItem_ExportComponentClick(Sender: TObject);
    procedure PopupMenuItem_ActualityIntervalClick(Sender: TObject);
    procedure PopupMenuItem_ActualizeClick(Sender: TObject);
    procedure PopupMenuItem_ActualizeToDateClick(Sender: TObject);
    procedure PopupMenuItem_DeactualizeClick(Sender: TObject);
    procedure PopupMenuItem_DestroyClick(Sender: TObject);
    procedure PopupMenuItem_SavePanelClick(Sender: TObject);
    procedure PopupMenuItem_CopyPanelClick(Sender: TObject);
    procedure PopupMenuItem_PastePanelClick(Sender: TObject);
    procedure PopupMenuItem_EditPanelClick(Sender: TObject);
    procedure PopupMenuItem_AsDefaultPanelClick(Sender: TObject);
    procedure PopupMenuItem_SaveChanges(Sender: TObject);
    procedure PopupMenuItem_Resize(Sender: TObject);
    procedure PopupMenuItem_ShowPanelControlElements(Sender: TObject);
    procedure PopupMenuItem_ShowHidePanelGrid(Sender: TObject);
    procedure PopupMenuItem_UpdatePanel(Sender: TObject);
    procedure PopupMenuItem_ShowComponentsTreePanel(Sender: TObject);
    procedure PopupMenuItem_ShowOwnerPropsPanel(Sender: TObject);
  end;

  TSpaceObjPanelsProps = class(TAbstractSpaceObjPanelsProps)
  private
    PanelProps: TSpaceObjPanelProps;
  public
    Constructor Create(pPanelProps: TSpaceObjPanelProps);
    destructor Destroy; override;

    procedure Clear;
    procedure Update;
    function _InsertPanel(const idTComponent,idComponent: integer; const pidOwnerObjectProp: integer): TSpaceObjPanelProps;
    function InsertPanel(const idTComponent,idComponent: integer; const pidOwnerObjectProp: integer): TSpaceObjPanelProps;
    procedure RemovePanel(const idTComponent,idComponent: integer);
    procedure ChangePanel(P: TSpaceObjPanelProps);
  end;

Implementation
Uses
  unitEventLog,
  Math,
  ActiveX,
  ComObj, Consts, ComCtrls, FileCtrl, ShlObj, ShellCtrls,
  unitDatePickerPanel,
  TypesFunctionality,
  unitSpaceNotificationSubscription,
  unitComponentTag,
  unitPanelPropsProgress,
  unitComponentsRepository,
  unitCreatingComponents,
  unitObjectDestroying,
  unitComponentsTreePanel,
  unitComponentRealityRating,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  unitElectedObjects;



{TPanelPropsDesigner}
Constructor TPanelPropsDesigner.Create(pPanelProps: TSpaceObjPanelProps);
begin
Inherited Create;
PanelProps:=pPanelProps;
flActive:=false;
timerCheckingPanelState:=TTimer.Create(nil);
with timerCheckingPanelState do begin
Interval:=10; //. интервал проверки состо€ни€ панели
OnTimer:=TimerTick;
end;
end;

Destructor TPanelPropsDesigner.Destroy;
begin
timerCheckingPanelState.Free;
Inherited;
end;

procedure TPanelPropsDesigner.TimerTick(Sender: TObject);
begin
if flActive AND IsDFMFileWasChanged
 then ValidatePanel;
end;

function TPanelPropsDesigner.IsDFMFileWasChanged: boolean;
var
  curDT: integer;
  curDate: TDateTime;
begin
Result:=false;
curDT:=FileAge(DFMFileName);
if curDT = -1 then Exit; //. ->
curDate:=FileDateToDateTime(curDT);
if curDate <> DFMFileDate
 then begin
  Result:=true;
  DFMFileDate:=curDate;
  end;
end;

procedure TPanelPropsDesigner.Start;
var
  DFMFName: string;
  SrsPASFName: string;
  PASFName: string;
  FS: TFileStream;
  MS: TMemoryStream;
  SrsPAS,PAS: TextFile;
  ProgramPath: PChar;
  S: string;
  I: integer;

  function getUnitPanelPropsFile(out FileName: string): boolean;

    function IsFound(const Folder: string): boolean;
    var
      sr: TSearchRec;
      FN: string;
    begin
    Result:=false;
    FN:=Folder+'\'+TTypeData(GetTypeData(PanelProps.ClassInfo)^).UnitName+'.pas';
    if FindFirst(FN, faAnyFile, sr) = 0
     then begin
      FileName:=FN;
      Result:=true;
      SysUtils.FindClose(sr);
      Exit; //. ->
      end;
    if FindFirst(Folder+'\*.*', faDirectory, sr) = 0
     then
      repeat
        if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory) AND IsFound(Folder+'\'+sr.name))
         then begin
          Result:=true;
          SysUtils.FindClose(sr);
          Exit; //. ->
          end;
      until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
    end;

  begin
  Result:=IsFound(TComponentFunctionality(PanelProps.ObjFunctionality).Space.WorkLocale+'\'+PathPanelsProps);
  end;

begin
//. формируем dfm
MS:=TMemoryStream.Create;
DFMFName:=TComponentFunctionality(PanelProps.ObjFunctionality).Space.WorkLocale+'\'+PathDesigner+'\unit'+PanelProps.Name+'.dfm';
PanelProps.SavePanelToStream(MS);
FS:=TFileStream.Create(DFMFName,fmCreate);
ObjectBinaryToText(MS,FS);
FS.Destroy;
MS.Destroy;
//. формируем pas
if NOT GetUnitPanelPropsFile(SrsPASFName) then Raise Exception.Create('can not found panel of props delphi-unit'); //. =>
AssignFile(SrsPAS,SrsPASFName);
Reset(SrsPas);
PASFName:=TComponentFunctionality(PanelProps.ObjFunctionality).Space.WorkLocale+'\'+PathDesigner+'\unit'+PanelProps.Name+'.pas';
AssignFile(PAS,PASFName);
Rewrite(PAS);
try
WriteLn(PAS,'//*********************************************************************');
WriteLn(PAS,'// !!! Attention - this file is exist for props panel editing.         ');
WriteLn(PAS,'//       DO NOT Insert working code here;                              ');
WriteLn(PAS,'//       DO NOT Remove any component from form if you not sure, that   ');
WriteLn(PAS,'//          that component is not used by any project routine;         ');
WriteLn(PAS,'//       DO NOT Insert component in form, which has no implementation  ');
WriteLn(PAS,'//          in project code                                            ');
WriteLn(PAS,'//     AT PRESENT, THE FOLLOWING COMPONENT IMPLEMENTATIONS ARE EXISTS: ');
WriteLn(PAS,'//                                                                     ');
for I:=0 to ComponentsCount-1 do WriteLn(PAS,'//         '+IntToStr(I+1)+') ' +Components[I].nmType);
WriteLn(PAS,'//                                                                     ');
WriteLn(PAS,'//*********************************************************************');
while NOT EOF(SrsPAS) do begin
  ReadLn(SrsPAS, S);
  WriteLn(PAS,S);
  end;
finally
CloseFile(PAS);
CloseFile(SrsPAS);
end;
DFMFileName:=DFMFName;
DFMFileDate:=FileDateToDateTime(FileAge(DFMFileName));
ProgramPath:=PChar(PASFName);
ShellExecute(0,nil,ProgramPath,nil,nil, 1);
flActive:=true;
end;

procedure TPanelPropsDesigner.ValidatePanel;

  procedure InitFromRCDATA;
  begin
  if NOT InitInheritedComponent(PanelProps, TForm) then raise EResNotFound.CreateFmt('resource not found', [ClassName]);
  end;

var
  FS: TFileStream;
  MS: TMemoryStream;
  WorkObjFunctionality: TComponentFunctionality;
  Stream: TMemoryStream;
  SC: TCursor;
  SV: boolean;
  SP: TWinControl;
  SA: TAlign;
  SL,ST,SW,SH: integer;
begin
with PanelProps do begin
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
FS:=TFileStream.Create(DFMFileName,fmOpenRead);
MS:=TMemoryStream.Create;
try
ObjectTextToBinary(FS,MS);
MS.Position:=0;
//. —охран€ем панель объекта
WorkObjFunctionality.SetCustomPanelProps(MS,true); //. сохран€ем в Ѕ.ƒ.
try
Stream:=WorkObjFunctionality.CustomPanelProps;
try
LoadPanelFromStream(Stream);
Update;
finally
Stream.Destroy;
end;
except
  //. release custom panel props if exception occured
  WorkObjFunctionality.ReleaseCustomPanelProps;
  //. default init
  SV:=Visible;
  SP:=Parent;
  SL:=Left;ST:=Top;SW:=Width;SH:=Height;
  SA:=Align;
  Hide;
  try
  InitFromRCData;
  Update;
  finally
  Align:=SA;
  Left:=SL;Top:=ST;Width:=SW;Height:=SH;
  Parent:=SP;
  Visible:=SV;
  end;
  //.
  Application.MessageBox('error(s) when custom-panel loading. Default is applied.','Error');
  end;
Show;
finally
MS.Destroy;
FS.Destroy;
end;
end;
end;









{TDesignHandle}
Constructor TDesignHandle.Create(pOwner: TSpaceObjPanelProps; pKind: TDesignHandleKind);
begin
CreateNew(nil);
Kind:=pKind;
Owner:=pOwner;
Parent:=Owner.Parent;
PopupMenu:=Owner.PopupMenu;
BorderStyle:=bsNone;
OnPaint:=Paint;
OnMouseDown:=MouseDown;
Width:=8;
Height:=Width;
UpdatePosition;
GetCenter(LastPos.X,LastPos.Y);
case Kind of
dhkLeft: begin
  Cursor:=crDrag;
  end;
dhkLeftTop: begin
  Cursor:=crDrag;
  end;
dhkTop: begin
  Cursor:=crDrag;
  end;
dhkTopRight: begin
  Cursor:=crSizeWE;
  end;
dhkRight: begin
  Cursor:=crSizeWE;
  end;
dhkRightBottom: begin
  Cursor:=crSizeNWSE;
  end;
dhkBottom: begin
  Cursor:=crSizeNS;
  end;
dhkBottomLeft: begin
  Cursor:=crSizeNS;
  end;
end;
Color:=clAqua;
Show;
end;

procedure TDesignHandle.GetCenter(out X,Y: integer);
begin
X:=Left+Round(Width/2);
Y:=Top+Round(Height/2);
end;

procedure TDesignHandle.UpdatePosition;
var
  Half: integer;
begin
Half:=Round(Width/2);
case Kind of
dhkLeft: begin
  Left:=Owner.Left-Half;
  Top:=Owner.Top+Round(Owner.Height/2)-Half;
  end;
dhkLeftTop: begin
  Left:=Owner.Left-Half;
  Top:=Owner.Top-Half;
  end;
dhkTop: begin
  Left:=Owner.Left+Round(Owner.Width/2)-Half;
  Top:=Owner.Top-Half;
  end;
dhkTopRight: begin
  Left:=Owner.Left+Owner.Width-Half;
  Top:=Owner.Top-Half;
  end;
dhkRight: begin
  Left:=Owner.Left+Owner.Width-Half;
  Top:=Owner.Top+Round(Owner.Height/2)-Half;
  end;
dhkRightBottom: begin
  Left:=Owner.Left+Owner.Width-Half;
  Top:=Owner.Top+Owner.Height-Half;
  end;
dhkBottom: begin
  Left:=Owner.Left+Round(Owner.Width/2)-Half;
  Top:=Owner.Top+Owner.Height-Half;
  end;
dhkBottomLeft: begin
  Left:=Owner.Left-Half;
  Top:=Owner.Top+Owner.Height-Half;
  end;
end;
end;

procedure TDesignHandle.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  procedure AlignOwner;
  var
    AlignSize: integer;
  begin
  if (Owner.OwnerPanelsProps <> nil) AND (Owner.OwnerPanelsProps.PanelProps.flUseGrid)
   then with Owner do begin
    AlignSize:=Self.Owner.OwnerPanelsProps.PanelProps.GridSize;
    Left:=Round(Left/AlignSize)*AlignSize;
    Top:=Round(Top/AlignSize)*AlignSize;
    Width:=Round(Width/AlignSize)*AlignSize;
    Height:=Round(Height/AlignSize)*AlignSize;
    end;
  end;

const
  SC_DragMove = $F012;  { a magic number }
var
  Updater: TTimer;
begin
Updater:=TTimer.Create(nil);
try
with Updater do begin
OnTimer:=Updater_Tick;
Interval:=30;
end;
flSizeChanged:=false;
flPositionChanged:=false;
ReleaseCapture;
Self.Perform(WM_SysCommand, SC_DragMove, 0);
finally
Updater.Destroy;
if flSizeChanged
 then begin
  AlignOwner;
  Owner.SaveSize;
  flSizeChanged:=false;
  end;
if flPositionChanged
 then begin
  AlignOwner;
  Owner.SavePosition;
  flPositionChanged:=false;
  end;
Owner.Handles_Update;
end;
end;

procedure TDesignHandle.Updater_Tick(Sender: TObject);
var
  X,Y: integer;
begin
GetCenter(X,Y);
if (X <> LastPos.X) OR (Y <> LastPos.Y)
 then begin
  case Kind of
  dhkLeft: begin
    Owner.Left:=X;
    flPositionChanged:=true;
    end;
  dhkLeftTop: begin
    Owner.Left:=X;
    Owner.Top:=Y;
    flPositionChanged:=true;
    end;
  dhkTop: begin
    Owner.Top:=Y;
    flPositionChanged:=true;
    end;
  dhkTopRight: begin
    Owner.Width:=X-Owner.Left;
    flSizeChanged:=true;
    end;
  dhkRight: begin
    Owner.Width:=X-Owner.Left;
    flSizeChanged:=true;
    end;
  dhkRightBottom: begin
    Owner.Width:=X-Owner.Left;
    Owner.Height:=Y-Owner.Top;
    flSizeChanged:=true;
    end;
  dhkBottom: begin
    Owner.Height:=Y-Owner.Top;
    flSizeChanged:=true;
    end;
  dhkBottomLeft: begin
    Owner.Height:=Y-Owner.Top;
    flSizeChanged:=true;
    end;
  end;
  //.
  LastPos.X:=X;
  LastPos.Y:=Y;
  //.
  Owner.Handles_Update;
  Owner.Repaint;
  end;
end;

procedure TDesignHandle.Paint(Sender: TObject);
begin
with Canvas do begin
Pen.Color:=clBlack;
Rectangle(0,0,Width,Height);
end;
end;







{TPropsPanelsUpdating}
Constructor TPropsPanelsUpdating.Create(const pPanelProps: TSpaceObjPanelProps);
begin
PanelProps:=pPanelProps;
flDone:=false;
ReformPanelPropsCount:=0;
Inherited Create(true);
Resume;
end;

Destructor TPropsPanelsUpdating.Destroy;
var
  EC: DWord;
begin
Terminate;
if (WaitFor())
 then Inherited
 else begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end;
end;

function TPropsPanelsUpdating.WaitFor: boolean;
const
  MaxWaitTime = 5;
var
  H: array[0..1] of THandle;
  WaitResult: Cardinal;
  I: integer;
  Msg: TMsg;
begin
  Result:=false;
  H[0] := Handle;
  if GetCurrentThreadID = MainThreadID then
  begin
    WaitResult := 0;
    H[1] := SyncEvent;
    I:=0;
    repeat
      { This prevents a potential deadlock if the background thread
        does a SendMessage to the foreground thread }
      if WaitResult = WAIT_OBJECT_0 + 2 then
        PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
      WaitResult := MsgWaitForMultipleObjects(2, H, False, 1000, QS_SENDMESSAGE);
      if WaitResult = WAIT_OBJECT_0
       then begin
        Result:=true;
        Exit; //. ->
        end;
      CheckThreadError(WaitResult <> WAIT_FAILED);
      if WaitResult = WAIT_OBJECT_0 + 1 then
        CheckSynchronize;
      if (WaitResult = WAIT_TIMEOUT) then Inc(I);
    until I >= MaxWaitTime;
  end else begin
    for I:=0 to MaxWaitTime-1 do 
      if WaitForSingleObject(H[0], 1000) = WAIT_OBJECT_0
       then begin
        Result:=true;
        Exit; //. ->
        end;
  end
end;

procedure TPropsPanelsUpdating.Execute;
const
  WaitInterval = 100;

type
  TComponentPanelStruc = record
    ptrNext: pointer;
    _idTObj: integer;
    _idObj: integer;
    Left: integer;
    Top: integer;
    Width: integer;
    Height: integer;
  end;

var
  ComponentsList: TComponentsList;
  I: integer;
  ComponentPanels: pointer;
  _Left,_Top,_Width,_Height: integer;
  ptrptrItem: pointer;
  ptrNewItem,ptrItem,ptrDestroyItem: pointer;
begin  
try
flCancel:=false;
Synchronize(DoOnStart);
try
with TComponentFunctionality_Create(PanelProps.ObjFunctionality.idTObj,PanelProps.ObjFunctionality.idObj) do
try
GetComponentsList(ComponentsList);
try
ComponentCount:=ComponentsList.Count;
//. get component panels info
ComponentPanels:=nil;
try
MinX:=MaxInt; MinY:=MaxInt;
MaxX:=-MaxInt; MaxY:=-MaxInt;
//. processing own controls
with PanelProps do  
for I:=0 to ControlCount-1 do if NOT (Controls[I] is TfmPanelPropsProgress) then  with Controls[I] do
  if Align <> alClient
   then begin
    if (Align <> alTop) AND (Align <> alBottom)
     then begin
      if (Left+Width) > MaxX
       then MaxX:=(Left+Width);
      if Left < MinX
       then MinX:=Left;
      end;
    if (Align <> alLeft) AND (Align <> alRight)
     then begin
      if (Top+Height) > MaxY
       then MaxY:=(Top+Height);
      if Top < MinY
       then MinY:=Top;
      end;
    end
   else
    if Controls[I] is TWinControl then MaxY:=Trunc(cfFitScreen*Screen.Height);
//.
for I:=0 to ComponentsList.Count-1 do begin
  if Terminated OR flCancel then Exit; //. ->
  try
  with TComponentFunctionality_Create(TItemComponentsList(ComponentsList[I]^).idTComponent,TItemComponentsList(ComponentsList[I]^).idComponent) do
  try
  if NOT GetPanelPropsLeftTop(_Left,_Top)
   then begin
    _Left:=MaxInt;
    _Top:=MaxInt;
    end;
  if NOT GetPanelPropsWidthHeight(_Width,_Height)
   then begin
    _Width:=640;
    _Height:=480;
    end;
  finally
  Release;
  end;
  GetMem(ptrNewItem,SizeOf(TComponentPanelStruc));
  with TComponentPanelStruc(ptrNewItem^) do begin
  ptrNext:=nil;
  _idTObj:=TItemComponentsList(ComponentsList[I]^).idTComponent;
  _idObj:=TItemComponentsList(ComponentsList[I]^).idComponent;
  Left:=_Left; Top:=_Top; Width:=_Width; Height:=_Height;
  //. get min-max of panels
  if (Left < MinX) then MinX:=Left;
  if ((Left+Width) > MaxX) then MaxX:=(Left+Width);
  if (Top < MinY) then MinY:=Top;
  if ((Top+Height) > MaxY) then MaxY:=(Top+Height);
  //. insert panel using sort
  ptrptrItem:=@ComponentPanels;
  while Pointer(ptrptrItem^) <> nil do begin
    if (Top < TComponentPanelStruc(Pointer(ptrptrItem^)^).Top) OR ((Top = TComponentPanelStruc(Pointer(ptrptrItem^)^).Top) AND (Left < TComponentPanelStruc(ptrNewItem^).Left)) then Break; //. >
    //. next
    ptrptrItem:=@TComponentPanelStruc(Pointer(ptrptrItem^)^).ptrNext;
    end;
  end;
  TComponentPanelStruc(ptrNewItem^).ptrNext:=Pointer(ptrptrItem^);
  Pointer(ptrptrItem^):=ptrNewItem;
  except
    end;
  end;
//. align props panels without Left&Top defined
ptrItem:=ComponentPanels;
_Top:=0;
while (ptrItem <> nil) do with TComponentPanelStruc(ptrItem^) do begin
  if ((Left = MaxInt) OR (Left < 0)) then Left:=8{delimiter space};
  if ((Top = MaxInt) OR (Top < 0)) then Top:=_Top;
  _Top:=(Top+Height+8{delimiter space});
  //. next
  ptrItem:=TComponentPanelStruc(ptrItem^).ptrNext;
  end;
//.
Synchronize(AdjustBounds);
//. creating component panels
ComponentIndex:=0;
ptrItem:=ComponentPanels;
while ptrItem <> nil do with TComponentPanelStruc(ptrItem^) do begin
  if (Terminated OR flCancel) then Exit; //. ->
  try
  ObjFunctionality:=TComponentFunctionality_Create(_idTObj,_idObj);
  ObjFunctionality.UpdateDATA;
  ObjFunctionality._DefaultPanelPropsLeft:=Left;
  ObjFunctionality._DefaultPanelPropsTop:=Top;
  Synchronize(ShowPanel);
  except
    end;
  //.
  Sleep(WaitInterval);
  //. next
  ptrItem:=ptrNext;
  Inc(ComponentIndex);
  //.
  Synchronize(DoOnProgress);
  end;
flDone:=true;
finally
while (ComponentPanels <> nil) do begin
  ptrDestroyItem:=ComponentPanels;
  ComponentPanels:=TComponentPanelStruc(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TComponentPanelStruc));
  end;
end;
finally
ComponentsList.Destroy;
end;
finally
Release;
end;
finally
Synchronize(DoOnFinish);
end;
Synchronize(ReAdjustBounds);
finally
if InterLockedDecrement(ReformPanelPropsCount) >= 0 then Synchronize(ReformPanelProps);
end;
end;

function TPropsPanelsUpdating.IsProcessing: boolean;
begin
if (Self = nil)
 then begin
  Result:=false;
  Exit; //. ->
  end;
Result:=(WaitForSingleObject(Handle,0) <> WAIT_OBJECT_0);
end;

procedure TPropsPanelsUpdating.AdjustBounds;

  procedure _NormalizeSize;
  begin
  with PanelProps do
  if (MaxX <> 0) AND (MaxY <> 0)
   then begin
    ClientWidth:=MaxX+MinX;
    if (MaxY+MinY) < cfFitScreen*Screen.Height
     then ClientHeight:=MaxY+MinY
     else ClientHeight:=Trunc(cfFitScreen*Screen.Height);
    end;
  end;

var
  OldWidth,OldHeight: integer;
begin
if (Terminated OR flCancel) then Exit; //. ->
if (PanelProps.Parent = nil)
 then with PanelProps do begin
  OldWidth:=Width;
  OldHeight:=Height;
  _NormalizeSize;
  Left:=Left-Round((Width-OldWidth)/2);
  Top:=Screen.Height-Height;
  TfmPanelPropsProgress(fmProgress).ReAlign;
  end;
end;

procedure TPropsPanelsUpdating.ReAdjustBounds;
var
  OldWidth,OldHeight: integer;
begin
if (Terminated OR flCancel) then Exit; //. ->
if (PanelProps.Parent = nil)
 then with PanelProps do begin
  OldWidth:=Width;
  OldHeight:=Height;
  NormalizeSize;
  Left:=Left-Round((Width-OldWidth)/2);
  Top:=Screen.Height-Height;
  if (fmProgress <> nil) then TfmPanelPropsProgress(fmProgress).ReAlign;
  end;
end;

procedure TPropsPanelsUpdating.DoOnStart;
begin
if (Terminated OR flCancel) then Exit; //. ->
fmProgress:=TfmPanelPropsProgress.Create(Self);
end;

procedure TPropsPanelsUpdating.DoOnFinish;
begin
FreeAndNil(fmProgress);
if (Terminated OR flCancel) then Exit; //. ->
end;

procedure TPropsPanelsUpdating.DoOnProgress;
begin
if (Terminated OR flCancel) then Exit; //. ->
TfmPanelPropsProgress(fmProgress).Gauge.MaxValue:=ComponentCount;
TfmPanelPropsProgress(fmProgress).Gauge.Progress:=ComponentIndex;
end;

procedure TPropsPanelsUpdating.ShowPanel;
var
  Panel: TSpaceObjPanelProps;
begin
if (Terminated OR flCancel)
 then begin
  ObjFunctionality.Release;
  Exit; //. ->
  end;
with ObjFunctionality do
try
Inc(Space.Log.OperationsCount);
try
Panel:=TSpaceObjPanelProps(TPanelProps_Create(PanelProps.flReadOnly,0,PanelProps.PanelsProps,nilObject));
if Panel <> nil
 then begin
  Panel.flFreeOnClose:=false; //. чтобы панель не освобождалась, если ее закроют
  PanelProps.PanelsProps.Add(Panel);
  Panel.Show;
  end;
finally
Dec(Space.Log.OperationsCount);
end;
finally
Release;
end;
end;

procedure TPropsPanelsUpdating.ReformPanelProps;
begin
if (Terminated OR flCancel) then Exit; //. ->
PanelProps.ReformOwnPanelsProps;
end;


{TSpaceObjPanelProps}
Constructor TSpaceObjPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);

  function PositionY: integer;
  var
    I: integer;
    maxY: integer;
  begin
  if OwnerPanelsProps <> nil
   then with OwnerPanelsProps do begin
    maxY:=5;
    for I:=0 to ControlCount-1 do
      if NOT ((Controls[I].Align = alClient) OR (Controls[I].Align = alLeft) OR (Controls[I].Align = alRight)) AND ((Controls[I].Left+Controls[I].Top) > maxY) then maxY:=(Controls[I].Left+Controls[I].Top);
    Result:=maxY;
    end
   else
    Result:=5;
  end;

begin
Lock:=TCriticalSection.Create;
ObjFunctionality:=pObjFunctionality;
//.
if NOT ObjectIsNil(pProxyObject)
 then begin //. получаем функциональность дл€ ProxyObject
  ProxyObjectFunctionality:=TComponentFunctionality_Create(pProxyObject.idType,pProxyObject.idObj);
  end
 else
  ProxyObjectFunctionality:=nil;
TFunctionality(ObjFunctionality).AddRef;
flReadOnly:=pflReadOnly;
idOwnerObjectProp:=pidOwnerObjectProp;
OwnerPanelsProps:=TSpaceObjPanelsProps(pOwnerPanelsProps);
PositionChanged:=false;
SizeChanged:=false;
Handles:=nil;
flUseGrid:=false;
GridSize:=8;
//.
CreateFromResource;
KeyPreview:=true;
if (OwnerPanelsProps <> nil)
 then begin
  Parent:=OwnerPanelsProps.PanelProps;
  if NOT Assigned(OnKeyDown) then OnKeyDown:=OwnerPanelsProps.PanelProps.OnKeyDown;
  if NOT Assigned(OnKeyUp) then OnKeyUp:=OwnerPanelsProps.PanelProps.OnKeyUp;
  end
 else Parent:=nil;
//. make uniqueue name
Name:=Name+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now);
//.
FflFreeOnClose:=true;
//.
if NOT ObjFunctionality.flDATAPresented
 then flUsePropsPanelsUpdating:=(ObjFunctionality.ComponentsCount >= PropsPanelsUpdating_MinComponentsCount)
 else flUsePropsPanelsUpdating:=(ObjFunctionality._ComponentsCount >= PropsPanelsUpdating_MinComponentsCount);
PropsPanelsUpdating:=nil;
//. 
PanelsProps:=TSpaceObjPanelsProps.Create(Self);
//. 
if (NOT LoadPosition)
 then begin
  Left:=5;
  Top:=PositionY;
  end;
if (((NOT LoadSize()) OR (OwnerPanelsProps = nil)) AND NOT flUsePropsPanelsUpdating) then NormalizeSize();
//. 
Controls_ClearPropData;
//.
UpdatesCount:=0;
Updater:=ObjFunctionality.TPresentUpdater_Create(Update,PostHideMessage);
//.
if (OwnerPanelsProps <> nil) then ObjFunctionality.Space.PropsPanels.Add(Self);
end;

destructor TSpaceObjPanelProps.Destroy;
begin
if (flProgressForm)
 then begin
  ObjFunctionality.Space.Log.OperationDone;
  flProgressForm:=false;
  end;
//.
if (OwnerPanelsProps <> nil) then ObjFunctionality.Space.PropsPanels.Remove(Self);
//.
Updater.Free;
popupComponentsPanel.Free;
Handles_Free;
PropsPanelsUpdating.Free;
PanelsProps.Free;
Designer.Free;
ObjFunctionality.Release;
if ProxyObjectFunctionality <> nil then ProxyObjectFunctionality.Release;
Lock.Free;
Inherited;
end;

procedure TSpaceObjPanelProps.AfterConstruction;
begin
Inherited;
{/// ? if flProgressForm
 then begin
  ObjFunctionality.Space.Log.OperationDone;
  flProgressForm:=false;
  end;}
end;

procedure TSpaceObjPanelProps.BeforeDestruction;
begin
try
SaveChanges;
except
  end;
Inherited;
end;

procedure TSpaceObjPanelProps.setflFreeOnClose(Value: boolean);
begin
if Value = FflFreeOnClose then Exit; //. ->
Inherited;
end;

procedure TSpaceObjPanelProps.Update;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmUpdate(WM) else PostMessage(Handle, WM_UPDATEPANEL,0,0);
end;

procedure TSpaceObjPanelProps._Update;
var
  OldClientHeight,OldClientWidth: integer;
  I: integer;
  SysMenu: THandle;
begin
//. reform own props panel
if (UpdatesCount > 0) AND (NOT flUsePropsPanelsUpdating  OR (InterLockedIncrement(PropsPanelsUpdating.ReformPanelPropsCount) <= 0))
 then begin
  if (flUsePropsPanelsUpdating) then InterLockedDecrement(PropsPanelsUpdating.ReformPanelPropsCount);
  ReformOwnPanelsProps;
  end;
//.
Inc(UpdatesCount);
//.
if (OwnerPanelsProps <> nil)
 then begin
  BorderStyle:=bsNone;
  Color:=OwnerPanelsProps.PanelProps.Color;
  Constraints.MaxWidth:=MaxInt;
  Constraints.MaxHeight:=MaxInt;
  end
 else begin
  OldClientWidth:=ClientWidth;
  OldClientHeight:=ClientHeight;
  BorderStyle:=bsSizeable;
  ClientHeight:=OldClientHeight;
  ClientWidth:=OldClientWidth;
  AutoScroll:=true;
  HorzScrollBar.Tracking:=true;
  VertScrollBar.Tracking:=true;
  //.
  SysMenu:=GetSystemMenu(Handle,False);
  if (GetMenuItemID(SysMenu,0) <> ID_COPYTOCLIPBOARD)
   then InsertMenu(SysMenu,0,MF_BYPOSITION,ID_COPYTOCLIPBOARD, 'Copy to clipboard');
  end;
//. назначаем свойства
OnClose:=PanelClose;
OnMouseMove:=MouseMove;
OnMouseDown:=MouseDown;
OnMouseWheel:=MouseWheel;
OnShow:=FormShow;
OnHide:=FormHide;
OnDblClick:=FormDblClick;
OnPaint:=FormPaint;
popupComponentsPanel.Free;
popupComponentsPanel:=TpopupComponentsPanel.Create(Self);
for I:=0 to ControlCount-1 do if Controls[I] is TLabel then TLabel(Controls[I]).PopupMenu:=popupComponentsPanel;
for I:=0 to ControlCount-1 do if Controls[I] is TLabel then TLabel(Controls[I]).OnMouseDown:=MouseDown;
for I:=0 to ControlCount-1 do if Controls[I] is TPanel then TPanel(Controls[I]).OnMouseDown:=MouseDown;
for I:=0 to ControlCount-1 do if Controls[I] is TBevel then TBevel(Controls[I]).Enabled:=false;
//.
ShowHint:=false;
Hint:=ObjFunctionality.Name;
if Hint = '' then Hint:=ObjFunctionality.TypeFunctionality.Name;
Hint:=Hint+' (Type: '+IntToStr(ObjFunctionality.idTObj)+',ID: '+IntToStr(ObjFunctionality.idObj)+')';
ShowHint:=false; //. work around the bug
end;

procedure TSpaceObjPanelProps.ReformOwnPanelsProps;
var
  OldComponentsCount,NewComponentsCount: integer;
  OldComponentsHash,NewComponentsHash: integer;
  ComponentsList: TComponentsList;
  PanelsCount: integer;
  flFound: boolean;
  I,J: integer;
begin
OldComponentsCount:=PanelsProps.Count;
ObjFunctionality.GetComponentsList(ComponentsList);
try
NewComponentsCount:=ComponentsList.Count;
if NewComponentsCount = OldComponentsCount
 then begin
  OldComponentsHash:=0;
  for J:=0 to PanelsProps.Count-1 do with TSpaceObjPanelProps(PanelsProps[J]).ObjFunctionality do OldComponentsHash:=((OldComponentsHash XOR idTObj) XOR idObj);
  NewComponentsHash:=0;
  for I:=0 to ComponentsList.Count-1 do with TItemComponentsList(ComponentsList[I]^) do NewComponentsHash:=((NewComponentsHash XOR idTComponent) XOR idComponent);
  end
 else begin
  NewComponentsHash:=NewComponentsCount;
  OldComponentsHash:=OldComponentsCount;
  end;
if NewComponentsHash <> OldComponentsCount
 then begin
  //. insert props panel
  for I:=0 to ComponentsList.Count-1 do with TItemComponentsList(ComponentsList[I]^) do begin
    flFound:=false;
    PanelsCount:=PanelsProps.Count;
    for J:=0 to PanelsCount-1 do with TSpaceObjPanelProps(PanelsProps[J]).ObjFunctionality do
      if (idTComponent = idTObj) AND (idComponent = idObj)
       then begin
        flFound:=true;
        Break; //. >
        end;
    if NOT flFound then PanelsProps._InsertPanel(idTComponent,idComponent,id); //. inserting
    end;
  //. remove props panel
  J:=0;
  while J < PanelsProps.Count do with TSpaceObjPanelProps(PanelsProps[J]).ObjFunctionality do begin
    flFound:=false;
    for I:=0 to ComponentsList.Count-1 do with TItemComponentsList(ComponentsList[I]^) do
      if (idTComponent = idTObj) AND (idComponent = idObj)
       then begin
        flFound:=true;
        Break; //. >
        end;
    if NOT flFound
     then begin
      //. removing
      TObject(PanelsProps.Items[J]).Free;
      PanelsProps.Delete(J);
      end
     else
      Inc(J);
    end;
  end;
finally
ComponentsList.Destroy;
end;
end;

function TSpaceObjPanelProps.CreateFromResource: boolean;
var
  WorkObjFunctionality: TComponentFunctionality;
  idPanelProps: integer;
  Stream: TMemoryStream;
  R: boolean;

  procedure InitFromRCDATA;
  begin
  if InitInheritedComponent(Self, TForm)
   then
    Result:=true
   else
    raise EResNotFound.CreateFmt('resource not found', [ClassName]);
  end;

begin
Result:=false;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
with TPanelsPropsRepository.Create(ObjFunctionality.Space) do
try
if NOT WorkObjFunctionality.flDATAPresented
 then
  if WorkObjFunctionality.IsCustomPanelPropsExist
   then begin
    Stream:=WorkObjFunctionality.CustomPanelProps;
    R:=true;
    end
   else
    R:=false
 else
  if WorkObjFunctionality._DefaultPanelProps_IsCustomPanelPropsExist
   then begin
    Stream:=TMemoryStream.Create;
    try
    WorkObjFunctionality._DefaultPanelProps_CustomPanelProps.Position:=0;
    Stream.CopyFrom(WorkObjFunctionality._DefaultPanelProps_CustomPanelProps,WorkObjFunctionality._DefaultPanelProps_CustomPanelProps.Size);
    Stream.Position:=0;
    except
      FreeAndNil(Stream);
      Raise; //. =>
      end;
    R:=true;
    end
   else
    R:=false;
finally
Destroy;
end;
//. Transferred from Form unit
GlobalNameSpace.BeginWrite;
try
  CreateNew(nil);
  if (ClassType <> TForm) and not (csDesigning in ComponentState) then
  begin
    Include(FFormState, fsCreating);
    try
      if R
       then
        try
        try
        LoadPanelFromStream(Stream);
        Result:=true;
        finally
        Stream.Destroy;
        end;
        except
          //. release custom panel props if exception occured
          WorkObjFunctionality.ReleaseCustomPanelProps;
          //. default init
          InitFromRCDATA;
          end
       else
        InitFromRCDATA;
    finally
      Exclude(FFormState, fsCreating);
    end;
    if OldCreateOrder then DoCreate;
  end;
finally
  GlobalNameSpace.EndWrite;
end;
end;

procedure TSpaceObjPanelProps.SavePanel;
var
  WorkObjFunctionality: TComponentFunctionality;
  Stream: TMemoryStream;
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
Stream:=TMemoryStream.Create;
try
SavePanelToStream(Stream);
TComponentFunctionality(WorkObjFunctionality).SetCustomPanelProps(Stream,true);
flControlsChanged:=false;
finally
Stream.Destroy;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TSpaceObjPanelProps.SaveChanges;
var
  I: integer;
begin
if PositionChanged then SavePosition;
if SizeChanged then SaveSize;
if flControlsChanged then SavePanel;
// сохран€ем собственные компоненты
with PanelsProps do for I:=0 to Count-1 do with TSpaceObjPanelProps(Items[I]) do SaveChanges;
end;

procedure TSpaceObjPanelProps.ShowPanelControlElements;
var
  I: integer;
begin
Handles_Prepare;
with PanelsProps do for I:=0 to Count-1 do with TSpaceObjPanelProps(Items[I]) do ShowPanelControlElements;
if (OwnerPanelsProps <> nil) AND NOT OwnerPanelsProps.PanelProps.flUseGrid
 then begin
  OwnerPanelsProps.PanelProps.flUseGrid:=true;
  OwnerPanelsProps.PanelProps.RePaint;
  end;
end;

procedure TSpaceObjPanelProps.SavePosition;
var
  WorkObjFunctionality: TComponentFunctionality;
begin
if OwnerPanelsProps = nil then Exit; //. ->
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if OwnerPanelsProps <> nil
 then WorkObjFunctionality.SetPanelPropsLeftTop(OwnerPanelsProps.PanelProps.HorzScrollBar.ScrollPos+Left,OwnerPanelsProps.PanelProps.VertScrollBar.ScrollPos+Top)
 else WorkObjFunctionality.SetPanelPropsLeftTop(Left,Top);
PositionChanged:=false;
end;

procedure TSpaceObjPanelProps.SaveSize;
var
  WorkObjFunctionality: TComponentFunctionality;
begin
if OwnerPanelsProps = nil then Exit; //. ->
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
WorkObjFunctionality.SetPanelPropsWidthHeight(Width,Height);
SizeChanged:=false;
end;

function TSpaceObjPanelProps.LoadPosition: boolean;
var
  WorkObjFunctionality: TComponentFunctionality;
  L,T: integer;
begin
Result:=false;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if NOT WorkObjFunctionality.flDATAPresented
 then begin
  if WorkObjFunctionality.GetPanelPropsLeftTop(L,T)
   then begin
    if Parent <> nil
     then begin
      Left:=L-TSpaceObjPanelProps(Parent).HorzScrollBar.Position;
      Top:=T-TSpaceObjPanelProps(Parent).VertScrollBar.Position;
      end
     else begin
      Left:=L;
      Top:=T;
      end;
    PositionChanged:=false;
    Result:=true;
    end;
  end
 else begin
  if WorkObjFunctionality._DefaultPanelPropsLeft <> MaxInt
   then begin
    if Parent <> nil
     then begin
      Left:=WorkObjFunctionality._DefaultPanelPropsLeft-TSpaceObjPanelProps(Parent).HorzScrollBar.Position;
      Top:=WorkObjFunctionality._DefaultPanelPropsTop-TSpaceObjPanelProps(Parent).VertScrollBar.Position;
      end
     else begin
      Left:=WorkObjFunctionality._DefaultPanelPropsLeft;
      Top:=WorkObjFunctionality._DefaultPanelPropsTop;
      end;
    PositionChanged:=false;
    Result:=true;
    end;
  end;
end;

function TSpaceObjPanelProps.LoadSize: boolean;
var
  WorkObjFunctionality: TComponentFunctionality;
  W,H: integer;
begin
Result:=false;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if NOT WorkObjFunctionality.flDATAPresented
 then begin
  if WorkObjFunctionality.GetPanelPropsWidthHeight(W,H)
   then begin
    Width:=W;
    Height:=H;
    SizeChanged:=false;
    Result:=true;
    end
  end
 else begin
  if WorkObjFunctionality._DefaultPanelPropsWidth <> MaxInt
   then begin
    Width:=WorkObjFunctionality._DefaultPanelPropsWidth;
    Height:=WorkObjFunctionality._DefaultPanelPropsHeight;
    SizeChanged:=false;
    Result:=true;
    end;
  end;
end;

procedure TSpaceObjPanelProps.NormalizeSize;
var
  I: integer;
  minWidth,maxWidth,minHeight,maxHeight: integer;
  alClientExist: boolean;
begin
minWidth:=maxInt;
maxWidth:=0;
minHeight:=maxInt;
maxHeight:=0;
alClientExist:=false;
for I:=0 to ControlCount-1 do if NOT (Controls[I] is TfmPanelPropsProgress) then  with Controls[I] do
  if Align <> alClient
   then begin
    if (Align <> alTop) AND (Align <> alBottom)
     then begin
      if (Left+Width) > maxWidth
       then maxWidth:=(Left+Width);
      if Left < minWidth
       then minWidth:=Left;
      end;
    if (Align <> alLeft) AND (Align <> alRight)
     then begin
      if (Top+Height) > maxHeight
       then maxHeight:=(Top+Height);
      if Top < minHeight
       then minHeight:=Top;
      end;
   end
  else
   if Controls[I] is TWinControl then alClientExist:=true;
minHeight:=minHeight+VertScrollBar.Position; maxHeight:=maxHeight+VertScrollBar.Position;
minWidth:=minWidth+HorzScrollBar.Position; maxWidth:=maxWidth+HorzScrollBar.Position;
if (maxWidth <> 0) AND (maxHeight <> 0)
 then begin
  ClientWidth:=maxWidth+minWidth;
  if ((maxHeight+minHeight) < cfFitScreen*Screen.Height) AND NOT alClientExist
   then ClientHeight:=maxHeight+minHeight
   else ClientHeight:=Trunc(cfFitScreen*Screen.Height);
  end;
end;

procedure TSpaceObjPanelProps.LoadPanelFromStream(Stream: TStream);
var
  Reader: TReader;
  SV: boolean;
  SP: TWinControl;
  SA: TAlign;
  SL,ST,SW,SH: integer;
begin
DestroyComponents;
begin //. Stream.ReadComponent(Self): Transferred from Classes - TStream.ReadComponent
Reader:=TReader.Create(Stream, 4096);
Reader.OnFindComponentClass:=ComponentsRepository.FindComponentClass;
try
//. сохран€ем некоторые свойства
SV:=Visible;
SP:=Parent;
SL:=Left;ST:=Top;SW:=Width;SH:=Height;
SA:=Align;
Hide;
try
Reader.ReadRootComponent(Self);
finally
//. восстанавливаем некоторые свойства
Align:=SA;
Left:=SL;Top:=ST;Width:=SW;Height:=SH;
Parent:=SP;
Visible:=SV;
//.
Reader.Free;
end;
except
  DestroyComponents;
  Raise; //. =>
  end;
end;
Stream.Position:=0;
end;

procedure TSpaceObjPanelProps.SavePanelToStream(Stream: TStream);
var
  SV: boolean;
  SP: TWinControl;
  SA: TAlign;
begin
SV:=Visible;
SP:=Parent;
SA:=Align;
Hide;
Parent:=nil;
Align:=alNone;
//.
(Self as TSpaceObjPanelProps)._Update;
Controls_ClearPropData; //. чистим элементы управлени€ от значений свойств
//.
try
Stream.WriteComponent(Self);
Update;
finally
//. восстанавливаем некоторые свойства
Align:=SA;
Parent:=SP;
Visible:=SV;

Stream.Position:=0;
end;
end;

procedure TSpaceObjPanelProps.SetPanelAsDefault;
var
  WorkObjFunctionality: TComponentFunctionality;
  SN: string;
  SV: boolean;
  SP: TWinControl;
  SA: TAlign;
  SL,ST,SW,SH: integer;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if NOT WorkObjFunctionality.IsCustomPanelPropsExist then Exit; //. ->
WorkObjFunctionality.ReleaseCustomPanelProps;
//. сохран€ем некоторые свойства
SN:=Name;
SV:=Visible;
SP:=Parent;
SL:=Left;ST:=Top;SW:=Width;SH:=Height;
SA:=Align;
Hide;
try
DestroyComponents;
InitInheritedComponent(Self, TForm);
Update;
finally
//. восстанавливаем некоторые свойства
Align:=SA;
Left:=SL;Top:=ST;Width:=SW;Height:=SH;
Parent:=SP;
Visible:=SV;
Name:=SN;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TSpaceObjPanelProps.Handles_Prepare;
var
  I: TDesignhandleKind;
  NewHandle: TDesignHandle;
begin
Handles_Free;
if (Parent = nil) OR NOT Visible then Exit; //. ->
Handles:=TList.Create;
for I:=Low(TDesignhandleKind) to High(TDesignhandleKind) do begin
  NewHandle:=TDesignHandle.Create(Self, I);
  Handles.Add(NewHandle);
  end;
end;

procedure TSpaceObjPanelProps.Handles_Update;
var
  I: integer;
begin
for I:=0 to Handles.Count-1 do TDesignHandle(Handles[I]).UpdatePosition;
end;

procedure TSpaceObjPanelProps.Handles_Free;
var
  I: integer;
begin
if Handles <> nil
 then begin
  for I:=0 to Handles.Count-1 do TObject(Handles[I]).Destroy;
  Handles.Destroy;
  Handles:=nil;
  end;
//.
if PanelsProps <> nil
 then for I:=0 to PanelsProps.Count-1 do TSpaceObjPanelProps(PanelsProps[I]).Handles_Free;
end;

procedure TSpaceObjPanelProps.wmUPDATE(var Message: TMessage);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
//. updating ...
try
flUpdating:=true;
try
_Update;
finally
flUpdating:=false;
end;
except
  On E: Exception do EventLog.WriteMajorEvent('PropsPanelUpdate','Unable to update a component properties panel (Type: '+ObjFunctionality.TypeFunctionality.Name+', ID: '+IntToStr(ObjFunctionality.idObj)+').',E.Message);
  end;
//.
finally
Screen.Cursor:=SC;
end;
//. clear used data
ObjFunctionality.ClearDATA;
end;

procedure TSpaceObjPanelProps.wmHIDE(var Message: TMessage);
begin
if (flFreeOnClose) then Free else Close;
end;

procedure TSpaceObjPanelProps.wmDropFiles(var Msg: TMessage);
var
  i,n: DWord;
  Size: DWord;
  FName: String;
  HDrop: DWord;
begin
HDrop:=Msg.WParam;
n:=DragQueryFile(HDrop,$FFFFFFFF,NIL,0);
for i:=0 to n-1 do begin
  Size:=DragQueryFile(HDrop,i,NIL,0);
  if Size < 255
   then begin
    SetLength(FName,Size);
    DragQueryFile(HDrop,i,@FName[1],Size + 1);
    //.
    ImportAndInsertComponentsFromFile(FName);
    end;
  end;
Msg.Result:=0;
inherited;
end;

procedure TSpaceObjPanelProps.wmSysCommand(var Message: TMessage);
var
  WorkObjFunctionality: TComponentFunctionality;
begin
case Message.wParam of
ID_COPYTOCLIPBOARD: begin
  if (ProxyObjectFunctionality = nil)
   then WorkObjFunctionality:=ObjFunctionality
   else WorkObjFunctionality:=ProxyObjectFunctionality;
  TypesSystem.ClipBoard_Instance_idTObj:=WorkObjFunctionality.idTObj;
  TypesSystem.ClipBoard_Instance_idObj:=WorkObjFunctionality.idObj;
  TypesSystem.ClipBoard_flExist:=true;
  end;
end;
inherited;
end;

procedure TSpaceObjPanelProps.PanelClose(Sender: TObject; var Action: TCloseAction);
begin
if (PropsPanelsUpdating <> nil) then PropsPanelsUpdating.flCancel:=true;
if flFreeOnClose then Action:=caFree;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_CloseClick(Sender: TObject);
begin
SaveChanges;
Close;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_TagClick(Sender: TObject);
begin
with TfmComponentTag.Create(ObjFunctionality.idTObj,ObjFunctionality.idObj) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_RealityRatingClick(Sender: TObject);
begin
with TfmComponentRealityRating.Create(ObjFunctionality.idTObj,ObjFunctionality.idObj) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_UpdateNotificationSubscriptionClick(Sender: TObject);
begin
if (TSpaceNotificationSubscription(ObjFunctionality.Space.NotificationSubscription).IsComponentExist(ObjFunctionality.idTObj,ObjFunctionality.idObj))
 then begin
  if (MessageDlg('Do you want to unsubscribe the component ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
   then begin
    TSpaceNotificationSubscription(ObjFunctionality.Space.NotificationSubscription).RemoveComponent(ObjFunctionality.idTObj,ObjFunctionality.idObj);
    //. update popup menu item
    TMenuItem(Sender).Caption:='Update notifications subscription is OFF';
    //.
    ShowMessage('Component has been unsubscribed.');
    end;
  end
 else begin
  if (MessageDlg('Do you want to subscribe the component for update notifications ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
   then begin
    TSpaceNotificationSubscription(ObjFunctionality.Space.NotificationSubscription).AddComponent(ObjFunctionality.idTObj,ObjFunctionality.idObj);
    //. update popup menu item
    TMenuItem(Sender).Caption:='Update notifications subscription is ON';
    //.
    ShowMessage('Component has been subscribed successfully.');
    end;
  end;
end;

procedure TSpaceObjPanelProps.ShowGrid;
const
  GridNodeColor = clNavy;
var
  ICount,JCount: integer;
  I,J: integer;
  X,Y: integer;
begin
ICount:=(Height DIV GridSize)+1;
JCount:=(Width DIV GridSize)+1;
for I:=0 to ICount-1 do
  for J:=0 to JCount-1 do begin
    X:=J*GridSize; Y:=I*GridSize;
    with Canvas do begin
    Pen.Color:=GridNodeColor;
    Brush.Color:=GridNodeColor;
    Pixels[X,Y]:=GridNodeColor;
    end;
    end;
end;

procedure TSpaceObjPanelProps.PostHideMessage;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmHide(WM) else PostMessage(Handle, WM_HIDEPANEL,0,0);
end;

procedure TSpaceObjPanelProps.ImportAndInsertComponentsFromFile(ImportFileName: string);

  function IsLinkFile(const FileName: string): boolean;
  var
    Ext: string;
  begin
  Ext:=ANSIUpperCase(ExtractFileExt(FileName));
  Result:=(Ext = '.LNK');
  end;

  procedure GetLinkFileDistFile(var FileName: string);
  type
    TShellLinkInfoStruct = packed record
      FullPathAndNameOfLinkFile: array[0..MAX_PATH] of Char;
      FullPathAndNameOfFileToExecute: array[0..MAX_PATH] of Char;
      ParamStringsOfFileToExecute: array[0..MAX_PATH] of Char;
      FullPathAndNameOfWorkingDirectroy: array[0..MAX_PATH] of Char;
      Description: array[0..MAX_PATH] of Char;
      FullPathAndNameOfFileContiningIcon: array[0..MAX_PATH] of Char;
      IconIndex: Integer;
      HotKey: Word;
      ShowCommand: Integer;
      FindData: TWIN32FINDDATA;
    end;
  var
    I: integer;
    ShellLink: IShellLink;
    PersistFile: IPersistFile;
    AnObj: IUnknown;
    LinkInfo: TShellLinkInfoStruct;
  begin
  FillChar(LinkInfo, SizeOf(LinkInfo), #0);
  for I:=0 to Length(FileName)-1 do begin
    LinkInfo.FullPathAndNameOfLinkFile[I]:=FileName[I+1];
    ///LinkInfo.FullPathAndNameOfLinkFile[2*I+1]:=#0;
    end;
  //. access to the two interfaces of the object
  AnObj:=CreateComObject(CLSID_ShellLink);
  ShellLink:=AnObj as IShellLink;
  PersistFile :=AnObj as IPersistFile;
  //. Opens the specified file and initializes an object from the file contents.
  PersistFile.Load(PWChar(WideString(LinkInfo.FullPathAndNameOfLinkFile)), STGM_READ);
  with ShellLink do begin
  //. Retrieves the path and file name of a Shell link object.
  GetPath(@LinkInfo.FullPathAndNameOfFileToExecute,
    SizeOf(LinkInfo.FullPathAndNameOfFileToExecute),
    LinkInfo.FindData,
    SLGP_RAWPATH{SLGP_UNCPRIORITY});
  //. Retrieves the description string for a Shell link object.
  GetDescription(LinkInfo.Description,
    SizeOf(LinkInfo.Description));
  //. Retrieves the command-line arguments associated with a Shell link object.
  GetArguments(LinkInfo.ParamStringsOfFileToExecute,
    SizeOf(LinkInfo.ParamStringsOfFileToExecute));
  //. Retrieves the name of the working directory for a Shell link object.
  GetWorkingDirectory(LinkInfo.FullPathAndNameOfWorkingDirectroy,
    SizeOf(LinkInfo.FullPathAndNameOfWorkingDirectroy));
  //. Retrieves the location (path and index) of the icon for a Shell link object.
  GetIconLocation(LinkInfo.FullPathAndNameOfFileContiningIcon,
    SizeOf(LinkInfo.FullPathAndNameOfFileContiningIcon),
    LinkInfo.IconIndex);
  //. Retrieves the hot key for a Shell link object.
  GetHotKey(LinkInfo.HotKey);
  //. Retrieves the show (SW_) command for a Shell link object.
  GetShowCmd(LinkInfo.ShowCommand);
  //. get result
  FileName:=LinkInfo.FullPathAndNameOfFileToExecute;
  end;
  end;

  function IsImportFile(const FileName: string): boolean;
  var
    Ext: string;
  begin
  Ext:=ANSIUpperCase(ExtractFileExt(FileName));
  Result:=(Ext = '.XML');
  end;

  procedure ImportComponentsByFile(const FileName: string);
  var
    CL: TComponentsList;
    I: integer;
  begin
  ObjFunctionality.Space.Log.OperationStarting('import and inserting components from file - "'+ExtractFileName(FileName)+'"');
  try
  Updater.Disable;
  try
  ObjFunctionality.ImportAndInsertComponents(FileName, CL);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  try
  for I:=0 to CL.Count-1 do with TItemComponentsList(CL[I]^) do with TComponentFunctionality_Create(idTComponent,idComponent) do
    try
    SetPanelPropsLeftTop(MSPointer_X,MSPointer_Y);
    PanelsProps.InsertPanel(idTObj,idObj, id).SaveChanges;
    finally
    Release;
    end;
  finally
  CL.Destroy;
  end;
  finally
  ObjFunctionality.Space.Log.OperationDone;
  end;
  end;

begin
if IsLinkFile(ImportFileName) then GetLinkFileDistFile(ImportFileName);
if NOT IsImportFile(ImportFileName) then Raise Exception.Create('wrong import file format'); //. =>
ImportComponentsByFile(ImportFileName);
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ToCloneClick(Sender: TObject);
var
  WorkObjFunctionality: TComponentFunctionality;
  idClone: integer;
  id: integer;
  TOwnerFunctionality: TTypeFunctionality;
  ComponentFunctionality: TComponentFunctionality;
  SecurityComponents: TComponentsList;
  idSecurityComponent: integer;
  idPanelProps: integer;
  L,T,W,H: integer;
begin
if (MessageDlg('Clone this component ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
SaveChanges;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if WorkObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then WorkObjFunctionality.Space.Log.OperationStarting('component cloning ...');
try
//. check for clone acceptable
///- with WorkObjFunctionality do if (TypesSystem.Reflector <> nil) AND NOT TypesSystem.Reflector.IsObjectCloneAcceptable(idTObj,idObj) then Raise Exception.Create('can not clone object'); //. =>
//.
if OwnerPanelsProps = nil
 then begin
  if (ObjFunctionality.Space.UserSecurityFileForCloneID = 0) then Raise Exception.Create('could not create clone: UserSecurityFileForClone not exist'); //. =>
  WorkObjFunctionality.ToClone(idClone);
  try
  with WorkObjFunctionality.TypeFunctionality.TComponentFunctionality_Create(idClone) do
  try
  idPanelProps:=WorkObjFunctionality.idCustomPanelProps;
  if idPanelProps <> 0 then SetCustomPanelPropsByID(idPanelProps);
  with TPanelProps_Create(flReadOnly,0,nil,nilObject) do Show;
  finally
  Release;
  end;
  except
    WorkObjFunctionality.TypeFunctionality.DestroyInstance(idClone);
    Raise; //. =>
    end;
  end
 else with OwnerPanelsProps.PanelProps do begin
  Updater.Disable;
  try
  ObjFunctionality.CloneAndInsertComponent(WorkObjFunctionality.idTObj,WorkObjFunctionality.idObj, idClone, id);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  ComponentFunctionality:=WorkObjFunctionality.TypeFunctionality.TComponentFunctionality_Create(idClone);
  with ComponentFunctionality do
  try
  try
  Self.OwnerPanelsProps.PanelProps.PanelsProps.InsertPanel(WorkObjFunctionality.idTObj,idClone, id).SaveChanges;
  except
    TypeFunctionality.DestroyInstance(idClone);
    Raise; //. =>
    end;
  finally
  Release;
  end;
  end;
finally
if WorkObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then WorkObjFunctionality.Space.Log.OperationDone;
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_CopyClick(Sender: TObject);
var
  WorkObjFunctionality: TComponentFunctionality;
begin
SaveChanges;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
TypesSystem.ClipBoard_Instance_idTObj:=WorkObjFunctionality.idTObj;
TypesSystem.ClipBoard_Instance_idObj:=WorkObjFunctionality.idObj;
TypesSystem.ClipBoard_flExist:=true;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_PasteClick(Sender: TObject);
var
  WorkObjFunctionality: TComponentFunctionality;
  PrototypeFunctionality: TComponentFunctionality;
  idClone: integer;
  id: integer;
  CloneFunctionality: TComponentFunctionality;
  idPanelProps: integer;
  PanelProps_Width: integer;
  PanelProps_Height: integer;
begin
if NOT TypesSystem.ClipBoard_flExist
 then begin
  ShowMessage('Clipboard is empty.');
  Exit; //. ->
  end;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
if WorkObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then WorkObjFunctionality.Space.Log.OperationStarting('component creating ...');
try
PrototypeFunctionality:=TComponentFunctionality_Create(TypesSystem.ClipBoard_Instance_idTObj,TypesSystem.ClipBoard_Instance_idObj);
with PrototypeFunctionality do begin
try
//. check for clone acceptable
///- if (TypesSystem.Reflector <> nil) AND NOT TypesSystem.Reflector.IsObjectCloneAcceptable(idTObj,idObj) then Raise Exception.Create('can not create the object because it will cover the down objects'); //. =>
//.
Updater.Disable;
try
WorkObjFunctionality.CloneAndInsertComponent(idTObj,idObj, idClone, id);
except
  Updater.Enabled;
  Raise; //.=>
  end;
CloneFunctionality:=PrototypeFunctionality.TypeFunctionality.TComponentFunctionality_Create(idClone);
with CloneFunctionality do
try
try
SetComponentsUsingObject(WorkObjFunctionality.idTObj,WorkObjFunctionality.idObj);
//.
SetPanelPropsLeftTop(MSPointer_X,MSPointer_Y);
PanelsProps.InsertPanel(idTObj,idClone, id).SaveChanges;
except
  TypeFunctionality.DestroyInstance(idClone);
  Raise; //. =>
  end;
finally
Release;
end;
finally
Release;
end;
end;
finally
if WorkObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then WorkObjFunctionality.Space.Log.OperationDone;
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_PasteByReferenceClick(Sender: TObject);
begin
Raise Exception.Create('not supported'); //. =>
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ExportComponentClick(Sender: TObject);
const
  DefExportFolder = 'Import';
var
  ComponentsList: TComponentsList;
  I: integer;
  Path: string;
begin
Path:=GetCurrentDir+'\'+DefExportFolder;
if NOT SelectDirectory('Select directory ->','',Path) then Exit; //. ->
Application.ProcessMessages;
ComponentsList:=TComponentsList.Create;
try
ComponentsList.AddComponent(ObjFunctionality.idTObj,ObjFunctionality.idObj, 0);
ObjFunctionality.Space.Log.OperationStarting('Exporting component ...');
try
Path:=Path+'\'+ObjFunctionality.Name+'('+IntToStr(ObjFunctionality.idTObj)+';'+IntToStr(ObjFunctionality.idObj)+')'+'.xml';
TypesSystem.DoExportComponents(ObjFunctionality.Space.UserName,ObjFunctionality.Space.UserPassword, ComponentsList, Path);
finally
ObjFunctionality.Space.Log.OperationDone;
end;
finally
ComponentsList.Destroy;
end;
ShowMessage('Component has been exported to '+Path);
end;


procedure TSpaceObjPanelProps.PopupMenuItem_ActualityIntervalClick(Sender: TObject);
var
  SC: TCursor;
  AI: TComponentActualityInterval;
  S: string;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
AI:=ObjFunctionality.ActualityInterval_Get();
finally
Screen.Cursor:=SC;
end;
S:='Actuality: ';
if (AI.BeginTimestamp <> NullTimestamp)
 then begin
  S:=S+#$0D#$0A#$0D#$0A+'  Begin: '+FormatDateTime('YYYY-MM-DD HH:NN',AI.BeginTimestamp+TimeZoneDelta);
  if (AI.EndTimestamp < UndefinedTimestamp)
   then S:=S+#$0D#$0A#$0D#$0A+'  End: '+FormatDateTime('YYYY-MM-DD HH:NN',AI.EndTimestamp+TimeZoneDelta)
   else S:=S+#$0D#$0A#$0D#$0A+'  End: '+'- infinity -';
  end
 else S:=S+'- not defined -';
//.
ShowMessage(S);
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ActualizeClick(Sender: TObject);
begin
ObjFunctionality.ActualityInterval_Actualize();
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ActualizeToDateClick(Sender: TObject);
var
  EndTimestamp: TDateTime;
begin
with TDatePickerPanel.Create() do
try
if (NOT Dialog({out} EndTimestamp)) then Exit; //. ->
finally
Destroy();
end;
EndTimestamp:=EndTimestamp+1.0{day};
if (EndTimestamp < (Now-TimeZoneDelta)) then Raise Exception.Create('specified date should be greater or equal than now date'); //. =>
ObjFunctionality.ActualityInterval_SetEndTimestamp(EndTimestamp-TimeZoneDelta);
end;

procedure TSpaceObjPanelProps.PopupMenuItem_DeactualizeClick(Sender: TObject);
begin
ObjFunctionality.ActualityInterval_Deactualize();
end;

procedure TSpaceObjPanelProps.PopupMenuItem_DestroyClick(Sender: TObject);
const
  clDestroing = clRed;
var
  WorkObjFunctionality: TComponentFunctionality;
  Space: TProxySpace;
  SaveColor: TColor;
  R: boolean;
  SC: TCursor;
  I: integer;
  flHandles: boolean;

  procedure DestroyObj;
  var
    R: boolean;
    Reason: string;
    Cnt,I: integer;
  begin
  try
  R:=WorkObjFunctionality.CanDestroy(Reason);
  except
    R:=true;
    end;
  if NOT R then Raise Exception.Create('! can not destroy the object'#$0D#$0A'  reason: '+Reason); //. =>
  WorkObjFunctionality.TypeFunctionality.DestroyInstance(WorkObjFunctionality.idObj);
  end;

begin                                             
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
//.
/// ? WorkObjFunctionality.Check;
//.
SaveColor:=Color;
Color:=clDestroing;
with TObjectDestroying.Create do
try
flHandles:=(Handles <> nil);
Handles_Prepare;
try
if Handles <> nil then for I:=0 to Handles.Count-1 do TDesignHandle(Handles[I]).Color:=clDestroing;
ShowModal;
finally
Handles_Free;
if flHandles then Handles_Prepare;
end;
R:=flDestroy;
finally
Destroy;
end;
if NOT R
 then begin
  Color:=SaveColor;
  Exit; //. ->
  end;
try
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
Space:=WorkObjFunctionality.Space;
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationStarting('component destroing ...');
try
DestroyObj;
finally
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationDone;
Screen.Cursor:=SC;
end;
except
  on E: Exception do begin
    Color:=SaveColor;
    ShowMessage(E.Message);
    end;
  end
end;

procedure TSpaceObjPanelProps.PopupMenuItem_SavePanelClick(Sender: TObject);
begin
SavePanel;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_CopyPanelClick(Sender: TObject);
var
  WorkObjFunctionality: TComponentFunctionality;
  idPanelProps: integer;
begin
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
idPanelProps:=WorkObjFunctionality.idCustomPanelProps;
if idPanelProps <> 0
 then TypesSystem.Clipboard_Instance_idPanelProps:=idPanelProps
 else begin
  TypesSystem.Clipboard_Instance_idPanelProps:=0;
  ShowMessage('Can not copy: own panel of props not exist.');
  end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_PastePanelClick(Sender: TObject);

  procedure InitFromRCDATA;
  begin
  if NOT InitInheritedComponent(Self, TForm) then raise EResNotFound.CreateFmt('resource not found', [ClassName]);
  end;

var
  WorkObjFunctionality: TComponentFunctionality;
  Stream: TMemoryStream;
  SC: TCursor;
  SV: boolean;
  SP: TWinControl;
  SA: TAlign;
  SL,ST,SW,SH: integer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
if TypesSystem.Clipboard_Instance_idPanelProps = 0
 then begin
  ShowMessage('Can not paste: clipboard is empty.');
  Exit; //. ->
  end;
if ProxyObjectFunctionality = nil
 then WorkObjFunctionality:=ObjFunctionality
 else WorkObjFunctionality:=ProxyObjectFunctionality;
//. формируем новую панель
WorkObjFunctionality.SetCustomPanelPropsByID(TypesSystem.Clipboard_Instance_idPanelProps);
//. обновл€ем саму панель
Stream:=WorkObjFunctionality.CustomPanelProps;
try
try
LoadPanelFromStream(Stream);
Update;
except
  //. release custom panel props if exception occured
  WorkObjFunctionality.ReleaseCustomPanelProps;
  //. default init
  SV:=Visible;
  SP:=Parent;
  SL:=Left;ST:=Top;SW:=Width;SH:=Height;
  SA:=Align;
  Hide;
  try
  InitFromRCData;
  Update;
  finally
  Align:=SA;
  Left:=SL;Top:=ST;Width:=SW;Height:=SH;
  Parent:=SP;
  Visible:=SV;
  end;
  //.
  Application.MessageBox('Error(s) when custom-panel loading. Default is applied.','Error');
  end;
finally
Stream.Destroy;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_EditPanelClick(Sender: TObject);
begin
if Designer = nil then Designer:=TPanelPropsDesigner.Create(Self);
Designer.Start;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_AsDefaultPanelClick(Sender: TObject);
begin
SetPanelAsDefault;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_SaveChanges(Sender: TObject);
begin
SaveChanges;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_Resize(Sender: TObject);
begin
VertScrollBar.Range:=VertScrollBar.Range+ClientHeight
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ShowPanelControlElements(Sender: TObject);
begin
ShowPanelControlElements;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ShowHidePanelGrid(Sender: TObject);
begin
flUseGrid:=NOT flUseGrid;
RePaint;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_UpdatePanel(Sender: TObject);
begin
Handles_Free;
if flUseGrid
 then begin
  flUseGrid:=false;
  Repaint;
  end;
Update;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ShowComponentsTreePanel(Sender: TObject);
var
  SC: TCursor;
begin
with TfmComponentsTreePanel.Create(ObjFunctionality.idTObj,ObjFunctionality.idObj) do begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Update();
finally
Screen.Cursor:=SC;
end;
Show();
end;
end;

procedure TSpaceObjPanelProps.PopupMenuItem_ShowOwnerPropsPanel(Sender: TObject);

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
if (NOT ObjFunctionality.GetOwner(idTOwner,idOwner))
 then begin
  Application.MessageBox('There is no owner component.','Information');
  Exit; //. ->
  end;
//. show props panel
if (idTOwner <> idTCoComponent)
 then
  ShowOwnerPanelProps(idTOwner,idOwner)
 else begin
  CoComponentPanelProps:=nil;
  ObjFunctionality.Space.Log.OperationStarting('loading ..........');
  try
  try
  CoComponentPanelProps:=ObjFunctionality.Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idOwner),idOwner);
  except
    FreeAndNil(CoComponentPanelProps);
    end;
  finally
  ObjFunctionality.Space.Log.OperationDone;
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

procedure TSpaceObjPanelProps.MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
MSPointer_X:=X+HorzScrollBar.Position;
MSPointer_Y:=Y+VertScrollBar.Position;
end;

procedure TSpaceObjPanelProps.MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;  { a magic number }
  SC_Resize = $F008;  { a magic number }
  clMoving = clGreen;
  clResizing = clBlue;

  function SelectedControl(pOwner: TWinControl; X,Y: integer): TControl;

    function IsPointInsideControl(const Pt: TPoint; Control: TControl): boolean;
    begin
    Result:=((Control.Left <= Pt.X) AND (Pt.X <= Control.Left+Control.Width)) AND ((Control.Top <= Pt.Y) AND (Pt.Y <=Control.Top+Control.Height));
    end;

  var
    I: integer;
    R: TControl;
  begin
  Result:=nil;
  with pOwner do begin
  for I:=0 to ControlCount-1 do
    if NOT (Controls[I] is TSpaceObjPanelProps)
     then begin
      if {///oh}(Controls[I].Align <> alClient) AND IsPointInsideControl(Point(X,Y),Controls[I]) then Result:=Controls[I];
      if Controls[I] is TWinControl
       then begin
        R:=SelectedControl(TWinControl(Controls[I]), X-Left,Y-Top);
        if R <> nil then Result:=R;
        end
      end;
  end;
  end;

var
  SC: TCursor;
  SaveColor: TColor;
  C: TControl;
begin
{/// ?? with (Sender as TControl) do begin
if Button = mbLeft
 then begin
  //. перемещение или изменение размеров
  ReleaseCapture;
  if ((Sender = Self) AND ((X >= (Width-ZoneResize_RightMargin)) OR (Y >= (Height-ZoneResize_BottomMargin))))
      OR
     ((Sender <> Self) AND ((TControl(Sender).Left+X >= (TControl(Self).Width-ZoneResize_RightMargin)) OR (TControl(Sender).Top+Y >= (TControl(Self).Height-ZoneResize_BottomMargin))))
   then begin
    SaveColor:=Color;
    if OwnerPanelsProps <> nil then Color:=clResizing;
    Self.Perform(WM_SysCommand, SC_Resize, 0);
    Color:=SaveColor;
    if OwnerPanelsProps <> nil
     then begin
      SizeChanged:=true;
      SaveSize;
      end;
    end
   else begin
    SC:=Cursor;
    SaveColor:=Color;
    if OwnerPanelsProps <> nil then Color:=clMoving;
    Cursor:=crHandPoint;
    Self.Perform(WM_SysCommand, SC_DragMove, 0);
    Cursor:=SC;
    Color:=SaveColor;
    if OwnerPanelsProps <> nil
     then begin
      PositionChanged:=true;
      SavePosition;
      OwnerPanelsProps.PanelProps.Update;
      end;
    end;
  end
 else begin
  MSPointer_X:=X;
  MSPointer_Y:=Y;
  end;
end;}
//.
MSPointer_X:=X+HorzScrollBar.Position;
MSPointer_Y:=Y+VertScrollBar.Position;
end;

procedure TSpaceObjPanelProps.MouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  NP: integer;
begin
if VertScrollBar.Visible
 then with VertScrollBar do begin
  NP:=Position-WheelDelta;
  if (NP < 0)
   then NP:=0
   else if NP > Range then NP:=Range;
  if NP <> Position then Position:=NP;
  end;
end;

procedure TSpaceObjPanelProps.FormShow(Sender: TObject);
begin
//.
if flProgressForm
 then begin
  ObjFunctionality.Space.Log.OperationDone;
  flProgressForm:=false;
  end;
//.
if (OwnerPanelsProps = nil)
 then begin
  AutoScroll:=false;
  Show;
  AutoScroll:=true;
  end;
//.
DragAcceptFiles(Handle, true);
end;

procedure TSpaceObjPanelProps.FormHide(Sender: TObject);
begin
Handles_Free;
//.
DragAcceptFiles(Handle, false);
end;

procedure TSpaceObjPanelProps.FormDblClick(Sender: TObject);
begin
ShowMessage(Hint);
end;

procedure TSpaceObjPanelProps.FormPaint(Sender: TObject);
begin
if flUseGrid then ShowGrid;
end;


{TSpaceObjPanelsProps}
Constructor TSpaceObjPanelsProps.Create(pPanelProps: TSpaceObjPanelProps);
begin
Inherited Create;
PanelProps:=pPanelProps;
Update;
end;

destructor TSpaceObjPanelsProps.Destroy;
begin
Clear;
Inherited;
end;


procedure TSpaceObjPanelsProps.Clear;
var
  I: integer;
begin
for I:=0 to Count-1 do TObject(Items[I]).Free;
Inherited Clear;
end;

procedure TSpaceObjPanelsProps.Update;
var
  Components: TComponentsList;
  I: integer;
  Panel: TSpaceObjPanelProps;
  idOwnerObjectProp: integer;
begin
//. free props panels updating if running
FreeAndNil(PanelProps.PropsPanelsUpdating);
//.
Clear;
//.
if PanelProps.ProxyObjectFunctionality <> nil then Exit; //. -> //. не получаем свойства, если панель имеет заместитет€
//.
if NOT PanelProps.flUsePropsPanelsUpdating
 then begin
  with PanelProps.ObjFunctionality do begin
  GetComponentsList(Components);
  try
  for I:=0 to Components.Count-1 do with TComponentFunctionality_Create(TItemComponentsList(Components[I]^).idTComponent,TItemComponentsList(Components[I]^).idComponent) do
    try
    flUserSecurityDisabled:=PanelProps.ObjFunctionality.flUserSecurityDisabled;
    Panel:=TSpaceObjPanelProps(TPanelProps_Create(PanelProps.flReadOnly,idOwnerObjectProp,Self,nilObject));
    if (Panel <> nil)
     then begin
      Panel.flFreeOnClose:=false; //. чтобы панель не освобождалась, если ее закроют
      Add(Panel);
      end;
    finally
    Release;
    end;
  finally
  Components.Destroy;
  end;
  end;
  for I:=0 to Count-1 do TSpaceObjPanelProps(List[I]).Show;
  end
 else
  PanelProps.PropsPanelsUpdating:=TPropsPanelsUpdating.Create(PanelProps);
end;

function TSpaceObjPanelsProps._InsertPanel(const idTComponent,idComponent: integer; const pidOwnerObjectProp: integer): TSpaceObjPanelProps;
var
  Panel: TSpaceObjPanelProps;
begin
if (PanelProps.flUsePropsPanelsUpdating AND PanelProps.PropsPanelsUpdating.IsProcessing) then Raise Exception.Create('props panels updating process not yet finished'); //. =>
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
flUserSecurityDisabled:=PanelProps.ObjFunctionality.flUserSecurityDisabled;
Result:=TSpaceObjPanelProps(TPanelProps_Create(PanelProps.flReadOnly,pidOwnerObjectProp,Self,nilObject));
if Result <> nil
 then with Result do begin
  flFreeOnClose:=false; //. чтобы панель не освобождалась, если ее закроют
  Add(Result);
  SizeChanged:=true;
  PositionChanged:=true;
  Show;
  end;
finally
Release;
end;
end;

function TSpaceObjPanelsProps.InsertPanel(const idTComponent,idComponent: integer; const pidOwnerObjectProp: integer): TSpaceObjPanelProps;
begin
Result:=_InsertPanel(idTComponent,idComponent, pidOwnerObjectProp);
Result.ShowPanelControlElements;
end;

procedure TSpaceObjPanelsProps.RemovePanel(const idTComponent,idComponent: integer);
var
  I: integer;
begin
if (PanelProps.flUsePropsPanelsUpdating AND PanelProps.PropsPanelsUpdating.IsProcessing) then Raise Exception.Create('props panels updating process not yet finished'); //. =>
for I:=0 to Count-1 do with TSpaceObjPanelProps(Items[I]) do begin
  if (ObjFunctionality.idTObj = idTComponent) AND (ObjFunctionality.idObj = idComponent)
     OR ((ProxyObjectFunctionality <> nil) AND (ProxyObjectFunctionality.idTObj = idTComponent) AND (ProxyObjectFunctionality.idObj = idComponent))
   then begin
    TObject(Items[I]).Free;
    Delete(I);
    Exit; //. ->
    end;
  end;
end;

procedure TSpaceObjPanelsProps.ChangePanel(P: TSpaceObjPanelProps);
begin
end;


end.
