unit UnitDescriptionPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Functionality;

type
  TDescriptionPanelProps = class(TSpaceObjPanelProps)
    Panel: TPanel;
    Text: TMemo;
    procedure TextKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    flChanged: boolean;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure ShowPanelControlElements; override;
    procedure WMDropFiles(var msg : TMessage); message WM_DROPFILES;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure SaveChanges; override;
    procedure Save;
  end;

implementation
Uses
  ShellAPI,TypesDefines,TypesFunctionality;

{$R *.DFM}

Constructor TDescriptionPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flChanged:=false;
DragAcceptFiles(Handle, true);
Update;
end;

destructor TDescriptionPanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TDescriptionPanelProps._Update;
var
  SL: TStringList;
begin
Inherited;
//.
if NOT ObjFunctionality.flDATAPresented
 then begin
  SL:=TStringList.Create;
  try
  TDescriptionFunctionality(ObjFunctionality).GetValue(SL);
  Text.Lines.Assign(SL);
  finally
  SL.Destroy;
  end
  end
 else
  Text.Lines.Assign(TDescriptionFunctionality(ObjFunctionality)._DATA);
//.
if (Panel <> nil) then Panel.Color:=clBtnFace;
end;

procedure TDescriptionPanelProps.SaveChanges;
begin
if flChanged then Save;
Inherited;
end;

procedure TDescriptionPanelProps.WMDropFiles(var Msg: TMessage);
var
  i,n: DWord;
  Size: DWord;
  FName: String;
  HDrop: DWord;
  SL: TStringList;
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
    with TDescriptionFunctionality(ObjFunctionality) do begin
    if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationStarting('description saving ...');
    try
    SL:=TStringList.Create;
    try
    SL.LoadFromFile(FName);
    SetValue(SL);
    finally
    SL.Destroy;
    end;
    finally
    if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationDone;
    end;
    end;
    end;
  end;
Msg.Result:=0;
end;

procedure TDescriptionPanelProps.Save;
var
  SL: TStringList;
begin
Updater.Disable;
try
with TDescriptionFunctionality(ObjFunctionality) do begin
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationStarting('description saving ...');
try
SL:=TStringList.Create;
try
SL.Assign(Text.Lines);
SetValue(SL);
finally
SL.Destroy;
end;
finally
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationDone;
end;
end;
except
  Updater.Enabled;
  Raise; //.=>
  end;
flChanged:=false;
end;

procedure TDescriptionPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TDescriptionPanelProps.TextKeyPress(Sender: TObject; var Key: Char);
begin
flChanged:=true;
end;

procedure TDescriptionPanelProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if flChanged then Save;
end;

procedure TDescriptionPanelProps.Controls_ClearPropData;
begin
Text.Text:='';
end;

procedure TDescriptionPanelProps.ShowPanelControlElements;
begin
Inherited;
end;


end.
