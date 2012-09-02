unit unitUserHintsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Menus, ImgList,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  unitReflector, ExtCtrls;

type
  TfmUserHintsPanel = class(TForm)
    lvItems: TListView;
    lvItems_ImageList: TImageList;
    lvItems_PopupMenu: TPopupMenu;
    Addnewitemfromclipboard1: TMenuItem;
    Removeselecteditem1: TMenuItem;
    RemoveAll1: TMenuItem;
    N1: TMenuItem;
    Showiteminreflector1: TMenuItem;
    Editselecteditem1: TMenuItem;
    EnableAll1: TMenuItem;
    DisableAll1: TMenuItem;
    Addnewitemfromclipboardusingselecteditemastemplate1: TMenuItem;
    CleartracksofAll1: TMenuItem;
    EnableDisabletrackingofselecteditem1: TMenuItem;
    Cleartracksofselecteditem1: TMenuItem;
    EnabletrackingofAll1: TMenuItem;
    DisabletrackingofAll1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    procedure Addnewitemfromclipboard1Click(Sender: TObject);
    procedure RemoveAll1Click(Sender: TObject);
    procedure Editselecteditem1Click(Sender: TObject);
    procedure lvItemsDblClick(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure Showiteminreflector1Click(Sender: TObject);
    procedure lvItemsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure EnableAll1Click(Sender: TObject);
    procedure DisableAll1Click(Sender: TObject);
    procedure Addnewitemfromclipboardusingselecteditemastemplate1Click(
      Sender: TObject);
    procedure lvItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure CleartracksofAll1Click(Sender: TObject);
    procedure EnableDisabletrackingofselecteditem1Click(Sender: TObject);
    procedure Cleartracksofselecteditem1Click(Sender: TObject);
    procedure EnabletrackingofAll1Click(Sender: TObject);
    procedure DisabletrackingofAll1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    UserDynamicHints: TUserDynamicHints;
    lvItems_SelectedIndex: integer;
    lvItems_flUpdating: boolean;

    procedure lvItems_Update;
    procedure lvItems_ValidateChanges;
    procedure lvItems_Add(const idTVisualization,idVisualization: integer); overload;
    procedure lvItems_AddUsingSelectedItem(const idTVisualization,idVisualization: integer);
    procedure lvItems_EditSelected;
    procedure lvItems_LocateSelected;
    procedure lvItems_RemoveSelected;
    procedure lvItems_EnableDisableTrackingOfSelected;
    procedure lvItems_ClearTrackOfSelected;
    procedure lvItems_EnableDisableAll(const flEnable: boolean);
    procedure lvItems_RemoveAll;
    procedure lvItems_EnableTrackingOfAll;
    procedure lvItems_DisableTrackingOfAll;
    procedure lvItems_ClearTracksOfAll;
  public
    { Public declarations }
    Constructor Create(const pUserDynamicHints: TUserDynamicHints);
    procedure Update; reintroduce;
    
    procedure lvItems_Add(const idTVisualization,idVisualization: integer; const pName: string; const flShowDialog: boolean); overload;
    procedure lvItems_Add(const idTVisualization,idVisualization: integer; const pName: string); overload;
  end;

implementation
Uses
  unitUserHintPanel;

{$R *.dfm}

{TfmUserHintsPanel}
Constructor TfmUserHintsPanel.Create(const pUserDynamicHints: TUserDynamicHints);
begin
Inherited Create(nil);
UserDynamicHints:=pUserDynamicHints;
lvItems_SelectedIndex:=-1;
lvItems_flUpdating:=false;
end;

procedure TfmUserHintsPanel.Update;
begin
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_Update;
var
  ptrItem: pointer;
  TempBMP: TBitmap;
begin
lvItems_flUpdating:=true;
try
with UserDynamicHints do begin
DynamicHints.Lock.Enter;
try
lvItems.Items.BeginUpdate;
try
lvItems.Items.Clear;
lvItems_ImageList.Clear;
ptrItem:=Items;
while (ptrItem <> nil) do with TUserDynamicHint(ptrItem^),lvItems.Items.Add do begin
  Data:=ptrItem;
  //.
  Checked:=flEnabled;
  TempBMP:=TBitmap.Create;
  try
  TempBMP.Width:=lvItems_ImageList.Width;
  TempBMP.Height:=lvItems_ImageList.Height;
  TempBMP.Canvas.Draw(0,0,InfoImage);
  ImageIndex:=lvItems_ImageList.Add(TempBMP,nil);
  finally
  TempBMP.Destroy;
  end;
  Caption:=InfoString;
  if (ptrObj = nilPtr) then Caption:=Caption+' (not exist)';
  SubItems.Add(InfoStringFontName);
  SubItems.Add(IntToStr(InfoStringFontSize));
  if (flTracking)
   then SubItems.Add('Yes')
   else SubItems.Add('no');
  if (flAlwaysCheckVisibility)
   then SubItems.Add('Yes')
   else SubItems.Add('no');
  //. next item
  ptrItem:=Next;
  end;
if (lvItems_SelectedIndex >= lvItems.Items.Count) then lvItems_SelectedIndex:=lvItems.Items.Count-1;
if (lvItems_SelectedIndex <> -1)
 then begin
  lvItems.Items[lvItems_SelectedIndex].Selected:=true;
  lvItems.Items[lvItems_SelectedIndex].Focused:=true;
  end;
finally
lvItems.Items.EndUpdate;
end;
finally
DynamicHints.Lock.Leave;
end;
end;
finally
lvItems_flUpdating:=false;
end;
end;

procedure TfmUserHintsPanel.lvItems_ValidateChanges;
var
  flChanged: boolean;
  I: integer;
begin
flChanged:=false;
with UserDynamicHints do begin
DynamicHints.Lock.Enter;
try
for I:=0 to lvItems.Items.Count-1 do with lvItems.Items[I],TUserDynamicHint(Data^) do begin
  if (Checked <> flEnabled)
   then begin
    flEnabled:=Checked;
    if (flEnabled) then SupplyVisualizationPtr(Data);
    flChanged:=true;
    end;
  end;
if (flChanged) then Save();
finally
DynamicHints.Lock.Leave;
end;
if (flChanged) then UpdateReflectorView();
end;
end;

procedure TfmUserHintsPanel.lvItemsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
lvItems_SelectedIndex:=Item.Index;
end;

procedure TfmUserHintsPanel.lvItems_Add(const idTVisualization,idVisualization: integer);
begin
lvItems_Add(idTVisualization,idVisualization,'New Label',true);
end;

procedure TfmUserHintsPanel.lvItems_Add(const idTVisualization,idVisualization: integer; const pName: string; const flShowDialog: boolean);
var
  CF: TComponentFunctionality;
  ptrItem: pointer;
begin
CF:=TComponentFunctionality_Create(idTVisualization,idVisualization);
try
if (NOT (CF is TBase2DVisualizationFunctionality)) then Raise Exception.Create('clipboard does not contains a visualization object'); //. =>
finally
CF.Release;
end;
with TfmUserHintPanel.Create() do
try
Color:=clNone;/// - UserDynamicHints.BackgroundColor;
edInfoText.Color:=clNone;/// - UserDynamicHints.BackgroundColor;
edInfoText.Font.Color:=clYellow;/// - UserDynamicHints.BackgroundColor;
edInfoText.Font.Name:='Tahoma';
edInfoText.Font.Size:=14;
edInfoText.Text:=pName;
imgInfoImage.Picture.LoadFromFile(UserDynamicHints.DynamicHints.Reflector.Space.WorkLocale+'\'+PathLib+'\BMP'+'\'+'Mark.bmp');
cbAlwaysCheckVisibility.Checked:=true;
if ((NOT flShowDialog) OR Accepted())
 then begin
  ptrItem:=UserDynamicHints.AddItem(idTVisualization,idVisualization,Color,imgInfoImage.Picture.Bitmap,edInfoText.Text,edInfoText.Font.Name,edInfoText.Font.Size,edInfoText.Font.Color);
  UserDynamicHints.EnableDisableItemTrack(ptrItem,cbTracking.Checked);
  UserDynamicHints.EnableDisableAlwaysCheckVisibility(ptrItem,cbAlwaysCheckVisibility.Checked);
  lvItems_Update;
  end;
finally
Destroy;
end;
end;

procedure TfmUserHintsPanel.lvItems_Add(const idTVisualization,idVisualization: integer; const pName: string);
var
  CF: TComponentFunctionality;
  ptrItem: pointer;
begin
CF:=TComponentFunctionality_Create(idTVisualization,idVisualization);
try
if (NOT (CF is TBase2DVisualizationFunctionality)) then Raise Exception.Create('clipboard does not contains a visualization object'); //. =>
finally
CF.Release;
end;
with TfmUserHintPanel.Create() do
try
Color:=clNone;/// - UserDynamicHints.BackgroundColor;
edInfoText.Color:=clNone;/// - UserDynamicHints.BackgroundColor;
edInfoText.Font.Color:=clYellow;/// - UserDynamicHints.BackgroundColor;
edInfoText.Font.Name:='Tahoma';
edInfoText.Font.Size:=14;
edInfoText.Text:=pName;
imgInfoImage.Picture.LoadFromFile(UserDynamicHints.DynamicHints.Reflector.Space.WorkLocale+'\'+PathLib+'\BMP'+'\'+'Mark.bmp');
if (Accepted())
 then begin
  ptrItem:=UserDynamicHints.AddItem(idTVisualization,idVisualization,Color,imgInfoImage.Picture.Bitmap,edInfoText.Text,edInfoText.Font.Name,edInfoText.Font.Size,edInfoText.Font.Color);
  UserDynamicHints.EnableDisableItemTrack(ptrItem,cbTracking.Checked);
  UserDynamicHints.EnableDisableAlwaysCheckVisibility(ptrItem,cbAlwaysCheckVisibility.Checked);
  lvItems_Update;
  end;
finally
Destroy;
end;
end;

procedure TfmUserHintsPanel.lvItems_AddUsingSelectedItem(const idTVisualization,idVisualization: integer);
var
  ptrItem: pointer;
  CF: TComponentFunctionality;
begin
if (lvItems.Selected = nil) then Raise Exception.Create('no item selected'); //. =>
ptrItem:=lvItems.Selected.Data;
CF:=TComponentFunctionality_Create(idTVisualization,idVisualization);
try
if (NOT (CF is TBase2DVisualizationFunctionality)) then Raise Exception.Create('clipboard does not contains a visualization object'); //. =>
finally
CF.Release;
end;
with TfmUserHintPanel.Create() do
try
UserDynamicHints.DynamicHints.Lock.Enter;
try
with TUserDynamicHint(ptrItem^) do begin
if (InfoImage <> nil) then imgInfoImage.Picture.Bitmap.Assign(InfoImage);
Color:=BackgroundColor;
edInfoText.Color:=BackgroundColor;
edInfoText.Text:=InfoString;
edInfoText.Font.Name:=InfoStringFontName;
edInfoText.Font.Size:=InfoStringFontSize;
edInfoText.Font.Color:=InfoStringFontColor;
cbTracking.Checked:=flTracking;
cbAlwaysCheckVisibility.Checked:=flAlwaysCheckVisibility;
end;
finally
UserDynamicHints.DynamicHints.Lock.Leave;
end;
if (Accepted())
 then begin
  ptrItem:=UserDynamicHints.AddItem(idTVisualization,idVisualization,Color,imgInfoImage.Picture.Bitmap,edInfoText.Text,edInfoText.Font.Name,edInfoText.Font.Size,edInfoText.Font.Color);
  UserDynamicHints.EnableDisableItemTrack(ptrItem,cbTracking.Checked);
  UserDynamicHints.EnableDisableAlwaysCheckVisibility(ptrItem,cbAlwaysCheckVisibility.Checked);
  lvItems_Update;
  end;
finally
Destroy;
end;
end;

procedure TfmUserHintsPanel.lvItems_EditSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with TfmUserHintPanel.Create() do
try
with UserDynamicHints do begin
DynamicHints.Lock.Enter;
try
with TUserDynamicHint(ptrItem^) do begin
Color:=BackgroundColor;
edInfoText.Color:=BackgroundColor;
if (InfoImage <> nil) then imgInfoImage.Picture.Bitmap.Assign(InfoImage);
edInfoText.Text:=InfoString;
edInfoText.Font.Name:=InfoStringFontName;
edInfoText.Font.Size:=InfoStringFontSize;
edInfoText.Font.Color:=InfoStringFontColor;
cbTracking.Checked:=flTracking;
cbAlwaysCheckVisibility.Checked:=flAlwaysCheckVisibility;
end;
finally
DynamicHints.Lock.Leave;
end;
if (Accepted())
 then begin
  UserDynamicHints.SetItem(ptrItem, Color,imgInfoImage.Picture.Bitmap,edInfoText.Text,edInfoText.Font.Name,edInfoText.Font.Size,edInfoText.Font.Color);
  UserDynamicHints.EnableDisableItemTrack(ptrItem,cbTracking.Checked);
  UserDynamicHints.EnableDisableAlwaysCheckVisibility(ptrItem,cbAlwaysCheckVisibility.Checked);
  lvItems_Update;
  end;
end;
finally
Destroy;
end;
end;

procedure TfmUserHintsPanel.lvItems_LocateSelected;
var
  ptrItem: pointer;
  ptrObj: TPtr;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with UserDynamicHints do begin
DynamicHints.Lock.Enter;
try
ptrObj:=TUserDynamicHint(ptrItem^).ptrObj;
finally
DynamicHints.Lock.Leave;
end;
end;
UserDynamicHints.DynamicHints.Reflector.ShowObjAtCenter(ptrObj);
end;

procedure TfmUserHintsPanel.lvItems_RemoveSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
UserDynamicHints.RemoveItem(ptrItem);
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_EnableDisableTrackingOfSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
with UserDynamicHints do begin
DynamicHints.Lock.Enter;
try
UserDynamicHints.EnableDisableItemTrack(ptrItem,(NOT TUserDynamicHint(ptrItem^).flTracking));
finally
DynamicHints.Lock.Leave;
end;
end;
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_ClearTrackOfSelected;
var
  ptrItem: pointer;
begin
if (lvItems.Selected = nil) then Exit; //. ->
ptrItem:=lvItems.Selected.Data;
UserDynamicHints.ClearItemTrack(ptrItem);
UserDynamicHints.UpdateReflectorView;
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_EnableDisableAll(const flEnable: boolean);
var
  I: integer;
begin
lvItems_flUpdating:=true;
try
for I:=0 to lvItems.Items.Count-1 do lvItems.Items[I].Checked:=flEnable;
UserDynamicHints.EnableDisableItems(flEnable);
finally
lvItems_flUpdating:=false;
end;
end;

procedure TfmUserHintsPanel.lvItems_RemoveAll;
begin
UserDynamicHints.Clear;
UserDynamicHints.Save();
UserDynamicHints.UpdateReflectorView;
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_EnableTrackingOfAll;
begin
UserDynamicHints.EnableDisableItemsTracking(true);
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_DisableTrackingOfAll;
begin
UserDynamicHints.EnableDisableItemsTracking(false);
lvItems_Update;
end;

procedure TfmUserHintsPanel.lvItems_ClearTracksOfAll;
begin
UserDynamicHints.ClearItemsTracks();
UserDynamicHints.UpdateReflectorView;
lvItems_Update;
end;

procedure TfmUserHintsPanel.Addnewitemfromclipboard1Click(Sender: TObject);
begin
with TTypesSystem(UserDynamicHints.DynamicHints.Reflector.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
lvItems_Add(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmUserHintsPanel.Addnewitemfromclipboardusingselecteditemastemplate1Click(Sender: TObject);
begin
with TTypesSystem(UserDynamicHints.DynamicHints.Reflector.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
lvItems_AddUsingSelectedItem(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmUserHintsPanel.FormShow(Sender: TObject);
begin
Update();
end;

procedure TfmUserHintsPanel.Editselecteditem1Click(Sender: TObject);
begin
lvItems_EditSelected;
end;

procedure TfmUserHintsPanel.Showiteminreflector1Click(Sender: TObject);
begin
lvItems_LocateSelected;
end;

procedure TfmUserHintsPanel.Removeselecteditem1Click(Sender: TObject);
begin
if (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvItems_RemoveSelected();
end;

procedure TfmUserHintsPanel.EnableDisabletrackingofselecteditem1Click(Sender: TObject);
begin
lvItems_EnableDisableTrackingOfSelected;
end;

procedure TfmUserHintsPanel.Cleartracksofselecteditem1Click(Sender: TObject);
begin
lvItems_ClearTrackOfSelected;
end;

procedure TfmUserHintsPanel.EnableAll1Click(Sender: TObject);
begin
lvItems_EnableDisableAll(true);
end;

procedure TfmUserHintsPanel.DisableAll1Click(Sender: TObject);
begin
lvItems_EnableDisableAll(false);
end;

procedure TfmUserHintsPanel.RemoveAll1Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvItems_RemoveAll();
end;

procedure TfmUserHintsPanel.CleartracksofAll1Click(Sender: TObject);
begin
lvItems_ClearTracksOfAll;
end;

procedure TfmUserHintsPanel.lvItemsDblClick(Sender: TObject);
begin
lvItems_EditSelected;
end;


procedure TfmUserHintsPanel.lvItemsChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
if (lvItems_flUpdating) then Exit; //. ->
lvItems_ValidateChanges;
end;


procedure TfmUserHintsPanel.EnabletrackingofAll1Click(Sender: TObject);
begin
lvItems_EnableTrackingOfAll();
end;

procedure TfmUserHintsPanel.DisabletrackingofAll1Click(Sender: TObject);
begin
lvItems_DisableTrackingOfAll();
end;

end.
