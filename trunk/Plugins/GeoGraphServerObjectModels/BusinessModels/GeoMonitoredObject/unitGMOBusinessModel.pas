unit unitGMOBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredObjectModel;

Type
  TGMOBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;

    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
  end;

  TGMOBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitGMOTrackLogger1BusinessModel,
  unitGMOGeoLogAndroidBusinessModel,
  unitGMOBusinessModelDeviceInitializerPanel;


{TGMOBusinessModel}
class function TGMOBusinessModel.ObjectTypeID: integer;
begin
Result:=TGeoMonitoredObjectModel.ID; //. GMO object model ID
end;

class function TGMOBusinessModel.ObjectTypeName: string;
begin
Result:=TGeoMonitoredObjectModel.Name; //. GMO object model name
end;

class function TGMOBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TGMOTrackLogger1BusinessModel.ID)
 then Result:=TGMOTrackLogger1BusinessModel else
if (pModelID = TGMOGeoLogAndroidBusinessModel.ID)
 then Result:=TGMOGeoLogAndroidBusinessModel
 else Result:=nil;
end;

class function TGMOBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TGMOTrackLogger1BusinessModel.ID)
 then Result:=TGMOTrackLogger1BusinessModel.Create((pObjectModel as TGeoMonitoredObjectModel)) else
if (pModelID = TGMOGeoLogAndroidBusinessModel.ID)
 then Result:=TGMOGeoLogAndroidBusinessModel.Create((pObjectModel as TGeoMonitoredObjectModel))
 else Result:=nil;
end;

class procedure TGMOBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. GMO TrackLogger1
SL.AddObject(TGMOTrackLogger1BusinessModel.Name,Pointer(TGMOTrackLogger1BusinessModel));
//. GMO GeoLogAndroid
SL.AddObject(TGMOGeoLogAndroidBusinessModel.Name,Pointer(TGMOGeoLogAndroidBusinessModel));
end;

function TGMOBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmGMOBusinessModelDeviceInitializerPanel.Create(Self);
end;


end.
