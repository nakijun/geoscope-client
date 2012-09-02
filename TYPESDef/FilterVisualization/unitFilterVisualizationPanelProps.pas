unit unitFilterVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, GlobalSpaceDefines,
  ComCtrls;

type
  TFilterVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    cbType: TComboBox;
    pnlContrasting: TPanel;
    tbContrasting: TTrackBar;
    sbSetContrasting: TSpeedButton;
    pnlColorScaling: TPanel;
    sbSetColorScaling: TSpeedButton;
    tbColorScaling: TTrackBar;
    Label1: TLabel;
    pnlColorMixing: TPanel;
    sbSetColorMixing: TSpeedButton;
    tbColorMixing: TTrackBar;
    pnlFastContrasting: TPanel;
    Label2: TLabel;
    sbSetFastContrasting: TSpeedButton;
    tbFastContrasting: TTrackBar;
    pnlFastColorMixing: TPanel;
    sbSetFastColorMixing: TSpeedButton;
    tbFastColorMixingColorValue: TTrackBar;
    tbFastColorMixingImageValue: TTrackBar;
    Label3: TLabel;
    Label4: TLabel;
    pnlSimpleColorMixing: TPanel;
    sbSetSimpleColorMixing: TSpeedButton;
    tbSimpleColorMixingColorValue: TTrackBar;
    Label5: TLabel;
    Label6: TLabel;
    edSimpleColorMixingMask: TEdit;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure sbSetContrastingClick(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure sbSetColorScalingClick(Sender: TObject);
    procedure sbSetColorMixingClick(Sender: TObject);
    procedure sbSetFastContrastingClick(Sender: TObject);
    procedure sbSetFastColorMixingClick(Sender: TObject);
    procedure sbSetSimpleColorMixingClick(Sender: TObject);
  private
    { Private declarations }
    FilterType: TFilterVisualizationType;

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

Constructor TFilterVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TFilterVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TFilterVisualizationPanelProps._Update;
var
  T: TFilterVisualizationType;
  FT: integer;
  BA: TByteArray;
  ContrastingValue: ShortInt;
  ColorScalingValue: byte;
  ColorMixingValue: byte;
  ImageMixingValue: byte;
  MixingMask: byte;
begin
Inherited;
//.
cbType.Items.Clear;
for T:=Low(TFilterVisualizationType) to High(TFilterVisualizationType) do cbType.Items.Add(FilterVisualizationTypeStrings[T]);
//.
TFilterVisualizationFunctionality(ObjFunctionality).GetParams(FT,BA);
FilterType:=TFilterVisualizationType(FT);
cbType.ItemIndex:=Integer(FilterType);
//.
pnlContrasting.Hide;
pnlFastContrasting.Hide;
pnlColorScaling.Hide;
pnlColorMixing.Hide;
pnlFastColorMixing.Hide;
pnlSimpleColorMixing.Hide;
case FilterType of
ftContrasting: begin
  if (Length(BA) = 1)
   then begin
    ContrastingValue:=ShortInt(Pointer(@BA[0])^);
    tbContrasting.Position:=ContrastingValue+(tbContrasting.Max DIV 2);
    end
   else tbContrasting.Position:=(tbContrasting.Max DIV 2);
  pnlContrasting.Show;
  end;
ftFastContrasting: begin
  if (Length(BA) = 1)
   then begin
    ContrastingValue:=ShortInt(Pointer(@BA[0])^);
    tbFastContrasting.Position:=ContrastingValue+(tbFastContrasting.Max DIV 2);
    end
   else tbFastContrasting.Position:=(tbContrasting.Max DIV 2);
  pnlFastContrasting.Show;
  end;
ftColorScaling: begin
  if (Length(BA) = 1)
   then begin
    ColorScalingValue:=ShortInt(Pointer(@BA[0])^);
    tbColorScaling.Position:=ColorScalingValue;
    end
   else tbColorScaling.Position:=0;
  pnlColorScaling.Show;
  end;
ftColorMixing: begin
  if (Length(BA) = 1)
   then begin
    ColorMixingValue:=Byte(Pointer(@BA[0])^);
    tbColorMixing.Position:=ColorMixingValue;
    end
   else tbColorMixing.Position:=0;
  pnlColorMixing.Show;
  end;
ftFastColorMixing: begin
  if (Length(BA) = 2)
   then begin
    ColorMixingValue:=Byte(Pointer(@BA[0])^);
    ImageMixingValue:=Byte(Pointer(@BA[1])^);
    tbFastColorMixingColorValue.Position:=ColorMixingValue;
    tbFastColorMixingImageValue.Position:=tbFastColorMixingImageValue.Max-ImageMixingValue;
    end
   else begin
    tbFastColorMixingColorValue.Position:=0;
    tbFastColorMixingImageValue.Position:=0;
    end;
  pnlFastColorMixing.Show;
  end;
ftSimpleColorMixing: begin
  if (Length(BA) = 2)
   then begin
    ColorMixingValue:=Byte(Pointer(@BA[0])^);
    MixingMask:=Byte(Pointer(@BA[1])^);
    tbSimpleColorMixingColorValue.Position:=ColorMixingValue;
    edSimpleColorMixingMask.Text:=IntToStr(MixingMask);
    end
   else begin
    tbSimpleColorMixingColorValue.Position:=0;
    edSimpleColorMixingMask.Text:='';
    end;
  pnlSimpleColorMixing.Show;
  end;
end;
end;

procedure TFilterVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TFilterVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TFilterVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TFilterVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TFilterVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TFilterVisualizationPanelProps.sbSetContrastingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,1);
Byte(Pointer(@BA[0])^):=tbContrasting.Position-(tbContrasting.Max DIV 2);
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TFilterVisualizationPanelProps.cbTypeChange(Sender: TObject);
var
  BA: TByteArray;
begin
if (FilterType = TFilterVisualizationType(cbType.ItemIndex)) then Exit; //. ->
SetLength(BA,0);
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(cbType.ItemIndex,BA);
end;

procedure TFilterVisualizationPanelProps.sbSetColorScalingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,1);
Byte(Pointer(@BA[0])^):=tbColorScaling.Position;
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TFilterVisualizationPanelProps.sbSetColorMixingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,1);
Byte(Pointer(@BA[0])^):=tbColorMixing.Position;
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;


procedure TFilterVisualizationPanelProps.sbSetFastContrastingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,1);
Byte(Pointer(@BA[0])^):=tbFastContrasting.Position-(tbFastContrasting.Max DIV 2);
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TFilterVisualizationPanelProps.sbSetFastColorMixingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,2);
Byte(Pointer(@BA[0])^):=tbFastColorMixingColorValue.Position;
Byte(Pointer(@BA[1])^):=tbFastColorMixingImageValue.Max-tbFastColorMixingImageValue.Position;
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;


procedure TFilterVisualizationPanelProps.sbSetSimpleColorMixingClick(Sender: TObject);
var
  BA: TByteArray;
begin
SetLength(BA,2);
Byte(Pointer(@BA[0])^):=tbSimpleColorMixingColorValue.Position;
Byte(Pointer(@BA[1])^):=StrToInt(edSimpleColorMixingMask.Text);
Updater.Disable;
try
TFilterVisualizationFunctionality(ObjFunctionality).SetParams(Integer(FilterType),BA);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TFilterVisualizationPanelProps.Controls_ClearPropData;
begin
edSimpleColorMixingMask.Text:='';
end;


end.
