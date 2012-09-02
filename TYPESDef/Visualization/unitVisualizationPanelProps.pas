unit UnitVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, GlobalSpaceDefines;

type
  TVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
Uses
  Math;
  
{$R *.DFM}

Constructor TVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if Width < 49 then Width:=49; //. cannot squeeze form.width less than 112 at design time
if flReadOnly then DisableControls;
Update;
end;

destructor TVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TVisualizationPanelProps._Update;
begin
Inherited;
end;

procedure TVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TVisualizationPanelProps.SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight
 then begin
  {with TBaseVisualizationFunctionality(ObjFunctionality) do begin
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
  end;}
  end;
end;

procedure TVisualizationPanelProps.Controls_ClearPropData;
begin
end;

end.
