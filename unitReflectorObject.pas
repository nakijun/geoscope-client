unit unitReflectorObject;
interface
Uses
  Forms;

type 
  TReflectorObject = class(TForm)
  public
    procedure Reflect; virtual; abstract;
  end;

implementation
end.
