unit UnitSpanPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, TypesDefines,
  Db, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, SpaceObjInterpretation, Functionality;

type
  TSpanPanelProps = class(TSpaceObjPanelProps)
    DataSource: TDataSource;
    LabelType: TLabel;
    LabelLength: TLabel;
    DBEditLength: TDBEdit;
    LabelNumCnls: TLabel;
    DBEditNumCnls: TDBEdit;
    FormChanels: TPanel;
    FormChanels_Descr: TLabel;
    FormChanels_NumCh: TLabel;
    BitBtnFormChanels_Form: TBitBtn;
    EditChanels_NumCh: TEdit;
    Bevel: TBevel;
    procedure BitBtnFormChanels_FormClick(Sender: TObject);
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

{$R *.DFM}

Constructor TSpanPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TSpanPanelProps.Destroy;
begin
Inherited;
end;

procedure TSpanPanelProps._Update;
begin
Inherited;
end;

procedure TSpanPanelProps.BitBtnFormChanels_FormClick(Sender: TObject);
begin
//
end;

procedure TSpanPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TSpanPanelProps.Controls_ClearPropData;
begin
DBEditLength.Text:='';
DBEditNumCnls.Text:='';
end;

end.
