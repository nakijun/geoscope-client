unit unitGeographServerLogPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmGeographServerLogPanel = class(TForm)
    memoLog: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create;
  end;

implementation

{$R *.dfm}


Constructor TfmGeographServerLogPanel.Create;
begin
Inherited Create(nil);
end;

procedure TfmGeographServerLogPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
