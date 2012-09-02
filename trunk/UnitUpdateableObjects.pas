unit UnitUpdateableObjects;

interface
Uses
  Classes;

type
  TUpdateableObject = class(TObject)
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure Update; virtual;
  end;

  TUpdateableObjects = class(TList);

var
  ListUpdateableObjects: TUpdateableObjects;

implementation

{TUpdateableObject}
procedure TUpdateableObject.AfterConstruction;
begin
ListUpdateableObjects.Add(Self);
end;

procedure TUpdateableObject.BeforeDestruction;
begin
ListUpdateableObjects.Remove(Self);
end;
                          
procedure TUpdateableObject.Update;
begin
end;

{TUpdateableObjects}

Initialization
ListUpdateableObjects:=TUpdateableObjects.Create;
Finalization
ListUpdateableObjects.Free;
end.
