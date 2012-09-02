program ReleaseInstaller;

uses
  Forms,
  unitReleaseInstaller in 'unitReleaseInstaller.pas' {fmReleaseInstaller};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmReleaseInstaller, fmReleaseInstaller);
  Application.Run;
end.
