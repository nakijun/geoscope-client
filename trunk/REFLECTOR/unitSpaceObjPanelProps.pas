unit unitSpaceObjPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Functionality, GlobalSpaceDefines, unitProxySpace,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, 
  StdCtrls, ExtCtrls, RXCtrls, Buttons, ComCtrls;

type
  TSpaceObj_PanelProps = class(TForm)
    pnlComponentsTree: TPanel;
    lbTreeCaption: TRxLabel;
    tvComponents: TTreeView;
    pnlObjProps: TPanel;
    Bevel2: TBevel;
    lbPolylineFillColor: TLabel;
    lbPolylineColor: TLabel;
    sbPolylineColorChange: TSpeedButton;
    lbLay: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    sbPolylineWidthTo0: TSpeedButton;
    lbFillColor: TRxLabel;
    sbPolylineFillColorChange: TSpeedButton;
    cbCurrentLay: TComboBox;
    pnlPolylineWidth: TPanel;
    cbxPolylineLoop: TCheckBox;
    cbxPolylineFill: TCheckBox;
    ColorDialog: TColorDialog;
    bvlStrobing: TBevel;
    cbStrobing: TCheckBox;
    edStrobingInterval: TEdit;
    lbStrobingInterval: TLabel;
    sbPolylineColorClear: TSpeedButton;
    sbPolylineFillColorClear: TSpeedButton;
    cbUserSecurity: TCheckBox;
    cbDetailsNoIndex: TCheckBox;
    cbNotifyOwnerOnChange: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCurrentLayChange(Sender: TObject);
    procedure sbPolylineColorChangeClick(Sender: TObject);
    procedure sbPolylineFillColorChangeClick(Sender: TObject);
    procedure pnlPolylineWidthMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlPolylineWidthMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlPolylineWidthMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbPolylineWidthTo0Click(Sender: TObject);
    procedure cbxPolylineLoopClick(Sender: TObject);
    procedure cbxPolylineFillClick(Sender: TObject);
    procedure tvComponentsDblClick(Sender: TObject);
    procedure cbStrobingClick(Sender: TObject);
    procedure edStrobingIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure sbPolylineColorClearClick(Sender: TObject);
    procedure sbPolylineFillColorClearClick(Sender: TObject);
    procedure cbUserSecurityClick(Sender: TObject);
    procedure cbDetailsNoIndexClick(Sender: TObject);
    procedure pnlObjPropsDblClick(Sender: TObject);
    procedure cbNotifyOwnerOnChangeClick(Sender: TObject);
  private
    { Private declarations }
    Reflector: TAbstractReflector;
    ptrObj: TPtr;
    Mouse_LastX: integer;
    flUpdating: boolean;
  public
    { Public declarations }
    flFreeOnClose: boolean;

    Constructor Create(pReflector: TAbstractReflector; pPtrObj: TPtr);
    Destructor Destroy; override;
    procedure Update; overload;
    procedure cbCurrentLay_Update;
    procedure lbLay__Hint_Update;
    procedure tvComponents_Update;
    procedure HideComponentsTree;
    procedure SetByForm(Form: TForm);
  end;

implementation

{$R *.DFM}

Constructor TSpaceObj_PanelProps.Create(pReflector: TAbstractReflector; pPtrObj: TPtr);
begin
Inherited Create(nil);
if pPtrObj = nilPtr then Raise Exception.Create('TSpaceObj_PanelProps.Create: pPtrObj is nil');
Reflector:=pReflector;
ptrObj:=pPtrObj;
tvComponents.Images:=TypesImageList;
flUpdating:=false;
flFreeOnClose:=true;
Update;
end;

Destructor TSpaceObj_PanelProps.Destroy;
begin
Inherited;
end;

procedure TSpaceObj_PanelProps.Update;
var
  Obj: TSpaceObj;
begin
flUpdating:=true;
try
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
lbPolylineColor.Color:=Obj.Color;
pnlPolylineWidth.Caption:=FloatToStr(Obj.Width);
lbPolylineFillColor.Color:=Obj.ColorFill;
cbxPolylineLoop.Checked:=Obj.flagLoop;
if Obj.flagLoop
 then begin
  cbxPolylineFill.Enabled:=true;
  cbxPolylineFill.Checked:=Obj.flagFill;
  if Obj.flagFill
   then begin
    sbPolylineFillColorChange.Enabled:=true;
    lbPolylineFillColor.Enabled:=true;
    lbFillColor.Enabled:=true;
    end
   else begin
    sbPolylineFillColorChange.Enabled:=false;
    lbPolylineFillColor.Enabled:=false;
    lbFillColor.Enabled:=false;
    end;
  end
 else begin
  cbxPolylineFill.Enabled:=false;
  cbxPolylineFill.Checked:=Obj.flagFill;
  sbPolylineFillColorChange.Enabled:=false;
  lbPolylineFillColor.Enabled:=false;
  lbFillColor.Enabled:=false;
  end;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
if (Strobing)
 then begin
  cbStrobing.Checked:=true;
  edStrobingInterval.Text:=IntToStr(StrobingInterval);
  lbStrobingInterval.Enabled:=true;
  edStrobingInterval.Enabled:=true;
  end
 else begin
  cbStrobing.Checked:=false;
  edStrobingInterval.Text:='';
  lbStrobingInterval.Enabled:=false;
  edStrobingInterval.Enabled:=false;
  end;
cbUserSecurity.Checked:=flUserSecurity;
cbDetailsNoIndex.Checked:=flDetailsNoIndex;
cbNotifyOwnerOnChange.Checked:=flNotifyOwnerOnChange;
finally
Release;
end;
cbCurrentLay_Update;
tvComponents_Update;
finally
flUpdating:=false;
end;
end;

procedure TSpaceObj_PanelProps.cbCurrentLay_Update;

  function TreateLay(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    LayFunctionality: TLay2DVisualizationFunctionality;
  begin
  Result:=false;
  with Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.idTObj = idTLay2DVisualization
   then begin
    try
    LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Obj.idObj));
    with LayFunctionality do
    try
    cbCurrentLay.Items.Insert(0,Name);
    cbCurrentLay.Items.Objects[0]:=TObject(idObj);
    finally
    Release;
    end;
    except
      end;
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   if TreateLay(ptrOwnerObj) then Exit;
   ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
   end;
  end;
  end;

var
  Lay,SubLay: integer;
  ptrLay: TPtr;
  LayObj: TSpaceObj;
  I: integer;
begin
cbCurrentLay.Items.BeginUpdate;
try
cbCurrentLay.Clear;
TreateLay(Reflector.Space.ptrRootObj);
finally
cbCurrentLay.Items.EndUpdate;
end;
with Reflector.Space do begin
Obj_GetLayInfo(ptrObj, Lay,SubLay);
ptrLay:=Lay_Ptr(Lay);
ReadObj(LayObj,SizeOf(LayObj), ptrLay);
end;
for I:=0 to cbCurrentLay.Items.Count-1 do
  if Integer(cbCurrentLay.Items.Objects[I]) = LayObj.idObj
   then begin
    cbCurrentLay.ItemIndex:=I;
    cbCurrentLay.Hint:=cbCurrentLay.Items[cbCurrentLay.ItemIndex];
    Break;
    end;
lbLay__Hint_Update;
if SubLay > 0
 then cbCurrentLay.Enabled:=false
 else cbCurrentLay.Enabled:=true;
end;

procedure TSpaceObj_PanelProps.lbLay__Hint_Update;
var
  Lay,SubLay: integer;
begin
with Reflector.Space do begin
Obj_GetLayInfo(ptrObj, Lay,SubLay);
lbLay.Hint:='Lay: '+IntToStr(Lay)+', Sublay: '+IntToStr(SubLay);
end;
end;

procedure TSpaceObj_PanelProps.cbCurrentLayChange(Sender: TObject);
begin
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_idType(ptrObj),Reflector.Space.Obj_ID(ptrObj))) do
try
ChangeLay(Integer(cbCurrentLay.Items.Objects[cbCurrentLay.ItemIndex]));
finally
Release;
end;
end;

procedure TSpaceObj_PanelProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if flFreeOnClose then Action:=caFree;
end;

procedure TSpaceObj_PanelProps.sbPolylineColorChangeClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
ColorDialog.Color:=Obj.Color;
if ColorDialog.Execute AND (ColorDialog.Color <> Obj.Color)
 then begin
  Obj.Color:=ColorDialog.Color;
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
  finally
  Release;
  end;
  Reflector.RevisionReflect(ptrObj, actRefresh);
  lbPolylineColor.Color:=Obj.Color;
  end;
end;

procedure TSpaceObj_PanelProps.sbPolylineFillColorChangeClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
ColorDialog.Color:=Obj.ColorFill;
if ColorDialog.Execute AND (ColorDialog.Color <> Obj.ColorFill)
 then begin
  Obj.ColorFill:=ColorDialog.Color;
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
  finally
  Release;
  end;
  Reflector.RevisionReflect(ptrObj, actRefresh);
  lbPolylineFillColor.Color:=Obj.ColorFill;
  end;
end;

procedure TSpaceObj_PanelProps.pnlPolylineWidthMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbRight
 then begin
  Mouse_LastX:=X;
  end;
end;

procedure TSpaceObj_PanelProps.pnlPolylineWidthMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  dX: integer;
  dW: Extended;
  NewWidth: Extended;
  Obj: TSpaceObj;
begin
if (Mouse_LastX > 0) AND (Reflector is TReflector)
 then with TReflector(Reflector) do begin //. относительное изменение толщины
  dX:=X-Mouse_LastX;
  dW:=dX/ReflectionWindow.Scale;
  Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  NewWidth:=Obj.Width+dW;
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  Width:=NewWidth;
  finally
  Release;
  end;
  pnlPolylineWidth.Caption:=FloatToStr(NewWidth);
  (Sender as TControl).Cursor:=crHSplit;
  Mouse_LastX:=X;
  end;
end;

procedure TSpaceObj_PanelProps.pnlPolylineWidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  procedure AlignToFormatObj(const ptrObj: TPtr);
  const
    CellFactor = 1/10;
  var
    Obj: TSpaceObj;
    P: TPoint;
    ptrFormatObj: TPtr;
    FormatNodes: TList;
    FormatSizeX,FormatSizeY: integer;
    CellSize,CellStep: Extended;
    NewWidth: Extended;
    ptrDestroyPoint: pointer;
    I: integer;
  begin
  with Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.ptrFirstPoint = nilPtr then Exit; //. ->
  ReadObj(P,SizeOf(P), Obj.ptrFirstPoint);
  end;
  if ObjectIsInheritedFrom(Reflector,TReflector) AND TReflector(Reflector).Reflecting.GetObjByPoint(P,ptrObj, ptrFormatObj)
   then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Reflector.Space.Obj_IDType(ptrFormatObj),Reflector.Space.Obj_ID(ptrFormatObj))) do
    try
    if GetFormatNodes(FormatNodes,FormatSizeX,FormatSizeY)
     then
      try
      CellSize:=Sqrt(sqr(TPoint(FormatNodes[1]^).X-TPoint(FormatNodes[0]^).X)+sqr(TPoint(FormatNodes[1]^).Y-TPoint(FormatNodes[0]^).Y));
      CellStep:=CellSize*CellFactor;
      Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
      NewWidth:=(Round((Obj.Width/2)/CellStep)*CellStep)*2;
      if NewWidth < 0 then NewWidth:=0;
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
      try
      Width:=NewWidth;
      finally
      Release;
      end;
      //.
      pnlPolylineWidth.Caption:=FloatToStr(NewWidth);
      finally
      for I:=0 to FormatNodes.Count-1 do begin
        ptrDestroyPoint:=FormatNodes[I];
        FreeMem(ptrDestroyPoint,SizeOf(TPoint));
        end;
      FormatNodes.Destroy;
      end;
    finally
    Release;
    end;
  end;

begin
if Button = mbRight
 then with Reflector do begin
  AlignToFormatObj(ptrObj);
  RevisionReflect(ptrObj, actChange);
  Mouse_LastX:=-1;
  (Sender as TControl).Cursor:=crDefault;
  end;
end;

procedure TSpaceObj_PanelProps.sbPolylineWidthTo0Click(Sender: TObject);
var
  Obj: TSpaceObj;
begin
with Reflector do begin
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
Obj.Width:=0;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
finally
Release;
end;
pnlPolylineWidth.Caption:='0';
RevisionReflect(ptrObj, actChange);
end;
end;

procedure TSpaceObj_PanelProps.cbxPolylineLoopClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if flUpdating then Exit; //. ->
with Reflector do begin
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
Obj.flagLoop:=cbxPolylineLoop.Checked;
try
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
finally
Release;
end;
if Obj.flagLoop
 then begin
  cbxPolylineFill.Enabled:=true;
  sbPolylineFillColorChange.Enabled:=true;
  lbPolylineFillColor.Enabled:=true;
  lbFillColor.Enabled:=true;
  end
 else begin
  cbxPolylineFill.Enabled:=false;
  sbPolylineFillColorChange.Enabled:=false;
  lbPolylineFillColor.Enabled:=false;
  lbFillColor.Enabled:=false;
  end;
finally
RevisionReflect(ptrObj, actChange);
end;
end;
end;

procedure TSpaceObj_PanelProps.cbxPolylineFillClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if flUpdating then Exit; //. ->
with Reflector do begin
Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
Obj.flagFill:=cbxPolylineFill.Checked;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
finally
Release;
end;
if Obj.flagFill
 then begin
  sbPolylineFillColorChange.Enabled:=true;
  lbPolylineFillColor.Enabled:=true;
  lbFillColor.Enabled:=true;
  end
 else begin
  sbPolylineFillColorChange.Enabled:=false;
  lbPolylineFillColor.Enabled:=false;
  lbFillColor.Enabled:=false;
  end;
RevisionReflect(ptrObj, actRefresh);
end;
end;

procedure TSpaceObj_PanelProps.cbStrobingClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if flUpdating then Exit; //. ->
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
Strobing:=cbStrobing.Checked;
if cbStrobing.Checked
 then begin
  edStrobingInterval.Text:=IntToStr(StrobingInterval);
  lbStrobingInterval.Enabled:=true;
  edStrobingInterval.Enabled:=true;
  end
 else begin
  edStrobingInterval.Text:='';
  lbStrobingInterval.Enabled:=false;
  edStrobingInterval.Enabled:=false;
  end;
finally
Release;
end;
end;

procedure TSpaceObj_PanelProps.edStrobingIntervalKeyPress(Sender: TObject; var Key: Char);
var
  Obj: TSpaceObj;
begin
if Key = #$0D
 then begin
  Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  StrobingInterval:=StrToInt(edStrobingInterval.Text);
  finally
  Release;
  end;
  end;
end;

procedure TSpaceObj_PanelProps.tvComponents_Update;

  procedure GetTreeObj(Node: TTreeNode; const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    Info: string;
    ImageIndex: integer;
    ParentNode: TTreeNode;
    ptrOwnerObj: TPtr;
  begin
  Reflector.Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
  //. извлечение информации о компоненте
  with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  Info:=TypeFunctionality.Name;
  if Name <> '' then Info:=Info+'('+Name+')';
  ImageIndex:=TypeFunctionality.ImageList_Index;
  finally
  Release;
  end;
  //. создаем и заполняем новый узел
  ParentNode:=tvComponents.Items.AddChild(Node,Info);
  ParentNode.ImageIndex:=ImageIndex;
  ParentNode.SelectedIndex:=ParentNode.ImageIndex;
  ParentNode.Data:=Pointer(ptrObj);
  //. обрабатываем собственные компоненты
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    GetTreeObj(ParentNode,ptrOwnerObj);
    Reflector.Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

begin
tvComponents.Items.BeginUpdate;
try
tvComponents.Items.Clear;
GetTreeObj(nil, ptrObj);
finally
tvComponents.Items.EndUpdate;
end;
end;



procedure TSpaceObj_PanelProps.tvComponentsDblClick(Sender: TObject);
var
  ptrComponent: TPtr;
begin
if TPtr(tvComponents.Selected.Data) = nilPtr then Exit; //. ->
ptrComponent:=TPtr(tvComponents.Selected.Data);
with Reflector do begin
with TComponentFunctionality_Create(Space.Obj_IDType(ptrComponent),Space.Obj_ID(ptrComponent)) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
flFreeOnClose:=false;
Left:=Self.Left+Round((Self.Width-Width)/2);
Top:=Self.Top+Self.Height-Height-10;
Show;
end;
finally
Release;
end;
end;
tvComponents.Items.BeginUpdate;
try
tvComponents.Selected.Expanded:=NOT tvComponents.Selected.Expanded;
finally
tvComponents.Items.EndUpdate;
end;
end;

procedure TSpaceObj_PanelProps.HideComponentsTree;
begin
pnlComponentsTree.Hide;
Width:=pnlObjProps.Width;
end;

procedure TSpaceObj_PanelProps.SetByForm(Form: TForm);
begin
Left:=Form.Left;
Top:=Form.Top+Form.Height;
Width:=Form.Width;
Height:=bvlStrobing.Top+bvlStrobing.Height+4;
end;


procedure TSpaceObj_PanelProps.sbPolylineColorClearClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
Obj.Color:=clNone;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
finally
Release;
end;
Reflector.RevisionReflect(ptrObj, actRefresh);
lbPolylineColor.Color:=Self.Color;
end;

procedure TSpaceObj_PanelProps.sbPolylineFillColorClearClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
Obj.ColorFill:=clNone;
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
SetProps(Obj.flagLoop,Obj.Color,Obj.Width,Obj.flagFill,Obj.ColorFill);
finally
Release;
end;
Reflector.RevisionReflect(ptrObj, actRefresh);
lbPolylineFillColor.Color:=Self.Color;
end;

procedure TSpaceObj_PanelProps.cbUserSecurityClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if (flUpdating) then Exit; //. ->
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
flUserSecurity:=cbUserSecurity.Checked;
finally
Release;
end;
end;

procedure TSpaceObj_PanelProps.cbDetailsNoIndexClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if (flUpdating) then Exit; //. ->
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
flDetailsNoIndex:=cbDetailsNoIndex.Checked;
finally
Release;
end;
end;

procedure TSpaceObj_PanelProps.cbNotifyOwnerOnChangeClick(Sender: TObject);
var
  Obj: TSpaceObj;
begin
if (flUpdating) then Exit; //. ->
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
flNotifyOwnerOnChange:=cbNotifyOwnerOnChange.Checked;
finally
Release;
end;
end;

procedure TSpaceObj_PanelProps.pnlObjPropsDblClick(Sender: TObject);
var
  minX,minY,maxX,maxY,S: Extended;
begin
Reflector.Space.Obj_GetMinMax({out} minX,minY,maxX,maxY, ptrObj);
S:=(maxX-minX)*(maxY-minY);
ShowMessage('Ptr: '+IntToStr(ptrObj)+#$0D#$0A+'Container square: '+FormatFloat('0.000',S));
end;


end.
