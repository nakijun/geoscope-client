unit unitGeoGraphServerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TGeoGraphServerPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image: TImage;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edInfo: TEdit;
    sbRegisterObject: TSpeedButton;
    sbUnregisterObject: TSpeedButton;
    sbData: TSpeedButton;
    Label3: TLabel;
    edAddress: TEdit;
    Label4: TLabel;
    edInternalAddress: TEdit;
    PopupMenu: TPopupMenu;
    Objectcounter1: TMenuItem;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edInfoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbRegisterObjectClick(Sender: TObject);
    procedure sbUnregisterObjectClick(Sender: TObject);
    procedure sbDataClick(Sender: TObject);
    procedure edAddressKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edInternalAddressKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Objectcounter1Click(Sender: TObject);
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
uses
  ShellAPI,
  unitGeoGraphServerRegisterObjectForm,
  unitGeoGraphServerUnRegisterObject,
  unitGeoGraphServerData;

{$R *.DFM}

Constructor TGeoGraphServerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TGeoGraphServerPanelProps.Destroy;
begin
Inherited;
end;

procedure TGeoGraphServerPanelProps._Update;
begin
Inherited;
edName.Text:=TGeoGraphServerFunctionality(ObjFunctionality).Name;
edAddress.Text:=TGeoGraphServerFunctionality(ObjFunctionality).Address;
edInternalAddress.Text:=TGeoGraphServerFunctionality(ObjFunctionality).InternalAddress;
edInfo.Text:=TGeoGraphServerFunctionality(ObjFunctionality).Info;
end;

procedure TGeoGraphServerPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoGraphServerFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoGraphServerPanelProps.edInfoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoGraphServerFunctionality(ObjFunctionality).Info:=edInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoGraphServerPanelProps.edAddressKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoGraphServerFunctionality(ObjFunctionality).Address:=edAddress.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoGraphServerPanelProps.edInternalAddressKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoGraphServerFunctionality(ObjFunctionality).InternalAddress:=edInternalAddress.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoGraphServerPanelProps.sbRegisterObjectClick(Sender: TObject);
var
  ObjectName: string;
  ObjectType: integer;
  ObjectDatumID: integer;
  GeoSpaceID: integer;
  idTVisualization: integer;
  idVisualization: integer;
  idHint: integer;
  ObjectID: integer;
begin
with TfmRegisterObject.Create(ObjFunctionality.Space) do
try
if (Accept(ObjectName,ObjectType,ObjectDatumID,GeoSpaceID,idTVisualization,idVisualization,idHint))
 then begin
  ObjectID:=TGeoGraphServerFunctionality(ObjFunctionality).RegisterObject(ObjectName,ObjectType,ObjectDatumID, idTVisualization,idVisualization, GeoSpaceID,0{no GeoCrdSystem}, idHint); 
  MessageDlg('A new object "'+ObjectName+'" has been registered successfully.'#$0D#$0A'Please save his unique identifier !'#$0D#$0A#$0D#$0A'    ObjectID: '+IntToStr(ObjectID)+#$0D#$0A#$0D#$0A, mtInformation, [mbOK], 0);
  end;
finally
Destroy;
end;
end;

procedure TGeoGraphServerPanelProps.sbUnregisterObjectClick(Sender: TObject);
var
  ObjectID: integer;
begin
with TfmUnRegisterObject.Create() do
try
if (Accept(ObjectID))
 then begin
  TGeoGraphServerFunctionality(ObjFunctionality).UnRegisterObject(ObjectID);
  MessageDlg('The object has been un-registered successfully.', mtInformation, [mbOK], 0);
  end;
finally
Destroy;
end;
end;


procedure TGeoGraphServerPanelProps.sbDataClick(Sender: TObject);
begin
with TfmGeoGraphServerData.Create(TGeoGraphServerFunctionality(ObjFunctionality)) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TGeoGraphServerPanelProps.Objectcounter1Click(Sender: TObject);
begin
ShowMessage('Server objects: '+IntToStr(TGeoGraphServerFunctionality(ObjFunctionality).ObjectCounter()));
end;

procedure TGeoGraphServerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TGeoGraphServerPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edAddress.Text:='';
edInternalAddress.Text:='';
edInfo.Text:='';
end;


end.
