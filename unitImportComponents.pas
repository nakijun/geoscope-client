unit unitImportComponents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, ShellCtrls;

type
  TfmImportComponents = class(TForm)
    lvImport: TShellListView;
    Panel1: TPanel;
    sbUpFolder: TSpeedButton;
    sbEdit: TSpeedButton;
    Panel2: TPanel;
    procedure sbUpFolderClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); override;
  end;

implementation
Uses
  ShellAPI;

{$R *.dfm}


Constructor TfmImportComponents.Create(AOwner: TComponent);
begin
Inherited Create(AOwner);
lvImport.Root:=GetCurrentDir+'\'+'Import_Shortcuts';
end;

procedure TfmImportComponents.sbUpFolderClick(Sender: TObject);
begin
lvImport.Back;
end;

procedure TfmImportComponents.sbEditClick(Sender: TObject);
begin
ShellExecute(0,nil,PChar(lvImport.Root),nil,nil, SW_SHOW);
end;

end.
