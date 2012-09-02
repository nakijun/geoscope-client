unit unitInsideObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  GlobalSpaceDefines, unitProxySpace, Functionality, SpaceObjInterpretation, TypesDefines, TypesFunctionality, unitReflector,
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, Buttons, Gauges,
  ExtCtrls;

type
  TfmInsideObjects = class(TForm)
    Panel1: TPanel;
    pnl: TGroupBox;
    cbTypes: TComboBoxEx;
    rbByCoType: TRadioButton;
    cbCoTypes: TComboBoxEx;
    rbByType: TRadioButton;
    sbStartStop: TSpeedButton;
    PageControl1: TPageControl;
    tsFound: TTabSheet;
    lvResult: TListView;
    lvResult_bbMarkAll: TBitBtn;
    lvResult_bbClearAll: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure lvResultDblClick(Sender: TObject);
    procedure sbStartStopClick(Sender: TObject);
    procedure rbByTypeClick(Sender: TObject);
    procedure rbByCoTypeClick(Sender: TObject);
    procedure lvResult_bbMarkAllClick(Sender: TObject);
    procedure lvResult_bbClearAllClick(Sender: TObject);
  private
    { Private declarations }
    ObjFunctionality: TCELLVisualizationFunctionality;
    cbCoTypes_ImageList: TImageList;
    flInProgress: boolean;
    flProgressCancelled: boolean;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality);
    destructor Destroy; override;
    procedure lvResult_Clear;
    procedure lvResult_MarkAll;
    procedure lvResult_ClearAll;
    procedure FindByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean);
    procedure lvTypes_Update;
    procedure lvCoTypes_Update;
  end;


implementation

{$R *.dfm}


{TComponentsFindServicePanelProps}
Constructor TfmInsideObjects.Create(pObjFunctionality: TComponentFunctionality);
begin
Inherited Create(nil);
ObjFunctionality:=pObjFunctionality as TCELLVisualizationFunctionality;
ObjFunctionality.AddRef;
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
end;

Destructor TfmInsideObjects.Destroy;
begin
lvResult_Clear;
cbCoTypes_ImageList.Free;
if ObjFunctionality <> nil then ObjFunctionality.Release;
Inherited;
end;

procedure TfmInsideObjects.lvTypes_Update;
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

procedure TfmInsideObjects.lvCoTypes_Update;
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

procedure TfmInsideObjects.lvResult_Clear;
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

procedure TfmInsideObjects.lvResult_MarkAll;
var
  I: integer;
begin
with lvResult do
for I:=0 to Items.Count-1 do Items[I].Checked:=true;
end;

procedure TfmInsideObjects.lvResult_ClearAll;
var
  I: integer;
begin
with lvResult do
for I:=0 to Items.Count-1 do Items[I].Checked:=false;
end;

procedure TfmInsideObjects.FindByObj(const ptrObject: TPtr; const FindTypeID: integer; const flBuiltInType: boolean);
const
  ObjectsPortion = 1;
var
  ObjectsCounter: integer;
  ObjectsStr: WideString;

  CELLs_ColumnCount: integer;
  CELLs_RowCount: integer;
  CELLs_ColumnSize: Double;
  CELLs_RowSize: Double;
  CELLs_X0, CELLs_Y0,
  CELLs_X1, CELLs_Y1,
  CELLs_X2, CELLs_Y2,
  CELLs_X3, CELLs_Y3: Double;

  function CELLs_GetObjectParams(const CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3: Extended; const CELLs_ColumnCount,CELLs_RowCount: Integer; const CELLs_ColumnSize,CELLs_RowSize: Extended; const ptrObj: TPtr; out ObjColIndex,ObjRowIndex: integer; out FailureStr: string): boolean;

    procedure GetPointCellIndexes(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Extended; const ColumnSize,RowSize: Extended; const X,Y: Extended;  out ColIndex,RowIndex: integer);
    var
      X_A,X_B,X_C,X_D: Extended;
      Y_A,Y_B,Y_C,Y_D: Extended;
      XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
    begin
    X_A:=Y1-Y0;X_B:=X0-X1;X_D:=-(X0*X_A+Y0*X_B);
    Y_A:=Y3-Y0;Y_B:=X0-X3;Y_D:=-(X0*Y_A+Y0*Y_B);
    XC:=(Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
    diffXCX0:=XC-X0;
    if X_B <> 0
     then begin
      YC:=-(X_A*XC+X_D)/X_B;
      diffYCY0:=YC-Y0;
      X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if (((-X_B) > 0) AND ((diffXCX0) < 0)) OR (((-X_B) < 0) AND ((diffXCX0) > 0)) then X_L:=-X_L;
      end
     else begin
      YC:=(Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
      diffYCY0:=YC-Y0;
      X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if ((X_A > 0) AND ((diffYCY0) < 0)) OR ((X_A < 0) AND ((diffYCY0) > 0)) then X_L:=-X_L;
      end;
    XC:=(X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
    diffXCX0:=XC-X0;
    if (Y_B <> 0)
     then begin
      YC:=-(Y_A*XC+Y_D)/Y_B;
      diffYCY0:=YC-Y0;
      Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if (((-Y_B) > 0) AND ((diffXCX0) < 0)) OR (((-Y_B) < 0) AND ((diffXCX0) > 0)) then Y_L:=-Y_L;
      end
     else begin
      YC:=(X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
      diffYCY0:=YC-Y0;
      Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if ((Y_A > 0) AND ((diffYCY0) < 0)) OR ((Y_A < 0) AND ((diffYCY0) > 0)) then Y_L:=-Y_L;
      end;
    //.
    ColIndex:=Trunc(X_L/ColumnSize);
    RowIndex:=Trunc(Y_L/RowSize);
    end;

  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    P0,P1,P2,P3: TPoint;
    P0_ColIndex,P0_RowIndex: integer;
    P1_ColIndex,P1_RowIndex: integer;
    P2_ColIndex,P2_RowIndex: integer;
    P3_ColIndex,P3_RowIndex: integer;
  begin
  Result:=false;
  try
  with ObjFunctionality.Space do begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.Width = 0 then Raise Exception.Create('object width is null'); //. =>
  with TSpaceObjPolylinePolygon.Create(ObjFunctionality.Space,Obj) do
  try
  if Count < 4 then Raise Exception.Create('nodes count less than 4'); //. =>
  if Count > 4 then Raise Exception.Create('too many nodes'); //. =>
  P0.X:=Nodes[0].X; P0.Y:=Nodes[0].Y;
  P1.X:=Nodes[1].X; P1.Y:=Nodes[1].Y;
  P2.X:=Nodes[2].X; P2.Y:=Nodes[2].Y;
  P3.X:=Nodes[3].X; P3.Y:=Nodes[3].Y;
  finally
  Destroy;
  end;
  //.
  GetPointCellIndexes(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3,  CELLs_ColumnSize,CELLs_RowSize, P0.X,P0.Y,  P0_ColIndex,P0_RowIndex);
  GetPointCellIndexes(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3,  CELLs_ColumnSize,CELLs_RowSize, P1.X,P1.Y,  P1_ColIndex,P1_RowIndex);
  GetPointCellIndexes(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3,  CELLs_ColumnSize,CELLs_RowSize, P2.X,P2.Y,  P2_ColIndex,P2_RowIndex);
  GetPointCellIndexes(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3,  CELLs_ColumnSize,CELLs_RowSize, P3.X,P3.Y,  P3_ColIndex,P3_RowIndex);
  if ((P0_ColIndex <> P1_ColIndex) OR (P0_RowIndex <> P1_RowIndex)) OR ((P1_ColIndex <> P2_ColIndex) OR (P1_RowIndex <> P2_RowIndex)) OR ((P2_ColIndex <> P3_ColIndex) OR (P2_RowIndex <> P3_RowIndex)) then Raise Exception.Create('big object for cell'); //. =>
  if NOT (((0 <= P0_ColIndex) AND (P0_ColIndex < CELLs_ColumnCount)) AND ((0 <= P0_RowIndex) AND (P0_RowIndex < CELLs_RowCount))) then Raise Exception.Create('object index out of range'); //. =>
  //.
  ObjColIndex:=P0_ColIndex;
  ObjRowIndex:=P0_RowIndex;
  //.
  Result:=true;
  end;
  except
    on E: Exception do FailureStr:=E.Message;
    end;
  end;

  procedure ProcessObjects;
  var
    SQLExpr: WideString;
    sIDs: WideString;
    ptrNewItem: pointer;
    II: integer;
    OwnerFunctionality: TComponentFunctionality;
    ObjColIndex,ObjRowIndex: integer;
    FailureStr: string;

    function ProcessOwnerVisualization(const OwnerFunctionality: TComponentFunctionality;  out ObjColIndex,ObjRowIndex: integer; out FailureStr: string): boolean;
    var
      Components: TComponentsList;
    begin
    Result:=false;
    if OwnerFunctionality.QueryComponents(TBase2DVisualizationFunctionality, Components)
     then
      try
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(Components[0]^).idTComponent,TItemComponentsList(Components[0]^).idComponent)) do
      try
      Result:=CELLs_GetObjectParams(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3,  CELLs_ColumnCount,CELLs_RowCount, CELLs_ColumnSize,CELLs_RowSize,  Ptr,    ObjColIndex,ObjRowIndex, FailureStr);
      finally
      Release;
      end;
      finally
      Components.Destroy;
      end;
    end;

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
        OwnerFunctionality:=TComponentFunctionality_Create(FieldValues['TOwner'],FieldValues['Owner_Key']);
        with OwnerFunctionality do
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
        if ProcessOwnerVisualization(OwnerFunctionality,  ObjColIndex,ObjRowIndex, FailureStr)
         then begin
          SubItems.Add(IntToStr(ObjColIndex));
          SubItems.Add(IntToStr(ObjRowIndex));
          end
         else begin
          SubItems.Add('');
          SubItems.Add('');
          end;
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
          OwnerFunctionality:=TComponentFunctionality_Create(FieldValues['TOwner'],FieldValues['Owner_Key']);
          with TCoComponentFunctionality(OwnerFunctionality) do
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
          if ProcessOwnerVisualization(OwnerFunctionality,  ObjColIndex,ObjRowIndex, FailureStr)
           then begin
            SubItems.Add(IntToStr(ObjColIndex));
            SubItems.Add(IntToStr(ObjRowIndex));
            end
           else begin
            SubItems.Add('');
            SubItems.Add('');
            end;
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
CELLs_ColumnCount:=ObjFunctionality.ColCount;
CELLs_RowCount:=ObjFunctionality.RowCount;
CELLs_ColumnSize:=ObjFunctionality.ColSize;
CELLs_RowSize:=ObjFunctionality.RowSize;
ObjFunctionality.GetCoordinates(CELLs_X0,CELLs_Y0, CELLs_X1,CELLs_Y1, CELLs_X2,CELLs_Y2, CELLs_X3,CELLs_Y3);
ptrLay:=Lays;
ObjCounter:=0;
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  if flLay then Inc(ObjCounter,ObjectsCount);
  ptrLay:=ptrNext;
  end;
//.
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
      Application.ProcessMessages;
      if flProgressCancelled then Raise Exception.Create('process terminated by user'); //. =>
      end;
    end;
  ptrLay:=ptrNext;
  end;
//.
ProcessObjects;
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


procedure TfmInsideObjects.lvResultDblClick(Sender: TObject);
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

procedure TfmInsideObjects.sbStartStopClick(Sender: TObject);
var
  FindTypeID: integer;
  ptrObj: TPtr;
begin
if NOT flInProgress
 then begin
  ptrObj:=ObjFunctionality.Ptr;
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

procedure TfmInsideObjects.rbByTypeClick(Sender: TObject);
begin
if rbByType.Checked
 then begin
  cbTypes.Enabled:=true;
  cbCoTypes.Enabled:=false;
  end;
end;

procedure TfmInsideObjects.rbByCoTypeClick(Sender: TObject);
begin
if rbByCoType.Checked
 then begin
  cbTypes.Enabled:=false;
  cbCoTypes.Enabled:=true;
  end;
end;

procedure TfmInsideObjects.lvResult_bbMarkAllClick(Sender: TObject);
begin
lvResult_MarkAll;
end;

procedure TfmInsideObjects.lvResult_bbClearAllClick(Sender: TObject);
begin
lvResult_ClearAll;
end;

end.
