
{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2011 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}





{var
  Diff: integer = 0;}

//. getmem routine overriding
procedure GetMem(var P: pointer; Size: integer);
begin
System.GetMem(P,Size);
//. try to lock memory
/// ? VirtualLock(P,Size);
/// - Diff:=Diff+Size;
end;

//. freemem routine overriding
procedure FreeMem(var P: pointer; Size: integer);
begin
System.FreeMem(P,Size);
/// - Diff:=Diff-Size;
end;


{TDeletingDump}
Constructor TDeletingDump.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
Lock:=TCriticalSection.Create;
evtQueryDelete:=CreateEvent(nil,false,false,nil);
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

destructor TDeletingDump.Destroy;
var
  EC: dword;
begin
//. terminating
Terminate;
if (false) ///- (Reflector.State <> rsDestroying)
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
//.
Lock.Free;
CloseHandle(evtQueryDelete);
ForceDelete(@DumpLays);
end;

procedure TDeletingDump.DeletingDump;
var
  ptrDelLay: pointer;
  ptrDelItem: pointer;
  flExit: boolean;
begin
while (true) do begin
  if (WaitForSingleObject(evtQueryDelete, 0) = WAIT_OBJECT_0) then Raise EUnnecessaryExecuting.Create('');
  Lock.Enter;
  try
  if DumpLays <> nil
   then begin
    ptrDelLay:=DumpLays;
    DumpLays:=TLayReflect(ptrDelLay^).ptrNext;
    flExit:=false;
    end
   else
    flExit:=true;
  finally
  Lock.Leave;
  end;
  if flExit then Exit; //. ->
  with TLayReflect(ptrDelLay^) do begin
  while Objects <> nil do begin
    ptrDelItem:=Objects;
    Objects:=TItemLayReflect(ptrDelItem^).ptrNext;
    with TItemLayReflect(ptrDelItem^) do if (ObjUpdating <> nil) then ObjUpdating.Terminate();
    FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
    end;
  FreeMem(ptrDelLay,SizeOf(TLayReflect));
  end;
  end;
end;

procedure TDeletingDump.Execute;
const
  IntervalDeleting = 100;
var
  R: DWord;
begin
repeat
  R:=WaitForSingleObject(evtQueryDelete, IntervalDeleting);
  if R = WAIT_OBJECT_0
   then
    try
    DeletingDump();
    except
      On E: EUnnecessaryExecuting do ;
      On E: Exception do if (Reflecting.Reflector.State <> rsDestroying) then EventLog.WriteMajorEvent('DumpDeleting','Reflecting dump deletion error.',E.Message);
      end
   else
    if R = WAIT_TIMEOUT then try DeletingDump() except end;
until Terminated;
end;

class procedure TDeletingDump.ForceDelete(const ptrptrLay: pointer);
var
  ptrDelLay,ptrDelItem: pointer;
begin
while Pointer(ptrptrLay^) <> nil do begin
  ptrDelLay:=Pointer(ptrptrLay^);
  with TLayReflect(ptrDelLay^) do begin
  Pointer(ptrptrLay^):=ptrNext;
  while Objects <> nil do begin
    ptrDelItem:=Objects;
    Objects:=TItemLayReflect(ptrDelItem^).ptrNext;
    with TItemLayReflect(ptrDelItem^) do if (ObjUpdating <> nil) then ObjUpdating.Terminate();
    FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
    end;
  end;
  FreeMem(ptrDelLay,SizeOf(TLayReflect));
  end;
end;



{TReFormingLays}
Constructor TReFormingLays.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
GlobalSpaceManager:=GetISpaceManager(Reflecting.Reflector.Space.SOAPServerURL);
if (GlobalSpaceManager = nil) then Raise Exception.Create('no GlobalSpaceManager'); //. =>
GlobalSpaceRemoteManager:=GetISpaceRemoteManager(Reflecting.Reflector.Space.SOAPServerURL);
if (GlobalSpaceRemoteManager = nil) then Raise Exception.Create('no GlobalSpaceRemoteManager'); //. =>
evtQueryReForm:=CreateEvent(nil,false,false,nil);
flReforming:=false;
Inherited Create(true);
Priority:=tpNormal;
Resume;
end;

destructor TReFormingLays.Destroy;
var
  EC: dword;
begin
flReformingCancel:=true;
//. terminating
Terminate;
if (false) ///- (Reflector.State <> rsDestroying)
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
CloseHandle(evtQueryReForm);
GlobalSpaceRemoteManager:=nil;
GlobalSpaceManager:=nil;
end;

procedure TReFormingLays.ReForming;
begin
flReformingCancel:=false;
flReforming:=true;
try
PrepareLays;
finally
flReforming:=false;
end;
end;

procedure TReFormingLays.PrepareLays;
const
  SizeOfTSpaceObj = SizeOf(TSpaceObj);
  SizeOfTPoint = SizeOf(TPoint);
var
  StartTimeoutEndTime: TDateTime;
  RW: TReflectionWindowStrucEx;
  RW_VisibleFactor: Double;
  RW_Scale: Extended;
  InvisibleLayNumbersArray: TByteArray;
  I,J: integer;
  BA: TByteArray;
  DataPtr: pointer;
  NewLays: pointer;
  NewLaysObjectsCount: integer;
  LaysCount: word;
  LayLevel: integer;
  ptrLastObj: TPtr;
  Objects: pointer;
  flLay: boolean;
  ValidObjectsCount,ObjectsCount: integer;
  ptrLast: pointer;
  ptrObj: TPtr;
  ptrptrLay: pointer;

  ObjPointersCount: longword;
  ptrPointersLay,ptrPointersLayItem: pointer;
  Lay,SubLay: integer;
  ptrLayItem: pointer;

  ptrNewLay: pointer;
  ptrFirstLay: pointer;
  ptrLastLay: pointer;
  ptrDumpLay,DumpLay_ptrptrNextLay: pointer;


    procedure PrepareStructuredObjects(DataPtr: pointer);
    const
      ObjPointersMaxSize = 1000;

      procedure ProcessObjectPortion(const ObjPointers: TByteArray; const PointersCount: integer);

        procedure ProcessObjDetails(const ptrObj: TPtr; var StructuresPtr: pointer);
        var
          ptrDetail: TPtr;
          DetailSubDetailsCount: word;
          ptrptrOwnerObj: TPtr;
          I: integer;
        begin
        asm
           CLD
           PUSH ESI
           PUSH EDI
           MOV EDI,StructuresPtr
           MOV ESI,[EDI]
           LODSW
           MOV DetailSubDetailsCount,AX
           MOV [EDI],ESI
           POP EDI
           POP ESI
        end;
        ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
        for I:=0 to DetailSubDetailsCount-1 do begin
          asm
             CLD
             PUSH ESI
             PUSH EDI
             MOV EDI,StructuresPtr
             MOV ESI,[EDI]
             LODSD
             MOV ptrDetail,EAX
             MOV [EDI],ESI
             POP EDI
             POP ESI
          end;
          Reflecting.Reflector.Space.WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
          ptrptrOwnerObj:=ptrDetail;
          //. process sub-details
          ProcessObjDetails(ptrDetail, StructuresPtr);
          end;
        ptrDetail:=nilPtr;
        Reflecting.Reflector.Space.WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
        end;

      var
        ObjPointersPtr: pointer;
        Structures: TByteArray;
        StructuresPtr: pointer;
        I: integer;
        ptrObj: TPtr;
        ptrDetail: TPtr;
        ptrptrOwnerObj: TPtr;
      begin
      Structures:=GlobalSpaceManager.ReadObjectsStructures(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword, ObjPointers,PointersCount);
      ObjPointersPtr:=@ObjPointers[0];
      StructuresPtr:=@Structures[0];
      Reflecting.Reflector.Space.Lock.Enter;
      try
      for I:=0 to PointersCount-1 do begin
        //. get ptrObj
        asm
           CLD
           PUSH ESI
           MOV ESI,ObjPointersPtr
           LODSD
           MOV ptrObj,EAX
           MOV ObjPointersPtr,ESI
           POP ESI
        end;
        //.
        if (StructuresPtr <> nil) 
         then ProcessObjDetails(ptrObj,StructuresPtr)
         else begin
          ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
          ptrDetail:=nilPtr;
          Reflecting.Reflector.Space.WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
          end;
        end;
      finally
      Reflecting.Reflector.Space.Lock.Leave;
      end;
      end;

    var
      ObjPointers: TByteArray;
      ObjPointersPtr: pointer;
      LaysCount: word;
      ptrObj: TPtr;
      ptrLastObj: TPtr;
      flLay: boolean;
      LayLevel: integer;
      ObjectsCount: integer;
      ValidPointersCount: integer;
      I,J: integer;
    begin
    SetLength(ObjPointers,ObjPointersMaxSize*SizeOf(TPtr));
    ObjPointersPtr:=@ObjPointers[0];
    asm
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSW
       MOV LaysCount,AX
       MOV DataPtr,ESI
       POP ESI
    end;
    LayLevel:=0;
    ValidPointersCount:=0;
    for I:=0 to LaysCount-1 do begin
      //. lay processing
      ptrLastObj:=nilPtr;
      asm
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSD
         MOV ObjectsCount,EAX
         LODSB
         MOV flLay,AL
         MOV DataPtr,ESI
         POP ESI
      end;
      //.
      if (flLay) then Inc(LayLevel);
      //.
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
        if (NOT TObjectReflectingCfg(Reflecting.ObjectConfiguration).ListHidedObjects_IsObjectFound(ptrObj))
         then
          if (ptrObj <> ptrLastObj)
           then ptrLastObj:=ptrObj
           else
            if (NOT Reflecting.Reflector.Space.Obj_StructureIsCached(ptrObj))
             then begin
              asm
                 PUSH EDI
                 MOV EAX,ptrObj
                 MOV EDI,ObjPointersPtr
                 CLD
                 STOSD
                 MOV ObjPointersPtr,EDI
                 POP EDI
              end;
              Inc(ValidPointersCount);
              if (ValidPointersCount >= ObjPointersMaxSize)
               then begin
                ProcessObjectPortion(ObjPointers,ValidPointersCount);
                ObjPointersPtr:=@ObjPointers[0];
                ValidPointersCount:=0;
                end;
              end;
        end;
      end;
    if (ValidPointersCount > 0)
     then begin
      SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
      ProcessObjectPortion(ObjPointers,ValidPointersCount);
      end;
    end;

    procedure InsertObj(const ptrObj: TPtr);
    var
      ptrNew: pointer;
    begin
    GetMem(ptrNew,SizeOf(TItemLayReflect));
    with TItemLayReflect(ptrNew^) do begin
    ptrNext:=nil;
    ptrObject:=ptrObj;
    with Window do begin
    Xmn:=0; Ymn:=0;
    Xmx:=0; Ymx:=0;
    end;
    Flags_ReflectionWindowIsFilled:=false;
    ObjUpdating:=nil;
    end;
    TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
    ptrLast:=ptrNew;
    Inc(ValidObjectsCount);
    end;

    procedure ProcessObjDetails(const ptrObj: TPtr; ptrptrLay: pointer);
    var
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
      ptrLay: pointer;
      Items: pointer;
      ValidObjectsCount: integer;
      ptrNew: pointer;
      ptrptrItem: pointer;
    begin
    //. processing details
    Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj),ptrObj+ofsptrListOwnerObj);
    if ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr))
     then begin
      if (Pointer(ptrptrLay^) = nil)
       then begin
        GetMem(ptrLay,SizeOf(TLayReflect));
        TLayReflect(ptrLay^).ptrNext:=nil;
        TLayReflect(ptrLay^).flLay:=false;
        TLayReflect(ptrLay^).Objects:=nil;
        TLayReflect(ptrLay^).ObjectsCount:=0;
        Pointer(ptrptrLay^):=ptrLay;
        end
       else ptrLay:=Pointer(ptrptrLay^);
      Items:=nil;
      ValidObjectsCount:=0;
      ptrptrItem:=@Items;
      repeat
        //. create new lay item
        GetMem(ptrNew,SizeOf(TItemLayReflect));
        with TItemLayReflect(ptrNew^) do begin
        ptrNext:=nil;
        ptrObject:=ptrOwnerObj;
        with Window do begin
        Xmn:=0; Ymn:=0;
        Xmx:=0; Ymx:=0;
        end;
        Flags_ReflectionWindowIsFilled:=false;
        ObjUpdating:=nil;
        end;
        TItemLayReflect(ptrptrItem^).ptrNext:=ptrNew;
        ptrptrItem:=ptrNew;
        Inc(ValidObjectsCount);
        //.
        ProcessObjDetails(ptrOwnerObj, ptrLay);
        //. next detail
        Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
      until ((ptrOwnerObj = 0) OR (ptrOwnerObj = nilPtr));
      //.
      TItemLayReflect(ptrptrItem^).ptrNext:=TLayReflect(ptrLay^).Objects;
      TLayReflect(ptrLay^).Objects:=Items;
      Inc(TLayReflect(ptrLay^).ObjectsCount,ValidObjectsCount);
      Inc(NewLaysObjectsCount,ValidObjectsCount);
      end;
    end;

    procedure GetObjectsPortion(var ptrPointersLay,ptrPointersLayItem: pointer; var ObjPointersCount: longword);
    var
      ObjPointers: TByteArray;
      ptrPointersBuffer: pointer;
      ValidPointersCount: longword;
      ptrDist: pointer;
      I: integer;
      ptrObj,ptrObjAccessed: TPtr;
      Objects: TByteArray;
      ptrObjectsBuffer: pointer;
      ptrSrs: pointer;
      ptrObjPointer: pointer;
      Obj: TSpaceObj;
      ptrPoint: TPtr;
      Point: TPoint;

      function GetObjPointer(var ptrObj: TPtr): boolean;
      begin
      Result:=false;
      repeat
        while (ptrPointersLayItem = nil) do begin
          ptrPointersLay:=TLayReflect(ptrPointersLay^).ptrNext;
          //.
          if (ptrPointersLay = nil) then Exit; //. ->
          //.
          ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
          end;
        ptrObj:=TItemLayReflect(ptrPointersLayItem^).ptrObject;
        Dec(ObjPointersCount);
        ptrPointersLayItem:=TItemLayReflect(ptrPointersLayItem^).ptrNext;
      until (NOT Reflecting.Reflector.Space.Obj_IsCached(ptrObj));
      Result:=true;
      end;

    begin
    SetLength(ObjPointers,Reflecting.Reflector.Space.Configuration.ReflectingObjPortion*SizeOf(TPtr));
    ptrPointersBuffer:=@ObjPointers[0];
    ValidPointersCount:=0;
    ptrDist:=ptrPointersBuffer;
    for I:=0 to Reflecting.Reflector.Space.Configuration.ReflectingObjPortion-1 do begin
      if (NOT GetObjPointer(ptrObj)) then Break; //. >
      asm
         PUSH EDI
         MOV EAX,ptrObj
         MOV EDI,ptrDist
         CLD
         STOSD
         MOV ptrDist,EDI
         POP EDI
      end;
      Inc(ValidPointersCount);
      end;
    if (ValidPointersCount > 0)
     then begin
      Reflecting.Lock.Leave;
      try
      SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
      Objects:=GlobalSpaceManager.ReadObjects(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword, ObjPointers,ValidPointersCount);
      ptrObjectsBuffer:=@Objects[0];
      //. cashing types system for incoming objects
      ptrSrs:=ptrObjectsBuffer;
      TypesSystem.Caching_Start;
      try
      for I:=0 to ValidPointersCount-1 do begin
        //. get object body
        asm
           PUSH ESI
           PUSH EDI
           MOV ESI,ptrSrs
           CLD
           LEA EDI,Obj
           MOV ECX,SizeOfTSpaceObj
           REP MOVSB
           MOV ptrSrs,ESI
           POP EDI
           POP ESI
        end;
        //. add object for cashing
        if Obj.idObj <> 0 then TypesSystem.Caching_AddObject(Obj.idTObj,Obj.idObj);
        //. skip points
        ptrPoint:=Obj.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          //. get point
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Point
             MOV ECX,SizeOfTPoint
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. go to next point
          ptrPoint:=Point.ptrNextObj;
          end;
        end;
      finally
      TypesSystem.Caching_Finish;
      end;
      //. write objects
      ptrPointersBuffer:=@ObjPointers[0];
      ptrObjPointer:=ptrPointersBuffer;
      ptrSrs:=ptrObjectsBuffer;
      Reflecting.Reflector.Space.Lock.Enter;
      try
      for I:=0 to ValidPointersCount-1 do begin
        //. get ptrObj
        asm
           CLD
           PUSH ESI
           MOV ESI,ptrObjPointer
           LODSD
           MOV ptrObj,EAX
           MOV ptrObjPointer,ESI
           POP ESI
        end;
        //. get object body
        asm
           PUSH ESI
           PUSH EDI
           MOV ESI,ptrSrs
           CLD
           LEA EDI,Obj
           MOV ECX,SizeOfTSpaceObj
           REP MOVSB
           MOV ptrSrs,ESI
           POP EDI
           POP ESI
        end;
        //. write body
        ptrObjAccessed:=ptrObj;
        Reflecting.Reflector.Space.WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
        ptrPoint:=Obj.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          //. get point
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Point
             MOV ECX,SizeOfTPoint
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write point
          Reflecting.Reflector.Space.WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
          //. go to next point
          ptrPoint:=Point.ptrNextObj;
          end;
        //. process obj as accessed
        if (Obj.idTObj <> idTLay2DVisualization) then Reflecting.Reflector.Space.ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
        end;
      finally
      Reflecting.Reflector.Space.Lock.Leave;
      end;
      finally
      Reflecting.Lock.Enter;
      end;
      end;
    end;

begin
(* ///? 
with Reflecting do begin
StartTimeoutEndTime:=(Now+(1000.0/(1000*60*60*24)));
//. primary lays reforming from local object registry and reflect it
ReformLaysFromLocalContext(@flReformingCancel,StartTimeoutEndTime);
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
if (flReflecting) then flReflectingCancel:=true;
SetEvent(evtQueryReflect);
//.
while (Now() < StartTimeoutEndTime) do begin
  Sleep(20);
  if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
  end;
end;
*)
with Reflecting do begin
if (flReflecting) then flReflectingCancel:=true;
SetEvent(evtQueryReflect);
end;
//.
with Reflecting do begin
//. get reflection window parameters
with Reflector.ReflectionWindow do begin
Lock.Enter;
try
GetWindow(true, RW);
RW_Scale:=_Scale;
RW_VisibleFactor:=_VisibleFactor/sqr(_Scale);
finally
Lock.Leave;
end;
end;
//. prepare invisible lays
InvisibleLayNumbersArray:=TObjectReflectingCfg(ObjectConfiguration).HidedLays.GetLayNumbersArray();
SystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(RW_Scale,{ref} InvisibleLayNumbersArray);
//. getting a objects visible in reflector window ...
if (NOT Reflector.Space.flOffline)
 then with RW do BA:=GlobalSpaceRemoteManager.GetVisibleObjects3(Reflector.Space.UserName,Reflector.Space.UserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, InvisibleLayNumbersArray, RW_VisibleFactor,0.3/RW_Scale)
 else with RW do BA:=Reflector.Space.Context_GetVisibleObjects(X0,Y0,X1,Y1,X2,Y2,X3,Y3, InvisibleLayNumbersArray, RW_VisibleFactor,0.3/RW_Scale);
//.
if (Length(BA) = 0) then Exit; //. ->
//.
NewLays:=nil;
NewLaysObjectsCount:=0;
try
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//. moving objects pointers into the new lays structure
TObjectReflectingCfg(ObjectConfiguration).GetListHidedObjects;
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
DataPtr:=@BA[0];
if (NOT Reflector.Space.flOffline) then PrepareStructuredObjects(DataPtr);
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
asm
   PUSH ESI
   MOV ESI,DataPtr
   CLD
   LODSW
   MOV LaysCount,AX
   MOV DataPtr,ESI
   POP ESI
end;
LayLevel:=0;
ptrptrLay:=@NewLays;
for I:=0 to LaysCount-1 do begin
  //. lay performing
  ptrLastObj:=nilPtr;
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSD
     MOV ObjectsCount,EAX
     LODSB
     MOV flLay,AL
     MOV DataPtr,ESI
     POP ESI
  end;
  //.
  if (flLay)
   then begin
    while (Pointer(ptrptrLay^) <> nil) do ptrptrLay:=Pointer(ptrptrLay^);
    Inc(LayLevel);
    end;
  //. get processing lay
  if (Pointer(ptrptrLay^) = nil)
   then begin //. prepare new lay
    GetMem(ptrNewLay,SizeOf(TLayReflect));
    TLayReflect(ptrNewLay^).ptrNext:=nil;
    TLayReflect(ptrNewLay^).flLay:=flLay;
    TLayReflect(ptrNewLay^).Objects:=nil;
    TLayReflect(ptrNewLay^).ObjectsCount:=0;
    Pointer(ptrptrLay^):=ptrNewLay;
    end
   else
    ptrNewLay:=Pointer(ptrptrLay^);
  ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
  //.
  Objects:=nil;
  ValidObjectsCount:=0;
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
    if (NOT TObjectReflectingCfg(ObjectConfiguration).ListHidedObjects_IsObjectFound(ptrObj))
     then
      if (ptrObj <> ptrLastObj)
       then begin
        InsertObj(ptrObj);
        ptrLastObj:=ptrObj;
        end
       else ProcessObjDetails(ptrObj, ptrptrLay);
    end;
  if (Objects <> nil)
   then begin
    TItemLayReflect(ptrLast^).ptrNext:=TLayReflect(ptrNewLay^).Objects;
    TLayReflect(ptrNewLay^).Objects:=Objects;
    Inc(TLayReflect(ptrNewLay^).ObjectsCount,ValidObjectsCount);
    //.
    Inc(NewLaysObjectsCount,ValidObjectsCount);
    end;
  end;
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
except
  ptrDumpLay:=NewLays;
  NewLays:=nil;
  //. remove incomplete new lays
  if (ptrDumpLay <> nil)
   then begin
    DumpLay_ptrptrNextLay:=@TLayReflect(ptrDumpLay^).ptrNext;
    while Pointer(DumpLay_ptrptrNextLay^) <> nil do with TLayReflect(Pointer(DumpLay_ptrptrNextLay^)^) do DumpLay_ptrptrNextLay:=@ptrNext;
    DeletingDump.Lock.Enter;
    try
    Pointer(DumpLay_ptrptrNextLay^):=DeletingDump.DumpLays;
    DeletingDump.DumpLays:=ptrDumpLay;
    finally
    DeletingDump.Lock.Leave;
    end;
    end;
  //.
  Raise; //. =>
  end;
//. change reflecting lays tree
Lock.Enter;
try
ptrFirstLay:=Lays;
Lays:=NewLays;
LaysObjectsCount:=NewLaysObjectsCount;
finally
Lock.Leave;
end;
if (ptrFirstLay <> nil)
 then begin //. remove old lays
  ptrLastLay:=ptrFirstLay;
  while TLayReflect(ptrLastLay^).ptrNext <> nil do ptrLastLay:=TLayReflect(ptrLastLay^).ptrNext;
  DeletingDump.Lock.Enter;
  try
  TLayReflect(ptrLastLay^).ptrNext:=DeletingDump.DumpLays;
  DeletingDump.DumpLays:=ptrFirstLay;
  finally
  DeletingDump.Lock.Leave;
  end;
  end;
//. enable revising
Revising.Enable();
//. reform dynamic hints
Reflector.DynamicHints.ReformFromReflectingLays();
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//. objects data getting from remote server
if ((NewLays <> nil) AND (NOT Reflector.Space.flOffline))
 then begin
  Lock.Enter;
  try
  //.
  ///? try
  ObjPointersCount:=NewLaysObjectsCount;
  PostMessage(Self.Reflecting.Reflector.Handle, WM_SHOWPROGRESSBAR,0,0);
  ptrPointersLay:=NewLays;
  ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
  while (ObjPointersCount >= Reflector.Space.Configuration.ReflectingObjPortion) do begin
    //. objects portion reading and placing into the local memory
    GetObjectsPortion(ptrPointersLay,ptrPointersLayItem, ObjPointersCount);
    //. show progress
    PostMessage(Self.Reflecting.Reflector.Handle, WM_UPDATEPROGRESSBAR,Round((NewLaysObjectsCount-ObjPointersCount)*100/NewLaysObjectsCount),0);
    //.
    Sleep(20);
    if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
    //. reflect object's portion
    if (NOT flReflecting) then SetEvent(evtQueryReflect);
    end;
  if (ObjPointersCount > 0)
   then begin
    //. objects reading and placing into the local memory
    GetObjectsPortion(ptrPointersLay,ptrPointersLayItem, ObjPointersCount);
    //.
    Sleep(0); //. exit from the current thread to alow the cancel flag to be set
    if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
    end;
  //. start reflecting
  if (flReflecting) then flReflectingCancel:=true;
  SetEvent(evtQueryReflect);
  //.
  PostMessage(Self.Reflecting.Reflector.Handle, WM_HIDEPROGRESSBAR,0,0);
  (* ///?
  finally
  //. update lays objects lay info
  Lay:=0;
  SubLay:=0;
  ptrNewLay:=NewLays;
  while (ptrNewLay <> nil) do with TLayReflect(ptrNewLay^) do begin
    ptrLayItem:=Objects;
    while (ptrLayItem <> nil) do with TItemLayReflect(ptrLayItem^) do begin
      if (NOT Reflector.Space.Obj_IsNotCached(ptrObject) AND (Reflector.Space.Obj_idType(ptrObject) <> idTLay2DVisualization)) then Reflector.Space.ObjectsContextRegistry.ObjSetLayInfo(ptrObject,Lay,SubLay);
      //. next item
      ptrLayItem:=ptrNext;
      end;
    //. next
    ptrNewLay:=ptrNext;
    if (ptrNewLay = nil) then Break; //. >
    //.
    if (TLayReflect(ptrNewLay^).flLay)
     then begin
      Inc(Lay);
      SubLay:=0;
      end
     else Inc(SubLay);
    end;
  end;
  *)
  finally
  Lock.Leave;
  end;
  end
 else begin
  PostMessage(Self.Reflecting.Reflector.Handle, WM_SHOWPROGRESSBAR,0,0);
  //. start reflecting
  if (flReflecting) then flReflectingCancel:=true;
  SetEvent(evtQueryReflect);
  //.
  PostMessage(Self.Reflecting.Reflector.Handle, WM_HIDEPROGRESSBAR,0,0);
  end;
end;   
end;

procedure TReFormingLays.ReformLaysFromLocalContext(const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime = MaxDouble);
{this code must be similar to procedure TReFormingLays.PrepareLays}
var
  RW: TReflectionWindowStrucEx;
  RW_VisibleFactor: Double;
  RW_Scale: Extended;
  InvisibleLayNumbersArray: TByteArray;
  I,J: integer;
  BA: TByteArray;
  DataPtr: pointer;
  NewLays: pointer;
  NewLaysObjectsCount: integer;
  LaysCount: word;
  LayLevel: integer;
  ptrLastObj: TPtr;
  Objects: pointer;
  flLay: boolean;
  ValidObjectsCount,ObjectsCount: integer;
  ptrLast: pointer;
  ptrObj: TPtr;
  ptrptrLay: pointer;

  ptrNewLay: pointer;
  ptrFirstLay: pointer;
  ptrLastLay: pointer;
  ptrDumpLay,DumpLay_ptrptrNextLay: pointer;

    procedure InsertObj(const ptrObj: TPtr);
    var
      ptrNew: pointer;
    begin
    GetMem(ptrNew,SizeOf(TItemLayReflect));
    with TItemLayReflect(ptrNew^) do begin
    ptrNext:=nil;
    ptrObject:=ptrObj;
    with Window do begin
    Xmn:=0; Ymn:=0;
    Xmx:=0; Ymx:=0;
    end;
    Flags_ReflectionWindowIsFilled:=false;
    ObjUpdating:=nil;
    end;
    TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
    ptrLast:=ptrNew;
    Inc(ValidObjectsCount);
    end;

begin
with Reflecting do begin
//. get reflection window parameters
with Reflector.ReflectionWindow do begin
Lock.Enter;
try
GetWindow(true, RW);
RW_Scale:=_Scale;
RW_VisibleFactor:=_VisibleFactor/sqr(_Scale);
finally
Lock.Leave;
end;
end;
//. prepare invisible lays
InvisibleLayNumbersArray:=TObjectReflectingCfg(ObjectConfiguration).HidedLays.GetLayNumbersArray();
SystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(RW_Scale,{ref} InvisibleLayNumbersArray);
//.
with RW do BA:=Reflector.Space.Context_GetVisibleObjects(X0,Y0,X1,Y1,X2,Y2,X3,Y3, InvisibleLayNumbersArray, RW_VisibleFactor,0.3/RW_Scale, ptrCancelFlag,BestBeforeTime);
if (Length(BA) = 0) then Exit; //. ->  
//.
NewLays:=nil;
NewLaysObjectsCount:=0;
try
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//. moving objects pointers into the new lays structure
TObjectReflectingCfg(ObjectConfiguration).GetListHidedObjects;
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
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
LayLevel:=0;
ptrptrLay:=@NewLays;
for I:=0 to LaysCount-1 do begin
  //. lay performing
  ptrLastObj:=nilPtr;
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSD
     MOV ObjectsCount,EAX
     LODSB
     MOV flLay,AL
     MOV DataPtr,ESI
     POP ESI
  end;
  //.
  if (flLay)
   then begin
    while (Pointer(ptrptrLay^) <> nil) do ptrptrLay:=Pointer(ptrptrLay^);
    Inc(LayLevel);
    end;
  //. get processing lay
  if (Pointer(ptrptrLay^) = nil)
   then begin //. prepare new lay
    GetMem(ptrNewLay,SizeOf(TLayReflect));
    TLayReflect(ptrNewLay^).ptrNext:=nil;
    TLayReflect(ptrNewLay^).flLay:=flLay;
    TLayReflect(ptrNewLay^).Objects:=nil;
    TLayReflect(ptrNewLay^).ObjectsCount:=0;
    Pointer(ptrptrLay^):=ptrNewLay;
    end
   else
    ptrNewLay:=Pointer(ptrptrLay^);
  ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
  //.
  Objects:=nil;
  ValidObjectsCount:=0;
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
    if (NOT TObjectReflectingCfg(ObjectConfiguration).ListHidedObjects_IsObjectFound(ptrObj))
     then
      if (ptrObj <> ptrLastObj)
       then begin
        InsertObj(ptrObj);
        ptrLastObj:=ptrObj;
        end;
       //. there is no details support locally | else ProcessObjDetails(ptrObj, ptrptrLay);
    end;
  if (Objects <> nil)
   then begin
    TItemLayReflect(ptrLast^).ptrNext:=TLayReflect(ptrNewLay^).Objects;
    TLayReflect(ptrNewLay^).Objects:=Objects;
    Inc(TLayReflect(ptrNewLay^).ObjectsCount,ValidObjectsCount);
    //.
    Inc(NewLaysObjectsCount,ValidObjectsCount);
    end;
  end;
//.
Sleep(0); //. exit from the current thread to alow the cancel flag to be set
if (flReformingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
//.
except
  ptrDumpLay:=NewLays;
  NewLays:=nil;
  //. remove incomplete new lays
  if (ptrDumpLay <> nil)
   then begin
    DumpLay_ptrptrNextLay:=@TLayReflect(ptrDumpLay^).ptrNext;
    while Pointer(DumpLay_ptrptrNextLay^) <> nil do with TLayReflect(Pointer(DumpLay_ptrptrNextLay^)^) do DumpLay_ptrptrNextLay:=@ptrNext;
    DeletingDump.Lock.Enter;
    try
    Pointer(DumpLay_ptrptrNextLay^):=DeletingDump.DumpLays;
    DeletingDump.DumpLays:=ptrDumpLay;
    finally
    DeletingDump.Lock.Leave;
    end;
    end;
  //.
  Raise; //. =>
  end;
//. change reflecting lays tree
Lock.Enter;
try
ptrFirstLay:=Lays;
Lays:=NewLays;
LaysObjectsCount:=NewLaysObjectsCount;
finally
Lock.Leave;
end;
if (ptrFirstLay <> nil)
 then begin //. remove old lays
  ptrLastLay:=ptrFirstLay;
  while TLayReflect(ptrLastLay^).ptrNext <> nil do ptrLastLay:=TLayReflect(ptrLastLay^).ptrNext;
  DeletingDump.Lock.Enter;
  try
  TLayReflect(ptrLastLay^).ptrNext:=DeletingDump.DumpLays;
  DeletingDump.DumpLays:=ptrFirstLay;
  finally
  DeletingDump.Lock.Leave;
  end;
  end;
//. enable revising
Revising.Enable();
//. reform dynamic hints
Reflector.DynamicHints.ReformFromReflectingLays();
end;
end;

procedure TReFormingLays.Execute;
var
  R: DWord;
begin
CoInitializeEx(nil, COINIT_MULTITHREADED);
try
repeat
  R:=WaitForSingleObject(evtQueryReForm, 100);
  if (R = WAIT_OBJECT_0)
   then
    try
    //. to avoid often calls
    while (WaitForSingleObject(evtQueryReForm, 300) = WAIT_OBJECT_0) do ;
    //.
    ReForming();
    except
      On E: EUnnecessaryExecuting do ;
      On E: Exception do if (Reflecting.Reflector.State <> rsDestroying) then EventLog.WriteMajorEvent('LaysReforming','Lays reforming error.',E.Message);
      end;
until Terminated;
finally
CoUninitialize;
end;
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


{TLastReflectedBitmap}
Constructor TLastReflectedBitmap.Create;
begin
Inherited Create;
//.
BMP:=TBitmap.Create;
BMP.HandleType:=bmDIB;
BMP.PixelFormat:=pf24bit;
BMP_flSet:=false;
//.
Transformatrix_SetIdentity();
end;

Destructor TLastReflectedBitmap.Destroy;
begin
BMP.Free;
Inherited;
end;

procedure TLastReflectedBitmap.BMP_SetFrom(const pBMP: TBitmap);
begin
BMP.Canvas.Lock();
pBMP.Canvas.Lock();
try
BMP.Canvas.Draw(0,0,pBMP);
BMP_flSet:=true;
Transformatrix_SetIdentity();
finally
pBMP.Canvas.Unlock();
BMP.Canvas.Unlock();
end;
end;

function TLastReflectedBitmap.BMP_IsSet(): boolean;
begin
BMP.Canvas.Lock();
try
Result:=BMP_flSet;
finally
BMP.Canvas.Unlock();
end;
end;

procedure TLastReflectedBitmap.BMP_Clear();
begin
BMP.Canvas.Lock();
try
BMP_flSet:=false;
finally
BMP.Canvas.Unlock();
end;
end;

procedure TLastReflectedBitmap.BMP_ReflectWithTransformation(const pCanvas: TCanvas);

  function DrawUsingGDIPlus(const CanvasHandle: THandle; const BMP: TBitmap): boolean;
  var
    GDIPlusGraphics: TGPGraphics;
    GDIPlusBitmap: TGPBitmap;
  begin
  GDIPlusGraphics:=TGPGraphics.Create(CanvasHandle);
  try
  GDIPlusGraphics.SetInterpolationMode(InterpolationModeBilinear);
  GDIPlusBitmap:=TGPBitmap.Create(BMP.Handle,BMP.Palette);
  try
  Result:=(GDIPlusGraphics.DrawImage(GDIPlusBitmap, 0,0, 0,0,BMP.Width,BMP.Height, UnitPixel) = Ok)
  finally
  GDIPlusBitmap.Destroy;
  end;
  finally
  GDIPlusGraphics.Destroy;
  end;
  end;

begin
BMP.Canvas.Lock;
pCanvas.Lock;
try
SetGraphicsMode(pCanvas.Handle,GM_ADVANCED);
SetWorldTransForm(pCanvas.Handle,Transformatrix);
try
DrawUsingGDIPlus(pCanvas.Handle,BMP);
finally
ModifyWorldTransForm(pCanvas.Handle,Transformatrix,MWT_IDENTITY);
end;
finally
pCanvas.Unlock;
BMP.Canvas.Unlock;
end;
end;

procedure TLastReflectedBitmap.Transformatrix_SetIdentity();
begin
BMP.Canvas.Lock();
try
with Transformatrix do begin
eDx:=0.0;
eDy:=0.0;
eM11:=1.0;
eM12:=0.0;
eM21:=0.0;
eM22:=1.0;
end;
Transformatrix_dX:=0.0;
Transformatrix_dY:=0.0;
Transformatrix_Scaling:=1.0;
Transformatrix_Rotating:=0.0;
Transformatrix_flIdentity:=true;
finally
BMP.Canvas.Unlock();
end;
end;

function TLastReflectedBitmap.Transformatrix_IsIdentity(): boolean;
begin
BMP.Canvas.Lock();
try
Result:=Transformatrix_flIdentity;
finally
BMP.Canvas.Unlock();
end;
end;

procedure TLastReflectedBitmap.Transformatrix_Move(const dX,dY: single);
var
  MT: XForm;
begin
MT.eDx:=dX;
MT.eDy:=dY;
MT.eM11:=1.0;
MT.eM12:=0.0;
MT.eM21:=0.0;
MT.eM22:=1.0;
//.
BMP.Canvas.Lock();
try
CombineTransform(Transformatrix,Transformatrix,MT);
Transformatrix_dX:=Transformatrix_dX+dX;
Transformatrix_dY:=Transformatrix_dY+dY;
Transformatrix_flIdentity:=false;
finally
BMP.Canvas.Unlock();
end;
end;

procedure TLastReflectedBitmap.Transformatrix_Scale(const dX,dY: single; const Scale: single);
var
  MT,MT1: XForm;
begin
MT.eDx:=0.0;
MT.eDy:=0.0;
MT.eM11:=Scale;
MT.eM12:=0.0;
MT.eM21:=0.0;
MT.eM22:=Scale;
//.
MT1.eDx:=-dX;
MT1.eDy:=-dY;
MT1.eM11:=1.0;
MT1.eM12:=0.0;
MT1.eM21:=0.0;
MT1.eM22:=1.0;
//.
BMP.Canvas.Lock();
try
CombineTransform(Transformatrix,Transformatrix,MT1);
CombineTransform(Transformatrix,Transformatrix,MT);
MT1.eDx:=-MT1.eDx; MT1.eDy:=-MT1.eDy;
CombineTransform(Transformatrix,Transformatrix,MT1);
Transformatrix_Scaling:=Transformatrix_Scaling*Scale;
Transformatrix_flIdentity:=false;
finally
BMP.Canvas.Unlock();
end;
end;

procedure TLastReflectedBitmap.Transformatrix_Rotate(const dX,dY: single; const Angle: single);
var
  MT,MT1: XForm;
begin
MT.eDx:=0.0;
MT.eDy:=0.0;
MT.eM11:=Cos(Angle);
MT.eM12:=Sin(Angle);
MT.eM21:=-Sin(Angle);
MT.eM22:=Cos(Angle);
//.
MT1.eDx:=-dX;
MT1.eDy:=-dY;
MT1.eM11:=1.0;
MT1.eM12:=0.0;
MT1.eM21:=0.0;
MT1.eM22:=1.0;
//.
BMP.Canvas.Lock();
try
CombineTransform(Transformatrix,Transformatrix,MT1);
CombineTransform(Transformatrix,Transformatrix,MT);
MT1.eDx:=-MT1.eDx; MT1.eDy:=-MT1.eDy;
CombineTransform(Transformatrix,Transformatrix,MT1);
Transformatrix_Rotating:=Transformatrix_Rotating+Angle;
Transformatrix_flIdentity:=false;
finally
BMP.Canvas.Unlock();
end;
end;


{TReflectingConfiguration}
Constructor TReflectingConfiguration.Create(const pReflecting: TReflecting);
begin
Inherited Create;
Reflecting:=pReflecting;
FileName:='Reflector'+'\'+IntToStr(Reflecting.Reflector.id)+'\'+'ReflectingConfiguration.xml';
Load();
end;

procedure TReflectingConfiguration.Load();
var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
begin
//. defaults
BriefReflectingType:=brtPartialWithLastReflection;
BriefReflectingType__TimeLimited_MaxReflectingTime:=20;
BriefReflectingType__PartialWithLastReflection_MaxReflectingLay:=5;
//.
with TProxySpaceUserProfile.Create(Reflecting.Reflector.Space) do
try
if (FileExists(ProfileFolder+'\'+FileName))
 then begin
  SetProfileFile(FileName);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProfileFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/BriefReflectingType');
  BriefReflectingType:=Node.nodeTypedValue;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/BRT__TimeLimited_MaxReflectingTime');
  BriefReflectingType__TimeLimited_MaxReflectingTime:=Node.nodeTypedValue;
  //.
  Node:=Doc.documentElement.selectSingleNode('/ROOT/BRT__PartialWithLastReflection_MaxReflectingLay');
  BriefReflectingType__PartialWithLastReflection_MaxReflectingLay:=Node.nodeTypedValue;
  end;
finally
Destroy;
end;
end;

procedure TReflectingConfiguration.Save();
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  Node: IXMLDOMElement;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//.
Node:=Doc.createElement('BriefReflectingType');
Node.nodeTypedValue:=BriefReflectingType;
Root.appendChild(Node);
//.
Node:=Doc.createElement('BRT__TimeLimited_MaxReflectingTime');
Node.nodeTypedValue:=BriefReflectingType__TimeLimited_MaxReflectingTime;
Root.appendChild(Node);
//.
Node:=Doc.createElement('BRT__PartialWithLastReflection_MaxReflectingLay');
Node.nodeTypedValue:=BriefReflectingType__PartialWithLastReflection_MaxReflectingLay;
Root.appendChild(Node);
//. save xml document
with TProxySpaceUserProfile.Create(Reflecting.Reflector.Space) do
try
ProfileFile:=ProfileFolder+'\'+FileName;
ForceDirectories(ExtractFilePath(ProfileFile));
Doc.Save(ProfileFile);
finally
Destroy;
end;
end;


{TReflecting}
Constructor TReflecting.Create(pReflector: TReflector);
var
  DIBSection: TDIBSection;
begin
Lays:=nil;
LaysObjectsCount:=0;
Lock:=TCriticalSection.Create;
flReflecting:=false;
flBriefReflecting:=false;
Reflector:=pReflector;
Reflector.Reflecting:=Self;
evtQueryReflect:=CreateEvent(nil,false,false,nil);
//.
Configuration:=TReflectingConfiguration.Create(Self);
ObjectConfiguration:=TObjectReflectingCfg.Create(Self);
//.
BMP:=TBitmap.Create;
BMP.HandleType:=bmDIB;
BMP.PixelFormat:=pf24bit;
BMP.Canvas.Font.Handle:=0;
if (GetObject(BMP.Handle,SizeOf(DIBSection),@DIBSection) <> 0)
 then BMP_PixData:=System.PByte(DIBSection.dsBm.bmBits)
 else BMP_PixData:=nil;
//.
LastReflectedBitmap:=TLastReflectedBitmap.Create;
//.
ObjectCreating_Visualisation:=nil;
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
DeletingDump:=TDeletingDump.Create(Self);
ReFormingLays:=TReFormingLays.Create(Self);
Revising:=TRevising.Create(Self);
//.
Validate();
ReflectionID:=0;
ReflectionFrameID:=0;
//.
Inherited Create(true);
Priority:=tpNormal;
Resume;
end;

destructor TReflecting.Destroy;
var
  EC: dword;
begin
flReflectingCancel:=true;
//. terminating
Terminate();
if (false) ///- (Reflector.State <> rsDestroying)
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
//.
Revising.Free;
ReFormingLays.Free;
DeletingDump.Free;
AdditiveFigureWinRefl.Free;
FigureWinRefl.Free;
WindowRefl.Free;
ObjectCreating_Visualisation.Free;
//.
LastReflectedBitmap.Free;
BMP.Free;
//.
ObjectConfiguration.Free;
Configuration.Free;
//.
CloseHandle(evtQueryReflect);
//.
Lock.Free;
TDeletingDump.ForceDelete(@Lays);
end;

procedure TReflecting.Validate;
var
  RW: TReflectionWindowStrucEx;
  DIBSection: TDIBSection;
begin
Reflector.ReflectionWindow.GetWindow(true, RW);
//.
WindowRefl.Free;
WindowRefl:=nil;
WindowRefl:=TWindow.Create(RW.Xmn-3,RW.Ymn-3,RW.Xmx+3,RW.Ymx+3);
try
with BMP do begin
Height:=RW.Ymx-RW.Ymn;
Width:=RW.Xmx-RW.Xmn;
Canvas.Pen.Color:=clEmptySpace;
Canvas.Brush.Color:=clEmptySpace;
Canvas.Rectangle(0,0, Width,Height);
end;
if (GetObject(BMP.Handle,SizeOf(DIBSection),@DIBSection) <> 0)
 then BMP_PixData:=System.PByte(DIBSection.dsBm.bmBits)
 else BMP_PixData:=nil;
//.
with LastReflectedBitmap.BMP do begin
Height:=RW.Ymx-RW.Ymn;
Width:=RW.Xmx-RW.Xmn;
Canvas.Pen.Color:=clEmptySpace;
Canvas.Brush.Color:=clEmptySpace;
Canvas.Rectangle(0,0, Width,Height);
end;
LastReflectedBitmap.BMP_Clear();
except
  //. иногда здесь возникает эксепшена
  end;
end;

procedure TReflecting.Obj_GetReflWindow(const ptrObj: TPtr; var Xmin,Ymin,Xmax,Ymax: smallint);

  procedure ProcessPoint(X,Y: Extended; const RW: TReflectionWindowStrucEx; const flSet: boolean);
  var
    C,QdC,A1,QdA2,QdB2,H: Extended;
    L: Extended;
    Node: TNode;
    Xr,Yr: Extended;
    Xrefl,Yrefl: smallint;
  begin
  with Reflector,RW do begin
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
  RW: TReflectionWindowStrucEx;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  I: integer;
  Node: TNodeSpaceObjPolyLinePolygon;
begin
Reflector.ReflectionWindow.GetWindow(false, RW);
//.
Reflector.Space.Lock.Enter;
try
Reflector.Space.ReadObj(Obj,SizeOf(Obj), ptrObj);
if Obj.Width > 0
 then with TSpaceObjPolylinePolygon.Create(Reflector.Space, Obj) do
  try
  if Count > 0
   then begin
    ProcessPoint(Nodes[0].X,Nodes[0].Y,RW, true);
    for I:=1 to Count-1 do ProcessPoint(Nodes[I].X,Nodes[I].Y,RW, false);
    end;
  finally
  Destroy;
  end
 else begin
  ptrPoint:=Obj.ptrFirstPoint;
  if ptrPoint = nilPtr then Exit;
  Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  ProcessPoint(Point.X,Point.Y,RW, true);
  ptrPoint:=Point.ptrNextObj;
  While ptrPoint <> nilPtr do begin
   Reflector.Space.ReadObj(Point,SizeOf(Point), ptrPoint);
   ProcessPoint(Point.X,Point.Y,RW, false);
   ptrPoint:=Point.ptrNextObj;
   end;
  end;
finally
Reflector.Space.Lock.Leave;
end;
end;

procedure TReflecting.Obj_GetReflWindow(const Obj_ContainerCoord: TContainerCoord; var Xmn,Ymn,Xmx,Ymx: smallint);

  procedure ProcessPoint(X,Y: Extended; const RW: TReflectionWindowStrucEx; const flSet: boolean);
  var
    C,QdC,A1,QdA2,QdB2,H: Extended;
    L: Extended;
    Node: TNode;
    Xr,Yr: Extended;
    Xrefl,Yrefl: smallint;
  begin
  with Reflector,RW do begin
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

var
  RW: TReflectionWindowStrucEx;
begin
Reflector.ReflectionWindow.GetWindow(false, RW);
//.
with Obj_ContainerCoord do begin
ProcessPoint(Xmin,Ymin,RW,true);
ProcessPoint(Xmax,Ymin,RW,false);
ProcessPoint(Xmax,Ymax,RW,false);
ProcessPoint(Xmin,Ymax,RW,false);
end;
end;

procedure TReflecting.Execute;
var
  R: DWord;
  StartupInput: TGDIPlusStartupInput;
  gdiplusToken: ULONG;
begin
//. init com
CoInitializeEx(nil, COINIT_MULTITHREADED);
try
//. init GDI+
StartupInput.DebugEventCallback := nil;
StartupInput.SuppressBackgroundThread := False;
StartupInput.SuppressExternalCodecs   := False;
StartupInput.GdiplusVersion := 1;
GdiplusStartup(gdiplusToken, @StartupInput, nil);
try
repeat
  R:=WaitForSingleObject(evtQueryReflect, 100);
  if R = WAIT_OBJECT_0
   then
    try
    //. to avoid often calls
    while (WaitForSingleObject(evtQueryReflect, 100) = WAIT_OBJECT_0) do ;
    //.
    Reflecting(); 
    except
      On E: EUnnecessaryExecuting do ;
      On E: Exception do if (Reflector.State <> rsDestroying) then EventLog.WriteMajorEvent('LaysReflecting','Error during lays reflecting.',E.Message);
      end;
until Terminated;
finally
GdiplusShutdown(gdiplusToken);
end;
finally
CoUninitialize;
end;
end;

procedure TReflecting.Obj_PrepareFigures(const ptrObject: TPtr; pReflectionWindow: TReflectionWindow; pWindowRefl: TWindow;  pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; const ptrWindowFilledFlag: pointer = nil);
var
  RW: TReflectionWindowStrucEx;
  I: integer;

  procedure TreatePoint(const RW: TReflectionWindowStrucEx; X,Y: Extended);
  var
    QdA2: Extended;
    X_C,X_QdC,X_A1,X_QdB2: Extended;
    Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
    Node: TNode;
  begin
  with Reflector,RW do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;
  QdA2:=sqr(X-X0)+sqr(Y-Y0);

  X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
  X_C:=Sqrt(X_QdC);
  X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
  X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);

  Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
  Y_C:=Sqrt(Y_QdC);
  Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
  Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);

  Node.X:=Xmn+X_A1/X_C*(Xmx-Xmn);
  Node.Y:=Ymn+Y_A1/Y_C*(Ymx-Ymn);

  pFigureWinRefl.Insert(Node)
  end;
  end;

  procedure TreatePointAs3D(const RW: TReflectionWindowStrucEx; X,Y: Extended);
  var
    X_A,X_B,X_C,X_D: Extended;
    Y_A,Y_B,Y_C,Y_D: Extended;
    XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
    Node: TNode;
  begin
  with Reflector,RW do begin
  X:=X*cfTransMeter;
  Y:=Y*cfTransMeter;

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

  Node.X:=Xmn+X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn);
  Node.Y:=Ymn+Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn);

  pFigureWinRefl.Insert(Node)
  end;
  end;

var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;

  ptrOwnerObj: TPtr;

var
  CurPoint: word;
  PenColor: TColor;
  PenStyle: TPenStyle;
  PenWidth: integer;
  FWR_flWindowFilled,AFWR_flWindowFilled: boolean;
begin
pReflectionWindow.GetWindow(false, RW);
//.
with Reflector do begin
Space.Lock.Enter;
try
Space.ReadObj(Obj,SizeOf(TSpaceObj), ptrObject);
with pFigureWinRefl do begin
Clear;
ptrObj:=ptrObject;
idTObj:=Obj.idTObj;
idObj:=Obj.idObj;
flagLoop:=Obj.flagLoop;
Color:=Obj.Color;
flagFill:=Obj.flagFill;
ColorFill:=Obj.ColorFill;
Width:=Obj.Width;
if ptrObj <> ptrSelectedObj
 then flSelected:=false
 else flSelected:=true;
end;
pAdditiveFigureWinRefl.Clear;
ptrPoint:=Obj.ptrFirstPoint;
CurPoint:=0;
while (ptrPoint <> nilPtr) do begin
  Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  TreatePoint(RW, Point.X,Point.Y);
  if (ptrPoint = ptrSelectedPointObj) then pFigureWinRefl.SelectedPoint_Index:=CurPoint;
  ptrPoint:=Point.ptrNextObj;
  Inc(CurPoint);
  end;
finally
Space.Lock.Leave;
end;
FWR_flWindowFilled:=false;
AFWR_flWindowFilled:=false;
if (Obj.Width > 0)
 then with pAdditiveFigureWinRefl do begin
  Assign(pFigureWinRefl);
  if (ValidateAsPolyLine(ReflectionWindow.Scale))
   then begin
    AttractToLimits(pWindowRefl, @AFWR_flWindowFilled);
    Optimize();
    end;
  end;
pFigureWinRefl.AttractToLimits(pWindowRefl, @FWR_flWindowFilled);
pFigureWinRefl.Optimize();
if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=(AFWR_flWindowFilled OR FWR_flWindowFilled);
end;
end;

class procedure TReflecting.Obj_ComponentContext_DrawHint(const Space: TProxySpace; const pFigureWinRefl,pAdditiveFigure: TFigureWinRefl; const pCanvas: TCanvas);
const
  Hint_Color = clWhite;
  Hint_FontSize = 12;
  Hint_Polygon_FitFactor = 0.7;
  Hint_Polyline_FitFactor = 1.5;
var
  Hint: string;
  HintExtent: TSize;
  HintExtentS: integer;
  L: Extended;
  Xmn,Ymn,Xmx,Ymx: integer;
  S: integer;
  Xr,Yr: Extended;
  X,Y: integer;

    procedure ProcessAsPolyline();
    var
      I: integer;
      flLineIsFound: boolean;
      dX,dY: integer;
      MinFactor: Extended;
      L,D: Extended;
      Length: Extended;
      X0,Y0,X1,Y1: Extended;
      diffX1X0,diffY1Y0: Extended;
      b,V: Extended;
      S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
      Xc,Yc: integer;
      Alfa: Extended;
      LogFont: TLogFont;
      H: HFont;
      OldBkMode: integer;
    begin
    //. get text line
    flLineIsFound:=false;
    MinFactor:=MaxExtended;
    with pFigureWinRefl do
    for I:=0 to CountScreenNodes-2 do begin
      dX:=ScreenNodes[I+1].X-ScreenNodes[I].X;
      if (dX <> 0)
       then begin
        dY:=ScreenNodes[I+1].Y-ScreenNodes[I].Y;
        L:=Sqrt(sqr(dX)+sqr(dY));
        if (HintExtent.cX <= L*Hint_Polyline_FitFactor)
         then begin
          D:=Abs(dY/dX);
          if (D < MinFactor)
           then begin
            X0:=ScreenNodes[I].X; Y0:=ScreenNodes[I].Y;
            X1:=ScreenNodes[I+1].X; Y1:=ScreenNodes[I+1].Y;
            Length:=L;
            MinFactor:=D;
            flLineIsFound:=true;
            end;
          end;
        end;
      end;
    //.
    if (NOT flLineIsFound) then Exit; //. ->
    //.
    if (X0 > X1)
     then begin
      V:=X0; X0:=X1; X1:=V;
      V:=Y0; Y0:=Y1; Y1:=V;
      end;
    D:=(Length-HintExtent.cX)/(2*Length);
    X0:=X0+(X1-X0)*D; Y0:=Y0+(Y1-Y0)*D;
    //.
    diffX1X0:=X1-X0;
    diffY1Y0:=Y1-Y0;
    if (diffX1X0 > 0) AND (diffY1Y0 >= 0)
     then Alfa:=2*PI+ArcTan(-diffY1Y0/diffX1X0)
     else
      if (diffX1X0 < 0) AND (diffY1Y0 > 0)
       then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
       else
        if (diffX1X0 < 0) AND (diffY1Y0 <= 0)
         then Alfa:=PI+ArcTan(-diffY1Y0/diffX1X0)
         else
          if (diffX1X0 > 0) AND (diffY1Y0 < 0)
           then Alfa:=ArcTan(-diffY1Y0/diffX1X0)
           else
            if diffY1Y0 > 0
             then Alfa:=3*PI/2
             else Alfa:=PI/2;
    b:=HintExtent.cY/2;
    if Abs(diffY1Y0) > Abs(diffX1X0)
     then begin
      V:=b/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
      S0_X3:=(V)+X0;
      S0_Y3:=(-V)*(diffX1X0/diffY1Y0)+Y0;
      S1_X3:=(-V)+X0;
      S1_Y3:=(V)*(diffX1X0/diffY1Y0)+Y0;
      end
     else begin
      V:=b/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
      S0_Y3:=(V)+Y0;
      S0_X3:=(-V)*(diffY1Y0/diffX1X0)+X0;
      S1_Y3:=(-V)+Y0;
      S1_X3:=(V)*(diffY1Y0/diffX1X0)+X0;
      end;
    if (3*PI/4 <= Alfa) AND (Alfa < 7*PI/4)
     then begin Xc:=Trunc(S0_X3); Yc:=Trunc(S0_Y3) end
     else begin Xc:=Trunc(S1_X3); Yc:=Trunc(S1_Y3) end;
    //.
    with pCanvas do begin
    Font.Color:=Hint_Color;
    //.
    GetObject(Font.Handle,SizeOf(LogFont),@LogFont);
    with LogFont do begin
    lfEscapement:=Trunc(Alfa*180/PI*10);
    lfOrientation:=Trunc(Alfa*180/PI*10);
    StrPCopy(lfFaceName,'Tahoma');
    end;
    //.
    H:=CreateFontIndirect(LogFont);
    try
    SelectObject(Handle,H);
    try
    OldBkMode:=SetBkMode(Handle, TRANSPARENT);
    try
    TextOut(Xc,Yc,Hint);
    finally
    SetBkMode(Handle, OldBkMode);
    end;
    finally
    SelectObject(Handle,Font.Handle);
    end;
    finally
    DeleteObject(H);
    end;
    end;
    end;

var
  TypeContext: TComponentTypeContext;
  ContextItem: TComponentContextItem;
begin
TypeContext:=TTypesSystem(Space.TypesSystem).Context.TypeContext[pFigureWinRefl.idTObj];
//.
if (NOT TBaseVisualizationTypeSystem(TypeContext.TypeSystem).InplaceHintEnabled()) then Exit; //. ->
TypeContext.Lock();
try
ContextItem:=TypeContext[pFigureWinRefl.idObj];
if (ContextItem = nil) then Exit; //. ->
Hint:=ContextItem.Name;
finally
TypeContext.Unlock();
end;
if (Hint = '') then Exit; //. ->
//.
pCanvas.Font.Size:=Hint_FontSize;
HintExtent:=pCanvas.TextExtent(Hint);
if (pFigureWinRefl.Width > 0)
 then begin //. draw for polyline figure
  if ((pAdditiveFigure.CountScreenNodes > 0) AND (HintExtent.cY <= pAdditiveFigure.ScreenWidth*Hint_Polyline_FitFactor))
   then ProcessAsPolyline();
  end
 else
  if (pFigureWinRefl.flagLoop AND pFigureWinRefl.flagFill)
   then begin //. draw for polygon figure
    if (pFigureWinRefl.ScreenNodes_GetMinMax({out} Xmn,Ymn,Xmx,Ymx))
     then begin
      S:=(Xmx-Xmn)*(Ymx-Ymn);
      HintExtentS:=HintExtent.cX*HintExtent.cY;
      if ((HintExtent.cX <= (Xmx-Xmn)*Hint_Polygon_FitFactor) AND (HintExtent.cY <= (Ymx-Ymn)*Hint_Polygon_FitFactor))
       then begin
        pFigureWinRefl.ScreenNodes_GetAveragePoint({out} Xr,Yr);
        X:=Trunc(Xr)-(HintExtent.cX SHR 1);
        Y:=Trunc(Yr)-(HintExtent.cY SHR 1);
        pCanvas.Font.Color:=Hint_Color;
        pCanvas.Brush.Style:=bsClear;
        pCanvas.TextOut(X,Y, Hint);
        end
      end;
    end
end;

procedure TReflecting.Reflecting;

  procedure ReflectAs2D;

    function Obj_Filled(const Obj: TSpaceObj): boolean;
    begin
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    Result:=ContainerFilled;
    finally
    Release;
    end;
    end;

  var
    ActualityInterval: TComponentActualityInterval;
    ptrReflLay: pointer;
    FirstVisibleLay: integer;
    LayNumber: integer;
    ptrItem: pointer;
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
  begin
  ActualityInterval:=Reflector.ReflectionWindow.GetActualityInterval();
  //.
  Lock.Enter;
  try
  //. lays validation for object that filled all window
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Reflector.Space.Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          //. process clipping
          flClipping:=false;
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
                end;
              //.
              Sleep(0); //. exit from the current thread to alow the cancel flag to be set
              if (flReflectingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            end;
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))) AND Flags_ReflectionWindowIsFilled)
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      //.
      Sleep(0); //. exit from the current thread to alow the cancel flag to be set
      if (flReflectingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //. got to next next
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
      //.
      Inc(LayNumber);
      ptrReflLay:=ptrNext;
      end;}
  //. reflecting
  BMP.Canvas.Lock;
  try
  //. set user dynamic hints as invisible
  Reflector.DynamicHints.UserDynamicHints.ClearItemsVisibleState();
  //.
  BMP_Init(BMP);
  //.
  Sleep(0); //. exit from the current thread to alow the cancel flag to be set
  if (flReflectingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      //. process a layer objects
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        with TItemLayReflect(ptrItem^) do begin
        Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if (Reflector.Space.Obj_IsCached(Obj) AND Reflector.Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
         then begin
          //. clipping if necessary
          flClipping:=false;
          flClipVisible:=false;
          try
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                //.
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
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
              Sleep(0); //. exit from the current thread to alow the cancel flag to be set
              if (flReflectingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin
              SelectClipRgn(BMP.Canvas.Handle, ClippingRegion);
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            //.
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
              //. reflecting obj ...
              //. special editing
              {with Reflector do
              if (NOT ((EditingOrCreatingObject <> nil) AND (NOT EditingOrCreatingObject.flCreating) AND (EditingOrCreatingObject.PrototypePtr = ptrObject))) then}
              Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, BMP.Canvas,false, Window, @ObjUpdating, @flReflectingCancel, MaxDouble);
              //.
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then begin
                if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,FigureWinRefl.idObj, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                end else begin
                 if (FigureWinRefl.idTObj = idTCoVisualization)
                  then begin
                   if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,idHINTVisualization, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                   end;
                 //. draw inplace hint 
                 if (Reflector.DynamicHints.flEnabled) then Obj_ComponentContext_DrawHint(Reflector.Space,FigureWinRefl,AdditiveFigureWinRefl,BMP.Canvas);
                 end;
              //. try to set visible state of user defined hints
              Reflector.DynamicHints.UserDynamicHints.SetItemAsVisible(ptrObject,FigureWinRefl);
              end
             else begin
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then Reflector.DynamicHints.RemoveItem(ptrObject) else
              if ((FigureWinRefl.idTObj = idTCoVisualization) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization))
               then Reflector.DynamicHints.RemoveItem(ptrObject);
              end;
            end;
          finally
          //. restore clipping
          SelectClipRgn(BMP.Canvas.Handle, 0);
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          end;
        end;
        //.
        Sleep(0); //. exit from the current thread to alow the cancel flag to be set
        if (flReflectingCancel) then Raise EUnnecessaryExecuting.Create(''); //. =>
        //. go to next item
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  //. reform dynamic hints
  Reflector.DynamicHints.FormItems(BMP,@flReflectingCancel);
  Reflector.DynamicHints.UserDynamicHints.CheckItemsVisibility(ActualityInterval,@flReflectingCancel);
  //. show result bitmap
  LastReflectedBitmap.BMP.Canvas.Lock;
  try
  BMP_Reflect(BMP,true,@flReflectingCancel,MaxDouble);
  //.
  LastReflectedBitmap.BMP_SetFrom(BMP);
  finally
  LastReflectedBitmap.BMP.Canvas.Unlock;
  end;
  finally
  BMP.Canvas.UnLock;
  end;
  finally
  Lock.Leave;
  end;
  //. validate reflection mouse elements
  Reflector.ValidateReflectionMouseElements();
  end;

begin
flReflectingCancel:=false;
flReflecting:=true;
try
Revising.Cancel();
//.
Inc(ReflectionFrameID);
ReflectAs2D;
finally
flReflecting:=false;
end;
end;

procedure TReflecting.ReflectLimitedByTime(const ReflectTimeInterval: integer; const ExceptObjPtr: TPtr = nilPtr);

  procedure ReflectAs2D;
  label
    MReflect;
  const
    minObjCount = 300;

    function Obj_Filled(const Obj: TSpaceObj): boolean;
    begin
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    Result:=ContainerFilled;
    finally
    Release;
    end;
    end;

  var
    ActualityInterval: TComponentActualityInterval;
    ptrReflLay: pointer;
    ptrItem: pointer;
    OWR: TObjWinRefl;
    BestBeforeTime,ObjBestBeforeTime,ReflectBestBeforeTime: TDateTime;
    ObjCount: integer;
    LayNumber: integer;
    FirstVisibleLay: integer;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    flClipping: boolean;
    flClipVisible: boolean;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
    _Now: TDateTime;
  begin
  ActualityInterval:=Reflector.ReflectionWindow.GetActualityInterval();
  //.
  if (ReflectTimeInterval <> -1)
   then BestBeforeTime:=Now+(ReflectTimeInterval*(1.0/(24*3600*1000)))
   else BestBeforeTime:=MaxDouble;
  //.
  ObjCount:=0;
  Lock.Enter;
  try
  //. lays validation for object that filled all window
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      //.
      Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Reflector.Space.Obj_IsCached(Obj)  AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval) AND (ptrObject <> ExceptObjPtr))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          flWindowFilled:=false;
          //. process clipping
          flClipping:=false;
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
                if (flWindowFilled)then Break; //. >
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            end;
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))) AND flWindowFilled AND Obj_Filled(Obj))
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;}
  //. reflecting
  BMP.Canvas.Lock;
  try
  //. set user dynamic hints as invisible
  Reflector.DynamicHints.UserDynamicHints.ClearItemsVisibleState();
  //.
  BMP_Init(BMP);
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        if (TLayReflect(ptrReflLay^).flLay AND (ObjCount > minObjCount) AND (Now > BestBeforeTime)) then GoTo MReflect; //. >
        with TItemLayReflect(ptrItem^) do begin
        Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if (Reflector.Space.Obj_IsCached(Obj) AND Reflector.Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval) AND (ptrObject <> ExceptObjPtr))
         then begin
          //. clipping if necessary
          flClipping:=false;
          flClipVisible:=false;
          try
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                //.
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
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
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin 
              SelectClipRgn(BMP.Canvas.Handle, ClippingRegion);
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            //.
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
               if (ReflectTimeInterval <> -1)
               then ObjBestBeforeTime:=Now+(15{milliseconds per object}*(1.0/(24*3600*1000)))
               else ObjBestBeforeTime:=MaxDouble;
              Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, BMP.Canvas,false, OWR, @ObjUpdating, nil, ObjBestBeforeTime);
              //.
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then begin
                if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,FigureWinRefl.idObj, Xhint,Yhint,((OWR.Xmx-OWR.Xmn)*(OWR.Ymx-OWR.Ymn)));
                end else begin
                 if (FigureWinRefl.idTObj = idTCoVisualization)
                  then begin
                   if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,idHINTVisualization, Xhint,Yhint,((OWR.Xmx-OWR.Xmn)*(OWR.Ymx-OWR.Ymn)));
                   end;
                 //. draw inplace hint 
                 if (Reflector.DynamicHints.flEnabled) then Obj_ComponentContext_DrawHint(Reflector.Space,FigureWinRefl,AdditiveFigureWinRefl,BMP.Canvas);
                 end;
              end
             else begin
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then Reflector.DynamicHints.RemoveItem(ptrObject) else
              if ((FigureWinRefl.idTObj = idTCoVisualization) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization))
               then Reflector.DynamicHints.RemoveItem(ptrObject);
              end;
            end;
          finally
          //. restore clipping
          SelectClipRgn(BMP.Canvas.Handle, 0);
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          //.
          Inc(ObjCount);
          end;
        end;
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  //.
  MReflect:
  //. reform dynamic hints
  Reflector.DynamicHints.FormItems(BMP,nil);
  //.
  if (ReflectTimeInterval <> -1)
   then ReflectBestBeforeTime:=Now+(33{milliseconds for reflect}*(1.0/(24*3600*1000)))
   else ReflectBestBeforeTime:=MaxDouble;
  BMP_Reflect(BMP,true,nil,ReflectBestBeforeTime);
  finally
  BMP.Canvas.UnLock;
  end;
  finally
  Lock.Leave;
  end;
  end;

begin
flBriefReflecting:=true;
try
Revising.Cancel();
//.
Inc(ReflectionFrameID);
ReflectAs2D;
finally
flBriefReflecting:=false;
end;
end;

procedure TReflecting.ReflectPartiallyWithLastReflectedWindow(const MaxReflectingLay: integer);

  procedure ReflectAs2D;
  label
    MReflect;

    function Obj_Filled(const Obj: TSpaceObj): boolean;
    begin
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    Result:=ContainerFilled;
    finally
    Release;
    end;
    end;

    procedure PreprocessReflectingBMP();
    var
      ptrPixel: pointer;
      XSize,YSize,YStep: integer;
      Factor: ShortInt;
    begin
    ptrPixel:=BMP_PixData;
    XSize:=BMP.Width;
    YSize:=BMP.Height;
    YStep:=XSize*3{24 bits bitmap};
    if ((YStep MOD 4) > 0) then YStep:=YStep-(YStep MOD 4)+4;
    Factor:=1;
    asm
          PUSH EAX
          PUSH ECX
          PUSH EDX
          PUSH ESI
          PUSH EDI
          MOV ESI,ptrPixel
          MOV EDI,ESI
          MOV ECX,YSize
          MOV DL,Factor
          CLD
      @M0:  PUSH ECX
            PUSH ESI
            MOV ECX,XSize
        @M1:  XCHG CL,DL
              LODSB //. get "B"
              SHR AL,CL
              STOSB
              LODSB //. get "G"
              SHR AL,CL
              STOSB
              LODSB //. get "R"
              SHR AL,CL
              STOSB
              XCHG CL,DL
              LOOP @M1
            POP ESI
            POP ECX
            ADD ESI,YStep
            MOV EDI,ESI
            LOOP @M0
          POP EDI
          POP ESI
          POP EDX
          POP ECX
          POP EAX
    end;
    end;

  var
    ActualityInterval: TComponentActualityInterval;
    ptrReflLay: pointer;
    ptrItem: pointer;
    OWR: TObjWinRefl;
    BestBeforeTime,ObjBestBeforeTime,ReflectBestBeforeTime: TDateTime;
    ObjCount: integer;
    LevelNumber: integer;
    LayNumber: integer;
    FirstVisibleLevel: integer;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    flClipping: boolean;
    flClipVisible: boolean;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
    _Now: TDateTime;
  begin
  ActualityInterval:=Reflector.ReflectionWindow.GetActualityInterval();
  //.
  BestBeforeTime:=MaxDouble;
  //.
  ObjCount:=0;
  Lock.Enter;
  try
  //. lays validation for object that filled all window
  FirstVisibleLevel:=0;
  {///- not needed speed penalty on huge amount of objects
  LevelNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Reflector.Space.Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval) AND (ptrObject <> ExceptObjPtr))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          flWindowFilled:=false;
          //. process clipping
          flClipping:=false;
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
                if (flWindowFilled)then Break; //. >
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            end;
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))) AND flWindowFilled AND Obj_Filled(Obj))
           then begin
            FirstVisibleLevel:=LevelNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
    //.
    Inc(LevelNumber);
    ptrReflLay:=ptrNext;
    end;}
  //. reflecting
  BMP.Canvas.Lock;
  try
  //. set user dynamic hints as invisible
  Reflector.DynamicHints.UserDynamicHints.ClearItemsVisibleState();
  //.
  BMP_Init(BMP);
  LevelNumber:=0;
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    if (flLay)
     then begin
      Inc(LayNumber);
      if (LayNumber > MaxReflectingLay) then Break; //. >
      end;
    //.
    if (LevelNumber >= FirstVisibleLevel)
     then begin
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        with TItemLayReflect(ptrItem^) do begin
        Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if (Reflector.Space.Obj_IsCached(Obj) AND Reflector.Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
         then begin
          flClipping:=false;
          flClipVisible:=false;
          try
          //. clipping if necessary
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                //.
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
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
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin
              SelectClipRgn(BMP.Canvas.Handle, ClippingRegion);
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            //.
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
              ObjBestBeforeTime:=MaxDouble;
              Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, BMP.Canvas,false, OWR, @ObjUpdating, nil, ObjBestBeforeTime);
              (*///? if (FigureWinRefl.idTObj = idTHINTVisualization)
               then begin
                if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,FigureWinRefl.idObj, Xhint,Yhint,((OWR.Xmx-OWR.Xmn)*(OWR.Ymx-OWR.Ymn)));
                end else
              if (FigureWinRefl.idTObj = idTCoVisualization)
               then begin
                if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,idHINTVisualization, Xhint,Yhint,((OWR.Xmx-OWR.Xmn)*(OWR.Ymx-OWR.Ymn)));
                end;*)
              end
             (*///? else begin
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then Reflector.DynamicHints.RemoveItem(ptrObject) else 
              if ((FigureWinRefl.idTObj = idTCoVisualization) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization))
               then Reflector.DynamicHints.RemoveItem(ptrObject);
              end;*)
            end;
          finally
          //. restore clipping
          SelectClipRgn(BMP.Canvas.Handle, 0);
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          //.
          Inc(ObjCount);
          end;
        end;
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LevelNumber);
    //.
    ptrReflLay:=ptrNext;
    end;
  //.
  MReflect:
  //. copy bitmap to the "last reflected bitmap"
  if (LastReflectedBitmap.BMP_IsSet())
   then begin
    PreprocessReflectingBMP();
    LastReflectedBitmap.BMP_ReflectWithTransformation(BMP.Canvas);
    end;
  //. reform dynamic hints
  ///? Reflector.DynamicHints.FormItems(nil);
  //.
  ReflectBestBeforeTime:=MaxDouble;
  BMP_Reflect(BMP,true,nil,ReflectBestBeforeTime);
  finally
  BMP.Canvas.UnLock;
  end;
  finally
  Lock.Leave;
  end;
  end;

begin
flBriefReflecting:=true;
try
Revising.Cancel();
//.
Inc(ReflectionFrameID);
ReflectAs2D;
finally
flBriefReflecting:=false;
end;
end;

procedure TReflecting.BMP_Reflect(BMP: TBitmap; const flShowDynamicHints: boolean; const ptrCancelFlag: pointer; const BestBeforeTime: TDateTime);
var
  flUseDynamicHints: boolean;
begin
//. obtain a use dynamic hints flag
flUseDynamicHints:=(flShowDynamicHints AND (Reflector.DynamicHints.flEnabled AND (NOT Reflector.DynamicHints.IsEmpty OR Reflector.DynamicHints.UserDynamicHints.flVisible)));
//.
//. drawing additional elements on BMP
//.
BMP.Canvas.Lock;
try
if (GetCurrentThreadID <> MainThreadID)
 then begin
  //. show coordinate mesh
  if (Reflector.CoordinateMesh.flEnabled) then Reflector.CoordinateMesh.ReflectInBMP(BMP);
  end;
//.
if (ptrCancelFlag <> nil)
 then begin
  Sleep(0); //. exit from the current thread to alow the cancel flag to be set
  if (Boolean(ptrCancelFlag^)) then Raise EUnnecessaryExecuting.Create(''); //. =>
  end;
//.
//. drawing on reflector temporary bitmap ...
//.
Reflector.BMPBuffer.Canvas.Lock;
try
BitBlt(Reflector.BMPBuffer.Canvas.Handle, 0, 0, BMP.Width,BMP.Height,  BMP.Canvas.Handle, 0, 0, SRCCOPY);
//.
Reflector.ShowXYToGeoCrdConverterElements(Reflector.BMPBuffer.Canvas,ptrCancelFlag,BestBeforeTime);
Reflector.ShowObjectTrack(Reflector.BMPBuffer.Canvas);
Reflector.ShowMarkCenter(Reflector.BMPBuffer.Canvas);
finally
Reflector.BMPBuffer.Canvas.UnLock;
end;
finally
BMP.Canvas.UnLock;
end;
//. use dynamic hints
if (flUseDynamicHints)
 then begin
  if (GetCurrentThreadID <> MainThreadID)
   then Reflector.DynamicHints.ShowItems(Reflector.BMPBuffer, ptrCancelFlag,BestBeforeTime)
   else
    if ((Configuration.BriefReflectingType = brtPartialWithLastReflection) AND (LastReflectedBitmap.Transformatrix_Scaling >= 0.5))
     then Reflector.DynamicHints.ShowItems(Reflector.BMPBuffer, ptrCancelFlag,BestBeforeTime);
  end;
//.
//. drawing on reflector screen ...
//.
Reflector.BMPBuffer.Canvas.Lock;
try
Reflector.Canvas.Lock;
try
BitBlt(Reflector.Canvas.Handle, 0, 0, Reflector.BMPBuffer.Width,Reflector.BMPBuffer.Height,  Reflector.BMPBuffer.Canvas.Handle, 0, 0, SRCCOPY);
finally
Reflector.Canvas.UnLock;
end;
finally
Reflector.BMPBuffer.Canvas.UnLock;
end;
//. process control elements of reflector
//. paint selected track node marker
if (Reflector.XYToGeoCrdConverter <> nil) then TfmXYToGeoCrdConvertor(Reflector.XYToGeoCrdConverter).GeoObjectTracks.ShowSelectedTrackNode(Reflector.Canvas);
//. post message to show ObjectEditor
if (Reflector.ObjectEditor <> nil) then Reflector.ObjectEditor.Reflect();
//. paint selected region on reflector
if (Reflector.SelectedRegion <> nil) then Reflector.SelectedRegion.Paint();
//. post message to draw EditingOrCreatingObject
if (Reflector.EditingOrCreatingObject <> nil) then Reflector.EditingOrCreatingObject.Reflect(Reflector.BMPBuffer);
end;

procedure TReflecting.Obj_FigureReflect(const pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; pAttractionWindow: TWindow; pCanvas: TCanvas; const flPolylineDashing: boolean; var Obj_Window: TObjWinRefl; const ptrObjUpdating: pointer; const ptrCancelFlag: pointer; const ValidityTime: TDateTime);
var
  I: word;
  BS: TBrushStyle;

  procedure Obj_Show;
  begin
  with pCanvas.Pen do begin
  Color:=pFigureWinRefl.Color;
  Style:=psSolid;
  Width:=1;
  end;
  if (pFigureWinRefl.CountScreenNodes > 0)
   then with pFigureWinRefl do begin
    if (flagLoop)
     then begin
      if (flagFill)
       then begin
        if (NOT Reflector.PrimMap_Exist)
         then begin
          if (ColorFill <> clNone)
           then begin
            pCanvas.Brush.Color:=ColorFill;
            pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
            end;
          end
         else begin
          with pCanvas do begin
          if (Pen.Color = clWhite) OR (Pen.Color = clYellow) OR (Pen.Color = clAqua)
           then Pen.Color:=clRed;
          Pen.Width:=1;
          PolyLine(Slice(ScreenNodes, CountScreenNodes));
          end;
          end;
        end
       else begin
        pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
        end;
      end
     else begin
      if (pAdditiveFigureWinRefl.CountScreenNodes = 0)
       then with pCanvas do begin
        Pen.Width:=1;
        PolyLine(Slice(ScreenNodes, CountScreenNodes));
        end;
      end;
    end;
  //.
  if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
   then with pAdditiveFigureWinRefl do begin
    pCanvas.Pen.Width:=1;
    if (NOT Reflector.PrimMap_Exist)
     then begin
      if (ColorFill <> clNone)
       then begin
        pCanvas.Brush.Color:=ColorFill;
        pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
        end;
      end
     else with pCanvas do begin
      if ((Pen.Color = clWhite) OR (Pen.Color = clYellow) OR (Pen.Color = clAqua))
       then Pen.Color:=clRed;
      Pen.Width:=1;
      PolyLine(Slice(ScreenNodes, CountScreenNodes));
      end;
    end;
  end;

var
  SavePenStyle: TPenStyle;
  SaveBrushStyle: TBrushStyle;
  ReflectResult: boolean;
begin
with Obj_Window do
if (((Xmn = 0) AND (Xmx = Xmn)) AND ((Ymn = 0) AND (Ymx = Ymn)))
 then begin //. calculating Min-Max
  if pFigureWinRefl.CountScreenNodes > 0
   then with pFigureWinRefl do begin
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
    if pAdditiveFigureWinRefl.CountScreenNodes > 0
     then with pAdditiveFigureWinRefl do begin
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
    if pAdditiveFigureWinRefl.CountScreenNodes > 0
     then with pAdditiveFigureWinRefl do begin
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
      end
     else begin
      Xmn:=-1; Ymn:=-1;
      Xmx:=Xmn; Ymx:=Ymn;
      end;
  end;
//. do reflect
pCanvas.Lock();
try
with Self.Reflector do begin
try
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(pFigureWinRefl.idTObj,pFigureWinRefl.idObj)) do
try
FReflector:=Self.Reflector;
//.
BestBeforeTime:=ValidityTime; //. time restriction
ReflectResult:=Reflect(pFigureWinRefl,pAdditiveFigureWinRefl,ReflectionWindow,WindowRefl,pCanvas,ptrCancelFlag);
//.
if (ReflectResult AND flDynamic AND (ptrObjUpdating <> nil) AND (Pointer(ptrObjUpdating^) = nil) AND (GetCurrentThreadID <> MainThreadID))
 then Pointer(ptrObjUpdating^):=TVisualizationUpdating_Create(Self);
finally
Release();
end;
except
  On EUnnecessaryExecuting do Raise; //. =>
  On E: ETypeNotFound do ReflectResult:=false;
  On E: ETypeDisabled do ReflectResult:=false;
  On E: Exception do begin
    ReflectResult:=false;
    EventLog.WriteMinorEvent('ReflectingVisualization','Error during reflecting visualization (TypeID: '+IntToStr(pFigureWinRefl.idTObj)+',ID: '+IntToStr(pFigureWinRefl.idObj)+')',E.Message);
    end;
  end;
//.
if (NOT ReflectResult) then Obj_Show();
//. отображаем как выделенную фигуру, если она выделена и режим рефлектора - редактирование
if ((Mode = rmEditing) AND pFigureWinRefl.flSelected)
 then begin
  if (pFigureWinRefl.CountScreenNodes > 0)
   then with pFigureWinRefl do begin
    with pCanvas do begin
    Pen.Color:=clSelectedObj;
    Pen.Width:=1;
    PolyLine(Slice(ScreenNodes, CountScreenNodes));
    end;
    {//. ? if flagLoop AND flagFill
     then with pCanvas do begin
      Brush.Color:=clSelectedObj;
      SaveBrushStyle:=Brush.Style;
      Brush.Style:=bsCross;
      Polygon(Slice(ScreenNodes, CountScreenNodes));
      Brush.Style:=SaveBrushStyle;
      end;}
    for I:=0 to CountScreenNodes-1 do
      if (SelectedPoint_Index >= 0)
       then
        if ((Round(Nodes[SelectedPoint_Index].X) = ScreenNodes[I].X) AND (Round(Nodes[SelectedPoint_Index].Y) = ScreenNodes[I].Y))
         then
           PutHandle(pCanvas,ScreenNodes[I].X,ScreenNodes[I].Y,true)
         else
           PutHandle(pCanvas,ScreenNodes[I].X,ScreenNodes[I].Y,false)
       else
        PutHandle(pCanvas,ScreenNodes[I].X,ScreenNodes[I].Y,false);
    end;
  if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
   then with pAdditiveFigureWinRefl do begin
    with pCanvas do begin
    Pen.Color:=clSelectedObj;
    Pen.Width:=1;
    PolyLine(Slice(ScreenNodes, CountScreenNodes));
    end;
    {with pCanvas do begin
    Brush.Color:=clSelectedObj;
    SaveBrushStyle:=Brush.Style;
    Brush.Style:=bsCross;
    Polygon(Slice(ScreenNodes, CountScreenNodes));
    Brush.Style:=SaveBrushStyle;
    end;}
    end;
  end;
if (flPolylineDashing)
 then begin //. опунктирование каймы объекта
  SavePenStyle:=pCanvas.Pen.Style;
  pCanvas.Pen.Color:=clWhite;
  pCanvas.Pen.Style:=psDash;
  if (pFigureWinRefl.CountScreenNodes > 0)
   then with pFigureWinRefl do pCanvas.Polyline(Slice(ScreenNodes, CountScreenNodes));
  if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
   then with pAdditiveFigureWinRefl do pCanvas.Polyline(Slice(ScreenNodes, CountScreenNodes));
  pCanvas.Pen.Style:=SavePenStyle;
  end;
end;
finally
pCanvas.UnLock();
end;
end;

procedure TReflecting.CancelRRR;
begin
ResetEvent(evtQueryReflect);
ResetEvent(ReFormingLays.evtQueryReForm);
ResetEvent(Revising.evtQueryRevision);
//. cancel current background reflecting
flReflectingCancel:=true;
//. cancel current reforming
ReformingLays.flReformingCancel:=true;
//. cancel current revising
Revising.Disable();
//. exit from the current thread to alow flags to be set
Sleep(0);
end;

procedure TReflecting.Reflect;
begin
BMP.Canvas.Lock;
try
BMP_Reflect(BMP,true,nil,MaxDouble);
finally
BMP.Canvas.Unlock;
end;
//. cancel current reflecting
flReflectingCancel:=true;
//.
SetEvent(evtQueryReflect);
end;

procedure TReflecting.ResetReflect();
begin
Reflector.DynamicHints.Clear();
//. cancel current reflecting
flReflectingCancel:=true;
//.
SetEvent(evtQueryReflect);
end;

procedure TReflecting.ForceReflect;
begin
with Reflector.Reflecting do ReflectLimitedByTime(-1);
end;

procedure TReflecting.ReFresh;
begin
Reflect;
end;

procedure TReflecting.RecalcReflect;
begin
ResetEvent(evtQueryReflect);
ResetEvent(ReFormingLays.evtQueryReForm);
ResetEvent(Revising.evtQueryRevision);
//. cancel current background reflecting
flReflectingCancel:=true;
//. cancel current reforming
ReformingLays.flReformingCancel:=true;
//. cancel current revising
Revising.Disable();
//. exit from the current thread to alow flags to be set
Sleep(0);
//. display objects in window partially
try
case Configuration.BriefReflectingType of
brtTimeLimited: ReflectLimitedByTime(Configuration.BriefReflectingType__TimeLimited_MaxReflectingTime);
brtPartialWithLastReflection: ReflectPartiallyWithLastReflectedWindow(Configuration.BriefReflectingType__PartialWithLastReflection_MaxReflectingLay+1{correction});
else
  ReflectPartiallyWithLastReflectedWindow(Configuration.BriefReflectingType__PartialWithLastReflection_MaxReflectingLay+1{correction});
end;
except
  On E: Exception do if (Reflector.State <> rsDestroying) then EventLog.WriteMajorEvent('LaysReflecting.RecalcReflect','Error during partial reflecting.',E.Message);
  end;
//. request reforming+reflecting
SetEvent(ReFormingLays.evtQueryReForm);
//.
with Reflector.lbReflectionStatus do begin
Color:=clRed;
Show;
end;
end;

procedure TReflecting.RevisionReflect(ptrObj: TPtr; const Act: TRevisionAct);

  procedure UpdateReflectorForRemoveDetails(const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    W: TObjWinRefl;
  begin
  Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
    //.
    Reflector.DynamicHints.UserDynamicHints.RemoveItemByObjPtr(ptrOwnerObj);
    if (Reflector.PtrSelectedObj = ptrOwnerObj) then if (GetCurrentThreadID = MainThreadID) then Reflector.PtrSelectedObj:=nilPtr else PostMessage(Reflector.Handle, WM_DELETESELECTION,0,0);
    if ((Reflector.EditingOrCreatingObject <> nil) AND (Reflector.EditingOrCreatingObject.PrototypePtr = ptrOwnerObj)) then if (GetCurrentThreadID = MainThreadID) then FreeAndNil(Reflector.EditingOrCreatingObject) else PostMessage(Reflector.Handle, WM_DELETESPUTNIK,0,0);
    if ((Reflector.ObjectEditor <> nil) AND (Reflector.ObjectEditor.ptrObject = ptrOwnerObj)) then if (GetCurrentThreadID = MainThreadID) then FreeAndNil(Reflector.ObjectEditor) else PostMessage(Reflector.Handle, WM_DELETEOBJECTEDITOR,0,0);
    //.
    UpdateReflectorForRemoveDetails(ptrOwnerObj);
    //.
    Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;



begin
if (ptrObj = nilPtr) then Exit; //. ->
//.
with TObjectReflectingCfg(ObjectConfiguration),Reflector.Space do begin
case Act of
actInsert,actInsertRecursively: if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then Revising.AddObject(ptrObj, Act);
actRemove,actRemoveRecursively: begin
  //. update reflector
  Reflector.DynamicHints.UserDynamicHints.RemoveItemByObjPtr(ptrObj);
  if (Reflector.PtrSelectedObj = ptrObj) then if (GetCurrentThreadID = MainThreadID) then Reflector.PtrSelectedObj:=nilPtr else PostMessage(Reflector.Handle, WM_DELETESELECTION,0,0);
  if ((Reflector.EditingOrCreatingObject <> nil) AND (Reflector.EditingOrCreatingObject.PrototypePtr = ptrObj)) then if (GetCurrentThreadID = MainThreadID) then FreeAndNil(Reflector.EditingOrCreatingObject) else PostMessage(Reflector.Handle, WM_DELETESPUTNIK,0,0);
  if ((Reflector.ObjectEditor <> nil) AND (Reflector.ObjectEditor.ptrObject = ptrObj)) then if (GetCurrentThreadID = MainThreadID) then FreeAndNil(Reflector.ObjectEditor) else PostMessage(Reflector.Handle, WM_DELETEOBJECTEDITOR,0,0);
  if (Reflector.ReflectionWindow_ActualityIntervalPanel <> nil) then TfmReflectionWindowActualityIntervalPanel(Reflector.ReflectionWindow_ActualityIntervalPanel).PostUpdatePanel(); 
  //.
  if (Act = actRemoveRecursively) then UpdateReflectorForRemoveDetails(ptrObj);
  //.
  Revising.AddObject(ptrObj, Act);
  end;
actChange,actChangeRecursively: begin {//. for avoid speed penalty if NOT HidedLays.IsLayFound(Obj_idLay(ptrObj)) then begin}
  //. process for user-defined dymanic hints tracks
  Reflector.DynamicHints.UserDynamicHints.AddItemTrackItem(ptrObj);
  //.
  Revising.AddObject(ptrObj, Act);
  end;
actRefresh,actRefreshRecursively,actContentChange,actContentChangeRecursively: begin
  if (Reflector.ReflectionWindow_ActualityIntervalPanel <> nil) then TfmReflectionWindowActualityIntervalPanel(Reflector.ReflectionWindow_ActualityIntervalPanel).PostUpdatePanel();
  //.
  Revising.AddObject(ptrObj, Act);
  end;
actValidateVisible: Revising.AddObject(ptrObj, Act);
end;
end;
end;

procedure TReflecting.BMP_Init;
begin
BMP.Canvas.Lock;
try
with Reflector do begin
BMP.Canvas.Brush.Color:=clEmptySpace;
BMP.Canvas.Rectangle(-1,-1,BMP.Width,BMP.Height);
if (PrimMap_Exist)
 then begin
  PrimMap_Image.Canvas.Lock;
  try
  BMP.Canvas.CopyRect(
    Rect(0,0,BMP.Width-1,BMP.Height-1),
    PrimMap_Image.Canvas,
    Rect(PrimMap_PosX,PrimMap_PosY,PrimMap_PosX+BMP.Width-1,PrimMap_PosY+BMP.Height-1)
    );
  finally
  PrimMap_Image.Canvas.UnLock;
  end;
  end;
end;
finally
BMP.Canvas.UnLock;
end;
end;

function TReflecting.GetObjByPoint(const Point: TPoint; const ExceptObjPtr: TPtr; out ptrObj: TPtr): boolean;
var
  ptrReflLay: pointer;
  ptrItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrReflLay:=Lays;
while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
  ptrItem:=Objects;
  while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
    if ((ptrObject <> ExceptObjPtr) AND Reflector.Space.Obj_IsCached(ptrObject) AND Reflector.Space.Obj_IsPointInside(Point,ptrObject))
     then begin
      ptrObj:=ptrObject;
      Result:=true;
      end;
    ptrItem:=ptrNext;
    end;
  ptrReflLay:=ptrNext;
  end;
finally
Lock.Leave;
end;
end;

{TRevising}
Constructor TRevising.Create(pReflecting: TReflecting);
begin
Reflecting:=pReflecting;
Lock:=TCriticalSection.Create;
flDisabled:=false;
flRevising:=false;
Objects:=nil;
evtQueryRevision:=CreateEvent(nil,false,false,nil);
Inherited Create(true);
Priority:=tpNormal;
Resume;
end;

destructor TRevising.Destroy;
var
  EC: dword;
begin
Disable();
//. terminating
Terminate;
if (false) ///- (Reflector.State <> rsDestroying)
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;
//.
CloseHandle(evtQueryRevision);
//.
Items_Clear;
//.
Lock.Free;
end;

function TRevising.ReflLays_RemoveObj(ptrLay: pointer; const ptrObj: TPtr;  out Obj_Lay,Obj_SubLay: integer; out Obj_Window: TObjWinRefl): boolean;
var
  _Lay,_SubLay: integer;
  ptrptrItem: pointer;
  ptrDelItem: pointer;
begin
Result:=false;
Obj_Lay:=-1;
Obj_SubLay:=-1;
_Lay:=-1;
_SubLay:=0;
with Reflecting do begin
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  //. 
  if (TLayReflect(ptrLay^).flLay)
   then begin
    Inc(_Lay);
    _SubLay:=0;
    end
   else Inc(_SubLay);
  //.
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
      Obj_Lay:=_Lay;
      Obj_SubLay:=_SubLay;
      Result:=true;
      with TItemLayReflect(ptrDelItem^) do if (ObjUpdating <> nil) then ObjUpdating.Terminate();
      FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
      //. process all objects Exit; // ->
      end
     else ptrptrItem:=@TItemLayReflect(Pointer(ptrptrItem^)^).ptrNext;
    end;
  //. next
  ptrLay:=ptrNext;
  end;
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
        Objects:=nil;
        ObjectsCount:=0;
        flLay:=true;
        end;
        Pointer(ptrptrLay^):=ptrNewLay;
        if J = Lay
         then begin
          for K:=1 to SubLay do begin  //. формируем новый подслой
            ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
            GetMem(ptrNewLay,SizeOf(TLayReflect));
            with TLayReflect(ptrNewLay^) do begin
            ptrNext:=nil;
            Objects:=nil;
            ObjectsCount:=0;
            flLay:=false;
            end;
            Pointer(ptrptrLay^):=ptrNewLay;
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
        Objects:=nil;
        ObjectsCount:=0;
        flLay:=false;
        end;
        TLayReflect(ptrNewLay^).ptrNext:=Pointer(ptrptrLay^);
        Pointer(ptrptrLay^):=ptrNewLay;
        if (J = SubLay) then Break; //. >
        ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
        end;
      Break;
      end;
    end;
  Result:=Pointer(ptrptrLay^);
  end;

begin
ptrLay:=Lay_Get(ptrptrLay, Lay,SubLay);
GetMem(ptrNewItem,SizeOf(TItemLayReflect));
with TItemLayReflect(ptrNewItem^) do begin
ptrNext:=nil; ///- TLayReflect(ptrLay^).Objects;
ptrObject:=ptrObj;
Window:=Obj_Window;
Flags_ReflectionWindowIsFilled:=false;
ObjUpdating:=nil;
end;
with TLayReflect(ptrLay^) do begin
ptrptrItem:=@Objects;
while Pointer(ptrptrItem^) <> nil do ptrptrItem:=@TItemLayReflect(Pointer(ptrptrItem^)^).ptrNext;
Pointer(ptrptrItem^):=ptrNewItem;
Inc(ObjectsCount);
end;
end;

function TRevising.ReflLays_GetObjParams(ptrLay: pointer; const ptrObj: TPtr;  out Obj_Lay,Obj_SubLay: integer; out Obj_Window: TObjWinRefl): boolean;
var
  _Lay,_SubLay: integer;
  ptrItem: pointer;
begin
Result:=false;
Obj_Lay:=-1;
Obj_SubLay:=-1;
_Lay:=-1;
_SubLay:=0;
with Reflecting do
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  //.
  if (TLayReflect(ptrLay^).flLay)
   then begin
    Inc(_Lay);
    _SubLay:=0;
    end
   else Inc(_SubLay);
  //.
  ptrItem:=Objects;
  while (ptrItem <> nil) do begin
    if (ptrObj = TItemLayReflect(ptrItem^).ptrObject)
     then begin
      Obj_Window:=TItemLayReflect(ptrItem^).Window;
      Obj_Lay:=_Lay;
      Obj_SubLay:=_SubLay;
      Result:=true;
      //. process all objects Exit; // ->
      end;
    //. next obj
    ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
    end;
  //. next
  ptrLay:=ptrNext;
  end;
end;

function TRevising.ReflLays_SetObjParams(ptrLay: pointer; const ptrObj: TPtr; const Obj_Window: TObjWinRefl;  out Obj_OldWindow: TObjWinRefl): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
with Reflecting do
while ptrLay <> nil do with TLayReflect(ptrLay^) do begin
  ptrItem:=Objects;
  while (ptrItem <> nil) do begin
    if (ptrObj = TItemLayReflect(ptrItem^).ptrObject)
     then begin
      Obj_OldWindow:=TItemLayReflect(ptrItem^).Window;
      TItemLayReflect(ptrItem^).Window:=Obj_Window;
      Result:=true;
      //. process all objects Exit; // ->
      end;
    //. next obj
    ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
    end;
  //. next
  ptrLay:=ptrNext;
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
Lock.Enter;
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
Lock.Leave;
end;
SetEvent(evtQueryRevision);
end;

procedure TRevising.Items_Clear;
var
  ptrDelItem,ptrNextItem: pointer;
begin
Lock.Enter;
try
ptrDelItem:=Objects;
Objects:=nil;
finally
Lock.Leave;
end;
while ptrDelItem <> nil do begin
  ptrNextItem:=TItemRevising(ptrDelItem^).ptrNext;
  FreeMem(ptrDelItem,SizeOf(TItemRevising));
  ptrDelItem:=ptrNextItem;
  end;
end;

procedure TRevising.Revising;
Type
  TRevisingWindow = record
    ptrNext: pointer;
    Window: TObjWinRefl;
  end;

var
  RevisingWindows: pointer;

  procedure RevisingWindows_Start();
  begin
  RevisingWindows:=nil;
  end;

  function RevisingWindows_AddWindow(const pWindow: TObjWinRefl): boolean;
  var
    ptrItem: pointer;
    flProcessed: boolean;
    ptrNewItem: pointer;
  begin
  Result:=false;
  //. check object visibility
  with pWindow do begin
  Reflecting.Reflector.ReflectionWindow.Lock.Enter;
  try
  if ((Xmn > Reflecting.Reflector.ReflectionWindow.Xmx) OR (Xmx < Reflecting.Reflector.ReflectionWindow.Xmn) OR (Ymn > Reflecting.Reflector.ReflectionWindow.Ymx) OR (Ymx < Reflecting.Reflector.ReflectionWindow.Ymn)) then Exit; //. ->
  finally
  Reflecting.Reflector.ReflectionWindow.Lock.Leave;
  end;
  end;
  //.
  flProcessed:=false;
  ptrItem:=RevisingWindows;
  while (ptrItem <> nil) do with TRevisingWindow(ptrItem^) do begin
    with Window do
    if (NOT ((Xmn > pWindow.Xmx) OR (Xmx < pWindow.Xmn) OR (Ymn > pWindow.Ymx) OR (Ymx < pWindow.Ymn)))
     then begin
      //. expand the window
      if (pWindow.Xmn < Xmn) then Xmn:=pWindow.Xmn;
      if (pWindow.Ymn < Ymn) then Ymn:=pWindow.Ymn;
      if (pWindow.Xmx > Xmx) then Xmx:=pWindow.Xmx;
      if (pWindow.Ymx > Ymx) then Ymx:=pWindow.Ymx;
      //.
      flProcessed:=true;
      Break; //. ->
      end;
    //. next window
    ptrItem:=ptrNext;
    end;
  if (NOT flProcessed)
   then begin //. add new window
    GetMem(ptrNewItem,SizeOf(TRevisingWindow));
    with TRevisingWindow(ptrNewItem^) do begin
    ptrNext:=RevisingWindows;
    Window:=pWindow;
    end;
    RevisingWindows:=ptrNewItem;
    end;
  //.
  Result:=true;
  end;

  procedure RevisingWindows_Clear();
  var
    ptrDestroyItem: pointer;
  begin
  while (RevisingWindows <> nil) do begin
    ptrDestroyItem:=RevisingWindows;
    RevisingWindows:=TRevisingWindow(ptrDestroyItem^).ptrNext;
    FreeMem(ptrDestroyItem,SizeOf(TRevisingWindow));
    end;
  end;

  function RevisingWindows_IsObjectVisible(const pWindow: TObjWinRefl): boolean;
  var
    ptrItem: pointer;
  begin
  Result:=false;
  if (((pWindow.Xmn = 0) AND (pWindow.Xmx = pWindow.Xmn)) AND ((pWindow.Ymn = 0) AND (pWindow.Ymx = pWindow.Ymn)))
   then begin
    Result:=true;
    Exit; //. ->
    end;
  ptrItem:=RevisingWindows;
  while (ptrItem <> nil) do with TRevisingWindow(ptrItem^) do begin
    with Window do 
    if (NOT ((pWindow.Xmn > Xmx) OR (pWindow.Xmx < Xmn) OR (pWindow.Ymn > Ymx) OR (pWindow.Ymx < Ymn)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next window
    ptrItem:=ptrNext;
    end;
  end;

  procedure RevisingWindows_ReflectThrough();

      function Obj_Filled(const Obj: TSpaceObj): boolean;
      begin
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
      try
      Result:=ContainerFilled;
      finally
      Release;
      end;
      end;

  var
    ActualityInterval: TComponentActualityInterval;
    ptrWindow: pointer;
    Rect: TRect;
    WindowsRgn,Rgn: HRGN;
    ptrReflLay,ptrItem: pointer;
    FirstVisibleLay: integer;
    LayNumber: integer;
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    ClippingRegion: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
  begin
  if (RevisingWindows = nil) then Exit; //. ->
  //.
  ActualityInterval:=Reflecting.Reflector.ReflectionWindow.GetActualityInterval();
  //. prepare windows composition
  ptrWindow:=RevisingWindows;
  with TRevisingWindow(ptrWindow^) do begin
  with Rect,Window do begin
  Left:=Xmn-3; Top:=Ymn-3;
  Right:=Xmx+3; Bottom:=Ymx+3;
  end;
  ptrWindow:=ptrNext;
  end;
  WindowsRgn:=CreateRectRgnIndirect(Rect);
  try
  //.
  while (ptrWindow <> nil) do with TRevisingWindow(ptrWindow^) do begin
    with Rect,Window do begin
    Left:=Xmn-3; Top:=Ymn-3;
    Right:=Xmx+3; Bottom:=Ymx+3;
    end;
    Rgn:=CreateRectRgnIndirect(Rect);
    CombineRgn(WindowsRgn, WindowsRgn,Rgn, RGN_OR);
    DeleteObject(Rgn);
    //. next window
    ptrWindow:=ptrNext;
    end;
  //.
  Reflecting.Lock.Enter;
  try
  //. lays validation for object that filled all window
  with Reflecting do begin
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if ((Reflector.Space.Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
            AND
          RevisingWindows_IsObjectVisible(Window))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          //. process clipping
          flClipping:=false;
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                //.
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
                end;
              //.
              Sleep(0); //. exit from the current thread to alow the cancel flag to be set
              if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            end;
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))) AND Flags_ReflectionWindowIsFilled)
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      //.
      Sleep(0); //. exit from the current thread to alow the cancel flag to be set
      if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
      //. go to next item
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
      //.
      Inc(LayNumber);
      ptrReflLay:=ptrNext;
      end;}
  //. reflecting ...
  BMP.Canvas.Lock;
  try
  //. set user dynamic hints as invisible
  Reflector.DynamicHints.UserDynamicHints.ClearItemsVisibleState();
  try
  SelectClipRgn(BMP.Canvas.Handle, WindowsRgn);
  //. clear windows
  BMP_Init(BMP);
  //.
  Sleep(0); //. exit from the current thread to alow the cancel flag to be set
  if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      ptrItem:=Objects;
      while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
        Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if ((Reflector.Space.Obj_IsCached(Obj) AND Reflector.Space.Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
               AND
             RevisingWindows_IsObjectVisible(Window))
         then begin
          //. clipping if necessary
          flClipping:=false;
          flClipVisible:=false;
          try
          if (Obj.Color = clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              Reflector.Space.ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = clNone))
               then begin
                flClipping:=true;
                //.
                Obj_PrepareFigures(ptrOwnerObj, Reflector.ReflectionWindow,WindowRefl, FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
                Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
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
              Sleep(0); //. exit from the current thread to alow the cancel flag to be set
              if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin
              CombineRgn(ClippingRegion, ClippingRegion,WindowsRgn, RGN_AND);
              SelectClipRgn(BMP.Canvas.Handle, ClippingRegion);
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, Reflector.ReflectionWindow,WindowRefl,  FigureWinRefl,AdditiveFigureWinRefl,@Flags_ReflectionWindowIsFilled);
            Flags_ReflectionWindowIsFilled:=(Flags_ReflectionWindowIsFilled AND Obj_Filled(Obj));
            //.
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
              Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, BMP.Canvas,false, Window, nil, @flCancelRevising, MaxDouble);
              if (FigureWinRefl.idTObj = idTHINTVisualization)
               then begin
                if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,FigureWinRefl.idObj, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                end else begin
                 if (FigureWinRefl.idTObj = idTCoVisualization)
                  then begin
                   if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then Reflector.DynamicHints.EnqueueItemForShow(ptrObject,idHINTVisualization, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                   end;
                 //. draw inplace hint 
                 if (Reflector.DynamicHints.flEnabled) then Obj_ComponentContext_DrawHint(Reflector.Space,FigureWinRefl,AdditiveFigureWinRefl,BMP.Canvas);
                 end;
              //. try to set visible state of user defined hints
              Reflector.DynamicHints.UserDynamicHints.SetItemAsVisible(ptrObject,FigureWinRefl);
              end
            end;
          finally
          //. restore clipping window
          SelectClipRgn(BMP.Canvas.Handle, WindowsRgn);
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          end;
        //.
        Sleep(0); //. exit from the current thread to alow the cancel flag to be set
        if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
        //. go to next item
        ptrItem:=ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  finally
  SelectClipRgn(BMP.Canvas.Handle, 0);
  end;
  //. reform dynamic hints
  Reflector.DynamicHints.FormItems(BMP,@flCancelRevising);
  Reflector.DynamicHints.UserDynamicHints.CheckItemsVisibility(ActualityInterval,@flCancelRevising);
  //. show result bitmap
  LastReflectedBitmap.BMP.Canvas.Lock;
  try
  BMP_Reflect(BMP,true,@flCancelRevising,MaxDouble);
  //.
  LastReflectedBitmap.BMP_SetFrom(BMP);
  finally
  LastReflectedBitmap.BMP.Canvas.Unlock;
  end;
  finally
  BMP.Canvas.UnLock;
  end;
  end;
  finally
  Reflecting.Lock.Leave;
  end;
  finally
  DeleteObject(WindowsRgn);
  end;
  end;

  procedure RevisingWindows_Finish();
  begin
  RevisingWindows_ReflectThrough();
  end;


  function DoInsertRevision(const ptrObj: TPtr; const flRecursive: boolean; const Obj_Lay,Obj_SubLay: integer): boolean;

    function ProcessObj(const ptrObj: TPtr; const Lay,SubLay: integer; const flRecursive: boolean; const ObjWindow: TObjWinRefl): boolean;
    var
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
    begin
    Reflecting.Lock.Enter;
    try
    ReflLays_InsertObj(@Reflecting.Lays,ptrObj, Lay,SubLay, ObjWindow);
    Result:=true;
    finally
    Reflecting.Lock.Leave;
    end;
    //. update object in the space context registry as accessed
    Reflecting.Reflector.Space.ObjectsContextRegistry.ObjAccessed(ptrObj,Lay,SubLay);
    //.
    if (NOT flRecursive) then Exit; //. ->
    //. process own objects
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
      ProcessObj(ptrOwnerObj, Lay,SubLay+1, flRecursive, ObjWindow);
      //.
      Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
      end;
    end;

  var
    Lay,SubLay: integer;
    ObjWindow: TObjWinRefl;
  begin
  Result:=false;
  //.
  Reflecting.Reflector.Space.Obj_CheckCachedState(ptrObj);
  //.
  with ObjWindow do Reflecting.Obj_GetReflWindow(ptrObj, Xmn,Ymn,Xmx,Ymx);
  //.
  if (Obj_Lay <> -1)
   then begin
    Lay:=Obj_Lay;
    SubLay:=Obj_SubLay;
    end
   else Reflecting.Reflector.Space.Obj_GetLayInfo(ptrObj, Lay,SubLay);
  //.
  if (ProcessObj(ptrObj, Lay,SubLay, flRecursive, ObjWindow))
   then begin
    RevisingWindows_AddWindow(ObjWindow);
    Result:=true;
    end;
  end;

  function DoRemoveRevision(const ptrObj: TPtr; const flRecursive: boolean; out Obj_Lay,Obj_SubLay: integer): boolean;

    function DoRemoveAsDynamicHint(const ptrObj: TPtr): boolean;
    var
      Obj: TSpaceObj;
    begin
    Result:=false;
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    if ((Obj.idTObj = idTHINTVisualization) OR (Obj.idTObj = idTCoVisualization) OR (Obj.idTObj = 0{object removed}))
     then begin
      Reflecting.Reflector.DynamicHints.RemoveItem(ptrObj);
      Result:=true;
      end
     else Result:=false;
    end;

    function ProcessObj(const ptrObj: TPtr; const flRecursive: boolean; out Obj_Lay,Obj_SubLay: integer; out Obj_Window: TObjWinRefl): boolean;
    var
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
      L,SL: integer;
      W: TObjWinRefl;
    begin
    Result:=false;
    //.
    Reflecting.Lock.Enter;
    try
    Result:=ReflLays_RemoveObj(Reflecting.Lays,ptrObj, Obj_Lay,Obj_SubLay,Obj_Window);
    finally
    Reflecting.Lock.Leave;
    end;
    DoRemoveAsDynamicHint(ptrObj);
    //.
    if (NOT Result OR NOT flRecursive) then Exit; //. ->
    //. process own objects
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
      ProcessObj(ptrOwnerObj, flRecursive, L,SL, W);
      //.
      if (W.Xmn < Obj_Window.Xmn) then Obj_Window.Xmn:=W.Xmn;
      if (W.Ymn < Obj_Window.Ymn) then Obj_Window.Ymn:=W.Ymn;
      if (W.Xmx > Obj_Window.Xmx) then Obj_Window.Xmx:=W.Xmx;
      if (W.Ymx > Obj_Window.Ymx) then Obj_Window.Ymx:=W.Ymx;
      //.
      Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
      end;
    end;

  var
    Obj_Window: TObjWinRefl;
    R: boolean;
  begin
  Result:=false;
  Obj_Lay:=-1;
  Obj_SubLay:=-1;
  if (ProcessObj(ptrObj, flRecursive, Obj_Lay,Obj_SubLay,Obj_Window))
   then begin
    RevisingWindows_AddWindow(Obj_Window);
    Result:=true;
    end;
  end;

  function DoChangeRevision(const ptrObj: TPtr; const flRecursive: boolean): boolean;

    function DoChangeAsDynamicHint(const ptrObj: TPtr): boolean;
    var
      Obj: TSpaceObj;
      ptrHintItem: pointer;
    begin
    Result:=false;
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    if ((Obj.idTObj = idTHINTVisualization) OR (Obj.idTObj = idTCoVisualization))
     then begin
      Reflecting.Reflector.DynamicHints.RemoveItem(ptrObj);
      {ptrHintItem:=Reflecting.Reflector.DynamicHints.GetItem(ptrObj);
      if (ptrHintItem = nil) then Exit; //. ->
      Reflecting.Reflector.DynamicHints.Item_UpdateInfo(ptrHintItem);}
      Result:=true;
      end;
    end;

    function ProcessObj(const ptrObj: TPtr; const flRecursive: boolean; const ObjNewWindow: TObjWinRefl;  out ObjOldWindow: TObjWinRefl): boolean;
    var
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
      OOW: TObjWinRefl;
    begin
    Reflecting.Lock.Enter;
    try
    Result:=ReflLays_SetObjParams(Reflecting.Lays,ptrObj,ObjNewWindow, ObjOldWindow);
    finally
    Reflecting.Lock.Leave;
    end;
    DoChangeAsDynamicHint(ptrObj);
    //. update object in the space context registry as accessed
    Reflecting.Reflector.Space.ObjectsContextRegistry.ObjAccessed(ptrObj);
    //. update user dymanic hint Change State
    Reflecting.Reflector.DynamicHints.UserDynamicHints.UpdateItemChangeState(ptrObj);
    //.
    if (NOT Result OR NOT flRecursive) then Exit; //. ->
    //. process own objects
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
      ProcessObj(ptrOwnerObj, flRecursive, ObjNewWindow,  OOW);
      //.
      if (OOW.Xmn < ObjOldWindow.Xmn) then ObjOldWindow.Xmn:=OOW.Xmn;
      if (OOW.Ymn < ObjOldWindow.Ymn) then ObjOldWindow.Ymn:=OOW.Ymn;
      if (OOW.Xmx > ObjOldWindow.Xmx) then ObjOldWindow.Xmx:=OOW.Xmx;
      if (OOW.Ymx > ObjOldWindow.Ymx) then ObjOldWindow.Ymx:=OOW.Ymx;
      //.
      Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
      end;
    end;

  var
    ObjOldWindow,ObjNewWindow: TObjWinRefl;
  begin
  Result:=false;
  //.
  with ObjNewWindow do Reflecting.Obj_GetReflWindow(ptrObj, Xmn,Ymn,Xmx,Ymx);
  //.
  if (ProcessObj(ptrObj, flRecursive, ObjNewWindow, ObjOldWindow))
   then begin
    RevisingWindows_AddWindow(ObjOldWindow);
    RevisingWindows_AddWindow(ObjNewWindow);
    //.
    Result:=true;
    end
   else Result:=DoInsertRevision(ptrObj, flRecursive, -1,-1);
  end;

  function DoRefreshRevision(const ptrObj: TPtr; const flRecursive: boolean): boolean;

    function DoRefreshAsDynamicHint(const ptrObj: TPtr): boolean;
    var
      Obj: TSpaceObj;
      ptrHintItem: pointer;
    begin
    Result:=false;
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    if ((Obj.idTObj = idTHINTVisualization) OR (Obj.idTObj = idTCoVisualization))
     then begin
      Reflecting.Reflector.DynamicHints.RemoveItem(ptrObj);
      {ptrHintItem:=Reflecting.Reflector.DynamicHints.GetItem(ptrObj);
      if (ptrHintItem = nil) then Exit; //. ->
      Reflecting.Reflector.DynamicHints.Item_UpdateInfo(ptrHintItem);}
      Result:=true;
      end;
    end;

    function ProcessObj(const ptrObj: TPtr; const flRecursive: boolean; out Obj_Window: TObjWinRefl): boolean;
    var
      Obj_Lay,Obj_SubLay: integer;
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
      W: TObjWinRefl;
    begin
    Reflecting.Lock.Enter;
    try
    Result:=ReflLays_GetObjParams(Reflecting.Lays,ptrObj, Obj_Lay,Obj_SubLay,Obj_Window);
    finally
    Reflecting.Lock.Leave;
    end;
    DoRefreshAsDynamicHint(ptrObj);
    //. update object in the space context registry as accessed
    Reflecting.Reflector.Space.ObjectsContextRegistry.ObjAccessed(ptrObj);
    //.
    if (NOT Result OR NOT flRecursive) then Exit; //. ->
    //. process own objects
    Reflecting.Reflector.Space.ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
      //.
      ProcessObj(ptrOwnerObj, flRecursive, W);
      //.
      if (W.Xmn < Obj_Window.Xmn) then Obj_Window.Xmn:=W.Xmn;
      if (W.Ymn < Obj_Window.Ymn) then Obj_Window.Ymn:=W.Ymn;
      if (W.Xmx > Obj_Window.Xmx) then Obj_Window.Xmx:=W.Xmx;
      if (W.Ymx > Obj_Window.Ymx) then Obj_Window.Ymx:=W.Ymx;
      //.
      Reflecting.Reflector.Space.ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
      end;
    end;

  var
    Obj_Window: TObjWinRefl;
  begin
  Result:=false;
  if (ProcessObj(ptrObj, flRecursive, Obj_Window))
   then begin
    RevisingWindows_AddWindow(Obj_Window);
    Result:=true; 
    end;
  end;

  procedure InsertRevision(const ptrObj: TPtr; const flRecursive: boolean);
  begin
  DoInsertRevision(ptrObj,flRecursive,-1,-1);
  end;

  procedure RemoveRevision(const ptrObj: TPtr; const flRecursive: boolean);
  var
    L,SL: integer;
  begin
  DoRemoveRevision(ptrObj,flRecursive, L,SL);
  end;

  procedure RefreshRevision(const ptrObj: TPtr; const flRecursive: boolean);
  begin
  DoRefreshRevision(ptrObj,flRecursive);
  end;

  procedure ChangeRevision(const ptrObj: TPtr; const flRecursive: boolean);
  {var
    Obj_Lay,Obj_SubLay: integer;}
  begin
  {DoRemoveRevision(ptrObj,flRecursive, Obj_Lay,Obj_SubLay);
  DoInsertRevision(ptrObj,flRecursive,Obj_Lay,Obj_SubLay);}
  DoChangeRevision(ptrObj,flRecursive);
  end;

var
  _Objects: pointer;
  ptrWorkItem: pointer;
  flUpdateNeeded: boolean;
begin 
try
//.
Lock.Enter;
try
_Objects:=Objects;
Objects:=nil;
finally
Lock.Leave;
end;                                                       
if (_Objects = nil) then Exit; //. ->
try
//.
if (flDisabled) then Exit; //. ->
flCancelRevising:=false;
flRevising:=true;
try
//. wait for Reflecting is done
while (Reflecting.flReflecting OR Reflecting.flBriefReflecting) do begin
  Sleep(20);
  if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
  end;
//.
RevisingWindows_Start();
try
flUpdateNeeded:=false;
repeat
  ptrWorkItem:=_Objects;
  _Objects:=TItemRevising(ptrWorkItem^).ptrNext;
  try
  with TItemRevising(ptrWorkItem^) do begin
  if (flValid)
   then begin
    case Act of
    actInsert:                                          InsertRevision(ptrObj,false);
    actInsertRecursively:                               InsertRevision(ptrObj,true);
    actRemove:                                          RemoveRevision(ptrObj,false);
    actRemoveRecursively:                               RemoveRevision(ptrObj,true);
    actChange:                                          ChangeRevision(ptrObj,false);
    actChangeRecursively:                               ChangeRevision(ptrObj,true);
    actRefresh,actContentChange:                        ReFreshRevision(ptrObj,false);
    actRefreshRecursively,actContentChangeRecursively:  ReFreshRevision(ptrObj,true);
    end;
    flUpdateNeeded:=true;
    end;
  end;
  finally
  FreeMem(ptrWorkItem,SizeOf(TItemRevising));
  end;
  //.
  Sleep(0); //. exit from the current thread to alow the cancel flag to be set
  if (flCancelRevising) then Raise EUnnecessaryExecuting.Create(''); //. =>
  //.
until (_Objects = nil);
//. refresh reflector after changes portion
if (flUpdateNeeded) then RevisingWindows_Finish();
finally
RevisingWindows_Clear();
end;
finally
flRevising:=false;
end;
finally
while _Objects <> nil do begin
  ptrWorkItem:=_Objects;
  _Objects:=TItemRevising(ptrWorkItem^).ptrNext;
  FreeMem(ptrWorkItem,SizeOf(TItemRevising));
  end;
end;
except
  on E: EUnnecessaryExecuting do ;
  else ;
  Raise; //. =>
  end;
end;

procedure TRevising.Execute;
const
  IntervalRevising = 100;
var
  R: DWord;
  StartupInput: TGDIPlusStartupInput;
  gdiplusToken: ULONG;
begin
CoInitializeEx(nil, COINIT_MULTITHREADED);
try
//. init GDI+
StartupInput.DebugEventCallback := nil;
StartupInput.SuppressBackgroundThread := False;
StartupInput.SuppressExternalCodecs   := False;
StartupInput.GdiplusVersion := 1;
GdiplusStartup(gdiplusToken, @StartupInput, nil);
try
repeat
  R:=WaitForSingleObject(evtQueryRevision, IntervalRevising);
  if (R = WAIT_OBJECT_0)
   then
    try
    Revising();
    except
      On E: EUnnecessaryExecuting do ;
      On E: Exception do if (Reflecting.Reflector.State <> rsDestroying) then EventLog.WriteMajorEvent('LaysRevising','Error during lays revision.',E.Message);
      end
   else if (R = WAIT_TIMEOUT) then try Revising except end;
until Terminated;
finally
GdiplusShutdown(gdiplusToken);
end;
finally
CoUninitialize;
end;
end;

procedure TRevising.Cancel;
begin
Reset();
if (flRevising) then flCancelRevising:=true;
///??? while (flRevising) do begin flCancelRevising:=true; Sleep(20); end;
end;

procedure TRevising.Reset;
begin
Items_Clear;
end;

procedure TRevising.Disable;
begin
if (flDisabled) then Exit; //. ->
flDisabled:=true;
//.
Cancel();
end;

procedure TRevising.Enable;
begin
flDisabled:=false;
end;



