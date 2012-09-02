unit unitComponentsPanelsHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls;

const
  HistoryMaxLength = 10;
type
  TItemOfHistory = packed record
    idTObj,idObj: integer;
    flVisible: boolean;
    Left: integer;
    Top: integer;
    Width: integer;
    Height: integer;
  end;

  TComponentsPanelsHistory = class(TList)
  private
    Space: TObject;
  public
    Constructor Create(pSpace: TObject);
    Destructor Destroy; override;
    procedure Clear;
    procedure Load;
    procedure Save;
    function Add(const pidTObj,pidObj: integer): pointer;
    procedure Remove(const pidTObj,pidObj: integer);
    procedure SetVisibility(const pidTObj,pidObj: integer;  const pflVisibility: boolean);
    procedure SetParams(const pidTObj,pidObj: integer;  const pLeft,pTop,pWidth,pHeight: integer);
  end;

  TfmComponentsPanelsHistory = class(TForm)
    lvHistory: TListView;
    procedure lvHistoryDblClick(Sender: TObject);
  private
    { Private declarations }
    Space: TObject;
    flDisabled: boolean;

    procedure ShowPanelByIndex(const Index: integer);
  public
    History: TComponentsPanelsHistory;

    { Public declarations }
    Constructor Create(pSpace: TObject);
    Destructor Destroy; override;
    procedure Update;
    procedure lvHistory_Update;
    procedure lvHistory_UpdateItem(const ixItem: integer);
    procedure lvHistory_Add(const ptrNewItem: pointer);
    procedure lvHistory_Remove(const pidTObj,pidObj: integer);
    procedure AddObject(const idTObj,idObj: integer);
    procedure SetObjectVisibility(const idTObj,idObj: integer;  const flVisibility: boolean);
    procedure ShowVisiblePanels;
    procedure ShowSelectedPanel;
  end;

implementation
Uses
  unitEventLog,
  GlobalSpaceDefines,
  unitProxySpace,
  FunctionalitySOAPInterface,
  Functionality,
  TypesFunctionality;

{$R *.dfm}


{TComponentsPanelsHistory}
Constructor TComponentsPanelsHistory.Create(pSpace: TObject);
begin
Inherited Create;
Space:=pSpace;
end;

Destructor TComponentsPanelsHistory.Destroy;
begin
Save;
Inherited;
end;

procedure TComponentsPanelsHistory.Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
for I:=0 to Count-1 do begin
  ptrDestroyItem:=List[I];
  FreeMem(ptrDestroyItem,SizeOf(TItemOfHistory));
  end;
Inherited Clear;
end;

procedure TComponentsPanelsHistory.Load;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure ReadFromStream(Stream: TStream);
  var
    NewItem: TItemOfHistory;
    ptrNewItem: pointer;
  begin
  Clear;
  try
  while Stream.Read(NewItem,SizeOf(NewItem)) = SizeOf(NewItem) do begin
    GetMem(ptrNewItem,SizeOf(TItemOfHistory));
    TItemOfHistory(ptrNewItem^):=NewItem;
    Inherited Add(ptrNewItem);
    end;
  except
    On E: Exception do EventLog.WriteMajorEvent('ComponentsPanelsHistory','Cannot read ProxySpace all configuration (idProxySpace = '+IntToStr(ProxySpace.idUserProxySpace)+').',E.Message);
    end;
  end;

begin
Clear;
//. read user history
with TProxySpace(Space) do 
with GetISpaceUserProxySpace(SOAPServerURL) do
if Get_ComponentsPanelsHistory(UserName,UserPassword,idUserProxySpace,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  ReadFromStream(MemoryStream);
  finally
  MemoryStream.Destroy;
  end;
  end;
end;

procedure TComponentsPanelsHistory.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure WriteIntoStream(Stream: TStream);
  var
    I: integer;
  begin
  for I:=0 to HistoryMaxLength-1 do begin
    if I >= Count then Exit; //. ->
    Stream.Write(TItemOfHistory(List[I]^),SizeOf(TItemOfHistory));
    end;
  end;

begin
//. write user history
MemoryStream:=TMemoryStream.Create;
try
WriteIntoStream(MemoryStream);
with TProxySpace(Space) do
with GetISpaceUserProxySpace(SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_ComponentsPanelsHistory(UserName,UserPassword,idUserProxySpace,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

function TComponentsPanelsHistory.Add(const pidTObj,pidObj: integer): pointer;
var
  ptrNewItem: pointer;
begin
Remove(pidTObj,pidObj);
GetMem(ptrNewItem,SizeOf(TItemOfHistory));
with TItemOfHistory(ptrNewItem^) do begin
idTObj:=pidTObj;
idObj:=pidObj;
flVisible:=true;
Left:=0;
Top:=0;
Width:=100;
Top:=100;
end;
Inherited Insert(0,ptrNewItem);
Result:=ptrNewItem;
end;

procedure TComponentsPanelsHistory.Remove(const pidTObj,pidObj: integer);
var
  I: integer;
  ptrDestroyItem: pointer;
begin
I:=0;
while I < Count do with TItemOfHistory(List[I]^) do
  if (idTObj = pidTObj) AND (idObj = pidObj)
   then begin
    ptrDestroyItem:=List[I];
    Delete(I);
    FreeMem(ptrDestroyItem,SizeOf(TItemOfHistory));
    end
   else
    Inc(I);
end;

procedure TComponentsPanelsHistory.SetVisibility(const pidTObj,pidObj: integer;  const pflVisibility: boolean);
var
  I: integer;
begin
for I:=0 to Count-1 do with TItemOfHistory(List[I]^) do
  if (idTObj = pidTObj) AND (idObj = pidObj)
   then begin
    flVisible:=pflVisibility;
    Exit; //. ->
    end;
end;

procedure TComponentsPanelsHistory.SetParams(const pidTObj,pidObj: integer;  const pLeft,pTop,pWidth,pHeight: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do with TItemOfHistory(List[I]^) do
  if (idTObj = pidTObj) AND (idObj = pidObj)
   then begin
    Left:=pLeft;
    Top:=pTop;
    Width:=pWidth;
    Height:=pHeight;
    Exit; //. ->
    end;
end;




{TfmComponentsPanelsHistory}
Constructor TfmComponentsPanelsHistory.Create(pSpace: TObject);
begin
Inherited Create(nil);
Space:=pSpace;
History:=TComponentsPanelsHistory.Create(Space);
{$IFDEF ExternalTypes}
lvHistory.SmallImages:=TypesImageList;
{$ENDIF}
Left:=Screen.Width-Width;
Height:=Round(Screen.Height/2-30{TaskBar height});
Top:=Round(Screen.Height/2);
Update;
Show;
ShowVisiblePanels;
end;

Destructor TfmComponentsPanelsHistory.Destroy;
begin
History.Free;
Inherited;
end;

procedure TfmComponentsPanelsHistory.Update;
begin
History.Load;
lvHistory_Update;
end;

procedure TfmComponentsPanelsHistory.AddObject(const idTObj,idObj: integer);
var
  ptrNewItem: pointer;
begin
if flDisabled then Exit; //. ->
ptrNewItem:=History.Add(idTObj,idObj);
lvHistory_Add(ptrNewItem);
end;

procedure TfmComponentsPanelsHistory.SetObjectVisibility(const idTObj,idObj: integer;  const flVisibility: boolean);
begin
if flDisabled then Exit; //. ->
History.SetVisibility(idTObj,idObj, flVisibility);
end;

procedure TfmComponentsPanelsHistory.ShowPanelByIndex(const Index: integer);
begin
with lvHistory.Items[Index] do
with TItemOfHistory(Data^) do with TComponentFunctionality_Create(idTObj,idObj) do
try
Check;
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Left:=TItemOfHistory(Data^).Left;
Top:=TItemOfHistory(Data^).Top;
Width:=TItemOfHistory(Data^).Width;
Height:=TItemOfHistory(Data^).Height;
Show;
end;
finally
Release;
end;
end;

procedure TfmComponentsPanelsHistory.ShowVisiblePanels;
var
  I: integer;
begin
flDisabled:=true;
try
for I:=0 to History.Count-1 do with TItemOfHistory(History[I]^) do
  if flVisible
   then begin
    try ShowPanelByIndex(I); except end;
    Application.ProcessMessages;
    end;
finally
flDisabled:=false;
end;
end;

procedure TfmComponentsPanelsHistory.ShowSelectedPanel;
begin
if lvHistory.Selected <> nil then ShowPanelByIndex(lvHistory.Selected.Index);
end;

procedure TfmComponentsPanelsHistory.lvHistory_Update;
var
  I: integer;
begin
lvHistory.Clear;
lvHistory.Items.BeginUpdate;
try
for I:=0 to History.Count-1 do begin
  lvHistory.Items.Add.Data:=History[I];
  try
  lvHistory_UpdateItem(I);
  except
    lvHistory.Items[I].Caption:='exception raised';
    end;
  end;
finally
lvHistory.Items.EndUpdate;
end;
end;

procedure TfmComponentsPanelsHistory.lvHistory_UpdateItem(const ixItem: integer);
begin
with lvHistory.Items[ixItem] do
with TItemOfHistory(Data^) do with TComponentFunctionality_Create(idTObj,idObj) do
try
Caption:=Name;
ImageIndex:=TypeFunctionality.ImageList_Index;
finally
Release;
end;
end;

procedure TfmComponentsPanelsHistory.lvHistory_Add(const ptrNewItem: pointer);
begin
with TItemOfHistory(ptrNewItem^) do lvHistory_Remove(idTObj,idObj);
with lvHistory.Items.Insert(0) do Data:=ptrNewItem;
lvHistory_UpdateItem(0);
end;

procedure TfmComponentsPanelsHistory.lvHistory_Remove(const pidTObj,pidObj: integer);
var
  I: integer;
begin
with lvHistory do begin
I:=0;
while I < Items.Count do with TItemOfHistory(Items[I].Data^) do
  if (idTObj = pidTObj) AND (idObj = pidObj)
   then Items.Delete(I)
   else Inc(I);
end;
end;


procedure TfmComponentsPanelsHistory.lvHistoryDblClick(Sender: TObject);
begin
ShowSelectedPanel;
end;


end.
