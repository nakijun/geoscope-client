unit unitReflectorObjectStandaloneEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Math, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesDefines, TypesFunctionality, unitReflector,
  ExtCtrls, Buttons, StdCtrls;

const
  WM_UPDATEOBJECT = WM_USER+1;
  WM_HIDEEDITOR = WM_USER+2;
type
  TfmReflectorObjectStandaloneEditor = class;

  TObjectEditorHandle = record
    X: integer;
    Y: integer;
    NodeIndex: integer;
    flSelected: boolean;
    flChanged: boolean;
  end;

  TObjectEditorWorkWindow = record
    Xmn,Ymn,
    Xmx,Ymx: SmallInt;
  end;

  TEditingMode = (emNone,emMoving,emWidthScaling,emNodeCreating);

  TObjectEditor = class
  private
    EditorForm: TfmReflectorObjectStandaloneEditor;
    FigureWinRefl: TFigureWinRefl;
    AdditiveFigureWinRefl: TFigureWinRefl;
    ObjReflecting_FWR: TFigureWinRefl;
    ObjReflecting_AFWR: TFigureWinRefl;
    WorkWindow: TObjectEditorWorkWindow;
    HandleSize: integer;
    Handles: TList;
    EditingMode: TEditingMode;
    EditingHandle: pointer;
    flBodyChanged: boolean;
    flNodesChanged: boolean;

    procedure UpdateWorkWindow;
    procedure ReflectWorkWindow;
    procedure RestoreWorkWindow;
    procedure Handles_Prepare;
    procedure Handles_Clear;
    procedure Handles_SelectOne(const NodeIndex: integer);
    procedure Handles_DeselectAll;
    function Handles_GetTwoNearestHandles(const pX,pY: integer; out Handle0,Handle1: pointer; out Dist: Extended): boolean;
    procedure RecalculateFiguresForNodeChanged;
    procedure RecalculateFiguresForWidthChanged;
    function Line_GetPointDist(const X0,Y0,X1,Y1: integer; const X,Y: integer; out D: Extended): boolean;
    function Object_GetNodePtrByIndex(const NodeIndex: integer): TPtr;
    procedure Figure_ClearNodes;
    procedure Figure_DestroySelectedNodes;
  public
    ptrObject: TPtr;

    Constructor Create(const pEditorForm: TfmReflectorObjectStandaloneEditor; const pptrObject: TPtr);
    Destructor Destroy; override;
    procedure Prepare;
    procedure Reflect;
    function CheckEditingMode(const pX,pY: integer): TEditingMode;
    function SetEditingMode(const pX,pY: integer): TEditingMode; overload;
    procedure SetEditingMode(const pEM: TEditingMode); overload;
    procedure ProcessEditingPoint(const pX,pY: integer);
    procedure ProcessEditingPointForCreateOrDestroy(const pX,pY: integer);
    procedure StopEditing;
    function IsEditing: boolean;
    function IsChanged: boolean;
  end;


  TfmReflectorObjectStandaloneEditor = class(TForm)
    Panel1: TPanel;
    sbEditing: TScrollBox;
    pbEditingSpace: TPaintBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    pnlObjColor: TPanel;
    Label2: TLabel;
    cbObjflLoop: TCheckBox;
    pnlObjFillColor: TPanel;
    cbObjflFill: TCheckBox;
    ColorDialog: TColorDialog;
    Panel2: TPanel;
    cbNodeCreating: TCheckBox;
    sbClearNodes: TSpeedButton;
    sbDestroySelectedNodes: TSpeedButton;
    sbValidateAndExit: TSpeedButton;
    sbShowPropsPanel: TSpeedButton;
    sbValidate: TSpeedButton;
    sbClose: TSpeedButton;
    procedure pbEditingSpacePaint(Sender: TObject);
    procedure pbEditingSpaceMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pbEditingSpaceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbEditingSpaceMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure cbNodeCreatingClick(Sender: TObject);
    procedure sbClearNodesClick(Sender: TObject);
    procedure sbDestroySelectedNodesClick(Sender: TObject);
    procedure pnlObjColorClick(Sender: TObject);
    procedure cbObjflLoopClick(Sender: TObject);
    procedure cbObjflFillClick(Sender: TObject);
    procedure pnlObjFillColorClick(Sender: TObject);
    procedure sbValidateAndExitClick(Sender: TObject);
    procedure sbShowPropsPanelClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbValidateClick(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
    Editor: TObjectEditor;
    EditingSpaceBackgroundBMP: TBitmap;
    EditingSpaceBMP: TBitmap;
    WindowRefl: TWindow;
    ReflectorWindow: TReflectionWindowStrucEx;
    ptrObj: TPtr;
    Updater: TComponentPresentUpdater;
    flUpdating: boolean;

    procedure wmUPDATEOBJECT(var Message: TMessage); message WM_UPDATEOBJECT;
    procedure wmHIDE(var Message: TMessage); message WM_HIDEEDITOR;
    procedure UpdateObject;
    procedure HideMe;
  public
    { Public declarations }

    Constructor Create(const pReflector: TReflector; const pptrObj: TPtr);
    Destructor Destroy; override;
    procedure Update;
    procedure RepaintSpace;
    procedure PaintSpace;
    procedure ValidateTheObject;
  end;

implementation

{$R *.dfm}


Constructor TfmReflectorObjectStandaloneEditor.Create(const pReflector: TReflector; const pptrObj: TPtr);
var
  Window: TReflectionWindowStrucEx;
begin
Inherited Create(nil);
Reflector:=pReflector;
Reflector.ReflectionWindow.GetWindow(true, Window);
//.
ptrObj:=pptrObj;
//.
with Window do WindowRefl:=TWindow.Create(Xmn-3,Ymn-3,Xmx+3,Ymx+3);
//.
EditingSpaceBackgroundBMP:=TBitmap.Create;
with Window do begin
EditingSpaceBackgroundBMP.Width:=(Xmx-Xmn+1);
EditingSpaceBackgroundBMP.Height:=(Ymx-Ymn+1);
end;
EditingSpaceBMP:=TBitmap.Create;
with Window do begin
EditingSpaceBMP.Width:=(Xmx-Xmn+1);
EditingSpaceBMP.Height:=(Ymx-Ymn+1);
end;
//.
Editor:=nil;
//.
flUpdating:=false;
//.
Update();
//.
Left:=Reflector.Left;
Top:=Reflector.Top;
Width:=Reflector.Width;
Height:=Reflector.Height;
//.
with Reflector.Space do 
with TComponentFunctionality_Create(Obj_idType(ptrObj),Obj_ID(ptrObj)) do
try
Updater:=TPresentUpdater_Create(UpdateObject,HideMe);
finally
Release;
end;
end;

Destructor TfmReflectorObjectStandaloneEditor.Destroy;
begin
Updater.Free;
Editor.Free;
EditingSpaceBMP.Free;
EditingSpaceBackgroundBMP.Free;
WindowRefl.Free;
Inherited;
end;

procedure TfmReflectorObjectStandaloneEditor.Update;
begin
flUpdating:=true;
try
with Reflector do begin
Reflecting.ReflectLimitedByTime(-1,ptrObj);
Reflecting.BMP.Canvas.Lock;
try
BitBlt(EditingSpaceBackgroundBMP.Canvas.Handle, 0, 0, EditingSpaceBackgroundBMP.Width,EditingSpaceBackgroundBMP.Height,  Reflecting.BMP.Canvas.Handle, 0, 0, SRCCOPY);
finally
Reflecting.BMP.Canvas.UnLock;
end;
Reflecting.Reflect(); //. restore reflector view
end;
//.
pbEditingSpace.Width:=EditingSpaceBackgroundBMP.Width;
pbEditingSpace.Height:=EditingSpaceBackgroundBMP.Height;
//.
FreeAndNil(Editor);
Editor:=TObjectEditor.Create(Self, ptrObj);
Reflector.ReflectionWindow.GetWindow(false, ReflectorWindow);
//.
pnlObjColor.Color:=Editor.FigureWinRefl.Color;
cbObjflLoop.Checked:=Editor.FigureWinRefl.flagLoop;
if (Editor.FigureWinRefl.flagLoop)
 then begin
  cbObjflFill.Enabled:=true;
  pnlObjFillColor.Enabled:=true;
  end
 else begin
  cbObjflFill.Enabled:=false;
  pnlObjFillColor.Enabled:=false;
  end;
cbObjflFill.Checked:=Editor.FigureWinRefl.flagFill;
if (Editor.FigureWinRefl.flagFill)
 then pnlObjFillColor.Enabled:=true
 else pnlObjFillColor.Enabled:=false;
pnlObjFillColor.Color:=Editor.FigureWinRefl.ColorFill;
finally
flUpdating:=false;
end;
//.
cbNodeCreating.Checked:=false;
//.
RepaintSpace();
end;

procedure TfmReflectorObjectStandaloneEditor.RepaintSpace;
begin
BitBlt(EditingSpaceBMP.Canvas.Handle, 0, 0, EditingSpaceBMP.Width,EditingSpaceBMP.Height,  EditingSpaceBackgroundBMP.Canvas.Handle, 0, 0, SRCCOPY);
if (Editor <> nil) then Editor.Reflect();
BitBlt(pbEditingSpace.Canvas.Handle, 0, 0, pbEditingSpace.Width,pbEditingSpace.Height,  EditingSpaceBMP.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TfmReflectorObjectStandaloneEditor.PaintSpace;
begin
BitBlt(pbEditingSpace.Canvas.Handle, 0, 0, pbEditingSpace.Width,pbEditingSpace.Height,  EditingSpaceBMP.Canvas.Handle, 0, 0, SRCCOPY);
end;

procedure TfmReflectorObjectStandaloneEditor.ValidateTheObject;

  function ConvertScrExtendCrd2RealCrd(SX,SY: extended; var X,Y: TCrd): boolean;
  var
     VS,HS,diffX0X3,diffY0Y3,diffX0X1,diffY0Y1, ofsX,ofsY: Extended;
  begin
  with ReflectorWindow do begin
  Result:=false;
  //.
  VS:=-(SY-Ymn)/(Ymx-Ymn);
  HS:=-(SX-Xmn)/(Xmx-Xmn);
  //.
  diffX0X3:=(X0-X3);diffY0Y3:=(Y0-Y3);
  diffX0X1:=(X0-X1);diffY0Y1:=(Y0-Y1);
  //.
  ofsX:=(diffX0X1)*HS+(diffX0X3)*VS;
  ofsY:=(diffY0Y1)*HS+(diffY0Y3)*VS;
  //.
  X:=(X0+ofsX)/cfTransMeter;
  Y:=(Y0+ofsY)/cfTransMeter;
  //.
  Result:=true;
  end;
  end;

var
  NodesCount: integer;
  Nodes: TByteArray;
  ptr: pointer;
  Xr,Yr: TCrd;
  X,Y: double;
  I: integer;
  _Width: double;
begin
if (Editor = nil) then Exit; //. ->
with Editor do begin
if (NOT flNodesChanged AND NOT flBodyChanged) then Exit; //. ->
NodesCount:=FigureWinRefl.Count;
SetLength(Nodes,SizeOf(NodesCount)+NodesCount*(2*SizeOf(Double)));
ptr:=@Nodes[0];
Integer(ptr^):=NodesCount; Inc(Integer(ptr),SizeOf(NodesCount));
for I:=0 to FigureWinRefl.Count-1 do begin
  ConvertScrExtendCrd2RealCrd(FigureWinRefl.Nodes[I].X,FigureWinRefl.Nodes[I].Y, Xr,Yr); X:=Xr; Y:=Yr;
  Double(ptr^):=X; Inc(Integer(ptr),SizeOf(X));
  Double(ptr^):=Y; Inc(Integer(ptr),SizeOf(Y));
  end;
_Width:=FigureWinRefl.Width/Reflector.ReflectionWindow.Scale;
with Reflector.Space do
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj_idType(ptrObj),Obj_ID(ptrObj))) do
try
if (flNodesChanged)
 then begin
  SetNodes(Nodes,_Width);
  flNodesChanged:=false;
  end;
if (flBodyChanged)
 then begin
  SetProps(FigureWinRefl.flagLoop,FigureWinRefl.Color,_Width,FigureWinRefl.flagFill,FigureWinRefl.ColorFill);
  flBodyChanged:=false;
  end;
finally
Release;
end;
end;
end;

procedure TfmReflectorObjectStandaloneEditor.pbEditingSpacePaint(Sender: TObject);
begin
PaintSpace();
end;

procedure TfmReflectorObjectStandaloneEditor.pbEditingSpaceMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
var
  M: TEditingMode;
begin
if (Editor <> nil)
 then begin
  if (Editor.EditingMode <> emNodeCreating)
   then begin
    if (Editor.EditingMode <> emNone) then Editor.StopEditing;
    M:=Editor.CheckEditingMode(X,Y);
    if (M <> emNone)
     then begin
      Editor.SetEditingMode(X,Y);
      Exit; //. ->
      end;
    end
   else begin
    Editor.ProcessEditingPoint(X,Y);
    end;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.pbEditingSpaceMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if ((Editor <> nil) AND (Editor.EditingMode <> emNodeCreating))
 then
  if (Editor.IsEditing)
   then Editor.StopEditing
   else Editor.ProcessEditingPointForCreateOrDestroy(X,Y);
end;

procedure TfmReflectorObjectStandaloneEditor.pbEditingSpaceMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
if (Editor <> nil)
 then
  if (Editor.EditingMode <> emNodeCreating)
   then begin
    case Editor.CheckEditingMode(X,Y) of
    emMoving: pbEditingSpace.Cursor:=crDrag;
    emWidthScaling: pbEditingSpace.Cursor:=crSizeAll;
    else
      pbEditingSpace.Cursor:=crDefault;
    end;
    if (Editor.IsEditing) then Editor.ProcessEditingPoint(X,Y);
    end
   else pbEditingSpace.Cursor:=crCross;
end;

procedure TfmReflectorObjectStandaloneEditor.cbNodeCreatingClick(Sender: TObject);
begin
if (Editor <> nil)
 then
  if (cbNodeCreating.Checked)
   then begin
    Editor.SetEditingMode(emNodeCreating);
    end
   else begin
    Editor.SetEditingMode(emNone);
    end;
end;

procedure TfmReflectorObjectStandaloneEditor.sbClearNodesClick(Sender: TObject);
begin
if (Editor <> nil)
 then begin
  Editor.Figure_ClearNodes;
  if (NOT cbNodeCreating.Checked) then cbNodeCreating.Checked:=true;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.sbDestroySelectedNodesClick(Sender: TObject);
begin
if (Editor <> nil) then Editor.Figure_DestroySelectedNodes;
end;

procedure TfmReflectorObjectStandaloneEditor.pnlObjColorClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (Editor <> nil)
 then begin
  ColorDialog.Color:=pnlObjColor.Color;
  if (ColorDialog.Execute)
   then begin
    Editor.FigureWinRefl.Color:=ColorDialog.Color;
    Editor.flBodyChanged:=true;
    pnlObjColor.Color:=Editor.FigureWinRefl.Color;
    //.
    Editor.RestoreWorkWindow;
    Editor.RecalculateFiguresForNodeChanged;
    Editor.ReflectWorkWindow;
    PaintSpace();
    end;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.cbObjflLoopClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (Editor <> nil)
 then begin
  Editor.FigureWinRefl.flagLoop:=cbObjflLoop.Checked;
  Editor.flBodyChanged:=true;
  //.
  Editor.RestoreWorkWindow;
  Editor.RecalculateFiguresForNodeChanged;
  Editor.ReflectWorkWindow;
  PaintSpace();
  //.
  if (Editor.FigureWinRefl.flagLoop)
   then begin
    cbObjflFill.Enabled:=true;
    pnlObjFillColor.Enabled:=true;
    end
   else begin
    cbObjflFill.Enabled:=false;
    pnlObjFillColor.Enabled:=false;
    end;
  if (Editor.FigureWinRefl.flagFill)
   then pnlObjFillColor.Enabled:=true
   else pnlObjFillColor.Enabled:=false;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.cbObjflFillClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (Editor <> nil)
 then begin
  Editor.FigureWinRefl.flagFill:=cbObjflFill.Checked;
  Editor.flBodyChanged:=true;
  //.
  Editor.RestoreWorkWindow;
  Editor.RecalculateFiguresForNodeChanged;
  Editor.ReflectWorkWindow;
  PaintSpace();
  //.
  if (Editor.FigureWinRefl.flagFill)
   then pnlObjFillColor.Enabled:=true
   else pnlObjFillColor.Enabled:=false;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.pnlObjFillColorClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
if (Editor <> nil)
 then begin
  ColorDialog.Color:=pnlObjFillColor.Color;
  if (ColorDialog.Execute)
   then begin
    Editor.FigureWinRefl.ColorFill:=ColorDialog.Color;
    Editor.flBodyChanged:=true;
    pnlObjFillColor.Color:=Editor.FigureWinRefl.ColorFill;
    //.
    Editor.RestoreWorkWindow;
    Editor.RecalculateFiguresForNodeChanged;
    Editor.ReflectWorkWindow;
    PaintSpace();
    end;
  end;
end;

procedure TfmReflectorObjectStandaloneEditor.wmUPDATEOBJECT(var Message: TMessage);
begin
if ((Editor <> nil) AND (Editor.IsChanged)) then ValidateTheObject;
Update;
end;

procedure TfmReflectorObjectStandaloneEditor.UpdateObject;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmUPDATEOBJECT(WM) else PostMessage(Handle, WM_UPDATEOBJECT,0,0);
end;

procedure TfmReflectorObjectStandaloneEditor.wmHIDE(var Message: TMessage);
begin
Close;
end;

procedure TfmReflectorObjectStandaloneEditor.HideMe;
var
  WM: TMessage;
begin
if (GetCurrentThreadID = MainThreadID) then wmHIDE(WM) else PostMessage(Handle, WM_HIDEEDITOR,0,0);
end;

procedure TfmReflectorObjectStandaloneEditor.sbShowPropsPanelClick(Sender: TObject);
begin
with Reflector.Space do
with TComponentFunctionality_Create(Obj_idType(ptrObj),Obj_ID(ptrObj)) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show;
end;
finally
Release;
end;
end;

procedure TfmReflectorObjectStandaloneEditor.sbValidateClick(Sender: TObject);
begin
ValidateTheObject;
Update;
end;

procedure TfmReflectorObjectStandaloneEditor.sbValidateAndExitClick(Sender: TObject);
begin
ValidateTheObject;
Close;
end;

procedure TfmReflectorObjectStandaloneEditor.sbCloseClick(Sender: TObject);
begin
Close;
end;



{TObjectEditor}
Constructor TObjectEditor.Create(const pEditorForm: TfmReflectorObjectStandaloneEditor; const pptrObject: TPtr);
begin
Inherited Create;
EditorForm:=pEditorForm;
ptrObject:=pptrObject;
with WorkWindow do begin
Xmn:=-1; Ymn:=-1;
Xmx:=Xmn; Ymx:=Ymn;
end;
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
ObjReflecting_FWR:=TFigureWinRefl.Create;
ObjReflecting_AFWR:=TFigureWinRefl.Create;
Handles:=nil;
HandleSize:=8;
//.
EditingMode:=emNone;
EditingHandle:=nil;
//.
flBodyChanged:=false;
flNodesChanged:=false;
//.
Prepare();
//.
Reflect;
end;

Destructor TObjectEditor.Destroy;
begin
//. clear working window
if ((WorkWindow.Xmn <> -1) AND (WorkWindow.Xmx <> -1)) then RestoreWorkWindow;
//.
Handles_Clear;
ObjReflecting_FWR.Free;
ObjReflecting_AFWR.Free;
AdditiveFigureWinRefl.Free;
FigureWinRefl.Free;
Inherited;
end;

procedure TObjectEditor.Prepare;
begin
//. preparing figures
with EditorForm.Reflector do begin
if (Space.Obj_IsCached(ptrObject)) then Reflecting.Obj_PrepareFigures(ptrObject, ReflectionWindow,EditorForm.WindowRefl,  FigureWinRefl,AdditiveFigureWinRefl);
FigureWinRefl.Width:=FigureWinRefl.Width*ReflectionWindow.Scale;
flBodyChanged:=false;
flNodesChanged:=false;
//.
Reflecting.RecalcReflect();
end;
end;

procedure TObjectEditor.Reflect;
begin
//.
Handles_Prepare;
//.
UpdateWorkWindow;
//.
ReflectWorkWindow;
end;

procedure TObjectEditor.UpdateWorkWindow;
var
  I: integer;
begin
with WorkWindow do begin
Xmn:=-1; Ymn:=-1;
Xmx:=Xmn; Ymx:=Ymn;
if ((FigureWinRefl.CountScreenNodes = 0) AND (AdditiveFigureWinRefl.CountScreenNodes = 0)) then Exit; //. ->
//. calculating Min-Max
if (FigureWinRefl.CountScreenNodes > 0)
 then with FigureWinRefl do begin
  Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
  Xmx:=Xmn; Ymx:=Ymn;
  for I:=1 to CountScreenNodes-1 do begin
    if ScreenNodes[I].X < Xmn
     then
      Xmn:=ScreenNodes[I].X
     else
      if ScreenNodes[I].X > Xmx
       then Xmx:=ScreenNodes[I].X;
    if ScreenNodes[I].Y < Ymn
     then
      Ymn:=ScreenNodes[I].Y
     else
      if ScreenNodes[I].Y > Ymx
       then Ymx:=ScreenNodes[I].Y;
    end;
  if (AdditiveFigureWinRefl.CountScreenNodes > 0)
   then with AdditiveFigureWinRefl do begin
    for I:=0 to CountScreenNodes-1 do begin
      if ScreenNodes[I].X < Xmn
       then
        Xmn:=ScreenNodes[I].X
       else
        if ScreenNodes[I].X > Xmx
         then Xmx:=ScreenNodes[I].X;
      if ScreenNodes[I].Y < Ymn
       then
        Ymn:=ScreenNodes[I].Y
       else
        if ScreenNodes[I].Y > Ymx
         then Ymx:=ScreenNodes[I].Y;
      end;
    end;
  end
 else
  if (AdditiveFigureWinRefl.CountScreenNodes > 0)
   then with AdditiveFigureWinRefl do begin
    Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
    Xmx:=Xmn; Ymx:=Ymn;
    for I:=1 to CountScreenNodes-1 do begin
      if ScreenNodes[I].X < Xmn
       then
        Xmn:=ScreenNodes[I].X
       else
        if ScreenNodes[I].X > Xmx
         then Xmx:=ScreenNodes[I].X;
      if ScreenNodes[I].Y < Ymn
       then
        Ymn:=ScreenNodes[I].Y
       else
        if ScreenNodes[I].Y > Ymx
         then Ymx:=ScreenNodes[I].Y;
      end;
    end;
Xmn:=Xmn-Round(HandleSize/2); Ymn:=Ymn-Round(HandleSize/2);
Xmx:=Xmx+Round(HandleSize/2); Ymx:=Ymx+Round(HandleSize/2);
end;
end;

procedure TObjectEditor.ReflectWorkWindow;
const
  FigureColor = clWhite;
  AdditiveFigureColor = $0080FFFF;
  HandleColor = clYellow;
  SelectedHandleColor = clRed;
  HandleBorderColor = clBlack;

  procedure Handles_Reflect;
  var
    I: integer;
    R: TRect;
  begin
  if (Handles <> nil)
   then with EditorForm.EditingSpaceBMP.Canvas do
    for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do begin
      Pen.Width:=1;
      Pen.Color:=HandleBorderColor;
      if (NOT flSelected)
       then Brush.Color:=HandleColor
       else Brush.Color:=SelectedHandleColor;
      R.Left:=X-Round(HandleSize/2);
      R.Top:=Y-Round(HandleSize/2);
      R.Right:=R.Left+HandleSize;
      R.Bottom:=R.Top+HandleSize;
      //.
      FillRect(R);
      Rectangle(R);
      end;
  end;

  procedure Obj_Reflect(const ptrObject: TPtr; const BMP: TBitmap);
  var
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    OldClippingRegion,ClippingRegion,Rgn: HRGN;
    ObjWindow: TObjWinRefl;
    ObjUpdating: TThread;
  begin
  with EditorForm do
  if (Reflector.Space.Obj_IsCached(ptrObject))
   then begin
    //. clipping if necessary
    flClipping:=false;
    flClipVisible:=false;
    try
    Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrObject);
    if (Obj.Color = clNone)
     then begin
      ptrOwnerObj:=Obj.ptrListOwnerObj;
      while (ptrOwnerObj <> nilPtr) do begin
        Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
        if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
         then begin
          flClipping:=true;
          Reflector.Reflecting.Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, ObjReflecting_FWR,ObjReflecting_AFWR);
          if (ObjReflecting_FWR.CountScreenNodes > 0)
           then
            if (NOT flClipVisible)
             then begin
              ClippingRegion:=CreatePolygonRgn(ObjReflecting_FWR.ScreenNodes, ObjReflecting_FWR.CountScreenNodes, ALTERNATE);
              flClipVisible:=true;
              end
             else begin
              Rgn:=CreatePolygonRgn(ObjReflecting_FWR.ScreenNodes, ObjReflecting_FWR.CountScreenNodes, ALTERNATE);
              CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
              DeleteObject(Rgn);
              end;
          end;
        //.
        ptrOwnerObj:=Obj.ptrNextObj;
        end;
      if (flClipVisible)
       then begin
        BMP.Canvas.Lock;
        try
        ExtSelectClipRgn(BMP.Canvas.Handle, ClippingRegion, RGN_AND);
        finally
        BMP.Canvas.UnLock;
        end;
        end;
      end;
    //.
    if (NOT flClipping OR flClipVisible)
     then begin
      if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
       then begin
        //.
        ObjReflecting_FWR.Assign(FigureWinRefl);
        ObjReflecting_FWR.Width:=ObjReflecting_FWR.Width/Reflector.ReflectionWindow.Scale; //. correct to real width
        ObjReflecting_AFWR.Assign(AdditiveFigureWinRefl);
        //. reflecting obj ...
        ObjUpdating:=nil;
        Reflector.Reflecting.Obj_FigureReflect(ObjReflecting_FWR,ObjReflecting_AFWR,WindowRefl, BMP.Canvas,false, ObjWindow, @ObjUpdating, nil, MaxDouble);
        if (ObjUpdating <> nil) then ObjUpdating.Terminate;
        end;
      end;
    //. end of clipping
    finally
    if (flClipVisible)
     then begin
      BMP.Canvas.Lock;
      try
      SelectClipRgn(BMP.Canvas.Handle, 0);
      finally
      BMP.Canvas.UnLock;
      end;
      DeleteObject(ClippingRegion);
      end;
    end;
    end;
  end;

begin
//. reflecting figures ...
EditorForm.EditingSpaceBMP.Canvas.Lock;
try
//.
try
RestoreWorkWindow();
//.
Obj_Reflect(ptrObject, EditorForm.EditingSpaceBMP);
except
  end;
//.
if (FigureWinRefl.CountScreenNodes > 0)
 then with FigureWinRefl do begin
  with EditorForm.EditingSpaceBMP.Canvas.Pen do begin
  Width:=1;
  Style:=psSolid;
  Color:=FigureColor;
  end;
  EditorForm.EditingSpaceBMP.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  end;
if (AdditiveFigureWinRefl.CountScreenNodes > 0)
 then with AdditiveFigureWinRefl do begin
  with EditorForm.EditingSpaceBMP.Canvas.Pen do begin
  Style:=psSolid;
  Width:=3;
  Color:=AdditiveFigureColor;
  end;
  EditorForm.EditingSpaceBMP.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  with EditorForm.EditingSpaceBMP.Canvas.Pen do begin
  Style:=psSolid;
  Width:=1;
  Color:=FigureColor;
  end;
  EditorForm.EditingSpaceBMP.Canvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
  end;
//. preparing and reflecting node handles
Handles_Reflect;
//.
finally
EditorForm.EditingSpaceBMP.Canvas.UnLock;
end;
end;

procedure TObjectEditor.RestoreWorkWindow;
begin
with WorkWindow do begin
EditorForm.EditingSpaceBMP.Canvas.Lock;
try
EditorForm.EditingSpaceBackgroundBMP.Canvas.Lock;
try
BitBlt(EditorForm.EditingSpaceBMP.Canvas.Handle, Xmn,Ymn, (Xmx-Xmn+1),(Ymx-Ymn+1),  EditorForm.EditingSpaceBackgroundBMP.Canvas.Handle, Xmn,Ymn, SRCCOPY);
finally
EditorForm.EditingSpaceBackgroundBMP.Canvas.UnLock;
end;
finally
EditorForm.EditingSpaceBMP.Canvas.UnLock;
end;
end;
end;

function TObjectEditor.CheckEditingMode(const pX,pY: integer): TEditingMode;
var
  I: integer;
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
begin
Result:=emNone;
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
    if ((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2)))
     then begin
      Result:=emMoving;
      Exit; //. ->
      end;
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    WidthDist:=(FigureWinRefl.Width/2);
    if (Abs(Dist-WidthDist) < (HandleSize/2))
     then begin
      Result:=emWidthScaling;
      Exit; //. ->
      end;
    end;
  end;
end;

function TObjectEditor.SetEditingMode(const pX,pY: integer): TEditingMode;
var
  I: integer;
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
begin
EditingMode:=emNone;
try
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
    if ((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2)))
     then begin
      EditingHandle:=Handles[I];
      //.
      Handles_DeselectAll;
      TObjectEditorHandle(EditingHandle^).flSelected:=true;
      TObjectEditorHandle(EditingHandle^).flChanged:=false;
      //.
      ReflectWorkWindow;
      //.
      EditorForm.PaintSpace();
      //.
      EditingMode:=emMoving;
      Exit; //. ->
      end;
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    WidthDist:=(FigureWinRefl.Width/2);
    if (Abs(Dist-WidthDist) < (HandleSize/2))
     then begin
      EditingMode:=emWidthScaling;
      Exit; //. ->
      end;
    end;
  end;
finally
Result:=EditingMode;
end;
end;

procedure TObjectEditor.SetEditingMode(const pEM: TEditingMode);
begin
EditingMode:=pEM;
case EditingMode of
emNodeCreating: begin
  Handles_SelectOne(FigureWinRefl.Count-1);
  //.
  RestoreWorkWindow;
  ReflectWorkWindow;
  //.
  EditorForm.PaintSpace();
  end;
else
  EditorForm.RepaintSpace();
end;
end;

function TObjectEditor.IsEditing: boolean;
begin
Result:=(EditingMode <> emNone);
end;

procedure TObjectEditor.ProcessEditingPoint(const pX,pY: integer);
var
  H0,H1: pointer;
  Dist: Extended;
  WidthDist: Extended;
  H: pointer;
  I: integer;
begin
case EditingMode of
emMoving:
  if (EditingHandle <> nil)
   then with TObjectEditorHandle(EditingHandle^) do begin
    if (flChanged OR ((sqr(pX-X)+sqr(pY-Y)) > sqr(HandleSize)))
     then begin
      RestoreWorkWindow;
      //. changing
      X:=pX;
      Y:=pY;
      FigureWinRefl.Nodes[NodeIndex].X:=X;
      FigureWinRefl.Nodes[NodeIndex].Y:=Y;
      flNodesChanged:=true;
      //.
      RecalculateFiguresForNodeChanged;
      //.
      ReflectWorkWindow;
      //.
      EditorForm.PaintSpace();
      //.
      flChanged:=true;
      end;
    end;
emWidthScaling:
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then begin
    if (Dist < 1) then Dist:=0;
    //.
    RestoreWorkWindow;
    //.
    FigureWinRefl.Width:=2*Dist;
    flNodesChanged:=true;
    //.
    RecalculateFiguresForWidthChanged;
    //.
    ReflectWorkWindow;
    //.
    EditorForm.PaintSpace();
    end;
emNodeCreating: begin
  //.
  H:=nil;
  if (Handles <> nil)
   then
    for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
      if (((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2))) AND (NodeIndex = FigureWinRefl.Count-1))
       then begin
        H:=Handles[I];
        Break; //. >
        end;
  //.
  if (H = nil)
   then begin //. create new node
    if (FigureWinRefl.Count >= TSpaceObj_maxPointsCount) then Raise Exception.Create('too many nodes'); //. =>
    with FigureWinRefl.Nodes[FigureWinRefl.Count] do begin
    X:=pX;
    Y:=pY;
    end;
    Inc(FigureWinRefl.Count);
    flNodesChanged:=true;
    end
   else begin //. destroy last node
    if (FigureWinRefl.Count > 2)
     then begin
      Dec(FigureWinRefl.Count);
      flNodesChanged:=true;
      FigureWinRefl.Reset;
      end;
    end;
  //.
  RestoreWorkWindow;
  //.
  RecalculateFiguresForNodeChanged;
  //.
  Handles_Prepare;
  //.
  Handles_SelectOne(FigureWinRefl.Count-1);
  //.
  ReflectWorkWindow;
  //.
  EditorForm.PaintSpace();
  end;
end;
end;

procedure TObjectEditor.StopEditing;
var
  newX,newY: TCrd;
begin
try
try
case EditingMode of
emMoving:
  if (EditingHandle <> nil)
   then with TObjectEditorHandle(EditingHandle^) do begin
    try
    if (flChanged)
     then begin
      flSelected:=false;
      flChanged:=false;
      //.
      EditorForm.RepaintSpace();
      end;
    finally
    EditingHandle:=nil;
    end;
    end;
emWidthScaling: begin
  //.
  EditorForm.RepaintSpace();
  end;
end;
finally
EditingMode:=emNone;
end;
except
  RestoreWorkWindow;
  //.
  EditorForm.RepaintSpace();
  //.
  Raise; //. =>
  end;
end;

procedure TObjectEditor.ProcessEditingPointForCreateOrDestroy(const pX,pY: integer);
var
  H: pointer;
  I,J: integer;
  H0,H1: pointer;
  Dist: Extended;
begin
H:=nil;
if (Handles <> nil)
 then
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do
    if (((Abs(pX-X) < Round(HandleSize/2)) AND (Abs(pY-Y) < Round(HandleSize/2))) AND (NodeIndex = FigureWinRefl.Count-1))
     then begin
      H:=Handles[I];
      Break; //. >
      end;
if (H = nil)
 then begin //. creating a node
  if (FigureWinRefl.Count >= TSpaceObj_maxPointsCount) then Raise Exception.Create('too many nodes'); //. =>
  if (Handles_GetTwoNearestHandles(pX,pY,  H0,H1, Dist))
   then with FigureWinRefl do begin
    for I:=0 to Count-1 do
      if (I = TObjectEditorHandle(H1^).NodeIndex)
       then begin
        for J:=Count downto I+1 do Nodes[J]:=Nodes[J-1];
        with Nodes[I] do begin
        X:=pX;
        Y:=pY;
        end;
        Inc(Count);
        flNodesChanged:=true;
        //.
        RestoreWorkWindow;
        //.
        RecalculateFiguresForNodeChanged;
        //.
        Handles_Prepare;
        //.
        Handles_SelectOne(I);
        //.
        ReflectWorkWindow;
        //.
        EditorForm.PaintSpace();
        //.
        Exit; //. ->
        end;
    end;
  end
 else with FigureWinRefl do begin //. destroying node
  for I:=0 to Count-1 do
    if (I = TObjectEditorHandle(H^).NodeIndex)
     then begin
      for J:=I to Count-2 do Nodes[J]:=Nodes[J+1];
      Dec(Count);
      flNodesChanged:=true;
      Reset;
      //.
      RestoreWorkWindow;
      //.
      RecalculateFiguresForNodeChanged;
      //.
      Handles_Prepare;
      //.
      Handles_SelectOne(I);
      //.
      ReflectWorkWindow;
      //.
      EditorForm.PaintSpace();
      //.
      Exit; //. ->
      end;
  end;
end;

procedure TObjectEditor.Handles_Prepare;
var
  I: integer;
  ptrNewHandle: pointer;
begin
Handles_Clear;
with FigureWinRefl do
for I:=0 to Count-1 do with Nodes[I] do
  if (True) //. only visible handles (((X-EditorForm.Reflector.ReflectionWindow.Xmn)*(X-EditorForm.Reflector.ReflectionWindow.Xmx) < 0) AND ((Y-EditorForm.Reflector.ReflectionWindow.Ymn)*(Y-EditorForm.Reflector.ReflectionWindow.Ymx) <= 0))
   then begin
    if (Handles = nil) then Handles:=TList.Create;
    GetMem(ptrNewHandle,SizeOf(TObjectEditorHandle));
    TObjectEditorHandle(ptrNewHandle^).X:=Round(X);
    TObjectEditorHandle(ptrNewHandle^).Y:=Round(Y);
    TObjectEditorHandle(ptrNewHandle^).NodeIndex:=I;
    TObjectEditorHandle(ptrNewHandle^).flSelected:=false;
    Handles.Add(ptrNewHandle);
    end;
end;

procedure TObjectEditor.Handles_Clear;
var
  ptrDestroyHandle: pointer;
  I: integer;
begin
if (Handles <> nil)
 then begin
  for I:=0 to Handles.Count-1 do begin
    ptrDestroyHandle:=Handles[I];
    FreeMem(ptrDestroyHandle,SizeOf(TObjectEditorHandle));
    end;
  FreeAndNil(Handles);
  EditingHandle:=nil;
  end;
end;

procedure TObjectEditor.Handles_SelectOne(const NodeIndex: integer);
var
  I: integer;
begin
Handles_DeselectAll;
if (Handles <> nil)
 then
  for I:=0 to Handles.Count-1 do
    if (TObjectEditorHandle(Handles[I]^).NodeIndex = NodeIndex)
     then begin
      TObjectEditorHandle(Handles[I]^).flSelected:=true;
      Exit; //. ->
      end;
end;

procedure TObjectEditor.Handles_DeselectAll;
var
  I: integer;
begin
if (Handles <> nil)
 then
  for I:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[I]^) do flSelected:=false;
end;

function TObjectEditor.Handles_GetTwoNearestHandles(const pX,pY: integer; out Handle0,Handle1: pointer; out Dist: Extended): boolean;
var
  I: integer;
  MinDist,D: Extended;
begin
Result:=false;
if (Handles <> nil)
 then begin
  Handle0:=nil;
  Handle1:=nil;
  MinDist:=MaxExtended;
  for I:=0 to Handles.Count-2 do
    if (Line_GetPointDist(TObjectEditorHandle(Handles[I]^).X,TObjectEditorHandle(Handles[I]^).Y,TObjectEditorHandle(Handles[I+1]^).X,TObjectEditorHandle(Handles[I+1]^).Y, pX,pY, D))
     then
      if (D < MinDist)
       then begin
        Handle0:=Handles[I];
        Handle1:=Handles[I+1];
        MinDist:=D;
        end;
  if ((FigureWinRefl.flagLoop) AND (TObjectEditorHandle(Handles[0]^).NodeIndex = 0) AND (TObjectEditorHandle(Handles[Handles.Count-1]^).NodeIndex = (FigureWinRefl.Count-1)))
   then
    if (Line_GetPointDist(TObjectEditorHandle(Handles[Handles.Count-1]^).X,TObjectEditorHandle(Handles[Handles.Count-1]^).Y,TObjectEditorHandle(Handles[0]^).X,TObjectEditorHandle(Handles[0]^).Y, pX,pY, D))
     then
      if (D < MinDist)
       then begin
        Handle0:=Handles[Handles.Count-1];
        Handle1:=Handles[0];
        MinDist:=D;
        end;
  Result:=((Handle0 <> nil) AND (Handle1 <> nil));
  if (Result) then Dist:=MinDist;
  end;
end;

procedure TObjectEditor.RecalculateFiguresForNodeChanged;
begin
if (FigureWinRefl.Count > 0)
 then begin
  FigureWinRefl.Reset();
  FigureWinRefl.AttractToLimits(EditorForm.WindowRefl, nil);
  FigureWinRefl.Optimize;
  //.
  if ((FigureWinRefl.Count > 1) AND (FigureWinRefl.Width > 0))
   then with AdditiveFigureWinRefl do begin
    Assign(FigureWinRefl);
    if ValidateAsPolyLine(1.0)
     then begin
      AttractToLimits(EditorForm.WindowRefl, nil);
      Optimize;
      end;
    end
   else AdditiveFigureWinRefl.Clear;
  end
 else begin
  FigureWinRefl.Clear;
  AdditiveFigureWinRefl.Clear;
  end;
//.
UpdateWorkWindow;
end;

procedure TObjectEditor.RecalculateFiguresForWidthChanged;
begin
if (FigureWinRefl.Count > 0)
 then begin
  FigureWinRefl.Reset();
  FigureWinRefl.AttractToLimits(EditorForm.WindowRefl, nil);
  FigureWinRefl.Optimize;
  if ((FigureWinRefl.Count > 1) AND (FigureWinRefl.Width > 0))
   then with AdditiveFigureWinRefl do begin
    Assign(FigureWinRefl);
    if ValidateAsPolyLine(1.0)
     then begin
      AttractToLimits(EditorForm.WindowRefl, nil);
      Optimize;
      end;
    end
   else AdditiveFigureWinRefl.Clear;
  end
 else begin
  FigureWinRefl.Clear;
  AdditiveFigureWinRefl.Clear;
  end;
//.
UpdateWorkWindow;
end;

function TObjectEditor.Line_GetPointDist(const X0,Y0,X1,Y1: integer; const X,Y: integer; out D: Extended): boolean;
var
   C,QdC,A1,QdA2,QdB2,QdD: Extended;
begin
QdC:=sqr(X1-X0)+sqr(Y1-Y0);
C:=Sqrt(QdC);
QdA2:=sqr(X-X0)+sqr(Y-Y0);
QdB2:=sqr(X-X1)+sqr(Y-Y1);
A1:=(QdC-QdB2+QdA2)/(2*C);
QdD:=QdA2-Sqr(A1);
if ((QdA2-QdD) < QdC) AND ((QdB2-QdD) < QdC)
 then begin
  D:=Sqrt(QdD);
  Result:=true;
  end
 else Result:=false;
end;

function TObjectEditor.Object_GetNodePtrByIndex(const NodeIndex: integer): TPtr;
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  Index: integer;
begin
Result:=nilPtr;
with EditorForm.Reflector do begin
Space.ReadObjLocalStorage(Obj,SizeOf(TSpaceObj), ptrObject);
ptrPoint:=Obj.ptrFirstPoint;
Index:=0;
while ptrPoint <> nilPtr do begin
  Space.ReadObjLocalStorage(Point,SizeOf(Point), ptrPoint);
  if (Index = NodeIndex)
   then begin
    Result:=ptrPoint;
    Exit; //. ->
    end;
  //.
  Inc(Index);
  ptrPoint:=Point.ptrNextObj;
  end;
end;
end;

procedure TObjectEditor.Figure_ClearNodes;
begin
RestoreWorkWindow;
//.
FigureWinRefl.Clear;
flNodesChanged:=true;
//.
Handles_Prepare;
//.
RecalculateFiguresForNodeChanged;
//.
ReflectWorkWindow;
//.
EditorForm.PaintSpace();
end;

procedure TObjectEditor.Figure_DestroySelectedNodes;
var
  I,J,K: integer;
  flDestroyed: boolean;
  LastDestroyedIndex: integer;
begin
flDestroyed:=false;
if (Handles <> nil)
 then
  for K:=0 to Handles.Count-1 do with TObjectEditorHandle(Handles[K]^) do
    if (flSelected)
     then with FigureWInRefl do
      for I:=0 to Count-1 do
        if (I = NodeIndex)
         then begin
          for J:=I to Count-2 do Nodes[J]:=Nodes[J+1];
          Dec(Count);
          flNodesChanged:=true;
          Reset;
          LastDestroyedIndex:=I;
          flDestroyed:=true;
          Break; //. >
          end;
if (flDestroyed)
 then begin
  RestoreWorkWindow;
  //.
  RecalculateFiguresForNodeChanged;
  //.
  Handles_Prepare;
  //.
  Handles_SelectOne(LastDestroyedIndex-1);
  //.
  ReflectWorkWindow;
  //.
  EditorForm.PaintSpace();
  end;
end;

function TObjectEditor.IsChanged: boolean;
begin
Result:=(flNodesChanged OR flBodyChanged);
end;


end.

