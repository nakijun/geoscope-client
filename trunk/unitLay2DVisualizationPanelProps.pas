unit unitLay2DVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, StdCtrls, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation, RXCtrls;

type
  TLay2DVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    edName: TEdit;
    Label1: TLabel;
    edLevel: TEdit;
    Label2: TLabel;
    edID: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edVisibleMinScale: TEdit;
    edVisibleMaxScale: TEdit;
    RxLabel1: TLabel;
    RxLabel2: TLabel;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edVisibleMinScaleKeyPress(Sender: TObject; var Key: Char);
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
Constructor TLay2DVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TLay2DVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TLay2DVisualizationPanelProps._Update;
var
  _Name: string;
  _Number: integer;
  _VisibleMinScale: Double;
  _VisibleMaxScale: Double;
begin
Inherited;
//.
edID.Text:=IntToStr(TLay2DVisualizationFunctionality(ObjFunctionality).idObj);
TLay2DVisualizationFunctionality(ObjFunctionality).GetParams({out} _Name,{out} _Number, {out} _VisibleMinScale,{out} _VisibleMaxScale);
edName.Text:=_Name;
edLevel.Text:=IntToStr(_Number);
if (_VisibleMinScale > 0) then edVisibleMinScale.Text:=FormatFloat('0.000',_VisibleMinScale) else edVisibleMinScale.Text:='none';
if (_VisibleMaxScale > 0) then edVisibleMaxScale.Text:=FormatFloat('0.000',_VisibleMaxScale) else edVisibleMaxScale.Text:='none';
end;

procedure TLay2DVisualizationPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable;
  try
  TLay2DVisualizationFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TLay2DVisualizationPanelProps.edVisibleMinScaleKeyPress(Sender: TObject; var Key: Char);
var
  _VisibleMinScale: Double;
  _VisibleMaxScale: Double;
begin
if (Key = #$0D)
 then begin
  if (ANSILowerCase(edVisibleMinScale.Text) <> 'none') then _VisibleMinScale:=StrToFloat(edVisibleMinScale.Text) else _VisibleMinScale:=0;
  if (ANSILowerCase(edVisibleMaxScale.Text) <> 'none') then _VisibleMaxScale:=StrToFloat(edVisibleMaxScale.Text) else _VisibleMaxScale:=0;
  Updater.Disable;
  try
  TLay2DVisualizationFunctionality(ObjFunctionality).SetParams(edName.Text,_VisibleMinScale,_VisibleMaxScale);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TLay2DVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TLay2DVisualizationPanelProps.Controls_ClearPropData;
begin
edID.Text:='';
edName.Text:='';
edLevel.Text:='';
edVisibleMinScale.Text:='';
edVisibleMaxScale.Text:='';
end;


end.
