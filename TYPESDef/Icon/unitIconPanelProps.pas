unit UnitIconPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Functionality,
  Menus, ExtDlgs;

type
  TIconPanelProps = class(TSpaceObjPanelProps)
    Image_Popup: TPopupMenu;
    LoadFromFileItem: TMenuItem;
    SaveInFileItem: TMenuItem;
    ReloadItem: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    Image: TImage;
    Bevel: TBevel;
    procedure LoadFromFileItemClick(Sender: TObject);
    procedure SaveInFileItemClick(Sender: TObject);
    procedure ReloadItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromDatabase;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure LoadFromFile;
    procedure SaveInFile;
  end;

implementation
Uses
  TypesDefines,TypesFunctionality;

{$R *.DFM}



Constructor TIconPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TIconPanelProps.Destroy;
begin
Inherited;
end;

procedure TIconPanelProps._Update;
begin
Inherited;
LoadFromDatabase;
end;

procedure TIconPanelProps.LoadFromDatabase;
var
  BMPStream: TMemoryStream;
begin
if ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then ObjFunctionality.Space.Log.OperationStarting('image loading ...');
try
TIconFunctionality(ObjFunctionality).GetBitmapData(BMPStream);
try
if BMPStream.Size <> 0
 then
  Image.Picture.Bitmap.LoadFromStream(BMPStream)
 else with Image.Picture.Bitmap,Image.Picture.Bitmap.Canvas do begin
  Width:=32;
  Height:=32;
  Pen.Color:=clBlack;
  Brush.Color:=clWhite;
  Rectangle(0,0,Width,Height);
  end;
finally
BMPStream.Destroy;
end;
finally
if ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then ObjFunctionality.Space.Log.OperationDone;
end;
end;

procedure TIconPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=OpenPictureDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TIconFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing image ...');
  try
  LoadFromFile(OpenPictureDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TIconPanelProps.SaveInFile;
var
  CD: string;
  R: boolean;
  BMPStream: TMemoryStream;
begin
CD:=GetCurrentDir;
try
R:=SavePictureDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TIconFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('exporting image ...');
  try
  if Image.Picture.Bitmap.Empty
   then begin
    TIconFunctionality(ObjFunctionality).GetBitmapDATA(BMPStream);
    try
    BMPStream.SaveToFile(SavePictureDialog.FileName);
    finally
    BMPStream.Destroy;
    end;
    end
   else
    Image.Picture.Bitmap.SaveToFile(SavePictureDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TIconPanelProps.LoadFromFileItemClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TIconPanelProps.SaveInFileItemClick(Sender: TObject);
begin
SaveInFile;
end;

procedure TIconPanelProps.ReloadItemClick(Sender: TObject);
begin
LoadFromDatabase;
end;

procedure TIconPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TIconPanelProps.Controls_ClearPropData;
begin
Image.Picture.Bitmap.Empty;
end;


end.
