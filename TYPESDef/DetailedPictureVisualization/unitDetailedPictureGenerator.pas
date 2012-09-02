unit unitDetailedPictureGenerator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, TypesFunctionality;

type
  TfmDetailedPictureGenerator = class(TForm)
    edLocalTilesFolder: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edDivXPowerOf2: TEdit;
    sbGenerate: TSpeedButton;
    procedure sbGenerateClick(Sender: TObject);
  private
    { Private declarations }
    DetailedPictureVisualizationFunctionality: TDetailedPictureVisualizationFunctionality;
  public
    { Public declarations }
    Constructor Create(const pDetailedPictureVisualizationFunctionality: TDetailedPictureVisualizationFunctionality);
  end;


implementation

{$R *.dfm}


Constructor TfmDetailedPictureGenerator.Create(const pDetailedPictureVisualizationFunctionality: TDetailedPictureVisualizationFunctionality);
begin
Inherited Create(nil);
DetailedPictureVisualizationFunctionality:=pDetailedPictureVisualizationFunctionality;
end;

procedure TfmDetailedPictureGenerator.sbGenerateClick(Sender: TObject);
begin
DetailedPictureVisualizationFunctionality.GenerateFromTiles(edLocalTilesFolder.Text,StrToInt(edDivXPowerOf2.Text));
Close;
end;

end.
 