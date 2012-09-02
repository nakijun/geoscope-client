unit unitMonitorConfiguration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, unitMonitor, Grids, ExtCtrls;

type
  TfmMonitorConfiguration = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edBackGroundColorDelta: TEdit;
    lbBackGroundColor: TLabel;
    sbChangeBackGroundColor: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    sbChangeMeshColor: TSpeedButton;
    lbMesh_Color: TLabel;
    Label5: TLabel;
    edMesh_StepX: TEdit;
    Label6: TLabel;
    edMesh_StepY: TEdit;
    Label4: TLabel;
    lbSignalDefaultColor: TLabel;
    sbChangeSignalDefaultColor: TSpeedButton;
    Label7: TLabel;
    edRowPerChanel: TEdit;
    Label8: TLabel;
    lbChanelIsolineColor: TLabel;
    sbChangeChanelIsolineColor: TSpeedButton;
    Label10: TLabel;
    edXSqueezeCoef: TEdit;
    Label11: TLabel;
    edYSqueezeCoef: TEdit;
    cbChanelsGroupped: TCheckBox;
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    ColorDialog: TColorDialog;
    GroupBox4: TGroupBox;
    edSignalsColorsCount: TEdit;
    Label9: TLabel;
    sgSignalsColors: TStringGrid;
    Label12: TLabel;
    Bevel1: TBevel;
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure sbChangeBackGroundColorClick(Sender: TObject);
    procedure sbChangeMeshColorClick(Sender: TObject);
    procedure sbChangeSignalDefaultColorClick(Sender: TObject);
    procedure sbChangeChanelIsolineColorClick(Sender: TObject);
    procedure edSignalsColorsCountKeyPress(Sender: TObject; var Key: Char);
    procedure sgSignalsColorsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgSignalsColorsDblClick(Sender: TObject);
  private
    { Private declarations }
    Monitor: TChanelsMonitor;

    function SelectColor(var Color: TColor): boolean;

    procedure sgSignalsColors_Update;
    procedure sgSignalsColors_Set(const Count: integer);
  public
    { Public declarations }
    Constructor Create(pMonitor: TChanelsMonitor);
    procedure Update;
    procedure Save;
  end;


implementation

{$R *.dfm}


Constructor TfmMonitorConfiguration.Create(pMonitor: TChanelsMonitor);
begin
Inherited Create(nil);
Monitor:=pMonitor;
Update;
end;

procedure TfmMonitorConfiguration.Update;
begin
with Monitor do begin
lbBackGroundColor.Color:=BackgroundColor;
edBackGroundColorDelta.Text:=IntToStr(BackgroundColorDelta);
lbMesh_Color.Color:=Mesh_Color;
edMesh_StepX.Text:=IntToStr(Mesh_StepX);
edMesh_StepY.Text:=IntToStr(Mesh_StepY);
lbSignalDefaultColor.Color:=SignalDefaultColor;
lbChanelIsolineColor.Color:=ChanelDrawIsoLineColor;
edRowPerChanel.Text:=IntToStr(RowPerChanel);
cbChanelsGroupped.Checked:=flChanelsGroupped;
edXSqueezeCoef.Text:=IntToStr(XSqueezeCoef);
edYSqueezeCoef.Text:=FloatToStr(YSqueezeCoef);
end;
sgSignalsColors_Update;
end;

procedure TfmMonitorConfiguration.Save;
var
  I: integer;
begin
with Monitor do begin
BackgroundColor:=lbBackGroundColor.Color;
try
BackgroundColorDelta:=StrToInt(edBackGroundColorDelta.Text);
except
  Raise Exception.Create(''); //. =>
  end;
Mesh_Color:=lbMesh_Color.Color;
try
Mesh_StepX:=StrToInt(edMesh_StepX.Text);
except
  Raise Exception.Create(''); //. =>
  end;
try
Mesh_StepY:=StrToInt(edMesh_StepY.Text);
except
  Raise Exception.Create(''); //. =>
  end;
SignalDefaultColor:=lbSignalDefaultColor.Color;
ChanelDrawIsoLineColor:=lbChanelIsolineColor.Color;
try
RowPerChanel:=StrToInt(edRowPerChanel.Text);
except
  Raise Exception.Create(''); //. =>
  end;
flChanelsGroupped:=cbChanelsGroupped.Checked;
try
XSqueezeCoef:=StrToInt(edXSqueezeCoef.Text);
except
  Raise Exception.Create(''); //. =>
  end;
try
YSqueezeCoef:=StrToFloat(edYSqueezeCoef.Text);
except
  Raise Exception.Create(''); //. =>
  end;
//. save signals colors
with sgSignalsColors do begin
SetLength(ChanelsColors,RowCount-1);
for I:=1 to RowCount-1 do ChanelsColors[I-1]:=TColor(Objects[0,I]);
end;
//.
SaveConfiguration;
ValidateConfiguration;
end;
end;

function TfmMonitorConfiguration.SelectColor(var Color: TColor): boolean;
begin
Result:=false;
ColorDialog.Color:=Color;
if ColorDialog.Execute
 then begin
  Color:=ColorDialog.Color;
  Result:=true;
  end;
end;

procedure TfmMonitorConfiguration.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmMonitorConfiguration.sbSaveClick(Sender: TObject);
begin
Save;
end;

procedure TfmMonitorConfiguration.sbChangeBackGroundColorClick(Sender: TObject);
var
  C: TColor;
begin
C:=lbBackGroundColor.Color;
if SelectColor(C) then lbBackGroundColor.Color:=C;
end;

procedure TfmMonitorConfiguration.sbChangeMeshColorClick(Sender: TObject);
var
  C: TColor;
begin
C:=lbMesh_Color.Color;
if SelectColor(C) then lbMesh_Color.Color:=C;
end;

procedure TfmMonitorConfiguration.sbChangeSignalDefaultColorClick(Sender: TObject);
var
  C: TColor;
begin
C:=lbSignalDefaultColor.Color;
if SelectColor(C) then lbSignalDefaultColor.Color:=C;
end;

procedure TfmMonitorConfiguration.sbChangeChanelIsolineColorClick(Sender: TObject);
var
  C: TColor;
begin
C:=lbChanelIsolineColor.Color;
if SelectColor(C) then lbChanelIsolineColor.Color:=C;
end;

procedure TfmMonitorConfiguration.sgSignalsColors_Update;
var
  I: integer;
begin
with sgSignalsColors,Monitor do begin
edSignalsColorsCount.Text:=IntToStr(Length(ChanelsColors));
if Length(ChanelsColors) > 0
 then begin
  RowCount:=Length(ChanelsColors)+1;
  FixedRows:=1;
  Cells[0,0]:='signal color';
  for I:=0 to Length(ChanelsColors)-1 do Objects[0,I+1]:=TObject(ChanelsColors[I]);
  Show;
  RePaint;
  end
 else begin
  Hide;
  end;
end;
end;

procedure TfmMonitorConfiguration.sgSignalsColors_Set(const Count: integer);
begin
with sgSignalsColors do begin
RowCount:=Count+1;
if Count > 0
 then begin
  FixedRows:=1;
  Cells[0,0]:='signal color';
  Show;
  Repaint;
  end
 else begin
  Hide;
  end;
end;
end;

procedure TfmMonitorConfiguration.edSignalsColorsCountKeyPress(Sender: TObject; var Key: Char);
var
  NewSignalsColorsCount: integer;
begin
if Key = #$0D
 then begin
  try
  NewSignalsColorsCount:=StrToInt(edSignalsColorsCount.Text);
  if NewSignalsColorsCount < 0 then Raise Exception.Create(''); //. =>
  except
    Raise Exception.Create(''); //. =>
    end;
  sgSignalsColors_Set(NewSignalsColorsCount);
  end;
end;

procedure TfmMonitorConfiguration.sgSignalsColorsDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  BC: TColor;
begin
if ARow = 0
 then with sgSignalsColors,Canvas do begin
  Font.Style:=Font.Style+[fsBold];
  Font.Color:=clBlack;
  TextRect(Rect,Rect.Left+5,Rect.Top+2, Cells[ACol, ARow]);
  end
 else with sgSignalsColors,Canvas do begin
  case ACol of
  0: begin
    Rect.Left:=Rect.Left;
    BC:=Brush.Color;
    Brush.Color:=TColor(Objects[ACol,ARow]);
    Pen.Color:=clBlack;
    Rectangle(Rect);
    Brush.Color:=BC;
    Font.Style:=Font.Style+[fsBold];
    Font.Color:=clWhite;
    TextOut(Rect.Left+10,Rect.Top+4, IntToStr(ARow));
    Brush.Color:=BC;
    end;
  else begin
    Font.Style:=Font.Style;
    Font.Color:=clBlack;
    TextRect(Rect,Rect.Left+2,Rect.Top+2, Cells[ACol, ARow]);
    end;
  end;
end;
end;


procedure TfmMonitorConfiguration.sgSignalsColorsDblClick(Sender: TObject);
var
  C: TColor;
begin
with sgSignalsColors do begin
if Row = 0 then Exit; //. ->
if Col = 0
 then begin
  C:=TColor(Objects[Col,Row]);
  if NOT SelectColor(C) then Exit; //. ->
  Objects[Col,Row]:=TObject(C);
  Save;
  Repaint;
  end;
end;
end;

end.
