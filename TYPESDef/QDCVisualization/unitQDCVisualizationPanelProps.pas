unit unitQDCVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, GlobalSpaceDefines,
  ExtDlgs, Menus;

type
  TQDCVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenPictureDialog: TOpenPictureDialog;
    PopupMenu: TPopupMenu;
    Loadfrombitmapfile1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Loadfrombitmapfile1Click(Sender: TObject);
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

Constructor TQDCVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if Width < 49 then Width:=49; //. cannot squeeze form.width less than 112 at design time
if flReadOnly then DisableControls;
Update;
end;

destructor TQDCVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TQDCVisualizationPanelProps._Update;
begin
Inherited;
end;

procedure TQDCVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TQDCVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TQDCVisualizationPanelProps.SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight then Beep;
end;

procedure TQDCVisualizationPanelProps.Loadfrombitmapfile1Click(Sender: TObject);
var
  Bitmap: TBitmap;
  CD: string;
begin
CD:=GetCurrentDir;
try
if OpenPictureDialog.Execute
 then begin
  Bitmap:=TBitmap.Create;
  try
  Bitmap.LoadFromFile(OpenPictureDialog.FileName);
  TQDCVisualizationFunctionality(ObjFunctionality).LoadFromBitmap(Bitmap);
  finally
  Bitmap.Destroy;
  end;
  end;
finally
SetCurrentDir(CD);
end;
end;

procedure TQDCVisualizationPanelProps.Controls_ClearPropData;
begin
end;

end.
