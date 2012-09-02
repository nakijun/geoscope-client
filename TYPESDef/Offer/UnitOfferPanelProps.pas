unit UnitOfferPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  SpaceObjInterpretation, Db, StdCtrls,
  Buttons, ExtCtrls, RXCtrls, Grids, Menus;

type
  TGoodsList = class (TStringGrid)
  {public
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;}
  end;
  
  TOfferPanelProps = class(TSpaceObjPanelProps)
    lbClient: TRxLabel;
    Bevel: TBevel;
    RxLabel3: TRxLabel;
    lbUID: TRxLabel;
    edName: TEdit;
    RxLabel5: TRxLabel;
    edSchedule: TEdit;
    RxLabel2: TRxLabel;
    edPassword: TEdit;
    RxLabel4: TRxLabel;
    edContactTLF: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    sbGoodsEdit: TSpeedButton;
    Label1: TLabel;
    lbLastUpdated: TLabel;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure edContactTLFKeyPress(Sender: TObject; var Key: Char);
    procedure edScheduleKeyPress(Sender: TObject; var Key: Char);
    procedure sbGoodsEditClick(Sender: TObject);
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
  unitOfferGoodsEditor;

{$R *.DFM}

Constructor TOfferPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  MeasurementsList: TStringList;
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TOfferPanelProps.Destroy;
begin
Inherited;
end;

procedure TOfferPanelProps._Update;
var
  CT: integer;
  LastUpdated: TDateTime;
begin
Inherited;
with TComponentFunctionality_Create(idTMODELUSer,TOfferFunctionality(ObjFunctionality).UserID) do begin
lbClient.Caption:=Name;
Release;
end;
edName.Text:=ObjFunctionality.Name;
edSchedule.Text:=TOfferFunctionality(ObjFunctionality).Schedule;
edPassword.Text:=TOfferFunctionality(ObjFunctionality).Password;
lbUID.Caption:=IntToStr(TOfferFunctionality(ObjFunctionality).UID);
CT:=TOfferFunctionality(ObjFunctionality).ContactTLF;
if CT <> 0
 then edContactTLF.Text:=IntToStr(CT)
 else edContactTLF.Text:='';
LastUpdated:=TOfferFunctionality(ObjFunctionality).LastUpdated;
if LastUpdated <> 0           
 then lbLastUpdated.Caption:=FormatDateTime('HH:NN DD.MM.YYYY',LastUpdated)
 else lbLastUpdated.Caption:='';
end;

procedure TOfferPanelProps.DisableControls;
var
  I: integer;
begin
{for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;}
end;

procedure TOfferPanelProps.Controls_ClearPropData;
begin
lbClient.Caption:='';
lbUID.Caption:='';
edName.Text:='';
edPassword.Text:='';
end;

procedure TOfferPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  ObjFunctionality.Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TOfferPanelProps.edPasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TOfferFunctionality(ObjFunctionality).Password:=edPassword.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TOfferPanelProps.edContactTLFKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  if edContactTLF.Text <> ''
   then TOfferFunctionality(ObjFunctionality).ContactTLF:=StrToInt(edContactTLF.Text)
   else TOfferFunctionality(ObjFunctionality).ContactTLF:=0;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TOfferPanelProps.edScheduleKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TOfferFunctionality(ObjFunctionality).Schedule:=edSchedule.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TOfferPanelProps.sbGoodsEditClick(Sender: TObject);
begin
with TfmOfferGoodsEditor.Create(TOfferFunctionality(ObjFunctionality)) do
try
ShowModal;
finally
Destroy;
end;
end;

end.

