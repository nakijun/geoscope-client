unit unitUserAlertPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TUserAlertPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edUser: TEdit;
    edTimeStamp: TEdit;
    Label2: TLabel;
    edAlertID: TEdit;
    Label3: TLabel;
    edSeverity: TEdit;
    Label4: TLabel;
    edDescription: TEdit;
    Label5: TLabel;
    cbActive: TCheckBox;
    procedure cbActiveClick(Sender: TObject);
    procedure edSeverityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescriptionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    flUpdatingControls: boolean;

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

Constructor TUserAlertPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flUpdatingControls:=false;
Update;
end;

destructor TUserAlertPanelProps.Destroy;
begin
Inherited;
end;

procedure TUserAlertPanelProps._Update;
var
  idUser: integer;
  DT: TDateTime;
begin
flUpdatingControls:=true;
try
with TUserAlertFunctionality(ObjFunctionality) do begin
cbActive.Checked:=Active;
idUser:=UserID;
if (idUser <> 0)
 then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
  try
  edUser.Text:=Name;
  finally
  Release;
  end
 else edUser.Text:='?';
DT:=TimeStamp;
if (DT > 0)
 then edTimeStamp.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',DT)
 else edTimeStamp.Text:='?';
edAlertID.Text:=IntToStr(AlertID);
edSeverity.Text:=IntToStr(Severity);
edDescription.Text:=Description;
end;
finally
flUpdatingControls:=false;
end;
Inherited;
end;

procedure TUserAlertPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TUserAlertPanelProps.cbActiveClick(Sender: TObject);
begin
if (flUpdatingControls) then Exit; //. ->
TUserAlertFunctionality(ObjFunctionality).Active:=cbActive.Checked;
end;

procedure TUserAlertPanelProps.edSeverityKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TUserAlertFunctionality(ObjFunctionality).Severity:=StrToInt(edSeverity.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TUserAlertPanelProps.edDescriptionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TUserAlertFunctionality(ObjFunctionality).Description:=edDescription.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TUserAlertPanelProps.Controls_ClearPropData;
begin
cbActive.Checked:=false;
edUser.Text:='';
edTimeStamp.Text:='';
edAlertID.Text:='';
edSeverity.Text:='';
edDescription.Text:='';
end;


end.
