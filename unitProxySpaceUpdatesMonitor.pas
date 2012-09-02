unit unitProxySpaceUpdatesMonitor;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality, ComCtrls, ExtCtrls, ImgList, Animate, GIFCtrl, Buttons,
  StdCtrls;

const
  WM_UPDATE = WM_USER+1;

  ComponentOperationsStrings: array[TComponentOperation] of string = ('Created','Destroyed','Updated','Inserted','Removed');
  RevisionActsStrings: array[TRevisionAct] of string = ('Inserted','Removed','Changed','Refreshed','Validated','InsertedWithDetailes','RemovedWithDetailes','ChangedWithDetailes','RefreshedWithDetails','ContentIsChanged','ContentIsChangedWithDetails');

  tvHistory_MaxCount = 30;
  tvHistory_MaxLimit = 300;
  Minimized_AlphaBlendValue = 100;

type
  TUpdateItem = record
    ptrNext: pointer;
    TimeStamp: TDateTime;
    SpaceHistory: TByteArray;
    ComponentsHistory: TByteArray;
    VisualizationsHistory: TByteArray;
  end;

  TComponentElement = class
  public
    Operation: TComponentOperation;
    idTComponent: integer;
    idComponent: integer;
  end;

  TVisualizationElement = class
  public
    Act: TRevisionAct;
    ptrObj: TPtr;
  end;

  TSpaceElement = class
  public
    Pntr: TPtr;
    Size: integer;
  end;

  TfmProxySpaceUpdatesMonitor = class(TForm)
    Panel1: TPanel;
    tvHistory: TTreeView;
    lvHistory_ImageList: TImageList;
    Panel2: TPanel;
    agifIndicator: TRxGIFAnimator;
    NewUpdatesTimer: TTimer;
    sbClearHistory: TSpeedButton;
    sbHide: TSpeedButton;
    Label1: TLabel;
    ProcessingTimer: TTimer;
    sbUserNotifications: TSpeedButton;
    procedure tvHistoryDblClick(Sender: TObject);
    procedure agifIndicatorClick(Sender: TObject);
    procedure NewUpdatesTimerTimer(Sender: TObject);
    procedure sbClearHistoryClick(Sender: TObject);
    procedure sbHideClick(Sender: TObject);
    procedure ProcessingTimerTimer(Sender: TObject);
    procedure sbUserNotificationsClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    flUpdating: boolean;
    FMinimized: boolean;
    FMinimized_SavedWidth: integer;
    FMinimized_SavedHeight: integer;

    procedure wmUpdate(var Message: TMessage); message WM_UPDATE;
    procedure NewUpdatesTimer_Start;
    procedure NewUpdatesTimer_Stop;
    procedure setMinimized(Value: boolean);
  public
    { Public declarations }
    flActive: boolean;
    flNoSpaceStructuresUpdates: boolean;
    UpdateItems: pointer;
    UpdateItemsLock: TCriticalSection;
    UpdatesUserNotificator: TForm;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Update;
    procedure tvHistory_Clear(Reminder: integer);
    procedure UpdateItems_Clear(var Items: pointer);
    procedure UpdateItems_Insert(const pTimeStamp: TDateTime; const pSpaceHistory: TByteArray; const pComponentsHistory: TByteArray; const pVisualizationsHistory: TByteArray); overload;
    procedure UpdateItems_Insert(const pTimeStamp: TDateTime; const ComponentNotifications: pointer; const ComponentNotificationsCount: integer; const VisualizationNotifications: pointer; const VisualizationNotificationsCount: integer); overload;

    property Minimized: boolean read FMinimized write setMinimized;
  end;


implementation
Uses
  unitSpaceNotificationSubscription,
  unitSpaceUpdatesUserNotificator;

{$R *.dfm}


{TfmProxySpaceUpdatesMonitor}
Constructor TfmProxySpaceUpdatesMonitor.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
flUpdating:=false;
flActive:=true;
flNoSpaceStructuresUpdates:=true;
FMinimized:=false;
UpdateItems:=nil;
UpdateItemsLock:=TCriticalSection.Create;
//.
Minimized:=true;
//.
UpdatesUserNotificator:=TfmSpaceUpdatesUserNotificator.Create(Space);
end;

Destructor TfmProxySpaceUpdatesMonitor.Destroy;
var
  ptrDestroyItems: pointer;
begin
UpdatesUserNotificator.Free;
//.
if (UpdateItemsLock <> nil)
 then begin
  UpdateItemsLock.Enter;
  try
  ptrDestroyItems:=UpdateItems;
  UpdateItems:=nil;
  finally
  UpdateItemsLock.Leave;
  end;
  UpdateItems_Clear(ptrDestroyItems);
  end;
//.
UpdateItemsLock.Free;
//.
tvHistory_Clear(0);
//.
Inherited;
end;

procedure TfmProxySpaceUpdatesMonitor.Update;
label
  ExitLabel;
var
  Items: pointer;
  ptrItem: pointer;
  ItemNode,SubItemNode,ChangeItem: TTreeNode;
  I: integer;
  SrsPtr,EndPtr: pointer;
begin
flUpdating:=true;
try
UpdateItemsLock.Enter;
try
Items:=UpdateItems;
UpdateItems:=nil;
finally
UpdateItemsLock.Leave;
end;
if (Items = nil) then Exit; //. ->
try
tvHistory.Items.BeginUpdate;
try
for I:=0 to tvHistory.Items.Count-1 do tvHistory.Items[I].Collapse(true);
ptrItem:=Items;
while (ptrItem <> nil) do with TUpdateItem(ptrItem^) do begin
  ItemNode:=tvHistory.Items.AddChildFirst(nil,FormatDateTime('HH:NN.SS',TimeStamp+TimeZoneDelta));
  ItemNode.ImageIndex:=0;
  ItemNode.SelectedIndex:=ItemNode.ImageIndex;
  if (Length(ComponentsHistory) > 0)
   then begin
    SubItemNode:=tvHistory.Items.AddChild(ItemNode,'Component changes');
    SubItemNode.ImageIndex:=1;
    SubItemNode.SelectedIndex:=SubItemNode.ImageIndex;
    for I:=0 to (Length(ComponentsHistory) DIV SizeOf(TComponentsHistoryItem))-1 do with TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^) do begin
      with TTypeFunctionality_Create(idTComponent) do
      try
      ChangeItem:=tvHistory.Items.AddChild(SubItemNode,Name+'.'+ComponentOperationsStrings[TComponentOperation(idOperation)]);
      ChangeItem.Data:=TComponentElement.Create;
      TComponentElement(ChangeItem.Data).Operation:=TComponentOperation(idOperation);
      TComponentElement(ChangeItem.Data).idTComponent:=idTComponent;
      TComponentElement(ChangeItem.Data).idComponent:=idComponent;
      //.
      ChangeItem.ImageIndex:=4;
      ChangeItem.SelectedIndex:=ChangeItem.ImageIndex;
      finally
      Release;
      end;
      //. process component notifications
      TfmSpaceUpdatesUserNotificator(UpdatesUserNotificator).UpdatesUserNotificator.DoOnComponentOperation(idTComponent,idComponent,TComponentOperation(idOperation));
      //.
      if (tvHistory.Items.Count > tvHistory_MaxLimit) then GoTo ExitLabel; //. -->
      end;
    end;
  if (Length(VisualizationsHistory) > 0)
   then begin
    SubItemNode:=tvHistory.Items.AddChild(ItemNode,'Visualization changes');
    SubItemNode.ImageIndex:=2;
    SubItemNode.SelectedIndex:=SubItemNode.ImageIndex;
    for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do begin
      ChangeItem:=tvHistory.Items.AddChild(SubItemNode,'Visualization'+'.['+IntToStr(ptrObj)+']'+'.'+RevisionActsStrings[TRevisionAct(idAct)]);
      ChangeItem.Data:=TVisualizationElement.Create;
      TVisualizationElement(ChangeItem.Data).Act:=TRevisionAct(idAct);
      TVisualizationElement(ChangeItem.Data).ptrObj:=ptrObj;
      //.
      ChangeItem.ImageIndex:=4;
      ChangeItem.SelectedIndex:=ChangeItem.ImageIndex;
      //. process component notifications
      TfmSpaceUpdatesUserNotificator(UpdatesUserNotificator).UpdatesUserNotificator.DoOnVisualizationOperation(ptrObj,TRevisionAct(idAct));
      //.
      if (tvHistory.Items.Count > tvHistory_MaxLimit) then GoTo ExitLabel; //. -->
      end;
    end;
  if (Length(SpaceHistory) > 0)
   then begin
    SubItemNode:=tvHistory.Items.AddChild(ItemNode,'Space structure changes');
    SubItemNode.ImageIndex:=3;
    SubItemNode.SelectedIndex:=SubItemNode.ImageIndex;
    SrsPtr:=@SpaceHistory[0]; EndPtr:=Pointer(Integer(SrsPtr)+Length(SpaceHistory));
    while SrsPtr <> EndPtr do with TSpaceHistoryItem(SrsPtr^) do begin
      ChangeItem:=tvHistory.Items.AddChild(SubItemNode,'address: '+IntToStr(Pntr)+', size: '+IntToStr(Size));
      ChangeItem.Data:=TSpaceElement.Create;
      TSpaceElement(ChangeItem.Data).Pntr:=Pntr;
      TSpaceElement(ChangeItem.Data).Size:=Size;
      //.
      Inc(Integer(SrsPtr),Size);
      Inc(Integer(SrsPtr),SizeOf(TSpaceHistoryItem));
      //.
      ChangeItem.ImageIndex:=4;
      ChangeItem.SelectedIndex:=ChangeItem.ImageIndex;
      //.
      if (tvHistory.Items.Count > tvHistory_MaxLimit) then GoTo ExitLabel; //. -->
      end;
    end;
  ItemNode.Expand(true);
  //.
  if (tvHistory.Items.Count > tvHistory_MaxLimit) then Break; //. >
  //. next item
  ptrItem:=ptrNext;
  end;
ExitLabel:;
tvHistory_Clear(tvHistory_MaxCount);
finally
tvHistory.Items.EndUpdate;
end;
NewUpdatesTimer_Start;
finally
UpdateItems_Clear(Items);
end;
finally
flUpdating:=false;
end;
end;

procedure TfmProxySpaceUpdatesMonitor.tvHistory_Clear(Reminder: integer);

  procedure FreeElements(const Node: TTreeNode);
  var
    I: integer;
  begin
  TObject(Node.Data).Free;
  for I:=0 to Node.Count-1 do FreeElements(Node[I]);
  end;

var
  N,I: integer;
begin
I:=0;
while (I < tvHistory.Items.Count) do
  if (tvHistory.Items[I].Level = 0)
   then 
    if (Reminder = 0)
     then begin
      FreeElements(tvHistory.Items[I]);
      tvHistory.Items[I].Delete;
      end
     else begin
      Dec(Reminder);
      Inc(I);
      end
   else Inc(I);
end;

procedure TfmProxySpaceUpdatesMonitor.UpdateItems_Clear(var Items: pointer);
var
  ptrDestroyItem: pointer;
begin
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TUpdateItem(ptrDestroyItem^).ptrNext;
  //.
  with TUpdateItem(ptrDestroyItem^) do begin
  SetLength(SpaceHistory,0);
  SetLength(ComponentsHistory,0);
  SetLength(VisualizationsHistory,0);
  end;
  FreeMem(ptrDestroyItem,SizeOf(TUpdateItem));
  end;
end;

procedure TfmProxySpaceUpdatesMonitor.UpdateItems_Insert(const pTimeStamp: TDateTime; const pSpaceHistory: TByteArray; const pComponentsHistory: TByteArray; const pVisualizationsHistory: TByteArray);
var
  ptrNewItem: pointer;
  WM: TMessage;
begin
if (NOT flActive) then Exit; //. ->
if ((flNoSpaceStructuresUpdates) AND ((Length(pComponentsHistory) = 0) AND (Length(pVisualizationsHistory) = 0))) then Exit; //. ->
GetMem(ptrNewItem,SizeOf(TUpdateItem));
FillChar(ptrNewItem^,SizeOf(TUpdateItem),0);
with TUpdateItem(ptrNewItem^) do begin
TimeStamp:=pTimeStamp;
SetLength(SpaceHistory,Length(pSpaceHistory)); Move(pSpaceHistory[0],SpaceHistory[0],Length(SpaceHistory));
SetLength(ComponentsHistory,Length(pComponentsHistory)); Move(pComponentsHistory[0],ComponentsHistory[0],Length(ComponentsHistory));
SetLength(VisualizationsHistory,Length(pVisualizationsHistory)); Move(pVisualizationsHistory[0],VisualizationsHistory[0],Length(VisualizationsHistory));
end;
//.
UpdateItemsLock.Enter;
try
TUpdateItem(ptrNewItem^).ptrNext:=UpdateItems;
UpdateItems:=ptrNewItem;
finally
UpdateItemsLock.Leave;
end;
end;

procedure TfmProxySpaceUpdatesMonitor.UpdateItems_Insert(const pTimeStamp: TDateTime; const ComponentNotifications: pointer; const ComponentNotificationsCount: integer; const VisualizationNotifications: pointer; const VisualizationNotificationsCount: integer); 
var
  ptrNewItem: pointer;
  WM: TMessage;
  I: integer;
begin
if (NOT flActive) then Exit; //. ->
if ((ComponentNotificationsCount = 0) AND (VisualizationNotificationsCount = 0)) then Exit; //. ->
GetMem(ptrNewItem,SizeOf(TUpdateItem));
FillChar(ptrNewItem^,SizeOf(TUpdateItem),0);
with TUpdateItem(ptrNewItem^) do begin
TimeStamp:=pTimeStamp;
SetLength(SpaceHistory,0);
SetLength(ComponentsHistory,SizeOf(TComponentsHistoryItem)*ComponentNotificationsCount);
for I:=0 to ComponentNotificationsCount-1 do begin
  TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^).TimeStamp:=pTimeStamp;
  TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^).idTComponent:=TComponentNotification(Pointer(Integer(ComponentNotifications)+I*SizeOf(TComponentNotification))^).idTComponent;
  TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^).idComponent:=TComponentNotification(Pointer(Integer(ComponentNotifications)+I*SizeOf(TComponentNotification))^).idComponent;
  TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^).idOperation:=Word(TComponentNotification(Pointer(Integer(ComponentNotifications)+I*SizeOf(TComponentNotification))^).Operation);
  end;
SetLength(VisualizationsHistory,SizeOf(TVisualizationsHistoryItem)*VisualizationNotificationsCount);
for I:=0 to VisualizationNotificationsCount-1 do begin
  TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^).TimeStamp:=pTimeStamp;
  TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^).ptrObj:=TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^).ptrObj;
  TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^).idAct:=SmallInt(TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^).Act);
  end;
end;
//.
UpdateItemsLock.Enter;
try
TUpdateItem(ptrNewItem^).ptrNext:=UpdateItems;
UpdateItems:=ptrNewItem;
finally
UpdateItemsLock.Leave;
end;
end;

procedure TfmProxySpaceUpdatesMonitor.wmUpdate(var Message: TMessage);
begin
Update();
end;

procedure TfmProxySpaceUpdatesMonitor.setMinimized(Value: boolean);
begin
if (FMinimized = Value) then Exit; //. ->
if (Value)
 then begin
  FMinimized:=true;
  FMinimized_SavedWidth:=ClientWidth;
  FMinimized_SavedHeight:=ClientHeight;
  ClientWidth:=agifIndicator.Width;
  ClientHeight:=agifIndicator.Height;
  Left:=(Screen.Width-Width);
  Top:=0;
  Caption:='';
  end
 else begin
  FMinimized:=false;
  NewUpdatesTimer_Stop;
  ClientWidth:=FMinimized_SavedWidth;
  ClientHeight:=FMinimized_SavedHeight;
  if ((Screen.Width-Left) < Width) then Left:=(Screen.Width-Width);
  if ((Screen.Height-Top) < Height) then Top:=(Screen.Height-Height);
  Caption:='Updates in view';
  end;
end;

procedure TfmProxySpaceUpdatesMonitor.tvHistoryDblClick(Sender: TObject);
var
  Ob: TObject;
begin
if (flUpdating) then Exit; //. ->
if ((tvHistory.Selected = nil) OR (tvHistory.Selected.getFirstChild <> nil)) then Exit; //. ->
Ob:=tvHistory.Selected.Data;
if (Ob is TComponentElement)
 then with TComponentFunctionality_Create(TComponentElement(Ob).idTComponent,TComponentElement(Ob).idComponent) do
  try
  Check();
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show;
  end;
  finally
  Release;
  end
 else
  if (Ob is TVisualizationElement)
   then with TComponentFunctionality_Create(Space.Obj_IDType(TVisualizationElement(Ob).ptrObj),Space.Obj_ID(TVisualizationElement(Ob).ptrObj)) do
    try
    Check();
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    Show;
    end;
    finally
    Release;
    end
end;

procedure TfmProxySpaceUpdatesMonitor.agifIndicatorClick(Sender: TObject);
begin
Minimized:=NOT Minimized;
BringToFront;
end;

procedure TfmProxySpaceUpdatesMonitor.NewUpdatesTimer_Start;
begin
if (NOT Visible OR NOT Minimized) then Exit; //. ->
NewUpdatesTimer.Tag:=255;
AlphaBlend:=true;
agifIndicator.Animate:=true;
NewUpdatesTimer.Enabled:=true;
FormStyle:=fsStayOnTop;
end;

procedure TfmProxySpaceUpdatesMonitor.NewUpdatesTimer_Stop;
begin
NewUpdatesTimer.Enabled:=false;
agifIndicator.Animate:=false;
FormStyle:=fsNormal;
AlphaBlend:=false;
if (NOT Minimized) then Exit; //. ->
SendToBack;
end;

procedure TfmProxySpaceUpdatesMonitor.NewUpdatesTimerTimer(Sender: TObject);
begin
with NewUpdatesTimer do begin
if (Tag > Minimized_AlphaBlendValue)
 then begin
  Tag:=Tag-1;
  AlphaBlendValue:=Tag;
  end
 else NewUpdatesTimer_Stop;
end;
end;

procedure TfmProxySpaceUpdatesMonitor.sbClearHistoryClick(Sender: TObject);
begin
tvHistory_Clear(0);
end;

procedure TfmProxySpaceUpdatesMonitor.sbHideClick(Sender: TObject);
begin
Hide;
end;

procedure TfmProxySpaceUpdatesMonitor.ProcessingTimerTimer(Sender: TObject);
begin
Update();
end;


procedure TfmProxySpaceUpdatesMonitor.sbUserNotificationsClick(Sender: TObject);
begin
UpdatesUserNotificator.Show();
end;

end.
