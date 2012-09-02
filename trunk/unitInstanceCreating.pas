unit unitInstanceCreating;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace, Functionality, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  SpaceObjInterpretation, Buttons, ExtCtrls, StdCtrls,
  ComCtrls;

type
  TfmInstanceCreating = class(TForm)
    Bevel1: TBevel;
    lvTypes: TListView;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvTypesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create;
    Destructor Destroy; override;
    procedure Update;
    procedure CreateInstance(const idType: integer);
  end;

implementation

{$R *.DFM}

Constructor TfmInstanceCreating.Create;
begin
Inherited Create(nil);
lvTypes.SmallImages:=TypesImageList;
Update;
end;

Destructor TfmInstanceCreating.Destroy;
begin
Inherited;
end;

procedure TfmInstanceCreating.Update;
var
  I: integer;
begin
with lvTypes.Items do begin
BeginUpdate;
try
for I:=0 to TypesSystem.Count-1 do with Add,TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create do
  try
  Data:=Pointer(idType);
  Caption:=Name;
  ImageIndex:=ImageList_Index;
  finally
  Release;
  end;
finally
EndUpdate;
end;
end;
end;

procedure TfmInstanceCreating.CreateInstance(const idType: integer);
var
  TypeFunctionality: TTypeFunctionality;
  idNewObj: integer;   
begin
try
with TTypeFunctionality_Create(idType) do
try
idNewObj:=CreateInstance;
with TComponentFunctionality_Create(idNewObj) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
finally
Release;
end
except
  on E: Exception do ShowMessage('Exception: '+E.Message);
  end;
end;

procedure TfmInstanceCreating.lvTypesDblClick(Sender: TObject);
begin
if (lvTypes.Selected <> nil) AND (MessageDlg('Create the object ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
 then begin
  CreateInstance(Integer(lvTypes.Selected.Data));
  Close; 
  end;
end;

procedure TfmInstanceCreating.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
