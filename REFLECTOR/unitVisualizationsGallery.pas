unit unitVisualizationsGallery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace,Functionality,unitReflector, ComCtrls,
  ExtCtrls;

type
  TDraggedVisualizationLeaveGallery = procedure (const Sender: TForm; const VisualizationPtr: TPtr; const X,Y: integer) of object;

  TfmVisualizationsGallery = class(TForm)
    udScroller: TUpDown;
    procedure FormPaint(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure udScrollerChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
  private
    { Private declarations }
    Space: TProxySpace;
    Reflector: TReflector;
    VisualizationsArray: TPtrArray;
    VisualizationsNames: array of string;
    VisualizationContainerSize: integer;
    DelimiterSize: integer;
    FirstVisualizationIndex: integer;
    LastMousePos: Windows.TPoint;
    ReflectionWindow: TReflectionWindow;
    Window: TWindow;
    FigureWinRefl: TFigureWinRefl;
    AdditiveFigureWinRefl: TFigureWinRefl;

    procedure CreateParams(var Params: TCreateParams); override;
    procedure wmCM_MOUSELEAVE(var Message: TMessage); message CM_MOUSELEAVE;
    procedure Obj_GetBindPoint(const ptrObj: TPtr; out X,Y: TCrd);
    procedure Figure_ChangeScale(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Scale: Extended);
    procedure Figure_Rotate(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Angle: Extended);
  public
    { Public declarations }
    BackgroundColor: TColor;
    ForeColor: TColor;
    ForeBorderColor: TColor;
    SelectedColor: TColor;
    DelimiterColor: TColor;
    SelectedVisualizationIndex: integer;
    SelectedVisualizationOffset: Windows.TPoint;
    OnDraggedVisualizationLeaveGallery: TDraggedVisualizationLeaveGallery;

    Constructor Create(const pReflector: TReflector);
    Destructor Destroy; override;
    procedure UpdateView;
    procedure Clear;
    procedure AddVisualization(const VisualizationPtr: TPtr; const VisualizationName: string);
    procedure PrepareFromReflectorCreateObjects();
  end;

implementation
uses
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface, 
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitCreatingObjects;

{$R *.dfm}


{TfmVisualizationsGallery}
procedure TfmVisualizationsGallery.CreateParams(var Params: TCreateParams) ;
begin
BorderStyle := bsNone;
inherited;
Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
Params.Style := Params.Style or WS_SIZEBOX;
end;

Constructor TfmVisualizationsGallery.Create(const pReflector: TReflector);
var
  ReflectionWindowStruc: TReflectionWindowStrucEx;
begin
Inherited Create(nil);
Reflector:=pReflector;
Space:=pReflector.Space;
//. 
SetLength(VisualizationsArray,0);
SetLength(VisualizationsNames,0);
//.
DoubleBuffered:=true;
//.
DelimiterSize:=4;
FirstVisualizationIndex:=0;
SelectedVisualizationIndex:=-1;
BackgroundColor:=clBtnFace;
ForeColor:=TColor(clSilver);
ForeBorderColor:=TColor(clGray);
SelectedColor:=TColor($008080FF);
DelimiterColor:=clRed;
OnDraggedVisualizationLeaveGallery:=nil;
//.
Window:=TWindow.Create(0,0,ClientWidth,ClientHeight);
with ReflectionWindowStruc do begin
X0:=-1; Y0:=-1;
X1:=1; Y1:=-1;
X2:=1; Y2:=1;
X3:=-1; Y3:=1;
Xmn:=0; Ymn:=0;
Xmx:=1; Ymn:=1;
end;
ReflectionWindow:=TReflectionWindow.Create(Space,ReflectionWindowStruc);
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
//.
UpdateView;
end;

Destructor TfmVisualizationsGallery.Destroy;
begin
AdditiveFigureWinRefl.Free;
FigureWinRefl.Free;
Window.Free;
ReflectionWindow.Free;
Inherited;
end;

procedure TfmVisualizationsGallery.Clear;
begin
SetLength(VisualizationsArray,0);
SetLength(VisualizationsNames,0);
FirstVisualizationIndex:=0;
SelectedVisualizationIndex:=-1;
//.
udScroller.Max:=0;
end;

procedure TfmVisualizationsGallery.AddVisualization(const VisualizationPtr: TPtr; const VisualizationName: string);
var
  Idx: integer;
begin
Idx:=Length(VisualizationsArray);
SetLength(VisualizationsArray,Idx+1);
SetLength(VisualizationsNames,Idx+1);
VisualizationsArray[Idx]:=VisualizationPtr;
VisualizationsNames[Idx]:=VisualizationName;
//.
udScroller.Max:=Idx;
end;

procedure TfmVisualizationsGallery.PrepareFromReflectorCreateObjects();
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  CreatingObjectStoredStruc: TCreatingObjectStoredStruc;
  ObjFunctionality: TComponentFunctionality;
  VCL: TComponentsList;
begin
Clear;
//.
{$IFNDEF EmbeddedServer}
if (GetISpaceUserReflector(Space.SOAPServerURL).Get_CreatingComponents(Space.UserName,Space.UserPassword,Reflector.id,{out} BA))
{$ELSE}
if (SpaceUserReflector_Get_CreatingComponents(Space.UserName,Space.UserPassword,Reflector.id,{out} BA))
{$ENDIF}
 then begin
  MemoryStream:=TMemoryStream.Create();
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while MemoryStream.Read(CreatingObjectStoredStruc,SizeOf(CreatingObjectStoredStruc)) = SizeOf(CreatingObjectStoredStruc) do begin
    //. check for object
    try
    with TComponentFunctionality_Create(CreatingObjectStoredStruc.idType,CreatingObjectStoredStruc.idObj) do
    try
    Check();
    finally
    Release();
    end;
    ObjFunctionality:=TComponentFunctionality_Create(CreatingObjectStoredStruc.idType,CreatingObjectStoredStruc.idObj);
    with ObjFunctionality do
    try
    if (ObjFunctionality is TBaseVisualizationFunctionality)
     then AddVisualization(TBaseVisualizationFunctionality(ObjFunctionality).Ptr,CreatingObjectStoredStruc.ObjectName)
     else begin
      QueryComponents(TBaseVisualizationFunctionality, VCL);
      if (VCL <> nil)
       then
        try
        if (VCL.Count > 0)
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
          try
          AddVisualization(Ptr,CreatingObjectStoredStruc.ObjectName);
          finally
          Release;
          end
         else
        finally
        VCL.Destroy();
        end;
      end
    finally
    Release();
    end
    except
      Continue; //. ^
      end;
    end;
  finally
  MemoryStream.Destroy();
  end;
  end;
end;

procedure TfmVisualizationsGallery.UpdateView;

  procedure ReflectVisualization(const VisualizationPtr: TPtr; const VisualizationName: string; const ContainerX,ContainerY: integer; const ContainerSize: integer; const PenColor,BrushColor: TColor);

    function Reflect: boolean;

      procedure AlignAngle(var Angle: Extended);
      var
        Obj: TSpaceObj;
        Point0,Point1: TPoint;
        ALFA,BETTA,GAMMA: Extended;
      begin
      //. align angle
      with Space do begin
      ReadObj(Obj,SizeOf(Obj), VisualizationPtr);
      if (Obj.ptrFirstPoint = nilPtr) then Exit; //. ->
      ReadObj(Point0,SizeOf(Point0), Obj.ptrFirstPoint);
      if (Point0.ptrNextObj = nilPtr) then Exit; //. ->
      ReadObj(Point1,SizeOf(Point1), Point0.ptrNextObj);
      if (Point1.ptrNextObj <> nilPtr) then Exit; //. ->
      end;
      with ReflectionWindow do begin
      if (Point1.X-Point0.X) <> 0
       then
        ALFA:=Arctan((Point1.Y-Point0.Y)/(Point1.X-Point0.X))
       else
        if (Point1.Y-Point0.Y) >= 0
         then ALFA:=PI/2
         else ALFA:=-PI/2;
      if (X1-X0) <> 0
       then
        BETTA:=Arctan((Y1-Y0)/(X1-X0))
       else
        if (Y1-Y0) >= 0
         then BETTA:=PI/2
         else BETTA:=-PI/2;
      GAMMA:=(ALFA-BETTA);
      if (Point1.X-Point0.X)*(X1-X0) < 0
       then
        if (Point1.Y-Point0.Y)*(Y1-Y0) >= 0
         then GAMMA:=GAMMA-PI
         else GAMMA:=GAMMA+PI;
      end;
      Angle:=Angle+GAMMA;
      end;

      procedure Obj_GetMaxR(const ptrObj: TPtr; const Xbind,Ybind: Extended;  var MaxR: Extended);

        procedure TreatePoint(const X,Y: Extended);
        var
          R: Extended;
        begin
        R:=Sqrt(sqr(X-Xbind)+sqr(Y-Ybind));
        if (R > MaxR) then MaxR:=R;
        end;

      var
        Obj: TSpaceObj;
        ptrPoint: TPtr;
        Point: TPoint;
        I: integer;
        Node: TNodeSpaceObjPolyLinePolygon;
        ptrOwnerObj: TPtr;
      begin
      Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
      if (Obj.Width > 0)
       then with TSpaceObjPolylinePolygon.Create(Space, Obj) do
        try
        if (Count > 0) then for I:=0 to Count-1 do TreatePoint(Nodes[I].X,Nodes[I].Y);
        finally
        Destroy;
        end
       else begin
        ptrPoint:=Obj.ptrFirstPoint;
        while (ptrPoint <> nilPtr) do begin
         Space.ReadObj(Point,SizeOf(Point), ptrPoint);
         TreatePoint(Point.X,Point.Y);
         ptrPoint:=Point.ptrNextObj;
         end;
        end;
      //. process own objects
      ptrOwnerObj:=Obj.ptrListOwnerObj;
      while (ptrOwnerObj <> nilPtr) do begin
        Obj_GetMaxR(ptrOwnerObj,Xbind,Ybind, MaxR);
        Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
        end;
      end;

      procedure ConvertPoint(X,Y: Extended;  out Xs,Ys: Extended);
      var
        RW: TReflectionWindowStrucEx;
        QdA2: Extended;
        X_C,X_QdC,X_A1,X_QdB2: Extended;
        Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
      begin
      ReflectionWindow.GetWindow(false, RW);
      with RW do begin
      X:=X*cfTransMeter;
      Y:=Y*cfTransMeter;
      QdA2:=sqr(X-X0)+sqr(Y-Y0);
      //.
      X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
      X_C:=Sqrt(X_QdC);
      X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
      X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);
      //.
      Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
      Y_C:=Sqrt(Y_QdC);
      Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
      Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);
      //.
      Xs:=Xmn+X_A1/X_C*(Xmx-Xmn);
      Ys:=Ymn+Y_A1/Y_C*(Ymx-Ymn);
      end;
      end;

      procedure DoReflect(const pptrObj: TPtr; pCanvas: TCanvas; const Angle: Extended);
      var
        I: integer;

        procedure ProcessPoint(X,Y: Extended);
        var
          Node: TNode;
        begin
        ConvertPoint(X,Y,  Node.X,Node.Y);
        FigureWinRefl.Insert(Node)
        end;

        procedure AlternativeReflect;
        begin
        with pCanvas.Pen do begin
        Color:=FigureWinRefl.Color;
        Style:=psSolid;
        Width:=1;
        end;
        if (FigureWinRefl.CountScreenNodes > 0)
         then with FigureWinRefl do begin
          if flagLoop
           then begin
            if flagFill
             then begin
              if (ColorFill <> clNone)
               then begin
                pCanvas.Brush.Color:=ColorFill;
                pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
                end;
              end
             else begin
              pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
              end;
            end;
          end;
        if (AdditiveFigureWinRefl.CountScreenNodes > 0)
         then with AdditiveFigureWinRefl do begin
          if (ColorFill <> clNone)
           then begin
            pCanvas.Pen.Width:=1;
            pCanvas.Brush.Color:=ColorFill;
            pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
            end;
          end;
        end;

      var
        Obj,Detail: TSpaceObj;
        flClipping: boolean;
        flClipVisible: boolean;
        ClippingRegion,Rgn: HRGN;
        ptrPoint: TPtr;
        Point: TPoint;
        flReflected: boolean;
        ptrOwnerObj: TPtr;
      begin
      if (NOT Space.Obj_IsCached(pptrObj)) then Exit; //. ->
      //.        
      Space.ReadObj(Obj,SizeOf(TSpaceObj), pptrObj);
      //. clipping if necessary
      flClipping:=false;
      flClipVisible:=false;
      if (Obj.Color = clNone)
       then begin
        ptrOwnerObj:=Obj.ptrListOwnerObj;
        while (ptrOwnerObj <> nilPtr) do begin
          Space.ReadObj(Detail,SizeOf(Detail),ptrOwnerObj);
          if (Detail.flagLoop AND Detail.flagFill AND (Detail.ColorFill = clNone))
           then begin
            flClipping:=true;
            //. prepare clipping figure
            with FigureWinRefl do begin
            Clear;
            ptrObj:=ptrOwnerObj;
            idTObj:=Detail.idTObj;
            idObj:=Detail.idObj;
            flagLoop:=Detail.flagLoop;
            Color:=Detail.Color;
            flagFill:=Detail.flagFill;
            ColorFill:=Detail.ColorFill;
            Width:=Detail.Width;
            end;
            ptrPoint:=Detail.ptrFirstPoint;
            while ptrPoint <> nilPtr do begin
              Space.ReadObj(Point,SizeOf(Point), ptrPoint);
              ProcessPoint(Point.X,Point.Y);
              ptrPoint:=Point.ptrNextObj;
              end;
            //. scaling and rotating
            if (Angle <> 0) then Figure_Rotate(FigureWinRefl,ReflectionWindow.Xmd,ReflectionWindow.Ymd, Angle);
            FigureWinRefl.AttractToLimits(Window);
            //.
            if (FigureWinRefl.CountScreenNodes > 0)
             then
              if (NOT flClipVisible)
               then begin
                ClippingRegion:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                flClipVisible:=true;
                end
               else begin
                Rgn:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
                DeleteObject(Rgn);
                end;
            end;
          //.
          ptrOwnerObj:=Detail.ptrNextObj;
          end;
        if (flClipVisible) then ExtSelectClipRgn(pCanvas.Handle, ClippingRegion, RGN_AND);
        end;
      //.
      if (NOT flClipping OR flClipVisible)
       then begin
        with FigureWinRefl do begin
        Clear;
        ptrObj:=pptrObj;
        idTObj:=Obj.idTObj;
        idObj:=Obj.idObj;
        flagLoop:=Obj.flagLoop;
        Color:=Obj.Color;
        flagFill:=Obj.flagFill;
        ColorFill:=Obj.ColorFill;
        Width:=Obj.Width;
        end;
        AdditiveFigureWinRefl.Clear;
        ptrPoint:=Obj.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          Space.ReadObj(Point,SizeOf(Point), ptrPoint);
          ProcessPoint(Point.X,Point.Y);
          ptrPoint:=Point.ptrNextObj;
          end;
        //. scaling and rotating
        if (Angle <> 0) then Figure_Rotate(FigureWinRefl,ReflectionWindow.Xmd,ReflectionWindow.Ymd, Angle);
        //.
        if (Obj.Width > 0)
         then with AdditiveFigureWinRefl do begin
          Assign(FigureWinRefl);
          if ValidateAsPolyLine(ReflectionWindow.Scale) then AttractToLimits(Window);
          end;
        FigureWinRefl.AttractToLimits(Window);
        //. reflecting
        try
        flReflected:=false;
        with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
        try
        FReflector:=nil;
        flReflected:=ReflectOnCanvas(FigureWinRefl,AdditiveFigureWinRefl,ReflectionWindow,Window,pCanvas);
        finally
        Release;
        end
        except
          end;
        if NOT  flReflected then AlternativeReflect;
        end;
      //. end of clipping
      if (flClipVisible)
       then begin
        SelectClipRgn(pCanvas.Handle, 0);
        DeleteObject(ClippingRegion);
        end;
      //. process own objects
      ptrOwnerObj:=Obj.ptrListOwnerObj;
      while ptrOwnerObj <> nilPtr do begin
        DoReflect(ptrOwnerObj,pCanvas,Angle);
        Space.ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
        end;
      end;

    var
      Visualization_Xbind,Visualization_Ybind: TCrd;
      Visualization_Angle: Extended;
      Visualization_Rmax: Extended;
    begin
    Result:=false;
    //.
    Visualization_Angle:=0;
    //.
    Obj_GetBindPoint(VisualizationPtr, Visualization_Xbind,Visualization_Ybind);
    Visualization_Rmax:=0; Obj_GetMaxR(VisualizationPtr,Visualization_Xbind,Visualization_Ybind, Visualization_Rmax);
    //.
    ReflectionWindow.X0:=(Visualization_Xbind-Visualization_Rmax)*cfTransMeter; ReflectionWindow.Y0:=(Visualization_Ybind+Visualization_Rmax)*cfTransMeter;
    ReflectionWindow.X1:=(Visualization_Xbind+Visualization_Rmax)*cfTransMeter; ReflectionWindow.Y1:=(Visualization_Ybind+Visualization_Rmax)*cfTransMeter;
    ReflectionWindow.X2:=(Visualization_Xbind+Visualization_Rmax)*cfTransMeter; ReflectionWindow.Y2:=(Visualization_Ybind-Visualization_Rmax)*cfTransMeter;
    ReflectionWindow.X3:=(Visualization_Xbind-Visualization_Rmax)*cfTransMeter; ReflectionWindow.Y3:=(Visualization_Ybind-Visualization_Rmax)*cfTransMeter;
    ReflectionWindow.Xmn:=ContainerX; ReflectionWindow.Ymn:=ContainerY;
    ReflectionWindow.Xmx:=ContainerX+ContainerSize; ReflectionWindow.Ymx:=ContainerY+ContainerSize;
    ReflectionWindow.Update();
    //.
    Window.SetLimits(ReflectionWindow.Xmn,ReflectionWindow.Ymn,ReflectionWindow.Xmx,ReflectionWindow.Ymx);
    //.
    AlignAngle(Visualization_Angle);
    //.
    DoReflect(VisualizationPtr,Canvas,Visualization_Angle);
    //.
    Result:=true;
    end;

  var
    ClippingRegion: HRGN;
    OldBkMode: integer;
  begin
  ClippingRegion:=CreateRectRgn(ContainerX,ContainerY, (ContainerX+ContainerSize),(ContainerY+ContainerSize));
  try
  SelectClipRgn(Canvas.Handle, ClippingRegion);
  try
  with Canvas do begin
  //.
  Pen.Width:=1;
  Pen.Color:=PenColor;
  Brush.Color:=BrushColor;
  Rectangle(ContainerX,ContainerY, (ContainerX+ContainerSize)-1,(ContainerY+ContainerSize)-2);
  //.
  if (VisualizationName <> '')
   then begin
    Font.Name:='Tahoma';
    Font.Size:=8;
    Font.Color:=PenColor;
    OldBkMode:=SetBkMode(Handle, TRANSPARENT);
    try
    TextOut(ContainerX+2,ContainerY+2, VisualizationName);
    finally
    SetBkMode(Handle, OldBkMode);
    end;
    end;
  //.
  if (VisualizationPtr <> nilPtr)
   then
    try
    Reflect();
    except
      end;
  end;
  finally
  SelectClipRgn(Canvas.Handle, 0);
  end;
  finally
  DeleteObject(ClippingRegion);
  end;
  end;

var
  VisualizationsCount: integer;
  VisualizationsAvailCount: integer;
  I: integer;
  X,Y: integer;
begin
//. preprocessing
VisualizationContainerSize:=ClientHeight;
VisualizationsCount:=(ClientWidth DIV (VisualizationContainerSize+DelimiterSize));
VisualizationsAvailCount:=(Length(VisualizationsArray)-FirstVisualizationIndex);
if (VisualizationsCount > VisualizationsAvailCount) then VisualizationsCount:=VisualizationsAvailCount;
//. reflecting the visualizations ...
with Canvas do begin
Pen.Color:=BackgroundColor;
Brush.Color:=BackgroundColor;
Rectangle(0,0,ClientWidth,ClientHeight);
//.
for I:=0 to VisualizationsCount-1 do begin
  X:=I*(VisualizationContainerSize+DelimiterSize);
  Y:=0;
  ReflectVisualization(VisualizationsArray[FirstVisualizationIndex+I],VisualizationsNames[FirstVisualizationIndex+I], X,Y, VisualizationContainerSize, ForeBorderColor,ForeColor);
  end;
{reflect selected visualization}
if (SelectedVisualizationIndex <> -1)
 then begin
  X:=(SelectedVisualizationIndex-FirstVisualizationIndex)*(VisualizationContainerSize+DelimiterSize);
  Y:=0;
  Inc(X,SelectedVisualizationOffset.X);
  Inc(Y,SelectedVisualizationOffset.Y);
  //.
  ReflectVisualization(VisualizationsArray[SelectedVisualizationIndex],VisualizationsNames[SelectedVisualizationIndex], X,Y, VisualizationContainerSize, SelectedColor,SelectedColor);
  end;
//. show bottom delimiter
{///? Pen.Color:=DelimiterColor;
Pen.Width:=1;
MoveTo(0,ClientHeight-1);
LineTo(ClientWidth,ClientHeight-1);}
end;
//. align scroller
with udScroller do begin
Left:=Self.ClientWidth-Width-2;
Top:=Self.ClientHeight-Height-3;
end;
end;

procedure TfmVisualizationsGallery.Obj_GetBindPoint(const ptrObj: TPtr; out X,Y: TCrd);
var
  Obj: TSpaceObj;
  CurPoint: integer;
  ptrPoint: TPtr;
  Point: TPoint;
  SumX,SumY: Extended;
begin
Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObj);
ptrPoint:=Obj.ptrFirstPoint;
SumX:=0; SumY:=0;
CurPoint:=0;
while (ptrPoint <> nilPtr) do begin
  Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  SumX:=SumX+Point.X;
  SumY:=SumY+Point.Y;
  ptrPoint:=Point.ptrNextObj;
  Inc(CurPoint);
  end;
if (CurPoint = 0) then Raise Exception.Create('could not get bind point'); //. =>
X:=SumX/CurPoint;
Y:=SumY/CurPoint;
end;

procedure TfmVisualizationsGallery.Figure_ChangeScale(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Scale: Extended);
var
  I: integer;
begin
with Figure do begin
for I:=0 to Count-1 do with Nodes[I] do begin
  X:=Xc+(X-Xc)*Scale;
  Y:=Yc+(Y-Yc)*Scale;
  end;
end;
end;

procedure TfmVisualizationsGallery.Figure_Rotate(Figure: TFigureWinRefl; const Xc,Yc: Extended; const Angle: Extended);
var
  I: integer;
  _X,_Y: Extended;
begin
with Figure do
for I:=0 to Count-1 do with Nodes[I] do begin
  _X:=Xc+(X-Xc)*Cos(Angle)+(Y-Yc)*(-Sin(Angle));
  _Y:=Yc+(X-Xc)*Sin(Angle)+(Y-Yc)*Cos(Angle);
  X:=_X;
  Y:=_Y;
  end;
end;

procedure TfmVisualizationsGallery.FormPaint(Sender: TObject);
begin
UpdateView;
end;

procedure TfmVisualizationsGallery.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Idx: integer;
begin
if (Button = mbLeft)
 then begin
  Idx:=FirstVisualizationIndex+(X DIV (VisualizationContainerSize+DelimiterSize));
  if ((Idx < Length(VisualizationsArray)) AND ((Idx-FirstVisualizationIndex) < (ClientWidth DIV (VisualizationContainerSize+DelimiterSize))))
   then begin
    SelectedVisualizationOffset.X:=0;
    SelectedVisualizationOffset.Y:=0;
    SelectedVisualizationIndex:=Idx;
    end
   else SelectedVisualizationIndex:=-1;
  //.
  RePaint();
  end;
end;

procedure TfmVisualizationsGallery.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
if (SelectedVisualizationIndex <> -1)
 then begin
  Inc(SelectedVisualizationOffset.X,(X-LastMousePos.X));
  Inc(SelectedVisualizationOffset.Y,(Y-LastMousePos.Y));
  //.
  RePaint();
  end;
//.
LastMousePos.X:=X;
LastMousePos.Y:=Y;
end;

procedure TfmVisualizationsGallery.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NewIdx: integer;
  VP: TPtr;
  VN: string;
  I: integer;
begin
if (SelectedVisualizationIndex <> -1)
 then begin
  NewIdx:=FirstVisualizationIndex+(X DIV (VisualizationContainerSize+DelimiterSize));
  if (NewIdx < Length(VisualizationsArray))
   then begin
    if (NewIdx <> SelectedVisualizationIndex)
     then begin //. insert selected visualization in new place
      VP:=VisualizationsArray[SelectedVisualizationIndex];
      VN:=VisualizationsNames[SelectedVisualizationIndex];
      I:=SelectedVisualizationIndex;
      if (NewIdx >= I)
       then
        while ((I+1) <= NewIdx) do begin
          VisualizationsArray[I]:=VisualizationsArray[I+1];
          VisualizationsNames[I]:=VisualizationsNames[I+1];
          Inc(I);
          end
       else
        while ((I-1) >= NewIdx) do begin
          VisualizationsArray[I]:=VisualizationsArray[I-1];
          VisualizationsNames[I]:=VisualizationsNames[I-1];
          Dec(I);
          end;
      VisualizationsArray[NewIdx]:=VP;
      VisualizationsNames[NewIdx]:=VN;
      end;
    end;
  SelectedVisualizationIndex:=-1;
  //.
  RePaint();
  end;
end;

procedure TfmVisualizationsGallery.wmCM_MOUSELEAVE(var Message: TMessage);
var
  Idx: integer;
begin
if ((SelectedVisualizationIndex <> -1) AND ((LastMousePos.X > 0) AND (LastMousePos.Y >= ClientHeight) AND (LastMousePos.X < ClientWidth)))
 then begin
  Idx:=SelectedVisualizationIndex;
  //.
  SelectedVisualizationIndex:=-1;
  //.
  RePaint();
  //.
  if (Assigned(OnDraggedVisualizationLeaveGallery) AND (VisualizationsArray[Idx] <> nilPtr))
   then OnDraggedVisualizationLeaveGallery(Self, VisualizationsArray[Idx], LastMousePos.X,LastMousePos.Y);
  end;
end;

procedure TfmVisualizationsGallery.FormResize(Sender: TObject);
begin
RePaint;
end;

procedure TfmVisualizationsGallery.udScrollerChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
begin
if ((NewValue >= 0) AND (NewValue < Length(VisualizationsArray)))
 then begin
  FirstVisualizationIndex:=NewValue;
  AllowChange:=true;
  RePaint();
  end
 else AllowChange:=false;
end;


end.
