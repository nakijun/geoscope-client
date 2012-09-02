unit unitReflectorSuperLays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  Functionality,
  unitObjectReflectingCfg, ImgList, ComCtrls, ExtCtrls, Menus, StdCtrls;

type
  TLaysArray = array of integer;

  TReflectorSuperLays = class;

  TReflectorSuperLay = class
  private
    SuperLays: TReflectorSuperLays;
    FEnabled: boolean;

    function getEnabled: boolean;
    procedure setEnabled(Value: boolean);
  public
    ID: shortstring;
    Name: shortstring;
    Items: TList;

    Constructor Create(const pSuperLays: TReflectorSuperLays; const pID: shortstring; const pName: shortstring; const LaysArray: TLaysArray; const pEnabled: boolean);
    Destructor Destroy; override;
    procedure Items_AddNew(const idLay: integer);
    procedure Items_Remove(const idLay: integer);
    property Enabled: boolean read getEnabled write setEnabled;
  end;

  TReflectorSuperLays = class
  private
    Reflector: TReflector;
    HidedLays: THidedLays;
    FileName: string;
    FControlPanel: TForm;
  public
    Items: TList;

    Constructor Create(const pReflector: TReflector; const pHidedLays: THidedLays);
    Destructor Destroy; override;
    procedure Load();
    procedure Save();
    procedure Clear();
    procedure Validate(const flUpdateReflector: boolean = false);
    function GetItemByID(const ID: shortstring): TReflectorSuperLay;
    function AddNew(const pName: shortstring): TReflectorSuperLay;
    procedure Remove(const ID: shortstring);
    function GetControlPanel: TForm;
  end;

  TfmReflectorSuperLays = class(TForm)
    Panel1: TPanel;
    lvSuperLays: TListView;
    lvSuperLays_ImageList: TImageList;
    lvSuperLays_PopupMenu: TPopupMenu;
    Addnewitem1: TMenuItem;
    Removeselecteditem1: TMenuItem;
    pnlSelectedItemContent: TPanel;
    StaticText1: TStaticText;
    lvLaysPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    lvLays_ImageList: TImageList;
    lvLays: TListView;
    N1: TMenuItem;
    ShowHidecontenteditor1: TMenuItem;
    Exportinvisiblelays1: TMenuItem;
    procedure Addnewitem1Click(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure lvSuperLaysEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure lvSuperLaysDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvSuperLaysDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvSuperLaysSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ShowHidecontenteditor1Click(Sender: TObject);
    procedure lvSuperLaysMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Exportinvisiblelays1Click(Sender: TObject);
  private
    { Private declarations }
    SuperLays: TReflectorSuperLays;

    procedure lvSuperLays_Update;
    procedure lvSuperLays_AddNew;
    procedure lvSuperLays_RemoveSelected;
    procedure lvSuperLays_ValidateChanges;
    procedure lvSuperLays_ExchangeItems(const SrsIndex,DistIndex: integer);
    procedure lvSuperLays_SelectedItem_lvLays_Update();
    procedure lvSuperLays_SelectedItem_lvLays_AddItemFromClipboard();
    procedure lvSuperLays_SelectedItem_lvLays_RemoveSelected();
  public
    { Public declarations }
    Constructor Create(const pSuperLays: TReflectorSuperLays);
    Destructor Destroy; override;
  end;

var
  fmReflectorSuperLays: TfmReflectorSuperLays;

implementation
Uses
  MSXML,
  FileCtrl,
  TypesDefines;

{$R *.dfm}


Constructor TReflectorSuperLay.Create(const pSuperLays: TReflectorSuperLays; const pID: shortstring; const pName: shortstring; const LaysArray: TLaysArray; const pEnabled: boolean);
var
  I: integer;
begin
Inherited Create;
SuperLays:=pSuperLays;
ID:=pID;
Name:=pName;
FEnabled:=pEnabled;
Items:=TList.Create;
for I:=0 to Length(LaysArray)-1 do Items.Add(Pointer(LaysArray[I]));
end;

Destructor TReflectorSuperLay.Destroy;
begin
Items.Free;
Inherited;
end;

function TReflectorSuperLay.getEnabled: boolean;
begin
Result:=FEnabled;
end;

procedure TReflectorSuperLay.setEnabled(Value: boolean);
begin
if (Value = FEnabled) then Exit; //. ->
FEnabled:=Value;
//.
SuperLays.Save();
SuperLays.Validate(true);
end;

procedure TReflectorSuperLay.Items_AddNew(const idLay: integer);
begin
Items.Add(Pointer(idLay));
//.
SuperLays.Save();
SuperLays.Validate(true);
end;

procedure TReflectorSuperLay.Items_Remove(const idLay: integer);
begin
Items.Remove(Pointer(idLay));
//.
SuperLays.Save();
SuperLays.Validate(true);
end;


{TReflectorSuperLays.}
Constructor TReflectorSuperLays.Create(const pReflector: TReflector; const pHidedLays: THidedLays);
begin
Reflector:=pReflector;
HidedLays:=pHidedLays;
Items:=TList.Create;
FileName:='SuperLays.xml';
Load();
end;

Destructor TReflectorSuperLays.Destroy;
begin
FControlPanel.Free;
Clear();
Items.Free;
Inherited;
end;

procedure TReflectorSuperLays.Load();
var
  UserReflectorProfile: string;
  FN: string;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ItemsNode,ItemNode: IXMLDOMNode;
  I,J: integer;
  _ID: shortstring;
  _Name: shortstring;
  _Enabled: boolean;
  _LaysArray: TLaysArray;
  LaysNode,LayNode: IXMLDOMNode;
  _Item: TReflectorSuperLay;
begin
Clear();
with TProxySpaceUserProfile.Create(Reflector.Space) do
try
UserReflectorProfile:='Reflector'+'\'+IntToStr(Reflector.id);
FN:=ProfileFolder+'\'+UserReflectorProfile+'\'+FileName;
if (NOT FileExists(FN))
 then begin
  FN:=REFLECTORProfile+'\'+FileName;
  if (NOT FileExists(FN)) then FN:='';
  end;
if (FN <> '')
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(FN);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  //.
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    _ID:=ItemNode.selectSingleNode('ID').nodeTypedValue;
    _Name:=ItemNode.selectSingleNode('Name').nodeTypedValue;
    _Enabled:=ItemNode.selectSingleNode('Enabled').nodeTypedValue;
    LaysNode:=ItemNode.selectSingleNode('Lays');
    SetLength(_LaysArray,LaysNode.childNodes.length);
    for J:=0 to LaysNode.childNodes.length-1 do begin
      LayNode:=LaysNode.childNodes[J];
      _LaysArray[J]:=LayNode.selectSingleNode('ID').nodeTypedValue;
      end;
    //.
    _Item:=TReflectorSuperLay.Create(Self,_ID,_Name,_LaysArray,_Enabled);
    Items.Add(_Item);
    end;
  end;
finally
Destroy;
end;
end;

procedure TReflectorSuperLays.Save();
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  I,J: integer;
  Node,ItemsNode,ItemNode: IXMLDOMElement;
  LaysNode,LayNode: IXMLDOMElement;
  UserReflectorProfile: string;
  FN: string;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
ItemsNode:=Doc.createElement('Items');
for I:=0 to Items.Count-1 do with TReflectorSuperLay(Items[I]) do begin
  ItemNode:=Doc.createElement('Item'+IntToStr(I));
  //.
  Node:=Doc.createElement('ID');
  Node.nodeTypedValue:=ID;
  ItemNode.appendChild(Node);
  //.
  Node:=Doc.createElement('Name');
  Node.nodeTypedValue:=Name;
  ItemNode.appendChild(Node);
  //.
  Node:=Doc.createElement('Enabled');
  Node.nodeTypedValue:=Enabled;
  ItemNode.appendChild(Node);
  //.
  LaysNode:=Doc.createElement('Lays');
  for J:=0 to Items.Count-1 do begin
    LayNode:=Doc.createElement('Lay'+IntToStr(J));
    //.
    Node:=Doc.createElement('ID');
    Node.nodeTypedValue:=Integer(Items[J]);
    LayNode.appendChild(Node);
    //.
    LaysNode.appendChild(LayNode);
    end;
  ItemNode.appendChild(LaysNode);
  //.
  ItemsNode.appendChild(ItemNode);
  end;
Root.appendChild(ItemsNode);
//. save xml document
UserReflectorProfile:='Reflector'+'\'+IntToStr(Reflector.id);
FN:=UserReflectorProfile+'\'+FileName;
with TProxySpaceUserProfile.Create(Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+FN;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
end;

procedure TReflectorSuperLays.Clear();
var
  I: integer;
begin
if (Items <> nil)
 then begin
  for I:=0 to Items.Count-1 do TObject(Items[I]).Destroy();
  Items.Clear();
  end;
end;

procedure TReflectorSuperLays.Validate(const flUpdateReflector: boolean = false);
var
  I,J: integer;
  LayID: integer;
begin
for I:=0 to Items.Count-1 do with TReflectorSuperLay(Items[I]) do begin
  for J:=0 to Items.Count-1 do begin
    LayID:=Integer(Items[J]);
    HidedLays.Remove(Pointer(LayID));
    if (NOT Enabled) then HidedLays.Add(Pointer(LayID));
    end;
  end;
if (flUpdateReflector) then Reflector.Reflecting.RecalcReflect();
end;

function TReflectorSuperLays.GetItemByID(const ID: shortstring): TReflectorSuperLay;
var
  I: integer;
begin
Result:=nil;
for I:=0 to Items.Count-1 do
  if (TReflectorSuperLay(Items[I]).ID = ID)
   then begin
    Result:=TReflectorSuperLay(Items[I]);
    Exit; //. ->
    end;
end;

function TReflectorSuperLays.AddNew(const pName: shortstring): TReflectorSuperLay;
var
  GUID: TGUID;
  NewID: shortstring;
begin
if (CreateGUID({out} GUID) <> S_OK) then Raise Exception.Create('could not create GUID'); //. =>
NewID:=GUIDToString(GUID);
Result:=TReflectorSuperLay.Create(Self,NewID,pName,nil,false);
Items.Add(Result);
Save();
Validate(true);
end;

procedure TReflectorSuperLays.Remove(const ID: shortstring);
var
  RemoveItem: TReflectorSuperLay;
begin
RemoveItem:=GetItemByID(ID);
if (RemoveItem <> nil)
 then begin
  Items.Remove(RemoveItem);
  RemoveItem.Destroy();
  end;
Save();
Validate(true);
end;

function TReflectorSuperLays.GetControlPanel: TForm;
begin
if (FControlPanel = nil) then FControlPanel:=TfmReflectorSuperLays.Create(Self);
Result:=FControlPanel;
end;


{TfmReflectorSuperLays}
Constructor TfmReflectorSuperLays.Create(const pSuperLays: TReflectorSuperLays);
begin
Inherited Create(nil);
SuperLays:=pSuperLays;
lvSuperLays_Update();
//. to hide content editor
ShowHidecontenteditor1Click(nil);
end;

Destructor TfmReflectorSuperLays.Destroy;
begin
Inherited;
end;

procedure TfmReflectorSuperLays.lvSuperLays_Update;
var
  I: integer;
begin
with lvSuperLays do begin
Items.BeginUpdate;
try
Items.Clear;
for I:=SuperLays.Items.Count-1 downto 0 do with Items.Add do begin
  Data:=SuperLays.Items[I];
  with TReflectorSuperLay(SuperLays.Items[I]) do begin
  Caption:=Name;
  ImageIndex:=0;
  Checked:=Enabled;
  end;
  end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmReflectorSuperLays.lvSuperLays_AddNew;
var
  NewItem: TReflectorSuperLay;
begin
NewItem:=SuperLays.AddNew('');
with lvSuperLays.Items.Add do begin
Data:=NewItem;
with NewItem do begin
Caption:=Name;
ImageIndex:=0;
Checked:=Enabled;
end;
EditCaption();
end;
end;

procedure TfmReflectorSuperLays.lvSuperLays_RemoveSelected;
begin
if (lvSuperLays.Selected = nil) then Exit; //. ->
SuperLays.Remove(TReflectorSuperLay(lvSuperLays.Selected.Data).ID);
lvSuperLays.Selected.Delete;
end;

procedure TfmReflectorSuperLays.lvSuperLays_ValidateChanges;
var
  I: integer;
begin
for I:=0 to lvSuperLays.Items.Count-1 do with lvSuperLays.Items[I] do 
  if (Checked <> TReflectorSuperLay(Data).Enabled)
   then TReflectorSuperLay(Data).Enabled:=Checked;
end;

procedure TfmReflectorSuperLays.lvSuperLays_ExchangeItems(const SrsIndex,DistIndex: integer);
var
  P: pointer;
  S: string;
  Index: integer;
  B: boolean;
  I: integer;

begin
with lvSuperLays do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit; //. ->
Items.BeginUpdate;
try
P:=Items[SrsIndex].Data;
S:=Items[SrsIndex].Caption;
Index:=Items[SrsIndex].ImageIndex;
B:=Items[SrsIndex].Checked;
I:=SrsIndex;
if (DistIndex < SrsIndex)
 then begin
  while I > DistIndex do begin
    Items[I].Data:=Items[I-1].Data;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Items[I].Checked:=Items[I-1].Checked;
    Dec(I);
    end;
  end
 else begin
  while (I < DistIndex) do begin
    Items[I].Data:=Items[I+1].Data;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Items[I].Checked:=Items[I+1].Checked;
    Inc(I);
    end;
  end;
Items[DistIndex].Data:=P;
Items[DistIndex].Caption:=S;
Items[DistIndex].ImageIndex:=Index;
Items[DistIndex].Checked:=B;
//.
P:=SuperLays.Items[SrsIndex];
SuperLays.Items.Remove(P);
SuperLays.Items.Insert(DistIndex,P);
SuperLays.Save();
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmReflectorSuperLays.lvSuperLays_SelectedItem_lvLays_Update;

  procedure ProcessLay(const idLay: integer);
  var
    LayFunctionality: TLay2DVisualizationFunctionality;
  begin
  LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idLay));
  with LayFunctionality do
  try
  with lvLays.Items.Add do begin
  Data:=Pointer(idObj);
  try
  Caption:=Name;
  except
    on E: Exception do Caption:='ERROR: '+E.Message;
    end;
  ImageIndex:=0;
  SubItems.Add(IntToStr(Number));
  end;
  finally
  Release;
  end;
  end;

var
  SelectedItem: TReflectorSuperLay;
  SC: TCursor;
  I: integer;
begin
if (lvSuperLays.Selected = nil) then Exit; //. ->
SelectedItem:=TReflectorSuperLay(lvSuperLays.Selected.Data);
//.
lvLays.Clear;
lvLays.Items.BeginUpdate;
try
Screen.Cursor:=crHourGlass;
try
for I:=0 to SelectedItem.Items.Count-1 do ProcessLay(Integer(SelectedItem.Items[I]));
finally
Screen.Cursor:=SC;
end;
finally
lvLays.Items.EndUpdate;
end;
end;

procedure TfmReflectorSuperLays.lvSuperLays_SelectedItem_lvLays_AddItemFromClipboard();
var
  SelectedItem: TReflectorSuperLay;
  SC: TCursor;
  LayFunctionality: TLay2DVisualizationFunctionality;
begin
if (lvSuperLays.Selected = nil) then Exit; //. ->
SelectedItem:=TReflectorSuperLay(lvSuperLays.Selected.Data);
//.
with TTypesSystem(SuperLays.Reflector.Space.TypesSystem) do begin
if (NOT ClipBoard_flExist) then Raise Exception.Create('there is no component in the clipboard'); //. =>
if (Clipboard_Instance_idTObj <> idTLay2DVisualization) then Raise Exception.Create('component in the clipboard is not a Lay-visualization component'); //. =>
//.
SelectedItem.Items_AddNew(Clipboard_Instance_idObj);
//.
Screen.Cursor:=crHourGlass;
try
LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Clipboard_Instance_idObj));
with LayFunctionality do
try
with lvLays.Items.Add do begin
Data:=Pointer(idObj);
try
Caption:=Name;
except
  on E: Exception do Caption:='ERROR: '+E.Message;
  end;
ImageIndex:=0;
SubItems.Add(IntToStr(Number));
end;
finally
Release;
end;
finally
Screen.Cursor:=SC;
end;
end;
end;

procedure TfmReflectorSuperLays.lvSuperLays_SelectedItem_lvLays_RemoveSelected();
var
  SelectedItem: TReflectorSuperLay;
  RemoveLayID: integer;
begin
if (lvSuperLays.Selected = nil) then Exit; //. ->
SelectedItem:=TReflectorSuperLay(lvSuperLays.Selected.Data);
if (lvLays.Selected = nil) then Exit; //. ->
RemoveLayID:=Integer(lvLays.Selected.Data);
//.
SelectedItem.Items_Remove(RemoveLayID);
//.
lvLays.Selected.Delete();
end;

procedure TfmReflectorSuperLays.Addnewitem1Click(Sender: TObject);
begin
lvSuperLays_AddNew();
end;

procedure TfmReflectorSuperLays.Removeselecteditem1Click(Sender: TObject);
begin
if (Application.MessageBox('Do you want to delete selected item ?','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES) then Exit; //. ->
lvSuperLays_RemoveSelected();
end;

procedure TfmReflectorSuperLays.lvSuperLaysEdited(Sender: TObject; Item: TListItem; var S: String);
begin
if (Item.Caption <> S)
 then begin
  TReflectorSuperLay(lvSuperLays.Selected.Data).Name:=S;
  SuperLays.Save();
  end;
end;

procedure TfmReflectorSuperLays.lvSuperLaysMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
lvSuperLays_ValidateChanges();
end;

procedure TfmReflectorSuperLays.lvSuperLaysDragOver(Sender,Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Sender = Source) then Accept:=true;
end;

procedure TfmReflectorSuperLays.lvSuperLaysDragDrop(Sender,Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
if Sender = Source
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if Item = nil then Exit;
  lvSuperLays_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmReflectorSuperLays.lvSuperLaysSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
if (Selected)
 then begin
  if (pnlSelectedItemContent.Visible) then lvSuperLays_SelectedItem_lvLays_Update();
  end;
end;

procedure TfmReflectorSuperLays.MenuItem1Click(Sender: TObject);
begin
lvSuperLays_SelectedItem_lvLays_AddItemFromClipboard()
end;

procedure TfmReflectorSuperLays.MenuItem2Click(Sender: TObject);
begin
lvSuperLays_SelectedItem_lvLays_RemoveSelected();
end;

procedure TfmReflectorSuperLays.Exportinvisiblelays1Click(Sender: TObject);
const
  HidedLaysFileName = 'InvisibleLays.dat';
var
  FN: string;
  BA: TByteArray;
begin
SelectDirectory('','',FN);
BA:=SuperLays.HidedLays.GetLayNumbersArray();
if (Length(BA) = 0) then Raise Exception.Create('no hided lays'); //. =>
FN:=FN+'\'+HidedLaysFileName;
with TMemoryStream.Create() do
try
Write(Pointer(@BA[0])^,Length(BA));
SaveToFile(FN);
finally
Destroy();
end;
ShowMessage('Invisible lays data has been exported into file: '+FN);
end;

procedure TfmReflectorSuperLays.ShowHidecontenteditor1Click(Sender: TObject);
begin
if (pnlSelectedItemContent.Visible)
 then begin
  pnlSelectedItemContent.Hide;
  Width:=Width-pnlSelectedItemContent.Width;
  lvSuperLays.ReadOnly:=true;
  end
 else begin
  Width:=Width+pnlSelectedItemContent.Width;
  pnlSelectedItemContent.Show;
  lvSuperLays.ReadOnly:=false;
  end;
end;


end.
