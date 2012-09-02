unit unitGeoObjectTracksPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Menus, ImgList,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  unitReflector,
  unitXYToGeoCrdConvertor,
  unitObjectModel,
  ExtCtrls, StdCtrls, Buttons;

type
  TfmGeoObjectTracksPanel = class(TForm)
    lvItems: TListView;
    lvItems_PopupMenu: TPopupMenu;
    Addnewitemfromclipboard1: TMenuItem;
    Removeselecteditem1: TMenuItem;
    RemoveAll1: TMenuItem;
    Showiteminreflector1: TMenuItem;
    Editselecteditem1: TMenuItem;
    EnableAll1: TMenuItem;
    DisableAll1: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    OpenDialog: TOpenDialog;
    Addnewitemfromafileusingselectedastemplate1: TMenuItem;
    pnlControl: TPanel;
    Updater: TTimer;
    stTracksSummary: TStaticText;
    Showselecteditemstatistics1: TMenuItem;
    Panel1: TPanel;
    cbShowTrackNodes: TCheckBox;
    cbShowTrackNodesTimeHints: TCheckBox;
    Panel2: TPanel;
    cbShowTrackObjectModelEvents: TCheckBox;
    GroupBox1: TGroupBox;
    cbObjectModelInfoEvents: TCheckBox;
    cbObjectModelMinorEvents: TCheckBox;
    cbObjectModelMajorEvents: TCheckBox;
    cbObjectModelCriticalEvents: TCheckBox;
    Panel3: TPanel;
    cbShowTrackBusinessModelEvents: TCheckBox;
    GroupBox2: TGroupBox;
    cbBusinessModelInfoEvents: TCheckBox;
    cbBusinessModelMinorEvents: TCheckBox;
    cbBusinessModelMajorEvents: TCheckBox;
    cbBusinessModelCriticalEvents: TCheckBox;
    btnRecalculate: TBitBtn;
    N1: TMenuItem;
    Defaults1: TMenuItem;
    procedure Addnewitemfromfile1Click(Sender: TObject);
    procedure RemoveAll1Click(Sender: TObject);
    procedure Editselecteditem1Click(Sender: TObject);
    procedure lvItemsDblClick(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure Showiteminreflector1Click(Sender: TObject);
    procedure EnableAll1Click(Sender: TObject);
    procedure DisableAll1Click(Sender: TObject);
    procedure lvItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Addnewitemfromafileusingselectedastemplate1Click(
      Sender: TObject);
    procedure cbShowTrackNodesTimeHintsClick(Sender: TObject);
    procedure lvItemsClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure cbShowTrackNodesClick(Sender: TObject);
    procedure cbShowTrackObjectModelEventsClick(Sender: TObject);
    procedure cbShowTrackBusinessModelEventsClick(Sender: TObject);
    procedure cbObjectModelInfoEventsClick(Sender: TObject);
    procedure cbObjectModelMinorEventsClick(Sender: TObject);
    procedure cbObjectModelMajorEventsClick(Sender: TObject);
    procedure cbObjectModelCriticalEventsClick(Sender: TObject);
    procedure cbBusinessModelInfoEventsClick(Sender: TObject);
    procedure cbBusinessModelMinorEventsClick(Sender: TObject);
    procedure cbBusinessModelMajorEventsClick(Sender: TObject);
    procedure cbBusinessModelCriticalEventsClick(Sender: TObject);
    procedure lvItemsEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Showselecteditemstatistics1Click(Sender: TObject);
    procedure lvItemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRecalculateClick(Sender: TObject);
    procedure Defaults1Click(Sender: TObject);
  private
    { Private declarations }
    GeoObjectTracks: TGeoObjectTracks;
    flUpdating: boolean;
    lvItems_SelectedIndex: integer;
    lvItems_flUpdating: boolean;
    CoComponentID: integer;
    Update_ChangesCount: integer;

    procedure lvItems_Update;
    procedure lvItems_UpdateSummaryPanel;
    procedure lvItems_ValidateChanges;
    procedure lvItems_AddFromFile;
    procedure lvItems_AddFromFileUsingSelectedAsTemplate;
    procedure lvItems_EditSelected;
    procedure lvItems_LocateSelected;
    procedure lvItems_RemoveSelected;
    procedure lvItems_EnableDisableAll(const flEnable: boolean);
    procedure lvItems_RemoveAll;
  public
    { Public declarations }
    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks); overload;
    Constructor Create(const pGeoObjectTracks: TGeoObjectTracks; const pCoComponentID: integer); overload;
    procedure Update; reintroduce;
  end;

implementation
Uses
  unitGeoObjectTrackPanel,
  unitGeoObjectTrackControlPanel,
  unitGeoObjectTrackStatisticsPanel,
  unitGeoObjectTrackAnalysisDefaultsPanel;
  
{$R *.dfm}

{TfmUserHintsPanel}
Constructor TfmGeoObjectTracksPanel.Create(const pGeoObjectTracks: TGeoObjectTracks);
begin
Create(pGeoObjectTracks,0);
end;

Constructor TfmGeoObjectTracksPanel.Create(const pGeoObjectTracks: TGeoObjectTracks; const pCoComponentID: integer);
begin
Inherited Create(nil);
GeoObjectTracks:=pGeoObjectTracks;
CoComponentID:=pCoComponentID;
lvItems_SelectedIndex:=-1;
lvItems_flUpdating:=false;
flUpdating:=false;
Update_ChangesCount:=0;
Update();
end;

procedure TfmGeoObjectTracksPanel.Update;
begin
flUpdating:=true;
try
lvItems_Update;
lvItems_UpdateSummaryPanel();
cbShowTrackNodes.Checked:=GeoObjectTracks.flShowTracksNodes;
cbShowTrackNodesTimeHints.Enabled:=cbShowTrackNodes.Checked;
cbShowTrackNodesTimeHints.Checked:=GeoObjectTracks.flShowTracksNodesTimeHints;
cbShowTrackObjectModelEvents.Checked:=GeoObjectTracks.flShowTracksObjectModelEvents;
cbObjectModelInfoEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelMinorEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelMajorEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelCriticalEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbShowTrackBusinessModelEvents.Checked:=GeoObjectTracks.flShowTracksBusinessModelEvents;
cbBusinessModelInfoEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelMinorEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelMajorEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelCriticalEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbObjectModelInfoEvents.Checked:=(otesInfo in GeoObjectTracks.ObjectModelEventSeveritiesToShow);
cbObjectModelMinorEvents.Checked:=(otesMinor in GeoObjectTracks.ObjectModelEventSeveritiesToShow);
cbObjectModelMajorEvents.Checked:=(otesMajor in GeoObjectTracks.ObjectModelEventSeveritiesToShow);
cbObjectModelCriticalEvents.Checked:=(otesCritical in GeoObjectTracks.ObjectModelEventSeveritiesToShow);
cbBusinessModelInfoEvents.Checked:=(otesInfo in GeoObjectTracks.BusinessModelEventSeveritiesToShow);
cbBusinessModelMinorEvents.Checked:=(otesMinor in GeoObjectTracks.BusinessModelEventSeveritiesToShow);
cbBusinessModelMajorEvents.Checked:=(otesMajor in GeoObjectTracks.BusinessModelEventSeveritiesToShow);
cbBusinessModelCriticalEvents.Checked:=(otesCritical in GeoObjectTracks.BusinessModelEventSeveritiesToShow);
finally
flUpdating:=false;
end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_Update;
var
  ptrItem: pointer;
  TrackSize: integer;
  TrackLength: double;
  InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter: integer;
begin
lvItems_flUpdating:=true;
try
with GeoObjectTracks do begin
Lock.Enter;
try
lvItems.Items.BeginUpdate;
try
lvItems.Items.Clear;
ptrItem:=Tracks;
while (ptrItem <> nil) do begin
  if ((CoComponentID = 0) OR (TGeoObjectTrack(ptrItem^).CoComponentID = CoComponentID))
   then with TGeoObjectTrack(ptrItem^),lvItems.Items.Add do begin
    Data:=ptrItem;
    //.
    Checked:=flEnabled;
    Caption:=TrackName;
    //.
    GeoObjectTracks.GetTrackInfo(ptrItem, TrackSize,TrackLength);
    GeoObjectTracks.GetTrackBusinessModelEventsInfo(ptrItem, InfoEventsCounter,MinorEventsCounter,MajorEventsCounter,CriticalEventsCounter);
    //.
    SubItems.Add(IntToStr(TrackSize));
    SubItems.Add(FormatFloat('0',TrackLength));
    SubItems.Add(IntToStr(InfoEventsCounter));
    SubItems.Add(IntToStr(MinorEventsCounter));
    SubItems.Add(IntToStr(MajorEventsCounter));
    SubItems.Add(IntToStr(CriticalEventsCounter));
    end;
  //. next item
  ptrItem:=TGeoObjectTrack(ptrItem^).Next;
  end;
if (lvItems_SelectedIndex >= lvItems.Items.Count) then lvItems_SelectedIndex:=lvItems.Items.Count-1;
if (lvItems_SelectedIndex <> -1)
 then begin
  lvItems.Items[lvItems_SelectedIndex].Selected:=true;
  lvItems.Items[lvItems_SelectedIndex].Focused:=true;
  lvItems.Items[lvItems_SelectedIndex].MakeVisible(false);
  end;
finally
lvItems.Items.EndUpdate;
end;
Update_ChangesCount:=ChangesCount;
finally
Lock.Leave;
end;
end;
finally
lvItems_flUpdating:=false;
end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_UpdateSummaryPanel;
var
  SummarySize: integer;
  SummaryLength: double;
  I: integer;
  S: integer;
  L: double;
begin
SummarySize:=0;
SummaryLength:=0.0;
with GeoObjectTracks do begin
Lock.Enter;
try
for I:=0 to lvItems.Items.Count-1 do with lvItems.Items[I] do begin
  if (Checked)
   then begin
    GetTrackInfo(Data, S,L);
    SummarySize:=SummarySize+S;
    SummaryLength:=SummaryLength+L;
    end;
  end;
finally
Lock.Leave;
end;
end;
stTracksSummary.Caption:='Tracks summary: '+IntToStr(SummarySize)+' fixes, '+FormatFloat('0',SummaryLength)+' meters';
end;

procedure TfmGeoObjectTracksPanel.lvItems_ValidateChanges;
var
  flChanged: boolean;
  I: integer;
begin
flChanged:=false;
with GeoObjectTracks do begin
Lock.Enter;
try
for I:=0 to lvItems.Items.Count-1 do with lvItems.Items[I],TGeoObjectTrack(Data^) do begin
  if (Checked <> flEnabled)
   then begin
    flEnabled:=Checked;
    flChanged:=true;
    end;
  end;
Inc(ChangesCount);
if (flChanged)
 then begin
  Save();
  lvItems_UpdateSummaryPanel();
  end;
finally
Lock.Leave;
end;
if (flChanged) then UpdateReflectorView();
end;
end;

procedure TfmGeoObjectTracksPanel.lvItemsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
lvItems_SelectedIndex:=Item.Index;
end;

procedure TfmGeoObjectTracksPanel.lvItems_AddFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir();
try
OpenDialog.InitialDir:=PathTempDATA;
R:=OpenDialog.Execute();
finally
SetCurrentDir(CD);
end;
if (R)
 then begin
  GeoObjectTracks.AddNewTrackFromFile(OpenDialog.FileName,ExtractFileName(OpenDialog.FileName),clRed);
  lvItems_Update;
  end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_AddFromFileUsingSelectedAsTemplate;
var
  ptrItem: pointer;
  TN: string;
  TC: TColor;
  CD: string;
  R: boolean;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with GeoObjectTracks do begin
Lock.Enter;
try
with TGeoObjectTrack(ptrItem^) do begin
TN:=TrackName;
TC:=Color;
end;
finally
Lock.Leave;
end;
end;
//.
CD:=GetCurrentDir();
try
OpenDialog.InitialDir:=PathTempDATA;
R:=OpenDialog.Execute();
finally
SetCurrentDir(CD);
end;
if (R)
 then begin
  GeoObjectTracks.AddNewTrackFromFile(OpenDialog.FileName,TN,TC);
  lvItems_Update;
  end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_EditSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with TfmGeoObjectTrackPanel.Create() do
try
with GeoObjectTracks do begin
Lock.Enter;
try
with TGeoObjectTrack(ptrItem^) do begin
edTrackName.Text:=TrackName;
lbColor.Color:=Color;
end;
finally
Lock.Leave;
end;
if (Accepted())
 then begin
  GeoObjectTracks.SetTrackProperties(ptrItem, edTrackName.Text,lbColor.Color);
  lvItems_Update;
  end;
end;
finally
Destroy;
end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_LocateSelected;
var
  ZeroDouble: double;
  ptrItem: pointer;
  _X,_Y: TCrd;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with GeoObjectTracks do begin
ZeroDouble:=0.0;
Lock.Enter;
try
while (ptrItem <> nil) do begin
  if (NOT ((TObjectTrackNode(ptrItem^).Latitude = ZeroDouble) AND (TObjectTrackNode(ptrItem^).Longitude = ZeroDouble))) then Break; //. >
  //.
  ptrItem:=TObjectTrackNode(ptrItem^).Next;
  end;
if (TGeoObjectTrack(ptrItem^).Nodes = nil) then Exit; //. ->
with TObjectTrackNode(TGeoObjectTrack(ptrItem^).Nodes^) do begin
_X:=X;
_Y:=Y;
end;
finally
Lock.Leave;
end;
end;
GeoObjectTracks.Convertor.Reflector.ShiftingSetReflection(_X,_Y);
end;

procedure TfmGeoObjectTracksPanel.lvItems_RemoveSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
GeoObjectTracks.RemoveTrack(ptrItem);
lvItems_Update;
end;

procedure TfmGeoObjectTracksPanel.lvItems_EnableDisableAll(const flEnable: boolean);
var
  I: integer;
begin
lvItems_flUpdating:=true;
try
for I:=0 to lvItems.Items.Count-1 do lvItems.Items[I].Checked:=flEnable;
GeoObjectTracks.EnableDisableItems(flEnable);
finally
lvItems_flUpdating:=false;
end;
end;

procedure TfmGeoObjectTracksPanel.lvItems_RemoveAll;
begin
GeoObjectTracks.Clear;
GeoObjectTracks.Save();
GeoObjectTracks.UpdateReflectorView;
lvItems_Update;
end;

procedure TfmGeoObjectTracksPanel.Addnewitemfromfile1Click(Sender: TObject);
begin
lvItems_AddFromFile();
end;

procedure TfmGeoObjectTracksPanel.Editselecteditem1Click(Sender: TObject);
begin
lvItems_EditSelected;
end;

procedure TfmGeoObjectTracksPanel.Showiteminreflector1Click(Sender: TObject);
begin
lvItems_LocateSelected;
end;

procedure TfmGeoObjectTracksPanel.Removeselecteditem1Click(Sender: TObject);
begin
if (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvItems_RemoveSelected();
end;

procedure TfmGeoObjectTracksPanel.EnableAll1Click(Sender: TObject);
begin
lvItems_EnableDisableAll(true);
end;

procedure TfmGeoObjectTracksPanel.DisableAll1Click(Sender: TObject);
begin
lvItems_EnableDisableAll(false);
end;

procedure TfmGeoObjectTracksPanel.RemoveAll1Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvItems_RemoveAll();
end;

procedure TfmGeoObjectTracksPanel.lvItemsDblClick(Sender: TObject);
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with TfmGeoObjectTrackControlPanel.Create(GeoObjectTracks,ptrItem) do Show();
end;


procedure TfmGeoObjectTracksPanel.lvItemsClick(Sender: TObject);
begin
if (lvItems_flUpdating) then Exit; //. ->
if (NOT lvItems.HandleAllocated) then Exit; //. -> //. validate only if lvItems is visible
lvItems_ValidateChanges;
end;

procedure TfmGeoObjectTracksPanel.lvItemsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
Item:=lvItems.GetItemAt(X,Y);
if (Item <> nil)
 then begin
  Item.Focused:=true;
  Item.Selected:=true;
  end;
end;

procedure TfmGeoObjectTracksPanel.Addnewitemfromafileusingselectedastemplate1Click(Sender: TObject);
begin
lvItems_AddFromFileUsingSelectedAsTemplate;
end;

procedure TfmGeoObjectTracksPanel.cbShowTrackNodesClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
cbShowTrackNodesTimeHints.Enabled:=cbShowTrackNodes.Checked;
GeoObjectTracks.flShowTracksNodes:=cbShowTrackNodes.Checked;
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbShowTrackNodesTimeHintsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
GeoObjectTracks.flShowTracksNodesTimeHints:=cbShowTrackNodesTimeHints.Checked;
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.UpdaterTimer(Sender: TObject);
var
  flUpdateIsNeeded: boolean;
begin
if ((ProxySpace = nil) OR (ProxySpace.State <> psstWorking)) then Exit; //. ->
with GeoObjectTracks do begin
Lock.Enter;
try
flUpdateIsNeeded:=(Update_ChangesCount <> ChangesCount);
finally
Lock.Leave;
end;
if (flUpdateIsNeeded)
 then begin
  lvItems_Update();
  lvItems_UpdateSummaryPanel();
  end;
end;
end;

procedure TfmGeoObjectTracksPanel.cbShowTrackObjectModelEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
GeoObjectTracks.flShowTracksObjectModelEvents:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelInfoEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelMinorEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelMajorEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
cbObjectModelCriticalEvents.Enabled:=cbShowTrackObjectModelEvents.Checked;
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbObjectModelInfoEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbObjectModelInfoEvents.Checked)
 then Include(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesInfo)
 else Exclude(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesInfo);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbObjectModelMinorEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbObjectModelMinorEvents.Checked)
 then Include(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesMinor)
 else Exclude(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesMinor);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbObjectModelMajorEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbObjectModelMajorEvents.Checked)
 then Include(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesMajor)
 else Exclude(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesMajor);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbObjectModelCriticalEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbObjectModelCriticalEvents.Checked)
 then Include(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesCritical)
 else Exclude(GeoObjectTracks.ObjectModelEventSeveritiesToShow,otesCritical);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbShowTrackBusinessModelEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
GeoObjectTracks.flShowTracksBusinessModelEvents:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelInfoEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelMinorEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelMajorEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
cbBusinessModelCriticalEvents.Enabled:=cbShowTrackBusinessModelEvents.Checked;
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbBusinessModelInfoEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbBusinessModelInfoEvents.Checked)
 then Include(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesInfo)
 else Exclude(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesInfo);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbBusinessModelMinorEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbBusinessModelMinorEvents.Checked)
 then Include(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesMinor)
 else Exclude(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesMinor);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbBusinessModelMajorEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbBusinessModelMajorEvents.Checked)
 then Include(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesMajor)
 else Exclude(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesMajor);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.cbBusinessModelCriticalEventsClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (cbBusinessModelCriticalEvents.Checked)
 then Include(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesCritical)
 else Exclude(GeoObjectTracks.BusinessModelEventSeveritiesToShow,otesCritical);
GeoObjectTracks.UpdateReflectorView();
end;

procedure TfmGeoObjectTracksPanel.lvItemsEnter(Sender: TObject);
begin
UpdaterTimer(nil);
end;

procedure TfmGeoObjectTracksPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmGeoObjectTracksPanel.Showselecteditemstatistics1Click(Sender: TObject);
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with TfmGeoObjectTrackStatisticsPanel.Create(GeoObjectTracks,ptrItem) do Show();
end;

procedure TfmGeoObjectTracksPanel.btnRecalculateClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
GeoObjectTracks.RecalculateItemsTrackBindings();
finally
Screen.Cursor:=SC;
end;
GeoObjectTracks.Convertor.Reflector.Reflecting.ReFresh();
end;

procedure TfmGeoObjectTracksPanel.Defaults1Click(Sender: TObject);
begin
with TfmGeoObjectTrackAnalysisDefaultsPanel.Create(GeoObjectTracks.AnalysisDefaults) do
try
ShowModal();
finally
Destroy();
end;
end;


end.
