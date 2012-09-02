unit unitGeoSpaceMapFormatMapBatchCreatePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality,
  unitPFMLoader,
  unitPFTypesFilter;

type
  TfmGeoSpaceMapFormatMapBatchCreatePanel = class(TForm)
    Panel2: TPanel;
    memoLog: TMemo;
    Panel3: TPanel;
    cbInfoEvents: TCheckBox;
    cbWarningEvents: TCheckBox;
    cbErrorEvents: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    edSourceFolder: TEdit;
    btnSelectSourceFolder: TBitBtn;
    Label2: TLabel;
    edProcessCount: TEdit;
    cbSkipOnDuplicate: TCheckBox;
    cbCreatedObjectsFile: TCheckBox;
    ProgressBar: TProgressBar;
    btnProcess: TBitBtn;
    procedure btnSelectSourceFolderClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    idGeoSpace: integer;
    idMapPrototype: integer;
    ProcessCount: integer;

    procedure Validate();
    procedure GetMapFileList(out MapList: TStringList);
    function ProcessNewMap(const MapFileName: string; const PFMapObjectTypesFilter: TPFMapObjectTypesFilter): integer;
    procedure DoOnHeaderProcessed(const Header: TMapHeader; const PMFileSection: ANSIString);
    procedure DoOnPointCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
    procedure DoOnPointCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
    procedure DoOnPointCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
    procedure DoOnPolylineCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
    procedure DoOnPolylineCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
    procedure DoOnPolylineCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
    procedure DoOnPolygonCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
    procedure DoOnPolygonCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
    procedure DoOnPolygonCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace; const pidGeoSpace: integer; const pidMapPrototype: integer);
    procedure Process();
  end;


implementation
uses
  FileCtrl;

{$R *.dfm}


{TTfmGeoSpaceMapFormatMapBatchCreatePanel}
Constructor TfmGeoSpaceMapFormatMapBatchCreatePanel.Create(const pSpace: TProxySpace; const pidGeoSpace: integer; const pidMapPrototype: integer);
begin
Inherited Create(nil);
Space:=pSpace;
idGeoSpace:=pidGeoSpace;
idMapPrototype:=pidMapPrototype;
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.Validate();
begin
if (edSourceFolder.Text = '') then Raise Exception.Create('map file source folder is not selected'); //. =>
try
ProcessCount:=StrToInt(edProcessCount.Text);   
except
  On E: Exception do Raise Exception.Create('error of map count, '+E.Message); //. =>
  end;
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.Process();
var
  MapFileList: TStringList;
  PFMapObjectTypesFilter: TPFMapObjectTypesFilter;
  Cnt,I: integer;
begin
Validate();
GetMapFileList({out} MapFileList);
try
if (MapFileList.Count = 0) then Raise Exception.Create('map file source folder is empty'); //. =>
PFMapObjectTypesFilter:=TPFMapObjectTypesFilter.Create;
try
with TfmPFTypesFilter.Create(PFMapObjectTypesFilter) do
try
if (NOT Dialog()) then Exit; //. ->
finally
Destroy;
end;
ProgressBar.Min:=0;
ProgressBar.Max:=MapFileList.Count;
ProgressBar.Position:=0;
Cnt:=MapFileList.Count;
if (Cnt > ProcessCount) then Cnt:=ProcessCount;
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Start batch process for folder: '+edSourceFolder.Text+', process count: '+IntToStr(Cnt));
for I:=0 to Cnt-1 do begin
  ProcessNewMap(MapFileList[I],PFMapObjectTypesFilter);
  ProgressBar.Position:=I+1;
  //.
  Repaint();
  end;
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Batch process is finished successfully for folder: '+edSourceFolder.Text);
finally
MapFileList.Destroy;
end;
finally
PFMapObjectTypesFilter.Destroy;
end;
end;

function TfmGeoSpaceMapFormatMapBatchCreatePanel.ProcessNewMap(const MapFileName: string; const PFMapObjectTypesFilter: TPFMapObjectTypesFilter): integer;
var
  idNewMap: integer;
  TFN: string;
  BA: TByteArray;
  flAutomaticUpdateIsDisabledLast: boolean;
begin
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapPrototype)) do
try
ToClone({out} idNewMap);
finally
Release;
end;
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idNewMap)) do
try
GeoSpaceID:=idGeoSpace;
finally
Release;
end;
//.
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': new map is creating, map ID: '+IntToStr(idNewMap));
//.
TFN:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.ini';
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idNewMap)) do
try
GetObjectPrototypesDATA({out} BA);
with TMemoryStream.Create do
try
Write(Pointer(@BA[0])^,Length(BA));
SaveToFile(TFN);
finally
Destroy;
end;
finally
Release;
end;
//.
with TPFMapLoader.Create(Space,idNewMap,idGeoSpace,cbSkipOnDuplicate.Checked,cbCreatedObjectsFile.Checked) do
try
ObjectTypesFilter:=PFMapObjectTypesFilter;
//.
OnHeaderProcessed:=DoOnHeaderProcessed;
OnPointCreated:=DoOnPointCreated;
OnPointCreateWarning:=DoOnPointCreateWarning;
OnPointCreateError:=DoOnPointCreateError;
OnPolylineCreated:=DoOnPolylineCreated;
OnPolylineCreateWarning:=DoOnPolylineCreateWarning;
OnPolylineCreateError:=DoOnPolylineCreateError;
OnPolygonCreated:=DoOnPolygonCreated;
OnPolygonCreateWarning:=DoOnPolygonCreateWarning;
OnPolygonCreateError:=DoOnPolygonCreateError;
//.
flAutomaticUpdateIsDisabledLast:=Space.flAutomaticUpdateIsDisabled;
try
Space.flAutomaticUpdateIsDisabled:=true;
//.
Space.DisableUpdating();
try
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map loading is started');
Load(TFN,MapFileName);
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map loading is finished. Number of created objects: '+IntToStr(CreatedObjectsCounter));
finally
Space.EnableUpdating();
end;
finally
Space.flAutomaticUpdateIsDisabled:=flAutomaticUpdateIsDisabledLast;
end;
finally
Destroy;
end;
//. remove map file after new map creation
DeleteFile(MapFileName);
//.
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': map is created from file: '+MapFileName+', map ID: '+IntToStr(idNewMap));
memoLog.Lines.Add('');
memoLog.Lines.Add('');
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.GetMapFileList(out MapList: TStringList);
var
  Folder: string;
  sr: TSearchRec;
  FN: string;
begin
Folder:=edSourceFolder.Text;
MapList:=TStringList.Create();
try
if (FindFirst(Folder+'\*.mp', faAnyFile-faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
     then begin
      FN:=Folder+'\'+sr.name;
      MapList.Add(FN);
      end;
  until (FindNext(sr) <> 0);
  finally
  FindClose(sr);
  end;
except
  FreeAndNil(MapList);
  Raise; //. =>
  end;
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.btnSelectSourceFolderClick(Sender: TObject);
var
  Path: string;
begin
if (SelectDirectory('Select directory ->','',Path)) then edSourceFolder.Text:=Path;
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.btnProcessClick(Sender: TObject);
begin
if (MessageDlg('Do you want to start batch creating ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
Process();
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnHeaderProcessed(const Header: TMapHeader; const PMFileSection: ANSIString);
begin
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map - '+Header.Name);
memoLog.Lines.Add('ID: '+Header.ID);
memoLog.Lines.Add('Datum: '+IntToStr(Header.DatumID));
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPointCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': point is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPointCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating point, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPointCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating point, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolylineCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Polyline is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolylineCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating polyline, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolylineCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating polyline, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolygonCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Polygon is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolygonCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating polygon, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmGeoSpaceMapFormatMapBatchCreatePanel.DoOnPolygonCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating polygon, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;


end.
