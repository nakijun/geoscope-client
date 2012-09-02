unit unitOrientedPictureVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines;

const
  HeightIncrement = 4;
  WidthIncrement = 4;
  ScaleFactor = 1.1;
type
  TOrientedPictureVisualizationPanelProps = class(TSpaceObjPanelProps)
    LabelFont_Height: TLabel;
    LabelFontWidth: TLabel;
    edHeight: TEdit;
    edWidth: TEdit;
    updownHeight: TUpDown;
    updownWidth: TUpDown;
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    Label1: TLabel;
    cbOrientation: TComboBox;
    sbLoad: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    Label3: TLabel;
    updownScaling: TUpDown;
    procedure updownHeightClick(Sender: TObject; Button: TUDBtnType);
    procedure updownWidthClick(Sender: TObject; Button: TUDBtnType);
    procedure updownHeightMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure updownWidthMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure cbOrientationChange(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
    procedure updownScalingClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
  public
    { Public declarations }
    PictureWidth: Extended;
    PictureHeight: Extended;
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TOrientedPictureVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOrientedPictureVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TOrientedPictureVisualizationPanelProps._Update;
begin
Inherited;
//.
with TOrientedPictureVisualizationFunctionality(ObjFunctionality) do begin
//.
PictureHeight:=Height;
edHeight.Text:=FloatToStr(PictureHeight);
//.
PictureWidth:=Width;
edWidth.Text:=FloatToStr(PictureWidth);
//.
if Orientation = 0
 then cbOrientation.ItemIndex:=0 //. horizontal
 else cbOrientation.ItemIndex:=1;
end;
end;

procedure TOrientedPictureVisualizationPanelProps.updownScalingClick(Sender: TObject; Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then begin
  /// - Updater.Disable;
  TOrientedPictureVisualizationFunctionality(ObjFunctionality).ChangeScale(ScaleFactor);
  end
 else begin
  /// - Updater.Disable;
  TOrientedPictureVisualizationFunctionality(ObjFunctionality).ChangeScale(1/ScaleFactor);
  end;
end;
end;

procedure TOrientedPictureVisualizationPanelProps.updownHeightClick(Sender: TObject; Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then PictureHeight:=PictureHeight+(HeightIncrement/ReflectionWindow.Scale)
 else PictureHeight:=PictureHeight-(HeightIncrement/ReflectionWindow.Scale);
edHeight.Text:=FloatToStr(PictureHeight);
end;
end;

procedure TOrientedPictureVisualizationPanelProps.updownWidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then PictureWidth:=PictureWidth+(WidthIncrement/ReflectionWindow.Scale)
 else PictureWidth:=PictureWidth-(WidthIncrement/ReflectionWindow.Scale);
edWidth.Text:=FloatToStr(PictureWidth);
end;
end;

procedure TOrientedPictureVisualizationPanelProps.updownHeightMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedPictureVisualizationFunctionality(ObjFunctionality).Height:=PictureHeight;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedPictureVisualizationPanelProps.updownWidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedPictureVisualizationFunctionality(ObjFunctionality).Width:=PictureWidth;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedPictureVisualizationPanelProps.cbOrientationChange(Sender: TObject);
begin
case cbOrientation.ItemIndex of
0: begin
  Updater.Disable;
  try
  TOrientedPictureVisualizationFunctionality(ObjFunctionality).Orientation:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
1: begin
  Updater.Disable;
  try
  TOrientedPictureVisualizationFunctionality(ObjFunctionality).Orientation:=-90;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TOrientedPictureVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TOrientedPictureVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TOrientedPictureVisualizationPanelProps.LoadFromFile;
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
 then with TOrientedPictureVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TOrientedPictureVisualizationPanelProps.sbLoadClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TOrientedPictureVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOrientedPictureVisualizationPanelProps.Controls_ClearPropData;
begin
edHeight.Text:='';
edWidth.Text:='';
cbOrientation.ItemIndex:=-1;
end;



end.
