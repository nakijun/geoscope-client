unit unitGeoGraphServerEditObjectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, unitProxySpace, Functionality, TypesDefines, TypesFunctionality;

type
  TfmGeographServerEditObject = class(TForm)
    sbAccept: TSpeedButton;
    sbCancel: TSpeedButton;
    Label5: TLabel;
    edObjectName: TEdit;
    Label6: TLabel;
    edObjectType: TEdit;
    Label8: TLabel;
    edBusinessType: TEdit;
    Label9: TLabel;
    edObjectComponentID: TEdit;
    procedure sbCancelClick(Sender: TObject);
    procedure sbAcceptClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    idGeographServer: integer;
    ObjectID: integer;
    flAccepted: boolean;

    procedure Update; reintroduce;
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace; const pidGeographServer: integer; const pObjectID: integer);
    function Edit(): boolean;
  end;

implementation

{$R *.dfm}

Constructor TfmGeographServerEditObject.Create(const pSpace: TProxySpace; const pidGeographServer: integer; const pObjectID: integer);
var
  I: integer;
begin
Inherited Create(nil);
Space:=pSpace;
idGeographServer:=pidGeographServer;
ObjectID:=pObjectID;
end;

procedure TfmGeographServerEditObject.Update;
var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  ObjectComponentID: integer;
begin
with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeographServer,idGeographServer)) do
try
Object_GetProperties(ObjectID, ObjectName,ObjectType,BusinessType,ObjectComponentID);
edObjectName.Text:=ObjectName;
edObjectType.Text:=IntToStr(ObjectType);
edBusinessType.Text:=IntToStr(BusinessType);
edObjectComponentID.Text:=IntToStr(ObjectComponentID);
finally
Release;
end;
end;

function TfmGeographServerEditObject.Edit(): boolean;
var
  ObjectName: string;
  ObjectType: integer;
  BusinessType: integer;
  ObjectComponentID: integer;
begin
Update();
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  ObjectName:=edObjectName.Text;
  ObjectType:=StrToInt(edObjectType.Text);
  BusinessType:=StrToInt(edBusinessType.Text);
  ObjectComponentID:=StrToInt(edObjectComponentID.Text);
  //. set properties
  with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeographServer,idGeographServer)) do
  try
  Object_SetProperties(ObjectID, ObjectName,ObjectType,BusinessType,ObjectComponentID);
  finally
  Release;
  end;
  //.
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmGeographServerEditObject.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmGeographServerEditObject.sbAcceptClick(Sender: TObject);
begin
flAccepted:=true;
Close;
end;

end.

