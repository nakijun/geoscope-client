unit unitGeoSpaceMapFormatObjectSearchPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality,
  ExtCtrls;

type
  TGeoSpaceMapFormatObjectTextSearching = class(TThread)
  private
    Space: TProxySpace;
    idGeoSpace: integer; 
    FormatID: integer;
    KindID: integer;
    TypeID: integer;
    NameContext: WideString;
    ResultObjects: TList;
    flFinished: boolean;
    ExceptionMessage: string;

    Constructor Create(const pSpace: TProxySpace; const pidGeoSpace: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pNameContext: WideString);
    Destructor Destroy; override;
    procedure Execute; override;
  end;

  TfmGeoSpaceMapFormatObjectSearchPanel = class(TForm)
    PageControl1: TPageControl;
    tsTextSearch: TTabSheet;
    anTextSearching: TAnimate;
    edTextContext: TEdit;
    Label1: TLabel;
    sbDoTextSearch: TSpeedButton;
    ListObjects: TListView;
    timerTextSearch: TTimer;
    sbStopTextSearch: TSpeedButton;
    Label14: TLabel;
    cbFormatID: TComboBox;
    cbKind: TComboBox;
    Label2: TLabel;
    cbType: TComboBox;
    Label3: TLabel;
    procedure timerTextSearchTimer(Sender: TObject);
    procedure sbStopTextSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbDoTextSearchClick(Sender: TObject);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure edTextContextKeyPress(Sender: TObject; var Key: Char);
    procedure cbKindClick(Sender: TObject);
  private
    { Private declarations }
    GeoSpaceFunctionality: TGeoSpaceFunctionality;
    TextSearching: TGeoSpaceMapFormatObjectTextSearching;
    TextSearch_Result: TList;
    ImageList: TImageList;

    procedure cbType_Update(const KindID: integer);
    procedure TextSearch_Begin(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pNameContext: WideString);
    procedure TextSearch_End;
    procedure TextSearch_Check;
  public
    { Public declarations }

    Constructor Create(const pGeoSpaceFunctionality: TGeoSpaceFunctionality);
    Destructor Destroy; override;
  end;


implementation
Uses
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitPolishMapFormatDefines;

{$R *.dfm}


{TMapFormatObjectTextSearching}
Constructor TGeoSpaceMapFormatObjectTextSearching.Create(const pSpace: TProxySpace; const pidGeoSpace: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pNameContext: WideString);
begin
Space:=pSpace;
idGeoSpace:=pidGeoSpace;
FormatID:=pFormatID;
KindID:=pKindID;
TypeID:=pTypeID;
NameContext:=pNameContext;
ResultObjects:=nil;
ExceptionMessage:='';
flFinished:=false;
Inherited Create(false);
end;

Destructor TGeoSpaceMapFormatObjectTextSearching.Destroy;
var
  EC: dword;
begin
if (Space.State <> psstDestroying)
 then Inherited
 else begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end;
FreeAndNil(ResultObjects);
end;

procedure TGeoSpaceMapFormatObjectTextSearching.Execute;
begin
try
with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idGeoSpace)) do
try
GetMapFormatMapObjectsByNameContext(FormatID,KindID,TypeID,NameContext,{out} ResultObjects);
finally
Release();
end;
except
  On E: Exception do ExceptionMessage:=E.Message;
  end;
flFinished:=true;
end;


{TfmComponentSearch}
Constructor TfmGeoSpaceMapFormatObjectSearchPanel.Create(const pGeoSpaceFunctionality: TGeoSpaceFunctionality);
var
  I: TMapFormat;
  J: TPMFObjectKind;
begin
Inherited Create(nil);
GeoSpaceFunctionality:=pGeoSpaceFunctionality;
GeoSpaceFunctionality.AddRef();
TextSearching:=nil;
TextSearch_Result:=nil;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
//.
//.
cbFormatID.Items.BeginUpdate;
try
cbFormatID.Items.Clear;
for I:=Low(I) to High(I) do
 if (I <> mfUnknown)
  then cbFormatID.Items.AddObject(MapFormatStrings[I],TObject(I))
  else cbFormatID.Items.AddObject('any format',TObject(I));
cbFormatID.ItemIndex:=1;
finally
cbFormatID.Items.EndUpdate;
end;
//.
cbKind.Items.BeginUpdate;
try
cbKind.Items.Clear();
for J:=Low(TPMFObjectKind) to High(TPMFObjectKind) do
 if (J <> pmfokUnknown)
  then cbKind.Items.AddObject(PMFObjectKindStrings[J],TObject(J))
  else cbKind.Items.AddObject('any kind',TObject(J));
cbKind.ItemIndex:=0;
finally
cbKind.Items.EndUpdate;
end;
//.
cbType_Update(Integer(pmfokUnknown));
end;

Destructor TfmGeoSpaceMapFormatObjectSearchPanel.Destroy;
begin
if (TextSearching <> nil) then TextSearching.FreeOnTerminate:=true;
FreeAndNil(TextSearch_Result);
ImageList.Free;
if (GeoSpaceFunctionality <> nil)
 then begin
  GeoSpaceFunctionality.Release();
  GeoSpaceFunctionality:=nil;
  end;
Inherited;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.cbType_Update(const KindID: integer);
var
  I: integer;
begin
cbType.Items.BeginUpdate;
try
cbType.Items.Clear();
cbType.Items.AddObject('any type',TObject(-2));
case TPMFObjectKind(KindID) of
pmfokPolyline:  for I:=0 to Length(POLYLINE_TYPES)-1 do cbType.Items.AddObject(POLYLINE_TYPES[I].TypeName,TObject(POLYLINE_TYPES[I].TypeID));
pmfokPolygon:   for I:=0 to Length(POLYGON_TYPES)-1 do cbType.Items.AddObject(POLYGON_TYPES[I].TypeName,TObject(POLYGON_TYPES[I].TypeID));
pmfokPOI:       for I:=0 to Length(POI_TYPES)-1 do cbType.Items.AddObject(POI_TYPES[I].TypeName,TObject(POI_TYPES[I].TypeID));
end;
cbType.ItemIndex:=0;
finally
cbType.Items.EndUpdate;
end;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.TextSearch_Begin(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pNameContext: WideString);
begin
sbDoTextSearch.Enabled:=false;
with anTextSearching do begin
Parent:=ListObjects;
Left:=Round((ListObjects.Width-Width)/2);
Top:=Round((ListObjects.Height-Height)/2);
Visible:=true;
Active:=true;
end;
sbStopTextSearch.Visible:=true;
edTextContext.Enabled:=false;
ListObjects.Items.Clear;
timerTextSearch.Enabled:=true;
TextSearching:=TGeoSpaceMapFormatObjectTextSearching.Create(GeoSpaceFunctionality.Space,GeoSpaceFunctionality.idObj,pFormatID,pKindID,pTypeID,pNameContext);
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.TextSearch_End;
begin
if (TextSearching <> nil)
 then begin
  TextSearching.FreeOnTerminate:=true;
  TextSearching:=nil;
  end;
timerTextSearch.Enabled:=false;
edTextContext.Enabled:=true;
sbStopTextSearch.Visible:=false;
anTextSearching.Active:=false;
anTextSearching.Visible:=false;
sbDoTextSearch.Enabled:=true;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.TextSearch_Check;
var
  I: integer;
  _idMap: integer;
  _FormatID: integer;
  _KindID: integer;
  _TypeID: integer;
  _Name: string;
  IconBitmap: TBitmap;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
if ((TextSearching <> nil) AND TextSearching.flFinished)
 then begin
  try
  if TextSearching.ExceptionMessage <> '' then Raise Exception.Create(TextSearching.ExceptionMessage); //. =>
  //. prepare results
  ImageList.Clear;
  ImageList.AddImages(TypesImageList);
  with ListObjects do begin
  Items.BeginUpdate;
  try
  FreeAndNil(TextSearch_Result); TextSearch_Result:=TextSearching.ResultObjects; TextSearching.ResultObjects:=nil;
  Items.Clear;
  for I:=0 to TextSearch_Result.Count-1 do with Items.Add do
    try
    Data:=TextSearch_Result[I];
    with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,Integer(TextSearch_Result[I]))) do
    try
    GetParams({out} _idMap, {out} _FormatID, {out} _KindID, {out} _TypeID, {out} _Name);
    //.
    Caption:=_Name;
    //.
    if GetIconImage(IconBitmap)
     then
      try
      TempBMP:=TBitmap.Create;
      try
      MS:=TMemoryStream.Create;
      try
      IconBitmap.SaveToStream(MS); MS.Position:=0;
      TempBMP.LoadFromStream(MS);
      finally
      MS.Destroy;
      end;
      ImageIndex:=ImageList.Add(TempBMP,nil);
      finally
      TempBMP.Destroy;
      end;
      finally
      IconBitmap.Destroy;
      end
     else
      ImageIndex:=TypeFunctionality.ImageList_Index;
    //.
    if (TMapFormat(_FormatID) = mfPolish)
     then SubItems.Add(KIND_TYPES_GetNameByID(TPMFObjectKind(_KindID),_TypeID))
     else SubItems.Add('?');
    finally
    Release;
    end;
    except
      end;
  finally
  Items.EndUpdate;
  end;
  end;
  finally
  TextSearch_End;
  end;
  if TextSearch_Result.Count = 0 then ShowMessage('Sorry, no objects found.');
  end;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.sbDoTextSearchClick(Sender: TObject);
begin
TextSearch_Begin(Integer(cbFormatID.Items.Objects[cbFormatID.ItemIndex]),Integer(cbKind.Items.Objects[cbKind.ItemIndex]),Integer(cbType.Items.Objects[cbType.ItemIndex]),edTextContext.Text);
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.timerTextSearchTimer(Sender: TObject);
begin
TextSearch_Check;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.sbStopTextSearchClick(Sender: TObject);
begin
TextSearch_End;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


procedure TfmGeoSpaceMapFormatObjectSearchPanel.ListObjectsDblClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
with TComponentFunctionality_Create(idTMapFormatObject,Integer(ListObjects.Selected.Data)) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.cbKindClick(Sender: TObject);
begin
if (cbKind.ItemIndex > 0)
 then cbType_Update(Integer(cbKind.Items.Objects[cbKind.ItemIndex]))
 else cbType_Update(Integer(pmfokUnknown));
end;

procedure TfmGeoSpaceMapFormatObjectSearchPanel.edTextContextKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D) then TextSearch_Begin(Integer(cbFormatID.Items.Objects[cbFormatID.ItemIndex]),Integer(cbKind.Items.Objects[cbKind.ItemIndex]),Integer(cbType.Items.Objects[cbType.ItemIndex]),edTextContext.Text);
end;


end.
