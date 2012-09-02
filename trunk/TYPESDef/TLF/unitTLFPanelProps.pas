unit UnitTLFPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, Functionality,
  StdCtrls, ExtCtrls, DB, Menus, {/// +telecom Client,} Mask, DBCtrls, Buttons,
  SpaceObjInterpretation, RXCtrls;

type
  TTLFPanelProps = class(TSpaceObjPanelProps)
    ComboBoxTLFType: TComboBox;
    DBEditTLF_Placing: TDBEdit;
    DBEditTLFFactory: TDBEdit;
    DBEditTLFOther: TDBEdit;
    EditTLFDateInstall: TEdit;
    DBEditTLF_ResistLine: TDBEdit;
    LabelCommLine: TEdit;
    DBEditTLFZoneRepair: TDBEdit;
    LabelStatus: TLabel;
    SpeedButtonObjEvents: TSpeedButton;
    SpeedButtonObjDamages: TSpeedButton;
    SpeedButtonObjClient: TSpeedButton;
    LabelAddress: TLabel;
    SpeedButtonNote: TSpeedButton;
    SpeedButtonTLF: TSpeedButton;
    Bevel2: TBevel;
    imgLocalLock: TImage;
    imgGlobalLock: TImage;
    LabelNumber: TRxLabel;
    Bevel1: TBevel;
    RxLabel5: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    sbFinishDevice: TSpeedButton;
    sbTraffic: TSpeedButton;
    procedure ComboBoxTLFTypeChange(Sender: TObject);
    procedure SpeedButtonObjDamagesClick(Sender: TObject);
    procedure SpeedButtonObjClientClick(Sender: TObject);
    procedure SpeedButtonNoteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbFinishDeviceClick(Sender: TObject);
  private
    { Private declarations }
    FFormClient: TForm;
    /// +telecom FPanelClientData: TPanelClientData;
    FTLFZone_PopupMenu: TPopupMenu;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure FinishDevice__PanelProps_Show;
  public
    { Public declarations}
    strNumber: string;

    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure Update_ImageTLF;
    procedure Update_TLFInfo;
    procedure Update_TLFAccess;
  end;

implementation
/// +telecom
{Uses
  UnitTLFCalls,
  UnitEditorDamages,
  UnitObjectEventLog,
  UnitClientPanelProps,
  UnitTLFNote;}

{$R *.DFM}

{TFormTLFProps}
Constructor TTLFPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);

{Left:=Reflector.Left+Round((Reflector.Width-Width)/2);
Top:=Reflector.Top+Reflector.Height-Height-10;}

if flReadOnly then DisableControls;
Update;
{FPanelAddress.Free;
FPanelAddress:=nil;
FPanelAddress:=TPanelAddress.Create(Space, TLF.Address,false, Self,2,269);
//FFormClient.Free;
//FFormClient:=nil;
//FFormClient:=TForm.Create(Self);
{with FFormClient do begin
Width:=750;
Height:=270;
Position:=poScreenCenter;
FPanelClientData:=TPanelClientData.Create(Reflector.Space, Client_Key,FFormClient,0,0);
end;}
{with LabelStatus do begin
Caption:=FPanelClientData.ClientName;
Hint:=Caption;
end;}
///ActiveControl:=nil;
end;

destructor TTLFPanelProps.Destroy;
begin
Inherited;
end;

procedure TTLFPanelProps.Update_TLFInfo;
var
  strTTLF: string;
  strTLFKey_: string;
  TLFTypeIns: TTLFTypeIns;
  TLFFunc: TTLFFunc;
  TLFModeCall: TTLFModeCall;
  strStatus,strAdditionalServices: string;
  Status: TTLFStatus;
  ClientFunctionality: TClientFunctionality;
  Money: Double;
begin
Inherited;
end;

procedure TTLFPanelProps.Update_ImageTLF;
begin
end;

procedure TTLFPanelProps.Update_TLFAccess;
begin
end;

procedure TTLFPanelProps._Update;
begin
Inherited;
Update_TLFInfo;
Update_TLFAccess;
Update_ImageTLF;
end;

procedure TTLFPanelProps.ComboBoxTLFTypeChange(Sender: TObject);
begin
Update;
end;

procedure TTLFPanelProps.SpeedButtonObjDamagesClick(Sender: TObject);
begin
Update;
end;

procedure TTLFPanelProps.SpeedButtonObjClientClick(Sender: TObject);
var
  ClientFunctionality: TComponentFunctionality;
begin
if ClientFunctionality <> nil
 then with ClientFunctionality do begin
  with TPanelProps_Create(false, 0,nil,nilObject) do Show;
  Release;
  end;
end;

procedure TTLFPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTLFPanelProps.FinishDevice__PanelProps_Show;
var
  idTFinishDevice,idFinishDevice: integer;
  Functionality: TComponentFunctionality;
begin
{/// + if TTLFFunctionality(ObjFunctionality).GetFinishDevice(idTFinishDevice,idFinishDevice)
 then begin
  Functionality:=TComponentFunctionality_Create(idTFinishDevice,idFinishDevice);
  if Functionality <> nil
   then with Functionality do begin
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Position:=poDefault;
    Position:=poScreenCenter;
    Show;
    end;
    Release;
    end;
  end;}
end;

procedure TTLFPanelProps.SpeedButtonNoteClick(Sender: TObject);
begin
/// +telecom
{with TFormTLFNote.Create(TypesSystem.Reflector, TComponentFunctionality(ObjFunctionality).idObj) do begin
ShowModal;
Destroy;
end;}
///!!
Close;//Update;
end;

procedure TTLFPanelProps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TTLFPanelProps.sbFinishDeviceClick(Sender: TObject);
begin
FinishDevice__PanelProps_Show;
end;

procedure TTLFPanelProps.Controls_ClearPropData;
begin
LabelStatus.Caption:='';
SpeedButtonTLF.Caption:='';
imgLocalLock.Hide;
imgLocalLock.Hide;
LabelNumber.Caption:='';
ComboBoxTLFType.ItemIndex:=-1;
ComboBoxTLFType.ItemIndex:=-1;
LabelAddress.Caption:='';
SpeedButtonObjClient.Caption:='';
LabelCommLine.Text:='';
EditTLFDateInstall.Text:='';
DBEditTLF_Placing.Text:='';
DBEditTLF_ResistLine.Text:='';
DBEditTLFFactory.Text:='';
DBEditTLFOther.Text:='';
DBEditTLFZoneRepair.Text:='';
end;

end.
