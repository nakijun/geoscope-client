unit unitConfigurationPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unitConfiguration;

type
  TfmProgramConfigurationPanel = class(TForm)
    ProxySpace_cbflSynchronizeUserProfileWithServer: TCheckBox;
    procedure ProxySpace_cbflSynchronizeUserProfileWithServerClick(
      Sender: TObject);
  private
    { Private declarations }
    ProgramConfiguration: TProgramConfiguration;
  public
    { Public declarations }
    Constructor Create(const pProgramConfiguration: TProgramConfiguration);
    procedure Update(); reintroduce;
  end;


implementation

{$R *.dfm}


Constructor TfmProgramConfigurationPanel.Create(const pProgramConfiguration: TProgramConfiguration);
begin
Inherited Create(nil);
ProgramConfiguration:=pProgramConfiguration;
Update();
end;

procedure TfmProgramConfigurationPanel.Update();
begin
ProxySpace_cbflSynchronizeUserProfileWithServer.Checked:=ProgramConfiguration.ProxySpace_flSynchronizeUserProfileWithServer;
end;

procedure TfmProgramConfigurationPanel.ProxySpace_cbflSynchronizeUserProfileWithServerClick(Sender: TObject);
begin
ProgramConfiguration.ProxySpace_flSynchronizeUserProfileWithServer:=ProxySpace_cbflSynchronizeUserProfileWithServer.Checked;
end;


end.
