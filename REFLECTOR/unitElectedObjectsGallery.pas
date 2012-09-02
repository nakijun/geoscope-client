unit unitElectedObjectsGallery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines,unitProxySpace,Functionality,unitReflector, ComCtrls,
  ExtCtrls;

type
  TfmElectedObjectsGallery = class(TForm)
    lvElectedObjectsGallery: TListView;
    procedure lvElectedObjectsGalleryMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Reflector: TReflector;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure lvElectedObjectsGallery_Update();
    procedure lvElectedObjectsGallery_Clear();
  public
    { Public declarations }
    Constructor Create(const pReflector: TReflector);
    Destructor Destroy; override;
    procedure Update; reintroduce;
  end;

implementation
uses
  unitElectedObjects,
  FunctionalitySOAPInterface,
  TypesFunctionality;

{$R *.dfm}


procedure TfmElectedObjectsGallery.CreateParams(var Params: TCreateParams) ;
begin
BorderStyle := bsNone;
inherited;
Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
Params.Style := Params.Style or WS_SIZEBOX;
end;

Constructor TfmElectedObjectsGallery.Create(const pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
end;

Destructor TfmElectedObjectsGallery.Destroy;
begin
lvElectedObjectsGallery_Clear();
Inherited;
end;

procedure TfmElectedObjectsGallery.Update;
begin
lvElectedObjectsGallery_Update();
end;

procedure TfmElectedObjectsGallery.lvElectedObjectsGallery_Update();
var
  ImageList: TImageList;
  BA: TByteArray;
  MemoryStream: TMemoryStream;
  ElectedObjectStoredStruc: TElectedObjectStruc;
  ptrNewItem: pointer;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
lvElectedObjectsGallery_Clear();
//.
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
lvElectedObjectsGallery.LargeImages:=ImageList;
//.
with Reflector,lvElectedObjectsGallery do begin
Clear;
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with GetISpaceUserReflector(Space.SOAPServerURL) do
if (Get_ElectedObjects(Space.UserName,Space.UserPassword,Reflector.id,BA))
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  Items.BeginUpdate;
  try
  while MemoryStream.Read(ElectedObjectStoredStruc,SizeOf(TElectedObjectStoredStruc)) = SizeOf(TElectedObjectStoredStruc) do begin
    //. check for object
    try
    with TComponentFunctionality_Create(ElectedObjectStoredStruc.idType,ElectedObjectStoredStruc.idObj) do
    try
    Check;
    finally
    Release;
    end;
    except
      Continue; //. ^
      end;
    //.
    GetMem(ptrNewItem,SizeOf(TElectedObjectStruc));
    with TElectedObjectStruc(ptrNewItem^) do begin
    idType:=ElectedObjectStoredStruc.idType;
    idObj:=ElectedObjectStoredStruc.idObj;
    ObjectName:=ElectedObjectStoredStruc.ObjectName;
    with TComponentFunctionality_Create(idType,idObj) do
    try
    if (NOT GetIconImage(IconBitmap)) then IconBitmap:=nil;
    finally
    Release;
    end;
    end;
    //. adding a item
    try
    with Items.Add,TElectedObjectStruc(ptrNewItem^) do begin
    Data:=ptrNewItem;
    Caption:=ObjectName;
    with TTypeFunctionality_Create(idType) do
    try
    if (IconBitmap = nil)
     then
      ImageIndex:=ImageList_Index
     else begin
      TempBMP:=TBitmap.Create;
      try
      MS:=TMemoryStream.Create;
      try
      IconBitmap.SaveToStream(MS); MS.Position:=0;
      TempBMP.LoadFromStream(MS);
      finally
      MS.Destroy;
      end;
      ImageIndex:=ImageList.Add(TempBMP,nil);
      finally
      TempBMP.Destroy;
      end;
      end;
    finally
    Release;
    end;
    end;
    except
      end;
    end;
  finally
  Items.EndUpdate;
  end;
  finally
  MemoryStream.Destroy;
  end;
end;
end;
end;

procedure TfmElectedObjectsGallery.lvElectedObjectsGallery_Clear();
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvElectedObjectsGallery do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  if (TElectedObjectStruc(ptrRemoveItem^).IconBitmap <> nil) then TElectedObjectStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TElectedObjectStruc));
  end;
Items.Clear;
Items.EndUpdate;
end;
//.
lvElectedObjectsGallery.LargeImages.Free;
lvElectedObjectsGallery.LargeImages:=nil;
end;

procedure TfmElectedObjectsGallery.lvElectedObjectsGalleryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);

  procedure ShowPropsPanel(F: TComponentFunctionality);
  begin
  with TAbstractSpaceObjPanelProps(F.TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Reflector.Left+Round((Reflector.Width-Width)/2);
  Top:=Reflector.Top+Reflector.Height-Height-10;
  OnKeyDown:=Reflector.OnKeyDown;
  OnKeyUp:=Reflector.OnKeyUp;
  Show;
  end;
  end;

  function ShowCoComponentPanelProps(CoComponentFunctionality: TComponentFunctionality): boolean;
  var
    CoComponentPanelProps: TForm;
  begin
  Result:=false;
  try
  CoComponentPanelProps:=CoComponentFunctionality.Space.Plugins___CoComponent__TPanelProps_Create(CoComponentFunctionality_idCoType(CoComponentFunctionality.idObj),CoComponentFunctionality.idObj);
  if CoComponentPanelProps <> nil
   then with CoComponentPanelProps do begin
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=Reflector.OnKeyDown;
    OnKeyUp:=Reflector.OnKeyUp;
    Show;
    Result:=true;
    end
  except
    end;
  end;

var
  CF: TComponentFunctionality;
  flShowPropsPanel: boolean;
  VisComponents: TComponentsList;
begin
if (lvElectedObjectsGallery.Selected = nil) then Exit; //. ->
with Reflector,TElectedObjectStruc(lvElectedObjectsGallery.Selected.Data^) do
CF:=TComponentFunctionality_Create(idType,idObj);
with CF do begin
try
Check();
flShowPropsPanel:=(Button <> mbLeft);
if (flShowPropsPanel)
 then begin
  if (CF.idTObj = idTCoComponent)
   then begin
    if NOT ShowCoComponentPanelProps(CF) then ShowPropsPanel(CF);
    end
   else
    ShowPropsPanel(CF);
  Exit; //. ->
  end;
if (NOT (CF is TBase2DVisualizationFunctionality))
 then begin
  CF.QueryComponents(TBase2DVisualizationFunctionality, VisComponents);
  if (VisComponents <> nil)
   then
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VisComponents[0]^).idTComponent,TItemComponentsList(VisComponents[0]^).idComponent){берем первый визуальный компонент}) do
    try
    Reflector.ShowObjAtCenter(Ptr);
    finally
    Release;
    end;
    finally
    VisComponents.Destroy;
    end
   else
    if (CF.idTObj = idTCoComponent)
     then begin
      if NOT ShowCoComponentPanelProps(CF) then ShowPropsPanel(CF);
      end
     else
      ShowPropsPanel(CF);
  end
 else Reflector.ShowObjAtCenter(TBase2DVisualizationFunctionality(CF).Ptr);
finally
Release;
end
end;
end;


end.
