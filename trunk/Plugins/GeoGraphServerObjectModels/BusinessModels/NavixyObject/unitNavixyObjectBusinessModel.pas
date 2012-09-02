unit unitNavixyObjectBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitNavixyObjectModel;

Type
  TNavixyObjectBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override; 
    class procedure GetModels(out SL: TStringList); override;
  end;

  TNavixyObjectBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitNavixyObjectMainTrackerBusinessModel;


{TNavixyObjectBusinessModel}
class function TNavixyObjectBusinessModel.ObjectTypeID: integer;
begin
Result:=TNavixyObjectModel.ID; //. NavixyObject object model ID
end;

class function TNavixyObjectBusinessModel.ObjectTypeName: string;
begin
Result:=TNavixyObjectModel.Name; //. NavixyObject object model name
end;

class function TNavixyObjectBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TNavixyObjectMainTrackerBusinessModel.ID)
 then Result:=TNavixyObjectMainTrackerBusinessModel
 else Result:=nil;
end;

class function TNavixyObjectBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TNavixyObjectMainTrackerBusinessModel.ID)
 then Result:=TNavixyObjectMainTrackerBusinessModel.Create((pObjectModel as TNavixyObjectModel))
 else Result:=nil;
end;

class procedure TNavixyObjectBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. NavixyObject MainTracker
SL.AddObject(TNavixyObjectMainTrackerBusinessModel.Name,Pointer(TNavixyObjectMainTrackerBusinessModel));
end;


end.
