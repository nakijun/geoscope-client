
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2004 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit unitNodesApproximator;
interface
uses
  SysUtils, Math;

Type
  TNode = record
    ptrNext: pointer;
    X,Y: Extended;
  end;

  TQueueItem = record
    ptrNext: pointer;
    ptrNode: pointer;
  end;
  function TQueueItem_CreateInstance(const pptrNext: pointer; const pptrNode: pointer): pointer;

Const
  TimeNodesLimit = 10000;
  
Type
  TNodesApproximator = class
  private
    procedure ClearQueue(var ptrQueue: pointer);
    procedure ClearNodes;
  public
    Nodes: pointer;
    NodesCount: longword;
    ResultQueue: pointer;
    ResultCount: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure AddNode(const pX,pY: Extended);
    procedure Calculate;
    procedure MoveResultToNodes;
    procedure ConvertNodesToMinMax;
  end;

implementation

{TQueueItem}
function TQueueItem_CreateInstance(const pptrNext: pointer; const pptrNode: pointer): pointer;
begin
GetMem(Result,SizeOf(TQueueItem));
with TQueueItem(Result^) do begin
ptrNext:=pptrNext;
ptrNode:=pptrNode;
end;
end;


{TNodesApproximator}
Constructor TNodesApproximator.Create;
begin
Inherited Create;
Nodes:=nil;
NodesCount:=0;
ResultQueue:=nil;
ResultCount:=0;
end;

Destructor TNodesApproximator.Destroy;
begin
Clear;
Inherited;
end;

procedure TNodesApproximator.ClearNodes;
var
  ptrDestroyNode: pointer;
begin
while Nodes <> nil do begin
  ptrDestroyNode:=Nodes;
  Nodes:=TNode(ptrDestroyNode^).ptrNext;
  FreeMem(ptrDestroyNode,SizeOf(TNode));
  end;
NodesCount:=0;
end;

procedure TNodesApproximator.ClearQueue(var ptrQueue: pointer);
var
  ptrDestroyItem: pointer;
begin
while ptrQueue <> nil do begin
  ptrDestroyItem:=ptrQueue;
  ptrQueue:=TQueueItem(ptrDestroyItem^).ptrNext;
  FreeMem(ptrDestroyItem,SizeOf(TQueueItem));
  end;
end;

procedure TNodesApproximator.Clear;
begin
ClearQueue(ResultQueue);
ClearNodes;
end;

procedure TNodesApproximator.AddNode(const pX,pY: Extended);
var
  ptrNewNode: pointer;
begin
GetMem(ptrNewNode,SizeOf(TNode));
with TNode(ptrNewNode^) do begin
ptrNext:=Nodes;
X:=pX;
Y:=pY;
end;
Nodes:=ptrNewNode;
Inc(NodesCount);
end;

procedure TNodesApproximator.Calculate;
label
  NextStep;
var
  ptrNode: pointer;
  XOrderedQueue: pointer;
  XDescOrderedQueue: pointer;
  ptrptrQueueItem,ptrQueueItem: pointer;
  ptrXminNodeItem,ptrXmaxNodeItem: pointer;
  ptrYminNodeItem,ptrYmaxNodeItem: pointer;
  OrgNode: TNode;
  dX,dY: Extended;
  Dmax,D: Extended;
  ptrDmaxNodeItem: pointer;
begin
//. clear old result
ClearQueue(ResultQueue);
try
//.
ptrNode:=Nodes;
XOrderedQueue:=TQueueItem_CreateInstance(nil,ptrNode);
XDescOrderedQueue:=nil;
//. getting x-ordered nodes queue
try
ptrYminNodeItem:=XOrderedQueue;
ptrYmaxNodeItem:=XOrderedQueue;
ptrXmaxNodeItem:=XOrderedQueue;
ptrNode:=TNode(ptrNode^).ptrNext;
while ptrNode <> nil do with TNode(ptrNode^) do begin
  ptrptrQueueItem:=@XOrderedQueue;
  while Pointer(ptrptrQueueItem^) <> nil do with TQueueItem(Pointer(ptrptrQueueItem^)^) do begin
    if X < TNode(ptrNode^).X then Break; //. >
    if X = TNode(ptrNode^).X
     then
      if Y > TNode(ptrNode^).Y
       then Break //. >
       else if Y = TNode(ptrNode^).Y then GoTo NextStep; //. >
    ptrptrQueueItem:=@ptrNext;
    end;
  //. insert node into the queue
  if Pointer(ptrptrQueueItem^) <> nil
   then
    Pointer(ptrptrQueueItem^):=TQueueItem_CreateInstance(Pointer(ptrptrQueueItem^),ptrNode)
   else begin
    Pointer(ptrptrQueueItem^):=TQueueItem_CreateInstance(nil,ptrNode);
    ptrXmaxNodeItem:=Pointer(ptrptrQueueItem^);
    end;
  //.
  if Y < TNode(TQueueItem(ptrYminNodeItem^).ptrNode^).Y
   then
    ptrYminNodeItem:=Pointer(ptrptrQueueItem^)
   else
    if Y > TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^).Y
     then ptrYmaxNodeItem:=Pointer(ptrptrQueueItem^);
  //.
  NextStep:;
  ptrNode:=ptrNext;
  end;
//.
ptrXminNodeItem:=XOrderedQueue;
ptrQueueItem:=TQueueItem(XOrderedQueue^).ptrNext;
if ptrYmaxNodeItem <> ptrXminNodeItem
 then begin
  {-+ triangle working}
  OrgNode:=TNode(TQueueItem(ptrXminNodeItem^).ptrNode^);
  dX:=(TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^).X-OrgNode.X);
  if dX <> 0
   then Dmax:=(TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^).Y-OrgNode.Y)/dX
   else Dmax:=MaxExtended;
  ptrDmaxNodeItem:=ptrYmaxNodeItem;
  while ptrQueueItem <> ptrYmaxNodeItem do with TQueueItem(ptrQueueItem^) do begin
    dX:=(TNode(ptrNode^).X-OrgNode.X);
    if dX <> 0
     then D:=(TNode(ptrNode^).Y-OrgNode.Y)/dX
     else if (TNode(ptrNode^).Y-OrgNode.Y) > 0 then D:=MaxExtended else D:=-MaxExtended;
    if D > Dmax
     then begin
      Dmax:=D;
      ptrDmaxNodeItem:=ptrQueueItem;
      end;
    ptrQueueItem:=ptrNext;
    end;
  while ptrDmaxNodeItem <> ptrYmaxNodeItem do with TQueueItem(ptrDmaxNodeItem^) do begin
    //. insert DmaxNode
    ResultQueue:=TQueueItem_CreateInstance(ResultQueue,ptrNode);
    Inc(ResultCount);
    //.
    OrgNode:=TNode(ptrNode^);
    dX:=(TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^).X-OrgNode.X);
    if dX <> 0
     then Dmax:=(TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^).Y-OrgNode.Y)/dX
     else Dmax:=MaxExtended;
    ptrDmaxNodeItem:=ptrYmaxNodeItem;
    ptrQueueItem:=ptrNext;
    while ptrQueueItem <> ptrYmaxNodeItem do with TQueueItem(ptrQueueItem^) do begin
      dX:=(TNode(ptrNode^).X-OrgNode.X);
      if dX <> 0
       then D:=(TNode(ptrNode^).Y-OrgNode.Y)/dX
       else if (TNode(ptrNode^).Y-OrgNode.Y) > 0 then D:=MaxExtended else D:=-MaxExtended;
      if D > Dmax
       then begin
        Dmax:=D;
        ptrDmaxNodeItem:=ptrQueueItem;
        end;
      ptrQueueItem:=ptrNext;
      end;
    end;
  {.}
  //. insert YmaxNode
  ResultQueue:=TQueueItem_CreateInstance(ResultQueue,TQueueItem(ptrYmaxNodeItem^).ptrNode);
  Inc(ResultCount);
  //.
  ptrQueueItem:=TQueueItem(ptrYmaxNodeItem^).ptrNext;
  end;
if ptrXmaxNodeItem <> ptrYmaxNodeItem
 then begin
  {++ triangle working}
  OrgNode:=TNode(TQueueItem(ptrYmaxNodeItem^).ptrNode^);
  dY:=-(TNode(TQueueItem(ptrXmaxNodeItem^).ptrNode^).Y-OrgNode.Y);
  if dY <> 0
   then Dmax:=(TNode(TQueueItem(ptrXmaxNodeItem^).ptrNode^).X-OrgNode.X)/dY
   else Dmax:=MaxExtended;
  ptrDmaxNodeItem:=ptrXmaxNodeItem;
  while ptrQueueItem <> ptrXmaxNodeItem do with TQueueItem(ptrQueueItem^) do begin
    dY:=-(TNode(ptrNode^).Y-OrgNode.Y);
    if dY <> 0
     then D:=(TNode(ptrNode^).X-OrgNode.X)/dY
     else if (TNode(ptrNode^).X-OrgNode.X) <> 0 then D:=MaxExtended else D:=0;
    if D > Dmax
     then begin
      Dmax:=D;
      ptrDmaxNodeItem:=ptrQueueItem;
      end;
    ptrQueueItem:=ptrNext;
    end;
  while ptrDmaxNodeItem <> ptrXmaxNodeItem do with TQueueItem(ptrDmaxNodeItem^) do begin
    //. insert DmaxNode
    ResultQueue:=TQueueItem_CreateInstance(ResultQueue,ptrNode);
    Inc(ResultCount);
    //.
    OrgNode:=TNode(ptrNode^);
    dY:=-(TNode(TQueueItem(ptrXmaxNodeItem^).ptrNode^).Y-OrgNode.Y);
    if dY <> 0
     then Dmax:=(TNode(TQueueItem(ptrXmaxNodeItem^).ptrNode^).X-OrgNode.X)/dY
     else Dmax:=MaxExtended;
    ptrDmaxNodeItem:=ptrXmaxNodeItem;
    ptrQueueItem:=ptrNext;
    while ptrQueueItem <> ptrXmaxNodeItem do with TQueueItem(ptrQueueItem^) do begin
      dY:=-(TNode(ptrNode^).Y-OrgNode.Y);
      if dY <> 0
       then D:=(TNode(ptrNode^).X-OrgNode.X)/dY
       else if (TNode(ptrNode^).X-OrgNode.X) <> 0 then D:=MaxExtended else D:=0;
      if D > Dmax
       then begin
        Dmax:=D;
        ptrDmaxNodeItem:=ptrQueueItem;
        end;
      ptrQueueItem:=ptrNext;
      end;
    end;
  {.}
  //. insert XmaxNode
  ResultQueue:=TQueueItem_CreateInstance(ResultQueue,TQueueItem(ptrXmaxNodeItem^).ptrNode);
  Inc(ResultCount);
  //.
  end;
//. inverse x-ordered queue
while XOrderedQueue <> nil do begin
  //. popup item
  ptrQueueItem:=XOrderedQueue;
  XOrderedQueue:=TQueueItem(ptrQueueItem^).ptrNext;
  //. push item
  TQueueItem(ptrQueueItem^).ptrNext:=XDescOrderedQueue;
  XDescOrderedQueue:=ptrQueueItem;
  end;
//.
ptrQueueItem:=TQueueItem(XDescOrderedQueue^).ptrNext;
if ptrYminNodeItem <> ptrXmaxNodeItem
 then begin
  {+- triangle working}
  OrgNode:=TNode(TQueueItem(ptrXmaxNodeItem^).ptrNode^);
  dX:=-(TNode(TQueueItem(ptrYminNodeItem^).ptrNode^).X-OrgNode.X);
  if dX <> 0
   then Dmax:=-(TNode(TQueueItem(ptrYminNodeItem^).ptrNode^).Y-OrgNode.Y)/dX
   else Dmax:=MaxExtended;
  ptrDmaxNodeItem:=ptrYminNodeItem;
  while ptrQueueItem <> ptrYminNodeItem do with TQueueItem(ptrQueueItem^) do begin
    dX:=-(TNode(ptrNode^).X-OrgNode.X);
    if dX <> 0
     then D:=-(TNode(ptrNode^).Y-OrgNode.Y)/dX
     else if -(TNode(ptrNode^).Y-OrgNode.Y) > 0 then D:=MaxExtended else D:=-MaxExtended;
    if D > Dmax
     then begin
      Dmax:=D;
      ptrDmaxNodeItem:=ptrQueueItem;
      end;
    ptrQueueItem:=ptrNext;
    end;
  while ptrDmaxNodeItem <> ptrYminNodeItem do with TQueueItem(ptrDmaxNodeItem^) do begin
    //. insert DmaxNode
    ResultQueue:=TQueueItem_CreateInstance(ResultQueue,ptrNode);
    Inc(ResultCount);
    //.
    OrgNode:=TNode(ptrNode^);
    dX:=-(TNode(TQueueItem(ptrYminNodeItem^).ptrNode^).X-OrgNode.X);
    if dX <> 0
     then Dmax:=-(TNode(TQueueItem(ptrYminNodeItem^).ptrNode^).Y-OrgNode.Y)/dX
     else Dmax:=MaxExtended;
    ptrDmaxNodeItem:=ptrYminNodeItem;
    ptrQueueItem:=ptrNext;
    while ptrQueueItem <> ptrYminNodeItem do with TQueueItem(ptrQueueItem^) do begin
      dX:=-(TNode(ptrNode^).X-OrgNode.X);
      if dX <> 0
       then D:=-(TNode(ptrNode^).Y-OrgNode.Y)/dX
       else if -(TNode(ptrNode^).Y-OrgNode.Y) > 0 then D:=MaxExtended else D:=-MaxExtended;
      if D > Dmax
       then begin
        Dmax:=D;
        ptrDmaxNodeItem:=ptrQueueItem;
        end;
      ptrQueueItem:=ptrNext;
      end;
    end;
  {.}
  //. insert YminNode
  ResultQueue:=TQueueItem_CreateInstance(ResultQueue,TQueueItem(ptrYminNodeItem^).ptrNode);
  Inc(ResultCount);
  //.
  ptrQueueItem:=TQueueItem(ptrYminNodeItem^).ptrNext;
  end;
if ptrXminNodeItem <> ptrYminNodeItem
 then begin
  {-- triangle working}
  OrgNode:=TNode(TQueueItem(ptrYminNodeItem^).ptrNode^);
  dY:=(TNode(TQueueItem(ptrXminNodeItem^).ptrNode^).Y-OrgNode.Y);
  if dY <> 0
   then Dmax:=-(TNode(TQueueItem(ptrXminNodeItem^).ptrNode^).X-OrgNode.X)/dY
   else Dmax:=MaxExtended;
  ptrDmaxNodeItem:=ptrXminNodeItem;
  while ptrQueueItem <> ptrXminNodeItem do with TQueueItem(ptrQueueItem^) do begin
    dY:=(TNode(ptrNode^).Y-OrgNode.Y);
    if dY <> 0
     then D:=-(TNode(ptrNode^).X-OrgNode.X)/dY
     else if -(TNode(ptrNode^).X-OrgNode.X) > 0 then D:=MaxExtended else D:=-MaxExtended;
    if D > Dmax
     then begin
      Dmax:=D;
      ptrDmaxNodeItem:=ptrQueueItem;
      end;
    ptrQueueItem:=ptrNext;
    end;
  while ptrDmaxNodeItem <> ptrXminNodeItem do with TQueueItem(ptrDmaxNodeItem^) do begin
    //. insert DmaxNode
    ResultQueue:=TQueueItem_CreateInstance(ResultQueue,ptrNode);
    Inc(ResultCount);
    //.
    OrgNode:=TNode(ptrNode^);
    dY:=(TNode(TQueueItem(ptrXminNodeItem^).ptrNode^).Y-OrgNode.Y);
    if dY <> 0
     then Dmax:=-(TNode(TQueueItem(ptrXminNodeItem^).ptrNode^).X-OrgNode.X)/dY
     else Dmax:=MaxExtended;
    ptrDmaxNodeItem:=ptrXminNodeItem;
    ptrQueueItem:=ptrNext;
    while ptrQueueItem <> ptrXminNodeItem do with TQueueItem(ptrQueueItem^) do begin
      dY:=(TNode(ptrNode^).Y-OrgNode.Y);
      if dY <> 0
       then D:=-(TNode(ptrNode^).X-OrgNode.X)/dY
       else if -(TNode(ptrNode^).X-OrgNode.X) > 0 then D:=MaxExtended else D:=-MaxExtended;
      if D > Dmax
       then begin
        Dmax:=D;
        ptrDmaxNodeItem:=ptrQueueItem;
        end;
      ptrQueueItem:=ptrNext;
      end;
    end;
  {.}
  //. insert XminNode
  ResultQueue:=TQueueItem_CreateInstance(ResultQueue,TQueueItem(ptrXminNodeItem^).ptrNode);
  Inc(ResultCount);
  //.
  end;
finally
ClearQueue(XOrderedQueue);
ClearQueue(XDescOrderedQueue);
end;
except
  ClearQueue(ResultQueue);
  ResultCount:=0;
  Raise; //. =>
  end;
end;

procedure TNodesApproximator.MoveResultToNodes;
begin
ClearNodes();
//.
Nodes:=ResultQueue;
NodesCount:=ResultCount;
//.
ResultQueue:=nil;
ResultCount:=0;
end;

procedure TNodesApproximator.ConvertNodesToMinMax;
var
  ptrNode: pointer;
  Xmin,Ymin, Xmax,Ymax: Extended;
begin
//. getting extremums
ptrNode:=Nodes;
with TNode(ptrNode^) do begin
Xmin:=X; Ymin:=Y;
ptrNode:=ptrNext;
end;
Xmax:=Xmin; Ymax:=Ymin;
while ptrNode <> nil do with TNode(ptrNode^) do begin
  if X < Xmin
   then
    Xmin:=X
   else
    if X > Xmax
     then Xmax:=X;
  if Y < Ymin
   then
    Ymin:=Y
   else
    if Y > Ymax
     then Ymax:=Y;
  ptrNode:=ptrNext;
  end;
//. prepare new nodes
ClearNodes;
AddNode(Xmin,Ymin);
AddNode(Xmin,Ymax);
AddNode(Xmax,Ymax);
AddNode(Xmax,Ymin);
end;

end.
