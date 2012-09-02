unit unitBuffered3DVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, ShellAPI, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unit3DReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TBuffered3DVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    sbImport: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    Image: TImage;
    sbShowAtCenter: TSpeedButton;
    ObjectControlPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ObjectControlPanel_ScaleControl: TPanel;
    ObjectControlPanel_TranslateXControl: TPanel;
    ObjectControlPanel_TranslateYControl: TPanel;
    ObjectControlPanel_TranslateZControl: TPanel;
    ObjectControlPanel_RotateAngleXControl: TPanel;
    ObjectControlPanel_RotateAngleYControl: TPanel;
    ObjectControlPanel_RotateAngleZControl: TPanel;
    ObjectControlPanel_UpdaterValues: TBitBtn;
    ObjectControlPanel_ScaleIncrementer: TBitBtn;
    ObjectControlPanel_ScaleDecrementer: TBitBtn;
    ObjectControlPanel_ScaleReseter: TBitBtn;
    ObjectControlPanel_TranslateXIncrementer: TBitBtn;
    ObjectControlPanel_TranslateXDecrementer: TBitBtn;
    ObjectControlPanel_TranslateYDecrementer: TBitBtn;
    ObjectControlPanel_TranslateYIncrementer: TBitBtn;
    ObjectControlPanel_TranslateZIncrementer: TBitBtn;
    ObjectControlPanel_TranslateZDecrementer: TBitBtn;
    ObjectControlPanel_RotateAngleXIncrementer: TBitBtn;
    ObjectControlPanel_RotateAngleZIncrementer: TBitBtn;
    ObjectControlPanel_RotateAngleYIncrementer: TBitBtn;
    ObjectControlPanel_RotateAngleXDecrementer: TBitBtn;
    ObjectControlPanel_RotateAngleZDecrementer: TBitBtn;
    ObjectControlPanel_RotateAngleYDecrementer: TBitBtn;
    ObjectControlPanel_TranslateXReseter: TBitBtn;
    ObjectControlPanel_TranslateYReseter: TBitBtn;
    ObjectControlPanel_TranslateZReseter: TBitBtn;
    ObjectControlPanel_RotateAngleXReseter: TBitBtn;
    ObjectControlPanel_RotateAngleYReseter: TBitBtn;
    ObjectControlPanel_RotateAngleZReseter: TBitBtn;
    procedure sbImportClick(Sender: TObject);
    procedure sbShowAtCenterClick(Sender: TObject);
    procedure ObjectControlPanel_ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectControlPanel_ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ObjectControlPanel_ControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ObjectControlPanel_ScaleIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_ScaleDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_ScaleReseterClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateXIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateXDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateXReseterClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateYIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateYDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateYReseterClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateZIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateZDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_TranslateZReseterClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleXIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleXDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleXReseterClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleYIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleYDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleYReseterClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleZIncrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleZDecrementerClick(Sender: TObject);
    procedure ObjectControlPanel_RotateAngleZReseterClick(Sender: TObject);
    procedure ObjectControlPanel_UpdaterValuesClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    ObjectControlPanel_ScaleValue: Extended;
    ObjectControlPanel_TranslateXValue: Extended;
    ObjectControlPanel_TranslateYValue: Extended;
    ObjectControlPanel_TranslateZValue: Extended;
    ObjectControlPanel_RotateAngleXValue: Extended;
    ObjectControlPanel_RotateAngleYValue: Extended;
    ObjectControlPanel_RotateAngleZValue: Extended;
    ObjectControlPanel_OldMousePositionY: integer;
    ObjectControlPanel_flDATAChanged: boolean;

    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure LoadFromFile;
    procedure ObjectControlPanel_ShowValues;
    procedure ObjectControlPanel_ChangeValues(const Delta: Extended; const dScale, dTranslate_X,dTranslate_Y,dTranslate_Z, dRotate_AngleX,dRotate_AngleY,dRotate_AngleZ: integer);
    procedure ObjectControlPanel_SetNewValues(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended);
    procedure ObjectControlPanel_UpdateValues;
  end;

implementation
Uses
  OpenGL,
  unitOpenGL3DSpace;

{$R *.DFM}

Constructor TBuffered3DVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
ObjectControlPanel_OldMousePositionY:=-1;
ObjectControlPanel_flDATAChanged:=false;
Update;
end;

destructor TBuffered3DVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TBuffered3DVisualizationPanelProps._Update;
begin
Inherited;
with TBuffered3DVisualizationFunctionality(ObjFunctionality) do begin
Update;
ObjectControlPanel_ScaleValue:=Scale;
ObjectControlPanel_TranslateXValue:=Translate_X;
ObjectControlPanel_TranslateYValue:=Translate_Y;
ObjectControlPanel_TranslateZValue:=Translate_Z;
ObjectControlPanel_RotateAngleXValue:=Rotate_AngleX;
ObjectControlPanel_RotateAngleYValue:=Rotate_AngleY;
ObjectControlPanel_RotateAngleZValue:=Rotate_AngleZ;
end;
ObjectControlPanel_ShowValues;
end;

procedure TBuffered3DVisualizationPanelProps.LoadFromFile;
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
 then with TBuffered3DVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing object ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TBuffered3DVisualizationPanelProps.sbImportClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TBuffered3DVisualizationPanelProps.sbShowAtCenterClick(Sender: TObject);
begin
TBaseVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ShowValues;
begin
ObjectControlPanel_ScaleControl.Caption:=FormatFloat('0.000',ObjectControlPanel_ScaleValue);
ObjectControlPanel_TranslateXControl.Caption:=FormatFloat('0.000',ObjectControlPanel_TranslateXValue);
ObjectControlPanel_TranslateYControl.Caption:=FormatFloat('0.000',ObjectControlPanel_TranslateYValue);
ObjectControlPanel_TranslateZControl.Caption:=FormatFloat('0.000',ObjectControlPanel_TranslateZValue);
ObjectControlPanel_RotateAngleXControl.Caption:=FormatFloat('0.000',ObjectControlPanel_RotateAngleXValue);
ObjectControlPanel_RotateAngleYControl.Caption:=FormatFloat('0.000',ObjectControlPanel_RotateAngleYValue);
ObjectControlPanel_RotateAngleZControl.Caption:=FormatFloat('0.000',ObjectControlPanel_RotateAngleZValue);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_SetNewValues(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended);
begin
//. update local cash data
TBuffered3DVisualizationFunctionality(ObjFunctionality).SetPropertiesLocal(pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
//. RecalcReflect
with TBuffered3DVisualizationFunctionality(ObjFunctionality) do if ObjectIsInheritedFrom(Reflector,TGL3DReflector) then TGL3DReflector(Reflector).Reflecting.Scene.RecompileReflect;
//.
ObjectControlPanel_flDATAChanged:=true;
ObjectControlPanel_UpdaterValues.Enabled:=true;
Update;
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_UpdateValues;
begin
//. update global data
Updater.Disable;
ObjFunctionality.DoOnComponentUpdate;
//.
ObjectControlPanel_flDATAChanged:=false;
ObjectControlPanel_UpdaterValues.Enabled:=false;
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ChangeValues(const Delta: Extended; const dScale, dTranslate_X,dTranslate_Y,dTranslate_Z, dRotate_AngleX,dRotate_AngleY,dRotate_AngleZ: integer);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue+Delta*dScale,
  ObjectControlPanel_TranslateXValue+Delta*dTranslate_X,
  ObjectControlPanel_TranslateYValue+Delta*dTranslate_Y,
  ObjectControlPanel_TranslateZValue+Delta*dTranslate_Z,
  ObjectControlPanel_RotateAngleXValue+Delta*dRotate_AngleX,
  ObjectControlPanel_RotateAngleYValue+Delta*dRotate_AngleY,
  ObjectControlPanel_RotateAngleZValue+Delta*dRotate_AngleZ
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbLeft
 then with Sender as TPanel do begin
  ObjectControlPanel_OldMousePositionY:=Y;
  Color:=TColor($00408000);
  end;
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  d: integer;
begin
if ObjectControlPanel_OldMousePositionY = -1 then Exit; //. ->
d:=-(Y-ObjectControlPanel_OldMousePositionY);
with Sender as TPanel do
case Tag of
1: begin //. Scale control
  ObjectControlPanel_ChangeValues(0.01, d, 0,0,0,0,0,0);
  end;
2: begin //. Translate_X control
  ObjectControlPanel_ChangeValues(100, 0, d,0,0,0,0,0);
  end;
3: begin //. Translate_Y control
  ObjectControlPanel_ChangeValues(100, 0, 0,d,0,0,0,0);
  end;
4: begin //. Translate_Z control
  ObjectControlPanel_ChangeValues(100, 0, 0,0,d,0,0,0);
  end;
5: begin //. Rotate_AngleX control
  ObjectControlPanel_ChangeValues(1, 0, 0,0,0,d,0,0);
  end;
6: begin //. Rotate_AngleY control
  ObjectControlPanel_ChangeValues(1, 0, 0,0,0,0,d,0);
  end;
7: begin //. Rotate_AngleZ control
  ObjectControlPanel_ChangeValues(1, 0, 0,0,0,0,0,d);
  end;
end;
ObjectControlPanel_OldMousePositionY:=Y;
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ControlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
with Sender as TPanel do begin
Color:=TColor($00808040);
ObjectControlPanel_OldMousePositionY:=-1;
end;
end;


procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ScaleIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.01, 1, 0,0,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ScaleDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.01, -1, 0,0,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_ScaleReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  1,
  ObjectControlPanel_TranslateXValue,
  ObjectControlPanel_TranslateYValue,
  ObjectControlPanel_TranslateZValue,
  ObjectControlPanel_RotateAngleXValue,
  ObjectControlPanel_RotateAngleYValue,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateXIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, 1,0,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateXDecrementerClick(
  Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, -1,0,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateXReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  0,
  ObjectControlPanel_TranslateYValue,
  ObjectControlPanel_TranslateZValue,
  ObjectControlPanel_RotateAngleXValue,
  ObjectControlPanel_RotateAngleYValue,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateYIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, 0,1,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateYDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, 0,-1,0,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateYReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  ObjectControlPanel_TranslateXValue,
  0,
  ObjectControlPanel_TranslateZValue,
  ObjectControlPanel_RotateAngleXValue,
  ObjectControlPanel_RotateAngleYValue,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateZIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, 0,0,1,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateZDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(1, 0, 0,0,-1,0,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_TranslateZReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  ObjectControlPanel_TranslateXValue,
  ObjectControlPanel_TranslateYValue,
  0,
  ObjectControlPanel_RotateAngleXValue,
  ObjectControlPanel_RotateAngleYValue,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleXIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,1,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleXDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,-1,0,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleXReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  ObjectControlPanel_TranslateXValue,
  ObjectControlPanel_TranslateYValue,
  ObjectControlPanel_TranslateZValue,
  0,
  ObjectControlPanel_RotateAngleYValue,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleYIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,0,1,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleYDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,0,-1,0);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleYReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  ObjectControlPanel_TranslateXValue,
  ObjectControlPanel_TranslateYValue,
  ObjectControlPanel_TranslateZValue,
  ObjectControlPanel_RotateAngleXValue,
  0,
  ObjectControlPanel_RotateAngleZValue
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleZIncrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,0,0,1);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleZDecrementerClick(Sender: TObject);
begin
ObjectControlPanel_ChangeValues(0.1, 0, 0,0,0,0,0,-1);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_RotateAngleZReseterClick(Sender: TObject);
begin
ObjectControlPanel_SetNewValues(
  ObjectControlPanel_ScaleValue,
  ObjectControlPanel_TranslateXValue,
  ObjectControlPanel_TranslateYValue,
  ObjectControlPanel_TranslateZValue,
  ObjectControlPanel_RotateAngleXValue,
  ObjectControlPanel_RotateAngleYValue,
  0
);
end;

procedure TBuffered3DVisualizationPanelProps.ObjectControlPanel_UpdaterValuesClick(Sender: TObject);
begin
ObjectControlPanel_UpdateValues;
end;

procedure TBuffered3DVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TBuffered3DVisualizationPanelProps.Controls_ClearPropData;
begin
end;

end.
