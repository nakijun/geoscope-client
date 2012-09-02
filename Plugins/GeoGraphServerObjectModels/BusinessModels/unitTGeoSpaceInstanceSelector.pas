unit unitTGeoSpaceInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines, FunctionalityImport, ImgList, ComCtrls,
  ExtCtrls, StdCtrls;

type
  TfmTGeoSpaceInstanceSelector = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList: TListView;
    Image2: TImage;
    procedure lvInstanceListDblClick(Sender: TObject);
  private
    { Private declarations }
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create;
    procedure Update;
    function Select(out idInstance: integer; out InstanceName: string): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmTGeoSpaceInstanceSelector.Create;
begin
Inherited Create(nil);
Update();
end;

procedure TfmTGeoSpaceInstanceSelector.Update;
var
  IL: TList;
  I: integer;
  idInstance: integer;
  TF: TTypeFunctionality;
begin
lvInstanceList.Clear;
lvInstanceList.Items.BeginUpdate;
try
TF:=TTypeFunctionality_Create(idTGeoSpace);
try
TF.GetInstanceList(IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvInstanceList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(IntToStr(idInstance));
  finally
  Release;
  end;
  end;
  end;
finally
IL.Destroy;
end;
finally
TF.Release;
end;
finally
lvInstanceList.Items.EndUpdate;
end;
end;

function TfmTGeoSpaceInstanceSelector.Select(out idInstance: integer; out InstanceName: string): boolean;
begin
Caption:='Select operation (mouse double click)';
flSelected:=false;
ShowModal;
Result:=false;
if (flSelected)
 then begin
  idInstance:=Integer(lvInstanceList.Selected.Data);
  InstanceName:=lvInstanceList.Selected.Caption;
  Result:=true;
  end;
end;

procedure TfmTGeoSpaceInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if (lvInstanceList.Selected <> nil)
 then begin
  flSelected:=true;
  Close;
  end;
end;


end.
