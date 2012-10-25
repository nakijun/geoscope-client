unit unitPolylineFigure;
interface
uses
  SysUtils,
  Windows,
  Graphics;

const
  MaxNodesCount = 100000;
type
  TNode = record
    X,Y: Extended;
    Color: TColor;
  end;

  TScreenNode = record
    X,Y: integer;
    Color: TColor;
  end;

  TSide = record
    Node0,
    Node1: TNode;
  end;

  TWindowLimit = record
    Vol: integer;
  end;

  TWindow = class
  private
    function getLimit: TWindowLimit;
    function getLimit_Node0: TNode;
    function getLimit_Node1: TNode;
    function getOppositeLimit: TWindowLimit;
    function getIndexPredLimit: integer;
    function getIndexNextLimit: integer;
  public
    Limits: array[0..3] of TWindowLimit;
    IndexLimit: integer;
    Constructor Create(const Left,Up,Right,Down: integer);
    procedure SetLimits(const Left,Up,Right,Down: integer);
    procedure NextLimit;
    procedure PredLimit;
    property Limit: TWindowLimit read getLimit;
    property OppositeLimit: TWindowLimit read getOppositeLimit;
    property Limit_Node0: TNode read getLimit_Node0;
    property Limit_Node1: TNode read getLimit_Node1;
    property IndexPredLimit: integer read getIndexPredLimit;
    property IndexNextLimit: integer read getIndexNextLimit;
    function NodeVisible(const Node: TNode): boolean;
    function GetPointCrossed(const SideFigure: TSide; var Point: TNode): boolean;
    function FindPointCrossed(const Side: TSide; const NumLimits: word; var Point: TNode): boolean;
    function CrossedLimitRightLine(const Side: TSide): boolean;
    function CrossedLimitRightRightLine(const Side: TSide): boolean;
    function CrossedLimitLeftLine(const Side: TSide): boolean;
    function CrossedLimitLeftLeftLine(const Side: TSide): boolean;
    function Strike(const Side: TSide): boolean;
    function Distance(const Node: TNode): Extended;
  end;

  TPolylineFigure = class
  private
    function getNode: TNode;
  public
    flagLoop: boolean;
    Count: integer;
    Nodes: array[0..MaxNodesCount-1] of TNode;
    CountScreenNodes: integer;
    ScreenNodes: array[0..MaxNodesCount-1] of TScreenNode;
    ScreenWidth: integer;
    Position: integer;

    Constructor Create;
    procedure Clear;
    procedure Reset;
    procedure Insert(const Node: TNode);
    procedure Next;
    procedure AttractToLimits(const Window: TWindow; const ptrWindowFilledFlag: pointer = nil);
    procedure Optimize;
    procedure Assign(F: TPolylineFigure);
    function PointIsInside(const Point: TScreenNode): boolean;
    function ScreenNodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: integer): boolean;
    function ScreenNodes_GetAveragePoint(out X,Y: Extended): boolean;
    function ScreenNodes_PolylineLength(out Length: Extended): boolean;
    function Nodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: Extended): boolean;
    function Nodes_GetAveragePoint(out X,Y: Extended): boolean;
    property Node: TNode read getNode;
  end;


implementation


const
  ixLeft = 0;
  ixUp = 1;
  ixRight = 2;
  ixDown = 3;

{TWindow}
Constructor TWindow.Create(const Left,Up,Right,Down: integer);
begin
Inherited Create;
SetLimits(Left,Up,Right,Down);
end;

procedure TWindow.SetLimits(const Left,Up,Right,Down: integer);
begin
IndexLimit:=0;
Limits[ixLeft].Vol:=Left;
Limits[ixUp].Vol:=Up;
Limits[ixRight].Vol:=Right;
Limits[ixDown].Vol:=Down;
end;

function TWindow.getLimit: TWindowLimit;
begin
Result:=Limits[IndexLimit];
end;

function TWindow.getOppositeLimit: TWindowLimit;
begin
inc(IndexLimit,2);
if IndexLimit >= 4 then dec(IndexLimit,4);
Result:=Limits[IndexLimit];
end;

function TWindow.getLimit_Node0: TNode;
begin
case IndexLimit of
ixLeft: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
ixUp: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixRight: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixDown: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
end;
end;

function TWindow.getLimit_Node1: TNode;
begin
case IndexLimit of
ixLeft: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixUp: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixUp].Vol;
  end;
ixRight: begin
  Result.X:=Limits[ixRight].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
ixDown: begin
  Result.X:=Limits[ixLeft].Vol;
  Result.Y:=Limits[ixDown].Vol;
  end;
end;
end;

procedure TWindow.NextLimit;
begin
if IndexLimit >= 3
 then IndexLimit:=0
 else Inc(IndexLimit);
end;

procedure TWindow.PredLimit;
begin
if IndexLimit <= 0
 then IndexLimit:=3
 else Dec(IndexLimit);
end;

function TWindow.getIndexPredLimit: integer;
begin
if IndexLimit <= 0
 then Result:=3
 else Result:=IndexLimit-1;
end;

function TWindow.getIndexNextLimit: integer;
begin
if IndexLimit >= 3
 then Result:=0
 else Result:=IndexLimit+1;
end;

function TWindow.NodeVisible(const Node: TNode): boolean;
begin
with Node do begin
if ((Limits[ixLeft].Vol <= X) AND (X <= Limits[ixRight].Vol))
     AND
   ((Limits[ixUp].Vol <= Y) AND (Y <= Limits[ixDown].Vol))
 then Result:=true
 else Result:=false;
end;
end;

function TWindow.GetPointCrossed(const SideFigure: TSide; var Point: TNode): boolean;
var
  SideWin: TSide;
  Xcr,Ycr: extended;
begin
Result:=false;
Point.Color:=SideFigure.Node0.Color;
with SideFigure do begin
case IndexLimit of
ixLeft:
  begin
  if {((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))}
     (Limits[ixLeft].Vol-Node0.X)*(Limits[ixLeft].Vol-Node1.X) <= 0
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Limits[ixUp].Vol <= Ycr) AND (Ycr <= Limits[ixDown].Vol)
       then
        begin
        Point.X:=Limits[ixLeft].Vol;
        Point.Y:=Ycr;
        Result:=true;
        end;
      end;
  end;
ixUp:
  begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Limits[ixLeft].Vol <= Xcr) AND (Xcr <= Limits[ixRight].Vol)
       then
        begin
        Point.X:=Xcr;
        Point.Y:=Limits[ixUp].Vol;
        Result:=true;
        end;
      end;
  end;
ixRight:
  begin
  if {((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))}
     (Limits[ixRight].Vol-Node0.X)*(Limits[ixRight].Vol-Node1.X) <= 0
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Limits[ixUp].Vol <= Ycr) AND (Ycr <= Limits[ixDown].Vol)
       then
        begin
        Point.X:=Limits[ixRight].Vol;
        Point.Y:=Ycr;
        Result:=true;
        end;
      end;
  end;
ixDown:
  begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Limits[ixLeft].Vol <= Xcr) AND (Xcr <= Limits[ixRight].Vol)
       then
        begin
        Point.X:=Xcr;
        Point.Y:=Limits[ixDown].Vol;
        Result:=true;
        end;
      end;
  end;
end;
end;
end;

function TWindow.FindPointCrossed(const Side: TSide; const NumLimits: word; var Point: TNode): boolean;
var
  I: word;
begin
Result:=false;
for I:=0 to NumLimits-1 do
  begin
  if GetPointCrossed(Side, Point)
   then begin
    Result:=true;
    Exit
    end
   else NextLimit;
  end;
end;

function TWindow.CrossedLimitRightLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitRightRightLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitLeftLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.CrossedLimitLeftLeftLine(const Side: TSide): boolean;
var
  Xcr,Ycr: Extended;
begin
result:=false;
with Side do begin
case IndexLimit of
ixLeft: begin
  if ((Node0.X <= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixLeft].Vol) AND (Limits[ixLeft].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixLeft].Vol-Node0.X);
      if (Ycr > Limits[ixDown].Vol)
       then Result:=true;
      end;
  end;
ixUp: begin
  if ((Node0.Y <= Limits[ixUp].Vol) AND (Limits[ixUp].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixUp].Vol) AND (Limits[ixUp].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixUp].Vol-Node0.Y);
      if (Xcr < Limits[ixLeft].Vol)
       then Result:=true;
      end;
  end;
ixRight: begin
  if ((Node0.X <= Limits[ixRight].Vol) AND (Limits[ixRight].Vol < Node1.X)) OR
     ((Node0.X >= Limits[ixRight].Vol) AND (Limits[ixRight].Vol > Node1.X))
   then
    if Node0.X <> Node1.X
     then begin
      Ycr:=Node0.Y+((Node1.Y-Node0.Y)/(Node1.X-Node0.X))*(Limits[ixRight].Vol-Node0.X);
      if (Ycr < Limits[ixUp].Vol)
       then Result:=true;
      end;
  end;
ixDown: begin
  if ((Node0.Y <= Limits[ixDown].Vol) AND (Limits[ixDown].Vol < Node1.Y)) OR
     ((Node0.Y >= Limits[ixDown].Vol) AND (Limits[ixDown].Vol > Node1.Y))
   then
    if Node0.Y <> Node1.Y
     then begin
      Xcr:=Node0.X+((Node1.X-Node0.X)/(Node1.Y-Node0.Y))*(Limits[ixDown].Vol-Node0.Y);
      if (Xcr > Limits[ixRight].Vol)
       then Result:=true;
      end;
  end;
end;
end;
end;

function TWindow.Strike(const Side: TSide): boolean;
var
  Diag0,Diag1: TSide;
  Node: TNode;
begin
Result:=false;
{Diag0.Node0.X:=Limits[ixLeft].Vol;
Diag0.Node0.Y:=Limits[iUp].Vol;
Diag0.Node1.X:=Limits[ixRight].Vol;
Diag0.Node1.Y:=Limits[ixDown].Vol;
Diag1.Node0.X:=Limits[ixRight].Vol;
Diag1.Node0.Y:=Limits[iUp].Vol;
Diag1.Node1.X:=Limits[ixLeft].Vol;
Diag1.Node1.Y:=Limits[ixDown].Vol;
with Side do begin
if (No)*() <= 0
end;}
if FindPointCrossed(Side,4, Node)
 then begin
  NextLimit;
  if FindPointCrossed(Side,3, Node) then Result:=true;
  end
end;

function TWindow.Distance(const Node: TNode): Extended;
begin
case IndexLimit of
ixLeft: Result:=abs(Node.X-Limits[ixLeft].Vol);
ixUp: Result:=abs(Node.Y-Limits[ixUp].Vol);
ixRight: Result:=abs(Node.X-Limits[ixRight].Vol);
ixDown: Result:=abs(Node.Y-Limits[ixDown].Vol);
end;
end;



{TPolylineFigure}
Constructor TPolylineFigure.Create;
begin
Inherited Create;
Clear;
end;

procedure TPolylineFigure.Clear;
begin
Count:=0;
CountScreenNodes:=0;
Reset;
end;

procedure TPolylineFigure.Reset;
begin
Position:=0;
end;

procedure TPolylineFigure.Insert(const Node: TNode);
begin
if (Count >= MaxNodesCount) then Raise Exception.Create('! PolylineFigure has too many nodes'); //. =>
Nodes[Count]:=Node;
inc(Count);
end;

procedure TPolylineFigure.Next;
begin
inc(Position);
if Position >= Count then Position:=0;
end;

function TPolylineFigure.GetNode: TNode;
begin
Result:=Nodes[Position];
end;

procedure TPolylineFigure.Assign(F: TPolylineFigure);
var
  I: integer;
begin
flagLoop:=F.flagLoop;
Count:=F.Count;
for I:=0 to Count-1 do Nodes[I]:=F.Nodes[I];
CountScreenNodes:=F.CountScreenNodes;
for I:=0 to CountScreenNodes-1 do ScreenNodes[I]:=F.ScreenNodes[I];
Position:=F.Position;
end;

function TPolylineFigure.PointIsInside(const Point: TScreenNode): boolean;
var
  cntCrossedAbove,cntCrossedBelow: integer;

  procedure ProcessSide(const P0,P1: TNode);
  var
    Ycr: Extended;
  begin
  with Point do begin
  if ((P0.X <= X) AND (X < P1.X) OR
      (P0.X >= X) AND (X > P1.X))
   then
    if (P0.X <> P1.X)
     then begin
      Ycr:=P0.Y+((P1.Y-P0.Y)/(P1.X-P0.X))*(X-P0.X);
      if (Ycr >= Y)
       then inc(cntCrossedAbove)
       else inc(cntCrossedBelow);
      end;
  end;
  end;

var
  I: integer;
  P0,P1: TNode;
begin
Result:=false;
if (NOT flagLoop) then Exit; //. ->
cntCrossedAbove:=0;
cntCrossedBelow:=0;
for I:=0 to Count-2 do begin
  P0:=Nodes[I];
  P1:=Nodes[I+1];
  ProcessSide(P0,P1);
  end;
P0:=P1;
P1:=Nodes[0];
ProcessSide(P0,P1);
if ((cntCrossedAbove MOD 2) > 0) AND ((cntCrossedBelow MOD 2) > 0) then Result:=true;
end;

procedure TPolylineFigure.AttractToLimits(const Window: TWindow; const ptrWindowFilledFlag: pointer = nil);
Label MNewWork,MNewAttrLine,MLineReturnToWin,MLimitSpace,MRightAngleSpace,MLeftAngleSpace,MLimit_NextNode;

  procedure ScreenNodes_Insert(const Node: TNode; const flLimitNode: boolean);
  var
    SN: TScreenNode;
  begin
  SN.X:=Trunc(Node.X);
  SN.Y:=Trunc(Node.Y);
  SN.Color:=Node.Color;
  if flLimitNode
   then
    if (ScreenNodes[CountScreenNodes-1].X = SN.X) AND (ScreenNodes[CountScreenNodes-1].Y = SN.Y)
     then Dec(CountScreenNodes)
     else begin
      ScreenNodes[CountScreenNodes]:=SN;
      inc(CountScreenNodes);
      end
   else begin
    //. предохраниться от ситуации, когда узел равен узлу окна
    with SN,Window do begin
    if (X = Limits[ixLeft].Vol) AND (Y = Limits[ixUp].Vol)
     then begin Dec(X);Dec(Y) end
     else
      if (X = Limits[ixRight].Vol) AND (Y = Limits[ixUp].Vol)
       then begin Inc(X);Dec(Y) end
       else
        if (X = Limits[ixRight].Vol) AND (Y = Limits[ixDown].Vol)
         then begin Inc(X);Inc(Y) end
         else
          if (X = Limits[ixLeft].Vol) AND (Y = Limits[ixDown].Vol)
           then begin Dec(X);Inc(Y) end;
    end;
    ScreenNodes[CountScreenNodes]:=SN;
    inc(CountScreenNodes);
    end
  end;

var
  CountForSides: integer;
  curNode: integer;
  Side: TSide;
  cntCrossedLine,cntCrossedOppositeLine: integer;
  Node0_Dist0,Node0_Dist1: Extended;
  NewNode,NewNode1: TNode;
  SaveIndex: integer;
  PosOwnerNode: integer;
begin
if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=false;
with Window do begin
CountScreenNodes:=0;
curNode:=0;
CountForSides:=Count;
Reset();
if (flagLoop) then Inc(CountForSides);
if NOT NodeVisible(Node)
 then
  begin
  cntCrossedLine:=0;
  cntCrossedOppositeLine:=0;
  repeat
    Side.Node0:=Node;
    inc(curNode);
    if curNode >= CountForSides then Break;
    Next;
    Side.Node1:=Node;
    if NodeVisible(Node)
     then begin
      FindPointCrossed(Side,4, NewNode);
      if flagLoop then
       if CrossedLimitRightLine(Side) OR CrossedLimitLeftLine(Side)
        then curNode:=0
        else curNode:=1;
      GoTo MLineReturnToWin
      end
     else
      if Strike(Side)
       then begin
        FindPointCrossed(Side,4, NewNode1);
        SaveIndex:=IndexLimit;
        NextLimit;
        FindPointCrossed(Side,3, NewNode);
        Node0_Dist1:=Sqrt(sqr(NewNode1.X-Side.Node0.X)+sqr(NewNode1.Y-Side.Node0.Y));
        Node0_Dist0:=Sqrt(sqr(NewNode.X-Side.Node0.X)+sqr(NewNode.Y-Side.Node0.Y));
        if Node0_Dist1 < Node0_Dist0
         then begin
          IndexLimit:=SaveIndex;
          NewNode:=NewNode1;
          end;
        if flagLoop then
         if CrossedLimitRightLine(Side) OR CrossedLimitLeftLine(Side)
          then curNode:=0
          else curNode:=1;
        GoTo MLineReturnToWin
        end
       else begin
        if CrossedLimitRightLine(Side)
         then inc(cntCrossedLine)
         else begin
          PredLimit;
          if CrossedLimitLeftLeftLine(Side)
           then inc(cntCrossedOppositeLine);
          NextLimit;
          end;
        end;
  until false;
  begin
  //. фигура окно не пересекает
  if ((cntCrossedLine MOD 2) > 0) AND ((cntCrossedOppositeLine MOD 2) > 0) AND flagLoop
   then begin //. Фигура окружает окно
    NewNode.Color:=Node.Color; 
    NewNode.X:=Window.Limits[ixLeft].Vol;
    NewNode.Y:=Window.Limits[ixUp].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.X:=Window.Limits[ixRight].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.Y:=Window.Limits[ixDown].Vol;
    ScreenNodes_Insert(NewNode, false);
    NewNode.X:=Window.Limits[ixLeft].Vol;
    ScreenNodes_Insert(NewNode, false);
    if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=true;
    end;
  Exit; //. ->
  end;
  end;

MNewWork: ;
  //. собираем видимые точки}
  Repeat
    Side.Node0:=Node;
    NewNode:=Node;
    ScreenNodes_Insert(NewNode, false);
    inc(curNode);
    Next;
    if curNode >= CountForSides
     then
      {if flagLoop AND NOT NodeVisible(Node)
       then Break}
       Exit; //. фигура закончилась в окне
  Until NOT NodeVisible(Node);
  Side.Node1:=Node;

  //. Исследование поведения линии вне окна
  FindPointCrossed(Side,4, NewNode);
  MNewAttrLine:
  ScreenNodes_Insert(NewNode, false);
  PosOwnerNode:=CountScreenNodes;
  if CrossedLimitRightLine(Side)
   then GoTo MRightAngleSpace
   else
    if CrossedLimitLeftLine(Side)
     then GoTo MLeftAngleSpace;
  repeat
    {Линия в пространстве предела}
    MLimitSpace: ;
    Side.Node0:=Node;
    inc(curNode);
    if curNode >= CountForSides
     then begin //. Линия здесь закончилась
      if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
      Exit
      end;
    Next;
    Side.Node1:=Node;
    if GetPointCrossed(Side, NewNode)
     then begin //. Линия вернулась в окно
      MLineReturnToWin:
      ScreenNodes_Insert(NewNode, false);
      NextLimit;
      if FindPointCrossed(Side,3, NewNode)
       then GoTo MNewAttrLine
       else GoTo MNewWork;
      end
     else
      if CrossedLimitRightLine(Side)
       then begin //. линия пересекла правую границу предела
        if CrossedLimitRightRightLine(Side)
         then begin //. линия пересекла и правую границу правого угла
          NewNode.Color:=Side.Node0.Color;
          NewNode.X:=Limit_Node1.X;
          NewNode.Y:=Limit_Node1.Y;
          ScreenNodes_Insert(NewNode, true);

          NextLimit;
          if CrossedLimitRightLine(Side)
           then GoTo MRightAngleSpace;
          //. осталась в новом пространстве предела
          end
         else begin //. Линия осталась в пространстве правого угла
          MRightAngleSpace:
          repeat
            Side.Node0:=Node;
            inc(curNode);
            if curNode >= CountForSides
             then begin //. Линия здесь закончилась
              if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
              Exit
              end;
            Next;
            Side.Node1:=Node;
            if CrossedLimitRightRightLine(Side)
             then begin //. линия пересекла правую границу правого угла
              NewNode.Color:=Side.Node0.Color;
              NewNode.X:=Limit_Node1.X;
              NewNode.Y:=Limit_Node1.Y;
              ScreenNodes_Insert(NewNode, true);
              NextLimit;

              if GetPointCrossed(Side, NewNode)
               then GoTo MLineReturnToWin //. Линия вернулась в окно
               else
                if CrossedLimitRightLine(Side)
                 then begin //. линия пересекла и левую границу правого угла
                  if CrossedLimitRightRightLine(Side)
                   then begin //. линия пересекла и правую границу правого угла
                    NewNode.Color:=Side.Node0.Color;
                    NewNode.X:=Limit_Node1.X;
                    NewNode.Y:=Limit_Node1.Y;
                    ScreenNodes_Insert(NewNode, true);
                    NextLimit;

                    if Not CrossedLimitRightLine(Side)
                     then GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                    end;
                  end
                 else GoTo MLimit_NextNode;
              end
             else
              if CrossedLimitRightLine(Side)
               then begin //. линия пересекла левую границу угла
                if GetPointCrossed(Side, NewNode)
                 then GoTo MLineReturnToWin //. Линия вернулась в окно
                 else
                  if CrossedLimitLeftLine(Side)
                   then begin //. линия пересекла правую границу левого угла
                    if CrossedLimitLeftLeftLine(Side)
                     then begin //. линия пересекла и левую границу левого угла
                      NewNode.Color:=Side.Node0.Color;
                      NewNode.X:=Limit_Node0.X;
                      NewNode.Y:=Limit_Node0.Y;
                      ScreenNodes_Insert(NewNode, true);
                      PredLimit;

                      if Not CrossedLimitLeftLine(Side)
                       then GoTo MLimit_NextNode {осталась в новом пространстве предела}
                       else GoTo MLeftAngleSpace
                      end
                     else GoTo MLeftAngleSpace;
                    end
                   else GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                end;
          until false;
          //. фигура закончилась в пространстве угла
          end;
        end
       else
        if CrossedLimitLeftLine(Side)
         then begin //. линия пересекла левую границу предела
          if CrossedLimitLeftLeftLine(Side)
           then begin //. линия пересекла и левую границу левого угла
            NewNode.Color:=Side.Node0.Color;
            NewNode.X:=Limit_Node0.X;
            NewNode.Y:=Limit_Node0.Y;
            ScreenNodes_Insert(NewNode, true);

            PredLimit;
            if CrossedLimitLeftLine(Side)
             then GoTo MLeftAngleSpace;
            //. осталась в новом пространстве предела
            end
           else begin //. Линия осталась в пространстве левого угла
            MLeftAngleSpace:
            repeat
              Side.Node0:=Node;
              inc(curNode);
              if curNode >= CountForSides
               then begin //. Линия здесь закончилась
                if NOT flagLoop then CountScreenNodes:=PosOwnerNode;
                Exit
                end;
              Next;
              Side.Node1:=Node;
              if CrossedLimitLeftLeftLine(Side)
               then begin //. линия пересекла левую границу левого угла
                NewNode.Color:=Side.Node0.Color;
                NewNode.X:=Limit_Node0.X;
                NewNode.Y:=Limit_Node0.Y;
                ScreenNodes_Insert(NewNode, true);
                PredLimit;

                if GetPointCrossed(Side, NewNode)
                 then GoTo MLineReturnToWin //. Линия вернулась в окно
                 else
                  if CrossedLimitLeftLine(Side)
                   then begin //. линия пересекла и правую границу левого угла
                    if CrossedLimitLeftLeftLine(Side)
                     then begin //. линия пересекла и левую границу левого угла
                      NewNode.Color:=Side.Node0.Color;
                      NewNode.X:=Limit_Node0.X;
                      NewNode.Y:=Limit_Node0.Y;
                      ScreenNodes_Insert(NewNode, true);
                      PredLimit;

                      if Not CrossedLimitLeftLine(Side)
                       then GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                      end;
                     end
                   else GoTo MLimit_NextNode;
                end
               else
                if CrossedLimitLeftLine(Side)
                 then begin //. линия пересекла правую границу угла
                  if GetPointCrossed(Side, NewNode)
                   then GoTo MLineReturnToWin //. Линия вернулась в окно
                   else
                    if CrossedLimitRightLine(Side)
                     then begin //. линия пересекла правую границу левого угла
                      if CrossedLimitRightRightLine(Side)
                       then begin //. линия пересекла и правую границу правого угла
                        NewNode.Color:=Side.Node0.Color;
                        NewNode.X:=Limit_Node1.X;
                        NewNode.Y:=Limit_Node1.Y;
                        ScreenNodes_Insert(NewNode, true);
                        NextLimit;

                        if Not CrossedLimitRightLine(Side)
                         then GoTo MLimit_NextNode {осталась в новом пространстве предела}
                         else GoTo MRightAngleSpace
                        end
                       else GoTo MRightAngleSpace;
                      end
                     else GoTo MLimit_NextNode; {осталась в новом пространстве предела}
                  end;
            until false;
            end;
          end;

    MLimit_NextNode: ;
  until false;
end;
end;

procedure TPolylineFigure.Optimize;
var
  SrsIndex,DistIndex: integer;
  LastNode: TScreenNode;
begin
if CountScreenNodes < 2 then Exit; //. ->
LastNode:=ScreenNodes[0];
SrsIndex:=1;
DistIndex:=1;
repeat
  if NOT ((ScreenNodes[SrsIndex].X = LastNode.X) AND (ScreenNodes[SrsIndex].Y = LastNode.Y)) 
   then begin
    ScreenNodes[DistIndex]:=ScreenNodes[SrsIndex];
    Inc(DistIndex);
    LastNode:=ScreenNodes[SrsIndex];
    end;
  Inc(SrsIndex);
until SrsIndex >= CountScreenNodes;
if DistIndex = 1 then DistIndex:=0;
CountScreenNodes:=DistIndex;
end;

function TPolylineFigure.ScreenNodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: integer): boolean;
var
  I: integer;
  Cnt: integer;
begin
Result:=false;
Cnt:=CountScreenNodes;
if (flagLoop) then Dec(Cnt);
if (Cnt <= 0) then Exit; //. ->
Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
Xmx:=Xmn; Ymx:=Ymn;
for I:=1 to Cnt-1 do begin
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
Result:=true;
end;

function TPolylineFigure.ScreenNodes_GetAveragePoint(out X,Y: Extended): boolean;
var
  I: integer;
  Cnt: integer;
begin
Result:=false;
Cnt:=CountScreenNodes;
if (flagLoop) then Dec(Cnt);
if (Cnt <= 0) then Exit; //. ->
X:=0; Y:=0;
for I:=0 to Cnt-1 do begin
  X:=X+ScreenNodes[I].X;
  Y:=Y+ScreenNodes[I].Y;
  end;
X:=X/Cnt;
Y:=Y/Cnt;
Result:=true;
end;

function TPolylineFigure.ScreenNodes_PolylineLength(out Length: Extended): boolean;
var
  I: integer;
begin
Result:=false;
Length:=0;
for I:=0 to CountScreenNodes-2 do Length:=Length+Sqrt(sqr(ScreenNodes[I+1].X-ScreenNodes[I].X)+sqr(ScreenNodes[I+1].Y-ScreenNodes[I].Y));
Result:=true;
end;

function TPolylineFigure.Nodes_GetMinMax(out Xmn,Ymn,Xmx,Ymx: Extended): boolean;
var
  I: integer;
begin
Result:=false;
if (Count = 0) then Exit; //. ->
Xmn:=Nodes[0].X; Ymn:=Nodes[0].Y;
Xmx:=Xmn; Ymx:=Ymn;
for I:=1 to Count-1 do begin
  if Nodes[I].X < Xmn
   then
    Xmn:=Nodes[I].X
   else
    if Nodes[I].X > Xmx
     then Xmx:=Nodes[I].X;
  if Nodes[I].Y < Ymn
   then
    Ymn:=Nodes[I].Y
   else
    if Nodes[I].Y > Ymx
     then Ymx:=Nodes[I].Y;
  end;
Result:=true;
end;

function TPolylineFigure.Nodes_GetAveragePoint(out X,Y: Extended): boolean;
var
  I: integer;
begin
Result:=false;
if (Count = 0) then Exit; //. ->
X:=0; Y:=0;
for I:=0 to Count-1 do begin
  X:=X+Nodes[I].X;
  Y:=Y+Nodes[I].Y;
  end;
X:=X/Count;
Y:=Y/Count;
Result:=true;
end;


end.
