unit unitTLay2DVisualization_InstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Functionality, GlobalSpaceDefines, unitProxySpace, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  StdCtrls, Buttons, RxGrdCpt;

type
  TTLay2DVisualization_InstanceSelector = class(TForm)
    GroupBox1: TGroupBox;
    cbLays: TComboBox;
    bbSelect: TBitBtn;
    bbClose: TBitBtn;
    procedure bbCloseClick(Sender: TObject);
    procedure bbSelectClick(Sender: TObject);
  private
    { Private declarations }
    flSelect: boolean;
    idSelectedLay: integer;

    procedure Update;
  public
    { Public declarations }
    Constructor Create;
    function Select(var idLay: integer): boolean;
  end;


implementation

{$R *.DFM}


Constructor TTLay2DVisualization_InstanceSelector.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TTLay2DVisualization_InstanceSelector.Update;

  function TreateLay(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    LayFunctionality: TLay2DVisualizationFunctionality;
  begin
  Result:=false;
  with TypesSystem.Space do begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.idTObj = idTLay2DVisualization
   then begin
    LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Obj.idObj));
    with LayFunctionality do begin
    cbLays.Items.Insert(0,Name);
    cbLays.Items.Objects[0]:=TObject(idObj);
    Release;
    end;
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   if TreateLay(ptrOwnerObj) then Exit;
   ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
   end;
  end;
  end;

var
  Lay,SubLay: integer;
  ptrLay: TPtr;
  LayObj: TSpaceObj;
  I: integer;
begin
cbLays.Items.BeginUpdate;
try
cbLays.Clear;
TreateLay(TypesSystem.Space.ptrRootObj);
finally
cbLays.Items.EndUpdate;
end;
end;

function TTLay2DVisualization_InstanceSelector.Select(var idLay: integer): boolean;
begin
Result:=false;
flSelect:=false;
ShowModal;
if flSelect
 then begin
  idLay:=idSelectedLay;
  Result:=true;
  end
end;

procedure TTLay2DVisualization_InstanceSelector.bbCloseClick(Sender: TObject);
begin
Close;
end;

procedure TTLay2DVisualization_InstanceSelector.bbSelectClick(Sender: TObject);
begin
if cbLays.ItemIndex = -1 then Raise Exception.Create('please select at least 1 lay');
idSelectedLay:=Integer(cbLays.Items.Objects[cbLays.ItemIndex]);
flSelect:=true;
Close;
end;

end.
