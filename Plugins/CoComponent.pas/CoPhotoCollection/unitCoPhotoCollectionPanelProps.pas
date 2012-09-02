unit unitCoPhotoCollectionPanelProps;

interface
                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoComponentRepresentations, unitCoPhotoCollectionFunctionality,
  unitCoPhotoFunctionality, StdCtrls, ExtCtrls, Buttons,
  ComCtrls, ImgList;

type
  TCoPhotoCollectionPanelProps = class(TCoComponentPanelProps)
    pnlTitle: TPanel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    sbGallery: TScrollBox;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    procedure sbGallery_Update;
    procedure sbGallery_DoOnPhotoClick(Sender: TObject);
  end;

implementation
Uses
  unitCoPhotoPanelProps;

{$R *.dfm}


Constructor TCoPhotoCollectionPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoPhotoCollectionPanelProps.Destroy;
begin
//. clear old
sbGallery.DestroyComponents;
Inherited;
end;

procedure TCoPhotoCollectionPanelProps._Update;
begin
pnlTitle.OnDblClick:=OnDblClick;
//.
with TCoPhotoCollectionFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
finally
Release;
end;
sbGallery_Update;
end;

procedure TCoPhotoCollectionPanelProps.sbGallery_Update;
const
  PhotoInterval = 16;
  PhotoOffset = 16;
var
  Photos: TList;
  I: integer;
  Y: integer;
  BMP: TBitmap;
  PhotoImage: TImage;
begin
//. clear old
sbGallery.DestroyComponents;
//.
ProxySpace__Log_OperationStarting('gallery loading ...');
try
sbGallery.HorzScrollBar.Position:=0;
sbGallery.VertScrollBar.Position:=0;
with TCoPhotoCollectionFunctionality.Create(idCoComponent) do
try
GetPhotoList(Photos);
try
Y:=PhotoInterval;
for I:=0 to Photos.Count-1 do with TCoPhotoFunctionality.Create(Integer(Photos[I])) do
  try
  try
  with TLabel.Create(sbGallery) do begin
  Tag:=Integer(Photos[I]);
  AutoSize:=true;
  Color:=clWhite;
  Font.Color:=clBlack;
  Font.Size:=10;
  Font.Style:=[fsBold];
  Caption:=getName;
  Left:=PhotoOffset;
  Top:=Y;
  Cursor:=crHandPoint;
  OnClick:=sbGallery_DoOnPhotoClick;
  Parent:=sbGallery;
  Show;
  Inc(Y,Height);
  end;
  GetPreview(BMP);
  try
  PhotoImage:=TImage.Create(sbGallery);
  with PhotoImage do begin
  Tag:=Integer(Photos[I]);
  AutoSize:=true;
  Picture.Bitmap.Width:=BMP.Width;
  Picture.Bitmap.Height:=BMP.Height;
  Picture.Bitmap.Canvas.Draw(0,0, BMP);
  Left:=PhotoOffset;
  Top:=Y;
  Parent:=sbGallery;
  Cursor:=crHandPoint;
  OnClick:=sbGallery_DoOnPhotoClick;
  Show;
  Inc(Y,Height+PhotoInterval);
  end;
  finally
  BMP.Destroy;
  end;
  finally
  Release;
  end;
  except
    end;
finally
Photos.Destroy;
end;
finally
Release;
end;
finally
ProxySpace__Log_OperationDone;
end;
end;

procedure TCoPhotoCollectionPanelProps.sbGallery_DoOnPhotoClick(Sender: TObject);

begin
with TCoPhotoPanelProps.Create(TWinControl(Sender).Tag) do Show;
end;

procedure TCoPhotoCollectionPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoPhotoCollectionFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

end.
