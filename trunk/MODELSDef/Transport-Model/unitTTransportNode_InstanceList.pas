unit unitTTransportNode_InstanceList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SpaceObjInterpretation, Functionality, TypesFunctionality, ComCtrls,
  RxGrdCpt;

type
  TfmTTransportNode_InstanceList = class(TForm)
    List: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create;
    procedure Update;
    procedure List_Update;
  end;

implementation

{$R *.DFM}

Constructor TfmTTransportNode_InstanceList.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TfmTTransportNode_InstanceList.Update;
begin
List_Update;
end;

procedure TfmTTransportNode_InstanceList.List_Update;
var
  Lst: TList;
  I: integer;
  TypeTransportNodeFunctionality: TTTransportNodeFunctionality;
begin
List.Items.Clear;
TypeTransportNodeFunctionality:=TTTransportNodeFunctionality.Create;
TypeTransportNodeFunctionality.GetInstanceList(Lst);
List.Items.BeginUpdate;
try
for I:=0 to Lst.Count-1 do with TTransportNodeFunctionality(TypeTransportNodeFunctionality.TComponentFunctionality_Create(Integer(Lst[I])){idTrasportNode}) do begin
  with List.Items.Add do begin
  Data:=TObject(idObj);
  Caption:=Name;
  ImageIndex:=TypeFunctionality.ImageList_Index;
  end;
  Release;
  end;
finally
List.Items.EndUpdate;
TypeTransportNodeFunctionality.Release;
end;
end;

end.
