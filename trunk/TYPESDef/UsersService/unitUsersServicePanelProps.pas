unit unitUsersServicePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Variants, Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls, ImgList;

type
  TUsersServicePanelProps = class(TSpaceObjPanelProps)
    pnlFindByClientName: TPanel;
    Label2: TLabel;
    Bevel2: TBevel;
    edUserName: TEdit;
    PageControl2: TPageControl;
    tsResult: TTabSheet;
    lvResult: TListView;
    Image1: TImage;
    ImageList: TImageList;
    procedure edUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure lvResultDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure lvResult_UpdateItem(const ixItem: integer);
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure Find(const UserNameContext: string);
  end;

implementation
{$R *.DFM}

Constructor TUsersServicePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TUsersServicePanelProps.Destroy;
begin
Inherited;
end;

procedure TUsersServicePanelProps._Update;
begin
Inherited;
end;

procedure TUsersServicePanelProps.Find(const UserNameContext: string);
var
  IL: TList;
  I: integer;
  idInstance: integer;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with lvResult do begin
Items.BeginUpdate;
try
Items.Clear;
with TTMODELUserFunctionality.Create do
try
GetInstanceListByContext(UserNameContext, IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with Items.Add do begin
  Data:=Pointer(idInstance);
  SubItems.Add(''); SubItems.Add(''); SubItems.Add(''); SubItems.Add('');
  lvResult_UpdateItem(Index);
  end;
  end;
finally
IL.Destroy;
end;
finally
Release;
end;
finally
Items.EndUpdate;
end;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TUsersServicePanelProps.lvResult_UpdateItem(const ixItem: integer);
var
  ProxySpaceID: integer;
  ProxySpaceIP: widestring;
  ProxySpaceState: integer;
begin
with lvResult.Items[ixItem] do
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Integer(Data))) do
try
Caption:=Name;
SubItems[0]:=FullName;
{/// ? if GetActiveStateInfo(ProxySpaceID,ProxySpaceIP,ProxySpaceState)
 then begin
  ImageIndex:=0;
  SubItems[1]:='On-line';
  SubItems[2]:=ProxySpaceIP;
  SubItems[3]:=IntToStr(ProxySpaceID);
  end
 else begin
  ImageIndex:=1;
  SubItems[1]:='off-line';
  SubItems[2]:='';
  SubItems[3]:='';
  end;}
ImageIndex:=0;
SubItems[1]:='?';
SubItems[2]:='?';
SubItems[3]:='?';
finally
Release;
end;
end;

procedure TUsersServicePanelProps.edUserNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then Find(edUserName.Text);
end;

procedure TUsersServicePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TUsersServicePanelProps.Controls_ClearPropData;
begin
end;

procedure TUsersServicePanelProps.lvResultDblClick(Sender: TObject);
var
  idUser: integer;
begin
if lvResult.Selected = nil then Exit; //. ->
idUser:=Integer(lvResult.Selected.Data);
with TTLFFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

end.
