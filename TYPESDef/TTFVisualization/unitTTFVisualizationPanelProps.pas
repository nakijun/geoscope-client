unit unitTTFVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines;

const
  HeightIncrement = 4;
  WidthIncrement = 4;
type
  TTTFVisualizationPanelProps = class(TSpaceObjPanelProps)
    FontDialog: TFontDialog;
    EditText: TEdit;
    LabelFont_Height: TLabel;
    LabelFontWidth: TLabel;
    EditFont_Height: TEdit;
    EditFont_Width: TEdit;
    UpDownFont_Height: TUpDown;
    UpDownFont_Width: TUpDown;
    EditFont_Name: TEdit;
    SpeedButtonFontChange: TSpeedButton;
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    ColorDialog: TColorDialog;
    lbColor: TLabel;
    sbChangeColor: TSpeedButton;
    DataSource: TDataSource;
    procedure DBEditKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButtonFontChangeClick(Sender: TObject);
    procedure UpDownFont_HeightClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_WidthClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_HeightMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UpDownFont_WidthMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure sbChangeColorClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Font_Width: Double;
    Font_Height: Double;
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TTTFVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TTTFVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TTTFVisualizationPanelProps._Update;
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
  _Str: WideString;
  _Font_Name: WideString;
begin
Inherited;
with TTTFVisualizationFunctionality(ObjFunctionality) do begin
try
GetParams(_Str, Font_Width, Font_Height, _Font_Name);
EditText.Text:=_Str;
EditFont_Width.Text:=FloatToStr(Font_Width);
EditFont_Height.Text:=FloatToStr(Font_Height);
EditFont_Name.Text:=_Font_Name;
EditText.Font.Name:=EditFont_Name.Text;
ptrObj:=Ptr;
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
lbColor.Color:=Obj.Color;
except
  lbColor.Hide;
  end;
end;
end;

procedure TTTFVisualizationPanelProps.DBEditKeyPress(Sender: TObject;
  var Key: Char);
var
  I: integer;
begin
if Key = #$0D
 then begin
  Updater.Disable; 
  try
  TTTFVisualizationFunctionality(ObjFunctionality).Str:=EditText.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;


procedure TTTFVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTTFVisualizationPanelProps.SpeedButtonFontChangeClick(Sender: TObject);
begin
FontDialog.Font.Name:=EditFont_Name.Text;
if FontDialog.Execute AND (FontDialog.Font.Name <> EditFont_Name.Text)
 then begin
  EditFont_Name.Text:=FontDialog.Font.Name;
  Updater.Disable;
  try
  TTTFVisualizationFunctionality(ObjFunctionality).SetParams(WideString(EditText.Text),Font_Width,Font_Height,WideSTring(EditFont_Name.Text));
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  EditText.Font.Name:=FontDialog.Font.Name;
  end;
end;

procedure TTTFVisualizationPanelProps.UpDownFont_HeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TTTFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TTTFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then Font_Height:=Font_Height+(HeightIncrement/ReflectionWindow.Scale)
 else Font_Height:=Font_Height-(HeightIncrement/ReflectionWindow.Scale);
EditFont_Height.Text:=FloatToStr(Font_Height);
end;
end;

procedure TTTFVisualizationPanelProps.UpDownFont_WidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TTTFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TTTFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then Font_Width:=Font_Width+(WidthIncrement/ReflectionWindow.Scale)
 else Font_Width:=Font_Width-(WidthIncrement/ReflectionWindow.Scale);
EditFont_Width.Text:=FloatToStr(Font_Width);
end;
end;

procedure TTTFVisualizationPanelProps.UpDownFont_HeightMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TTTFVisualizationFunctionality(ObjFunctionality).SetParams(WideString(EditText.Text),Font_Width,Font_Height,WideSTring(EditFont_Name.Text));
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TTTFVisualizationPanelProps.UpDownFont_WidthMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TTTFVisualizationFunctionality(ObjFunctionality).SetParams(WideString(EditText.Text),Font_Width,Font_Height,WideSTring(EditFont_Name.Text));
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TTTFVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(
  Sender: TObject);
begin
if TTTFVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TTTFVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TTTFVisualizationPanelProps.Controls_ClearPropData;
begin
EditFont_Height.Text:='';
EditFont_Width.Text:='';
EditText.Text:='';
EditFont_Name.Text:='';
end;

procedure TTTFVisualizationPanelProps.sbChangeColorClick(Sender: TObject);
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
begin
with TTTFVisualizationFunctionality(ObjFunctionality) do begin
ptrObj:=Ptr;
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
ColorDialog.Color:=Obj.Color;
if ColorDialog.Execute AND (ColorDialog.Color <> Obj.Color)
 then begin
  Obj.Color:=ColorDialog.Color;
  Updater.Disable;
  try
  TBase2DVisualizationFunctionality(ObjFunctionality).SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  if Reflector <> nil then Reflector.RevisionReflect(ptrObj, actRefresh);
  lbColor.Color:=Obj.Color;
  end;
end;
end;

end.
