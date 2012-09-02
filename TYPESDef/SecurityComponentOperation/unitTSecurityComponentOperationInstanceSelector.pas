unit unitTSecurityComponentOperationInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, Functionality, TypesFunctionality, ImgList, ComCtrls,
  ExtCtrls, StdCtrls;

type
  TfmTSecurityComponentOperationInstanceSelector = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList: TListView;
    procedure lvInstanceListDblClick(Sender: TObject);
  private
    { Private declarations }
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create;
    procedure Update;
    function Select(out idInstance: integer): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmTSecurityComponentOperationInstanceSelector.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TfmTSecurityComponentOperationInstanceSelector.Update;
var
  IL: TList;
  I: integer;
  idInstance: integer;
begin
lvInstanceList.Clear;
lvInstanceList.Items.BeginUpdate;
try
with TTSecurityComponentOperationFunctionality.Create do
try
GetInstanceListByContext('', IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvInstanceList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TSecurityComponentOperationFunctionality(TComponentFunctionality_Create(idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(SQLInfo);
  finally
  Release;
  end;
  end;
  end;
finally
IL.Destroy;
end;
finally
Release;
end;
finally
lvInstanceList.Items.EndUpdate;
end;
end;

function TfmTSecurityComponentOperationInstanceSelector.Select(out idInstance: integer): boolean;
begin
Caption:='Select operation (mouse double click)';
flSelected:=false;
ShowModal;
Result:=false;
if flSelected
 then begin
  idInstance:=Integer(lvInstanceList.Selected.Data);
  Result:=true;
  end;
end;

procedure TfmTSecurityComponentOperationInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if lvInstanceList.Selected <> nil
 then begin
  flSelected:=true;
  Close;
  end;
end;

end.
