unit unitEnforaMiniMTObjectBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaMiniMTObjectModel;

Type
  TEnforaMiniMTObjectBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;

    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
  end;

  TEnforaMiniMTObjectBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitEnforaMiniMTTrackerBusinessModel,
  unitEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel;


{TEnforaMiniMTObjectBusinessModel}
class function TEnforaMiniMTObjectBusinessModel.ObjectTypeID: integer;
begin
Result:=TEnforaMiniMTObjectModel.ID; //. EnforaMiniMTObject object model ID
end;

class function TEnforaMiniMTObjectBusinessModel.ObjectTypeName: string;
begin
Result:=TEnforaMiniMTObjectModel.Name; //. EnforaMiniMTObject object model name
end;

class function TEnforaMiniMTObjectBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TEnforaMiniMTTrackerBusinessModel.ID)
 then Result:=TEnforaMiniMTTrackerBusinessModel
 else Result:=nil;
end;

class function TEnforaMiniMTObjectBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TEnforaMiniMTTrackerBusinessModel.ID)
 then Result:=TEnforaMiniMTTrackerBusinessModel.Create((pObjectModel as TEnforaMiniMTObjectModel))
 else Result:=nil;
end;

class procedure TEnforaMiniMTObjectBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. EnforaMiniMTObject Tracker
SL.AddObject(TEnforaMiniMTTrackerBusinessModel.Name,Pointer(TEnforaMiniMTTrackerBusinessModel));
end;

function TEnforaMiniMTObjectBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Create(TEnforaMiniMTTrackerBusinessModel(Self));
end;


end.
