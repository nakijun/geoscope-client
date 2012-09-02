unit unitSpaceCleaner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, Buttons, Gauges, StdCtrls,
  unitProxySpace, Functionality, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  RXCtrls, ExtCtrls;

type
  TfmSpaceCleaner = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    URCTypesSystemProgressBar: TGauge;
    URCTypeSystem: TLabel;
    URCTypeSystemProgressBar: TGauge;
    sbURCSearchStart: TSpeedButton;
    sbURCSearchStop: TSpeedButton;
    TabSheet2: TTabSheet;
    lbURCTypesSystem: TLabel;
    lbURCTypeSystem: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lvURCList: TListView;
    sbURCDestroySelectedItems: TRxSpeedButton;
    Label2: TLabel;
    NCTypesSystemProgressBar: TGauge;
    lbNCTypesSystem: TLabel;
    NCTypeSystem: TLabel;
    NCTypeSystemProgressBar: TGauge;
    lbNCTypeSystem: TLabel;
    sbNCSearchStart: TSpeedButton;
    sbNCSearchStop: TSpeedButton;
    Panel3: TPanel;
    Panel4: TPanel;
    sbNCDestroySelectedItems: TRxSpeedButton;
    lvNCList: TListView;
    procedure sbURCSearchStartClick(Sender: TObject);
    procedure sbURCSearchStopClick(Sender: TObject);
    procedure lvURCListDblClick(Sender: TObject);
    procedure sbURCDestroySelectedItemsClick(Sender: TObject);
    procedure sbNCSearchStartClick(Sender: TObject);
    procedure sbNCSearchStopClick(Sender: TObject);
    procedure sbNCDestroySelectedItemsClick(Sender: TObject);
    procedure lvNCListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TypesSystem: TTypesSystem;
    URCList: TComponentsList;
    NCList: TComponentsList;
    flURCSearchingCancel: boolean;
    flNCSearchingCancel: boolean;

    procedure URC_Update;
    procedure URC_Search;
    procedure URC_StopSearching;
    procedure lvURCList_DestroySelectedItems;
    procedure NC_Update;
    procedure NC_Search;
    procedure NC_StopSearching;
    procedure lvNCList_DestroySelectedItems;
  public
    { Public declarations }
    Constructor Create(pTypesSystem: TTypesSystem);
    Destructor Destroy; override;
    procedure Update;
  end;


implementation

{$R *.dfm}


{TfmSpaceCleaner}
Constructor TfmSpaceCleaner.Create(pTypesSystem: TTypesSystem);
begin
Inherited Create(nil);
TypesSystem:=pTypesSystem;
URCList:=TComponentsList.Create;
NCList:=TComponentsList.Create;
Update;
end;

Destructor TfmSpaceCleaner.Destroy;
begin
URCList.Free;
Inherited;
end;

procedure TfmSpaceCleaner.Update;
begin
URC_Update;
NC_Update;
end;

procedure TfmSpaceCleaner.URC_Update;
begin
lvURCList.SmallImages:=TypesImageList;
end;

procedure TfmSpaceCleaner.URC_Search;
var
  I,J: integer;
  InstanceList: TList;
begin
URCTypesSystemProgressBar.Progress:=0;
flURCSearchingCancel:=false;
URCList.Clear;
try
with TypesSystem do
for I:=0 to Count-1 do if Enabled then with TTypeSystem(List[I]).TypeFunctionalityClass.Create do
  try
  try
  GetInstanceList(InstanceList);
  try
  URCTypeSystemProgressBar.Progress:=0;
  URCTypeSystem.Caption:='TypeSystem - '+Name;
  for J:=0 to InstanceList.Count-1 do begin
    with Functionality.TComponentFunctionality_Create(TTypeSystem(List[I]).idType,Integer(InstanceList[J])) do
    try
    try
    if IsUnReferenced then URCList.AddComponent(idTObj,idObj, 0);
    except
      end;
    finally
    Release;
    end;
    URCTypeSystemProgressBar.Progress:=Round((J/InstanceList.Count)*100);
    lbURCTypeSystem.Caption:='('+IntToStr(J+1)+'/'+IntToStr(InstanceList.Count)+')';
    Application.ProcessMessages;
    if flURCSearchingCancel then begin flURCSearchingCancel:=false; Break; end;//. Raise Exception.Create('searching terminated by user'); //. =>
    end;
  URCTypeSystemProgressBar.Progress:=100;
  finally
  InstanceList.Destroy;
  end;
  except
    end;
  URCTypesSystemProgressBar.Progress:=Round((I/Count)*100);
  lbURCTypesSystem.Caption:='('+IntToStr(I+1)+'/'+IntToStr(Count)+')';
  finally
  Release;
  end;
finally
//. update list view
with lvURCList.Items do begin
Clear;
lvURCList.Items.BeginUpdate;
try
for J:=0 to URCList.Count-1 do with TItemComponentsList(URCList[J]^) do
  with lvURCList.Items.Add,TComponentFunctionality_Create(idTComponent,idComponent) do
  try
  try
  Caption:=Name;
  except
    On E: Exception do Caption:=TypeFunctionality.Name+' - '+E.Message;
    end;
  ImageIndex:=TypeFunctionality.ImageList_Index;
  finally
  Release;
  end;
finally
lvURCList.Items.EndUpdate;
end;
end;
//.
URCTypesSystemProgressBar.Progress:=100;
end;
end;

procedure TfmSpaceCleaner.URC_StopSearching;
begin
flURCSearchingCancel:=true;
end;


procedure TfmSpaceCleaner.sbURCSearchStartClick(Sender: TObject);
begin
URC_Search;
end;

procedure TfmSpaceCleaner.sbURCSearchStopClick(Sender: TObject);
begin
URC_StopSearching;
end;

procedure TfmSpaceCleaner.lvURCListDblClick(Sender: TObject);
begin
if lvURCList.Selected = nil then Exit; //. ->
with TItemComponentsList(URCList[lvURCList.ItemIndex]^) do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check;
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TfmSpaceCleaner.lvURCList_DestroySelectedItems;
var
  I: integer;
  SC: TCursor;
  ptrDestroyItem: pointer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with lvURCList do begin
I:=0;
while I < URCList.Count-1 do
  if Items[I].Selected
   then with TTypeFunctionality_Create(TItemComponentsList(URCList[I]^).idTComponent) do begin
    try
    DestroyInstance(TItemComponentsList(URCList[I]^).idComponent);
    finally
    Release;
    end;
    //. Delete URCList item
    ptrDestroyItem:=URCList[I];
    URCList[I]:=nil;
    URCList.Delete(I);
    FreeMem(ptrDestroyItem,SizeOf(TItemComponentsList));
    //.
    Items[I].Delete;
    end
   else
    Inc(I);
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmSpaceCleaner.sbURCDestroySelectedItemsClick(Sender: TObject);
begin
if MessageDlg('Are you really want to destroy selected items', mtWarning, [mbYES,mbNO], 0) = mrYes then lvURCList_DestroySelectedItems;
end;

procedure TfmSpaceCleaner.NC_Update;
begin
lvNCList.SmallImages:=TypesImageList;
end;

procedure TfmSpaceCleaner.NC_Search;
var
  I,J: integer;
  InstanceList: TList;
begin
NCTypesSystemProgressBar.Progress:=0;
flNCSearchingCancel:=false;
NCList.Clear;
try
with TypesSystem do
for I:=0 to Count-1 do with TTypeSystem(List[I]).TypeFunctionalityClass.Create do
  try
  try
  GetInstanceList(InstanceList);
  try
  NCTypeSystemProgressBar.Progress:=0;
  NCTypeSystem.Caption:='TypeSystem - '+Name;
  for J:=0 to InstanceList.Count-1 do begin
    with Functionality.TComponentFunctionality_Create(TTypeSystem(List[I]).idType,Integer(InstanceList[J])) do
    try
    if IsUnReferenced then NCList.AddComponent(idTObj,idObj, 0);
    finally
    Release;
    end;
    NCTypeSystemProgressBar.Progress:=Round((J/InstanceList.Count)*100);
    lbNCTypeSystem.Caption:='('+IntToStr(J+1)+'/'+IntToStr(InstanceList.Count)+')';
    Application.ProcessMessages;
    if flNCSearchingCancel then begin flNCSearchingCancel:=false; Break; end;//. Raise Exception.Create('searching terminated by user'); //. =>
    end;
  NCTypeSystemProgressBar.Progress:=100;
  finally
  InstanceList.Destroy;
  end;
  except
    end;
  NCTypesSystemProgressBar.Progress:=Round((I/Count)*100);
  lbNCTypesSystem.Caption:='('+IntToStr(I+1)+'/'+IntToStr(Count)+')';
  finally
  Release;
  end;
finally
//. update list view
with lvNCList.Items do begin
Clear;
lvNCList.Items.BeginUpdate;
try
for J:=0 to NCList.Count-1 do with TItemComponentsList(NCList[J]^) do
  with lvNCList.Items.Add,TComponentFunctionality_Create(idTComponent,idComponent) do
  try
  Caption:=Name;
  ImageIndex:=TypeFunctionality.ImageList_Index;
  finally
  Release;
  end;
finally
lvNCList.Items.EndUpdate;
end;
end;
//.
NCTypesSystemProgressBar.Progress:=100;
end;
end;

procedure TfmSpaceCleaner.NC_StopSearching;
begin
flNCSearchingCancel:=true;
end;

procedure TfmSpaceCleaner.sbNCSearchStartClick(Sender: TObject);
begin
NC_Search;
end;

procedure TfmSpaceCleaner.sbNCSearchStopClick(Sender: TObject);
begin
NC_StopSearching;
end;

procedure TfmSpaceCleaner.lvNCListDblClick(Sender: TObject);
begin
if lvNCList.Selected = nil then Exit; //. ->
with TItemComponentsList(NCList[lvNCList.ItemIndex]^) do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check;
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TfmSpaceCleaner.lvNCList_DestroySelectedItems;
var
  I: integer;
  SC: TCursor;
  ptrDestroyItem: pointer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with lvNCList do begin
I:=0;
while I < NCList.Count-1 do
  if Items[I].Selected
   then with TTypeFunctionality_Create(TItemComponentsList(NCList[I]^).idTComponent) do begin
    try
    DestroyInstance(TItemComponentsList(NCList[I]^).idComponent);
    finally
    Release;
    end;
    //. Delete NCList item
    ptrDestroyItem:=NCList[I];
    NCList[I]:=nil;
    NCList.Delete(I);
    FreeMem(ptrDestroyItem,SizeOf(TItemComponentsList));
    //.
    Items[I].Delete;
    end
   else
    Inc(I);
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmSpaceCleaner.sbNCDestroySelectedItemsClick(Sender: TObject);
begin
if MessageDlg('Are you really want to destroy selected items', mtWarning, [mbYES,mbNO], 0) = mrYes then lvNCList_DestroySelectedItems;
end;

procedure TfmSpaceCleaner.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
