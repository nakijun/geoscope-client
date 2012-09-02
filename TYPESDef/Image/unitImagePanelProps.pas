unit UnitImagePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Functionality,
  Menus, ExtDlgs;

type
  TImagePanelProps = class(TSpaceObjPanelProps)
    Image_Popup: TPopupMenu;
    LoadFromFileItem: TMenuItem;
    SaveInFileItem: TMenuItem;
    ReloadItem: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    Panel: TPanel;
    Image: TImage;
    procedure LoadFromFileItemClick(Sender: TObject);
    procedure SaveInFileItemClick(Sender: TObject);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ReloadItemClick(Sender: TObject);
  private
    { Private declarations }
    flImageLoaded: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    function LoadFromDatabase(): boolean;
    procedure ShowPanelControlElements; override;
    procedure WMDropFiles(var msg : TMessage); message WM_DROPFILES;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure LoadFromFile;
    procedure SaveInFile;
    procedure OpenImageOutside();
  end;

implementation
Uses
  ShellAPI, TypesDefines,TypesFunctionality;

{$R *.DFM}



Constructor TImagePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
DragAcceptFiles(Handle, true);
Update;
end;

destructor TImagePanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TImagePanelProps._Update;
begin
Inherited;
//.
if (NOT LoadFromDatabase())
 then begin
  Image.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'\TypesDef\Image\ZeroImage.ico');
  Image.Hint:='click for viewing';
  end;
//.
if (Panel <> nil) then Panel.Color:=clBtnFace;
end;

procedure TImagePanelProps.WMDropFiles(var Msg: TMessage);
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
    with TImageFunctionality(ObjFunctionality) do begin
    Space.Log.OperationStarting('importing image ...');
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

function TImagePanelProps.LoadFromDatabase(): boolean;
var
  BMPStream: TMemoryStream;
begin
Result:=false;
if (ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief]) then ObjFunctionality.Space.Log.OperationStarting('image loading ...');
try
if (NOT ObjFunctionality.flDATAPresented)
 then begin
  if (TImageFunctionality(ObjFunctionality).DataSize <= ObjFunctionality.Space.Configuration.RemoteStatusLoadingComponentMaxSize)
   then begin
    TImageFunctionality(ObjFunctionality).GetBitmapData(BMPStream);
    try
    if BMPStream.Size <> 0
     then Image.Picture.Bitmap.LoadFromStream(BMPStream)
     else Image.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'\TypesDef\Image\ZeroImage.ico');
    finally
    BMPStream.Destroy;
    end;
    Result:=true;
    end;
  end
 else begin
  if (TImageFunctionality(ObjFunctionality)._DATA.Size <> 0)
   then Image.Picture.Bitmap.LoadFromStream(TImageFunctionality(ObjFunctionality)._DATA)
   else Image.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'\TypesDef\Image\ZeroImage.ico');
  Result:=true;
  end;
finally
if (ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief]) then ObjFunctionality.Space.Log.OperationDone();
end;
flImageLoaded:=Result;
end;

procedure TImagePanelProps.LoadFromFile;
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
 then with TImageFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing image ...');
  try
  LoadFromFile(OpenPictureDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TImagePanelProps.SaveInFile;
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
 then with TImageFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('exporting image ...');
  try
  if Image.Picture.Bitmap.Empty
   then begin
    TImageFunctionality(ObjFunctionality).GetBitmapDATA(BMPStream);
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

procedure TImagePanelProps.OpenImageOutside();
var
  FN: string;
begin
FN:=ExtractFilePath(ParamStr(0))+'\'+PathTempDATA+'\'+'Image'+FormatDateTime('DDMMYYHHNNSS',Now)+'.bmp';;
Image.Picture.Bitmap.SaveToFile(FN);
ShellExecute(Application.Handle,'open',PChar(FN),nil,nil, SW_MAX);
end;

procedure TImagePanelProps.LoadFromFileItemClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TImagePanelProps.SaveInFileItemClick(Sender: TObject);
begin
SaveInFile;
end;

procedure TImagePanelProps.ReloadItemClick(Sender: TObject);
begin
LoadFromDatabase;
end;

procedure TImagePanelProps.ImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if (Button = mbLeft)
 then
  if (NOT flImageLoaded)
   then LoadFromDatabase()
   else OpenImageOutside();
end;

procedure TImagePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TImagePanelProps.Controls_ClearPropData;
begin
Image.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'\TypesDef\Image\ZeroImage.ico');
end;

procedure TImagePanelProps.ShowPanelControlElements;
begin
Inherited;
end;


end.
