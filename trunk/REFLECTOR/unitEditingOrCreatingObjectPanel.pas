unit unitEditingOrCreatingObjectPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Menus;
              
const
  WM_UPDATE = WM_USER+1;
  WM_HIDE = WM_USER+2;
type
  TfmEditingOrCreatingObjectPanel = class(TForm)
    lbCommitAction: TLabel;
    sbYes: TSpeedButton;
    sbReset: TSpeedButton;
    Bevel1: TBevel;
    sbFree: TSpeedButton;
    sbClone: TSpeedButton;
    cbFix: TSpeedButton;
    sbShowPropsPanel: TSpeedButton;
    sbShowObjProps: TSpeedButton;
    cbUseInsideObjects: TCheckBox;
    sbExport: TSpeedButton;
    Bevel2: TBevel;
    popupCreateObject: TPopupMenu;
    CreatewithDefaultsecurity1: TMenuItem;
    CreatewithPrivatesecurity1: TMenuItem;
    CreatewithOthersecurity1: TMenuItem;
    N1: TMenuItem;
    Cancel1: TMenuItem;
    popupCloneObject: TPopupMenu;
    ClonewithDefaultsecurity1: TMenuItem;
    ClonewithPrivatesecurity1: TMenuItem;
    ClonewithOthersecurity1: TMenuItem;
    N2: TMenuItem;
    Cancel2: TMenuItem;
    procedure sbYesClick(Sender: TObject);
    procedure sbResetClick(Sender: TObject);
    procedure sbFreeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbCloneClick(Sender: TObject);
    procedure cbFixClick(Sender: TObject);
    procedure sbShowPropsPanelClick(Sender: TObject);
    procedure sbShowObjPropsClick(Sender: TObject);
    procedure cbUseInsideObjectsClick(Sender: TObject);
    procedure sbExportClick(Sender: TObject);
    procedure CreatewithDefaultsecurity1Click(Sender: TObject);
    procedure CreatewithPrivatesecurity1Click(Sender: TObject);
    procedure CreatewithOthersecurity1Click(Sender: TObject);
    procedure Cancel1Click(Sender: TObject);
    procedure ClonewithDefaultsecurity1Click(Sender: TObject);
    procedure ClonewithPrivatesecurity1Click(Sender: TObject);
    procedure ClonewithOthersecurity1Click(Sender: TObject);
    procedure Cancel2Click(Sender: TObject);
  private
    { Private declarations }
    EditingOrCreatingObject: TObject;
    InitalHeight: integer;
    flCommiting: boolean;

    procedure wmUpdate(var Message: TMessage); message WM_UPDATE;
    procedure wmHide(var Message: TMessage); message WM_HIDE;
    procedure CommitCreate(const pidSecurityFile: integer);
    procedure CommitClone(const pidSecurityFile: integer);
  public
    { Public declarations }
    ObjPropsPanel: TForm;

    Constructor Create(pEditingOrCreatingObject: TObject);
    Destructor Destroy; override;
    procedure UpdatePosition;
    procedure Hide;
  end;

implementation
Uses
  FileCtrl,
  GlobalSpaceDefines,
  Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  TypesFunctionality,
  unitReflector,
  unitSpaceObjPanelProps,
  unitTSecurityFileInstanceSelector;

{$R *.dfm}


Constructor TfmEditingOrCreatingObjectPanel.Create(pEditingOrCreatingObject: TObject);
begin
Inherited Create(nil);
EditingOrCreatingObject:=pEditingOrCreatingObject;
if TEditingOrCreatingObject(EditingOrCreatingObject).flCreating
 then begin
  lbCommitAction.Caption:='commit create';
  sbClone.Enabled:=false;
  sbReset.Enabled:=false;
  sbShowObjProps.Enabled:=false;
  cbUseInsideObjects.Enabled:=false;
  sbExport.Enabled:=false;
  end
 else begin
  lbCommitAction.Caption:='commit edit';
  sbClone.Enabled:=true;
  sbReset.Enabled:=true;
  sbShowObjProps.Enabled:=true;
  cbUseInsideObjects.Enabled:=true;
  sbExport.Enabled:=true;
  end;
Parent:=nil;
OnMouseWheel:=TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.OnMouseWheel;
OnKeyDown:=TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.OnKeyDown;
OnKeyPress:=TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.OnKeyPress;
Width:=sbFree.Left+sbFree.Width+sbYes.Left;
InitalHeight:=Height;
ObjPropsPanel:=nil;
flCommiting:=false;
end;

Destructor TfmEditingOrCreatingObjectPanel.Destroy;
begin
ObjPropsPanel.Free;
Inherited;
end;

procedure TfmEditingOrCreatingObjectPanel.wmUpdate(var Message: TMessage);

  function ControlFocused(Control: TWinControl): boolean;
  var
    I: integer;
  begin
  Result:=Control.Focused;
  if Result then Exit; //. ->
  with Control do 
  for I:=0 to ControlCount-1 do
    if Controls[I] is TWinControl
     then begin
      Result:=ControlFocused(TWinControl(Controls[I]));
      if Result then Exit; //. ->
      end;
  end;

begin
if (flCommiting) then Exit; //. ->
if ((ObjPropsPanel <> nil) AND (NOT ControlFocused(ObjPropsPanel)))
 then begin
  sbShowObjProps.Down:=false;
  sbShowObjPropsClick(nil);
  end;
//.
TEditingOrCreatingObject(EditingOrCreatingObject)._Reflect(TBitmap(Message.WParam));
//.
UpdatePosition;
//.
TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Update;
//.
BringToFront;
end;

procedure TfmEditingOrCreatingObjectPanel.UpdatePosition;
var
  P: Windows.TPoint;
  L,T: integer;
begin
with TEditingOrCreatingObject(EditingOrCreatingObject),TEditingOrCreatingObject(EditingOrCreatingObject).Handles.Handles[emRotating] do begin
P.X:=Round(BindMarkerX+R+dR); P.Y:=Round(BindMarkerY);
P:=Reflector.ClientToScreen(P);
L:=P.X;
T:=P.Y-Round(InitalHeight/2);
if L+Width > Screen.Width
 then L:=Screen.Width-Width
 else if L < 0 then L:=0;
if T+Height > Screen.Height
 then T:=Screen.Height-Height
 else if T < 0 then T:=0;
Left:=L;
Top:=T;
cbFix.Down:=flBinded;
if (ObjPropsPanel <> nil)
 then begin
  if NOT ObjPropsPanel.Visible then ObjPropsPanel.Show;
  end;
if NOT Visible then Show;
end;
end;

procedure TfmEditingOrCreatingObjectPanel.Hide;
begin
Inherited Hide;
if ObjPropsPanel <> nil then ObjPropsPanel.Hide;
end;

procedure TfmEditingOrCreatingObjectPanel.wmHide(var Message: TMessage);
begin
Hide;
end;

procedure TfmEditingOrCreatingObjectPanel.CommitCreate(const pidSecurityFile: integer);
var
  idClone: integer;
  idSecurityComponent: integer;
begin
flCommiting:=true;
try
idClone:=TEditingOrCreatingObject(EditingOrCreatingObject).Commit();
if (pidSecurityFile <> 0)
 then with TComponentFunctionality_Create(TEditingOrCreatingObject(EditingOrCreatingObject).idTPrototype,idClone) do
  try
  ChangeSecurity(pidSecurityFile);
  {//- old if (GetSecurityComponent(idSecurityComponent))
   then with TSecurityComponentFunctionality(TComponentFunctionality_Create(idTSecurityComponent,idSecurityComponent)) do
    try
    idSecurityFile:=pidSecurityFile;
    finally
    Release;
    end;}
  finally
  Release;
  end;
finally
flCommiting:=false;
end;
end;

procedure TfmEditingOrCreatingObjectPanel.CommitClone(const pidSecurityFile: integer);
var
  idTClone,idClone: integer;
  ptrObj: TPtr;
  idSecurityComponent: integer;
begin
flCommiting:=true;
try
TEditingOrCreatingObject(EditingOrCreatingObject).CloneEditingObject(idTClone,idClone);
with TEditingOrCreatingObject(EditingOrCreatingObject) do begin
ptrObj:=Reflector.Space.TObj_Ptr(idTClone,idClone);
if (ptrObj <> nilPtr) then SetForEdit(ptrObj);
end;
if (pidSecurityFile <> 0)
 then with TComponentFunctionality_Create(idTClone,idClone) do
  try
  if (GetSecurityComponent(idSecurityComponent))
   then with TSecurityComponentFunctionality(TComponentFunctionality_Create(idTSecurityComponent,idSecurityComponent)) do
    try
    idSecurityFile:=pidSecurityFile;
    finally
    Release;
    end;
  finally
  Release;
  end;
finally
flCommiting:=false;
end;
end;

procedure TfmEditingOrCreatingObjectPanel.sbYesClick(Sender: TObject);
begin
if (NOT TEditingOrCreatingObject(EditingOrCreatingObject).flCreating)
 then TEditingOrCreatingObject(EditingOrCreatingObject).Commit
 else popupCreateObject.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfmEditingOrCreatingObjectPanel.sbResetClick(Sender: TObject);
begin
TEditingOrCreatingObject(EditingOrCreatingObject).Reset;
end;

procedure TfmEditingOrCreatingObjectPanel.sbFreeClick(Sender: TObject);
begin
PostMessage(TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Handle, WM_DELETESPUTNIK,0,0);
end;

procedure TfmEditingOrCreatingObjectPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmEditingOrCreatingObjectPanel.sbCloneClick(Sender: TObject);
begin
popupCloneObject.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfmEditingOrCreatingObjectPanel.cbFixClick(Sender: TObject);
begin
TEditingOrCreatingObject(EditingOrCreatingObject).flBinded:=cbFix.Down;
end;

procedure TfmEditingOrCreatingObjectPanel.sbShowPropsPanelClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
with TEditingOrCreatingObject(EditingOrCreatingObject) do begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), PrototypePtr);
if Obj.idObj = 0 then Exit; //. ->
with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
OnKeyDown:=Self.OnKeyDown;
OnKeyUp:=Self.OnKeyUp;
Show;
end;
if Visible then SetFocus;
finally
Release;
end
end;
end;

procedure TfmEditingOrCreatingObjectPanel.sbShowObjPropsClick(Sender: TObject);
const
  Space = 3;
begin
if (sbShowObjProps.Down)
 then with TEditingOrCreatingObject(EditingOrCreatingObject) do begin
  ObjPropsPanel.Free;
  ObjPropsPanel:=TSpaceObj_PanelProps.Create(Reflector,PrototypePtr);
  with TSpaceObj_PanelProps(ObjPropsPanel) do begin
  Position:=poDesigned;
  BorderStyle:=bsNone;
  flFreeOnClose:=false;
  Parent:=Self;
  HideComponentsTree;
  Left:=0;
  Top:=cbUseInsideObjects.Top+cbUseInsideObjects.Height+Space;
  Height:=bvlStrobing.Top+bvlStrobing.Height+Space;
  Self.Height:=Top+Height;
  cbCurrentLay.Enabled:=false;
  Show;
  SetFocus;
  end;
  UpdatePosition;
  TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Update;
  end
 else begin
  ObjPropsPanel.Free;
  ObjPropsPanel:=nil;
  Height:=cbUseInsideObjects.Top+cbUseInsideObjects.Height+Space;
  Update;
  TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Update;
  end;
end;

procedure TfmEditingOrCreatingObjectPanel.cbUseInsideObjectsClick(Sender: TObject);
begin
TEditingOrCreatingObject(EditingOrCreatingObject).UseInsideObjects(cbUseInsideObjects.Checked);
end;

procedure TfmEditingOrCreatingObjectPanel.sbExportClick(Sender: TObject);
const
  DefExportFolder = 'Import';
var
  ComponentsList: TComponentsList;
  I: integer;
  idTROOT,idROOT: integer;
  idTOwner,idOwner: integer;
  _idTObj,_idObj: integer;
  FileName: string;
begin
FileName:=GetCurrentDir+'\'+DefExportFolder;
if NOT SelectDirectory('Select directory ->','',FileName) then Exit; //. ->
with TEditingOrCreatingObject(EditingOrCreatingObject) do begin
//. assuming name
if NOT Reflector.GetObjAsOwnerComponent(PrototypePtr, idTROOT,idROOT)
 then Reflector.Space.Obj_GetROOT(Reflector.Space.Obj_IDType(PrototypePtr),Reflector.Space.Obj_ID(PrototypePtr), idTROOT,idROOT);
with TComponentFunctionality_Create(idTROOT,idROOT) do
try
if GetROOTOwner(idTOwner,idOwner)
 then begin
  _idTObj:=idTOwner;
  _idObj:=idOwner;
  end
 else begin
  _idTObj:=idTObj;
  _idObj:=idObj;
  end;
finally
Release;
end;
with TComponentFunctionality_Create(_idTObj,_idObj) do
try
FileName:=FileName+'\'+Name+'('+IntToStr(idTObj)+';'+IntToStr(idObj)+')'+'.xml';
finally
Release;
end;
//.
ExportAsXML(FileName);
end;
Application.ProcessMessages;
end;

procedure TfmEditingOrCreatingObjectPanel.CreatewithDefaultsecurity1Click(Sender: TObject);
begin
Self.Repaint();
//.
CommitCreate(0);
//. close SPUTNIK
PostMessage(TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Handle, WM_DELETESPUTNIK,0,0);
end;

procedure TfmEditingOrCreatingObjectPanel.CreatewithPrivatesecurity1Click(Sender: TObject);
var
  idSecurityFile: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Space.UserID)) do
try
idSecurityFile:=idSecurityFileForPrivate;
finally
Release;
end;
//.
Self.Repaint();
//.
CommitCreate(idSecurityFile);
//. close SPUTNIK
PostMessage(TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Handle, WM_DELETESPUTNIK,0,0);
end;

procedure TfmEditingOrCreatingObjectPanel.CreatewithOthersecurity1Click(Sender: TObject);
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
if (NOT R)
 then begin
  Self.Repaint();
  Exit; //. ->
  end;
//.
Self.Repaint();
//.
CommitCreate(idSecurityFile);
//. close SPUTNIK
PostMessage(TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Handle, WM_DELETESPUTNIK,0,0);
end;

procedure TfmEditingOrCreatingObjectPanel.Cancel1Click(Sender: TObject);
begin
//. Cancel
Self.Repaint();
end;

procedure TfmEditingOrCreatingObjectPanel.ClonewithDefaultsecurity1Click(Sender: TObject);
begin
Self.Repaint();
try
CommitClone(0);
finally
Self.Repaint();
end;
end;

procedure TfmEditingOrCreatingObjectPanel.ClonewithPrivatesecurity1Click(Sender: TObject);
var
  idSecurityFile: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TEditingOrCreatingObject(EditingOrCreatingObject).Reflector.Space.UserID)) do
try
idSecurityFile:=idSecurityFileForPrivate;
finally
Release;
end;
Self.Repaint();
try
CommitClone(idSecurityFile);
finally
Self.Repaint();
end;
end;

procedure TfmEditingOrCreatingObjectPanel.ClonewithOthersecurity1Click(Sender: TObject);
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
if (NOT R)
 then begin
  Self.Repaint();
  Exit; //. ->
  end;
Self.Repaint();
try
CommitClone(idSecurityFile);
finally
Self.Repaint();
end;
end;

procedure TfmEditingOrCreatingObjectPanel.Cancel2Click(Sender: TObject);
begin
//. Cancel
Self.Repaint();
end;

end.
