unit unitMRKVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines;

type
  TMRKVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    sbLoad: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    gbBinding: TGroupBox;
    cbBindingPointAtCenter: TCheckBox;
    updownBingdingPointIndex: TUpDown;
    lbBindingPointIndex: TLabel;
    stBindingPointIndex: TStaticText;
    Label2: TLabel;
    cbAlign: TComboBox;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
    procedure cbAlignChange(Sender: TObject);
    procedure cbBindingPointAtCenterClick(Sender: TObject);
    procedure updownBingdingPointIndexClick(Sender: TObject;
      Button: TUDBtnType);
  private
    { Private declarations }
    flUpdating: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TMRKVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flUpdating:=false;
Update;
end;

destructor TMRKVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TMRKVisualizationPanelProps._Update;
var
  A: TMRKVisualizationAlign;
  I: TMRKVisualizationAlign;
  II,SII: integer;
  BPI: integer;
begin
Inherited;
//.
flUpdating:=true;
try
with TMRKVisualizationFunctionality(ObjFunctionality) do begin
//. align
A:=Align;
cbAlign.Items.BeginUpdate;
try
cbAlign.Clear;
for I:=Low(TMRKVisualizationAlign) to High(TMRKVisualizationAlign) do begin
  II:=cbAlign.Items.AddObject(TMRKVisualizationAlignStrings[TMRKVisualizationAlign(I)],TObject(I));
  if I = A then SII:=II;
  end;
cbAlign.ItemIndex:=SII;
cbAlign.DropDownCount:=cbAlign.Items.Count;
finally
cbAlign.Items.EndUpdate;
end;
//. binding point
BPI:=BindingPointIndex;
if BPI <> -1
 then begin
  cbBindingPointAtCenter.Checked:=false;
  lbBindingPointIndex.Enabled:=true;
  stBindingPointIndex.Caption:=IntToStr(BPI);
  stBindingPointIndex.Enabled:=true;
  updownBingdingPointIndex.Enabled:=true;
  end
 else begin
  cbBindingPointAtCenter.Checked:=true;
  lbBindingPointIndex.Enabled:=false;
  stBindingPointIndex.Caption:='';
  stBindingPointIndex.Enabled:=false;
  updownBingdingPointIndex.Enabled:=false;
  end;
//.
end;
finally
flUpdating:=false;
end;
end;

procedure TMRKVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TMRKVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TMRKVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TMRKVisualizationPanelProps.LoadFromFile;
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
 then with TMRKVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TMRKVisualizationPanelProps.sbLoadClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TMRKVisualizationPanelProps.cbAlignChange(Sender: TObject);
begin
Updater.Disable;
try
TMRKVisualizationFunctionality(ObjFunctionality).Align:=TMRKVisualizationAlign(cbAlign.Items.Objects[cbAlign.ItemIndex]);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TMRKVisualizationPanelProps.cbBindingPointAtCenterClick(Sender: TObject);
begin
if flUpdating then Exit; //. ->
if cbBindingPointAtCenter.Checked
 then begin
  //.
  Updater.Disable;
  try
  TMRKVisualizationFunctionality(ObjFunctionality).BindingPointIndex:=-1;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  //.
  lbBindingPointIndex.Enabled:=false;
  stBindingPointIndex.Caption:='';
  stBindingPointIndex.Enabled:=false;
  updownBingdingPointIndex.Enabled:=false;
  end
 else begin
  //.
  Updater.Disable;
  try
  TMRKVisualizationFunctionality(ObjFunctionality).BindingPointIndex:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  //.
  lbBindingPointIndex.Enabled:=true;
  stBindingPointIndex.Caption:=IntToStr(0);
  stBindingPointIndex.Enabled:=true;
  updownBingdingPointIndex.Enabled:=true;
  end;
end;

procedure TMRKVisualizationPanelProps.updownBingdingPointIndexClick(Sender: TObject; Button: TUDBtnType);
var
  BPI: integer;
begin
BPI:=TMRKVisualizationFunctionality(ObjFunctionality).BindingPointIndex;
if Button = btNext
 then
  Inc(BPI)
 else begin
  if BPI = 0 then Exit; //. ->
  Dec(BPI);
  end;
//.
Updater.Disable;
try
TMRKVisualizationFunctionality(ObjFunctionality).BindingPointIndex:=BPI;
except
  Updater.Enabled;
  Raise; //.=>
  end;
//.
stBindingPointIndex.Caption:=IntToStr(BPI);
end;

procedure TMRKVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMRKVisualizationPanelProps.Controls_ClearPropData;
begin
cbAlign.ItemIndex:=-1;
stBindingPointIndex.Caption:='';
end;




end.
