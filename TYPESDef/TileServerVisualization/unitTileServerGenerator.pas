unit unitTileServerGenerator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, TypesFunctionality;

type
  TfmTileServerGenerator = class(TForm)
    edLocalTilesFolder: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edDivXPowerOf2: TEdit;
    sbGenerate: TSpeedButton;
    procedure sbGenerateClick(Sender: TObject);
  private
    { Private declarations }
    TileServerVisualizationFunctionality: TTileServerVisualizationFunctionality;
  public
    { Public declarations }
    Constructor Create(const pTileServerVisualizationFunctionality: TTileServerVisualizationFunctionality);
  end;


implementation

{$R *.dfm}


Constructor TfmTileServerGenerator.Create(const pTileServerVisualizationFunctionality: TTileServerVisualizationFunctionality);
begin
Inherited Create(nil);
TileServerVisualizationFunctionality:=pTileServerVisualizationFunctionality;
end;

procedure TfmTileServerGenerator.sbGenerateClick(Sender: TObject);
begin
TileServerVisualizationFunctionality.GenerateFromTiles(edLocalTilesFolder.Text,StrToInt(edDivXPowerOf2.Text));
Close;
end;

end.
 