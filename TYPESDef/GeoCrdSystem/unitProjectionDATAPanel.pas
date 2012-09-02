unit unitProjectionDATAPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TfmProjectionDATAPanel = class(TForm)
    gbTMProjection: TGroupBox;
    pnlUnknownProjection: TPanel;
    Label1: TLabel;
    edLatitudeOrigin: TEdit;
    Label2: TLabel;
    edCentralMeridian: TEdit;
    Label3: TLabel;
    edScaleFactor: TEdit;
    Label4: TLabel;
    edFalseEasting: TEdit;
    Label5: TLabel;
    edFalseNorthing: TEdit;
    sbSetTMProjectionDATA: TSpeedButton;
    gbLCCProjection: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    sbSetLCCProjectionDATA: TSpeedButton;
    LCC_edLatOfOrigin: TEdit;
    LCC_edLongOfOrigin: TEdit;
    LCC_edFirstStdParallel: TEdit;
    LCC_edFalseEasting: TEdit;
    LCC_edFalseNorthing: TEdit;
    LCC_edSecondStdParallel: TEdit;
    Label11: TLabel;
    gbEQCProjection: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    sbSetEQCProjectionDATA: TSpeedButton;
    Label17: TLabel;
    EQC_edLatOfOrigin: TEdit;
    EQC_edLongOfOrigin: TEdit;
    EQC_edFirstStdParallel: TEdit;
    EQC_edFalseEasting: TEdit;
    EQC_edFalseNorthing: TEdit;
    EQC_edSecondStdParallel: TEdit;
    gbMPProjection: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    sbSetMPProjectionDATA: TSpeedButton;
    MP_edLatOfOrigin: TEdit;
    MP_edLongOfOrigin: TEdit;
    procedure sbSetTMProjectionDATAClick(Sender: TObject);
    procedure sbSetLCCProjectionDATAClick(Sender: TObject);
    procedure sbSetEQCProjectionDATAClick(Sender: TObject);
    procedure sbSetMPProjectionDATAClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveTMProjectionDATA;
    procedure SaveLCCProjectionDATA;
    procedure SaveEQCProjectionDATA;
    procedure SaveMPProjectionDATA;
  public
    { Public declarations }
    idGeoCrdSystem: integer;

    Constructor Create(const pidGeoCrdSystem: integer);
    procedure Update; reintroduce;
  end;

implementation
uses
  Functionality,
  TypesDefines,
  TypesFunctionality,
  GeoTransformations;

{$R *.dfm}

Constructor TfmProjectionDATAPanel.Create(const pidGeoCrdSystem: integer);
begin
Inherited Create(nil);
idGeoCrdSystem:=pidGeoCrdSystem;
Update();
end;

procedure TfmProjectionDATAPanel.Update;
var
  ProjectionID: TProjectionID;
  ProjectionDATA: TMemoryStream;
begin
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idGeoCrdSystem)) do
try
//.
pnlUnknownProjection.Hide();
gbTMProjection.Hide();
gbLCCProjection.Hide();
gbEQCProjection.Hide();
gbMPProjection.Hide();
//.
ProjectionID:=Projections_GetItemByName(Projection);
case ProjectionID of
pidTM: begin
  GetProjectionDATA(ProjectionDATA);
  try
  with TTMProjectionDATA.Create(ProjectionDATA) do
  try
  edLatitudeOrigin.Text:=FormatFloat('0.0000000',LatitudeOrigin);
  edCentralMeridian.Text:=FormatFloat('0',CentralMeridian);
  edScaleFactor.Text:=FormatFloat('0.0000000',ScaleFactor);
  edFalseEasting.Text:=FormatFloat('0',FalseEasting);
  edFalseNorthing.Text:=FormatFloat('0',FalseNorthing);
  finally
  Destroy;
  end;
  finally
  ProjectionDATA.Destroy;
  end;
  gbTMProjection.Show();
  end;
pidLCC: begin
  GetProjectionDATA(ProjectionDATA);
  try
  with TLCCProjectionDATA.Create(ProjectionDATA) do
  try
  LCC_edLatOfOrigin.Text:=FormatFloat('0.0000000',LatOfOrigin);
  LCC_edLongOfOrigin.Text:=FormatFloat('0.0000000',LongOfOrigin);
  LCC_edFirstStdParallel.Text:=FormatFloat('0.0000000',FirstStdParallel);
  LCC_edSecondStdParallel.Text:=FormatFloat('0.0000000',SecondStdParallel);
  LCC_edFalseEasting.Text:=FormatFloat('0.0000000',FalseEasting);
  LCC_edFalseNorthing.Text:=FormatFloat('0.0000000',FalseNorthing);
  finally
  Destroy;
  end;
  finally
  ProjectionDATA.Destroy;
  end;
  gbLCCProjection.Show();
  end;
pidEQC: begin
  GetProjectionDATA(ProjectionDATA);
  try
  with TEQCProjectionDATA.Create(ProjectionDATA) do
  try
  EQC_edLatOfOrigin.Text:=FormatFloat('0.0000000',LatOfOrigin);
  EQC_edLongOfOrigin.Text:=FormatFloat('0.0000000',LongOfOrigin);
  EQC_edFirstStdParallel.Text:=FormatFloat('0.0000000',FirstStdParallel);
  EQC_edSecondStdParallel.Text:=FormatFloat('0.0000000',SecondStdParallel);
  EQC_edFalseEasting.Text:=FormatFloat('0.0000000',FalseEasting);
  EQC_edFalseNorthing.Text:=FormatFloat('0.0000000',FalseNorthing);
  finally
  Destroy;
  end;
  finally
  ProjectionDATA.Destroy;
  end;
  gbEQCProjection.Show();
  end;
pidMEP,pidMSP: begin
  GetProjectionDATA(ProjectionDATA);
  try
  with TMPProjectionDATA.Create(ProjectionDATA) do
  try
  MP_edLatOfOrigin.Text:=FormatFloat('0.0000000',LatOfOrigin);
  MP_edLongOfOrigin.Text:=FormatFloat('0.0000000',LongOfOrigin);
  finally
  Destroy;
  end;
  finally
  ProjectionDATA.Destroy;
  end;
  gbMPProjection.Show();
  end;
else
  pnlUnknownProjection.Show();
end;
finally
Release;
end;
end;

procedure TfmProjectionDATAPanel.SaveTMProjectionDATA;
var
  DATA: TTMProjectionDATA;
begin
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idGeoCrdSystem)) do
try
Projection:=Projections_GetItemByID(pidTM);
DATA:=TTMProjectionDATA.Create();
with DATA do
try
LatitudeOrigin:=StrToFloat(edLatitudeOrigin.Text);
CentralMeridian:=StrToFloat(edCentralMeridian.Text);
ScaleFactor:=StrToFloat(edScaleFactor.Text);
FalseEasting:=StrToFloat(edFalseEasting.Text);
FalseNorthing:=StrToFloat(edFalseNorthing.Text);
//.
SetProperties();
SetProjectionDATA(DATA);
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TfmProjectionDATAPanel.SaveLCCProjectionDATA;
var
  DATA: TLCCProjectionDATA;
begin
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idGeoCrdSystem)) do
try
Projection:=Projections_GetItemByID(pidLCC);
DATA:=TLCCProjectionDATA.Create();
with DATA do
try
LatOfOrigin:=StrToFloat(LCC_edLatOfOrigin.Text);
LongOfOrigin:=StrToFloat(LCC_edLongOfOrigin.Text);
FirstStdParallel:=StrToFloat(LCC_edFirstStdParallel.Text);
SecondStdParallel:=StrToFloat(LCC_edSecondStdParallel.Text);
FalseEasting:=StrToFloat(LCC_edFalseEasting.Text);
FalseNorthing:=StrToFloat(LCC_edFalseNorthing.Text);
//.
SetProperties();
SetProjectionDATA(DATA);
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TfmProjectionDATAPanel.SaveEQCProjectionDATA;
var
  DATA: TEQCProjectionDATA;
begin
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idGeoCrdSystem)) do
try
Projection:=Projections_GetItemByID(pidEQC);
DATA:=TEQCProjectionDATA.Create();
with DATA do
try
LatOfOrigin:=StrToFloat(EQC_edLatOfOrigin.Text);
LongOfOrigin:=StrToFloat(EQC_edLongOfOrigin.Text);
FirstStdParallel:=StrToFloat(EQC_edFirstStdParallel.Text);
SecondStdParallel:=StrToFloat(EQC_edSecondStdParallel.Text);
FalseEasting:=StrToFloat(EQC_edFalseEasting.Text);
FalseNorthing:=StrToFloat(EQC_edFalseNorthing.Text);
//.
SetProperties();
SetProjectionDATA(DATA);
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TfmProjectionDATAPanel.SaveMPProjectionDATA;
var
  DATA: TMPProjectionDATA;
begin
with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idGeoCrdSystem)) do
try
Projection:=Projections_GetItemByID(pidMEP);
DATA:=TMPProjectionDATA.Create();
with DATA do
try
LatOfOrigin:=StrToFloat(MP_edLatOfOrigin.Text);
LongOfOrigin:=StrToFloat(MP_edLongOfOrigin.Text);
//.
SetProperties();
SetProjectionDATA(DATA);
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TfmProjectionDATAPanel.sbSetTMProjectionDATAClick(Sender: TObject);
begin
SaveTMProjectionDATA();
end;

procedure TfmProjectionDATAPanel.sbSetLCCProjectionDATAClick(Sender: TObject);
begin
SaveLCCProjectionDATA();
end;

procedure TfmProjectionDATAPanel.sbSetEQCProjectionDATAClick(Sender: TObject);
begin
SaveEQCProjectionDATA();
end;

procedure TfmProjectionDATAPanel.sbSetMPProjectionDATAClick(Sender: TObject);
begin
SaveMPProjectionDATA();
end;


end.
