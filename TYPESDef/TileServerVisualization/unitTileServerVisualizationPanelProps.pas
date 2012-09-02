unit unitTileServerVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  TTileServerVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    Generatefromtiles1: TMenuItem;
    Wrapper1: TMenuItem;
    LEVELs1: TMenuItem;
    AddNewLevelAndRegenerate1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Regeneratelevels1: TMenuItem;
    Calibration1: TMenuItem;
    N4: TMenuItem;
    Loadtolocalcontext1: TMenuItem;
    Label1: TLabel;
    cbServerType: TComboBox;
    Label2: TLabel;
    edServerURL: TEdit;
    gbTileProviders: TGroupBox;
    btnServerData: TBitBtn;
    lvTileProviders: TListView;
    lvTileProviders_Popup: TPopupMenu;
    AddnewProvider1: TMenuItem;
    DeleteselectedProvider1: TMenuItem;
    N3: TMenuItem;
    EditselectedProvider1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure Generatefromtiles1Click(Sender: TObject);
    procedure Wrapper1Click(Sender: TObject);
    procedure LEVELs1Click(Sender: TObject);
    procedure AddNewLevelAndRegenerate1Click(Sender: TObject);
    procedure Regeneratelevels1Click(Sender: TObject);
    procedure Calibration1Click(Sender: TObject);
    procedure Loadtolocalcontext1Click(Sender: TObject);
    procedure cbServerTypeChange(Sender: TObject);
    procedure edServerURLKeyPress(Sender: TObject; var Key: Char);
    procedure btnServerDataClick(Sender: TObject);
    procedure AddnewProvider1Click(Sender: TObject);
    procedure DeleteselectedProvider1Click(Sender: TObject);
    procedure EditselectedProvider1Click(Sender: TObject);
  private
    { Private declarations }
    ServerType: integer;
    ServerData: TByteArray;
    TileProviderID: integer;
    //.
    lvTileProviders_OriginalWindowProc: procedure (var Message: TMessage) of object;
    lvTileProviders_WindowProcEx_flProcessing: boolean;

    procedure lvTileProviders_Update();
    procedure lvTileProviders_AddNew();
    procedure lvTileProviders_Delete(const ProviderID: integer);
    procedure lvTileProviders_Edit(const ProviderID: integer);
    procedure lvTileProviders_DoOnItemChecked(const ProviderID: integer);
    procedure lvTileProviders_WindowProcEx(var Message: TMessage);
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

const
  TileServerTypeStrings: array[TTileServerType] of string = ('Native','Yandex.Maps','Google.Maps','OpenStreet.Maps','Navitel.Maps');

implementation
Uses
  CommCtrl,
  unitTileServerVisualizationLevels,
  unitTileServerGenerator,
  unitTileServerVisualizationWrapper,
  unitTileServerCalibrator,
  unitTileServerVisualizationLocalContextLoader,
  unitTileServerTileProviderPanel,
  unitNativeTileServerDataPanel,
  unitYandexMapsTileServerDataPanel,
  unitGoogleMapsTileServerDataPanel,
  unitOpenStreetMapsTileServerDataPanel,
  unitNavitelMapsTileServerDataPanel;


{$R *.DFM}


Constructor TTileServerVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: TTileServerType;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
cbServerType.Items.BeginUpdate();
try
cbServerType.Items.Clear();
for I:=Low(TTileServerType) to High(TTileServerType) do cbServerType.Items.Add(TileServerTypeStrings[I]);
finally
cbServerType.Items.EndUpdate();
end;
//.
lvTileProviders_OriginalWindowProc:=lvTileProviders.WindowProc;
lvTileProviders.WindowProc:=lvTileProviders_WindowProcEx;
lvTileProviders_WindowProcEx_flProcessing:=false;
//.
Update();
end;

destructor TTileServerVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TTileServerVisualizationPanelProps._Update;
var
  ServerURL: string;
  _Width: integer;
  _Height: integer;
begin
Inherited;
//.
TTileServerVisualizationFunctionality(ObjFunctionality).GetParams({out} ServerType,ServerURL,ServerData,TileProviderID,_Width,_Height);
cbServerType.OnChange:=nil;
cbServerType.ItemIndex:=ServerType;
cbServerType.OnChange:=cbServerTypeChange;
cbServerType.Enabled:=ObjFunctionality.Space.IsROOTUser();
edServerURL.Text:=ServerURL;
edServerURL.Enabled:=ObjFunctionality.Space.IsROOTUser();
btnServerData.Visible:=ObjFunctionality.Space.IsROOTUser();
//.
lvTileProviders_Update();
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_Update();
var
  ParsedData: TTileServerParsedData;
  I: integer;
begin
lvTileProviders.Items.BeginUpdate();
try
lvTileProviders.Items.Clear();
ParsedData:=TTileServerParsedData.GetParsedData(TTileServerType(ServerType),ServerData);
if (ParsedData = nil) then Exit; //. ->
try
for I:=0 to Length(ParsedData.TileProviders)-1 do with lvTileProviders.Items.Add() do begin
  Data:=Pointer(ParsedData.TileProviders[I].ID);
  Caption:=ParsedData.TileProviders[I].Name;
  Checked:=(ParsedData.TileProviders[I].ID = TileProviderID);
  if (Checked)
   then begin
    Selected:=true;
    Focused:=Selected;
    end;
  end;
finally
ParsedData.Destroy();
end;
finally
lvTileProviders.Items.EndUpdate();
end;
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_AddNew();
var
  ParsedData: TTileServerParsedData;
  NewTileProvider: TTileServerTileProvider;
begin
ParsedData:=TTileServerParsedData.GetParsedData(TTileServerType(ServerType),ServerData);
if (ParsedData = nil) then Exit; //. ->
try
NewTileProvider.ServerType:=-1; //. inherited from object server type
NewTileProvider.ID:=ParsedData.TileProviders_GetNextID();
NewTileProvider.Name:='';
NewTileProvider.URL:='';
NewTileProvider.Format:='';
NewTileProvider.flIndependentLevels:=false;
//.
with TfmTileServerTileProviderPanel.Create() do
try
edType.Text:=IntToStr(NewTileProvider.ServerType);
edID.Text:=IntToStr(NewTileProvider.ID);
edName.Text:=NewTileProvider.Name;
edURL.Text:=NewTileProvider.URL;
edFormat.Text:=NewTileProvider.Format;
if (NOT Dialog()) then Exit; //. ->
NewTileProvider.ServerType:=StrToInt(edType.Text);
NewTileProvider.ID:=StrToInt(edID.Text);
NewTileProvider.Name:=edName.Text;
NewTileProvider.URL:=edURL.Text;
NewTileProvider.Format:=edFormat.Text;
NewTileProvider.flIndependentLevels:=cbIndependentLevels.Checked;
finally
Destroy();
end;
//.
ParsedData.TileProviders_AddNew(NewTileProvider);
TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(ParsedData.ToByteArray());
finally
ParsedData.Destroy();
end;
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_Delete(const ProviderID: integer);
var
  ParsedData: TTileServerParsedData;
begin
ParsedData:=TTileServerParsedData.GetParsedData(TTileServerType(ServerType),ServerData);
if (ParsedData = nil) then Exit; //. ->
try
ParsedData.TileProviders_Delete(ParsedData.TileProviders_GetItemIndex(ProviderID));
TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(ParsedData.ToByteArray());
finally
ParsedData.Destroy();
end;
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_Edit(const ProviderID: integer);
var
  ParsedData: TTileServerParsedData;
  EditingTileProviderIndex: integer;
  EditingTileProvider: TTileServerTileProvider;
begin
ParsedData:=TTileServerParsedData.GetParsedData(TTileServerType(ServerType),ServerData);
if (ParsedData = nil) then Exit; //. ->
try
EditingTileProviderIndex:=ParsedData.TileProviders_GetItemIndex(ProviderID);
EditingTileProvider:=ParsedData.TileProviders[EditingTileProviderIndex];
//.
with TfmTileServerTileProviderPanel.Create() do
try
edType.Text:=IntToStr(EditingTileProvider.ServerType);
edID.Text:=IntToStr(EditingTileProvider.ID);
edName.Text:=EditingTileProvider.Name;
edURL.Text:=EditingTileProvider.URL;
edFormat.Text:=EditingTileProvider.Format;
cbIndependentLevels.Checked:=EditingTileProvider.flIndependentLevels;
if (NOT Dialog()) then Exit; //. ->
EditingTileProvider.ServerType:=StrToInt(edType.Text);
EditingTileProvider.ID:=StrToInt(edID.Text);
EditingTileProvider.Name:=edName.Text;
EditingTileProvider.URL:=edURL.Text;
EditingTileProvider.Format:=edFormat.Text;
EditingTileProvider.flIndependentLevels:=cbIndependentLevels.Checked;
finally
Destroy();
end;
//.
ParsedData.TileProviders_Set(EditingTileProviderIndex,EditingTileProvider);
TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(ParsedData.ToByteArray());
finally
ParsedData.Destroy();
end;
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_DoOnItemChecked(const ProviderID: integer);
begin
TTileServerVisualizationFunctionality(ObjFunctionality).UserData_SetTileProviderID(ProviderID);
//.
TReflectorsList(ObjFunctionality.Space.ReflectorsList).Refresh(0);
end;

procedure TTileServerVisualizationPanelProps.lvTileProviders_WindowProcEx(var Message: TMessage);
var
   ListItem : TListItem;
   I: integer;                                                       
begin
if (Message.Msg = CN_NOTIFY)
 then begin
  if (PNMHdr(Message.LParam)^.Code = LVN_ITEMCHANGED)
   then with PNMListView(Message.LParam)^ do begin
    if ((uChanged and LVIF_STATE) <> 0)
     then begin
      if (((uNewState and LVIS_STATEIMAGEMASK) shr 12) <> ((uOldState and LVIS_STATEIMAGEMASK) shr 12))
       then begin
        if (NOT flUpdating AND NOT lvTileProviders_WindowProcEx_flProcessing)
         then begin
          lvTileProviders_WindowProcEx_flProcessing:=true;
          try
          ListItem:=lvTileProviders.Items[iItem];
          if (ListItem.Checked)
           then begin
            ListItem.Selected:=true;
            ListItem.Focused:=ListItem.Selected;
            //.
            lvTileProviders.Repaint();
            try
            lvTileProviders_DoOnItemChecked(Integer(ListItem.Data));
            //.
            for I:=0 to lvTileProviders.Items.Count-1 do
              if ((lvTileProviders.Items[I] <> ListItem) AND(lvTileProviders.Items[I].Checked))
               then lvTileProviders.Items[I].Checked:=false;
            except
              ListItem.Checked:=false;
              //.
              Raise; //. ->
              end;
            end
           else ListItem.Checked:=true;
          finally
          lvTileProviders_WindowProcEx_flProcessing:=false;
          end;
          end;
        //.
        end;
      end;
    end;
   end;
//. original ListView message handling
lvTileProviders_OriginalWindowProc(Message);
end;

procedure TTileServerVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TTileServerVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TTileServerVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TTileServerVisualizationPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
  MS: TMemoryStream;
  BA: TByteArray;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TTileServerVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('generating image  ...');
  try
  MS:=TMemoryStream.Create;
  try
  MS.LoadFromFile(OpenFileDialog.FileName);
  ByteArray_PrepareFromStream(BA,MS);
  GenerateFromImage(BA);
  finally
  MS.Destroy;
  end;
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TTileServerVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTileServerVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

procedure TTileServerVisualizationPanelProps.Generatefromtiles1Click(Sender: TObject);
begin
with TfmTileServerGenerator.Create(TTileServerVisualizationFunctionality(ObjFunctionality)) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TTileServerVisualizationPanelProps.AddNewLevelAndRegenerate1Click(Sender: TObject);
begin
TTileServerVisualizationFunctionality(ObjFunctionality).AddNewLevelAndRegenerate;
end;

procedure TTileServerVisualizationPanelProps.Regeneratelevels1Click(Sender: TObject);
begin
TTileServerVisualizationFunctionality(ObjFunctionality).RegenerateRegion(-1,-1, -1,-1);
end;

procedure TTileServerVisualizationPanelProps.Wrapper1Click(Sender: TObject);
begin
with TfmTileServerVisualizationWrapper.Create(ObjFunctionality.idObj) do Show;
end;

procedure TTileServerVisualizationPanelProps.LEVELs1Click(Sender: TObject);
begin
with TfmTileServerVisualizationLevels.Create(ObjFunctionality.idObj) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TTileServerVisualizationPanelProps.Calibration1Click(Sender: TObject);
begin
with TfmTileServerCalibrator.Create(ObjFunctionality.Space,ObjFunctionality.idObj) do Show();
end;

procedure TTileServerVisualizationPanelProps.cbServerTypeChange(Sender: TObject);
begin
Updater.Disable;
try
TTileServerVisualizationFunctionality(ObjFunctionality).SetServerType(cbServerType.ItemIndex);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TTileServerVisualizationPanelProps.edServerURLKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable;
  try
  TTileServerVisualizationFunctionality(ObjFunctionality).SetServerURL(edServerURL.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TTileServerVisualizationPanelProps.btnServerDataClick(Sender: TObject);
var
  NSD: TNativeTileServerParsedData;
  YSD: TYandexMapsTileServerParsedData;
  GSD: TGoogleMapsTileServerParsedData;
  OSD: TOpenStreetMapsTileServerParsedData;
  NVSD: TNavitelMapsTileServerParsedData;
begin
case TTileServerType(ServerType) of
tstNative: begin
  NSD:=TNativeTileServerParsedData.Create(ServerData);
  try
  with TNativeTileServerDataPanel.Create() do
  try
  if (Dialog())
   then begin
    TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(NSD.ToByteArray());
    end
  finally
  Destroy();
  end;
  finally
  NSD.Destroy();
  end;
  end;
tstYandexMaps: begin
  YSD:=TYandexMapsTileServerParsedData.Create(ServerData);
  try
  with TYandexMapsTileServerDataPanel.Create() do
  try
  if (Dialog())
   then begin
    TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(YSD.ToByteArray());
    end
  finally
  Destroy();
  end;
  finally
  YSD.Destroy();
  end;
  end;
tstGoogleMaps: begin
  GSD:=TGoogleMapsTileServerParsedData.Create(ServerData);
  try
  with TGoogleMapsTileServerDataPanel.Create() do
  try
  if (Dialog())
   then begin
    TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(GSD.ToByteArray());
    end
  finally
  Destroy();
  end;
  finally
  GSD.Destroy();
  end;
  end;
tstOpenStreetMaps: begin
  OSD:=TOpenStreetMapsTileServerParsedData.Create(ServerData);
  try
  with TOpenStreetMapsTileServerDataPanel.Create() do
  try
  if (Dialog())
   then begin
    TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(OSD.ToByteArray());
    end
  finally
  Destroy();
  end;
  finally
  OSD.Destroy();
  end;
  end;
tstNavitelMaps: begin
  NVSD:=TNavitelMapsTileServerParsedData.Create(ServerData);
  try
  with TNavitelMapsTileServerDataPanel.Create() do
  try
  if (Dialog())
   then begin
    TTileServerVisualizationFunctionality(ObjFunctionality).SetServerData(NVSD.ToByteArray());
    end
  finally
  Destroy();
  end;
  finally
  NVSD.Destroy();
  end;
  end;
end;
end;

procedure TTileServerVisualizationPanelProps.Loadtolocalcontext1Click(Sender: TObject);
begin
with TfmTileServerVisualizationLocalContextLoader.Create(ObjFunctionality.Space,ObjFunctionality.idObj) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TTileServerVisualizationPanelProps.AddnewProvider1Click(Sender: TObject);
begin
lvTileProviders_AddNew();
end;

procedure TTileServerVisualizationPanelProps.DeleteselectedProvider1Click(Sender: TObject);
var
  ID: integer;
begin
if (lvTileProviders.Selected = nil) then Exit; //. ->
if (MessageDlg('Delete selected Provider?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
ID:=Integer(lvTileProviders.Selected.Data);
lvTileProviders_Delete(ID);
end;

procedure TTileServerVisualizationPanelProps.EditselectedProvider1Click(Sender: TObject);
var
  ID: integer;
begin
if (lvTileProviders.Selected = nil) then Exit; //. ->
ID:=Integer(lvTileProviders.Selected.Data);
lvTileProviders_Edit(ID);
end;

procedure TTileServerVisualizationPanelProps.Controls_ClearPropData;
begin
cbServerType.ItemIndex:=-1;
edServerURL.Text:='';
lvTileProviders.Items.Clear();
end;


end.
