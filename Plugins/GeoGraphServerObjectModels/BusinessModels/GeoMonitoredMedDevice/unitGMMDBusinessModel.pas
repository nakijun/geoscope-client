unit unitGMMDBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitGeoMonitoredMedDeviceModel;

Type
  TGMMDBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;

    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
  end;

  TGMMDBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitGMMDCardiographBusinessModel,
  unitGMMDBusinessModelDeviceInitializerPanel;


{TGMMDBusinessModel}
class function TGMMDBusinessModel.ObjectTypeID: integer;
begin
Result:=TGeoMonitoredMedDeviceModel.ID; //. GMO object model ID
end;

class function TGMMDBusinessModel.ObjectTypeName: string;
begin
Result:=TGeoMonitoredMedDeviceModel.Name; //. GMO object model name
end;

class function TGMMDBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TGMMDCardiographBusinessModel.ID)
 then Result:=TGMMDCardiographBusinessModel
 else Result:=nil;
end;

class function TGMMDBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TGMMDCardiographBusinessModel.ID)
 then Result:=TGMMDCardiographBusinessModel.Create((pObjectModel as TGeoMonitoredMedDeviceModel))
 else Result:=nil;
end;

class procedure TGMMDBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. GMMD Cardiograph
SL.AddObject(TGMMDCardiographBusinessModel.Name,Pointer(TGMMDCardiographBusinessModel));
end;

function TGMMDBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmGMMDBusinessModelDeviceInitializerPanel.Create(Self);
end;


end.
