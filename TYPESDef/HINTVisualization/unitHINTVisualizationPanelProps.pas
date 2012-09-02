unit unitHINTVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  THINTVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    edInfoString: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    memoInfoText: TMemo;
    bbSave: TBitBtn;
    Label3: TLabel;
    edInfoComponent: TEdit;
    edInfoComponentPopup: TPopupMenu;
    copyfromclipboard1: TMenuItem;
    clear1: TMenuItem;
    sbInfoStringSelectFont: TSpeedButton;
    FontDialog: TFontDialog;
    sbInfoTextSelectFont: TSpeedButton;
    ColorDialog: TColorDialog;
    Label4: TLabel;
    edTransparency: TEdit;
    Label5: TLabel;
    bbSetByUnderlayedObject: TBitBtn;
    bbLoadStatusInfoText: TBitBtn;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure bbSaveClick(Sender: TObject);
    procedure copyfromclipboard1Click(Sender: TObject);
    procedure clear1Click(Sender: TObject);
    procedure sbInfoStringSelectFontClick(Sender: TObject);
    procedure sbInfoTextSelectFontClick(Sender: TObject);
    procedure bbSetByUnderlayedObjectClick(Sender: TObject);
    procedure bbLoadStatusInfoTextClick(Sender: TObject);
  private
    { Private declarations }
    _InfoComponent: TID;
    _StatusInfoText: ANSIString;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadImageFromFile;
    procedure Save;
    procedure SetToUnderlayObjectContainer;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor THINTVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
_InfoComponent.idObj:=0;
_StatusInfoText:='';
Update;
end;

destructor THINTVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure THINTVisualizationPanelProps._Update;

  procedure NormalizeString(var S: string);
  var
    I: integer;
    SR: string;
  begin
  SR:='';
  for I:=1 to Length(S) do if (S[I] = #$0A) then SR:=SR+#$0D#$0A else SR:=SR+S[I];
  S:=SR;
  end;

var
  ImageDATA: TMemoryStream;
  CFT: TComponentFileType;
  DATA: TMemoryStream;
begin
Inherited;
//.
with THINTVisualizationFunctionality(ObjFunctionality) do begin
GetPrivateDATA(DATA);
with DATA do
try
with THintVisualizationDATA.Create(DATA) do
try
edInfoString.Text:=InfoString;
edInfoString.Font.Name:=InfoStringFontName;
edInfoString.Font.Size:=InfoStringFontSize;
edInfoString.Font.Color:=InfoStringFontColor;
NormalizeString(InfoText);
memoInfoText.Text:=InfoText;
memoInfoText.Font.Name:=InfoTextFontName;
memoInfoText.Font.Size:=InfoTextFontSize;
memoInfoText.Font.Color:=InfoTextFontColor;
if (InfoComponent.idObj <> 0)
 then with TComponentFunctionality_Create(InfoComponent.idType,InfoComponent.idObj) do
  try
  _InfoComponent.idType:=idTObj;
  _InfoComponent.idObj:=idObj;
  edInfoComponent.Text:=Name;
  finally
  Release;
  end
 else begin
  _InfoComponent.idObj:=0;
  edInfoComponent.Text:=' - none - ';
  end;
_StatusInfoText:=StatusInfoText;
edTransparency.Text:=IntToStr(Transparency);
finally
Destroy;
end;
finally
Destroy;
end;
GetDATA(ImageDATA,CFT);
try
if ((CFT = cftBMP) AND (ImageDATA.Size > 0))
 then SpeedButtonShowAtReflectorCenter.Glyph.LoadFromStream(ImageDATA);
finally
ImageDATA.Destroy;
end;
end;
end;

procedure THINTVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
var
  ptrObj: TPtr;
begin
try
ptrObj:=TVisualizationFunctionality(ObjFunctionality).Ptr;
except
  ptrObj:=nilPtr;
  end;
if (ptrObj = nilPtr) then Exit; //. ->
if (THINTVisualizationFunctionality(ObjFunctionality).Reflector <> nil) then THINTVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(ptrObj);
end;

procedure THINTVisualizationPanelProps.LoadImageFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with THINTVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure THINTVisualizationPanelProps.Save;
var
  DATA: THintVisualizationDATA;
begin
DATA:=THintVisualizationDATA.Create();
with DATA do
try
InfoString:=edInfoString.Text;
InfoStringFontName:=edInfoString.Font.Name;
InfoStringFontSize:=edInfoString.Font.Size;
InfoStringFontColor:=edInfoString.Font.Color;
InfoText:=memoInfoText.Text;
InfoTextFontName:=memoInfoText.Font.Name;
InfoTextFontSize:=memoInfoText.Font.Size;
InfoTextFontColor:=memoInfoText.Font.Color;
InfoComponent:=_InfoComponent;
StatusInfoText:=_StatusInfoText;
Transparency:=StrToInt(edTransparency.Text);
SetProperties;
Position:=0;
Updater.Disable;
try
THINTVisualizationFunctionality(ObjFunctionality).SetPrivateDATA(DATA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
finally
Destroy;
end;
end;

procedure THINTVisualizationPanelProps.SetToUnderlayObjectContainer;
var
  ptrOwner: TPtr;
  minX,minY,maxX,maxY: Extended;
  Y,W: double;
begin
with THINTVisualizationFunctionality(ObjFunctionality) do begin
ptrOwner:=Space.Obj_Owner(Ptr);
if ((ptrOwner <> nilPtr) AND Space.Obj_GetMinMax(minX,minY,maxX,maxY, ptrOwner))
 then begin
  Y:=(minY+maxY)/2.0;
  W:=(maxY-minY);
  SetNode(0, minX,Y);
  SetNode(1, maxX,Y);
  Width:=W;
  end;
end;
end;

procedure THINTVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure THINTVisualizationPanelProps.Controls_ClearPropData;
begin
edInfoString.Text:='';
memoInfoText.Text:='';
edInfoComponent.Text:='';
end;

procedure THINTVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadImageFromFile;
end;

procedure THINTVisualizationPanelProps.bbSaveClick(Sender: TObject);
begin
Save;
end;

procedure THINTVisualizationPanelProps.copyfromclipboard1Click(Sender: TObject);
begin
if NOT TypesSystem.ClipBoard_flExist then Raise Exception.Create('clipboard is empty'); //. =>
_InfoComponent.idType:=TypesSystem.ClipBoard_Instance_idTObj;
_InfoComponent.idObj:=TypesSystem.ClipBoard_Instance_idObj;
//.
with TComponentFunctionality_Create(_InfoComponent.idType,_InfoComponent.idObj) do
try
edInfoComponent.Text:=Name;
finally
Release;
end
end;

procedure THINTVisualizationPanelProps.clear1Click(Sender: TObject);
begin
_InfoComponent.idObj:=0;
//.
edInfoComponent.Text:='';
end;

procedure THINTVisualizationPanelProps.sbInfoStringSelectFontClick(Sender: TObject);
begin
FontDialog.Font:=edInfoString.Font;
if (FontDialog.Execute) then edInfoString.Font:=FontDialog.Font;
end;

procedure THINTVisualizationPanelProps.sbInfoTextSelectFontClick(Sender: TObject);
begin
FontDialog.Font:=memoInfoText.Font;
if (FontDialog.Execute) then memoInfoText.Font:=FontDialog.Font;
end;

procedure THINTVisualizationPanelProps.bbSetByUnderlayedObjectClick(Sender: TObject);
begin
SetToUnderlayObjectContainer;
end;

procedure THINTVisualizationPanelProps.bbLoadStatusInfoTextClick(Sender: TObject);
var
  CD: string;
  R: boolean;
  MS: TMemoryStream;
  DATA: THintVisualizationDATA;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if (R)
 then begin
  MS:=TMemoryStream.Create;
  try
  MS.LoadFromFile(OpenFileDialog.FileName);
  SetLength(_StatusInfoText,MS.Size);
  MS.Position:=0;
  MS.Read(Pointer(@_StatusInfoText[1])^,Length(_StatusInfoText));
  finally
  MS.Destroy;
  end;
  //.
  Save;
  end;
end;


end.
