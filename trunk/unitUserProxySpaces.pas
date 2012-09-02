unit unitUserProxySpaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, FunctionalitySOAPInterface, Functionality, unitProxySpace, Buttons, RXCtrls, ComCtrls, ExtCtrls,
  StdCtrls, ImgList;

const
  ProxySpacesMaxAllowed = 5;
type
  TWorkMode = (wmSelecting,wmEditing);

  TfmUserProxySpaces = class(TForm)
    Panel1: TPanel;
    pnlOperations: TPanel;
    sbCreate: TRxSpeedButton;
    sbDestroy: TRxSpeedButton;
    sbOK: TSpeedButton;
    sbClose: TSpeedButton;
    lvProxySpaces_ImageList: TImageList;
    lvProxySpaces: TListView;
    procedure sbCloseClick(Sender: TObject);
    procedure lvProxySpacesEdited(Sender: TObject; Item: TListItem; var S: String);
    procedure sbDestroyClick(Sender: TObject);
    procedure sbCreateClick(Sender: TObject);
    procedure sbOKClick(Sender: TObject);
    procedure lvProxySpacesDblClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    UserID: integer;
    WorkMode: TWorkMode;
    flOK: boolean;
    procedure lvProxySpaces_Update;
    procedure lvProxySpaces_CreateProxySpace;
    procedure lvProxySpaces_DestroySelected;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; const pUserID: integer);
    procedure Update;
    function Select(out idUserProxySpace: integer): boolean;
    procedure Edit;
  end;

implementation
Uses
  unitProxySpaceCfg;

{$R *.dfm}

Constructor TfmUserProxySpaces.Create(pSpace: TProxySpace; const pUserID: integer);
begin
Inherited Create(nil);
Space:=pSpace;
UserID:=pUserID;
Update;
end;

procedure TfmUserProxySpaces.Update;
begin
lvProxySpaces_Update;
end;

procedure TfmUserProxySpaces.lvProxySpaces_Update;
var
  I: integer;
  BA: TByteArray;
  UserProxySpaces: TList;
begin
with lvProxySpaces do begin
Items.Clear;
Items.BeginUpdate;
try
with GetISpaceUserProxySpaces(Space.SOAPServerURL) do begin
BA:=GetUserProxySpaces(Space.UserName,Space.UserPassword,Space.UserID);
UserProxySpaces:=TList.Create;
try
ByteArray_PrepareList(BA,UserProxySpaces);
with UserProxySpaces do
for I:=0 to Count-1 do with lvProxySpaces.Items.Add do begin
  try
  Data:=Pointer(Integer(List[I]));
  with GetISpaceUserProxySpace(Space.SOAPServerURL) do Caption:=getName(Space.UserName,Space.UserPassword,Integer(Data));
  ImageIndex:=0;
  except
    end;
  end;
finally
UserProxySpaces.Destroy;
end;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmUserProxySpaces.lvProxySpaces_CreateProxySpace;
var
  idNewProxySpace: integer;
begin
//. creating user proxyspace
with GetISpaceUserProxySpaces(Space.SOAPServerURL) do idNewProxySpace:=CreateProxySpace(Space.UserName,Space.UserPassword,Space.UserID);
//. add proxyspace to the list
with lvProxySpaces.Items.Add do begin
Data:=Pointer(idNewProxySpace);
with GetISpaceUserProxySpace(Space.SOAPServerURL) do setName(Space.UserName,Space.UserPassword,idNewProxySpace, 'NoName');
Caption:='NoName';
ImageIndex:=0;
end;
end;

procedure TfmUserProxySpaces.lvProxySpaces_DestroySelected;
var
  idDestroyProxySpace: integer;
begin
if lvProxySpaces.Selected = nil then Exit; //. ->
idDestroyProxySpace:=Integer(lvProxySpaces.Selected.Data);
//. destroying user proxyspace
with GetISpaceUserProxySpaces(Space.SOAPServerURL) do DestroyProxySpace(Space.UserName,Space.UserPassword, idDestroyProxySpace);
//. remove item from the list
lvProxySpaces.Selected.Delete;
end;

procedure TfmUserProxySpaces.lvProxySpacesEdited(Sender: TObject; Item: TListItem; var S: String);
begin
with GetISpaceUserProxySpace(Space.SOAPServerURL) do setName(Space.UserName,Space.UserPassword, Integer(Item.Data), S);
//. updating proxyspace control panel
if Space.ControlPanel <> nil then Space.ControlPanel.Update;
end;

procedure TfmUserProxySpaces.lvProxySpacesDblClick(Sender: TObject);
begin
case WorkMode of
wmSelecting: begin
  if lvProxySpaces.Selected <> nil
   then begin
    flOK:=true;
    Close;
    end;
  end;
end;
end;

procedure TfmUserProxySpaces.sbCreateClick(Sender: TObject);
begin
if lvProxySpaces.Items.Count >= ProxySpacesMaxAllowed then Raise Exception.Create('too many proxyspaces'); //. =>
if MessageDlg('Create new user ProxySpace ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes
 then lvProxySpaces_CreateProxySpace;
end;

procedure TfmUserProxySpaces.sbDestroyClick(Sender: TObject);
begin
if MessageDlg('Are you really want destroy selected ProxySpace ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes
 then lvProxySpaces_DestroySelected;
end;

procedure TfmUserProxySpaces.sbCloseClick(Sender: TObject);
begin
Close;
end;

function TfmUserProxySpaces.Select(out idUserProxySpace: integer): boolean;
begin
flOK:=false;
Caption:='Select ProxySpace';
sbOK.Caption:='OK';
sbOK.Show;
sbClose.Left:=126;
sbClose.Width:=104;
pnlOperations.Hide;
Width:=239;
WorkMode:=wmSelecting;
if lvProxySpaces_ImageList.Count > 0
 then begin
  lvProxySpaces.Items[0].Selected:=true;
  lvProxySpaces.Items[0].Focused:=true;
  end;
ShowModal;
Result:=false;
if flOK
 then begin
  idUserProxySpace:=Integer(lvProxySpaces.Selected.Data);
  Result:=true;
  end;
end;

procedure TfmUserProxySpaces.Edit;
begin
Caption:='User ProxySpaces';
sbOK.Hide;
sbClose.Left:=62;
sbClose.Width:=141;
pnlOperations.Show;
Width:=275;
WorkMode:=wmEditing;
ShowModal;
end;

procedure TfmUserProxySpaces.sbOKClick(Sender: TObject);
begin
case WorkMode of
wmSelecting: begin
  if lvProxySpaces.Selected <> nil
   then begin
    flOK:=true;
    Close;
    end;
  end;
end;
end;

end.
