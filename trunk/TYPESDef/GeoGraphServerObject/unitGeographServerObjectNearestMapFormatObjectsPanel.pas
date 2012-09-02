unit unitGeographServerObjectNearestMapFormatObjectsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality;

type
  TfmGeographServerObjectNearestMapFormatObjectsPanel = class(TForm)
    ListObjects: TListView;
    procedure ListObjectsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    idGeographServerObject: integer;
    ImageList: TImageList;
  public
    { Public declarations }
    Constructor Create(const pidGeographServerObject: integer);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;


implementation
Uses
  unitPolishMapFormatDefines;

{$R *.dfm}


{TfmGeographServerObjectNearestMapFormatObjectsPanel}
Constructor TfmGeographServerObjectNearestMapFormatObjectsPanel.Create(const pidGeographServerObject: integer);
begin
Inherited Create(nil);
idGeographServerObject:=pidGeographServerObject;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
//.
Update();
end;

Destructor TfmGeographServerObjectNearestMapFormatObjectsPanel.Destroy;
begin
ImageList.Free;
Inherited;
end;

procedure TfmGeographServerObjectNearestMapFormatObjectsPanel.Update;
var
  I: integer;
  idMapFormatObject: integer;
  OLA: TByteArray;
  OC: integer;
  _idMap: integer;
  _FormatID: integer;
  _KindID: integer;
  _TypeID: integer;
  _Name: string;
  IconBitmap: TBitmap;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
//. prepare results
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with ListObjects do begin
Items.BeginUpdate;
try
with TGeographServerObjectFunctionality(TComponentFunctionality_Create(idTGeographServerObject,idGeographServerObject)) do
try
if (NOT GetNearestMapFormatObjects(3, {out} OLA)) then Exit; //. ->
OC:=Length(OLA) DIV SizeOf(idMapFormatObject);
for I:=0 to OC-1 do with Items.Add do
  try
  idMapFormatObject:=Integer(Pointer(DWord(@OLA[0])+I*SizeOf(idMapFormatObject))^);
  Data:=Pointer(idMapFormatObject);
  with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,idMapFormatObject)) do
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
Release;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmGeographServerObjectNearestMapFormatObjectsPanel.ListObjectsDblClick(Sender: TObject);
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

procedure TfmGeographServerObjectNearestMapFormatObjectsPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
