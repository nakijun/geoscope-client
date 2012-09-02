unit unitGSTraqObjectBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitGSTraqObjectModel;

Type
  TGSTraqObjectBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;
  end;

  TGSTraqObjectBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitGSTraqObjectMainTrackerBusinessModel;


{TGSTraqObjectBusinessModel}
class function TGSTraqObjectBusinessModel.ObjectTypeID: integer;
begin
Result:=TGSTraqObjectModel.ID; //. GSTraqObject object model ID
end;

class function TGSTraqObjectBusinessModel.ObjectTypeName: string;
begin
Result:=TGSTraqObjectModel.Name; //. GSTraqObject object model name
end;

class function TGSTraqObjectBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TGSTraqObjectMainTrackerBusinessModel.ID)
 then Result:=TGSTraqObjectMainTrackerBusinessModel
 else Result:=nil;
end;

class function TGSTraqObjectBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TGSTraqObjectMainTrackerBusinessModel.ID)
 then Result:=TGSTraqObjectMainTrackerBusinessModel.Create((pObjectModel as TGSTraqObjectModel))
 else Result:=nil;
end;

class procedure TGSTraqObjectBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. GSTraqObject MainTracker
SL.AddObject(TGSTraqObjectMainTrackerBusinessModel.Name,Pointer(TGSTraqObjectMainTrackerBusinessModel));
end;


end.
