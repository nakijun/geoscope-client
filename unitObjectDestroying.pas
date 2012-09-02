unit unitObjectDestroying;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TObjectDestroying = class(TForm)
    Animate1: TAnimate;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButtonDestroy: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure SpeedButtonDestroyClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    flDestroy: boolean;

    Constructor Create;
  end;

implementation

{$R *.DFM}

Constructor TObjectDestroying.Create;
begin
Inherited Create(nil);
flDestroy:=false;
Left:=Screen.DesktopWidth-Width;
Top:=0;
end;

procedure TObjectDestroying.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TObjectDestroying.SpeedButtonDestroyClick(Sender: TObject);
begin
flDestroy:=true;
Close;
Application.ProcessMessages;
end;

procedure TObjectDestroying.SpeedButton1Click(Sender: TObject);
begin
Close;
end;

end.
