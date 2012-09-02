unit unitCoGeoCalibrationTrackFunctionality;
Interface
Uses
  Classes,
  Forms,
  FunctionalityImport,
  CoFunctionality;


Const
  idTCoGeoCalibrationTrack = 1111144;
Type
  TCoGeoCalibrationTrackTypeSystem = class(TCoComponentTypeSystem);

  TCoGeoCalibrationTrackFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    function TPropsPanel_Create: TForm; override;
    procedure GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
  end;



  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoGeoCalibrationTrackTypeSystem: TCoGeoCalibrationTrackTypeSystem = nil;

Implementation
Uses
  SysUtils,
  TypesDefines,
  unitCoGeoCalibrationTrackPanelProps,
  unitTrackCalibration; 



                     

{TCoGeoCalibrationTrackFunctionality}
Constructor TCoGeoCalibrationTrackFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
UpdateDATA;
end;

Destructor TCoGeoCalibrationTrackFunctionality.Destroy;
begin
Inherited;
end;

function TCoGeoCalibrationTrackFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoGeoCalibrationTrackPanelProps.Create(idCoComponent);
end;

procedure TCoGeoCalibrationTrackFunctionality.GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
var
  CL: TComponentsList;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponents(TBase2DVisualizationFunctionality,CL))
 then
  try
  VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
  VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('visualization-component is not found'); //. =>
end;


procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoGeoCalibrationTrackTypeSystem:=TCoGeoCalibrationTrackTypeSystem.Create(idTCoGeoCalibrationTrack,TCoGeoCalibrationTrackFunctionality);

Finalization
CoGeoCalibrationTrackTypeSystem.Free;

end.
