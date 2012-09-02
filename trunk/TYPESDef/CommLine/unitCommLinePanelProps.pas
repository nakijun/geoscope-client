unit UnitCommLinePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality, Functionality,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TCommLinePanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    Bevel: TBevel;
    LabelType: TLabel;
    Label1: TLabel;
    ComboBoxFinishDevice: TComboBox;
    LabelLength: TLabel;
    LabelDateCreated: TLabel;
    LabelDivision: TLabel;
    LabelRemarks: TLabel;
    EditLength: TEdit;
    LabelPrice: TLabel;
    EditRemarks: TEdit;
    EditPrice: TEdit;
    ComboBoxDivision: TComboBox;
    EditDateCreated: TEdit;
  private
    { Private declarations }
    procedure ComboBoxFinishDevice_Prepare;
    procedure ComboBoxDevision_Prepare;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TCommLinePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
ComboBoxFinishDevice_Prepare;
ComboBoxDevision_Prepare;
if flReadOnly then DisableControls;
Update;
end;

destructor TCommLinePanelProps.Destroy;
begin
Inherited;
end;


procedure TCommLinePanelProps.ComboBoxFinishDevice_Prepare;
begin
end;

procedure TCommLinePanelProps.ComboBoxDevision_Prepare;
begin
end;


procedure TCommLinePanelProps._Update;
var
  FinishDevice: string;
  Division_Key: integer;
  DateCreated: TDateTime;
  Length: integer;
  Price: integer;
  Remarks: string;

  I: integer;
begin
Inherited;
EditDateCreated.Text:=FormatDateTime('YYYY.MM.DD',DateCreated);EditLength.Text:=IntToStr(Length);EditPrice.Text:=IntToStr(Price);EditRemarks.Text:=Remarks;
ComboBoxFinishDevice.Text:=FinishDevice;
with ComboBoxDivision do
  for I:=0 to Items.Count-1 do
    if Integer(Items.Objects[I]) = Division_Key
     then begin
      ItemIndex:=I;
      Break;
      end;
end;

procedure TCommLinePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TCommLinePanelProps.Controls_ClearPropData;
begin
ComboBoxFinishDevice.ItemIndex:=-1;
EditDateCreated.Text:='';
EditLength.Text:='';
EditPrice.Text:='';
ComboBoxDivision.ItemIndex:=-1;
EditRemarks.Text:='';
end;

end.
