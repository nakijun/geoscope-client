unit unitMeasurementObjectPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, UnitProxySpace, Functionality, TypesDefines,TypesFunctionality,unitReflector,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls;

type
  TGSOMeasurementsLoading = class;

  TGSOMeasurementItem = record
    id: integer;
    TimeID: Double;
    idGSO: integer;
    DataType: integer;
  end;

  TGSOMeasurementItems = array of TGSOMeasurementItem;

  TMeasurementObjectPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edName: TEdit;
    Label2: TLabel;
    edDomains: TEdit;
    Label3: TLabel;
    edID: TEdit;
    lvGSOMeasurements: TListView;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDomainsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvGSOMeasurementsDblClick(Sender: TObject);
    procedure lvGSOMeasurementsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    GSOMeasurementsLoading: TGSOMeasurementsLoading;
    GSOMeasurementItems: TGSOMeasurementItems;

    procedure StartGSOMeasurementsLoading();
    procedure lvGSOMeasurements_UpdateByData(const Data: TByteArray);
    procedure DisableControls();
    procedure Controls_ClearPropData(); override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy(); override;
    procedure _Update(); override;
  end;

  TGSOMeasurementsLoading = class(TThread)
  private
    MeasurementObjectPanelProps: TMeasurementObjectPanelProps;
    idMeasurementObject: integer;
    Data: TByteArray;
    //.
    ThreadException: Exception;

    Constructor Create(const pMeasurementObjectPanelProps: TMeasurementObjectPanelProps);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure DoOnLoading();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel;
  end;

const
  GSOMeasurementItemsDataVersion = 1;

implementation
{$R *.DFM}


{TMeasurementObjectPanelProps}
Constructor TMeasurementObjectPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
GSOMeasurementsLoading:=nil;
if (flReadOnly) then DisableControls();
Update();
end;

destructor TMeasurementObjectPanelProps.Destroy();
begin
if (GSOMeasurementsLoading <> nil)
 then begin
  GSOMeasurementsLoading.Cancel();
  GSOMeasurementsLoading.MeasurementObjectPanelProps:=nil;
  GSOMeasurementsLoading:=nil;
  end;
Inherited;
end;

procedure TMeasurementObjectPanelProps._Update();
var
  GUID: string;
  idOwner: integer;
  _Name: string;
  Domains: string;
begin
Inherited;
TMeasurementObjectFunctionality(ObjFunctionality).GetParams({out} GUID,{out} idOwner,{out} _Name,{out} Domains);
edName.Text:=_Name;
edDomains.Text:=Domains;
edID.Text:=IntToStr(ObjFunctionality.idObj);
//. start updating GSO Measurements
StartGSOMeasurementsLoading();
end;

procedure TMeasurementObjectPanelProps.lvGSOMeasurements_UpdateByData(const Data: TByteArray);
var
  LastSelectedItemID: integer;
  //.
  Version: integer;
  ItemsCount: integer;
  //.
  Idx: integer;
  I: integer;
  S: string;
begin
try
if (Data = nil)
 then begin
  SetLength(GSOMeasurementItems,0);
  lvGSOMeasurements.Items.Clear();
  //.
  ShowMessage('No items found.');
  //.
  Exit; //. ->
  end;
Idx:=0;
Version:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Version));
if (Version <> GSOMeasurementItemsDataVersion) then Raise Exception.Create('unknown tasks data version'); //. =>
//.
lvGSOMeasurements.Items.BeginUpdate();
try
LastSelectedItemID:=0;
if (lvGSOMeasurements.ItemIndex <> -1) then LastSelectedItemID:=Integer(lvGSOMeasurements.Items[lvGSOMeasurements.ItemIndex].Data);
lvGSOMeasurements.Items.Clear();
//.
ItemsCount:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(ItemsCount));
SetLength(GSOMeasurementItems,ItemsCount);
if (ItemsCount = 0) then Exit; //. ->
for I:=0 to ItemsCount-1 do with GSOMeasurementItems[I] do begin
  id:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(id));
  TimeID:=Double(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(TimeID));
  idGSO:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(idGSO));
  DataType:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(DataType));
  //.
  with lvGSOMeasurements.Items.Add do begin
  Data:=Pointer(id);
  //.
  Caption:=FormatDateTime('YYYY.MM.DD HH:NN:SS',TimeID);
  //.
  case (DataType) of
  GEOGRAPHSERVEROBJECT_MEASUREMENT_TYPE_CARDIO_ECG:     S:='Cardio.ECG';
  GEOGRAPHSERVEROBJECT_MEASUREMENT_TYPE_CARDIO_HOLTER:  S:='Cardio.Holter';
  else
    S:='?';
  end;
  SubItems.Add(S);
  SubItems.Add(IntToStr(id));
  end;
  //.
  if (id = LastSelectedItemID) then lvGSOMeasurements.ItemIndex:=I;
  end;
finally
lvGSOMeasurements.Items.EndUpdate();
end;
finally
lvGSOMeasurements.GridLines:=true;
end;
end;

procedure TMeasurementObjectPanelProps.StartGSOMeasurementsLoading();
begin
if (GSOMeasurementsLoading <> nil) then GSOMeasurementsLoading.Cancel();
GSOMeasurementsLoading:=TGSOMeasurementsLoading.Create(Self);
//.
lvGSOMeasurements.Clear();
lvGSOMeasurements.Items.Add().Caption:='Loading...';
lvGSOMeasurements.GridLines:=false;
end;

procedure TMeasurementObjectPanelProps.DisableControls();
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMeasurementObjectPanelProps.Controls_ClearPropData();
begin
edName.Text:='';
edDomains.Text:='';
edID.Text:='';
end;

procedure TMeasurementObjectPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable();
  try
  TMeasurementObjectFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled();
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMeasurementObjectPanelProps.edDomainsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable();
  try
  TMeasurementObjectFunctionality(ObjFunctionality).Domains:=edDomains.Text;
  except
    Updater.Enabled();
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMeasurementObjectPanelProps.lvGSOMeasurementsDblClick(Sender: TObject);
var
  SC: TCursor;
  Data: TByteArray;
begin
if (lvGSOMeasurements.ItemIndex = -1) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
TMeasurementObjectFunctionality(ObjFunctionality).GSOMeasurements_Item_GetData(GSOMeasurementItems[lvGSOMeasurements.ItemIndex].TimeID,{out} Data);
with TMemoryStream.Create() do
try
Write(Pointer(@Data[0])^,Length(Data));
SaveToFile('C:\Data.zip');
finally
Destroy();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TMeasurementObjectPanelProps.lvGSOMeasurementsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: lvGSOMeasurementsDblClick(nil);
end;
end;


{TGSOMeasurementsLoading}
Constructor TGSOMeasurementsLoading.Create(const pMeasurementObjectPanelProps: TMeasurementObjectPanelProps);
begin
MeasurementObjectPanelProps:=pMeasurementObjectPanelProps;
idMeasurementObject:=MeasurementObjectPanelProps.ObjFunctionality.idObj;
Data:=nil;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TGSOMeasurementsLoading.Destroy();
begin
Cancel();
Inherited;
end;

procedure TGSOMeasurementsLoading.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TGSOMeasurementsLoading.Execute();
begin
try
if (Terminated) then Exit; //. ->
Data:=nil;
with TMeasurementObjectFunctionality(TComponentFunctionality_Create(idTMeasurementObject,idMeasurementObject)) do
try
GSOMeasurements_GetData(GSOMeasurementItemsDataVersion,{out} Data);
finally
Destroy();
end;
//.
if (Terminated) then Exit; //. ->
Synchronize(DoOnLoading);
except
  on E: Exception do begin
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TGSOMeasurementsLoading.DoOnLoading;
begin
if (Terminated) then Exit; //. ->
MeasurementObjectPanelProps.lvGSOMeasurements_UpdateByData(Data);
end;

procedure TGSOMeasurementsLoading.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
MeasurementObjectPanelProps.lvGSOMeasurements.Clear();
MeasurementObjectPanelProps.lvGSOMeasurements.GridLines:=true;
//.
Application.MessageBox(PChar('error while loading data, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TGSOMeasurementsLoading.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TGSOMeasurementsLoading.Finalize();
begin
if (MeasurementObjectPanelProps = nil) then Exit; //. ->
//.
if (MeasurementObjectPanelProps.GSOMeasurementsLoading = Self) then MeasurementObjectPanelProps.GSOMeasurementsLoading:=nil;
end;

procedure TGSOMeasurementsLoading.Cancel();
begin
Terminate();
end;


end.
