unit unitTexturePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, DBClient, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TTexturePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    lbTexture: TLabel;
    sbLoad: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    edName: TEdit;
    Bevel1: TBevel;
    ScrollBox1: TScrollBox;
    TextureImage: TImage;
    procedure sbLoadClick(Sender: TObject);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure LoadFromFile;
  end;

implementation
{$R *.DFM}

Constructor TTexturePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TTexturePanelProps.Destroy;
begin
Inherited;
end;

procedure TTexturePanelProps._Update;
var
  DATA: TMemoryStream;
begin
Inherited;
TTextureFunctionality(ObjFunctionality).GetBitmapDATA(DATA);
try
edName.Text:=TTextureFunctionality(ObjFunctionality).Name;
TextureImage.Picture.Bitmap.LoadFromStream(DATA);
finally
DATA.Destroy;
end;
end;

procedure TTexturePanelProps.LoadFromFile;
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
 then with TTextureFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing texture ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TTexturePanelProps.sbLoadClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TTexturePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TTextureFunctionality(ObjFunctionality).setName(edName.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TTexturePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTexturePanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;

end.
