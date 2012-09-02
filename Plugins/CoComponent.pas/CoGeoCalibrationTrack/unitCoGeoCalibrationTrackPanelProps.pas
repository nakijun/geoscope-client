unit unitCoGeoCalibrationTrackPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoGeoCalibrationTrackFunctionality,
  unitCoComponentRepresentations, unitTrackCalibration, StdCtrls, ExtCtrls, Buttons,
  jpeg;

type
  TCoGeoCalibrationTrackPanelProps = class(TCoComponentPanelProps)
    Image: TImage;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    memoCalibrationLog: TMemo;
    sbLoadTrackFromFile: TSpeedButton;
    sbSetVisualizationByTrack: TSpeedButton;
    sbCoComponent: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edGeodesyPointPrototypeID: TEdit;
    sbSetGeodesyPointPrototypeIDFromClipboard: TSpeedButton;
    Label2: TLabel;
    edCalibrationCrdSystemID: TEdit;
    sbDoCalibrate: TSpeedButton;
    Label3: TLabel;
    cbGeodesyEllipsoide: TComboBox;
    procedure sbLoadTrackFromFileClick(Sender: TObject);
    procedure sbSetVisualizationByTrackClick(Sender: TObject);
    procedure sbCoComponentClick(Sender: TObject);
    procedure sbDoCalibrateClick(Sender: TObject);
    procedure sbSetGeodesyPointPrototypeIDFromClipboardClick(
      Sender: TObject);
    procedure cbGeodesyEllipsoideChange(Sender: TObject);
  private
    { Private declarations }
    TrackCalibration: TTrackCalibration;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    procedure LoadTrackFromFile;
    procedure SetVisualizationByTrack;
  end;

implementation
Uses
  GlobalSpaceDefines,
  TypesDefines;

{$R *.dfm}


Constructor TCoGeoCalibrationTrackPanelProps.Create(const pidCoComponent: integer);
var
  I: integer;
begin
Inherited Create(pidCoComponent);
TrackCalibration:=TTrackCalibration.Create;
//.
cbGeodesyEllipsoide.Items.Clear;
for I:=0 to EllipsoidsCount-1 do cbGeodesyEllipsoide.Items.Add(Ellipsoids[I].ellipsoidName);
cbGeodesyEllipsoide.ItemIndex:=22; //. default index of WGS-84
TrackCalibration.CalibrationGeodesyEllipsoid:=cbGeodesyEllipsoide.ItemIndex;
memoCalibrationLog.Lines.Add('* Datum ellipsoid is selected by default, Name: '+Ellipsoids[cbGeodesyEllipsoide.ItemIndex].ellipsoidName);
//.
Update;
end;

Destructor TCoGeoCalibrationTrackPanelProps.Destroy;
begin
TrackCalibration.Free;
Inherited;
end;

procedure TCoGeoCalibrationTrackPanelProps._Update;
begin
end;

procedure TCoGeoCalibrationTrackPanelProps.LoadTrackFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir();
try
R:=OpenDialog.Execute();
finally
SetCurrentDir(CD);
end;
if (R)
 then begin
  TrackCalibration.LoadTrackFromFile(OpenDialog.FileName);
  memoCalibrationLog.Lines.Add('* Track "'+ExtractFileName(OpenDialog.FileName)+'" is loaded, points: '+IntToStr(Length(TrackCalibration.Track)));
  end;
end;

procedure TCoGeoCalibrationTrackPanelProps.SetVisualizationByTrack;
var
  VisualizationType,VisualizationID: integer;
begin
with TCoGeoCalibrationTrackFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
TrackCalibration.SetVisualization(VisualizationType,VisualizationID);
finally
Release;
end;
ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink(VisualizationType,VisualizationID);
end;

procedure TCoGeoCalibrationTrackPanelProps.sbLoadTrackFromFileClick(Sender: TObject);
begin
LoadTrackFromFile();
end;

procedure TCoGeoCalibrationTrackPanelProps.sbSetVisualizationByTrackClick(Sender: TObject);
begin
if (Application.MessageBox('Confirm operation','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES) then Exit; //. ->
SetVisualizationByTrack;
end;

procedure TCoGeoCalibrationTrackPanelProps.sbCoComponentClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTCoComponent,idCoComponent) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TCoGeoCalibrationTrackPanelProps.cbGeodesyEllipsoideChange(Sender: TObject);
begin
TrackCalibration.CalibrationGeodesyEllipsoid:=cbGeodesyEllipsoide.ItemIndex;
memoCalibrationLog.Lines.Add('* Datum ellipsoid is selected, Name: '+Ellipsoids[cbGeodesyEllipsoide.ItemIndex].ellipsoidName);
end;

procedure TCoGeoCalibrationTrackPanelProps.sbSetGeodesyPointPrototypeIDFromClipboardClick(Sender: TObject);
var
  _TypeID,_ID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(_TypeID,_ID))
 then begin
  Application.MessageBox('Clipboard is empty.','Error',MB_OK+MB_ICONERROR);
  Exit; //. ->
  end;
if (_TypeID <> idTGeodesyPoint)
 then begin
  Application.MessageBox('Clipboard has no GeodesyPoint component.','Error',MB_OK+MB_ICONERROR);
  Exit; //. ->
  end;
edGeodesyPointPrototypeID.Text:=IntToStr(_ID);
end;

procedure TCoGeoCalibrationTrackPanelProps.sbDoCalibrateClick(Sender: TObject);
var
  PI: integer;
  VisualizationType,VisualizationID: integer;
begin
PI:=ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle();
if (PI = -1)
 then begin
  Application.MessageBox('Point is not selected','Error',MB_OK+MB_ICONERROR);
  Exit; //. ->
  end;
if (Application.MessageBox('Confirm operation','Confirmation',MB_YESNO+MB_ICONWARNING) <> IDYES) then Exit; //. ->
with TCoGeoCalibrationTrackFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
TrackCalibration.CalibrationVisualization_idTVisualization:=VisualizationType;
TrackCalibration.CalibrationVisualization_idVisualization:=VisualizationID;
TrackCalibration.CalibrationVisualizationPoint_Index:=PI;
finally
Release;
end;
TrackCalibration.CalibrationGeodesyPointPrototypeID:=StrToInt(edGeodesyPointPrototypeID.Text);
TrackCalibration.CalibrationCrdSystemID:=StrToInt(edCalibrationCrdSystemID.Text);
TrackCalibration.DoCalibrate();
memoCalibrationLog.Lines.Add('* Point is calibrated, index: '+IntToStr(PI));
end;


end.
