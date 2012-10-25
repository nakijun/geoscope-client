unit unitTMODELUserInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  FunctionalityImport, TypesDefines, ImgList, ComCtrls,
  ExtCtrls, StdCtrls, Buttons;

const
  UserListMaxSize = 25;
  UserOnLineMaxDelay = 30/(3600.0*24);
  lvInstanceList_Color = clWhite;
  lvInstanceList_FontColor = clBlack;
type
  TUserItem = record
    idUser: integer;
    flOnline: boolean;
  end;

  TUserItems = array of TUserItem;

  TfmTMODELUserInstanceSelector = class(TForm)
    lvInstanceList: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    edNameContext: TEdit;
    Label2: TLabel;
    edDomains: TEdit;
    btnSearchByDomains: TBitBtn;
    btnSearchByNameContext: TBitBtn;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnShowPropsPanel: TBitBtn;
    procedure lvInstanceListDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSearchByDomainsClick(Sender: TObject);
    procedure btnSearchByNameContextClick(Sender: TObject);
    procedure edDomainsKeyPress(Sender: TObject; var Key: Char);
    procedure edNameContextKeyPress(Sender: TObject; var Key: Char);
    procedure lvInstanceListAdvancedCustomDrawSubItem(
      Sender: TCustomListView; Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure btnShowPropsPanelClick(Sender: TObject);
  private
    { Private declarations }
    UserItems: TUserItems;
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create();
    procedure Clear();
    procedure SearchByName(const pNameContext: string);
    procedure SearchByDomains(const pDomains: string);
    function Select(out idUser: integer): boolean;
  end;

implementation


{$R *.dfm}


Constructor TfmTMODELUserInstanceSelector.Create();
begin
Inherited Create(nil);
Clear();
end;

procedure TfmTMODELUserInstanceSelector.Clear();
begin
lvInstanceList.Clear;
end;

function TfmTMODELUserInstanceSelector.Select(out idUser: integer): boolean;
begin
idUser:=0;
flSelected:=false;
ShowModal();
if (flSelected AND (lvInstanceList.ItemIndex <> -1))
 then begin
  idUser:=UserItems[lvInstanceList.ItemIndex].idUser;
  //.
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmTMODELUserInstanceSelector.SearchByName(const pNameContext: string);
var
  IL: TList;
  Cnt: integer;
  I: integer;
  idUser: integer;
begin
lvInstanceList.Items.BeginUpdate();
try
lvInstanceList.Items.Clear();
with TTMODELUserFunctionality(TTypeFunctionality_Create(idTMODELUser)) do
try
GetInstanceListByContext1(pNameContext,{out} IL);
try
Cnt:=IL.Count;
if (Cnt > UserListMaxSize)
 then begin
  Cnt:=UserListMaxSize;
  ShowMessage('User list is too long, list will be truncated to maximum allowed ('+IntToStr(Cnt)+')');
  end;
SetLength(UserItems,Cnt);
for I:=0 to Cnt-1 do begin
  idUser:=Integer(IL[I]);
  UserItems[I].idUser:=idUser;
  with lvInstanceList.Items.Add,TMODELUserFunctionality(TComponentFunctionality_Create(idUser)) do
  try
  Caption:=Name;
  SubItems.Add(FullName);
  UserItems[I].flOnline:=IsUserOnLine(UserOnLineMaxDelay);
  if (UserItems[I].flOnline)
   then SubItems.Add('Online')
   else SubItems.Add('offline');
  finally
  Release;
  end;
  end;
finally
IL.Destroy();
end;
finally
Release();
end;
finally
lvInstanceList.Items.EndUpdate();
end;
end;

procedure TfmTMODELUserInstanceSelector.SearchByDomains(const pDomains: string);
var
  IL: TList;
  Cnt: integer;
  I: integer;
  idUser: integer;
begin
lvInstanceList.Items.BeginUpdate();
try
lvInstanceList.Items.Clear();
with TTMODELUserFunctionality(TTypeFunctionality_Create(idTMODELUser)) do
try
GetOnlineUsersForDomains1(UserOnLineMaxDelay,pDomains,{out} IL);
try
Cnt:=IL.Count;
if (Cnt > UserListMaxSize)
 then begin
  Cnt:=UserListMaxSize;
  ShowMessage('User list is too long, list will be truncated to maximum allowed ('+IntToStr(Cnt)+')');
  end;
SetLength(UserItems,Cnt);
for I:=0 to Cnt-1 do begin
  idUser:=Integer(IL[I]);
  UserItems[I].idUser:=idUser;
  with lvInstanceList.Items.Add,TMODELUserFunctionality(TComponentFunctionality_Create(idUser)) do
  try
  Caption:=Name;
  SubItems.Add(FullName);
  UserItems[I].flOnline:=IsUserOnLine(UserOnLineMaxDelay);
  if (UserItems[I].flOnline)
   then SubItems.Add('Online')
   else SubItems.Add('offline');
  finally
  Release;
  end;
  end;
finally
IL.Destroy();
end;
finally
Release();
end;
finally
lvInstanceList.Items.EndUpdate();
end;
end;

procedure TfmTMODELUserInstanceSelector.lvInstanceListAdvancedCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
case (SubItem) of
2: begin //. online column
  if (UserItems[Item.Index].flOnline)
   then begin
    Sender.Canvas.Brush.Color:=clGreen;
    Sender.Canvas.Font.Color:=clWhite;
    end
   else begin
    Sender.Canvas.Brush.Color:=clSilver;
    Sender.Canvas.Font.Color:=clBlack;
    end;
  end;
else begin
  Sender.Canvas.Brush.Color:=lvInstanceList_Color;
  Sender.Canvas.Font.Color:=lvInstanceList_FontColor;
  end;
end;
end;

procedure TfmTMODELUserInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if (lvInstanceList.ItemIndex = -1) then Exit; //. ->
//.
flSelected:=true;
Close();
end;

procedure TfmTMODELUserInstanceSelector.edDomainsKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  SearchByDomains(edDomains.Text);
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TfmTMODELUserInstanceSelector.btnSearchByDomainsClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
SearchByDomains(edDomains.Text);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmTMODELUserInstanceSelector.edNameContextKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  SearchByName(edNameContext.Text);
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TfmTMODELUserInstanceSelector.btnSearchByNameContextClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
SearchByName(edNameContext.Text);
finally
Screen.Cursor:=SC;
end;
end;

procedure TfmTMODELUserInstanceSelector.btnShowPropsPanelClick(Sender: TObject);
begin
if (lvInstanceList.ItemIndex <> -1)
 then with TComponentFunctionality_Create(idTMODELUSer,UserItems[lvInstanceList.ItemIndex].idUser) do
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

procedure TfmTMODELUserInstanceSelector.btnOKClick(Sender: TObject);
begin
flSelected:=true;
Close();
end;

procedure TfmTMODELUserInstanceSelector.btnCancelClick(Sender: TObject);
begin
Close();
end;


end.
