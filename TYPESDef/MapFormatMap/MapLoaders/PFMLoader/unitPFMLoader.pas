unit unitPFMLoader;

interface

uses
  Windows, Messages, SysUtils, INIFiles, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality,
  GeoTransformations, ExtCtrls, ComCtrls;

const
  TransformationFileName = 'PMFTransformation.ini';
  ObjectsPortionToClearContext = 1000;

type
  TGeoCrd = record
    Lat: double;
    Long: double;
  end;

  TGeoCrdArray = array of TGeoCrd;

  TMapHeader = record
    ID: string;
    Name: string;
    DatumID: integer;
  end;

  TDoOnHeader = procedure (const Header: TMapHeader; const PMFileSection: ANSIString) of object;
  TDoOnPoint = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString) of object;
  TDoOnPolyline = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString) of object;
  TDoOnPolygon = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString) of object;

  TMapParser = class
  public
    OnHeader: TDoOnHeader;
    OnPoint: TDoOnPoint;
    OnPolyline: TDoOnPolyline;
    OnPolygon: TDoOnPolygon;
    PointCount: integer;
    PolylineCount: integer;
    PolygonCount: integer;

    procedure Process; virtual; abstract;
  end;

  TPFMParser = class(TMapParser)
  private
     PFMFile: TextFile;

     function ReadLine(out Line: ANSIString): boolean;
  public
    MapHeader: TMapHeader;

    class function GetNodeValue(const NodeList: TStringList; const NodeName: ANSIString; out Value: ANSIString): boolean;
    class function GetFirstNodeValueMatching(const NodeList: TStringList; const MatchingName: ANSIString; out Value: ANSIString): boolean;
    class procedure GetGeoCrdArray(S: ANSIString; out GeoCrdArray: TGeoCrdArray);

    Constructor Create(const PFMFileName: string);
    Destructor Destroy; override;
    procedure Process; override;
  end;

  TMapObjectTypesFilterItem = record
    KindID: integer;
    TypeID: integer;
    flEnabled: boolean; 
  end;
  
  TMapObjectTypesFilter = class
  public
    Items: array of TMapObjectTypesFilterItem;

    procedure SetItem(const pKindID: integer; const pTypeID: integer; const flEnable: boolean);
    function IsTypeEnabled(const pKindID: integer; const pTypeID: integer): boolean;
    function IsAllTypesEnabled(): boolean;
  end;

  TMapLoader = class
  public
    Space: TProxySpace;
    idMapFormatMap: integer;
    idGeoSpace: integer;
    flSkipOnDuplicate: boolean;
    flFileOfCreatedObjects: boolean;
    ProcessedObjectsCounter: integer;
    CreatedObjectsCounter: integer;
    ObjectTypesFilter: TMapObjectTypesFilter;

    Constructor Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer; const pflSkipOnDuplicate: boolean; const pflFileOfCreatedObjects: boolean); virtual;
    procedure Load(const TransformationFileName: string; const MapFile: string); virtual; abstract;
  end;

  TOnHeaderProcessed = procedure (const Header: TMapHeader; const PMFileSection: ANSIString) of object;
  TOnPointCreated = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer) of object;
  TOnPointCreateWarning = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string) of object;
  TOnPointCreateError = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Error: string) of object;
  TOnPolylineCreated = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer) of object;
  TOnPOlylineCreateWarning = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string) of object;
  TOnPolylineCreateError = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Error: string) of object;
  TOnPolygonCreated = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer) of object;
  TOnPolygonCreateWarning = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string) of object;
  TOnPolygonCreateError = procedure (const TypeID: Integer; const ObjLabel: ANSIString; const Error: string) of object;
  TOnMapFormatObjectIsRemoved = procedure (const idTComponent,idComponent: integer) of object;
  TOnMapFormatObjectRemovingError = procedure (const idTComponent,idComponent: integer; const Error: string) of object;

  TPFMapValidator = class
  private
    Space: TProxySpace;
    _UnknownTypesList: TStringList;
    _DisabledTypesList: TStringList;

    function GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
  public
    TransformationFile: TMemIniFile;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Validate(const TransformationFileName: string; const MapFile: string; out UnknownTypesList: TStringList; out DisabledTypesList: TStringList);
    procedure DoOnHeader(const Header: TMapHeader; const PMFileSection: ANSIString);
    procedure DoOnPoint(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
    procedure DoOnPolyline(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
    procedure DoOnPolygon(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
  end;

  TPFMapLoader = class(TMapLoader)
  private
    CrdSysConvertor: TCrdSysConvertor;
    CreatedMapFormatObjectsFile: TextFile;
    POI_LayID: integer;
    POLYLINE_LayID: integer;
    POLYGON_LayID: integer;

    procedure GetMapDATA(const PMFileSection: ANSIString; out DATA: TMemoryStream);
    function GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    procedure GetMapObjectDATA(const PMFileSection: ANSIString; out DATA: TMemoryStream);
    function ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: double; out X,Y: Extended): boolean;
    function CreateMapFormatObjectByPrototypeAndSet(const idPrototype: integer; const ObjLabel: ANSIString; const ObjKindID: integer; const ObjTypeID: integer; const NodesDatum: integer; const Nodes: TGeoCrdArray; const ObjectDATA: TMemoryStream): integer;
  public
    TransformationFile: TMemIniFile;
    //.
    OnHeaderProcessed: TOnHeaderProcessed;
    OnPointCreated: TOnPointCreated;
    OnPointCreateWarning: TOnPointCreateWarning;
    OnPointCreateError: TOnPointCreateError;
    OnPolylineCreated: TOnPolylineCreated;
    OnPolylineCreateWarning: TOnPolylineCreateWarning;
    OnPolylineCreateError: TOnPolylineCreateError;
    OnPolygonCreated: TOnPolygonCreated;
    OnPolygonCreateWarning: TOnPolygonCreateWarning;
    OnPolygonCreateError: TOnPolygonCreateError;

    class procedure RemoveLoadedMapFormatObjects(const pSpace: TProxySpace; const LoadedMapFormatObjectsFileName: string; const OnMapFormatObjectIsRemoved: TOnMapFormatObjectIsRemoved; const OnMapFormatObjectRemovingError: TOnMapFormatObjectRemovingError);
    Constructor Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer; const pflSkipOnDuplicate: boolean; const pflFileOfCreatedObjects: boolean); override;
    Destructor Destroy; override;
    procedure Load(const TransformationFileName: string; const MapFile: string); override;
    procedure DoOnHeader(const Header: TMapHeader; const PMFileSection: ANSIString);
    procedure DoOnPoint(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
    procedure DoOnPolyline(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
    procedure DoOnPolygon(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
  end;

  TOnObjectRecalculated = procedure (const idMapFormatObject: integer) of object;
  TOnObjectRecalculateWarning = procedure (const idMapFormatObject: integer; const Warning: string) of object;
  TOnObjectRecalculateError = procedure (const idMapFormatObject: integer; const Error: string) of object;

  TPFMapRecalculator = class
  private
    Space: TProxySpace;
    UserName: WideString;
    UserPassword: WideString;
    idMapFormatMap: integer;
    idGeoSpace: integer;
    POI_LayID: integer;
    POLYLINE_LayID: integer;
    POLYGON_LayID: integer;
    CrdSysConvertor: TCrdSysConvertor;
    ProcessedObjectsCounter: integer;

    function GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
    function ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: double; out X,Y: Extended): boolean;
  public
    ObjectTypesFilter: TMapObjectTypesFilter;
    TransformationFile: TMemIniFile;
    OnObjectRecalculated: TOnObjectRecalculated;
    OnObjectRecalculateWarning: TOnObjectRecalculateWarning;
    OnObjectRecalculateError: TOnObjectRecalculateError;

    Constructor Create(const pSpace: TProxySpace; const pUserName,pUserPassword: WideString; const pidMapFormatMap: integer; const pidGeoSpace: integer); overload;
    Constructor Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer); overload;
    procedure Recalculate(const flRecalculateByPrototype: boolean; const idMapFormatObject: integer = 0);
  end;

  TOnMapObjectsRemoving = procedure (const Message: string) of object;
  TOnMapObjectsRemovingError = procedure (const Message: string) of object;

  TPFMapRemover = class
  private
    Space: TProxySpace;
    idMapFormatMap: integer;
  public
    ObjectTypesFilter: TMapObjectTypesFilter;
    OnMapObjectsRemoving: TOnMapObjectsRemoving;
    OnMapObjectsRemovingError: TOnMapObjectsRemovingError;

    Constructor Create(const pSpace: TProxySpace; const pidMapFormatMap: integer);
    procedure Remove();
  end;

  TfmPFMapLoader = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    btnLoadFromFile: TBitBtn;
    OpenDialog: TOpenDialog;
    TabSheet2: TTabSheet;
    btnRemoveComponentsFromFile: TBitBtn;
    StaticText2: TStaticText;
    stMapFileName: TStaticText;
    btnSelectMapFile: TBitBtn;
    btnValidateMapFile: TBitBtn;
    cbSkipOnDuplicate: TCheckBox;
    TabSheet3: TTabSheet;
    btnRecalculate: TBitBtn;
    Panel2: TPanel;
    memoLog: TMemo;
    Panel3: TPanel;
    cbInfoEvents: TCheckBox;
    cbWarningEvents: TCheckBox;
    cbErrorEvents: TCheckBox;
    btnRemove: TBitBtn;
    btnEditObjectPrototypesDATA: TBitBtn;
    cbCreatedObjectsFile: TCheckBox;
    cbRecalculateByPrototype: TCheckBox;
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnRemoveComponentsFromFileClick(Sender: TObject);
    procedure btnSelectMapFileClick(Sender: TObject);
    procedure btnValidateMapFileClick(Sender: TObject);
    procedure btnRecalculateClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditObjectPrototypesDATAClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    idGeoSpace: integer;
    idMapFormatMap: integer;

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
    procedure DoOnObjectRecalculated(const idMapFormatObject: integer);
    procedure DoOnObjectRecalculateWarning(const idMapFormatObject: integer; const Warning: string);
    procedure DoOnObjectRecalculateError(const idMapFormatObject: integer; const Error: string);
    procedure DoOnMapObjectsRemoving(const Message: string);
    procedure DoOnMapObjectsRemovingError(const Message: string);
    procedure DoOnMapFormatObjectIsRemoved(const idTComponent,idComponent: integer);
    procedure DoOnMapFormatObjectRemovingError(const idTComponent,idComponent: integer; const Error: string);
  public
    { Public declarations }

    Constructor Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer);
 end;

implementation
uses
  StrUtils,
  MSXML,
  ActiveX,
  unitPolishMapFormatDefines,
  unitMapFormatMapObjectPrototypesDATAEditor,
  unitPFTypesFilter;

{$R *.dfm}


function FormatFloat(const Format: string; Value: Extended): string;
begin
DecimalSeparator:='.';
Result:=SysUtils.FormatFloat(Format,Value);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TPFMParser}
Constructor TPFMParser.Create(const PFMFileName: string);
begin
Inherited Create;
AssignFile(PFMFile,PFMFileName); Reset(PFMFile);
end;

Destructor TPFMParser.Destroy;
begin
CloseFile(PFMFile);
Inherited;
end;

function TPFMParser.ReadLine(out Line: ANSIString): boolean;
begin
if (EOF(PFMFile))
 then begin
  Result:=false;
  Exit; //. ->
  end;
ReadLn(PFMFile,Line);
Result:=true;
end;

class function TPFMParser.GetNodeValue(const NodeList: TStringList; const NodeName: ANSIString; out Value: ANSIString): boolean;
var
  S: ANSIString;
  LI,I: integer;
begin
Result:=false;
for LI:=0 to NodeList.Count-1 do begin
  S:=NodeList[LI];
  I:=Pos(NodeName,S);
  if (I > 0)
   then begin
    I:=Pos('=',S);
    if ((I = 0) OR (I >= Length(S))) then Exit; //. ->
    Inc(I);
    Value:=Copy(S,I,Length(S)-I+1);
    Result:=true;
    Exit; //. ->
    end;
  end;
end;

class function TPFMParser.GetFirstNodeValueMatching(const NodeList: TStringList; const MatchingName: ANSIString; out Value: ANSIString): boolean;
var
  S: ANSIString;
  LI,I: integer;
begin
Result:=false;
for LI:=0 to NodeList.Count-1 do begin
  S:=NodeList[LI];
  I:=Pos(MatchingName,S);
  if (I = 1)
   then begin
    I:=Pos('=',S);
    if ((I = 0) OR (I >= Length(S))) then Exit; //. ->
    Inc(I);
    Value:=Copy(S,I,Length(S)-I+1);
    Result:=true;
    Exit; //. ->
    end;
  end;
end;

class procedure TPFMParser.GetGeoCrdArray(S: ANSIString; out GeoCrdArray: TGeoCrdArray);

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] = ',')
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

var
  SL: TStringList;
  L,I: integer;
begin
S:=ANSIReplaceStr(S,'(',' ');
S:=ANSIReplaceStr(S,')',' ');
SplitStrings(S, {out} SL);
try
if ((SL.Count MOD 2) = 0)
 then begin
  L:=(SL.Count DIV 2);
  SetLength(GeoCrdArray,L);
  for I:=0 to L-1 do begin
    GeoCrdArray[I].Lat:=StrToFloat(SL[(I SHL 1)]);
    GeoCrdArray[I].Long:=StrToFloat(SL[(I SHL 1)+1]);
    end;
  end;
finally
SL.Destroy;
end;
end;

procedure TPFMParser.Process;

  procedure GetNodeList(const NodeTerminator: ANSIString; out NL: TStringList);
  var
    S: ANSIString;
  begin
  NL:=TStringList.Create;
  try
  repeat
    if (NOT ReadLine({out} S)) then Raise Exception.Create('could not get node terminator'); //. =>
    if ((Length(S) > 0 ))
     then begin
      if (S[1] = '[')
       then begin
        if (Pos(NodeTerminator,S) > 0) then Break; //. >
        Raise Exception.Create('could not get node terminator'); //. =>
        end;
      if (S <> '') then NL.Add(S);
      end;
  until (false);
  except
    FreeAndNil(NL);
    Raise; //. =>
    end;
  end;

  function NodeBody(const NL: TStringList): ANSIString;
  var
    I: integer;
  begin
  Result:='';
  for I:=0 to NL.Count-1 do Result:=Result+NL[I]+#$0D#$0A;
  end;

  procedure ProcessAsHeader();
  var
    NodeList: TStringList;
    DatumStr: ANSIString;
  begin
  GetNodeList(PMFHeaderEndDescriptor, {out} NodeList);
  try
  if (NOT GetNodeValue(NodeList,'ID', {out} MapHeader.ID))
   then MapHeader.ID:='?';
  if (NOT GetNodeValue(NodeList,'Name', {out} MapHeader.Name))
   then MapHeader.Name:='?';
  if (GetNodeValue(NodeList,'Datum', {out} DatumStr))
   then begin
    if (DatumStr = 'W84') then MapHeader.DatumID:=23{WGS-84} else Raise Exception.Create('unknown importing map Datum'); //. =>
    end
   else MapHeader.DatumID:=23; //. WGS-84
  //.
  if (Assigned(OnHeader)) then OnHeader(MapHeader,NodeBody(NodeList));
  finally
  NodeList.Destroy;
  end;
  end;

  procedure ProcessAsPoint();
  var
    NodeList: TStringList;
    TypeIDStr: ANSIString;
    TypeID: integer;
    ObjLabel: ANSIString;
    ValueStr: ANSIString;
    Value: TGeoCrdArray;
  begin
  GetNodeList(PMFPointEndDescriptor, {out} NodeList);
  try
  if (NOT GetNodeValue(NodeList,'Type', {out} TypeIDStr))
   then begin
    Exit; //. ->
    end;
  TypeID:=StrToInt(TypeIDStr);
  if (NOT GetNodeValue(NodeList,'Label', {out} ObjLabel)) then ObjLabel:='';
  if (NOT GetFirstNodeValueMatching(NodeList,'Data0', {out} ValueStr))
   then begin
    Exit; //. ->
    end;
  GetGeoCrdArray(ValueStr, {out} Value);
  //.
  if (Assigned(OnPoint)) then OnPoint(TypeID,ObjLabel,MapHeader.DatumID,Value,NodeBody(NodeList));
  finally
  NodeList.Destroy;
  end;
  //.
  Inc(PointCount);
  end;

  procedure ProcessAsPolyline();
  var
    NodeList: TStringList;
    TypeIDStr: ANSIString;
    TypeID: integer;
    ObjLabel: ANSIString;
    ValueStr: ANSIString;
    Value: TGeoCrdArray;
  begin
  GetNodeList(PMFPolylineEndDescriptor, {out} NodeList);
  try
  if (NOT GetNodeValue(NodeList,'Type', {out} TypeIDStr))
   then begin
    Exit; //. ->
    end;
  TypeID:=StrToInt(TypeIDStr);
  if (NOT GetNodeValue(NodeList,'Label', {out} ObjLabel)) then ObjLabel:='';
  if (NOT GetFirstNodeValueMatching(NodeList,'Data0', {out} ValueStr))
   then begin
    Exit; //. ->
    end;
  GetGeoCrdArray(ValueStr, {out} Value);
  //.
  if (Assigned(OnPolyline)) then OnPolyline(TypeID,ObjLabel,MapHeader.DatumID,Value,NodeBody(NodeList));
  finally
  NodeList.Destroy;
  end;
  //.
  Inc(PolylineCount);
  end;

  procedure ProcessAsPolygon();
  var
    NodeList: TStringList;
    TypeIDStr: ANSIString;
    TypeID: integer;
    ObjLabel: ANSIString;
    ValueStr: ANSIString;
    Value: TGeoCrdArray;
  begin
  GetNodeList(PMFPolygonEndDescriptor, {out} NodeList);
  try
  if (NOT GetNodeValue(NodeList,'Type', {out} TypeIDStr))
   then begin
    Exit; //. ->
    end;
  TypeID:=StrToInt(TypeIDStr);
  if (NOT GetNodeValue(NodeList,'Label', {out} ObjLabel)) then ObjLabel:='';
  if (NOT GetFirstNodeValueMatching(NodeList,'Data0', {out} ValueStr))
   then begin
    Exit; //. ->
    end;
  GetGeoCrdArray(ValueStr, {out} Value);
  //.
  if (Assigned(OnPolygon)) then OnPolygon(TypeID,ObjLabel,MapHeader.DatumID,Value,NodeBody(NodeList));
  finally
  NodeList.Destroy;
  end;
  //.
  Inc(PolygonCount);
  end;

var
  Line: ANSIString;
begin
PointCount:=0;
PolylineCount:=0;
PolygonCount:=0;
repeat
  if (NOT ReadLine({out} Line)) then Exit; //. ->
  //.
  if (Line = PMFHeaderDescriptor) then ProcessAsHeader() else
  if ((Line = PMFPointDescriptor) OR (Line = PMFPointDescriptor1)) then ProcessAsPoint() else
  if ((Line = PMFPolylineDescriptor) OR (Line = PMFPolylineDescriptor1)) then ProcessAsPolyline() else
  if ((Line = PMFPolygonDescriptor) OR (Line = PMFPolygonDescriptor1))   then ProcessAsPolygon();
until (false);
end;


{TMapObjectTypesFilter}
procedure TMapObjectTypesFilter.SetItem(const pKindID: integer; const pTypeID: integer; const flEnable: boolean);
var
  I: integer;
begin
for I:=0 to Length(Items)-1 do
  if ((Items[I].KindID = pKindID) AND (Items[I].TypeID = pTypeID))
   then begin
    Items[I].flEnabled:=flEnable;
    Exit; //. ->
    end; 
end;

function TMapObjectTypesFilter.IsTypeEnabled(const pKindID: integer; const pTypeID: integer): boolean;
var
  I: integer;
begin
Result:=true;
if (Self = nil) then Exit; //. ->
for I:=0 to Length(Items)-1 do
  if ((Items[I].KindID = pKindID) AND (Items[I].TypeID = pTypeID))
   then begin
    Result:=Items[I].flEnabled;
    Exit; //. ->
    end; 
end;

function TMapObjectTypesFilter.IsAllTypesEnabled(): boolean;
var
  I: integer;
begin
if (Self = nil)
 then begin
  Result:=true;
  Exit; //. ->
  end;
Result:=false;
for I:=0 to Length(Items)-1 do
  if (NOT Items[I].flEnabled) then Exit; //. ->
Result:=true;
end;


{TPFMapValidator}
Constructor TPFMapValidator.Create(const pSpace: TProxySpace);
begin
Inherited Create();
Space:=pSpace;
end;

Destructor TPFMapValidator.Destroy;
begin
Inherited;
end;

function TPFMapValidator.GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPointSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapValidator.GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapValidator.GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

procedure TPFMapValidator.DoOnHeader(const Header: TMapHeader; const PMFileSection: ANSIString);
begin
end;

procedure TPFMapValidator.DoOnPoint(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  S: string;
begin
if (NOT GetPointPrototypeByTypeID(TypeID, {out} idPrototype))
 then begin
  S:='POI: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POI_TYPES_GetNameByID(TypeID)+')'+' - type is not defined.';
  if (_UnknownTypesList.IndexOf(S) = -1) then _UnknownTypesList.Add(S);
  end
 else
  if (idPrototype = 0)
   then begin
    S:='POI: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POI_TYPES_GetNameByID(TypeID)+')'+' - type is disabled.';
    if (_DisabledTypesList.IndexOf(S) = -1) then _DisabledTypesList.Add(S);
    end;
end;

procedure TPFMapValidator.DoOnPolyline(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  S: string;
begin
if (NOT GetPolylinePrototypeByTypeID(TypeID, {out} idPrototype))
 then begin
  S:='POLYLINE: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POLYLINE_TYPES_GetNameByID(TypeID)+')'+' - type is not defined.';
  if (_UnknownTypesList.IndexOf(S) = -1) then _UnknownTypesList.Add(S);
  end
 else
  if (idPrototype = 0)
   then begin
    S:='POLYLINE: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POLYLINE_TYPES_GetNameByID(TypeID)+')'+' - type is disabled.';
    if (_DisabledTypesList.IndexOf(S) = -1) then _DisabledTypesList.Add(S);
    end;
end;

procedure TPFMapValidator.DoOnPolygon(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  S: string;
begin
if (NOT GetPolygonPrototypeByTypeID(TypeID, {out} idPrototype))
 then begin
  S:='POLYGON: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POLYGON_TYPES_GetNameByID(TypeID)+')'+' - type is not defined.';
  if (_UnknownTypesList.IndexOf(S) = -1) then _UnknownTypesList.Add(S);
  end
 else
  if (idPrototype = 0)
   then begin
    S:='POLYGON: '+'0x'+ANSILowerCase(IntToHex(TypeID,1))+'('+POLYGON_TYPES_GetNameByID(TypeID)+')'+' - type is disabled.';
    if (_DisabledTypesList.IndexOf(S) = -1) then _DisabledTypesList.Add(S);
    end;
end;

procedure TPFMapValidator.Validate(const TransformationFileName: string; const MapFile: string; out UnknownTypesList: TStringList; out DisabledTypesList: TStringList);
begin
UnknownTypesList:=nil;
DisabledTypesList:=nil;
TransformationFile:=TMemIniFile.Create(TransformationFileName);
try
with TPFMParser.Create(MapFile) do
try
OnHeader:=DoOnHeader;
OnPoint:=DoOnPoint;
OnPolyline:=DoOnPolyline;
OnPolygon:=DoOnPolygon;
//. loading ...
_UnknownTypesList:=TStringList.Create;
try
_DisabledTypesList:=TStringList.Create;
try
Process();
UnknownTypesList:=_UnknownTypesList;
DisabledTypesList:=_DisabledTypesList;
except
  FreeAndNil(_DisabledTypesList);
  Raise; //. =>
  end;
except
  FreeAndNil(_UnknownTypesList);
  Raise; //. =>
  end;
finally
Destroy;
end;
finally
FreeAndNil(TransformationFile);
end;
end;


{TMapLoader}
Constructor TMapLoader.Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer; const pflSkipOnDuplicate: boolean; const pflFileOfCreatedObjects: boolean);
begin
Inherited Create;
Space:=pSpace;
idMapFormatMap:=pidMapFormatMap;
idGeoSpace:=pidGeoSpace;
flSkipOnDuplicate:=pflSkipOnDuplicate;
flFileOfCreatedObjects:=pflFileOfCreatedObjects;
//.
ObjectTypesFilter:=nil;
end;


{TPFMapLoader}
class procedure TPFMapLoader.RemoveLoadedMapFormatObjects(const pSpace: TProxySpace; const LoadedMapFormatObjectsFileName: string; const OnMapFormatObjectIsRemoved: TOnMapFormatObjectIsRemoved; const OnMapFormatObjectRemovingError: TOnMapFormatObjectRemovingError);

  procedure ParseString(const S: string; out TypeID,ID: Integer);
  var
    NS: String;
    I: integer;
  begin
  I:=1;
  NS:='';
  for I:=1 to Length(S) do
    if S[I] <> ';'
     then NS:=NS+S[I]
     else Break;
  try
  TypeID:=StrToInt(NS);
  except
    Raise Exception.Create('could not recognize TypeID'); //. =>
    end;
  if I = Length(S) then Raise Exception.Create('ID not found'); //. =>
  Inc(I);
  NS:='';
  for I:=I to Length(S) do NS:=NS+S[I];
  try
  ID:=StrToInt(NS);
  except
    Raise Exception.Create('could not recognize ID'); //. =>
    end;
  end;

var
  TF: TextFile;
  S: string;
  idTComponent,idComponent: integer;
begin
AssignFile(TF,LoadedMapFormatObjectsFileName); Reset(TF);
try
while (NOT EOF(TF)) do begin
  ReadLn(TF,S);
  ParseString(S, {out}idTComponent,idComponent);
  with TTypeFunctionality_Create(idTComponent) do
  try
  try
  DestroyInstance(idComponent);
  if (Assigned(OnMapFormatObjectIsRemoved)) then OnMapFormatObjectIsRemoved(idTComponent,idComponent);
  except
    on E: Exception do if (Assigned(OnMapFormatObjectRemovingError)) then OnMapFormatObjectRemovingError(idTComponent,idComponent,E.Message);
    end;
  finally
  Release();
  end;
  end;
finally
CloseFile(TF);
end;
end;

Constructor TPFMapLoader.Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer; const pflSkipOnDuplicate: boolean; const pflFileOfCreatedObjects: boolean);
begin
Inherited Create(pSpace,pidMapFormatMap,pidGeoSpace,pflSkipOnDuplicate,pflFileOfCreatedObjects);
end;

Destructor TPFMapLoader.Destroy;
begin
Inherited;
end;

procedure TPFMapLoader.GetMapDATA(const PMFileSection: ANSIString; out DATA: TMemoryStream);

  function GetPMFileSectionData(const Section: ANSIString): OLEVariant;
  var
    _DATA: TMemoryStream;
    DATAPtr: pointer;
  begin
  if (Section <> '')
   then begin
    _DATA:=TMemoryStream.Create;
    try
    _DATA.Write(Pointer(@Section[1])^,Length(Section));
    _DATA.Position:=0;
    with _DATA do begin
    Result:=VarArrayCreate([0,Size-1],varByte);
    DATAPtr:=VarArrayLock(Result);
    try
    Read(DATAPtr^,Size);
    finally
    VarArrayUnLock(Result);
    end;
    end;
    finally
    _DATA.Destroy;
    end;
    end
   else Result:=Null;
  end;

var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  SectionNode: IXMLDOMElement;
  OLEStream: IStream;
begin
DATA:=nil;
try
DATA:=TMemoryStream.Create;
//.
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
SectionNode:=Doc.createElement('PMFSection');
SectionNode.Set_dataType('bin.base64');
SectionNode.nodeTypedValue:=GetPMFileSectionData(PMFileSection);
Root.appendChild(SectionNode);
//.
OLEStream:=TStreamAdapter.Create(DATA);
Doc.save(OLEStream);
except
  FreeAndNil(DATA);
  Raise; //. =>
  end;
end;

function TPFMapLoader.GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPointSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapLoader.GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapLoader.GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

procedure TPFMapLoader.GetMapObjectDATA(const PMFileSection: ANSIString; out DATA: TMemoryStream);

  function GetPMFileSectionData(const Section: ANSIString): OLEVariant;
  var
    _DATA: TMemoryStream;
    DATAPtr: pointer;
  begin
  if (Section <> '')
   then begin
    _DATA:=TMemoryStream.Create;
    try
    _DATA.Write(Pointer(@Section[1])^,Length(Section));
    _DATA.Position:=0;
    with _DATA do begin
    Result:=VarArrayCreate([0,Size-1],varByte);
    DATAPtr:=VarArrayLock(Result);
    try
    Read(DATAPtr^,Size);
    finally
    VarArrayUnLock(Result);
    end;
    end;
    finally
    _DATA.Destroy;
    end;
    end
   else Result:=Null;
  end;

var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  SectionNode: IXMLDOMElement;
  OLEStream: IStream;
begin
DATA:=nil;
try
DATA:=TMemoryStream.Create;
//.
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
SectionNode:=Doc.createElement('PMFSection');
SectionNode.Set_dataType('bin.base64');
SectionNode.nodeTypedValue:=GetPMFileSectionData(PMFileSection);
Root.appendChild(SectionNode);
//.
OLEStream:=TStreamAdapter.Create(DATA);
Doc.save(OLEStream);
except
  FreeAndNil(DATA);
  Raise; //. =>
  end;
end;

function TPFMapLoader.ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: double; out X,Y: Extended): boolean;
var
  GeoSpaceDatumID: integer;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  flTransformPointsLoaded: boolean;
begin
Result:=false;
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do
try
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//.
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,Alt, GeoSpaceDatumID,  _Lat,_Long,_Alt);
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(idGeoSpace, _Lat,_Long,  idGeoCrdSystem);
finally
Release;
end;
if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
 then begin
  FreeAndNil(CrdSysConvertor);
  //.
  if (idGeoCrdSystem <> 0)
   then begin
    CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
    flTransformPointsLoaded:=false;
    end;
  end;
if (CrdSysConvertor <> nil)
 then begin
  ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
  if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
   then begin
    CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
    flTransformPointsLoaded:=true;
    end;
  //.
  Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
  end;
end;

function TPFMapLoader.CreateMapFormatObjectByPrototypeAndSet(const idPrototype: integer; const ObjLabel: ANSIString; const ObjKindID: integer; const ObjTypeID: integer; const NodesDatum: integer; const Nodes: TGeoCrdArray; const ObjectDATA: TMemoryStream): integer;
var
  idClone: integer;
  idTComponent,idComponent: integer;
  CL: TComponentsList;
  VF: TBase2DVisualizationFunctionality;
  _NodesCount: integer;
  _Nodes: TByteArray;
  ptrNode: pointer;
  I: integer;
  X,Y: Extended;
  TransformedNodesCount: integer;
  DetailsList: TComponentsList;
  NewLayID: integer;

  procedure SetHINTVisualization(const idHINTVisualization: integer);
  var
    MS: TMemoryStream;
    DATA: THINTVisualizationDATA;
    idTOwner,idOwner: integer;
  begin
  with TComponentFunctionality_Create(idTMapFormatObject,idClone) do
  try
  //.
  if (NOT GetOwner({out} idTOwner,idOwner))
   then begin
    idTOwner:=idTObj;
    idOwner:=idObj;
    end;
  finally
  Release();
  end;
  with THINTVisualizationFunctionality(TComponentFunctionality_Create(idTHINTVisualization,idHINTVisualization)) do
  try
  GetPrivateDATA(MS);
  try
  DATA:=THintVisualizationDATA.Create(MS);
  with DATA do
  try
  InfoString:=ObjLabel;
  InfoComponent.idType:=idTOwner;
  InfoComponent.idObj:=idOwner;
  SetProperties();
  //. save new data
  SetPrivateDATA(DATA);
  finally
  DATA.Destroy;
  end;
  finally
  MS.Destroy;
  end;
  finally
  Release;
  end;
  end;
  
  procedure Visualization_SetPosition(const VF: TBase2DVisualizationFunctionality; const X,Y: Extended);
  var
    BA: TByteArray;
    BAPtr: pointer;
    NodesCount: integer;
    XSum,YSum: Extended;
    I: integer;
    _X,_Y: double;
    Xc,Yc: Extended;
    dX,dY: double;
  begin
  VF.GetNodes(BA);
  BAPtr:=Pointer(@BA[0]);
  NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
  if (NodesCount < 2) then Raise Exception.Create('Visualization_SetPosition: visualization nodes number are less than 2'); //. =>
  XSum:=0.0; YSum:=0.0;
  for I:=0 to NodesCount-1 do begin
    _X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_X));
    _Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_Y));
    XSum:=XSum+_X; YSum:=YSum+_Y;
    end;
  Xc:=XSum/NodesCount; Yc:=YSum/NodesCount;
  dX:=X-Xc; dY:=Y-Yc;
  VF.Move(dX,dY,0);
  end;

begin
with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idPrototype)) do
try
ToClone({out} idClone);
finally
Release();
end;
//.
with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idClone)) do
try
try
//. set params
SetParams(idMapFormatMap,Integer(mfPolish),ObjKindID,ObjTypeID,ObjLabel);
//. set nodes
if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
 then
  try
  VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
  with VF do
  try
  _NodesCount:=Length(Nodes);
  if (_NodesCount > 1)
   then begin //. set visualization nodes
    SetLength(_Nodes,SizeOf(_NodesCount)+_NodesCount*(2*SizeOf(Double)));
    ptrNode:=@_Nodes[0];
    TransformedNodesCount:=0;
    Integer(ptrNode^):=_NodesCount; Inc(Integer(ptrNode),SizeOf(_NodesCount));
    for I:=0 to Length(Nodes)-1 do begin
      if (ConvertGeoGrdToXY(NodesDatum, Nodes[I].Lat,Nodes[I].Long,0, {out} X,Y))
       then begin
        Double(ptrNode^):=X; Inc(Integer(ptrNode),SizeOf(Double));
        Double(ptrNode^):=Y; Inc(Integer(ptrNode),SizeOf(Double));
        Inc(TransformedNodesCount);
        end;
      end;
    if (TransformedNodesCount = _NodesCount)
     then SetNodes(_Nodes,Width)
     else Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
    end
   else begin //. move visualization
    if (ConvertGeoGrdToXY(NodesDatum, Nodes[0].Lat,Nodes[0].Long,0, {out} X,Y))
     then Visualization_SetPosition(VF, X,Y)
     else Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
    end;
  //. try to set label on HintVusialization if that is exist
  if (idTObj = idTHINTVisualization)
   then SetHINTVisualization(idObj)
   else
    if (GetDetailsList({out} DetailsList))
     then
      try
      for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
        if (idTComponent = idTHintVisualization)
         then begin
          SetHINTVisualization(idComponent);
          Break; //. >
          end;
      finally
      DetailsList.Destroy;
      end;
  //. change object lay of transformation file has a lay definition
  case TPMFObjectKind(ObjKindID) of
  pmfokPOI: NewLayID:=POI_LayID;
  pmfokPolyline: NewLayID:=POLYLINE_LayID;
  pmfokPolygon: NewLayID:=POLYGON_LayID;
  else
    NewLayID:=0;
  end;
  if (NewLayID <> 0) then ChangeLay(NewLayID);
  finally
  Release;
  end;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('Visualization component is not found'); //. =>
//. set DATA
SetData(ObjectDATA);
//.
Inc(CreatedObjectsCounter);
//.
Result:=idClone;
except
  TypeFunctionality.DestroyInstance(idClone);
  Raise; //. =>
  end;
finally
Release();
end;
end;

procedure TPFMapLoader.DoOnHeader(const Header: TMapHeader; const PMFileSection: ANSIString);
var
  MS: TMemoryStream;
begin
GetMapDATA(PMFileSection,{out} MS);
try
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
try
Name:=Header.Name;
FormatID:=Integer(mfPolish);
//.
SetDATA(MS);
finally
Release;
end;
finally
MS.Destroy;
end;
//.
if (Assigned(OnHeaderProcessed)) then OnHeaderProcessed(Header,PMFileSection);
end;

procedure TPFMapLoader.DoOnPoint(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  ObjectDATA: TMemoryStream;
  ObjectDATAHash: cardinal;
  idMapFormatObject: integer;
  idClone: integer;
begin
if (NOT ObjectTypesFilter.IsTypeEnabled(Integer(pmfokPOI),TypeID)) then Exit; //. ->
if (GetPointPrototypeByTypeID(TypeID,{out} idPrototype))
 then begin
  if (idPrototype <> 0)
   then
    try
    try
    GetMapObjectDATA(PMFileSection,{out} ObjectDATA);
    try
    with TTMapFormatObjectFunctionality.Create do
    try
    ObjectDATAHash:=GetDATAHash(ObjectDATA);
    finally
    Release;
    end;
    with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
    try
    if (GetObject(Integer(pmfokPOI),ObjectDATAHash,{out} idMapFormatObject))
     then begin
      if (flSkipOnDuplicate)
       then begin
        if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'duplicate for POI object has been skipped, ID: '+IntToStr(idMapFormatObject));
        Exit; //. ->
        end;
      //. remove object-duplicate
      with TTMapFormatObjectFunctionality.Create do
      try
      DestroyInstance(idMapFormatObject);
      finally
      Release;
      end;
      if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'POI object duplicate has been removed, ID: '+IntToStr(idMapFormatObject));
      end;
    finally
    Release;
    end;
    //.
    idClone:=CreateMapFormatObjectByPrototypeAndSet(idPrototype, ObjLabel,Integer(pmfokPOI),TypeID,NodesDatum,Nodes,ObjectDATA);
    //.
    if (flFileOfCreatedObjects) then WriteLn(CreatedMapFormatObjectsFile,IntToStr(idTMapFormatObject)+';'+IntToStr(idClone));
    //.
    if (Assigned(OnPointCreated)) then OnPointCreated(TypeID,ObjLabel,idClone);
    finally
    ObjectDATA.Destroy;
    end;
    finally
    Inc(ProcessedObjectsCounter);
    if ((ProcessedObjectsCounter MOD ObjectsPortionToClearContext) = 0) then Space.ClearInactiveSpaceContext();
    end;
    except
      On E: Exception do if (Assigned(OnPointCreateError)) then OnPointCreateError(TypeID,ObjLabel,E.Message);
      end;
  end
 else
  if (Assigned(OnPointCreateError)) then OnPointCreateError(TypeID,ObjLabel,'Unknown point type');
end;

procedure TPFMapLoader.DoOnPolyline(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  ObjectDATA: TMemoryStream;
  ObjectDATAHash: cardinal;
  idMapFormatObject: integer;
  idClone: integer;
begin
if (NOT ObjectTypesFilter.IsTypeEnabled(Integer(pmfokPOLYLINE),TypeID)) then Exit; //. ->
if (GetPolylinePrototypeByTypeID(TypeID,{out} idPrototype))
 then begin
  if (idPrototype <> 0)
   then
    try
    try
    GetMapObjectDATA(PMFileSection,{out} ObjectDATA);
    try
    with TTMapFormatObjectFunctionality.Create do
    try
    ObjectDATAHash:=GetDATAHash(ObjectDATA);
    finally
    Release;
    end;
    with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
    try
    if (GetObject(Integer(pmfokPOLYLINE),ObjectDATAHash,{out} idMapFormatObject))
     then begin
      if (flSkipOnDuplicate)
       then begin
        if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'duplicate for POLYLINE object has been skipped, ID: '+IntToStr(idMapFormatObject));
        Exit; //. ->
        end;
      //. remove object-duplicate
      with TTMapFormatObjectFunctionality.Create do
      try
      DestroyInstance(idMapFormatObject);
      finally
      Release;
      end;
      if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'POLYLINE object duplicate has been removed, ID: '+IntToStr(idMapFormatObject));
      end;
    finally
    Release;
    end;
    //.
    idClone:=CreateMapFormatObjectByPrototypeAndSet(idPrototype, ObjLabel,Integer(pmfokPolyline),TypeID,NodesDatum,Nodes,ObjectDATA);
    //.
    if (flFileOfCreatedObjects) then WriteLn(CreatedMapFormatObjectsFile,IntToStr(idTMapFormatObject)+';'+IntToStr(idClone));
    //.
    if (Assigned(OnPolylineCreated)) then OnPolylineCreated(TypeID,ObjLabel,idClone);
    finally
    ObjectDATA.Destroy;
    end;
    finally
    Inc(ProcessedObjectsCounter);
    if ((ProcessedObjectsCounter MOD ObjectsPortionToClearContext) = 0) then Space.ClearInactiveSpaceContext();
    end;
    except
      On E: Exception do if (Assigned(OnPolylineCreateError)) then OnPolylineCreateError(TypeID,ObjLabel,E.Message);
      end;
  end
 else
  if (Assigned(OnPolylineCreateError)) then OnPolylineCreateError(TypeID,ObjLabel,'Unknown polyline type');
end;

procedure TPFMapLoader.DoOnPolygon(const TypeID: Integer; const ObjLabel: ANSIString; const NodesDatum: integer; const Nodes: TGeoCrdArray; const PMFileSection: ANSIString);
var
  idPrototype: integer;
  ObjectDATA: TMemoryStream;
  ObjectDATAHash: cardinal;
  idMapFormatObject: integer;
  idClone: integer;
begin
if (NOT ObjectTypesFilter.IsTypeEnabled(Integer(pmfokPOLYGON),TypeID)) then Exit; //. ->
if (GetPolygonPrototypeByTypeID(TypeID,{out} idPrototype))
 then begin
  if (idPrototype <> 0)
   then
    try
    try
    GetMapObjectDATA(PMFileSection,{out} ObjectDATA);
    try
    with TTMapFormatObjectFunctionality.Create do
    try
    ObjectDATAHash:=GetDATAHash(ObjectDATA);
    finally
    Release;
    end;
    with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
    try
    if (GetObject(Integer(pmfokPOLYGON),ObjectDATAHash,{out} idMapFormatObject))
     then begin
      if (flSkipOnDuplicate)
       then begin
        if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'duplicate for POLYGON object has been skipped, ID: '+IntToStr(idMapFormatObject));
        Exit; //. ->
        end;
      //. remove object-duplicate
      with TTMapFormatObjectFunctionality.Create do
      try
      DestroyInstance(idMapFormatObject);
      finally
      Release;
      end;
      if (Assigned(OnPointCreateWarning)) then OnPointCreateWarning(TypeID,ObjLabel,'POLYGON object duplicate has been removed, ID: '+IntToStr(idMapFormatObject));
      end;
    finally
    Release;
    end;
    //.
    idClone:=CreateMapFormatObjectByPrototypeAndSet(idPrototype, ObjLabel,Integer(pmfokPolygon),TypeID,NodesDatum,Nodes,ObjectDATA);
    //.
    if (flFileOfCreatedObjects) then WriteLn(CreatedMapFormatObjectsFile,IntToStr(idTMapFormatObject)+';'+IntToStr(idClone));
    //.
    if (Assigned(OnPolygonCreated)) then OnPolygonCreated(TypeID,ObjLabel,idClone);
    finally
    ObjectDATA.Destroy;
    end;
    finally
    Inc(ProcessedObjectsCounter);
    if ((ProcessedObjectsCounter MOD ObjectsPortionToClearContext) = 0) then Space.ClearInactiveSpaceContext();
    end;
    except
      On E: Exception do if (Assigned(OnPolygonCreateError)) then OnPolygonCreateError(TypeID,ObjLabel,E.Message);
      end;
  end
 else
  if (Assigned(OnPolygonCreateError)) then OnPolygonCreateError(TypeID,ObjLabel,'Unknown polygon type');
end;

procedure TPFMapLoader.Load(const TransformationFileName: string; const MapFile: string);
begin
ProcessedObjectsCounter:=0;
CreatedObjectsCounter:=0;
CrdSysConvertor:=nil;
try
TransformationFile:=TMemIniFile.Create(TransformationFileName);
try
//. set object's target lays if there are in transformation file 
POI_LayID:=StrToInt(TransformationFile.ReadString(PMFPointSection,'LayID','0'));
POLYLINE_LayID:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,'LayID','0'));
POLYGON_LayID:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,'LayID','0'));
//.
with TPFMParser.Create(MapFile) do
try
if (flFileOfCreatedObjects)
 then begin
  AssignFile(CreatedMapFormatObjectsFile,ChangeFileExt(MapFile,'.ccc'));
  ReWrite(CreatedMapFormatObjectsFile);
  end;
try
OnHeader:=DoOnHeader;
OnPoint:=DoOnPoint;
OnPolyline:=DoOnPolyline;
OnPolygon:=DoOnPolygon;
//. loading ...
Process();
finally
if (flFileOfCreatedObjects) then CloseFile(CreatedMapFormatObjectsFile);
end;
finally
Destroy;
end;
finally
FreeAndNil(TransformationFile);
end;
finally
FreeAndNil(CrdSysConvertor);
end;
end;


{TPFMapRecalculator}
Constructor TPFMapRecalculator.Create(const pSpace: TProxySpace; const pUserName,pUserPassword: WideString; const pidMapFormatMap: integer; const pidGeoSpace: integer);
begin
Inherited Create;
Space:=pSpace;
if (pUserName <> '')
 then begin
  UserName:=pUserName;
  UserPassword:=pUserPassword;
  end
 else begin
  UserName:=Space.UserName;
  UserPassword:=Space.UserPassword;
  end;
idMapFormatMap:=pidMapFormatMap;
idGeoSpace:=pidGeoSpace;
//.
ObjectTypesFilter:=nil;
end;

Constructor TPFMapRecalculator.Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer);
begin
Create(pSpace,'','',pidMapFormatMap,pidGeoSpace); 
end;

function TPFMapRecalculator.GetPointPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPointSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapRecalculator.GetPolylinePrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapRecalculator.GetPolygonPrototypeByTypeID(const TypeID: integer; out idPrototype: integer): boolean;
var
  TypeStr: string;
begin
TypeStr:='T0x'+ANSILowerCase(IntToHex(TypeID,1));
try
idPrototype:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,TypeStr,'-1'));
except
  On E: Exception do Raise Exception.Create('error of transformation file, section: '+PMFPointDescriptor+', value: '+TypeStr+', error: '+E.Message);
  end;
Result:=(idPrototype <> -1);
end;

function TPFMapRecalculator.ConvertGeoGrdToXY(const DatumID: integer; const Lat,Long,Alt: double; out X,Y: Extended): boolean;
var
  GeoSpaceDatumID: integer;
  _Lat,_Long,_Alt: Extended;
  idGeoCrdSystem: integer;
  flTransformPointsLoaded: boolean;
begin
Result:=false;
//. get GeoSpace Datum ID
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do
try
_UserName:=Self.UserName;
_UserPassword:=Self.UserPassword;
//.
GeoSpaceDatumID:=GetDatumIDLocally();
finally
Release;
end;
//.
TGeoDatumConverter.Datum_ConvertCoordinatesToAnotherDatum(DatumID, Lat,Long,Alt, GeoSpaceDatumID,  _Lat,_Long,_Alt);
//. get appropriate geo coordinate system
with TTGeoCrdSystemFunctionality.Create do
try
GetInstanceByLatLongLocally(idGeoSpace, _Lat,_Long,  idGeoCrdSystem);
finally
Release;
end;
if ((CrdSysConvertor = nil) OR (CrdSysConvertor.idCrdSys <> idGeoCrdSystem))
 then begin
  FreeAndNil(CrdSysConvertor);
  //.
  if (idGeoCrdSystem <> 0)
   then begin
    CrdSysConvertor:=TCrdSysConvertor.Create(Space,idGeoCrdSystem);
    flTransformPointsLoaded:=false;
    end;
  end;
if (CrdSysConvertor <> nil)
 then begin
  ///? if (NOT flTransformPointsLoaded OR (CrdSysConvertor.GetDistance(CrdSysConvertor.GeoToXY_Points_Lat,CrdSysConvertor.GeoToXY_Points_Long, TrackItem.Latitude,TrackItem.Longitude) > MaxDistanceForGeodesyPointsReload))
  if (CrdSysConvertor.flLinearApproximationCrdSys AND (NOT flTransformPointsLoaded OR CrdSysConvertor.LinearApproximationCrdSys_LLIsOutOfApproximationZone(_Lat,_Long)))
   then begin
    CrdSysConvertor.GeoToXY_LoadPoints(_Lat,_Long);
    flTransformPointsLoaded:=true;
    end;
  //.
  Result:=CrdSysConvertor.ConvertGeoToXY(_Lat,_Long, X,Y);
  end;
end;

procedure TPFMapRecalculator.Recalculate(const flRecalculateByPrototype: boolean; const idMapFormatObject: integer = 0);
var
  MapFileDatumID: integer;

  procedure GetNodeList(const S: ANSIString; out NL: TStringList);
  begin 
  NL:=TStringList.Create;
  try
  NL.Text:=S;
  except
    FreeAndNil(NL);
    Raise; //. =>
    end;
  end;

  procedure ProcessObject(const idMapFormatObject: integer);
  var
    _idMap: integer;
    _FormatID: integer;
    _KindID: integer;
    _TypeID: integer;
    _Name: string;
    FormatDATA: TMemoryStream;
    FileSectionStr: ANSIString;
    NL: TStringList;
    ObjectPrototypeID: integer;
    ObjectPrototypeFunctionality: TMapFormatObjectFunctionality;
    ObjLabel: ANSIString;
    ValueStr: ANSIString;
    Value: TGeoCrdArray;
    CL: TComponentsList;
    VF,PVF: TBase2DVisualizationFunctionality;
    _NodesCount: integer;
    _Nodes: TByteArray;
    ptrNode: pointer;
    I: integer;
    X,Y: Extended;
    TransformedNodesCount: integer;
    BA: TByteArray;
    HVF: THINTVisualizationFunctionality;
    DetailsList: TComponentsList;

    function PrototypeFunctionality_GetVisualizationComponentFunctionality(const PrototypeFunctionality: TMapFormatObjectFunctionality): TBase2DVisualizationFunctionality;
    var
      CL: TComponentsList;
    begin
    Result:=nil;
    if (PrototypeFunctionality.QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
     then
      try
      Result:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
      with Result do begin
      _UserName:=Self.UserName;
      _UserPassword:=Self.UserPassword;
      end;
      finally
      CL.Destroy;
      end;
    end;

    function PrototypeFunctionality_GetVisualizationHINTDetailFunctionality(const PrototypeFunctionality: TMapFormatObjectFunctionality): THINTVisualizationFunctionality;
    var
      VF: TBase2DVisualizationFunctionality;
      DetailsList: TComponentsList;
      I: integer;
    begin
    Result:=nil;
    VF:=PrototypeFunctionality_GetVisualizationComponentFunctionality(PrototypeFunctionality);
    if (VF <> nil)
     then
      try
      if (VF.GetDetailsList({out} DetailsList))
       then
        try
        for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
          if (idTComponent = idTHINTVisualization)
           then begin
            Result:=THINTVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
            with Result do begin
            _UserName:=Self.UserName;
            _UserPassword:=Self.UserPassword;
            end;
            Break; //. >
            end;
        finally
        DetailsList.Destroy;
        end;
      finally
      VF.Release;
      end;
    end;

    procedure SetHINTVisualization(const idHINTVisualization: integer);
    var
      MS: TMemoryStream;
      DATA: THINTVisualizationDATA;
      idTOwner,idOwner: integer;
    begin
    with TComponentFunctionality_Create(idTMapFormatObject,idMapFormatObject) do
    try
    _UserName:=Self.UserName;
    _UserPassword:=Self.UserPassword;
    //.
    if (NOT GetOwner({out} idTOwner,idOwner))
     then begin
      idTOwner:=idTObj;
      idOwner:=idObj;
      end;
    finally
    Release();
    end;
    with THINTVisualizationFunctionality(TComponentFunctionality_Create(idTHINTVisualization,idHINTVisualization)) do
    try
    _UserName:=Self.UserName;
    _UserPassword:=Self.UserPassword;
    //.
    GetPrivateDATA(MS);
    try
    DATA:=THintVisualizationDATA.Create(MS);
    with DATA do
    try
    InfoString:=ObjLabel;
    InfoComponent.idType:=idTOwner;
    InfoComponent.idObj:=idOwner;
    SetProperties();
    //. save new data
    SetPrivateDATA(DATA);
    finally
    DATA.Destroy;
    end;
    finally
    MS.Destroy;
    end;
    finally
    Release();
    end;
    end;

    procedure Visualization_SetPosition(const VF: TBase2DVisualizationFunctionality; const X,Y: Extended);
    var
      BA: TByteArray;
      BAPtr: pointer;
      NodesCount: integer;
      XSum,YSum: Extended;
      I: integer;
      _X,_Y: double;
      Xc,Yc: Extended;
      dX,dY: double;
    begin
    VF.GetNodes(BA);
    BAPtr:=Pointer(@BA[0]);
    NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
    if (NodesCount < 2) then Raise Exception.Create('Visualization_SetPosition: visualization nodes number are less than 2'); //. =>
    XSum:=0.0; YSum:=0.0;
    for I:=0 to NodesCount-1 do begin
      _X:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_X));
      _Y:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(_Y));
      XSum:=XSum+_X; YSum:=YSum+_Y;
      end;
    Xc:=XSum/NodesCount; Yc:=YSum/NodesCount;
    dX:=X-Xc; dY:=Y-Yc;
    VF.Move(dX,dY,0);
    end;

  var
    Obj_flagLoop: boolean;
    Obj_Color: TColor;
    Obj_Width: Double;
    Obj_flagFill: boolean;
    Obj_ColorFill: TColor;
    NewLayID: integer;
    XSummary,YSummary: Extended;
    dX,dY: double;
    BAPtr: pointer;
  begin
  try
  try
  with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idMapFormatObject)) do
  try
  _UserName:=Self.UserName;
  _UserPassword:=Self.UserPassword;
  //.
  GetParams(_idMap,_FormatID,_KindID,_TypeID,_Name);
  if (NOT ObjectTypesFilter.IsTypeEnabled(_KindID,_TypeID)) then Exit; //. ->
  if (NOT (TPMFObjectKind(_KindID) in [pmfokPOI,pmfokPolyline,pmfokPolygon])) then Raise Exception.Create('Unknown map object kind: '+IntToStr(_KindID)); //. =>
  //.
  GetDATA({out} FormatDATA);
  try
  with TMapFormatObjectDATAParser.Create() do
  try
  LoadFromStream(FormatDATA);
  FileSectionStr:=FileSection;
  finally
  Destroy;
  end;
  finally
  FormatDATA.Destroy;
  end;
  //.
  GetNodeList(FileSectionStr,{out} NL);
  try
  ObjectPrototypeFunctionality:=nil;
  NewLayID:=0;
  try
  if (flRecalculateByPrototype)
   then begin
    case TPMFObjectKind(_KindID) of
    pmfokPOI: begin
      if (NOT GetPointPrototypeByTypeID(_TypeID,{out} ObjectPrototypeID)) then Raise Exception.Create('could not get prototype for POI object type: '+ANSILowerCase(IntToHex(_TypeID,1))); //. =>
      NewLayID:=POI_LayID;
      end;
    pmfokPolyline: begin
      if (NOT GetPolylinePrototypeByTypeID(_TypeID,{out} ObjectPrototypeID)) then Raise Exception.Create('could not get prototype for Polyline object type: '+ANSILowerCase(IntToHex(_TypeID,1))); //. =>
      NewLayID:=POLYLINE_LayID;
      end;
    pmfokPolygon: begin
      if (NOT GetPolygonPrototypeByTypeID(_TypeID,{out} ObjectPrototypeID)) then Raise Exception.Create('could not get prototype for Polygon object type: '+ANSILowerCase(IntToHex(_TypeID,1))); //. =>
      NewLayID:=POLYGON_LayID;
      end;
    else
      Raise Exception.Create('Unknown map object kind: '+IntToStr(_KindID)); //. =>
    end;
    //. set object by prototype
    if (ObjectPrototypeID <> 0)
     then begin
      ObjectPrototypeFunctionality:=TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,ObjectPrototypeID));
      with ObjectPrototypeFunctionality do begin
      _UserName:=Self.UserName;
      _UserPassword:=Self.UserPassword;
      end;
      end
     else if (Assigned(OnObjectRecalculateWarning)) then OnObjectRecalculateWarning(idMapFormatObject,'prototype for object ('+IntToStr(idObj)+') is disabled, KindID: '+IntToStr(_KindID)+', TypeID: '+ANSILowerCase(IntToHex(_TypeID,1)));
    end;
  //. fetching data from "Polish" map file section
  if (NOT TPFMParser.GetNodeValue(NL,'Label', {out} ObjLabel)) then ObjLabel:='';
  if (NOT TPFMParser.GetFirstNodeValueMatching(NL,'Data0', {out} ValueStr))
   then begin
    Exit; //. ->
    end;
  TPFMParser.GetGeoCrdArray(ValueStr, {out} Value);
  //. set nodes
  if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
   then
    try
    VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
    with VF do
    try
    _UserName:=Self.UserName;
    _UserPassword:=Self.UserPassword;
    //.
    if (ObjectPrototypeFunctionality <> nil)
     then begin
      PVF:=PrototypeFunctionality_GetVisualizationComponentFunctionality(ObjectPrototypeFunctionality);
      if (PVF = nil) then if (Assigned(OnObjectRecalculateWarning)) then OnObjectRecalculateWarning(idMapFormatObject,'prototype for object ('+IntToStr(idObj)+') has no visualization component, PrototypeID: '+IntToStr(ObjectPrototypeFunctionality.idObj));
      end
     else PVF:=nil;
    try
    _NodesCount:=Length(Value);
    if (_NodesCount > 1)
     then begin //. set visualization nodes
      if (PVF <> nil)
       then begin //. copy visualization properties from prototype visualization to object visualization
        PVF.GetProps(Obj_flagLoop,Obj_Color,Obj_Width,Obj_flagFill,Obj_ColorFill);
        VF.SetProps(Obj_flagLoop,Obj_Color,Obj_Width,Obj_flagFill,Obj_ColorFill);
        end;
      SetLength(_Nodes,SizeOf(_NodesCount)+_NodesCount*(2*SizeOf(Double)));
      ptrNode:=@_Nodes[0];
      TransformedNodesCount:=0;
      Integer(ptrNode^):=_NodesCount; Inc(Integer(ptrNode),SizeOf(_NodesCount));
      for I:=0 to Length(Value)-1 do begin
        if (ConvertGeoGrdToXY(MapFileDatumID, Value[I].Lat,Value[I].Long,0, {out} X,Y))
         then begin
          Double(ptrNode^):=X; Inc(Integer(ptrNode),SizeOf(Double));
          Double(ptrNode^):=Y; Inc(Integer(ptrNode),SizeOf(Double));
          Inc(TransformedNodesCount);
          end;
        end;
      if (TransformedNodesCount = _NodesCount)
       then VF.SetNodes(_Nodes,Width)
       else Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
      end
     else begin //. set visualization position
      if (NOT ConvertGeoGrdToXY(MapFileDatumID, Value[0].Lat,Value[0].Long,0, {out} X,Y)) then Raise Exception.Create('Geo coordinates of object is out of scope'); //. =>
      if (PVF <> nil)
       then begin //. copy visualization properties from prototype visualization to object visualization
        PVF.GetProps(Obj_flagLoop,Obj_Color,Obj_Width,Obj_flagFill,Obj_ColorFill);
        VF.SetProps(Obj_flagLoop,Obj_Color,Obj_Width,Obj_flagFill,Obj_ColorFill);
        //. copy nodes from prototype to object with coordinate's translation
        PVF.GetNodes(BA);
        BAPtr:=Pointer(@BA[0]);
        _NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(_NodesCount));
        XSummary:=0.0; YSummary:=0.0;
        for I:=0 to _NodesCount-1 do begin
          XSummary:=XSummary+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Double));
          YSummary:=YSummary+Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Double));
          end;
        dX:=X-(XSummary/_NodesCount); dY:=Y-(YSummary/_NodesCount);
        BAPtr:=Pointer(@BA[0]);
        _NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(_NodesCount));
        for I:=0 to _NodesCount-1 do begin
          Double(BAPtr^):=Double(BAPtr^)+dX; Inc(Integer(BAPtr),SizeOf(Double));
          Double(BAPtr^):=Double(BAPtr^)+dY; Inc(Integer(BAPtr),SizeOf(Double));
          end;
        VF.SetNodes(BA,Obj_Width);
        end
       else Visualization_SetPosition(VF, X,Y);
      end;
    //. try to set label on HintVusialization if that is exist
    if (idTObj = idTHINTVisualization)
     then begin
      if (PVF <> nil)
       then begin
        if (PVF.idTObj = idTHINTVisualization)
         then begin
          THINTVisualizationFunctionality(VF).DATAFileID:=THINTVisualizationFunctionality(PVF).DATAFileID;
          THINTVisualizationFunctionality(PVF).GetPrivateDATA({out} BA);
          THINTVisualizationFunctionality(VF).SetPrivateDATA(BA);
          end
         else if (Assigned(OnObjectRecalculateWarning)) then OnObjectRecalculateWarning(idMapFormatObject,'prototype for object ('+IntToStr(idObj)+') has no HINTVisualization component, PrototypeID: '+IntToStr(ObjectPrototypeFunctionality.idObj));
        end;
      SetHINTVisualization(idObj);
      end
     else
      if (GetDetailsList({out} DetailsList))
       then
        try
        for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
          if (idTComponent = idTHINTVisualization)
           then begin
            if (ObjectPrototypeFunctionality <> nil)
             then begin
              HVF:=PrototypeFunctionality_GetVisualizationHINTDetailFunctionality(ObjectPrototypeFunctionality);
              try
              if (HVF <> nil)
               then begin
                THINTVisualizationFunctionality(VF).DATAFileID:=HVF.DATAFileID;
                HVF.GetPrivateDATA({out} BA);
                THINTVisualizationFunctionality(VF).SetPrivateDATA(BA);
                end
               else if (Assigned(OnObjectRecalculateWarning)) then OnObjectRecalculateWarning(idMapFormatObject,'prototype for object ('+IntToStr(idObj)+') has no HINTVisualization detail of visualization component, PrototypeID: '+IntToStr(ObjectPrototypeFunctionality.idObj));
              finally
              if (HVF <> nil) then HVF.Release;
              end;
              end;
            SetHINTVisualization(idComponent);
            Break; //. >
            end;
        finally
        DetailsList.Destroy;
        end;
    if (PVF <> nil)
     then begin
      if (NewLayID = 0) then NewLayID:=PVF.idLay;
      if (NewLayID <> VF.idLay) then VF.ChangeLay(NewLayID);
      end;
    finally
    if (PVF <> nil) then PVF.Release;
    end;
    finally
    Release;
    end;
    finally
    CL.Destroy;
    end
   else Raise Exception.Create('Visualization component is not found'); //. =>
  //.
  if (Assigned(OnObjectRecalculated)) then OnObjectRecalculated(idMapFormatObject);
  finally
  if (ObjectPrototypeFunctionality <> nil) then ObjectPrototypeFunctionality.Release;
  end;
  finally
  NL.Destroy;
  end;
  finally
  Release;
  end;
  finally
  Inc(ProcessedObjectsCounter);
  if ((ProcessedObjectsCounter MOD ObjectsPortionToClearContext) = 0) then Space.ClearInactiveSpaceContext();
  end;
  except
    On E: Exception do begin
      if (Assigned(OnObjectRecalculateError)) then OnObjectRecalculateError(idMapFormatObject,E.Message);
      if (idMapFormatObject <> 0) then Raise ; //. => 
      end;
    end;
  end;

var
  FormatDATA: TMemoryStream;
  FileSectionStr: ANSIString;
  NL: TStringList;
  DatumStr: ANSIString;
  TFN: string;
  BA: TByteArray;
  OL: TByteArray;
  OLS: integer;
  I: integer;
begin
ProcessedObjectsCounter:=0;
CrdSysConvertor:=nil;
try
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
try
_UserName:=Self.UserName;
_UserPassword:=Self.UserPassword;
//.
if (TMapFormat(FormatID) <> mfPolish) then Raise Exception.Create('map is not a Polish format'); //. =>
GetDATA({out} FormatDATA);
try
with TMapFormatObjectDATAParser.Create() do
try
LoadFromStream(FormatDATA);
FileSectionStr:=FileSection;
finally
Destroy;
end;
finally
FormatDATA.Destroy;
end;
//.
GetNodeList(FileSectionStr,{out} NL);
try
if (TPFMParser.GetNodeValue(NL,'Datum', {out} DatumStr))
 then begin
  if (DatumStr = 'W84') then MapFileDatumID:=23{WGS-84} else Raise Exception.Create('unknown map file Datum'); //. =>
  end
 else MapFileDatumID:=23; //. WGS-84
finally
NL.Destroy;
end;
//. get map transformation file
TFN:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.ini';
GetObjectPrototypesDATA({out} BA);
with TMemoryStream.Create do
try
Write(Pointer(@BA[0])^,Length(BA));
SaveToFile(TFN);
finally
Destroy;
end;
//. processing
TransformationFile:=TMemIniFile.Create(TFN);
try
//. set object's target lays if there are in transformation file 
POI_LayID:=StrToInt(TransformationFile.ReadString(PMFPointSection,'LayID','0'));
POLYLINE_LayID:=StrToInt(TransformationFile.ReadString(PMFPolylineSection,'LayID','0'));
POLYGON_LayID:=StrToInt(TransformationFile.ReadString(PMFPolygonSection,'LayID','0'));
//.
if (idMapFormatObject = 0)
 then begin
  GetObjectsList(OL);
  OLS:=(Length(OL) DIV 4);
  for I:=0 to OLS-1 do ProcessObject(Integer(Pointer(Integer(@OL[0])+(I SHL 2))^));
  end
 else ProcessObject(idMapFormatObject);
finally
FreeAndNil(TransformationFile);
end;
finally
Release;
end;
finally
FreeAndNil(CrdSysConvertor);
end;
end;


{TPFMapRemover}
Constructor TPFMapRemover.Create(const pSpace: TProxySpace; const pidMapFormatMap: integer);
begin
Inherited Create;
Space:=pSpace;
idMapFormatMap:=pidMapFormatMap;
//.
ObjectTypesFilter:=nil;
end;

procedure TPFMapRemover.Remove();
var
  I: integer;
begin
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
try
if (TMapFormat(FormatID) <> mfPolish) then Raise Exception.Create('map is not a Polish format'); //. =>
try
if ((ObjectTypesFilter = nil) OR ObjectTypesFilter.IsAllTypesEnabled())
 then begin
  RemoveObjects();
  if (Assigned(OnMapObjectsRemoving)) then OnMapObjectsRemoving('All objects are removed');
  end
 else
  for I:=0 to Length(ObjectTypesFilter.Items)-1 do
    if (ObjectTypesFilter.Items[I].flEnabled)
     then begin
      RemoveObjects(ObjectTypesFilter.Items[I].KindID,ObjectTypesFilter.Items[I].TypeID);
      if (Assigned(OnMapObjectsRemoving)) then OnMapObjectsRemoving(PMFObjectKindStrings[TPMFObjectKind(ObjectTypesFilter.Items[I].KindID)]+' objects with type '+KIND_TYPES_GetNameByID(TPMFObjectKind(ObjectTypesFilter.Items[I].KindID),ObjectTypesFilter.Items[I].TypeID)+'(0x'+ANSILowerCase(IntToHex(ObjectTypesFilter.Items[I].TypeID,1))+') are removed');
      end;
except
  on E: Exception do if (Assigned(OnMapObjectsRemovingError)) then OnMapObjectsRemovingError('!!! Removing error: '+E.Message);
  end;
finally
Release;
end;
end;


{TfmPFMapLoader}
Constructor TfmPFMapLoader.Create(const pSpace: TProxySpace; const pidMapFormatMap: integer; const pidGeoSpace: integer);
begin
Inherited Create(nil);
Space:=pSpace;
idGeoSpace:=pidGeoSpace;
idMapFormatMap:=pidMapFormatMap; 
end;

procedure TfmPFMapLoader.btnEditObjectPrototypesDATAClick(Sender: TObject);
var
  BA: TByteArray;
  DATAStr: ANSIString;
begin
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
try
GetObjectPrototypesDATA({out} BA);
SetLength(DATAStr,Length(BA));
Move(Pointer(@BA[0])^,Pointer(@DATAStr[1])^,Length(DATAStr));
with TfmMapFormatMapObjectPrototypesDATAEditor.Create() do
try
if (Dialog({var} DATAStr))
 then begin
  SetLength(BA,Length(DATAStr));
  Move(Pointer(@DATAStr[1])^,Pointer(@BA[0])^,Length(BA));
  SetObjectPrototypesDATA(BA);
  end;
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TfmPFMapLoader.btnSelectMapFileClick(Sender: TObject);
begin
if (OpenDialog.Execute())
 then stMapFileName.Caption:=OpenDialog.FileName
 else stMapFileName.Caption:='';
end;

procedure TfmPFMapLoader.btnValidateMapFileClick(Sender: TObject);
var
  TFN: string;
  BA: TByteArray;
  UTL,DTL: TStringList;
begin
if (stMapFileName.Caption = '') then Raise Exception.Create('map file is not defined'); //. =>
//.
TFN:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.ini';
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
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
with TPFMapValidator.Create(Space) do
try
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map validation is started - '+stMapFileName.Caption);
Validate(TFN,stMapFileName.Caption,{out} UTL,{out} DTL);
try
memoLog.Lines.AddStrings(UTL);
memoLog.Lines.AddStrings(DTL);
finally
DTL.Destroy;
UTL.Destroy;
end;
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map has been validated - '+stMapFileName.Caption);
finally
Destroy;
end;
end;

procedure TfmPFMapLoader.btnLoadFromFileClick(Sender: TObject);
var
  TFN: string;
  BA: TByteArray;
  PFMapObjectTypesFilter: TPFMapObjectTypesFilter;
  flAutomaticUpdateIsDisabledLast: boolean;
begin
if (stMapFileName.Caption = '') then Raise Exception.Create('map file is not defined'); //. =>
//.
TFN:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.ini';
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
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
PFMapObjectTypesFilter:=TPFMapObjectTypesFilter.Create;
try
with TfmPFTypesFilter.Create(PFMapObjectTypesFilter) do
try
if (NOT Dialog()) then Exit; //. ->
finally
Destroy;
end;
//.
with TPFMapLoader.Create(Space,idMapFormatMap,idGeoSpace,cbSkipOnDuplicate.Checked,cbCreatedObjectsFile.Checked) do
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
Load(TFN,stMapFileName.Caption);
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
finally
PFMapObjectTypesFilter.Destroy;
end;
//.
ShowMessage('Map file: '+stMapFileName.Caption+' has been loaded.');
end;

procedure TfmPFMapLoader.btnRecalculateClick(Sender: TObject);
var
  PFMapObjectTypesFilter: TPFMapObjectTypesFilter;
begin
PFMapObjectTypesFilter:=TPFMapObjectTypesFilter.Create;
try
with TfmPFTypesFilter.Create(PFMapObjectTypesFilter) do
try
if (NOT Dialog()) then Exit; //. ->
finally
Destroy;
end;
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map recalculation is started');
//.
with TPFMapRecalculator.Create(Space,idMapFormatMap,idGeoSpace) do
try
ObjectTypesFilter:=PFMapObjectTypesFilter;
//.
Space.DisableUpdating();
try
Recalculate(cbRecalculateByPrototype.Checked);
finally
Space.EnableUpdating();
end;
finally
Destroy;
end;
finally
PFMapObjectTypesFilter.Destroy;
end;
//.
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map recalculation is finished');
ShowMessage('Recalculation has been finished.');
end;

procedure TfmPFMapLoader.btnRemoveClick(Sender: TObject);
var
  PFMapObjectTypesFilter: TPFMapObjectTypesFilter;
begin
PFMapObjectTypesFilter:=TPFMapObjectTypesFilter.Create;
try
with TfmPFTypesFilter.Create(PFMapObjectTypesFilter) do
try
if (NOT Dialog()) then Exit; //. ->
finally
Destroy;
end;
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map removing is started');
//.
with TPFMapRemover.Create(Space,idMapFormatMap) do
try
ObjectTypesFilter:=PFMapObjectTypesFilter;
OnMapObjectsRemoving:=DoOnMapObjectsRemoving;
OnMapObjectsRemovingError:=DoOnMapObjectsRemovingError;
//.
Space.DisableUpdating();
try
Remove();
finally
Space.EnableUpdating();
end;
finally
Destroy;
end;
finally
PFMapObjectTypesFilter.Destroy;
end;
//.
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map removing is finished');
ShowMessage('Removing has been finished.');
end;

procedure TfmPFMapLoader.btnRemoveComponentsFromFileClick(Sender: TObject);
begin
if (NOT OpenDialog.Execute()) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': removing components, file: '+OpenDialog.FileName);
TPFMapLoader.RemoveLoadedMapFormatObjects(Space,OpenDialog.FileName,DoOnMapFormatObjectIsRemoved,DoOnMapFormatObjectRemovingError);
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+'components removing is finished.');
ShowMessage('Components are removed, file: '+OpenDialog.FileName);
end;

procedure TfmPFMapLoader.DoOnHeaderProcessed(const Header: TMapHeader; const PMFileSection: ANSIString);
begin
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Map - '+Header.Name);
memoLog.Lines.Add('ID: '+Header.ID);
memoLog.Lines.Add('Datum: '+IntToStr(Header.DatumID));
end;

procedure TfmPFMapLoader.DoOnPointCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': point is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmPFMapLoader.DoOnPointCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating point, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmPFMapLoader.DoOnPointCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating point, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;

procedure TfmPFMapLoader.DoOnPolylineCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Polyline is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmPFMapLoader.DoOnPolylineCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating polyline, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmPFMapLoader.DoOnPolylineCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating polyline, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;

procedure TfmPFMapLoader.DoOnPolygonCreated(const TypeID: Integer; const ObjLabel: ANSIString; const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Polygon is created, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', new MapFormatObjectID: '+IntToStr(idMapFormatObject));
end;

procedure TfmPFMapLoader.DoOnPolygonCreateWarning(const TypeID: Integer; const ObjLabel: ANSIString; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when creating polygon, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', warning: '+Warning);
end;

procedure TfmPFMapLoader.DoOnPolygonCreateError(const TypeID: Integer; const ObjLabel: ANSIString; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR when creating polygon, Type: '+ANSILowerCase(IntToHex(TypeID,1))+', Label: '+ObjLabel+', error: '+Error);
end;

procedure TfmPFMapLoader.DoOnObjectRecalculated(const idMapFormatObject: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Component is recalculated, (ID: '+IntToStr(idMapFormatObject)+')');
end;

procedure TfmPFMapLoader.DoOnObjectRecalculateWarning(const idMapFormatObject: integer; const Warning: string);
begin
if (NOT cbWarningEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': ! Warning when recalculating component, (ID: '+IntToStr(idMapFormatObject)+'), warning: '+Warning);
end;

procedure TfmPFMapLoader.DoOnObjectRecalculateError(const idMapFormatObject: integer; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR of recalculating component, (ID: '+IntToStr(idMapFormatObject)+'), error: '+Error);
end;

procedure TfmPFMapLoader.DoOnMapObjectsRemoving(const Message: string);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': '+Message);
end;

procedure TfmPFMapLoader.DoOnMapObjectsRemovingError(const Message: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': '+Message);
end;

procedure TfmPFMapLoader.DoOnMapFormatObjectIsRemoved(const idTComponent,idComponent: integer);
begin
if (NOT cbInfoEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': Component is removed, ('+IntToStr(idTComponent)+';'+IntToStr(idComponent)+')');
end;

procedure TfmPFMapLoader.DoOnMapFormatObjectRemovingError(const idTComponent,idComponent: integer; const Error: string);
begin
if (NOT cbErrorEvents.Checked) then Exit; //. ->
memoLog.Lines.Add(FormatDateTime('DD.MM.YY HH:NN:SS',Now)+': !!! ERROR of Component removing, ('+IntToStr(idTComponent)+';'+IntToStr(idComponent)+'), error: '+Error);
end;


end.
