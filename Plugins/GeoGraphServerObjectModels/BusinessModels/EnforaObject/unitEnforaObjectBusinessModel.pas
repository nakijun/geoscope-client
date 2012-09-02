unit unitEnforaObjectBusinessModel;
interface
uses
  SysUtils,
  Classes,
  unitObjectModel,
  unitBusinessModel,
  unitEnforaObjectModel;

Type
  TEnforaObjectBusinessModel = class(TBusinessModel)
  public
    class function ObjectTypeID: integer; override;
    class function ObjectTypeName: string; override;
    class function GetModelClass(const pModelID: integer): TBusinessModelClass; override;
    class function GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel; override;
    class procedure GetModels(out SL: TStringList); override;
  end;

  TEnforaObjectBusinessModelConstructorPanel = class(TBusinessModelConstructorPanel)
  public
  end;


implementation
uses
  unitEnforaObjectTracker1BusinessModel;


{TEnforaObjectBusinessModel}
class function TEnforaObjectBusinessModel.ObjectTypeID: integer;
begin
Result:=TEnforaObjectModel.ID; //. Enfora object-model ID
end;

class function TEnforaObjectBusinessModel.ObjectTypeName: string;
begin
Result:=TEnforaObjectModel.Name; //. Enfora object-model name
end;

class function TEnforaObjectBusinessModel.GetModelClass(const pModelID: integer): TBusinessModelClass;
begin
if (pModelID = TEnforaObjectTracker1BusinessModel.ID)
 then Result:=TEnforaObjectTracker1BusinessModel
 else Result:=nil;
end;

class function TEnforaObjectBusinessModel.GetModel(const pObjectModel: TObjectModel; const pModelID: integer): TBusinessModel;
begin
if (pModelID = TEnforaObjectTracker1BusinessModel.ID)
 then Result:=TEnforaObjectTracker1BusinessModel.Create((pObjectModel as TEnforaObjectModel))
 else Result:=nil;
end;

class procedure TEnforaObjectBusinessModel.GetModels(out SL: TStringList);
begin
SL:=TStringList.Create;
//. EnforaObject Tracker1 (CarTracker)
SL.AddObject(TEnforaObjectTracker1BusinessModel.Name,Pointer(TEnforaObjectTracker1BusinessModel));
end;


end.
