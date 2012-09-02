unit unit3DReflectorCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,
  unitProxySpace, unitReflector, unit3DReflector;

type
  Tfm3DReflectorCfg = class(TForm)
    GroupBox1: TGroupBox;
    cbHideControlBars: TCheckBox;
    cbHideControlPage: TCheckBox;
    cbHideBookmarksPage: TCheckBox;
    cbHideEditPage: TCheckBox;
    cbHideViewPage: TCheckBox;
    Bevel1: TBevel;
    cbHideOtherPage: TCheckBox;
    cbHideCreateButton: TCheckBox;
    cbDisableNavigate: TCheckBox;
    cbDisableMoveNavigate: TCheckBox;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Reflector: TGL3DReflector;
  public
    { Public declarations }
    Constructor Create(pReflector: TGL3DReflector);
    procedure Update;
    procedure Validate;
  end;

implementation

{$R *.dfm}

Constructor Tfm3DReflectorCfg.Create(pReflector: TGL3DReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
Update;
end;

procedure Tfm3DReflectorCfg.Update;
begin
with Reflector.Configuration do begin
cbHideControlBars.Checked:=flHideControlBars;
cbHideControlPage.Checked:=flHideControlPage;
cbHideBookmarksPage.Checked:=flHideBookmarksPage;
cbHideEditPage.Checked:=flHideEditPage;
cbHideViewPage.Checked:=flHideViewPage;
cbHideOtherPage.Checked:=flHideOtherPage;
cbHideCreateButton.Checked:=flHideCreateButton;
cbDisableNavigate.Checked:=flDisableNavigate;
cbDisableMoveNavigate.Checked:=flDisableMoveNavigate;
end;
end;

procedure Tfm3DReflectorCfg.Validate;
begin
with Reflector.Configuration do begin
flHideControlBars:=cbHideControlBars.Checked;
flHideControlPage:=cbHideControlPage.Checked;
flHideBookmarksPage:=cbHideBookmarksPage.Checked;
flHideEditPage:=cbHideEditPage.Checked;
flHideViewPage:=cbHideViewPage.Checked;
flHideOtherPage:=cbHideOtherPage.Checked;
flHideCreateButton:=cbHideCreateButton.Checked;
flDisableNavigate:=cbDisableNavigate.Checked;
flDisableMoveNavigate:=cbDisableMoveNavigate.Checked;
ValidateFlags;
end;
end;

procedure Tfm3DReflectorCfg.SpeedButton1Click(Sender: TObject);
begin
Validate;
Close;
end;

end.
