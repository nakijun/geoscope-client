///? Is2DVisualizationHided(ptrObj) просматривает все объекты не взирая на место их расположения
Constructor TVisibleObjectsProvider.Create(pSpace: TProxySpace);
var
  IUnk: IUnknown;
begin
Space:=pSpace;
evtVisibleObjectsGet:=CreateEvent(nil,true,false,nil);
evtVisibleObjectsGot:=CreateEvent(nil,true,false,nil);
flCallExtendedFunction:=false;
Inherited Create(true);
Priority:=tpNormal;
Resume;
end;

destructor TVisibleObjectsProvider.Destroy;
var
  EC: dword;
begin
CloseHandle(evtVisibleObjectsGot);
CloseHandle(evtVisibleObjectsGet);
if Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
end;

procedure TVisibleObjectsProvider.GetVisibleObjects(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: integer; out Data: TByteArray);
Const
  TimeWait = 1000*60*10;
begin
VisibleObjectsGet_X0:=X0;VisibleObjectsGet_Y0:=Y0;
VisibleObjectsGet_X1:=X1;VisibleObjectsGet_Y1:=Y1;
VisibleObjectsGet_X2:=X2;VisibleObjectsGet_Y2:=Y2;
VisibleObjectsGet_X3:=X3;VisibleObjectsGet_Y3:=Y3;
VisibleObjectsGet_Scale:=Scale;
VisibleObjectsGet_MinVisibleSquare:=MinVisibleSquare;
flCallExtendedFunction:=false;
SetEvent(evtVisibleObjectsGet);
if WaitForSingleObject(evtVisibleObjectsGot, TimeWait) = WAIT_OBJECT_0
 then begin
  ResetEvent(evtVisibleObjectsGot);
  Data:=VisibleObjectsGet_Data;
  end;
end;

procedure TVisibleObjectsProvider.GetVisibleObjectsEx(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: integer; out Data: TByteArray);
Const
  TimeWait = 1000*60*10;
begin
VisibleObjectsGet_X0:=X0;VisibleObjectsGet_Y0:=Y0;
VisibleObjectsGet_X1:=X1;VisibleObjectsGet_Y1:=Y1;
VisibleObjectsGet_X2:=X2;VisibleObjectsGet_Y2:=Y2;
VisibleObjectsGet_X3:=X3;VisibleObjectsGet_Y3:=Y3;
VisibleObjectsGet_Scale:=Scale;
VisibleObjectsGet_MinVisibleSquare:=MinVisibleSquare;
flCallExtendedFunction:=true;
SetEvent(evtVisibleObjectsGet);
if WaitForSingleObject(evtVisibleObjectsGot, TimeWait) = WAIT_OBJECT_0
 then begin
  ResetEvent(evtVisibleObjectsGot);
  Data:=VisibleObjectsGet_Data;
  end;
end;

procedure TVisibleObjectsProvider.Execute;
var
  R: DWord;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
{$IFNDEF EmbeddedServer}
RemoteManager:=GetISpaceRemoteManager(Space.SOAPServerURL);
if RemoteManager = nil then Raise Exception.Create('! no RemoteManager.');
{$ENDIF}
repeat
  R:=WaitForSingleObject(evtVisibleObjectsGet, 100);
  if R = WAIT_OBJECT_0
   then begin
    ResetEvent(evtVisibleObjectsGet);
    if not flCallExtendedFunction
     then
      {$IFNDEF EmbeddedServer}
      VisibleObjectsGet_Data:=RemoteManager.GetVisibleObjects(VisibleObjectsGet_X0,VisibleObjectsGet_Y0,VisibleObjectsGet_X1,VisibleObjectsGet_Y1,
                                      VisibleObjectsGet_X2,VisibleObjectsGet_Y2,VisibleObjectsGet_X3,VisibleObjectsGet_Y3,
                                      VisibleObjectsGet_Scale,VisibleObjectsGet_MinVisibleSquare,
                                      )
      {$ELSE}
      SpaceRemoteManager_GetVisibleObjects(VisibleObjectsGet_X0,VisibleObjectsGet_Y0,VisibleObjectsGet_X1,VisibleObjectsGet_Y1,
                                      VisibleObjectsGet_X2,VisibleObjectsGet_Y2,VisibleObjectsGet_X3,VisibleObjectsGet_Y3,
                                      VisibleObjectsGet_Scale,VisibleObjectsGet_MinVisibleSquare,{out} VisibleObjectsGet_Data 
                                      )
      {$ENDIF}
     else
      {// - VisibleObjectsGet_Data:=RemoteManager.GetVisibleObjectsEx(VisibleObjectsGet_X0,VisibleObjectsGet_Y0,VisibleObjectsGet_X1,VisibleObjectsGet_Y1,
                                        VisibleObjectsGet_X2,VisibleObjectsGet_Y2,VisibleObjectsGet_X3,VisibleObjectsGet_Y3,
                                        VisibleObjectsGet_Scale,VisibleObjectsGet_MinVisibleSquare,
                                        );}
    SetEvent(evtVisibleObjectsGot);
    end;
until Terminated;
{$IFNDEF EmbeddedServer}
RemoteManager:=nil;
{$ENDIF}
finally
CoUnInitialize;
end;
end;


function ObjWinRefl_IsNull(const Win: TObjWinRefl): boolean;
begin
with Win do begin
Result:=(Xmn = Xmx) AND (Ymn = Ymx);
end;
end;


{TDeletingDump}
Constructor TDeletingDump.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
evtQueryDelete:=CreateEvent(nil,true,false,nil);
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

destructor TDeletingDump.Destroy;
var
  EC: dword;
begin
Terminate;
if Reflecting.Reflector.Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
CloseHandle(evtQueryDelete);
end;

procedure TDeletingDump.DeletingDump;
var
  ptrDelLay: pointer;
  ptrDelItem: pointer;
begin
while DumpLays <> nil do begin
  if (WaitForSingleObject(evtQueryDelete, 0) = WAIT_OBJECT_0) then Raise EUnnecessaryExecuting.Create('');
  ptrDelLay:=DumpLays;
  with TLayReflect(ptrDelLay^) do begin
  DumpLays:=ptrNext;
  while Objects <> nil do begin
    ptrDelItem:=Objects;
    Objects:=TItemLayReflect(ptrDelItem^).ptrNext;
    FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
    end;
  FreeMem(ptrDelLay,SizeOf(TLayReflect));
  end;
  end;
end;

procedure TDeletingDump.Execute;
const
  IntervalDeleting = 10;
var
  R: DWord;
begin
repeat
  R:=WaitForSingleObject(evtQueryDelete, IntervalDeleting);
  if R = WAIT_OBJECT_0
   then begin
    ResetEvent(evtQueryDelete);
    try DeletingDump; except end;
    end
   else
    if R = WAIT_TIMEOUT
     then try DeletingDump except end;
until Terminated;
end;



{TReFormingLays}
Constructor TReFormingLays.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
evtQueryReForm:=CreateEvent(nil,true,false,nil);
flReforming:=false;
Inherited Create(true);
Priority:=tpLowest;
Resume;
end;

destructor  TReFormingLays.Destroy;
var
  EC: dword;
begin
Terminate;
if Reflecting.Reflector.Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
CloseHandle(evtQueryReForm);
end;

procedure TReFormingLays.ReForming;
begin
flReformingCancel:=false;
flReforming:=true;
try
PrepareLaysFromRemoteSpace;
finally
flReforming:=false;
end;
end;

procedure TReFormingLays.PrepareLaysFromRemoteSpace;
var
  I,J: integer;
  K: Word;
  BA: TByteArray;
  DataPtr: pointer;
  NewLays: pointer;
  NewLaysObjectsCount: integer;
  LaysCount: word;
  Objects: pointer;
  ObjectsCount: integer;
  ptrLast: pointer;
  ptrObj: TPtr;
  ptrNewLay: pointer;

    procedure InsertObj(const ptrObj: TPtr);
    var
      ptrNew: pointer;
      ptrptrItem: pointer;
    begin
    GetMem(ptrNew,SizeOf(TItemLayReflect));
    with TItemLayReflect(ptrNew^) do begin
    ptrNext:=nil;
    ptrObject:=ptrObj;
    with Window do begin
    Xmn:=0;Ymn:=0;
    Xmx:=0;Ymx:=0;
    end;
    end;
    TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
    ptrLast:=ptrNew;
    Reflecting.flReflectNeeded:=true;
    inc(NewLaysObjectsCount);
    inc(ObjectsCount);
    end;

  {procedure ReadGroup;
  var
    ptrReflLay: pointer;
    ptrItem: pointer;
    ItemsCount: DWord;
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
    IUnk: IUnknown;
    SRM: ISpaceRemoteManager;
  begin
  ptrReflLay:=NewLays;
  while ptrReflLay <> nil do begin
    with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      Reflecting.Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObject);
      ptrPoint:=Obj.ptrFirstPoint;
      while ptrPoint <> nilPtr do begin
        Reflecting.Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
        ptrPoint:=Point.ptrNextObj;
        end;
      ptrItem:=ptrNext;
      Windows.Beep(500,10);
      end;
    ptrReflLay:=ptrNext;
    end;
    end;

  ptrReflLay:=NewLays;
  while ptrReflLay <> nil do begin
    with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
      Reflecting.Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObject);
      ptrPoint:=Obj.ptrFirstPoint;
      while ptrPoint <> nilPtr do begin
        Reflecting.Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
        ptrPoint:=Point.ptrNextObj;
        end;
      ptrItem:=ptrNext;
      Windows.Beep(500,10);
      end;
    ptrReflLay:=ptrNext;
    end;
    end;
  CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  try
  IUnk:=CocoSpace.CreateRemote(Space.GlobalSpaceHost);
  IUnk.QueryInterface(IID_ISpaceManager, SpaceManager);
  finally
  CoUninitialize;
  end;
  end;}


var
  ptrFirstLay: pointer;
  ptrLastLay: pointer;
  ptrDumpLay,DumpLay_ptrptrNextLay: pointer;
  Obj: TSpaceObj;
  PointsCount: Word;
  ptrPoint: TPtr;
  Point: TPoint;
  Tm: TDateTime;
begin
with Reflecting do begin
NewLays:=nil;
try
with Reflector.ReflectionWindow do begin
Reflector.StatusPanel.Caption:='space loading ...';Tm:=Now;
VisibleObjectsProvider.GetVisibleObjectsEx(X0,Y0,X1,Y1,X2,Y2,X3,Y3,1000000{Reflector.ReflectionWindow.Scale},4{///*}, BA);
Reflector.StatusPanel.Caption:='space loaded dur: '+FormatDateTime('NN:SS',Now-Tm);
end;
TObjectReflectingCfg(Cfg).GetListHidedObjects;
DataPtr:=@BA[0];
asm
   PUSH ESI
   MOV ESI,DataPtr
   CLD
   LODSW
   MOV LaysCount,AX
   MOV DataPtr,ESI
   POP ESI
end;
for I:=0 to LaysCount-1 do begin
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSD
     MOV ObjectsCount,EAX
     MOV DataPtr,ESI
     POP ESI
  end;
  Objects:=nil;
  ptrLast:=@Objects;
  for J:=0 to ObjectsCount-1 do begin
    asm
       //. get ptrObj
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSD
       MOV ptrObj,EAX
       MOV DataPtr,ESI
       POP ESI
    end;
    if NOT TObjectReflectingCfg(Cfg).ListHidedObjects_IsObjectFound(ptrObj) then InsertObj(ptrObj);
    asm
       //. get Obj
       PUSH ESI
       PUSH EDI
       MOV ESI,DataPtr
       LEA EDI,Obj
       MOV ECX,36 //. SizeOf(TSpaceObj)
       CLD
       REP MOVSB
       MOV DataPtr,ESI
       POP EDI
       POP ESI
       //. get PointsCount
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSW
       MOV PointsCount,AX
       MOV DataPtr,ESI
       POP ESI
    end;
    //. записываем объект
    Reflector.Space.WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
    //. записываем его точки
    ptrPoint:=Obj.ptrFirstPoint;
    for K:=0 to PointsCount-1 do begin
      asm
         //. get Point
         PUSH ESI
         PUSH EDI
         MOV ESI,DataPtr
         LEA EDI,Point
         MOV ECX,16 //. SizeOf(TPoint)
         CLD
         REP MOVSB
         MOV DataPtr,ESI
         POP EDI
         POP ESI
      end;
      Reflector.Space.WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
      ptrPoint:=Point.ptrNextObj;
      end;
    end;
  GetMem(ptrNewLay,SizeOf(TLayReflect));
  TLayReflect(ptrNewLay^).ptrNext:=NewLays;
  TLayReflect(ptrNewLay^).flTransfered:=false;
  TLayReflect(ptrNewLay^).Objects:=Objects;
  TLayReflect(ptrNewLay^).ObjectsCount:=ObjectsCount;
  TLayReflect(ptrNewLay^).flCompleted:=true;
  NewLays:=ptrNewLay;
  end;

if Lays <> nil
 then begin
  ptrFirstLay:=Lays;
  Lock.Enter;
  try
  Lays:=NewLays;
  LaysObjectsCount:=NewLaysObjectsCount;
  Inc(ReflectionID);
  finally
  Lock.Leave;
  end;
  //. отображаем
  if flReflecting then flReflectingCancel:=true;
  SetEvent(evtQueryReflect);
  //. чистим Revising
  Revising.Reset;
  //. удаление всех старых слоёв
  ptrLastLay:=ptrFirstLay;
  while TLayReflect(ptrLastLay^).ptrNext <> nil do ptrLastLay:=TLayReflect(ptrLastLay^).ptrNext;
  Lock.Enter;
  try
  TLayReflect(ptrLastLay^).ptrNext:=DeletingDump.DumpLays;
  DeletingDump.DumpLays:=ptrFirstLay;
  finally
  Lock.Leave;
  end;
  end
 else begin
  Lock.Enter;
  try
  Lays:=NewLays;
  LaysObjectsCount:=NewLaysObjectsCount;
  Inc(ReflectionID);
  finally
  Lock.Leave;
  end;
  //. отображаем
  if flReflecting then flReflectingCancel:=true;
  SetEvent(evtQueryReflect);
  //. чистим Revising
  Revising.Reset;
  end;
except
  ptrDumpLay:=NewLays;
  //. удаление неполных новых слоев
  if ptrDumpLay <> nil
   then begin
    Lock.Enter;
    try
    TLayReflect(ptrDumpLay^).flTransfered:=true;
    DumpLay_ptrptrNextLay:=@TLayReflect(ptrDumpLay^).ptrNext;
    while Pointer(DumpLay_ptrptrNextLay^) <> nil do with TLayReflect(Pointer(DumpLay_ptrptrNextLay^)^) do begin
      flTransfered:=true;
      DumpLay_ptrptrNextLay:=@ptrNext;
      end;
    Pointer(DumpLay_ptrptrNextLay^):=DeletingDump.DumpLays;
    DeletingDump.DumpLays:=ptrDumpLay;
    finally
    Lock.Leave;
    end;
    end;
  Raise; //. =>
  end;
end;
end;

procedure TReFormingLays.Execute;
var
  R: DWord;
begin
repeat
  R:=WaitForSingleObject(evtQueryReForm, 100);
  if R = WAIT_OBJECT_0
   then begin
    ResetEvent(evtQueryReForm);
    try ReForming; except end;
    end;
until Terminated;
end;


procedure Canvas__Font_Set(Font: TFont; const FontName: string; const FontSize: integer; const FontColor: TColor);
var
  LogFont: TLogFont;
begin
Font.Handle:=0;
with LogFont do begin
///lfHeight := L_Height;
lfHeight := 2*FontSize;
lfWidth := FontSize;
lfEscapement := 0;
lfOrientation := 0;
lfWeight := FW_NORMAL;
lfItalic := Byte(fsBold);
lfUnderline := 0;//Byte(fsUnderline);
lfStrikeOut := 0;//Byte(fsStrikeOut);
lfCharSet := Byte(DEFAULT_CHARSET);
if FontName <>''
 then StrPCopy(lfFaceName, FontName)
 else StrPCopy(lfFaceName, 'Default');
lfQuality := DEFAULT_QUALITY;
{ Everything else as default }
lfOutPrecision := OUT_DEFAULT_PRECIS;
lfClipPrecision := CLIP_DEFAULT_PRECIS;
lfPitchAndFamily := DEFAULT_PITCH;
end;
with Font do begin
Handle:=CreateFontIndirect(LogFont);
Color:=FontColor;
end;
end;

{TReflecting}
Constructor TReflecting.Create(pReflector: TGL3DReflector);
begin
Lays:=nil;
LaysObjectsCount:=0;
Lock:=TCriticalSection.Create;
flReflectNeeded:=true;
Reflector:=pReflector;
Reflector.Reflecting:=Self;
evtQueryReflect:=CreateEvent(nil,true,false,nil);
ReFormingLays:=TReFormingLays.Create(Self);
Revising:=TRevising.Create(Self);
DeletingDump:=TDeletingDump.Create(Self);
if (Reflector.Space.Status = pssRemoted) OR (Reflector.Space.Status = pssRemotedBrief) then VisibleObjectsProvider:=TVisibleObjectsProvider.Create(Reflector.Space);
//. initialize 3D reflection scene
Scene:=TScene.Create(Reflector);
//.
Cfg:=TObjectReflectingCfg.Create(Self);
Validate;
ReflectionID:=0;
Inherited Create(true);
Priority:=tpIdle; //. изменение этого приоритета влияет на скорость обновления отображения, чем выше он тем медленнее (???) отображение
                  //. при этом приоритет самого процесса ServerProxySpace должен быть LOW
Resume;
end;

destructor TReflecting.Destroy;
var
  EC: dword;
begin
if Reflector.Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
Cfg.Free;
Scene.Free;
VisibleObjectsProvider.Free;
DeletingDump.Free;
Revising.Free;
ReFormingLays.Free;
Terminate; Sleep(50);
CloseHandle(evtQueryReflect);
/// + сделать удаление слоев
Lock.Free;
end;

procedure TReflecting.Validate;
begin
end;

procedure TReflecting.Obj_GetReflWindow(const ptrObj: TPtr; var Xmin,Ymin,Xmax,Ymax: smallint);

  procedure TreatePoint(X,Y: Extended; const flSet: boolean);
  var
     C,QdC,A1,QdA2,QdB2,H: Extended;
     L: Extended;
     Node: TNode;
     Xr,Yr: Extended;
     Xrefl,Yrefl: smallint;
  begin
  with Reflector,Reflector.ReflectionWindow do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X1)+sqr(Y-Y1);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Xr:=Xmn+(A1/C*(Xmx-Xmn));
  QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X3)+sqr(Y-Y3);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Yr:=Ymn+(A1/C*(Ymx-Ymn));
  end;

  if Xr > High(Xrefl)
   then Xrefl:=High(Xrefl)
   else
    if Xr < Low(Xrefl)
     then Xrefl:=Low(Xrefl)
     else Xrefl:=Round(Xr);
  if Yr > High(Yrefl)
   then Yrefl:=High(Yrefl)
   else
    if Yr < Low(Yrefl)
     then Yrefl:=Low(Yrefl)
     else Yrefl:=Round(Yr);

  if flSet
   then begin
    Xmin:=Xrefl;Ymin:=Yrefl;
    Xmax:=Xmin;Ymax:=Ymin;
    end
   else begin
    if Xrefl < Xmin
     then Xmin:=Xrefl
     else
      if Xrefl > Xmax
       then Xmax:=Xrefl;
    if Yrefl < Ymin
     then Ymin:=Yrefl
     else
      if Yrefl > Ymax
       then Ymax:=Yrefl;
    end;
  end;

var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  I: integer;
  Node: TNodeSpaceObjPolyLinePolygon;
begin
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
if Obj.Width > 0
 then with TSpaceObjPolylinePolygon.Create(Reflector.Space, Obj) do begin
  if Count > 0
   then begin
    TreatePoint(Nodes[0].X,Nodes[0].Y, true);
    for I:=1 to Count-1 do TreatePoint(Nodes[I].X,Nodes[I].Y, false);
    end;
  Destroy;
  end
 else begin
  ptrPoint:=Obj.ptrFirstPoint;
  if ptrPoint = nilPtr then Exit;
  Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  TreatePoint(Point.X,Point.Y, true);
  ptrPoint:=Point.ptrNextObj;
  While ptrPoint <> nilPtr do begin
   Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
   TreatePoint(Point.X,Point.Y, false);
   ptrPoint:=Point.ptrNextObj;
   end;
  end;
end;

procedure TReflecting.Obj_GetReflWindow(const Obj_ContainerCoord: TContainerCoord; var Xmn,Ymn,Xmx,Ymx: smallint);

  procedure TreatePoint(X,Y: Extended; const flSet: boolean);
  var
     C,QdC,A1,QdA2,QdB2,H: Extended;
     L: Extended;
     Node: TNode;
     Xr,Yr: Extended;
     Xrefl,Yrefl: smallint;
  begin
  with Reflector,Reflector.ReflectionWindow do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X1)+sqr(Y-Y1);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Xr:=Xmn+(A1/C*(Xmx-Xmn));
  QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  C:=Sqrt(QdC);
  QdA2:=sqr(X-X0)+sqr(Y-Y0);
  QdB2:=sqr(X-X3)+sqr(Y-Y3);
  A1:=(QdC-QdB2+QdA2)/(2*C);
  Yr:=Ymn+(A1/C*(Ymx-Ymn));
  end;

  if Xr > High(Xrefl)
   then Xrefl:=High(Xrefl)
   else
    if Xr < Low(Xrefl)
     then Xrefl:=Low(Xrefl)
     else Xrefl:=Round(Xr);
  if Yr > High(Yrefl)
   then Yrefl:=High(Yrefl)
   else
    if Yr < Low(Yrefl)
     then Yrefl:=Low(Yrefl)
     else Yrefl:=Round(Yr);

  if flSet
   then begin
    Xmn:=Xrefl;Ymn:=Yrefl;
    Xmx:=Xmn;Ymx:=Ymn;
    end
   else begin
    if Xrefl < Xmn
     then Xmn:=Xrefl
     else
      if Xrefl > Xmx
       then Xmx:=Xrefl;
    if Yrefl < Ymn
     then Ymn:=Yrefl
     else
      if Yrefl > Ymx
       then Ymx:=Yrefl;
    end;
  end;

begin
with Obj_ContainerCoord do begin
TreatePoint(Xmin,Ymin,true);
TreatePoint(Xmax,Ymin,false);
TreatePoint(Xmax,Ymax,false);
TreatePoint(Xmin,Ymax,false);
end;
end;

procedure TReflecting.Execute;
var
  R: DWord;
begin
repeat
  R:=WaitForSingleObject(evtQueryReflect, 100);
  if R = WAIT_OBJECT_0
   then begin
    ResetEvent(evtQueryReflect);
    try Reflecting; except end;
    end
until Terminated;
end;


procedure TReflecting.Reflecting;
begin
end;

procedure TReflecting.ReflectLimitedByTime(const ReflectTimeInterval: integer);
begin
end;

procedure TReflecting.Reflect;
begin
if NOT Reflector.Visible then Exit; //. ->
//. сбрасываем процесс отображения слоев
if flReflecting then flReflectingCancel:=true;
//. сбрасываем процесс реформирования слоев
if ReformingLays.flReforming then ReformingLays.flReformingCancel:=true;
//. сбрасываем процесс ревизии слоев
while Revising.flRevising do begin Revising.flCancelRevising:=true;Sleep(1) end;

SetEvent(evtQueryReflect);
end;

procedure TReflecting.ReFresh;
begin
Reflect;
end;

procedure TReflecting.RecalcReflect;
begin
if NOT Reflector.Visible then Exit; //. ->
with Reflector.lbReflectionStatus do begin
Color:=clRed;
Repaint;
end;
//. сбрасываем процесс отображения слоев
if flReflecting then flReflectingCancel:=true;
//. сбрасываем процесс реформирования слоев
if ReformingLays.flReforming then ReformingLays.flReformingCancel:=true;
//. сбрасываем процесс ревизии слоев
while Revising.flRevising do begin Revising.flCancelRevising:=true;Sleep(1) end;
//. отображаем частично в этом потоке
if NOT isLibrary
 then
  try
  Lock.Enter;
  try
  Scene.Refresh;
  finally
  Lock.Leave;
  end;
  except
    end;
//. выдаем запрос на реформирование+отображение
SetEvent(ReFormingLays.evtQueryReForm);
end;

procedure TReflecting.RevisionReflect(ptrObj: TPtr; const Act: TRevisionAct);
begin
if ptrObj = nilPtr then Exit; //. ->
with TObjectReflectingCfg(CFG),Reflector.Space do begin
case Act of
actInsert: begin
  if Is2DVisualizationHide(ptrObj)
   then PartitionHidedObjects_InsertObj(ptrObj)
   else if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, Act);
  end;
actRemove: begin
  if Is2DVisualizationHide(ptrObj)
   then /// ? PartitionHidedObjects.RemoveObj(ptrObj)
   else Revising.AddObject(ptrObj, Act);
  end;
actRefresh: begin
  if ListHidedObjects_IsObjectFound(ptrObj)
   then {Do Nothing}
   else if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, Act);
  end;
actChange: begin
  if Is2DVisualizationHide(ptrObj)
   then /// ? PartitionHidedObjects.ChangeObj(ptrObj)
   else if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, Act);
  end;
actValidateVisible: begin
  if Is2DVisualizationHide(ptrObj)
   then begin
    {/// ? if NOT PartitionHidedObjects.IsObjectFound(ptrObj)
     then begin
      PartitionHidedObjects_InsertObj(ptrObj);
      if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, actRemove);
      end;}
    end
   else begin
    {/// ? if PartitionHidedObjects.IsObjectFound(ptrObj)
     then begin
      PartitionHidedObjects.RemoveObj(ptrObj);
      if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, actInsert);
      end;}
    end
  end;
else
  if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, Act);
end;
end;
end;

procedure TReflecting.Reset;
var
  ptrFirstLay: pointer;
  ptrLastLay: pointer;
begin
if Lays = nil then Exit;
ptrFirstLay:=Lays;
Lays:=nil;
ptrLastLay:=ptrFirstLay;
while TLayReflect(ptrLastLay^).ptrNext <> nil do ptrLastLay:=TLayReflect(ptrLastLay^).ptrNext;
TLayReflect(ptrLastLay^).ptrNext:=DeletingDump.DumpLays;
DeletingDump.DumpLays:=ptrFirstLay;
end;

//----------------------------------------------------------------------------------------------------------------------


{TRevising}
Constructor TRevising.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
Objects:=nil;
evtQueryRevision:=CreateEvent(nil,false,false,nil);
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

destructor TRevising.Destroy;
var
  EC: dword;
begin
Terminate;
if Reflecting.Reflector.Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
CloseHandle(evtQueryRevision);
end;

function TRevising.ReflLays_RemoveObj(ptrLay: pointer; const ptrObj: TPtr;  var Obj_Window: TObjWinRefl): boolean;
var
  ptrptrItem: pointer;
  ptrDelItem: pointer;
begin
Result:=false;
Reflecting.Lock.Enter;
try
with Reflecting do begin
while ptrLay <> nil do begin
  with TLayReflect(ptrLay^) do begin
  ptrptrItem:=@Objects;
  while Pointer(ptrptrItem^) <> nil do begin
    if ptrObj = TItemLayReflect(Pointer(ptrptrItem^)^).ptrObject
     then begin
      ptrDelItem:=Pointer(ptrptrItem^);
      Pointer(ptrptrItem^):=TItemLayReflect(ptrDelItem^).ptrNext;
      Dec(ObjectsCount);
      with TItemLayReflect(ptrDelItem^) do begin
      Obj_Window:=Window;
      end;
      Result:=true;
      FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
      Exit; // ->
      end
     else ptrptrItem:=@TItemLayReflect(Pointer(ptrptrItem^)^).ptrNext;
    end;
  if flTransfered then Exit;
  ptrLay:=ptrNext;
  end;
  end;
end;
finally
Reflecting.Lock.Leave;
end;
end;

procedure TRevising.ReflLays_InsertObj(const ptrptrLay: pointer; const ptrObj: TPtr; const Lay,SubLay: integer; const Obj_Window: TObjWinRefl);
var
  ptrLay: pointer;
  ptrNewItem: pointer;
  ptrptrItem: pointer;

  function Lay_Get(ptrptrLay: pointer; const Lay,SubLay: integer): pointer;
  var
    I,J,K: integer;
    ptrNewLay,ptrNewItem: pointer;
  begin
  Result:=nil;
  for I:=0 to Lay do begin
    if Pointer(ptrptrLay^) = nil
     then begin
      for J:=I to Lay do begin //. формируем новый слой
        GetMem(ptrNewLay,SizeOf(TLayReflect));
        with TLayReflect(ptrNewLay^) do begin
        ptrNext:=nil;
        flTransfered:=false;
        Objects:=nil;
        ObjectsCount:=0;
        flLay:=true;
        flCompleted:=true;
        end;
        Reflecting.Lock.Enter;
        try
        Pointer(ptrptrLay^):=ptrNewLay;
        finally
        Reflecting.Lock.Leave;
        end;
        if J = Lay
         then begin
          for K:=1 to SubLay do begin  //. формируем новый подслой
            ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
            GetMem(ptrNewLay,SizeOf(TLayReflect));
            with TLayReflect(ptrNewLay^) do begin
            ptrNext:=nil;
            flTransfered:=false;
            Objects:=nil;
            ObjectsCount:=0;
            flLay:=false;
            flCompleted:=true;
            end;
            Reflecting.Lock.Enter;
            try
            Pointer(ptrptrLay^):=ptrNewLay;
            finally
            Reflecting.Lock.Leave;
            end;
            end;
          Result:=Pointer(ptrptrLay^);
          Exit; //. ->
          end;
        ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
        end;
      Exit; //. сюда выхода нет 
      end
     else begin
      if I = Lay then Break;
      repeat
        ptrptrLay:=@TLayReflect(Pointer(ptrptrLay^)^).ptrNext;
      until (Pointer(ptrptrLay^) = nil) OR TLayReflect(Pointer(ptrptrLay^)^).flLay;
      end;
    end;
  for I:=1 to SubLay do begin
    ptrptrLay:=@TLayReflect(Pointer(ptrptrLay^)^).ptrNext;
    if (Pointer(ptrptrLay^) = nil) OR TLayReflect(Pointer(ptrptrLay^)^).flLay
     then begin
      for J:=I to SubLay do begin
        GetMem(ptrNewLay,SizeOf(TLayReflect));
        with TLayReflect(ptrNewLay^) do begin
        ptrNext:=nil;
        flTransfered:=false;
        Objects:=nil;
        ObjectsCount:=0;
        flLay:=false;
        flCompleted:=true;
        end;
        Reflecting.Lock.Enter;
        try
        TLayReflect(ptrNewLay^).ptrNext:=Pointer(ptrptrLay^);
        Pointer(ptrptrLay^):=ptrNewLay;
        finally
        Reflecting.Lock.Leave;
        end;
        if J = SubLay then Break;
        ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
        end;
      Break;
      end;
    end;
  Result:=Pointer(ptrptrLay^);
  end;

begin
Reflecting.Lock.Enter;
try
ptrLay:=Lay_Get(ptrptrLay, Lay,SubLay);
GetMem(ptrNewItem,SizeOf(TItemLayReflect));
with TItemLayReflect(ptrNewItem^) do begin
ptrNext:=nil; /// ? TLayReflect(ptrLay^).Objects;
ptrObject:=ptrObj;
Window:=Obj_Window;
end;
with TLayReflect(ptrLay^) do begin
ptrptrItem:=@Objects;
while Pointer(ptrptrItem^) <> nil do ptrptrItem:=@TItemLayReflect(Pointer(ptrptrItem^)^).ptrNext;
Pointer(ptrptrItem^):=ptrNewItem;
Inc(ObjectsCount);
end;
finally
Reflecting.Lock.Leave;
end;
end;

procedure TRevising.AddObject(pPtrObj: TPtr; const pAct: TRevisionAct);
var
  ptrptrItem: pointer;
  ptrNewItem: pointer;
begin
if pPtrObj = nilPtr then Exit; //. ->
GetMem(ptrNewItem,SizeOf(TItemRevising));
with TItemRevising(ptrNewItem^) do begin
flValid:=true;
ptrNext:=nil;
ptrObj:=pPtrObj;
Act:=pAct;
end;
Reflecting.Lock.Enter;
try
ptrptrItem:=@Objects;
//. удаляем одинаковые Items
while Pointer(ptrptrItem^) <> nil do with TItemRevising(Pointer(ptrptrItem^)^) do begin
  if (ptrObj = pPtrObj) AND (Act = pAct)
   then flValid:=false;
  ptrptrItem:=@ptrNext;
  end;
Pointer(ptrptrItem^):=ptrNewItem;
finally
Reflecting.Lock.Leave;
end;
SetEvent(evtQueryRevision);
end;

procedure TRevising.Items_Clear;
var
  ptrDelItem,ptrNextItem: pointer;
begin
ptrDelItem:=Objects;
Objects:=nil;
while ptrDelItem <> nil do begin
  ptrNextItem:=TItemRevising(ptrDelItem^).ptrNext;
  FreeMem(ptrDelItem,SizeOf(TItemRevising));
  ptrDelItem:=ptrNextItem;
  end;
end;

procedure TRevising.Revising;

  function DoInsertRevision(const ptrObj: TPtr): boolean;
  var
    Lay,SubLay: integer;
    W: TObjWinRefl;
    CC: TContainerCoord;
    CS: Extended;
    WorkWindow: TObjWinRefl;
  begin
  Result:=false;
  with CC do begin
  if NOT Reflecting.Reflector.Space.Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax, ptrObj) then Exit;
  CS:=(Xmax-Xmin)*(Ymax-Ymin);
  end;
  if Reflecting.Reflector.ReflectionWindow.IsObjectVisible(CS,CC,ptrObj)
   then begin
    Reflecting.Reflector.Space.Obj_GetLayInfo(ptrObj, Lay,SubLay);
    with WorkWindow do Reflecting.Obj_GetReflWindow(ptrObj, Xmn,Ymn,Xmx,Ymx);
    ReflLays_InsertObj(@Reflecting.Lays,ptrObj,Lay,SubLay,WorkWindow);
    PostMessage(Reflecting.Reflector.Handle, WM_PAINT,GetDC(Reflecting.Reflector.Handle),0);
    Result:=true;
    end;
  end;

  function DoRemoveRevision(const ptrObj: TPtr): boolean;
  var
    Obj_Window: TObjWinRefl;
  begin
  Result:=false;
  if ReflLays_RemoveObj(Reflecting.Lays,ptrObj, Obj_Window)
   then begin
    PostMessage(Reflecting.Reflector.Handle, WM_PAINT,GetDC(Reflecting.Reflector.Handle),0);
    Result:=true;
    end;
  end;

  function DoRefreshRevision(const ptrObj: TPtr): boolean;
  begin
  PostMessage(Reflecting.Reflector.Handle, WM_PAINT,GetDC(Reflecting.Reflector.Handle),0);
  Result:=true;
  end;

  procedure InsertRevision(const ptrObj: TPtr);
  begin
  DoInsertRevision(ptrObj);
  end;

  procedure RemoveRevision(const ptrObj: TPtr);
  begin
  DoRemoveRevision(ptrObj);
  end;

  procedure RefreshRevision(const ptrObj: TPtr);
  begin
  DoRefreshRevision(ptrObj);
  end;

  procedure ChangeRevision(const ptrObj: TPtr);
  begin
  DoRemoveRevision(ptrObj);
  DoInsertRevision(ptrObj);
  end;

var
  ptrWorkItem: pointer;
begin
flCancelRevising:=false;
flRevising:=true;
try
while Reflecting.ReformingLays.flReforming do Sleep(1);
Reflecting.Lock.Enter;
try
try
while Objects <> nil do begin
  Reflecting.Lock.Enter;
  try
  ptrWorkItem:=Objects;
  Objects:=TItemRevising(ptrWorkItem^).ptrNext;
  finally
  Reflecting.Lock.Leave;
  end;
  with TItemRevising(ptrWorkItem^) do begin
  if flValid
   then case Act of
    actInsert: InsertRevision(ptrObj);
    actRemove: RemoveRevision(ptrObj);
    actRefresh: ReFreshRevision(ptrObj);
    actChange: ChangeRevision(ptrObj);
    end;
  end;
  FreeMem(ptrWorkItem,SizeOf(TItemRevising));
  if flCancelRevising then Raise EUnnecessaryExecuting.Create(''); //. =>
  end;
finally
Reflecting.Lock.Leave;
end;
except
  on E: EUnnecessaryExecuting do Reset;
  else ;
  Raise;
  end;
finally
flRevising:=false;
end;
end;

procedure TRevising.Execute;
const
  IntervalRevising = 10;
var
  R: DWord;
begin
repeat
  R:=WaitForSingleObject(evtQueryRevision, IntervalRevising);
  if R = WAIT_OBJECT_0
   then
    try Revising except end
   else
    if R = WAIT_TIMEOUT
     then try Revising except end;
until Terminated;
end;

procedure TRevising.Reset;
begin
Items_Clear;
end;

