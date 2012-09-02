unit unitMapFormatMapPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ImgList, ComCtrls, Menus;

type
  TMapFormatMapPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edName: TEdit;
    Label14: TLabel;
    cbFormatID: TComboBox;
    Label3: TLabel;
    edID: TEdit;
    Image1: TImage;
    Label2: TLabel;
    btnDATA: TBitBtn;
    Label4: TLabel;
    edGeoSpaceID: TEdit;
    PopupMenu: TPopupMenu;
    Removemapobjects1: TMenuItem;
    Maploader1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Showfilesection1: TMenuItem;
    ShowObjectPrototypesDATA1: TMenuItem;
    Objectscounter1: TMenuItem;
    Recalculatemaparea1: TMenuItem;
    Removeobjectsofothermapinmaparea1: TMenuItem;
    Createnewobject1: TMenuItem;
    btnCreateNewObjectByPrototype: TBitBtn;
    ExportmaptoPolishmapformatfile1: TMenuItem;
    toPolishmapformatfile1: TMenuItem;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFormatIDChange(Sender: TObject);
    procedure edGeoSpaceIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Removemapobjects1Click(Sender: TObject);
    procedure Maploader1Click(Sender: TObject);
    procedure Showfilesection1Click(Sender: TObject);
    procedure ShowObjectPrototypesDATA1Click(Sender: TObject);
    procedure Objectscounter1Click(Sender: TObject);
    procedure btnDATAClick(Sender: TObject);
    procedure Recalculatemaparea1Click(Sender: TObject);
    procedure Removeobjectsofothermapinmaparea1Click(Sender: TObject);
    procedure Createnewobject1Click(Sender: TObject);
    procedure btnCreateNewObjectByPrototypeClick(Sender: TObject);
    procedure toPolishmapformatfile1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure StartNewObjectCreation();
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

  TCreateMapFormatObjectCompletionObject = class(TCreateCompletionObject)
  private
    MapFormatMapFunctionality: TMapFormatMapFunctionality;
    CloneLayID: integer;

    procedure DoOnCreateClone(const idTClone,idClone: integer); override;
  public
    Constructor Create(const pEditingOrCreatingObject: TEditingOrCreatingObject; const pMapFormatMapFunctionality: TMapFormatMapFunctionality; const pCloneLayID: integer);
    Destructor Destroy; override;
  end;

  
implementation
uses
  GlobalSpaceDefines,
  FileCtrl,
  ZLib,
  unitPFMLoader,
  unitMapFormatMapObjectPrototypesDATAEditor,
  unitPolishMapFormatObjectTypeSelector;


{$R *.DFM}


Constructor TMapFormatMapPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: TMapFormat;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
//.
if flReadOnly then DisableControls;
//.
cbFormatID.Items.BeginUpdate;
try
cbFormatID.Items.Clear;
for I:=Low(I) to High(I) do cbFormatID.Items.Add(MapFormatStrings[I]);
finally
cbFormatID.Items.EndUpdate;
end;
//.
Update();
end;

destructor TMapFormatMapPanelProps.Destroy;
begin
Inherited;
end;

procedure TMapFormatMapPanelProps._Update;
var
  _GeoSpaceID: integer;
  _FormatID: integer;
  _Name: string;
begin
Inherited;
TMapFormatMapFunctionality(ObjFunctionality).GetParams({out} _GeoSpaceID,{out} _FormatID,{out} _Name);
edGeoSpaceID.Text:=IntToStr(_GeoSpaceID);
edName.Text:=_Name;
edID.Text:=IntToStr(ObjFunctionality.idObj);
if (_FormatID < cbFormatID.Items.Count)
 then cbFormatID.ItemIndex:=_FormatID
 else cbFormatID.ItemIndex:=-1;
end;

procedure TMapFormatMapPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMapFormatMapPanelProps.Controls_ClearPropData;
begin
edGeoSpaceID.Text:='';
edName.Text:='';
edID.Text:='';
cbFormatID.ItemIndex:=-1;
end;


{TCreateMapFormatObjectCompletionObject}
Constructor TCreateMapFormatObjectCompletionObject.Create(const pEditingOrCreatingObject: TEditingOrCreatingObject; const pMapFormatMapFunctionality: TMapFormatMapFunctionality; const pCloneLayID: integer);
begin
Inherited Create(pEditingOrCreatingObject);
MapFormatMapFunctionality:=pMapFormatMapFunctionality;
MapFormatMapFunctionality.AddRef();
CloneLayID:=pCloneLayID;
end;

Destructor TCreateMapFormatObjectCompletionObject.Destroy;
begin
if (MapFormatMapFunctionality <> nil)
 then begin
  MapFormatMapFunctionality.Release();
  MapFormatMapFunctionality:=nil;
  end;
Inherited;
end;

procedure TCreateMapFormatObjectCompletionObject.DoOnCreateClone(const idTClone,idClone: integer);
var
  CL: TComponentsList;
  VF: TBase2DVisualizationFunctionality;
  LE: boolean;
  ODP: TMapFormatObjectDATAPanel;
begin
with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTClone,idClone)) do
try
//. set nodes
if (QueryComponents(TBase2DVisualizationFunctionality, {out} CL))
 then
  try
  VF:=TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[0]^).idTComponent,TItemComponentsList(CL[0]^).idComponent));
  with VF do
  try
  //. change object lay if transformation file has a lay definition
  if (CloneLayID <> 0) then ChangeLay(CloneLayID);
  //. re-select created object in reflector
  EditingOrCreatingObject.Reflector.SelectObj(Ptr());
  finally
  Release;
  end;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('Visualization component is not found'); //. =>
//. set params
idMap:=MapFormatMapFunctionality.idObj;
//. set object data and validate object according that data
ODP:=TMapFormatObjectDATAPanel(DATAPanel_Create());
try
LE:=EditingOrCreatingObject.Panel.Enabled;
try
EditingOrCreatingObject.Panel.Enabled:=false;
if (NOT ODP.Dialog())
 then begin
  TypeFunctionality.DestroyInstance(idClone);
  Exit; //. ->
  end;
finally
EditingOrCreatingObject.Panel.Enabled:=LE;
end;
finally
ODP.Destroy;
end;
finally
Release();
end;
end;


procedure TMapFormatMapPanelProps.StartNewObjectCreation();
var
  _Reflector: TReflector;
  KindID,TypeID: integer;
  PrototypeID: integer;
  PrototypeLayID: integer;
  EditingOrCreatingObject: TEditingOrCreatingObject;
begin
if (ObjFunctionality.TypeSystem.TypesSystem.Reflector = nil) then Raise Exception.Create('there is no current reflector'); //. =>
if (NOT (ObjFunctionality.TypeSystem.TypesSystem.Reflector is TReflector)) then Raise Exception.Create('current reflector is not of required type'); //. =>
_Reflector:=TReflector(ObjFunctionality.TypeSystem.TypesSystem.Reflector);
with TfmPolishFormatObjectTypeSelector.Create do
try
if (Dialog({out} KindID,TypeID) AND TMapFormatMapFunctionality(ObjFunctionality).GetObjectPrototype(KindID,TypeID,{out} PrototypeID,PrototypeLayID))
 then begin
  EditingOrCreatingObject:=_Reflector.BeginCreateObject(idTMapFormatObject,PrototypeID,PrototypeLayID,true{disable scaling},true{disable rotating});
  if (EditingOrCreatingObject <> nil)
   then begin
    EditingOrCreatingObject.CreateCompletionObject:=TCreateMapFormatObjectCompletionObject.Create(EditingOrCreatingObject,TMapFormatMapFunctionality(ObjFunctionality),PrototypeLayID);
    end;
  end;
finally
Destroy;
end;
end;

procedure TMapFormatMapPanelProps.edGeoSpaceIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TMapFormatMapFunctionality(ObjFunctionality).GeoSpaceID:=StrToInt(edGeoSpaceID.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMapFormatMapPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TMapFormatMapFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMapFormatMapPanelProps.cbFormatIDChange(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
Updater.Disable;
try
TMapFormatMapFunctionality(ObjFunctionality).FormatID:=cbFormatID.ItemIndex;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TMapFormatMapPanelProps.Removemapobjects1Click(Sender: TObject);
begin
if (Application.MessageBox('Remove all objects of this map ?','Confirmation',MB_YESNO+MB_ICONWARNING) = IDYES)
 then begin
  TMapFormatMapFunctionality(ObjFunctionality).RemoveObjects();
  ShowMessage('Objects have been removed.');
  end; 
end;

procedure TMapFormatMapPanelProps.Maploader1Click(Sender: TObject);
var
  _GeoSpaceID: integer;
begin
_GeoSpaceID:=TMapFormatMapFunctionality(ObjFunctionality).GeoSpaceID;
if (_GeoSpaceID = 0) then Raise Exception.Create('GeoSpace is not defined for this map'); //. =>
with TfmPFMapLoader.Create(ObjFunctionality.Space,ObjFunctionality.idObj,_GeoSpaceID) do
try
ShowModal();
finally
Destroy;
end;
end;


procedure TMapFormatMapPanelProps.ShowObjectPrototypesDATA1Click(Sender: TObject);
var
  BA: TByteArray;
  DATAStr: ANSIString;
begin
with TMapFormatMapFunctionality(ObjFunctionality) do begin
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
end;
end;

procedure TMapFormatMapPanelProps.Showfilesection1Click(Sender: TObject);
var
  MS: TMemoryStream;
begin
with TMapFormatMapFunctionality(ObjFunctionality) do begin
GetData(MS);
try
if (MS.Size = 0) then Exit; //. ->
with TMapFormatMapDATAParser.Create(MS) do
try
ShowMessage(FileSection());
finally
Destroy;
end;
finally
MS.Destroy;
end;
end;
end;

procedure TMapFormatMapPanelProps.Objectscounter1Click(Sender: TObject);
begin
ShowMessage('Objects counter: '+IntToStr(TMapFormatMapFunctionality(ObjFunctionality).ObjectsCounter));
end;

procedure TMapFormatMapPanelProps.btnDATAClick(Sender: TObject);
begin
Showfilesection1Click(nil);
end;

procedure TMapFormatMapPanelProps.Recalculatemaparea1Click(Sender: TObject);
begin
if (Application.MessageBox('Recalculate map area ?','Confirmation',MB_YESNO+MB_ICONWARNING) = IDYES)
 then begin
  TMapFormatMapFunctionality(ObjFunctionality).RecalculateMapArea();
  ShowMessage('Map area has been recalculated');
  end;
end;

procedure TMapFormatMapPanelProps.Removeobjectsofothermapinmaparea1Click(Sender: TObject);
begin
if (Application.MessageBox('Remove objects of other maps in map area ?','Confirmation',MB_YESNO+MB_ICONWARNING) = IDYES)
 then begin
  TMapFormatMapFunctionality(ObjFunctionality).RemoveIrrelevantObjectsInMapArea();
  ShowMessage('Objects have been removed');
  end;
end;

procedure TMapFormatMapPanelProps.Createnewobject1Click(Sender: TObject);
begin
StartNewObjectCreation();
end;

procedure TMapFormatMapPanelProps.btnCreateNewObjectByPrototypeClick(Sender: TObject);
begin
StartNewObjectCreation();
end;

procedure TMapFormatMapPanelProps.toPolishmapformatfile1Click(Sender: TObject);
const
  DecompressPortion = 8192*10;
var
  Path: string;
  ZipData: TByteArray;
  ExportFileName: string;
  MS,RS: TMemoryStream;
  DS: TDecompressionStream;
  Sz: LongInt;
  Buffer: array[0..DecompressPortion-1] of byte;
begin
if (NOT SelectDirectory('Select folder for export file ->','',Path)) then Exit; //. ->
//.
TMapFormatMapFunctionality(ObjFunctionality).ExportMap(Integer(mfPolish),{out} ZipData);
if (Length(ZipData) = 0) then Raise Exception.Create('export file is empty'); //. =>
//.
ExportFileName:=Path+'\'+TMapFormatMapFunctionality(ObjFunctionality).Name+'.mp';
//. decompress zipped data
MS:=TMemoryStream.Create();
with MS do
try
Size:=Length(ZipData);
Write(Pointer(@ZipData[0])^,Size);
Position:=0;
DS:=TDecompressionStream.Create(MS);
try
RS:=TMemoryStream.Create();
try
RS.Size:=(MS.Size SHL 2);
repeat
  Sz:=DS.Read(Buffer,DecompressPortion);
  if (Sz > 0) then RS.Write(Buffer,Sz);
until (Sz < DecompressPortion);
//. saving to file
RS.SaveToFile(ExportFileName);
//.
finally
RS.Destroy();
end;
finally
DS.Destroy();
end;
finally
MS.Destroy();
end;
ShowMessage('Map has been successfully exported in file: '+ExportFileName);
end;


end.
