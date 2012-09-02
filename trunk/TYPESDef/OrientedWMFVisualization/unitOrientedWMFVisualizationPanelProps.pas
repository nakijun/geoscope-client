unit unitOrientedWMFVisualizationPanelProps;

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
  TOrientedWMFVisualizationPanelProps = class(TSpaceObjPanelProps)
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
    sbEnterAsText: TSpeedButton;
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
    procedure sbEnterAsTextClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
    procedure EnterAsText;
  public
    { Public declarations }
    WMFWidth: Extended;
    WMFHeight: Extended;
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  unitRTFEditorWMFConverter;


{$R *.DFM}

Constructor TOrientedWMFVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOrientedWMFVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TOrientedWMFVisualizationPanelProps._Update;
begin
Inherited;
//.
with TOrientedWMFVisualizationFunctionality(ObjFunctionality) do begin
//.
WMFHeight:=Height;
edHeight.Text:=FloatToStr(WMFHeight);
//.
WMFWidth:=Width;
edWidth.Text:=FloatToStr(WMFWidth);
//.
if Orientation = 0
 then cbOrientation.ItemIndex:=0 //. horizontal
 else cbOrientation.ItemIndex:=1;
end;
end;

procedure TOrientedWMFVisualizationPanelProps.updownScalingClick(Sender: TObject; Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then begin
  /// - Updater.Disable;
  TOrientedWMFVisualizationFunctionality(ObjFunctionality).ChangeScale(ScaleFactor);
  end
 else begin
  /// - Updater.Disable;
  TOrientedWMFVisualizationFunctionality(ObjFunctionality).ChangeScale(1/ScaleFactor);
  end;
end;
end;

procedure TOrientedWMFVisualizationPanelProps.updownHeightClick(Sender: TObject; Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then WMFHeight:=WMFHeight+(HeightIncrement/ReflectionWindow.Scale)
 else WMFHeight:=WMFHeight-(HeightIncrement/ReflectionWindow.Scale);
edHeight.Text:=FloatToStr(WMFHeight);
end;
end;

procedure TOrientedWMFVisualizationPanelProps.updownWidthClick(Sender: TObject;
  Button: TUDBtnType);
begin
if ObjectIsInheritedFrom(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector,TReflector) then with TReflector(TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector) do begin
if Button = btNext
 then WMFWidth:=WMFWidth+(WidthIncrement/ReflectionWindow.Scale)
 else WMFWidth:=WMFWidth-(WidthIncrement/ReflectionWindow.Scale);
edWidth.Text:=FloatToStr(WMFWidth);
end;
end;

procedure TOrientedWMFVisualizationPanelProps.updownHeightMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedWMFVisualizationFunctionality(ObjFunctionality).Height:=WMFHeight;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedWMFVisualizationPanelProps.updownWidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
Updater.Disable;
try
TOrientedWMFVisualizationFunctionality(ObjFunctionality).Width:=WMFWidth;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TOrientedWMFVisualizationPanelProps.cbOrientationChange(Sender: TObject);
begin
case cbOrientation.ItemIndex of
0: begin
  Updater.Disable;
  try
  TOrientedWMFVisualizationFunctionality(ObjFunctionality).Orientation:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
1: begin
  Updater.Disable;
  try
  TOrientedWMFVisualizationFunctionality(ObjFunctionality).Orientation:=-90;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TOrientedWMFVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TOrientedWMFVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TOrientedWMFVisualizationPanelProps.LoadFromFile;
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
 then with TOrientedWMFVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TOrientedWMFVisualizationPanelProps.EnterAsText;
var
  WMF: TMemoryStream;
begin
with TfmRTFEditorWMFConverter.Create do
try
if (WorkAndSaveAsWMF(WMF))
 then
  try
  with TOrientedWMFVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  SetDATA(WMF,cftWMF);
  finally
  Space.Log.OperationDone;
  end;
  end;
  finally
  WMF.Destroy;
  end;
finally
Destroy;
end;
end;

procedure TOrientedWMFVisualizationPanelProps.sbLoadClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TOrientedWMFVisualizationPanelProps.sbEnterAsTextClick(Sender: TObject);
begin
EnterAsText;
end;

procedure TOrientedWMFVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOrientedWMFVisualizationPanelProps.Controls_ClearPropData;
begin
edHeight.Text:='';
edWidth.Text:='';
cbOrientation.ItemIndex:=-1;
end;



end.
