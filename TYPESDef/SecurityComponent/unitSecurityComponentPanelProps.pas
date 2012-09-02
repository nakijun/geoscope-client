unit unitSecurityComponentPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TSecurityComponentPanelProps = class(TSpaceObjPanelProps)
    Image_Popup: TPopupMenu;
    ChangeSecurityFile1: TMenuItem;
    ShowSecurityFile1: TMenuItem;
    Image: TImage;
    Create1: TMenuItem;
    N1: TMenuItem;
    Editsecurityfile1: TMenuItem;
    procedure ChangeSecurityFile1Click(Sender: TObject);
    procedure ShowSecurityFile1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Create1Click(Sender: TObject);
    procedure Editsecurityfile1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure ChangeSecurityFile;
    procedure CreateSecurityFileByUserPrivateSecurity;
    procedure ShowSecurityFile;
    procedure EditSecurityFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  unitTSecurityFileInstanceSelector,
  unitSecurityFileEditor;

{$R *.DFM}

Constructor TSecurityComponentPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;   
Update;
end;

destructor TSecurityComponentPanelProps.Destroy;
begin
Inherited;
end;

procedure TSecurityComponentPanelProps._Update;
begin
Inherited;
try
with TSecurityComponentFunctionality(ObjFunctionality) do
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
Image.Hint:=Name+'('+Info+')';
finally
Release;
end;
except
  On E: Exception do Image.Hint:=E.Message;
  end;
end;

procedure TSecurityComponentPanelProps.ChangeSecurityFile;
var
  idSecurityFile: integer;
  R: boolean;
begin
with TfmTSecurityFileInstanceSelector.Create do
try
R:=Select(idSecurityFile);
finally
Destroy;
end;
//.
if NOT R then Exit; //. ->
//.
TSecurityComponentFunctionality(ObjFunctionality).idSecurityFile:=idSecurityFile;
end;

procedure TSecurityComponentPanelProps.ShowSecurityFile;
begin
with TSecurityComponentFunctionality(ObjFunctionality) do
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TSecurityComponentPanelProps.EditSecurityFile;
var
  fm: TfmSecurityFileEditor;
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
fm:=TfmSecurityFileEditor.Create(TSecurityComponentFunctionality(ObjFunctionality).idSecurityFile);
finally
Screen.Cursor:=SC;
end;
with fm do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TSecurityComponentPanelProps.CreateSecurityFileByUserPrivateSecurity;
var
  _idSecurityFileForPrivate: integer;
  idNewSecurityFile: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,ObjFunctionality.Space.UserID)) do
try
_idSecurityFileForPrivate:=idSecurityFileForPrivate;
if _idSecurityFileForPrivate = 0 then Raise Exception.Create('no private security for user - '+Name);
finally
Release;
end;
with TfmSecurityFileEditor.Create(_idSecurityFileForPrivate) do
try
if CloneAndSet(idNewSecurityFile)
 then with TComponentFunctionality_Create(idTSecurityFile,idNewSecurityFile) do
  try
  with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show;
  end;
  TSecurityComponentFunctionality(ObjFunctionality).idSecurityFile:=idObj;
  finally
  Release;
  end;
finally
Destroy;
end;
end;

procedure TSecurityComponentPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TSecurityComponentPanelProps.Controls_ClearPropData;
begin
end;

procedure TSecurityComponentPanelProps.ChangeSecurityFile1Click(Sender: TObject);
begin
ChangeSecurityFile;
end;

procedure TSecurityComponentPanelProps.ShowSecurityFile1Click(Sender: TObject);
begin
ShowSecurityFile;
end;

procedure TSecurityComponentPanelProps.FormPaint(Sender: TObject);
begin
with Canvas do begin
Pen.Color:=clBlack;
Rectangle(0,0,Width,Height);
end;
end;

procedure TSecurityComponentPanelProps.Create1Click(Sender: TObject);
begin
CreateSecurityFileByUserPrivateSecurity;
end;

procedure TSecurityComponentPanelProps.Editsecurityfile1Click(
  Sender: TObject);
begin
EditSecurityFile;
end;

end.
