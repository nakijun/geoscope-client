unit unitMapFormatObjectPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ImgList, ComCtrls, Menus;

type
  TMapFormatObjectPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edName: TEdit;
    Image1: TImage;
    Label2: TLabel;
    Label4: TLabel;
    edMapName: TEdit;
    Label3: TLabel;
    edType: TEdit;
    PopupMenu: TPopupMenu;
    Showfilesection1: TMenuItem;
    Showparentmap1: TMenuItem;
    btnSet: TBitBtn;
    sbMapProperties: TSpeedButton;
    btnData: TBitBtn;
    N1: TMenuItem;
    Rebuild1: TMenuItem;
    RebuildusingPrototype1: TMenuItem;
    btnChangeType: TBitBtn;
    Build1: TMenuItem;
    btnChangeMap: TBitBtn;
    Showprototype1: TMenuItem;
    N2: TMenuItem;
    Createobjectofparentmap1: TMenuItem;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Showfilesection1Click(Sender: TObject);
    procedure Showparentmap1Click(Sender: TObject);
    procedure edTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSetClick(Sender: TObject);
    procedure sbMapPropertiesClick(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure Rebuild1Click(Sender: TObject);
    procedure RebuildusingPrototype1Click(Sender: TObject);
    procedure btnChangeTypeClick(Sender: TObject);
    procedure Build1Click(Sender: TObject);
    procedure btnChangeMapClick(Sender: TObject);
    procedure Showprototype1Click(Sender: TObject);
    procedure Createobjectofparentmap1Click(Sender: TObject);
  private
    { Private declarations }
    _idMap: integer;
    _FormatID: integer;
    _KindID: integer;
    _TypeID: integer;
    _Name: string;

    procedure ChangeMap();
    procedure ChangeType();
    procedure ShowObjectPrototype();
    procedure StartNewObjectCreation();
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  unitPolishMapFormatDefines,
  unitMapFormatMapPanelProps,
  unitTMapFormatMapInstanceSelector,
  unitPolishMapFormatObjectTypeSelector;

{$R *.DFM}


Constructor TMapFormatObjectPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: TMapFormat;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
//.
if flReadOnly then DisableControls;
//.
if (ObjFunctionality.Space.UserName = 'ROOT')
 then begin
  edType.ReadOnly:=false;
  edName.ReadOnly:=false;
  end;
//.
Update();
end;

destructor TMapFormatObjectPanelProps.Destroy;
begin
Inherited;
end;

procedure TMapFormatObjectPanelProps._Update;
var
  MapName: string;
begin
Inherited;
with TMapFormatObjectFunctionality(ObjFunctionality) do begin
GetParams({out} _idMap, {out} _FormatID, {out} _KindID, {out} _TypeID, {out} _Name);
if (_idMap <> 0)
 then with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap, _idMap)) do
  try
  MapName:=Name;
  finally
  Release;
  end
 else MapName:='- undefined -';
edMapName.Text:=MapName;
case TMapFormat(_FormatID) of
mfPolish: begin
  case TPMFObjectKind(_KindID) of
  pmfokPolyline: edType.Text:=POLYLINE_TYPES_GetNameByID(_TypeID);
  pmfokPolygon: edType.Text:=POLYGON_TYPES_GetNameByID(_TypeID);
  pmfokPOI: edType.Text:=POI_TYPES_GetNameByID(_TypeID);
  else
    edType.Text:=IntToStr(_TypeID);
  end;
  if (ObjFunctionality.Space.UserName = 'ROOT') then edType.Text:=edType.Text+'(0x'+ANSILowerCase(IntToHex(_TypeID,1))+')';
  end;
else
  edType.Text:=IntToStr(_TypeID);
end;
edName.Text:=_Name;
end;
end;

procedure TMapFormatObjectPanelProps.ChangeType();
var
  TypeID: integer;
begin
case TMapFormat(_FormatID) of
mfPolish: begin
  with TfmPolishFormatObjectTypeSelector.Create() do
  try
  if (TypeDialog(_KindID,{out} TypeID))
   then begin
    Application.ProcessMessages();
    //.
    TMapFormatObjectFunctionality(ObjFunctionality).TypeID:=TypeID;
    TMapFormatObjectFunctionality(ObjFunctionality).Build(true);
    end;
  finally
  Destroy;
  end;
  end;
else
  Raise Exception.Create('unsupported map format'); //. =>
end;
end;

procedure TMapFormatObjectPanelProps.ChangeMap();
var
  idMapFormatMap: integer;
begin
with TfmTMapFormatMapInstanceSelector.Create do
try
if (Select({out} idMapFormatMap))
 then with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idMapFormatMap)) do
  try
  if (FormatID <> TMapFormatObjectFunctionality(ObjFunctionality).FormatID)
   then Raise Exception.Create('wrong target map format'); //. =>
  //. change map
  TMapFormatObjectFunctionality(ObjFunctionality).idMap:=idObj;
  //. rebuild object by new map prototype
  TMapFormatObjectFunctionality(ObjFunctionality).Build(true);
  //.
  ShowMessage('object map has been changed');
  finally
  Release;
  end;
finally
Destroy;
end;
end;

procedure TMapFormatObjectPanelProps.ShowObjectPrototype();
var
  PrototypeID: integer;
  LayID: integer;
begin
if (_idMap <> 0)
 then with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap, _idMap)) do
  try
  if (GetObjectPrototype(_KindID,_TypeID,{out} PrototypeID,{out} LayID))
   then with TMapFormatObjectFunctionality(TComponentFunctionality_Create(idTMapFormatObject,PrototypeID)) do
    try
    with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
    Position:=poDefault;
    Position:=poScreenCenter;
    Show();
    end;
    finally
    Release;
    end
   else Raise Exception.Create('there is no prototype is defined for this object'); //. =>
  finally
  Release;
  end
 else Raise Exception.Create('there is no map for this object'); //. =>
end;

procedure TMapFormatObjectPanelProps.StartNewObjectCreation();
var
  _Reflector: TReflector;
  MapFormatMapFunctionality: TMapFormatMapFunctionality;
  KindID,TypeID: integer;
  PrototypeID: integer;
  PrototypeLayID: integer;
  EditingOrCreatingObject: TEditingOrCreatingObject;
begin
if (ObjFunctionality.TypeSystem.TypesSystem.Reflector = nil) then Raise Exception.Create('there is no current reflector'); //. =>
if (NOT (ObjFunctionality.TypeSystem.TypesSystem.Reflector is TReflector)) then Raise Exception.Create('current reflector is not of required type'); //. =>
_Reflector:=TReflector(ObjFunctionality.TypeSystem.TypesSystem.Reflector);
if (_idMap <> 0)
 then begin
  MapFormatMapFunctionality:=TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap, _idMap));
  try
  with TfmPolishFormatObjectTypeSelector.Create() do
  try
  if (Dialog({out} KindID,TypeID) AND MapFormatMapFunctionality.GetObjectPrototype(KindID,TypeID,{out} PrototypeID,PrototypeLayID))
   then begin
    EditingOrCreatingObject:=_Reflector.BeginCreateObject(idTMapFormatObject,PrototypeID,PrototypeLayID,true{disable scaling},true{disable rotating});
    if (EditingOrCreatingObject <> nil)
     then begin
      EditingOrCreatingObject.CreateCompletionObject:=TCreateMapFormatObjectCompletionObject.Create(EditingOrCreatingObject,MapFormatMapFunctionality,PrototypeLayID);
      end;
    end;
  finally
  Destroy;
  end;
  finally
  MapFormatMapFunctionality.Release;
  end;
  end;
end;

procedure TMapFormatObjectPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMapFormatObjectPanelProps.Controls_ClearPropData;
begin
edMapName.Text:='';
edType.Text:='';
edName.Text:='';
end;

procedure TMapFormatObjectPanelProps.edTypeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  TMapFormatObjectFunctionality(ObjFunctionality).TypeID:=StrToInt(edType.Text);
  end;
end;
end;

procedure TMapFormatObjectPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TMapFormatObjectFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMapFormatObjectPanelProps.Showfilesection1Click(Sender: TObject);
var
  MS: TMemoryStream;
begin
with TMapFormatObjectFunctionality(ObjFunctionality) do begin
GetData(MS);
try
if (MS.Size = 0) then Exit; //. ->
with TMapFormatObjectDATAParser.Create() do
try
LoadFromStream(MS);
ShowMessage(FileSection);
finally
Destroy;
end;
finally
MS.Destroy;
end;
end;
end;

procedure TMapFormatObjectPanelProps.Showparentmap1Click(Sender: TObject);
begin
with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap, TMapFormatObjectFunctionality(ObjFunctionality).idMap)) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
end;

procedure TMapFormatObjectPanelProps.sbMapPropertiesClick(Sender: TObject);
begin
Showparentmap1Click(nil);
end;

procedure TMapFormatObjectPanelProps.btnSetClick(Sender: TObject);
var
  ODP: TMapFormatObjectDATAPanel;
begin
ODP:=TMapFormatObjectDATAPanel(TMapFormatObjectFunctionality(ObjFunctionality).DATAPanel_Create());
try
ODP.Dialog();
finally
ODP.Destroy;
end;
end;

procedure TMapFormatObjectPanelProps.btnDataClick(Sender: TObject);
begin
Showfilesection1Click(nil);
end;

procedure TMapFormatObjectPanelProps.Rebuild1Click(Sender: TObject);
begin
TMapFormatObjectFunctionality(ObjFunctionality).Compile();
ShowMessage('Object has been compiled.');
end;

procedure TMapFormatObjectPanelProps.Build1Click(Sender: TObject);
begin
TMapFormatObjectFunctionality(ObjFunctionality).Compile();
TMapFormatObjectFunctionality(ObjFunctionality).Build(false);
ShowMessage('Object has been built.');
end;

procedure TMapFormatObjectPanelProps.RebuildusingPrototype1Click(Sender: TObject);
begin
TMapFormatObjectFunctionality(ObjFunctionality).Compile();
TMapFormatObjectFunctionality(ObjFunctionality).Build(true);
ShowMessage('Object has been built using its prototype.');
end;

procedure TMapFormatObjectPanelProps.btnChangeTypeClick(Sender: TObject);
begin
btnChangeType.Enabled:=false;
try
ChangeType();
finally
btnChangeType.Enabled:=true;
end;
end;

procedure TMapFormatObjectPanelProps.btnChangeMapClick(Sender: TObject);
begin
btnChangeMap.Enabled:=false;
try
ChangeMap();
finally
btnChangeMap.Enabled:=true;
end;
end;

procedure TMapFormatObjectPanelProps.Showprototype1Click(Sender: TObject);
begin
ShowObjectPrototype();
end;

procedure TMapFormatObjectPanelProps.Createobjectofparentmap1Click(Sender: TObject);
begin
StartNewObjectCreation();
end;


end.
