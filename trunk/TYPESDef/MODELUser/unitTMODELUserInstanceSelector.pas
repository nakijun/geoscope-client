unit unitTMODELUserInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, Functionality, TypesFunctionality, ImgList, ComCtrls,
  ExtCtrls, StdCtrls;

type
  TfmTMODELUserInstanceSelector = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList: TListView;
    Image2: TImage;
    procedure lvInstanceListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create;
    procedure Clear;
    procedure AddUser(const idUser: integer);
  end;

implementation
Uses
  TypesDefines;
  

{$R *.dfm}


Constructor TfmTMODELUserInstanceSelector.Create;
begin
Inherited Create(nil);
Clear;
end;

procedure TfmTMODELUserInstanceSelector.Clear;
begin
lvInstanceList.Clear;
end;

procedure TfmTMODELUserInstanceSelector.AddUser(const idUser: integer);
begin
with lvInstanceList.Items.Add,TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Caption:=Name;
Data:=Pointer(idUser);
SubItems.Add(FullName);
finally
Release;
end;
end;

procedure TfmTMODELUserInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if lvInstanceList.Selected <> nil
 then with TComponentFunctionality_Create(idTMODELUSer,Integer(lvInstanceList.Selected.Data)) do
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

procedure TfmTMODELUserInstanceSelector.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
