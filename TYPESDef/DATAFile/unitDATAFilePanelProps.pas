unit unitDATAFilePanelProps;

interface

uses
  UnitProxySpace, Windows, ShellAPI, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector, Sockets,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, unitSpaceDataServerClient,
  Menus;

type
  TDATAFilePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    sbActivate: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    popupActivateBtn: TPopupMenu;
    NLoadFromFile: TMenuItem;
    NEmpty: TMenuItem;
    procedure sbActivateClick(Sender: TObject);
    procedure NLoadFromFileClick(Sender: TObject);
    procedure NEmptyClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure WMDropFiles(var msg : TMessage); message WM_DROPFILES;
    procedure DoOnReadProgress(const Size: Int64; const ReadSize: Int64);
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure Activate;
    procedure LoadFromFile;
    procedure Empty;
  end;

implementation
uses
  unitComponentStreamLoadingProgressPanel;
{$R *.DFM}


Constructor TDATAFilePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
DragAcceptFiles(Handle, true);
Update;
try
/// ? Activate;
except
  MessageDlg('autorun error', mtWarning, [mbOK], 0);
  end;
end;

destructor TDATAFilePanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TDATAFilePanelProps._Update;
begin
Inherited;
if NOT TDATAFileFunctionality(ObjFunctionality).IsNull
 then begin
  sbActivate.Caption:='START';
  NEmpty.Enabled:=true;
  OnClick:=sbActivateClick;
  end
 else begin
  sbActivate.Caption:='no data';
  NEmpty.Enabled:=false;
  OnClick:=nil;
  end;
end;

procedure TDATAFilePanelProps.Activate;
var
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
  FN: string;
begin
case (TDATAFileStorageType(TDATAFileFunctionality(ObjFunctionality).StorageType)) of
dfstFile: begin
  ServerAddress:=ObjFunctionality.Space.SOAPServerURL;
  UserName:=ObjFunctionality.Space.UserName;
  UserPassword:=ObjFunctionality.Space.UserPassword;
  SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
  Idx:=Pos('http://',ServerAddress);
  if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
  //.
  with ObjFunctionality.Space do FN:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+UserName+'\'+ChangeFileExt(ContextFileName,'')+'\'+'TypesSystem'+'\'+'DATAFile';
  ForceDirectories(FN);
  FN:=FN+'\'+IntToStr(ObjFunctionality.idObj)+TDATAFileFunctionality(ObjFunctionality).DATAType;
  //.
  with TfmComponentStreamLoadingProgressPanel.Create(ServerAddress,0{to DefaultPort}, UserName,UserPassword, ObjFunctionality.idTObj,ObjFunctionality.idObj, IntToStr(ObjFunctionality.idObj), FN) do
  try
  if (Process())
   then begin
    ShellExecute(0,nil,PChar(FileName),nil,nil, 1);
    end;
  finally
  Destroy();
  end;
  end;
else
  TDATAFileFunctionality(ObjFunctionality).Activate();
end;
end;

procedure TDATAFilePanelProps.WMDropFiles(var Msg: TMessage);
var
  i,n: DWord;
  Size: DWord;
  FName: String;
  HDrop: DWord;
begin
HDrop:=Msg.WParam;
n:=DragQueryFile(HDrop,$FFFFFFFF,NIL,0);
for i:=0 to n-1 do begin
  Size:=DragQueryFile(HDrop,i,NIL,0);
  if Size < 255
   then begin
    SetLength(FName,Size);
    DragQueryFile(HDrop,i,@FName[1],Size + 1);
    //. loading data
    with TDATAFileFunctionality(ObjFunctionality) do begin
    Space.Log.OperationStarting('loading data ...');
    try
    LoadFromFile(FName);
    finally
    Space.Log.OperationDone;
    end;
    end;
    end;
  end;
Msg.Result:=0;
end;

procedure TDATAFilePanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TDATAFileFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('file saving ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TDATAFilePanelProps.Empty;
begin
TDATAFileFunctionality(ObjFunctionality).Empty;
end;

procedure TDATAFilePanelProps.DoOnReadProgress(const Size: Int64; const ReadSize: Int64);
begin
Application.Title:=IntToStr(ReadSize)+'/'+IntToStr(Size);
end;

procedure TDATAFilePanelProps.sbActivateClick(Sender: TObject);
begin
Activate();
end;

procedure TDATAFilePanelProps.NLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TDATAFilePanelProps.NEmptyClick(Sender: TObject);
begin
if MessageDlg('Clear data ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then Empty;
end;

procedure TDATAFilePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TDATAFilePanelProps.Controls_ClearPropData;
begin
sbActivate.Caption:='';
end;

end.
