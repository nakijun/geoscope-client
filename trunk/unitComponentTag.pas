unit unitComponentTag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmComponentTag = class(TForm)
    Label1: TLabel;
    edTag: TEdit;
    procedure edTagKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    idTComponent: integer;
    idComponent: integer;
  public
    { Public declarations }
    Constructor Create(const pidTComponent,pidComponent: integer);
    procedure Update;
  end;

implementation
Uses
  Functionality;

{$R *.dfm}


Constructor TfmComponentTag.Create(const pidTComponent,pidComponent: integer);
begin
Inherited Create(nil);
idTComponent:=pidTComponent;
idComponent:=pidComponent;
Update;
end;

procedure TfmComponentTag.Update;
begin
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
edTag.Text:=IntToStr(Tag);
finally
Release;
end;
end;

procedure TfmComponentTag.edTagKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  with TComponentFunctionality_Create(idTComponent,idComponent) do
  try
  Tag:=StrToInt(edTag.Text);
  finally
  Release;
  end;
  Close;
  end;
end;


end.
