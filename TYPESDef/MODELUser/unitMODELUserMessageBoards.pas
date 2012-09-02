unit unitMODELUserMessageBoards;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, Functionality, TypesFunctionality, TypesDefines, ImgList, ComCtrls,
  ExtCtrls, StdCtrls;

type
  TfmMODELUserMessageBoardsStatus = (statusShowing,statusSelecting);
  TfmMODELUserMessageBoards = class(TForm)
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
    idMODELUser: integer;
    flSelected: boolean;
    Status: TfmMODELUserMessageBoardsStatus;
  public
    { Public declarations }
    Constructor Create(const pidMODELUser: integer);
    procedure Update;
    function Select(out idInstance: integer): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmMODELUserMessageBoards.Create(const pidMODELUser: integer);
begin
Inherited Create(nil);
idMODELUser:=pidMODELUser;
Status:=statusShowing;
Update;
end;

procedure TfmMODELUserMessageBoards.Update;
var
  BL: TList;
  idInstance: integer;
  I: integer;
begin
lvInstanceList.Clear;
lvInstanceList.Items.BeginUpdate;
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idMODELUser)) do
try
GetMessageBoards(BL);
try
for I:=0 to BL.Count-1 do begin
  idInstance:=Integer(BL[I]);
  with lvInstanceList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  finally
  Release;
  end;
  end;
  end;
finally
BL.Destroy;
end;
finally
Release;
end;
finally
lvInstanceList.Items.EndUpdate;
end;
end;

function TfmMODELUserMessageBoards.Select(out idInstance: integer): boolean;
begin
Caption:='select message box ...';
flSelected:=false;
Status:=statusSelecting;
ShowModal;
Result:=false;
if flSelected
 then begin
  idInstance:=Integer(lvInstanceList.Selected.Data);
  Result:=true;
  end;
end;

procedure TfmMODELUserMessageBoards.lvInstanceListDblClick(Sender: TObject);
begin
if lvInstanceList.Selected <> nil
 then
  if Status = statusSelecting
   then begin
    flSelected:=true;
    Close;
    end
   else with TComponentFunctionality_Create(idTMessageBoard,Integer(lvInstanceList.Selected.Data)) do
    try
    Check;
    with TPanelProps_Create(false,0,nil,nilObject) do begin
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end;
end;

end.
