unit UnitListObjects;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TObjectList = class
  public
    TObj: integer;
    Object_Key: integer;
    Constructor Create(pTObj: integer;pObject_Key: integer);
  end;

  TJob = (jobUnknown,jobSelect,jobExplore);
  
  TFormListObjects = class(TForm)
    LabelCaption: TLabel;
    ListObjects: TListBox;
    LabelAction: TLabel;
    procedure ListObjectsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Reflector: TForm;
    Job: TJob;
    FSelectOK: boolean;
  public
    { Public declarations }
    Constructor Create(pReflector: TForm);
    destructor Destroy; override;
    procedure ClearList;
    procedure InsertObject(const pTObj: integer;const pObject_Key: integer);
    function Select(var vTObj: integer;var vObject_Key: integer): boolean;
    procedure Explore;
  end;

implementation
Uses
  unitReflector,TypesDefines,TypesFunctionality,Functionality;

{$R *.DFM}

{TObjectList}
Constructor TObjectList.Create(pTObj: integer;pObject_Key: integer);
begin
Inherited Create;
TObj:=pTObj;
Object_Key:=pObject_Key;
end;

{TFormListObjects}
Constructor TFormListObjects.Create(pReflector: TForm);
begin
Inherited Create(nil);
Reflector:=pReflector;
Job:=jobUnknown;
end;

destructor TFormListObjects.Destroy;
begin
ClearList;
Inherited;
end;

procedure TFormListObjects.ClearList;
var
  I: integer;
begin
for I:=0 to ListObjects.Items.Count-1 do TObjectList(ListObjects.Items.Objects[I]).Free;
ListObjects.Clear;
end;

procedure TFormListObjects.InsertObject(const pTObj: integer;const pObject_Key: integer);
var
  ObjName: string;
  ListZonesServices: TStringList;
  TypeFunctionality: TTypeFunctionality;
begin
{ObjName:='';
TypeFunctionality:=TTypeFunctionality_Create(TFormMain(Reflector).Space,pTObj);
if TypeFunctionality <> nil
 then with TypeFunctionality do begin
  with TComponentFunctionality_Create(pObject_Key) do ObjName:=Name;
  Release;
  end;
with ListObjects.Items do begin
Objects[Add(ObjName)]:=TObjectList.Create(pTObj,pObject_Key);
end; New}
ObjName:='';
{case pTObj of
idTBox: begin
  ObjName:=nmTBox+': '+Box_Name(pObject_Key);
  Box_GetZonesServices(pObject_Key, ListZonesServices);
  if ListZonesServices <> nil
   then begin
    ObjName:=ObjName+', '+ListZonesServices.Strings[0];
    ListZonesServices.Destroy;
    end;
  end;
idTCableBox: begin
  ObjName:=nmTCableBox+': '+CableBox_Name(pObject_Key);
  CableBox_GetZonesServices(pObject_Key, ListZonesServices);
  if ListZonesServices <> nil
   then begin
    ObjName:=ObjName+', '+ListZonesServices.Strings[0];
    ListZonesServices.Destroy;
    end;
  end;
idTCase: begin
  ObjName:=nmTCase+': '+Case_Name(pObject_Key);
  end;
idTTLF: begin
  ObjName:=nmTTLF+' - '+IntToStr(TLF_Number(pObject_Key))
  end;
idTClient: begin
  /// ? ObjName:=nmTClient+' - '+Client_Name(pObject_Key);
  end;
else begin
  TypeFunctionality:=TTypeFunctionality_Create(pTObj);
  if TypeFunctionality <> nil
   then with TypeFunctionality do begin
    with TComponentFunctionality_Create(pObject_Key) do ObjName:=Name;
    Release;
    end;
  end;
end;}
with ListObjects.Items do begin
Objects[Add(ObjName)]:=TObjectList.Create(pTObj,pObject_Key);
end;
end;

function TFormListObjects.Select(var vTObj: integer;var vObject_Key: integer): boolean;
begin
Job:=jobSelect;
FSelectOk:=false;
ShowModal;
Result:=false;
if FSelectOk
 then begin
  with TObjectList(ListObjects.Items.Objects[ListObjects.ItemIndex]) do begin
  vTObj:=TObj;
  vObject_Key:=Object_Key;
  end;
  Result:=true;
  end;
end;

procedure TFormListObjects.Explore;
begin
Job:=jobExplore;
Show;
end;

procedure TFormListObjects.ListObjectsDblClick(Sender: TObject);
var
  ObjFunctionality: TComponentFunctionality;
begin
case Job of
jobSelect: begin
  FSelectOk:=true;
  Close;
  end;
jobExplore: begin
  if Reflector <> nil
   then with TObjectList(ListObjects.Items.Objects[ListObjects.ItemIndex]) do begin
    Show;
    ObjFunctionality:=TComponentFunctionality_Create(TObj,Object_Key);
    if ObjFunctionality <> nil
     then with ObjFunctionality do begin
      with TPanelProps_Create(false, 0,nil,nilObject) do Show;
      Release;
      end;
    end;
  end;
end;
end;

procedure TFormListObjects.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
case Job of
jobExplore: begin
  Action:=caFree;
  end;
end;
end;

end.
