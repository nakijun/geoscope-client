unit unitComponentsFindServicePanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  GlobalSpaceDefines, unitProxySpace, Functionality, SpaceObjInterpretation, TypesDefines, TypesFunctionality, unitReflector,
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, Buttons, Gauges,
  ExtCtrls, FileCtrl;

type
  TComponentsFindServicePanelProps = class(TSpaceObjPanelProps)
    Image1: TImage;
    Panel1: TPanel;
    sbStartStop: TSpeedButton;
    lvResult: TListView;
    Panel2: TPanel;
    ggProgress: TGauge;
    lbObjCounter: TLabel;
    lbObjIndex: TLabel;
    Label2: TLabel;
    StaticText1: TStaticText;
    pnl: TGroupBox;
    cbTypes: TComboBoxEx;
    rbByCoType: TRadioButton;
    cbCoTypes: TComboBoxEx;
    rbByType: TRadioButton;
    sbExportComponents: TSpeedButton;
    sbRemoveSelelcted: TSpeedButton;
    procedure lvResultDblClick(Sender: TObject);
    procedure sbStartStopClick(Sender: TObject);
    procedure rbByTypeClick(Sender: TObject);
    procedure rbByCoTypeClick(Sender: TObject);
    procedure sbExportComponentsClick(Sender: TObject);
    procedure sbRemoveSelelctedClick(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
    cbCoTypes_ImageList: TImageList;
    flInProgress: boolean;
    flProgressCancelled: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure lvResult_Clear;
    procedure FindByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean);
    procedure lvTypes_Update;
    procedure lvCoTypes_Update;
  end;


implementation

{$R *.dfm}


{TComponentsFindServicePanelProps}
Constructor TComponentsFindServicePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
cbTypes.Images:=Types_ImageList;
cbCoTypes_ImageList:=TImageList.Create(nil);
with cbCoTypes_ImageList do begin
Width:=Types_ImageList.Width;
Height:=Types_ImageList.Height;
end;
cbCoTypes.Images:=cbCoTypes_ImageList;
flInProgress:=false;
lvTypes_Update;
lvCoTypes_Update;
Update;
end;

Destructor TComponentsFindServicePanelProps.Destroy;
begin
lvResult_Clear;
cbCoTypes_ImageList.Free;
Inherited;
end;

procedure TComponentsFindServicePanelProps.lvTypes_Update;
var
  I: integer;
begin
with cbTypes do begin
Clear;
Items.BeginUpdate;
try
for I:=0 to TypesSystem.Count-1 do with ItemsEx.Add do
  with TTypeSystem(TypesSystem[I]).TypeFunctionalityClass.Create do
  try
  Data:=Pointer(idType);
  Caption:=Name;
  ImageIndex:=ImageList_Index;
  finally
  Release;
  end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TComponentsFindServicePanelProps.lvCoTypes_Update;
var
  I: integer;
  CoTypesList: TList;
  IconBitmap,TempBMP: TBitmap;
  MS: TMemoryStream;
begin
with cbCoTypes do begin
Clear;
cbCoTypes_ImageList.Clear;
Items.BeginUpdate;
try
with TTCoComponentTypeFunctionality.Create do
try
GetInstanceList(CoTypesList);
try
for I:=0 to CoTypesList.Count-1 do begin
  try
  with ItemsEx.Add do
  with TCoComponentTypeFunctionality(TComponentFunctionality_Create(Integer(CoTypesList[I]))) do
  try
  Data:=Pointer(idObj);
  Caption:=Name;
  if GetIconImage(IconBitmap)
   then
    try
    TempBMP:=TBitmap.Create;
    try
    MS:=TMemoryStream.Create;
    try
    IconBitmap.SaveToStream(MS); MS.Position:=0;
    TempBMP.LoadFromStream(MS);
    finally
    MS.Destroy;
    end;
    ImageIndex:=cbCoTypes_ImageList.Add(TempBMP,nil);
    finally
    TempBMP.Destroy;
    end;
    finally
    IconBitmap.Destroy;
    end
   else with TTCoComponentFunctionality.Create do
    try
    ImageIndex:=ImageList_Index;
    finally
    Release;
    end;
  finally
  Release;
  end;
  except
    end;
  end;
finally
CoTypesList.Destroy;
end;
finally
Release;
end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TComponentsFindServicePanelProps.lvResult_Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
with lvResult do begin
for I:=0 to Items.Count-1 do begin
  ptrDestroyItem:=Items[I].Data;
  Items[I].Data:=nil;
  FreeMem(ptrDestroyItem,SizeOf(TItemComponentsList));
  end;
Clear;
end;
end;

procedure TComponentsFindServicePanelProps.FindByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean);
const
  ObjectsPortion = 1001;
var
  ObjectsCounter: integer;
  ObjectsStr: WideString;

  procedure ProcessObjects;
  var
    SQLExpr: WideString;
    sIDs: WideString;
    ptrNewItem: pointer;
    II: integer;
  begin
  //.
  {/// + if ObjectsCounter > 0
   then with ObjFunctionality.Space.TObjPropsQuery_Create do
    try
    if flBuiltInType
     then begin
      SQLExpr:='SELECT TOwner,Owner_Key FROM ObjectsProps WHERE ('+ObjectsStr+' (1 = 2)) ';
      if FindTypeID <> 0 then SQLExpr:=SQLExpr+'AND (TOwner = '+IntToStr(FindTypeID)+')';
      EnterSQL(SQLExpr);
      Open;
      while NOT EOF do begin
        try
        with TComponentFunctionality_Create(FieldValues['TOwner'],FieldValues['Owner_Key']) do
        try
        with lvResult.Items.Add do begin
        GetMem(ptrNewItem,SizeOf(TItemComponentsList));
        with TItemComponentsList(ptrNewItem^) do begin
        idTComponent:=idTObj;
        idComponent:=idObj;
        end;
        Data:=ptrNewItem;
        Caption:=Name;
        ImageIndex:=TypeFunctionality.ImageList_Index;
        end;
        finally
        Release;
        end;
        except
          end;
        Next;
        //.
        Application.ProcessMessages;
        if flProgressCancelled then Raise Exception.Create('process terminated by user'); //. =>
        end
      end
     else begin
      SQLExpr:='SELECT Owner_Key FROM ObjectsProps WHERE ('+ObjectsStr+' (1 = 2)) AND TOwner = '+IntToStr(idTCoComponent);
      EnterSQL(SQLExpr);
      Open;
      sIDs:='';
      while NOT EOF do begin
        sIDs:=sIDs+IntToStr(Integer(FieldValues['Owner_Key']))+',';
        Next;
        end;
      Close;
      if sIDs <> ''
       then begin
        SetLength(sIDs,Length(sIDs)-1);
        SQLExpr:='SELECT ObjectsProps.TOwner,ObjectsProps.Owner_Key FROM ObjectsProps,TypesMarkers WHERE (ObjectsProps.TOwner = '+IntToStr(2015)+' AND ObjectsProps.Owner_Key in ('+sIDs+')) AND ObjectsProps.TProp = '+IntToStr(idTCoComponentTypeMarker)+' AND ObjectsProps.Prop_Key = TypesMarkers.id';
        if FindTypeID <> 0 then SQLExpr:=SQLExpr+' AND TypesMarkers.idCoComponentType+0 = '+IntToStr(FindTypeID);
        EnterSQL(SQLExpr);
        Open;
        while NOT EOF do begin
          try
          with TCoComponentFunctionality(TComponentFunctionality_Create(FieldValues['TOwner'],FieldValues['Owner_Key'])) do
          try
          with lvResult.Items.Add do begin
          GetMem(ptrNewItem,SizeOf(TItemComponentsList));
          with TItemComponentsList(ptrNewItem^) do begin
          idTComponent:=idTObj;
          idComponent:=idObj;
          end;
          Data:=ptrNewItem;
          Caption:=Name;
          II:=cbCoTypes.Items.IndexOfObject(TObject(idCoType));
          if II <> -1
           then ImageIndex:=cbCoTypes.ItemsEx[II].ImageIndex
           else ImageIndex:=-1;
          end;
          finally
          Release;
          end;
          except
            end;
          Next;
          end;
        end;
      end;
    finally
    Destroy;
    end;
  //.
  ObjectsStr:='';
  ObjectsCounter:=0;}
  end;

  procedure ProcessObj(const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    idTOwner,idOwner: integer;
  begin
  with ObjFunctionality.Space do begin
  //.
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  ObjectsStr:=ObjectsStr+'(TProp = '+IntToStr(Obj.idTObj)+' AND Prop_Key = '+IntToStr(Obj.idObj)+') OR ';
  Inc(ObjectsCounter);
  end;
  end;

var
  Lays: pointer;
  ptrLay: pointer;
  ptrItem: pointer;
  ObjCounter: integer;
  ObjIndex: integer;
  ptrDestroyLay: pointer;
  ptrDestroyItem: pointer;
begin
flProgressCancelled:=false;
sbStartStop.Caption:='Stop';
cbTypes.Enabled:=false;
cbCoTypes.Enabled:=false;
rbByType.Enabled:=false;
rbByCoType.Enabled:=false;
flInProgress:=true;
try
lvResult_Clear;
if flBuiltInType
 then lvResult.SmallImages:=Types_ImageList
 else lvResult.SmallImages:=cbCoTypes_ImageList;
ObjFunctionality.Space.Obj_GetLaysOfVisibleObjectsInside(ptrObject, Lays);
try
//.
ptrLay:=Lays;
ObjCounter:=0;
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  if flLay then Inc(ObjCounter,ObjectsCount);
  ptrLay:=ptrNext;
  end;
//.
lbObjCounter.Caption:=IntToStr(ObjCounter);
ggProgress.Progress:=0;
ptrLay:=Lays;
ObjIndex:=0;
ObjectsStr:='';
ObjectsCounter:=0;
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  if flLay
   then begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      ProcessObj(ptrObject);
      if ObjectsCounter >= ObjectsPortion then ProcessObjects;
      //.
      ptrItem:=ptrNext;
      //.
      Inc(ObjIndex);
      ggProgress.Progress:=Round((ObjIndex/ObjCounter)*100);
      lbObjIndex.Caption:=IntToStr(ObjIndex);
      Application.ProcessMessages;
      if flProgressCancelled then Raise Exception.Create('process terminated by user'); //. =>
      end;
    end;
  ptrLay:=ptrNext;
  end;
//.
ProcessObjects;
ggProgress.Progress:=100;
finally
//. lays destroying
while Lays <> nil do begin
  ptrDestroyLay:=Lays;
  Lays:=TLayReflect(ptrDestroyLay^).ptrNext;
  //. lay destroying
  with TLayReflect(ptrDestroyLay^) do
  while Objects <> nil do begin
    ptrDestroyItem:=Objects;
    Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
    //. item of lay destroying
    FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
    end;
  FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
  end;
end;
finally
flInProgress:=false;
rbByCoType.Enabled:=true;
rbByType.Enabled:=true;
cbCoTypes.Enabled:=true;
cbTypes.Enabled:=true;
sbStartStop.Caption:='Start';
end;
end;


procedure TComponentsFindServicePanelProps.lvResultDblClick(Sender: TObject);
var
  ptrObject: TPtr;
  idTOwner,idOwner: integer;
begin
if lvResult.Selected = nil then Exit; //. ->
with TItemComponentsList(lvResult.Selected.Data^),TComponentFunctionality_Create(idTComponent,idComponent) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
OnKeyDown:=Self.OnKeyDown;
OnKeyUp:=Self.OnKeyUp;
Show;
end;
finally
Release;
end;
end;

procedure TComponentsFindServicePanelProps.sbStartStopClick(Sender: TObject);
var
  FindTypeID: integer;
  idT,idVisualization: integer;
  ptrObj: TPtr;
begin
if NOT flInProgress
 then begin
  if NOT ObjFunctionality.QueryComponent(idTVisualization, idT,idVisualization) then Raise Exception.Create('could not get the visualization object'); //. =>
  with TVisualizationFunctionality(TComponentFunctionality_Create(idT,idVisualization)) do
  try
  ptrObj:=Ptr;
  finally
  Release;
  end;
  if rbByType.Checked
   then
    if cbTypes.ItemIndex <> -1
     then FindTypeID:=Integer(cbTypes.ItemsEx[cbTypes.ItemIndex].Data)
     else FindTypeID:=0
   else
    if cbCoTypes.ItemIndex <> -1
     then FindTypeID:=Integer(cbCoTypes.ItemsEx[cbCoTypes.ItemIndex].Data)
     else FindTypeID:=0;
  FindByObj(ptrObj,FindTypeID,rbByType.Checked);
  end
 else
  flProgressCancelled:=true;
end;

procedure TComponentsFindServicePanelProps.rbByTypeClick(Sender: TObject);
begin
if rbByType.Checked
 then begin
  cbTypes.Enabled:=true;
  cbCoTypes.Enabled:=false;
  end;
end;

procedure TComponentsFindServicePanelProps.rbByCoTypeClick(Sender: TObject);
begin
if rbByCoType.Checked
 then begin
  cbTypes.Enabled:=false;
  cbCoTypes.Enabled:=true;
  end;
end;

procedure TComponentsFindServicePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TComponentsFindServicePanelProps.Controls_ClearPropData;
begin
end;

procedure TComponentsFindServicePanelProps.sbExportComponentsClick(Sender: TObject);
var
  ComponentsList: TComponentsList;
  I: integer;
  Path: string;
begin
if NOT SelectDirectory('Select directory ->','',Path) then Exit; //. ->
Application.ProcessMessages;
ComponentsList:=TComponentsList.Create;
try
with lvResult do for I:=0 to Items.Count-1 do ComponentsList.Add(Items[I].Data);
ObjFunctionality.Space.Log.OperationStarting('Exporting components ...');
try
TypesSystem.DoExportComponents(ObjFunctionality.Space.UserName,ObjFunctionality.Space.UserPassword, ComponentsList,Path+'\Components.xml');
finally
ObjFunctionality.Space.Log.OperationDone;
end;
finally
ComponentsList.Destroy;
end;
ShowMessage('Export done.');
end;

procedure TComponentsFindServicePanelProps.sbRemoveSelelctedClick(Sender: TObject);
begin
if lvResult.Selected = nil then Exit; //. ->
lvResult.Selected.Delete;
end;


end.
