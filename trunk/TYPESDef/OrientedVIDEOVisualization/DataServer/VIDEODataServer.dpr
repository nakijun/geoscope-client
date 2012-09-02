program VIDEODataServer;

uses
  Forms,
  unitVIDEODataServer in 'unitVIDEODataServer.pas' {fmVIDEODataServer},
  VIDEODataServer_TLB in 'VIDEODataServer_TLB.pas',
  unitCoVIDEOData in 'unitCoVIDEOData.pas' {coVIDEOData: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm:=false;
  Application.CreateForm(TfmVIDEODataServer, fmVIDEODataServer);
  Application.Run;
end.
