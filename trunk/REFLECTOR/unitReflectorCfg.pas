unit unitReflectorCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons,
  unitProxySpace, unitReflector;

type
  TfmReflectorCfg = class(TForm)
    GroupBox1: TGroupBox;
    cbDisableObjectChanging: TCheckBox;
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
    cbHideCoordinateMeshPage: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
  public
    { Public declarations }
    Constructor Create(pReflector: TReflector);
    procedure Update;
    procedure Validate;
  end;

implementation

{$R *.dfm}

Constructor TfmReflectorCfg.Create(pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
Update;
end;

procedure TfmReflectorCfg.Update;
begin
with Reflector.Configuration do begin
cbDisableObjectChanging.Checked:=flDisableObjectChanging;
cbHideControlBars.Checked:=flHideControlBars;
cbHideControlPage.Checked:=flHideControlPage;
cbHideBookmarksPage.Checked:=flHideBookmarksPage;
cbHideEditPage.Checked:=flHideEditPage;
cbHideViewPage.Checked:=flHideViewPage;
cbHideOtherPage.Checked:=flHideOtherPage;
cbHideCreateButton.Checked:=flHideCreateButton;
cbDisableNavigate.Checked:=flDisableNavigate;
cbDisableMoveNavigate.Checked:=flDisableMoveNavigate;
cbHideCoordinateMeshPage.Checked:=flHideCoordinateMeshPage;
end;
end;

procedure TfmReflectorCfg.Validate;
begin
with Reflector.Configuration do begin
flDisableObjectChanging:=cbDisableObjectChanging.Checked;
flHideControlBars:=cbHideControlBars.Checked;
flHideControlPage:=cbHideControlPage.Checked;
flHideBookmarksPage:=cbHideBookmarksPage.Checked;
flHideEditPage:=cbHideEditPage.Checked;
flHideViewPage:=cbHideViewPage.Checked;
flHideOtherPage:=cbHideOtherPage.Checked;
flHideCreateButton:=cbHideCreateButton.Checked;
flDisableNavigate:=cbDisableNavigate.Checked;
flDisableMoveNavigate:=cbDisableMoveNavigate.Checked;
flHideCoordinateMeshPage:=cbHideCoordinateMeshPage.Checked;
//.
ValidateFlags;
Reflector.FormResize(nil);
end;
end;

procedure TfmReflectorCfg.SpeedButton1Click(Sender: TObject);
begin
Validate;
Close;
end;

end.
