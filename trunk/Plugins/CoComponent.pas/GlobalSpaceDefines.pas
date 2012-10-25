unit GlobalSpaceDefines;

interface
Uses
  SysUtils,
  Types,
  Classes,
  Math,
  Graphics;

type
  TID = packed record
    idType: word;
    idObj: integer;
  end;
  
  TCID = packed record
    idType: SmallInt;
    id: Int64;
  end;

  TPtr = Integer;
  TCrd = Real48;

  TPtrArray = array of TPtr;
  TIDArray = array of Integer;

Const
  nilPtr = -1; //. пустой указатель
  nilCrd = 0; //. пустая координата

{описание точки}
Type
  TPoint = packed record
    ptrNextObj: TPtr;
    X,Y: TCrd;
    end;

  T3DPoint = packed record
    ptrNextObj: TPtr;
    X,Y,Z: Extended;
    end;

  TPlane = record
    A,B,C,D: Extended;
  end;

{описание фигуры}
Const
  //. persist flags
  sofDetailsNoIndex = 1;
  sofUserSecurity = 2;
  //. temp flags
  sofLocked = 4;
  sofNotIndexed = 8;

Type
  TSpaceObjLineWidth = Real48;
  TSpaceObjFlags = word;

Type
  TSpaceObj = packed record
    ptrNextObj: TPtr; //. не менять положение

    idTObj: integer;
    idObj: integer;

    ptrFirstPoint: TPtr;
    flagLoop: boolean;
    Color: TColor;
    Width: TSpaceObjLineWidth;
    flagFill: boolean;
    ColorFill: TColor;

    ptrListOwnerObj: TPtr;
  end;




Const
  TSpace_MinFreeArea = 100000; //. кб. минимальная свободная зона
  TSpace_IncreaseDelta = 1000000; //. шаг растягивания пространства
  
  TSpaceObj_maxPointsCount = 1000000;
  ofsptrFirstPoint = SizeOf(TPtr)+SizeOf(integer)+SizeOf(integer);
  ofsptrListOwnerObj = SizeOf(TSpaceObj)-SizeOf(TPtr);
  SpaceObjSize = SizeOf(TSpaceObj);
  SpaceObjDetailsMaxCount = 1000;

  cfTransMeter = 10000;

Type
  TExtendedContainerCoord = packed record
    Xmin,Ymin,
    Xmax,Ymax: Extended;
  end;

Const
  nmTHINTVisualization = 'Hint-visualization'; //. !!! не менять (перенесено из TypesDefines)
  idTHINTVisualization = 2067;
  tnTHINTVisualization = 'HINTVisualizations';

  nmTVisualization = 'Visualization'; //. !!! не менять (перенесено из TypesDefines)
  idTVisualization = 2004;
  tnTVisualization = 'Visualizations';

  idTLay2DVisualization = 2011; //. !!! не менять (перенесено из TypesDefines)
  nmTLay2DVisualization = 'Lay 2D-visualization';
  tnTLay2DVisualization = 'T2DVis_Lays';
  TLay2DVisualization_SubLaysMaxCount = 10;


  idTPrivateAreaVisualization = 2042; //.  !!! не менять (перенесено из TypesDefines)
  nmTPrivateAreaVisualization = 'Private Area visualization';
  tnTPrivateAreaVisualization = 'PrivateAreaVisualizations';

  nmTGeodesyPoint = 'Geodesy Point'; //.  !!! не менять (перенесено из TypesDefines)
  idTGeodesyPoint = 2043;
  tnTGeodesyPoint = 'GeodesyPoints';

  nmTCoComponent = 'Component'; //. !!! не менять (перенесено из TypesDefines)
  idTCoComponent = 2015;
  tnTCoComponent = 'CoComponents';

  idTSecurityComponent = 2022; //. !!! не менять (перенесено из TypesDefines)
  nmTSecurityComponent = 'Security Component';
  tnTSecurityComponent = 'SecurityComponents';

  nmTModelUser = 'MODEL User'; //. !!! не менять (перенесено из TypesDefines)
  idTModelUser = 2019;
  tnTModelUser = 'MODELUsers';

  nmTMODELServer = 'MODEL-Server'; //. !!! не менять (перенесено из TypesDefines)
  idTMODELServer = 2052;
  tnTMODELServer = 'MODELServers';

//. действия над объектами
Type                                                                  
  TComponentOperation = (opCreate,opDestroy,opUpdate,opInsert,opRemove);

  TRevisionAct = (actInsert,actRemove,actChange,actRefresh,actValidateVisible,actInsertRecursively,actRemoveRecursively,actChangeRecursively,actRefreshRecursively,actContentChange,actContentChangeRecursively);

  TTransmitDataType = (tdtChatAudioHeader,tdtChatAudioPacket,tdtChatAudioStopPacket);

  function RevisionAct_IsRecursive(const Act: TRevisionAct): boolean;

Const
  //. user component operations (tranferred from SecurityComponentOperations table)
  idCreateOperation = 1;
  idDestroyOperation = 2;
  idReadOperation = 3;
  idWriteOperation = 4;
  idCloneOperation = 5;
  idExecuteOperation = 6;
  idChangeSecurityOperation = 7;
  idOverlayVisualizationOperation = 8;
Const
  //. component output data flags
  COMPONENT_DATA_FLAG_OWNER =                  (1 SHL 0);
  COMPONENT_DATA_FLAG_NAME =                   (1 SHL 1);
  COMPONENT_DATA_FLAG_ACTUALITYINTERVAL =      (1 SHL 2);
Type
  TComponentDataFlags = Word;

Const
  nmTProxyObject = 'Proxy'; //. не менять !!! (есть дубликат в TypesDefines unit)
  idTProxyObject = 2008;
  tnTProxyObject = 'ProxyObjects';

Const
  CoComponentsTypesIDBase = 1000000;

  idTCoComponentTypeMarker = 2017; //. !!! не менять (перенесено из TypesDefines)

Type
  TSQLServerType = (sqlInformix = 1,sqlMySQL = 2,sqlOracle = 3,sqlInterBase = 4);

Type //. SOAP support types
  TByteArray = TByteDynArray;
  procedure ByteArray_PrepareFromStream(var BA: TByteArray; const S: TStream); stdcall;
  procedure ByteArray_PrepareStream(const BA: TByteArray; var S: TStream); stdcall;
  procedure ByteArray_CreateStream(const BA: TByteArray; out S: TMemoryStream); stdcall;
  procedure ByteArray_PrepareFromList(var BA: TByteArray; const L: TList); stdcall;
  procedure ByteArray_PrepareList(const BA: TByteArray; var L: TList); stdcall;
  procedure ByteArray_CreateList(const BA: TByteArray; out L: TList); stdcall;
  procedure ByteArray_PrepareFromStringList(var BA: TByteArray; const L: TStringList); stdcall;
  procedure ByteArray_PrepareStringList(const BA: TByteArray; var L: TStringList); stdcall;
  procedure ByteArray_CreateStringList(const BA: TByteArray; out L: TStringList); stdcall;

//. Виртуальные действия
type
  TSpaceObjClassAction = (caUnknown,caCreate,caFind,caFindByName,caFindByNumber,caFindByAddr,caFindByClient,caFindNote,caInstall,caRemove,caWrite,caWriteEvents);
const
  ClassActionStrings: Array[TSpaceObjClassAction] of String = (
  'Неизвестное','Создать','Искать','Искать по имени','Искать по номеру','Искать по адресу','Искать по клиенту','Искать заявление','Установить','Удалить','Писать','Писать события'
  );


Type
  TComponentActualityInterval = packed record
    BeginTimestamp: double;
    EndTimestamp: double;
  end;

Type
  THistoryComponentRepresentationContext = packed record
    idTComponent: word;
    idComponent: integer;
  end;

  THistoryReflectionContext = packed record
    Xmin: double;
    Ymin: double;
    Xmax: double;
    Ymax: double;
  end;

  THistoryReflectionContextV1 = packed record
    Xmin: double;
    Ymin: double;
    Xmax: double;
    Ymax: double;
    MinVisibleSquare: double;
  end;

  TSpaceHistoryItem = packed record
    TimeStamp: TDateTime;
    Pntr: TPtr;
    Size: integer;
  end;

  TComponentsHistoryItem = packed record
    TimeStamp: TDateTime;
    idTComponent: word;
    idComponent: int64;
    idOperation: word;
  end;

  TComponentsUpdateHistoryItem = packed record
    TimeStamp: TDateTime;
    idTComponent: word;
    idComponent: int64;
    Data: TByteArray;
  end;

  TVisualizationsHistoryItem = packed record
    TimeStamp: TDateTime;
    ptrObj: TPtr;
    idAct: smallint;
  end;

  TVisualizationsHistoryItemContainer = class
  public 
    Xmin: double;
    Ymin: double;
    Xmax: double;
    Ymax: double;
    S: double;
  end;

  TVisualizationsHistoryItemLocal = packed record
    TimeStamp: TDateTime;
    ptrObj: TPtr;
    idAct: smallint;
    Container: TVisualizationsHistoryItemContainer;
  end;

Type
  TAddressMaskArray = class
  private
    flFreeArray: boolean;
  public
    ByteArrayPtr: pointer;
    ByteArraySize: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure FromPointerList(const PA: TPtrArray; const MaskSize: Word); //. load address masks from TPtrArray (TPtrArray is changed after loading)
    procedure FromByteArray(const BAPtr: pointer; const BASize: integer);
    function IsAddressInScope(const Address: TPtr): boolean;
  end;


implementation


function RevisionAct_IsRecursive(const Act: TRevisionAct): boolean;
begin
Result:=(Act in [actInsertRecursively,actRemoveRecursively,actChangeRecursively,actRefreshRecursively]);
end;


{TByteArray}
procedure ByteArray_PrepareFromStream(var BA: TByteArray; const S: TStream); stdcall;
begin
SetLength(BA,S.Size);
S.Position:=0;
if S.Size > 0 then S.Read(BA[0],S.Size);
end;

procedure ByteArray_PrepareStream(const BA: TByteArray; var S: TStream); stdcall;
begin
S.Size:=Length(BA);
S.Position:=0;
if S.Size > 0 then S.Write(BA[0],S.Size);
S.Position:=0;
end;

procedure ByteArray_CreateStream(const BA: TByteArray; out S: TMemoryStream); stdcall;
begin
S:=TMemoryStream.Create;
try
ByteArray_PrepareStream(BA, TStream(S));
except
  S.Destroy;
  S:=nil;
  Raise; //. =>
  end;
end;


procedure ByteArray_PrepareFromList(var BA: TByteArray; const L: TList); stdcall;
var
  I: integer;
begin
SetLength(BA,L.Count*SizeOf(Pointer));
for I:=0 to L.Count-1 do Integer(Pointer(Integer(@BA[0])+I*SizeOf(Pointer))^):=Integer(L[I]);
end;

procedure ByteArray_PrepareList(const BA: TByteArray; var L: TList); stdcall;
var
  I: integer;
begin
L.Count:=Length(BA) DIV SizeOf(Pointer);
for I:=0 to L.Count-1 do L[I]:=Pointer(Pointer(Integer(@BA[0])+I*SizeOf(Pointer))^);
end;

procedure ByteArray_CreateList(const BA: TByteArray; out L: TList); stdcall;
begin
L:=TList.Create;
try
ByteArray_PrepareList(BA, L);
except
  L.Destroy;
  L:=nil;
  Raise; //. =>
end;
end;


procedure ByteArray_PrepareFromStringList(var BA: TByteArray; const L: TStringList); stdcall;
var
  I: integer;
  S: AnsiString;
begin
S:=L.Text;
SetLength(BA,Length(S));
for I:=1 to Length(S) do BA[I-1]:=Byte(S[I]);
end;

procedure ByteArray_PrepareStringList(const BA: TByteArray; var L: TStringList); stdcall;
var
  I: integer;
  S: AnsiString;
begin
SetLength(S,Length(BA));
for I:=0 to Length(BA)-1 do S[I+1]:=Char(BA[I]);
L.Text:=S;
end;

procedure ByteArray_CreateStringList(const BA: TByteArray; out L: TStringList); stdcall;
begin
L:=TStringList.Create;
try
ByteArray_PrepareStringList(BA, L);
except
  L.Destroy;
  L:=nil;
  Raise; //. =>
end;
end;


{TAddressMaskArray}
Constructor TAddressMaskArray.Create;
begin
Inherited Create;
flFreeArray:=false;
end;

Destructor TAddressMaskArray.Destroy;
begin
if (flFreeArray AND (ByteArrayPtr <> nil))
 then begin
  FreeMem(ByteArrayPtr,ByteArraySize);
  ByteArrayPtr:=nil;
  end;
Inherited;
end;

procedure TAddressMaskArray.FromPointerList(const PA: TPtrArray; const MaskSize: Word);
var
  MaskCount,MasksSize: integer;
  SrcPtr,DistPtr: pointer;
  MS: byte;
begin
if (NOT ((0 <= MaskSize) AND (MaskSize <= 32{integer bit's size}))) then Raise Exception.Create('TAddressMaskArray.FromPointerList(): wrong address mask size'); //. =>
//. transforming PA array to contain address masks
MaskCount:=Length(PA);
SrcPtr:=Pointer(@PA[0]);
asm
        PUSH EBX
        PUSH ESI
        PUSH EDI
        XOR EDX,EDX
        XOR ECX,ECX
        MOV CX,MaskSize
        JCXZ @M1

  @M0:    STC
          RCR EDX,1
          LOOP @M0

@M1:    MOV EBX,nilPtr
        MOV ESI,SrcPtr
        MOV EDI,ESI
        MOV ECX,MaskCount
        JCXZ @M4
        CLD

  @M2:    LODSD
          AND EAX,EDX
          CMP EAX,EBX
          JE @M3
            STOSD
            MOV EBX,EAX
  @M3:    LOOP @M2

        SUB EDI,SrcPtr
        SHR EDI,2
        MOV MaskCount,EDI

@M4:    POP EDI
        POP ESI
        POP EBX
end; 
//. prepare address mask
MasksSize:=Math.Ceil((MaskCount*MaskSize)/8.0);
ByteArraySize:=SizeOf(MaskCount)+SizeOf(MaskSize)+MasksSize;
GetMem(ByteArrayPtr,ByteArraySize);
flFreeArray:=true;
//.
MS:=MaskSize;
SrcPtr:=Pointer(@PA[0]);
DistPtr:=ByteArrayPtr;
Integer(DistPtr^):=MaskCount; Inc(LongWord(DistPtr),SizeOf(MaskCount));
Word(DistPtr^):=MaskSize; Inc(LongWord(DistPtr),SizeOf(MaskSize));
asm
        PUSH EBX
        PUSH ESI
        PUSH EDI

        MOV ECX,MaskCount
        JECXZ @M6
        MOV ESI,SrcPtr
        MOV EDI,DistPtr
        MOV AL,8
        MOV AH,MS
        MOV DX,AX

  @M2:    CMP DL,DH
          JA @M4
          OR DL,DL
          JE @M31
          SUB DH,DL
    @M3:    RCL DWORD PTR[ESI],1
            RCL BYTE PTR[EDI],1
            DEC DL
            JNZ @M3
  @M31:   INC EDI
          MOV DL,AL
          JMP @M2
  @M4:    OR DH,DH
          JE @M51
          SUB DL,DH
    @M5:    RCL DWORD PTR[ESI],1
            RCL BYTE PTR[EDI],1
            DEC DH
            JNZ @M5
  @M51:   ADD ESI,4 {SizeOf(Integer)}
          MOV DH,AH
          LOOP @M2

        CMP DL,AL
        JE @M6
        MOV CL,DL
        SHL BYTE PTR[EDI],CL

@M6:    POP EDI
        POP ESI
        POP EBX
end;
end;

procedure TAddressMaskArray.FromByteArray(const BAPtr: pointer; const BASize: integer);
var
  MaskSize: Word;
  MaskCount: integer;
begin
if (BASize < 6) then Raise Exception.Create('TAddressMaskArray.FromByteArray(): byte array is too small'); //. =>
MaskCount:=Integer(BAPtr^);
MaskSize:=Word(Pointer(LongWord(BAPtr)+4)^);
if ((Math.Ceil((MaskCount*MaskSize)/8.0)+2{SizeOf(MaskSize)}+4{SizeOf(MaskCount)}) <> BASize) then Raise Exception.Create('TAddressMaskArray.FromByteArray(): byte array has a wrong size'); //. =>
if (NOT ((0 <= MaskSize) AND (MaskSize <= 32{address bit's size}))) then Raise Exception.Create('TAddressMaskArray.FromByteArray(): wrong address mask size'); //. =>
//.
ByteArrayPtr:=BAPtr;
ByteArraySize:=BASize;
flFreeArray:=false;
end;

function TAddressMaskArray.IsAddressInScope(const Address: TPtr): boolean;
begin
asm
        MOV Result,false
        PUSH EBX
        PUSH ESI
        PUSH EDI

        MOV EAX,Self
        MOV ESI,[EAX].ByteArrayPtr
        CLD
        LODSD
        MOV ECX,EAX
        JECXZ @M7
        LODSW
        MOV CL,32 {SizeOf(Address)}
        SUB CL,AL
        MOV EDI,Address
        SHR EDI,CL
        MOV AH,AL
        XOR EBX,EBX
        MOV DH,AH

  @M1:    LODSB
          MOV DL,8
  @M2:    CMP DL,DH
          JA @M4
          OR DL,DL
          JE @M1
          SUB DH,DL
    @M3:    RCL AL,1
            RCL EBX,1
            DEC DL
            JNZ @M3
          JMP @M1
  @M4:    OR DH,DH
          JE @M6
          SUB DL,DH
    @M5:    RCL AL,1
            RCL EBX,1
            DEC DH
            JNZ @M5
  @M6:   CMP EBX,EDI
          JNE @M7
            MOV Result,true
            JMP @M8
  @M7:    XOR EBX,EBX
          MOV DH,AH
          LOOP @M2

@M8:    POP EDI
        POP ESI
        POP EBX
end;
end;


end.
