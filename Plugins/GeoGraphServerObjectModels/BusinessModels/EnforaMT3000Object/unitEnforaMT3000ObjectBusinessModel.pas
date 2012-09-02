unit unitEnforaMT3000ObjectBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaMT3000ObjectModel;

Type
  TEnforaMT3000ObjectBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;

    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
  end;

  TEnforaMT3000ObjectBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitEnforaMT3000TrackerBusinessModel,
  unitEnforaMT3000TrackerBusinessModelDeviceInitializerPanel;


{TEnforaMT3000ObjectBusinessModel}
class function TEnforaMT3000ObjectBusinessModel.ObjectTypeID: integer;
begin
Result:=TEnforaMT3000ObjectModel.ID; //. EnforaMT3000Object object model ID
end;

class function TEnforaMT3000ObjectBusinessModel.ObjectTypeName: string;
begin
Result:=TEnforaMT3000ObjectModel.Name; //. EnforaMT3000Object object model name
end;

class function TEnforaMT3000ObjectBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TEnforaMT3000TrackerBusinessModel.ID)
 then Result:=TEnforaMT3000TrackerBusinessModel
 else Result:=nil;
end;

class function TEnforaMT3000ObjectBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TEnforaMT3000TrackerBusinessModel.ID)
 then Result:=TEnforaMT3000TrackerBusinessModel.Create((pObjectModel as TEnforaMT3000ObjectModel))
 else Result:=nil;
end;

class procedure TEnforaMT3000ObjectBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. EnforaMT3000Object Tracker
SL.AddObject(TEnforaMT3000TrackerBusinessModel.Name,Pointer(TEnforaMT3000TrackerBusinessModel));
end;

function TEnforaMT3000ObjectBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmEnforaMT3000TrackerBusinessModelDeviceInitializerPanel.Create(TEnforaMT3000TrackerBusinessModel(Self));
end;


end.
