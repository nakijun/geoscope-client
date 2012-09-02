unit unitSelectiveContextLogout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unitProxySpace, Functionality, Buttons, ExtCtrls, ComCtrls,
  StdCtrls;

type
  TfmSelectiveContextLogout = class(TForm)
    lvEnabledTypes: TListView;
    Panel1: TPanel;
    sbLogout: TSpeedButton;
    sbCancel: TSpeedButton;
    cbApplyToAll: TCheckBox;
    procedure sbLogoutClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure cbApplyToAllClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    flAccepted: boolean;
    procedure Update;
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    function Accepted(): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmSelectiveContextLogout.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
Update;
end;

procedure TfmSelectiveContextLogout.Update;
var
  I: integer;
  TypeFunctionality: TTypeFunctionality;
begin
lvEnabledTypes.Items.Clear;
with lvEnabledTypes do begin
for I:=0 to TypesSystem.Count-1 do if (TTypeSystem(TypesSystem[I]).Enabled) then with Items.Add do begin
  TypeFunctionality:=TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create;
  with TypeFunctionality do
  try
  Data:=Pointer(idType);
  Caption:=Name;
  Checked:=true;
  finally
  Release;
  end;
  end;
end;
end;

function TfmSelectiveContextLogout.Accepted(): boolean;

  procedure UpdateTypesSystem;
  var
    I,J: integer;
    TypeSystem: TTypeSystem;
  begin
  with lvEnabledTypes do begin
  for I:=0 to Items.Count-1 do
    for J:=0 to TypesSystem.Count-1 do
      if (TTypeSystem(TypesSystem[J]).idType = Integer(Items[I].Data)) AND (TTypeSystem(TypesSystem[J]).Enabled <> Items[I].Checked)
       then begin
        TTypeSystem(TypesSystem[J]).Enabled:=Items[I].Checked;
        Break;
        end;
  end;
  end;

begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  UpdateTypesSystem;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmSelectiveContextLogout.sbLogoutClick(Sender: TObject);
begin
flAccepted:=true;
Close;
end;

procedure TfmSelectiveContextLogout.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmSelectiveContextLogout.cbApplyToAllClick(Sender: TObject);
var
  I: integer;
begin
with lvEnabledTypes do 
for I:=0 to Items.Count-1 do Items[I].Checked:=cbApplyToAll.Checked;
end;

end.
