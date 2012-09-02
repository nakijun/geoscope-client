unit unitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RxGIF;

type
  TfmAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Timer: TTimer;
    Label5: TLabel;
    Image2: TImage;
    Bevel1: TBevel;
    procedure TimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfmAbout.TimerTimer(Sender: TObject);
begin
with Timer do begin
if Tag < 255 then AlphaBlendValue:=Tag;
Tag:=Tag-1;
if Tag = 1
 then begin
  Timer.Enabled:=false;
  Close;
  end;
end;
end;

procedure TfmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
