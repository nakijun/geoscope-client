unit unitLay2DVisualizationObjectsList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, GlobalSpaceDefines, unitProxySpace, Functionality, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  ComCtrls, Menus;

type
  TfmLay2DVisualizationObjectsList = class(TForm)
    lvObjects: TListView;
    lvObjectsPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure lvObjects_RemoveSelectedObj;
    procedure lvObjects_Empty;
    procedure lvObjectsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    LayFunctionality: TLay2DVisualizationFunctionality;
    flChanged: boolean;
  public
    { Public declarations }
    Constructor Create(const pidLay: integer);
    Destructor Destroy; override;
    procedure Update;
  end;


implementation

{$R *.DFM}

Constructor TfmLay2DVisualizationObjectsList.Create(const pidLay: integer);
begin
Inherited Create(nil);
LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,pidLay));
lvObjects.SmallImages:=TypesImageList;
flChanged:=false;
Update;
end;

Destructor TfmLay2DVisualizationObjectsList.Destroy;
begin
LayFunctionality.Release;
Inherited;
end;

procedure TfmLay2DVisualizationObjectsList.Update;
var
  ObjPtrsList: TList;
  LayName: string;
  I: integer;
  ptrObj: TPtr;
  Obj: TSpaceObj;
  idTOwner,idOwner: integer;
  OwnerFunctionality: TComponentFunctionality;
  SaveCursor: TCursor;
begin
LayName:=LayFunctionality.Name;
if LayName = '' then LayName:='?';
Caption:='lay objects: '+LayName+', level - '+IntToStr(LayFunctionality.Number);
LayFunctionality.GetObjectPointersList(ObjPtrsList);
lvObjects.Items.BeginUpdate;
lvObjects.Items.Clear;
SaveCursor:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
for I:=0 to ObjPtrsList.Count-1 do
  try
  ptrObj:=TPtr(ObjPtrsList[I]);
  LayFunctionality.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  with lvObjects.Items.Add do begin
  Data:=Pointer(ptrObj);
  if GetOwner(idTOwner,idOwner)
   then begin
    OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
    with OwnerFunctionality do
    try
    if Name <> ''
     then Caption:=Name
     else Caption:=TypeFunctionality.Name;
    ImageIndex:=TypeFunctionality.ImageList_Index;
    finally
    Release;
    end;
    end
   else begin
    Caption:=Name;
    ImageIndex:=TypeFunctionality.ImageList_Index;
    end
  end;
  finally
  Release;
  end;
  except
    end;
finally
Screen.Cursor:=SaveCursor;
lvObjects.Items.EndUpdate;
ObjPtrsList.Destroy;
end;
flChanged:=false;
end;

procedure TfmLay2DVisualizationObjectsList.lvObjects_RemoveSelectedObj;
var
  ptrObj: TPtr;
  Obj: TSpaceObj;
  ObjFunctionality: TComponentFunctionality;
begin
if lvObjects.Selected = nil then Exit;
ptrObj:=Integer(lvObjects.Selected.Data);
LayFunctionality.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
ObjFunctionality:=TComponentFunctionality_Create(Obj.idTObj,Obj.idObj);
with ObjFunctionality do begin
if MessageDlg(' Destroy the object ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes
 then TypeFunctionality.DestroyInstance(idObj)
 else begin
  Release;
  Exit;
  end;
Release;
end;
lvObjects.Selected.Delete;
end;

procedure TfmLay2DVisualizationObjectsList.lvObjects_Empty;
var
  ObjPtrsList: TList;
  I: integer;
  ptrObj: TPtr;
  Obj: TSpaceObj;
  ObjFunctionality: TComponentFunctionality;
begin
if NOT (MessageDlg(' Destroy all objects ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes) then Exit;
LayFunctionality.GetObjectPointersList(ObjPtrsList);
try
for I:=0 to ObjPtrsList.Count-1 do begin
  ptrObj:=Integer(ObjPtrsList[I]);
  LayFunctionality.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  ObjFunctionality:=TComponentFunctionality_Create(Obj.idTObj,Obj.idObj);
  with ObjFunctionality do begin
  TypeFunctionality.DestroyInstance(idObj); 
  Release;
  end;
  end;
finally
ObjPtrsList.Destroy;
lvObjects.Items.Clear;
end;
end;

procedure TfmLay2DVisualizationObjectsList.lvObjectsDblClick(Sender: TObject);
begin
if lvObjects.Selected <> nil
 then begin
  LayFunctionality.Reflector.SelectObj(TPtr(lvObjects.Selected.Data){ptrObj});
  LayFunctionality.Reflector.SelectedObj__TPanelProps_Show;
  end;
end;

procedure TfmLay2DVisualizationObjectsList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmLay2DVisualizationObjectsList.N1Click(Sender: TObject);
begin
lvObjects_RemoveSelectedObj;
end;

procedure TfmLay2DVisualizationObjectsList.N2Click(Sender: TObject);
begin
lvObjects_Empty;
end;

end.
