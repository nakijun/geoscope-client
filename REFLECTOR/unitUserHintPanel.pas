unit unitUserHintPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Buttons, ExtDlgs;

type
  TfmUserHintPanel = class(TForm)
    imgInfoImage: TImage;
    edInfoText: TEdit;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    PopupMenu: TPopupMenu;
    ChangeImage1: TMenuItem;
    Changetextfont1: TMenuItem;
    Changetextfontcolor1: TMenuItem;
    bbOk: TBitBtn;
    OpenPictureDialog: TOpenPictureDialog;
    N1: TMenuItem;
    N2: TMenuItem;
    Clearbackgroundcolor1: TMenuItem;
    Panel1: TPanel;
    cbTracking: TCheckBox;
    ClearImage1: TMenuItem;
    cbAlwaysCheckVisibility: TCheckBox;
    procedure Changetextfont1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure ChangeImage1Click(Sender: TObject);
    procedure Changetextfontcolor1Click(Sender: TObject);
    procedure Clearbackgroundcolor1Click(Sender: TObject);
    procedure ClearImage1Click(Sender: TObject);
  private
    { Private declarations }
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create;
    function Accepted: boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmUserHintPanel.Create;
begin
Inherited Create(nil);
end;

function TfmUserHintPanel.Accepted: boolean;
begin
flAccepted:=false;
ShowModal();
Result:=flAccepted;
end;

procedure TfmUserHintPanel.Changetextfont1Click(Sender: TObject);
begin
FontDialog.Font:=edInfoText.Font;
if (FontDialog.Execute) then edInfoText.Font:=FontDialog.Font;
end;

procedure TfmUserHintPanel.bbOkClick(Sender: TObject);
begin
flAccepted:=true;
Close();
end;

procedure TfmUserHintPanel.ChangeImage1Click(Sender: TObject);
begin
if (OpenPictureDialog.Execute) then imgInfoImage.Picture.LoadFromFile(OpenPictureDialog.FileName);
end;

procedure TfmUserHintPanel.ClearImage1Click(Sender: TObject);
begin
imgInfoImage.Picture.Bitmap.Width:=0;
imgInfoImage.Picture.Bitmap.Height:=0;
end;

procedure TfmUserHintPanel.Changetextfontcolor1Click(Sender: TObject);
begin
ColorDialog.Color:=Color;
if (ColorDialog.Execute)
 then begin
  Color:=ColorDialog.Color;
  edInfoText.Color:=ColorDialog.Color;
  end;
end;

procedure TfmUserHintPanel.Clearbackgroundcolor1Click(Sender: TObject);
begin
Color:=clNone;
edInfoText.Color:=clNone;
end;


end.
 