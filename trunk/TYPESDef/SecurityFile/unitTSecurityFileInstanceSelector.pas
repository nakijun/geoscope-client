unit unitTSecurityFileInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, Functionality, TypesDefines, TypesFunctionality, ImgList, ComCtrls,
  ExtCtrls, StdCtrls, Buttons;

type
  TfmTSecurityFileInstanceSelector = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList: TListView;
    Image2: TImage;
    sbSecurityFilePropsPanel: TSpeedButton;
    edSecurityFileContext: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edSecurityFileID: TEdit;
    procedure lvInstanceListDblClick(Sender: TObject);
    procedure sbSecurityFilePropsPanelClick(Sender: TObject);
    procedure edSecurityFileContextKeyPress(Sender: TObject;
      var Key: Char);
    procedure edSecurityFileIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create;
    procedure Update();
    procedure UpdateByID();
    function Select(out idInstance: integer): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmTSecurityFileInstanceSelector.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TfmTSecurityFileInstanceSelector.Update();
var
  IL: TList;
  I: integer;
  idInstance: integer;
begin
lvInstanceList.Clear;
if edSecurityFileContext.Text = '' then Exit; //. ->
lvInstanceList.Items.BeginUpdate;
try
with TTSecurityFileFunctionality.Create do
try
GetInstanceListByContext(edSecurityFileContext.Text, IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvInstanceList.Items.Add do begin
  Data:=Pointer(idInstance);
  try
  with TSecurityFileFunctionality(TComponentFunctionality_Create(idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(Info);
  finally
  Release;
  end;
  except
    Caption:='access is denied';
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

procedure TfmTSecurityFileInstanceSelector.UpdateByID();
var
  idInstance: integer;
begin
lvInstanceList.Clear;
if (edSecurityFileID.Text = '') then Exit; //. ->
idInstance:=StrToInt(edSecurityFileID.Text);
//.
lvInstanceList.Items.BeginUpdate;
try
with lvInstanceList.Items.Add do begin
Data:=Pointer(idInstance);
try
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idInstance)) do
try
Check();
Caption:=Name;
ImageIndex:=0;
SubItems.Add(Info);
finally
Release;
end;
except
  Caption:='access is denied';
  end;
end;
finally
lvInstanceList.Items.EndUpdate;
end;
end;

function TfmTSecurityFileInstanceSelector.Select(out idInstance: integer): boolean;
begin
Caption:='Select security file (mouse double click)';
flSelected:=false;
ShowModal;
Result:=false;
if flSelected
 then begin
  idInstance:=Integer(lvInstanceList.Selected.Data);
  Result:=true;
  end;
end;

procedure TfmTSecurityFileInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if lvInstanceList.Selected <> nil
 then begin
  flSelected:=true;
  Close;
  end;
end;

procedure TfmTSecurityFileInstanceSelector.sbSecurityFilePropsPanelClick(Sender: TObject);
begin
if lvInstanceList.Selected = nil then Exit; //. ->
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,Integer(lvInstanceList.Selected.Data))) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TfmTSecurityFileInstanceSelector.edSecurityFileContextKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D) then Update();
end;

procedure TfmTSecurityFileInstanceSelector.edSecurityFileIDKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D) then UpdateByID();
end;


end.
