unit UnitGoodsPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, TypesDefines,TypesFunctionality,unitReflector, Db,
  Buttons, SpaceObjInterpretation, Functionality, RXCtrls;

type
  TGoodsPanelProps = class(TSpaceObjPanelProps)
    Bevel2: TBevel;
    RxLabel5: TRxLabel;
    edName: TEdit;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  UnitListObjects;

{$R *.DFM}

Constructor TGoodsPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: integer;
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
{/// -
// подготавливаем cbStdMeasureUnit
with cbStdMeasureUnit.Items,TComponentFunctionality(ObjFunctionality).Space.TObjPropsQuery_Create do begin
Clear;
EnterSQL('SELECT Name,Key_ FROM Measurement ORDER BY Name');
Open;
while NOT EOF do begin
  try Objects[Add(FieldValues['Name'])]:=TObject(Integer(FieldValues['Key_'])) except end;
  Next;
  end;
Destroy;
end;}
Update;
end;

destructor TGoodsPanelProps.Destroy;
begin
Inherited;
end;

procedure TGoodsPanelProps._Update;
var
  I: integer;
begin
Inherited;
edName.Text:=TGoodsFunctionality(ObjFunctionality).Name;
{/// -
with cbStdMeasureUnit.Items do begin
for I:=0 to Count-1 do
  if FieldValues['StdMeasureUnit'] = integer(Objects[I])
   then begin
    cbStdMeasureUnit.ItemIndex:=I;
    Break;
    end;
end;
except
  end;
end;}
end;

procedure TGoodsPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then TGoodsFunctionality(ObjFunctionality).Name:=edName.Text;
end;


{/// -
procedure TGoodsPanelProps.cbStdMeasureUnitChange(Sender: TObject);
begin
with (Sender as TComboBox) do begin
with TComponentFunctionality(ObjFunctionality).Space.TObjPropsQuery_Create do begin
EnterSQL('UPDATE '+tnTGoods+' SET StdMeasureUnit = '+IntToStr(integer(Items.Objects[ItemIndex]))+' WHERE Key_ = '+IntToStr(TComponentFunctionality(ObjFunctionality).idObj));
ExecSQL;
Destroy;
end;
end;
end;}

procedure TGoodsPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TGoodsPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;


procedure TGoodsPanelProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
