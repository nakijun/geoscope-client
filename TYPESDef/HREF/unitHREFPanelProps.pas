unit unitHREFPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShellAPI,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, DBClient, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  THREFPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    OpenFileDialog: TOpenDialog;
    edURL: TEdit;
    Label1: TLabel;
    sbOpen: TSpeedButton;
    cbAutostart: TCheckBox;
    sbDownload: TSpeedButton;
    procedure edURLKeyPress(Sender: TObject; var Key: Char);
    procedure cbAutostartClick(Sender: TObject);
    procedure sbOpenClick(Sender: TObject);
    procedure sbDownloadClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure Activate;
  end;

implementation
Uses
  unitINetFileDownloader;

{$R *.DFM}

Constructor THREFPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
try
if THREFFunctionality(ObjFunctionality).AutoStart then Activate;
except
  MessageDlg('autorun error', mtWarning, [mbOK], 0);
  end;
end;

destructor THREFPanelProps.Destroy;
begin
Inherited;
end;

procedure THREFPanelProps._Update;
begin
Inherited;
edURL.Text:=THREFFunctionality(ObjFunctionality).URL;
edURL.Hint:=edURL.Text;
edURL.ShowHint:=true;
with cbAutoStart do begin
OnClick:=nil;
Checked:=THREFFunctionality(ObjFunctionality).AutoStart;
OnClick:=cbAutostartClick;
end;
end;

procedure THREFPanelProps.Activate;
var
  URL: ANSIString;
begin
URL:=THREFFunctionality(ObjFunctionality).URL;
if NOT ((Length(URL) > 0) AND (URL[Length(URL)] = '\'))
 then with TfmInetFileDownloader.Create(URL,true) do Show
 else ShellExecute(0,nil,PChar('C:\Program Files\Internet Explorer\IExplore.exe'),PChar(String(THREFFunctionality(ObjFunctionality).URL)),nil, 1);
end;

procedure THREFPanelProps.edURLKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  THREFFunctionality(ObjFunctionality).URL:=edURL.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure THREFPanelProps.cbAutostartClick(Sender: TObject);
begin
Updater.Disable;
try
THREFFunctionality(ObjFunctionality).AutoStart:=cbAutostart.Checked;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure THREFPanelProps.sbOpenClick(Sender: TObject);
begin
Activate;
end;

procedure THREFPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure THREFPanelProps.Controls_ClearPropData;
begin
edURL.Text:='';
cbAutoStart.OnClick:=nil;
cbAutoStart.Checked:=false;
end;

procedure THREFPanelProps.sbDownloadClick(Sender: TObject);
begin
with TfmInetFileDownloader.Create(THREFFunctionality(ObjFunctionality).URL,false) do Show;
end;

end.
