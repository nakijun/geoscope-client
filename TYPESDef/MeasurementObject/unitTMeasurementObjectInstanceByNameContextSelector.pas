unit unitTMeasurementObjectInstanceByNameContextSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality;

type
  TInstanceSearching = class;

  TInstanceItem = record
    id: integer;
    GUID: shortstring;
    idOwner: integer;
    Name: shortstring;
    Domains: shortstring;
  end;

  TIntanceItems = array of TInstanceItem;

  TfmTMeasurementObjectInstanceByNameContextSelector = class(TForm)
    lvObjects: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    edNameContext: TEdit;
    procedure lvObjectsDblClick(Sender: TObject);
    procedure edNameContextKeyPress(Sender: TObject; var Key: Char);
    procedure lvObjectsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Space: TProxySpace;
    InstanceSearching: TInstanceSearching;
    Items: TIntanceItems;

    procedure lvObjects_UpdateByData(const Data: TByteArray);
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy(); override;
    procedure StartSearching(const NameContext: string);
  end;

  TInstanceSearching = class(TThread)
  private
    fmTMeasurementObjectInstanceByNameContextSelector: TfmTMeasurementObjectInstanceByNameContextSelector;
    NameContext: string;
    //.
    Data: TByteArray;
    //.
    ThreadException: Exception;

    Constructor Create(const pfmTMeasurementObjectInstanceByNameContextSelector: TfmTMeasurementObjectInstanceByNameContextSelector; const pNameContext: string);
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
  ItemsDataVersion = 1;

implementation

{$R *.dfm}


Constructor TfmTMeasurementObjectInstanceByNameContextSelector.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
InstanceSearching:=nil;
end;

Destructor TfmTMeasurementObjectInstanceByNameContextSelector.Destroy();
begin
if (InstanceSearching <> nil)
 then begin
  InstanceSearching.Cancel();
  InstanceSearching.fmTMeasurementObjectInstanceByNameContextSelector:=nil;
  InstanceSearching:=nil;
  end;
Inherited;
end;

procedure TfmTMeasurementObjectInstanceByNameContextSelector.StartSearching(const NameContext: string);
begin
if (InstanceSearching <> nil) then InstanceSearching.Cancel();
InstanceSearching:=TInstanceSearching.Create(Self,NameContext);
//.
lvObjects.Clear();
lvObjects.Items.Add().Caption:='Searching...';
lvObjects.GridLines:=false;
end;

procedure TfmTMeasurementObjectInstanceByNameContextSelector.lvObjects_UpdateByData(const Data: TByteArray);
var
  LastSelectedItemID: integer;
  //.
  Version: integer;
  ItemsCount: integer;
  //.
  Idx: integer;
  I: integer;
  SS: integer;
  S: string;
begin
try
if (Data = nil)
 then begin
  SetLength(Items,0);
  lvObjects.Items.Clear();
  //.
  ShowMessage('No items found.');
  //.
  Exit; //. ->
  end;
Idx:=0;
Version:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(Version));
if (Version <> ItemsDataVersion) then Raise Exception.Create('unknown tasks data version'); //. =>
//.
lvObjects.Items.BeginUpdate();
try
LastSelectedItemID:=0;
if (lvObjects.ItemIndex <> -1) then LastSelectedItemID:=Integer(lvObjects.Items[lvObjects.ItemIndex].Data);
lvObjects.Items.Clear();
//.
ItemsCount:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(ItemsCount));
SetLength(Items,ItemsCount);
if (ItemsCount = 0)
 then begin
  ShowMessage('No items found.');
  Exit; //. ->
  end;
for I:=0 to ItemsCount-1 do with Items[I] do begin
  id:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(id));
  SS:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(SS)); SetLength(S,SS); if (SS > 0) then begin Move(Pointer(@Data[Idx])^,Pointer(@S[1])^,SS); Inc(Idx,SS); end; GUID:=S;
  idOwner:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(idOwner));
  SS:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(SS)); SetLength(S,SS); if (SS > 0) then begin Move(Pointer(@Data[Idx])^,Pointer(@S[1])^,SS); Inc(Idx,SS); end; Name:=S;
  SS:=Integer(Pointer(@Data[Idx])^); Inc(Idx,SizeOf(SS)); SetLength(S,SS); if (SS > 0) then begin Move(Pointer(@Data[Idx])^,Pointer(@S[1])^,SS); Inc(Idx,SS); end; Domains:=S;
  //.
  with lvObjects.Items.Add do begin
  Data:=Pointer(id);
  //.
  Caption:=Items[I].Name;
  //.
  SubItems.Add(Domains);
  SubItems.Add(GUID);
  SubItems.Add(IntToStr(id));
  end;
  //.
  if (id = LastSelectedItemID) then lvObjects.ItemIndex:=I;
  end;
finally
lvObjects.Items.EndUpdate();
end;
finally
lvObjects.GridLines:=true;
end;
//.
lvObjects.SetFocus();
if (lvObjects.Items.Count > 0) then lvObjects.ItemIndex:=0; 
end;

procedure TfmTMeasurementObjectInstanceByNameContextSelector.edNameContextKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D) then StartSearching(edNameContext.Text);
end;

procedure TfmTMeasurementObjectInstanceByNameContextSelector.lvObjectsDblClick(Sender: TObject);
var
  SC: TCursor;
begin
if (lvObjects.ItemIndex = -1) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
with TMeasurementObjectFunctionality(TComponentFunctionality_Create(idTMeasurementObject, Integer(lvObjects.Items[lvObjects.ItemIndex].Data))) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmTMeasurementObjectInstanceByNameContextSelector.lvObjectsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: lvObjectsDblClick(nil);
end;
end;


{TInstanceSearching}
Constructor TInstanceSearching.Create(const pfmTMeasurementObjectInstanceByNameContextSelector: TfmTMeasurementObjectInstanceByNameContextSelector; const pNameContext: string);
begin
fmTMeasurementObjectInstanceByNameContextSelector:=pfmTMeasurementObjectInstanceByNameContextSelector;
NameContext:=pNameContext;
Data:=nil;
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TInstanceSearching.Destroy();
begin
Cancel();
Inherited;
end;

procedure TInstanceSearching.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TInstanceSearching.Execute();
begin
try
if (Terminated) then Exit; //. ->
Data:=nil;
with TTMeasurementObjectFunctionality(TTypeFunctionality_Create(idTMeasurementObject)) do
try
GetInstanceDataByNameContext(NameContext, ItemsDataVersion,{out} Data);
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

procedure TInstanceSearching.DoOnLoading;
begin
if (Terminated) then Exit; //. ->
fmTMeasurementObjectInstanceByNameContextSelector.lvObjects_UpdateByData(Data);
end;

procedure TInstanceSearching.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
fmTMeasurementObjectInstanceByNameContextSelector.lvObjects.Clear();
fmTMeasurementObjectInstanceByNameContextSelector.lvObjects.GridLines:=true;
//.
Application.MessageBox(PChar('error while loading data, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TInstanceSearching.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TInstanceSearching.Finalize();
begin
if (fmTMeasurementObjectInstanceByNameContextSelector = nil) then Exit; //. ->
//.
if (fmTMeasurementObjectInstanceByNameContextSelector.InstanceSearching = Self) then fmTMeasurementObjectInstanceByNameContextSelector.InstanceSearching:=nil;
end;

procedure TInstanceSearching.Cancel();
begin
Terminate();
end;


end.
