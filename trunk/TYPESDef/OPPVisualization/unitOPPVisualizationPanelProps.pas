unit unitOPPVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, GlobalSpaceDefines,
  Menus;

type
  TOPPVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    sbPropsPanel: TSpeedButton;
    sbPropsPanel_Popup: TPopupMenu;
    Setpropspanelfromclipboard1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Setpropspanelfromclipboard1Click(Sender: TObject);
    procedure sbPropsPanelClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
{$R *.DFM}

Constructor TOPPVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if Width < 49 then Width:=49; //. cannot squeeze form.width less than 112 at design time
if flReadOnly then DisableControls;
Update;
end;

destructor TOPPVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TOPPVisualizationPanelProps._Update;
begin
Inherited;
end;

procedure TOPPVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TOPPVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TOPPVisualizationPanelProps.SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
var
  Obj: TSpaceObj;
  Point: TPoint;
  Lat,Long: Double;
  _X,_Y: Double;
begin
if Button = mbRight
 then begin
  with TBaseVisualizationFunctionality(ObjFunctionality) do begin
  Space.ReadObj(Obj,SizeOf(Obj), Ptr);
  if Obj.ptrFirstPoint = nilPtr then Raise Exception.Create('could not get fasten point'); //. =>
  Space.ReadObj(Point,SizeOf(Point), Obj.ptrFirstPoint);
  end;
  with TTGeodesyPointFunctionality.Create do
  try
  if ConvertSpaceCRDToGeoCRD(Point.X,Point.Y, Lat,Long)
   then begin
    ShowMessage('Latitude = '+IntToStr(Trunc(Lat))+'.'+IntToStr(Trunc(60*Frac(Lat)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Lat))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Lat))))+
            ' ;  Longitude = '+IntToStr(Trunc(Long))+'.'+IntToStr(Trunc(60*Frac(Long)))+''''+IntToStr(Trunc(60*Frac(60*Frac(Long))))+''''''+FormatFloat('.0000000',Frac(60*Frac(60*Frac(Long)))));
    end
   else
    ShowMessage('could not get geo coordinates');
  finally
  Release;
  end;
  end;
end;

procedure TOPPVisualizationPanelProps.Controls_ClearPropData;
begin
end;

procedure TOPPVisualizationPanelProps.Setpropspanelfromclipboard1Click(Sender: TObject);
begin
if NOT TypesSystem.ClipBoard_flExist then Raise Exception.Create('clipboard is empty'); //. =>
TOPPVisualizationFunctionality(ObjFunctionality).PropsPanel_idTObj:=TypesSystem.Clipboard_Instance_idTObj;
TOPPVisualizationFunctionality(ObjFunctionality).PropsPanel_idObj:=TypesSystem.Clipboard_Instance_idObj;
end;

procedure TOPPVisualizationPanelProps.sbPropsPanelClick(Sender: TObject);
var
  idTObj,idObj: integer;
begin
idObj:=TOPPVisualizationFunctionality(ObjFunctionality).PropsPanel_idObj;
if idObj = 0 then Raise Exception.Create('props panel is not set'); //. =>
idTObj:=TOPPVisualizationFunctionality(ObjFunctionality).PropsPanel_idTObj;
with TComponentFunctionality_Create(idTObj,idObj) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show;
end;
finally
Release;
end;
end;

end.
