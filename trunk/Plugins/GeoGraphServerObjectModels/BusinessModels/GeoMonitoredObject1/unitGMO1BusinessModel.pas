unit unitGMO1BusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredObject1Model;

Type
  TGMO1BusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;

    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
  end;

  TGMO1BusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitGMO1TrackLogger1BusinessModel,
  unitGMO1GeoLogAndroidBusinessModel,
  unitGMO1BusinessModelDeviceInitializerPanel;


{TGMO1BusinessModel}
class function TGMO1BusinessModel.ObjectTypeID: integer;
begin
Result:=TGeoMonitoredObject1Model.ID; //. GMO1 object model ID
end;

class function TGMO1BusinessModel.ObjectTypeName: string;
begin
Result:=TGeoMonitoredObject1Model.Name; //. GMO1 object model name
end;

class function TGMO1BusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TGMO1TrackLogger1BusinessModel.ID)
 then Result:=TGMO1TrackLogger1BusinessModel else
if (pModelID = TGMO1GeoLogAndroidBusinessModel.ID)
 then Result:=TGMO1GeoLogAndroidBusinessModel
 else Result:=nil;
end;

class function TGMO1BusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TGMO1TrackLogger1BusinessModel.ID)
 then Result:=TGMO1TrackLogger1BusinessModel.Create((pObjectModel as TGeoMonitoredObject1Model)) else
if (pModelID = TGMO1GeoLogAndroidBusinessModel.ID)
 then Result:=TGMO1GeoLogAndroidBusinessModel.Create((pObjectModel as TGeoMonitoredObject1Model))
 else Result:=nil;
end;

class procedure TGMO1BusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. GMO1 TrackLogger1
SL.AddObject(TGMO1TrackLogger1BusinessModel.Name,Pointer(TGMO1TrackLogger1BusinessModel));
//. GMO1 GeoLogAndroid
SL.AddObject(TGMO1GeoLogAndroidBusinessModel.Name,Pointer(TGMO1GeoLogAndroidBusinessModel));
end;

function TGMO1BusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmGMO1BusinessModelDeviceInitializerPanel.Create(Self);
end;


end.
