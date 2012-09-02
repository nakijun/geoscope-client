unit unitOrientedTTFVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines;

const
  HeightIncrement = 4;
  WidthIncrement = 4;
  CharIntervalIncrement = 3;
type
  TOrientedTTFVisualizationPanelProps = class(TSpaceObjPanelProps)
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
    Label1: TLabel;
    cbOrientation: TComboBox;
    updownCharInterval: TUpDown;
    edCharInterval: TEdit;
    Label2: TLabel;
    procedure SpeedButtonFontChangeClick(Sender: TObject);
    procedure UpDownFont_HeightClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_WidthClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownFont_HeightMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UpDownFont_WidthMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure sbChangeColorClick(Sender: TObject);
    procedure updownCharIntervalClick(Sender: TObject; Button: TUDBtnType);
    procedure updownCharIntervalMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbOrientationChange(Sender: TObject);
    procedure EditTextKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Font_Width: Extended;
    Font_Height: Extended;
    CharInterval: Extended;
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TOrientedTTFVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOrientedTTFVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TOrientedTTFVisualizationPanelProps._Update;
begin
Inherited;
//.
with TOrientedTTFVisualizationFunctionality(ObjFunctionality) do begin
//.
EditText.Text:=Str;
//.
Self.Font_Height:=Font_Height;
EditFont_Height.Text:=FloatToStr(Self.Font_Height);
//.
Self.Font_Width:=Font_Width;
EditFont_Width.Text:=FloatToStr(Self.Font_Width);
//.
EditFont_Name.Text:=Font_Name;
EditText.Font.Name:=EditFont_Name.Text;
//.
Self.CharInterval:=CharInterval;
edCharInterval.Text:=FloatToStr(Self.CharInterval);
//.
if Orientation = 0
 then cbOrientation.ItemIndex:=0 //. horizontal
 else cbOrientation.ItemIndex:=1;
//.
try
lbColor.Color:=Color;
except
  lbColor.Hide;
  end;
end;
end;

procedure TOrientedTTFVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOrientedTTFVisualizationPanelProps.SpeedButtonFontChangeClick(Sender: TObject);
begin
FontDialog.Font.Name:=EditFont_Name.Text;
if FontDialog.Execute AND (FontDialog.Font.Name <> EditFont_Name.Text)
 then begin
  Updater.Disable;
  try
  TOrientedTTFVisualizationFunctionality(ObjFunctionality).Font_Name:=FontDialog.Font.Name;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  EditFont_Name.Text:=FontDialog.Font.Name;
  EditText.Font.Name:=FontDialog.Font.Name;
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.UpDownFont_HeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then Font_Height:=Font_Height+(HeightIncrement/ReflectionWindow.Scale)
 else Font_Height:=Font_Height-(HeightIncrement/ReflectionWindow.Scale);
EditFont_Height.Text:=FloatToStr(Font_Height);
end;
end;

procedure TOrientedTTFVisualizationPanelProps.UpDownFont_WidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then Font_Width:=Font_Width+(WidthIncrement/ReflectionWindow.Scale)
 else Font_Width:=Font_Width-(WidthIncrement/ReflectionWindow.Scale);
EditFont_Width.Text:=FloatToStr(Font_Width);
end;
end;

procedure TOrientedTTFVisualizationPanelProps.UpDownFont_HeightMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedTTFVisualizationFunctionality(ObjFunctionality).Font_Height:=Font_Height;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.UpDownFont_WidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedTTFVisualizationFunctionality(ObjFunctionality).Font_Width:=Font_Width;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.sbChangeColorClick(Sender: TObject);
begin
if ColorDialog.Execute
 then begin
  Updater.Disable;
  try
  TOrientedTTFVisualizationFunctionality(ObjFunctionality).Color:=ColorDialog.Color;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  lbColor.Color:=ColorDialog.Color;
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.updownCharIntervalClick(
  Sender: TObject; Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then CharInterval:=CharInterval+(CharIntervalIncrement/ReflectionWindow.Scale)
 else CharInterval:=CharInterval-(CharIntervalIncrement/ReflectionWindow.Scale);
edCharInterval.Text:=FloatToStr(CharInterval);
end;
end;

procedure TOrientedTTFVisualizationPanelProps.updownCharIntervalMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
Updater.Disable;
try
TOrientedTTFVisualizationFunctionality(ObjFunctionality).CharInterval:=CharInterval;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.cbOrientationChange(Sender: TObject);
begin
case cbOrientation.ItemIndex of
0: begin
  Updater.Disable;
  try
  TOrientedTTFVisualizationFunctionality(ObjFunctionality).Orientation:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
1: begin
  Updater.Disable;
  try
  TOrientedTTFVisualizationFunctionality(ObjFunctionality).Orientation:=-90;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TOrientedTTFVisualizationPanelProps.EditTextKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TOrientedTTFVisualizationFunctionality(ObjFunctionality).Str:=EditText.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TOrientedTTFVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TOrientedTTFVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TOrientedTTFVisualizationPanelProps.Controls_ClearPropData;
begin
EditFont_Height.Text:='';
EditFont_Width.Text:='';
EditText.Text:='';
EditFont_Name.Text:='';
edCharInterval.Text:='';
cbOrientation.ItemIndex:=-1;
end;


end.
