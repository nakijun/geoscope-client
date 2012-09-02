program TypesFunctionalityExporter;

uses
  Forms,
  unitTypesFunctionalityExporter in 'unitTypesFunctionalityExporter.pas' {fmTypesFunctionalityExporter};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmTypesFunctionalityExporter, fmTypesFunctionalityExporter);
  Application.Run;
end.
