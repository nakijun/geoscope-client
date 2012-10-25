unit unitObject3DReflectingCfg;

interface

uses
  SysUtils,
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface, 
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitProxySpace, Functionality, GlobalSpaceDefines,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, unit3DReflector, Windows, ActiveX, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, RXCtrls, RXSplit, ExtCtrls, Menus, StdCtrls;

const
  ObjectReflectingCfgFile = 'Reflecting.cfg';
  HidedLaysCfgFile = 'HidedLays.Reflecting.cfg';
type
  TItemReflectingCfg = packed record
    flValid: boolean;
    idTObj: integer;
    idObj: integer; //. если = 0, то спрятан весь тип
  end;

  TfmObject3DReflectingCfgEditor = class;
  TObjectReflectingCfg = class;

  THidedLays = class(TList)
  private
    Cfg: TObjectReflectingCfg;
  public
    Constructor Create(pCfg: TObjectReflectingCfg);
    Destructor Destroy;
    procedure Load;
    procedure Save;
    function IsLayFound(const idLay: integer): boolean;
    function IsLayFoundByOrder(const orderLay: integer): boolean;
  end;

  TObjectReflectingCfg = class
  private
    Reflecting: TReflecting;
    Editor: TfmObject3DReflectingCfgEditor;

    function TData_Create(const Size: integer): PSafeArray;
    function ItemsCount: integer;
    procedure Load;
    procedure Save;
    function InsertItem(const pidTObj,pidObj: integer): integer;  //. вставляет в конец списка
    function IsItemValid(Index: LongInt): boolean;
    procedure SetValidityItem(Index: LongInt; flValid: boolean);
    procedure RemoveItem(Index: LongInt);
    procedure Validate; //. создает разбиение для спрятанных объектов - PartitionHidedObjects
  public
    Data: PSafeArray;
    DataPtr: pointer;
    DataSize: LongInt;
    ListHidedObjects: pointer; //. поскольку все равно в каком порядке расположены спрятанные объекты
                               //. их список сделан в виде слоя TLayReflect, чтобы эффективно удалять через TDeleting
    {
    Формат Data:
      ItemsCount: LongInt;
      Item[0]: TItemReflectingCfg,Item[1]: TItemReflectingCfg,...Item[ItemsCount-1]: TItemReflectingCfg
    }
    HidedLays: THidedLays;

    Constructor Create(pReflecting: TReflecting);
    Destructor Destroy; override;
    procedure ShowEditor;
    procedure AccessData;
    procedure UnAccessData;
    function IsObjectHide(const pidTObj,pidObj: integer): boolean; overload;
    function Is2dVisualizationHide(const ptrObj: TPtr): boolean;
    procedure PartitionHidedObjects_InsertObj(const ptrObj: TPtr);
    procedure GetItemsList(var List: TList);
    procedure ListHidedObjects_Clear;
    procedure ListHidedObjects_Create;
    procedure ListHidedObjects_InsertObj(const ptrObj: TPtr);
    procedure ListHidedObjects_RemoveObj(const ptrObj: TPtr);
    function ListHidedObjects_IsObjectFound(const ptrObj: TPtr): boolean;
    procedure GetListHidedObjects;
  end;

  TfmObject3DReflectingCfgEditor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxLabel5: TRxLabel;
    RxLabel1: TRxLabel;
    lvTypes: TListView;
    lvObjects: TListView;
    lvTypesPopup: TPopupMenu;
    lvObjectsPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel4: TPanel;
    RxLabel2: TRxLabel;
    lvLays: TListView;
    lvLaysPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel3: TPanel;
    rxsbAccept: TRxSpeedButton;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure rxsbAcceptClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvLaysDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvLaysDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvLaysEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure MenuItem1Click(Sender: TObject);
    procedure lvLaysDblClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
  private
    { Private declarations }
    ReflectingCfg: TObjectReflectingCfg;
    flCfgChanged: boolean;

    procedure lvTypesClear;
    procedure lvTypesUpdate;
    procedure lvTypes_InsertItemFromClipboard;
    procedure lvTypes_RemoveSelectedItem;
    function lvTypes_ValidityChanged: boolean;
    procedure lvLaysClear;
    procedure lvLaysUpdate;
    function lvLays_ValidityChanged: boolean;
    procedure lvLays_ValidateCfg;
    procedure lvLays_ExchangeItems(SrsIndex,DistIndex: integer);
    procedure lvLays_CreateNew;
    procedure lvLays_DestroySelectedLay;
    procedure lvObjectsClear;
    procedure lvObjectsUpdate;
    procedure lvObjects_InsertItemFromClipboard;
    procedure lvObjects_RemoveSelectedItem;
    function lvObjects_ValidityChanged: boolean;
    procedure Removing_ValidateIndexes(const RemoveIndex: integer);
  public
    { Public declarations }
    Constructor Create(pReflectingCfg: TObjectReflectingCfg);
    procedure Update;
  end;

implementation
Uses
  unitLay2DVisualizationObjectsList;

{$R *.DFM}

{THidedLays}
Constructor THidedLays.Create(pCfg: TObjectReflectingCfg);
begin
Inherited Create;
Cfg:=pCfg;
Load;
end;

Destructor THidedLays.Destroy;
begin
Clear;
Inherited;
end;

procedure THidedLays.Load;

  procedure ReadFromStream(Stream: TStream);
  var
    ptrBuff: pointer;
    ptrItem: pointer;
    idLay: integer;
  begin
  with Stream do begin
  GetMem(ptrBuff,Size);
  try
  if Read(ptrBuff^,Size) <> Size then Raise Exception.Create('Can not read HidedLays config');
  ptrItem:=ptrBuff;
  while Integer(ptrItem) < Integer(ptrBuff)+Size do begin
    asm
       PUSH ESI
       PUSH EDI
       CLD
       MOV ESI,ptrItem
       LEA EDI,idLay
       MOVSD
       MOV ptrItem,ESI
       POP EDI
       POP ESI
    end;
    Add(Pointer(idLay));
    end;
  finally
  FreeMem(ptrBuff,Size);
  end;
  end;
  end;

var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
begin
Clear;
//. read user-defined config
{$IFNDEF EmbeddedServer}
if (GetISpaceUserReflector(Cfg.Reflecting.Reflector.Space.SOAPServerURL).Get_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,{out} BA))
{$ELSE}
if (SpaceUserReflector_Get_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,{out} BA))
{$ENDIF}
 then begin
  MemoryStream:=TMemoryStream.Create();
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  ReadFromStream(MemoryStream);
  finally
  MemoryStream.Destroy();
  end;
  end;
end;

procedure THidedLays.Save;

  procedure WriteIntoStream(Stream: TStream);
  var
    I: integer;
    idLay: integer;
  begin
  with Stream do begin
  for I:=0 to Count-1 do begin
    idLay:=Integer(List[I]);
    if Write(idLay,SizeOf(idLay)) <> SizeOf(idLay) then Raise Exception.Create('can not write '+HidedLaysCfgFile);
    end;
  end;
  end;

var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
WriteIntoStream(MemoryStream);
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserReflector(Cfg.Reflecting.Reflector.Space.SOAPServerURL).Set_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,BA);
{$ELSE}
SpaceUserReflector_Set_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,BA);
{$ENDIF}
finally
MemoryStream.Destroy;
end;
end;

function THidedLays.IsLayFound(const idLay: integer): boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to Count-1 do
  if Integer(List[I]) = idLay
   then begin
    Result:=true;
    Exit;
    end;
end;

function THidedLays.IsLayFoundByOrder(const orderLay: integer): boolean;
var
  I: integer;
  ptrLay: TPtr;
  Lay: TSpaceObj;
begin
Result:=false;
ptrLay:=Cfg.Reflecting.Reflector.Space.Lay_Ptr(orderLay);
Cfg.Reflecting.Reflector.Space.ReadObj(Lay,SizeOf(Lay), ptrLay);
for I:=0 to Count-1 do begin
  if Integer(List[I]) = Lay.idObj
   then begin
    Result:=true;
    Exit;
    end;
  end;
end;



{TObjectReflectingCfg}
Constructor TObjectReflectingCfg.Create(pReflecting: TReflecting);
begin
Inherited Create;
Reflecting:=pReflecting;
Data:=nil;
DataPtr:=nil;
HidedLays:=THidedLays.Create(Self);
ListHidedObjects:=TList.Create;
Load;
Validate;
end;

Destructor TObjectReflectingCfg.Destroy;
begin
Editor.Free;
ListHidedObjects_Clear;
HidedLays.Free;
if Data <> nil then SafeArrayDestroy(Data);
Inherited;
end;

function TObjectReflectingCfg.TData_Create(const Size: integer): PSafeArray;
var
  VarBound: TVarArrayBound;
begin
Result:=nil;
FillChar(VarBound, SizeOf(VarBound), 0);
VarBound.ElementCount:=Size;
Result:=SafeArrayCreate(varByte,1,VarBound);
end;

procedure TObjectReflectingCfg.Load;

  procedure ReadFromStream(Stream: TStream);
  begin
  with Stream do begin
  if Data <> nil
   then begin
    SafeArrayDestroy(Data);
    Data:=nil;
    end;
  Data:=TData_Create(Size);
  AccessData;
  try
  if Read(DataPtr^,Size) <> Size then Raise Exception.Create('can not read reflecting config'); //. =>
  DataSize:=Size;
  finally
  UnAccessData;
  end;
  end;
  end;

var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
begin
//. read user-defined config
{$IFNDEF EmbeddedServer}
if (GetISpaceUserReflector(Reflecting.Reflector.Space.SOAPServerURL).Get_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,{out} BA))
{$ELSE}
if (SpaceUserReflector_Get_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,{out} BA))
{$ENDIF}
 then begin
  MemoryStream:=TMemoryStream.Create();
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  ReadFromStream(MemoryStream);
  finally
  MemoryStream.Destroy();
  end;
  end;
end;

procedure TObjectReflectingCfg.Save;

  procedure WriteIntoStream(Stream: TStream);
  begin
  with Stream do begin
  AccessData;
  try
  if Write(DataPtr^,DataSize) <> DataSize then Raise Exception.Create('can not write reflecting config'); //. =>
  finally
  UnAccessData;
  end;
  end;
  end;

var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
WriteIntoStream(MemoryStream);
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserReflector(Reflecting.Reflector.Space.SOAPServerURL).Set_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,BA);
{$ELSE}
SpaceUserReflector_Set_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,BA);
{$ENDIF}
finally
MemoryStream.Destroy;
end;
end;

function TObjectReflectingCfg.InsertItem(const pidTObj,pidObj: integer): integer;
var
  Item: TItemReflectingCfg;
  ItemSize: integer;
  newData: PSafeArray;
  newDataSize: longword;
  newDataPtr: pointer;
  Index: integer;
begin
Result:=-1;
with Item do begin
flValid:=true;
idTObj:=pidTObj;
idObj:=pidObj;
end;
ItemSize:=SizeOf(TItemReflectingCfg);
newDataSize:=SizeOf(LongInt)+(ItemsCount+1)*ItemSize;

newData:=TData_Create(newDataSize);
AccessData;
SafeArrayAccessData(newData, newDataPtr);
try
asm
   PUSH ESI
   PUSH EDI
   MOV EAX,Self

   MOV EDI,newDataPtr
   CLD
   //. Копируем старый состав или создаем счетчик для новых записей
   MOV ESI,[EAX].DataPtr
   CMP ESI,0 //. nil
   JE @M0
   MOV ECX,[EAX].DataSize
   REP MOVSB
   JMP @M1
@M0:
   XOR EAX,EAX
   STOSD
@M1:
   //. добавляем в конец новую запись
   LEA ESI,Item
   MOV ECX,ItemSize
   REP MOVSB
   //. Inc(ItemsCount)
   MOV EDI,newDataPtr
   MOV EAX,[EDI]
   MOV Index,EAX
   INC DWord Ptr [EDI]

   POP EDI
   POP ESI
end;
finally
SafeArrayUnAccessData(newData);
UnAccessData;
end;
SafeArrayDestroy(Data);
Data:=nil;
Data:=newData;
DataSize:=newDataSize;
Save;
Result:=Index;
end;

function TObjectReflectingCfg.ItemsCount: integer;
begin
AccessData;
asm
   PUSH ESI
   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M1
   MOV ESI,EAX
   LODSD //. get ItemsCount
@M1:
   MOV Result,EAX
   POP ESI
end;
UnAccessData;
end;

function TObjectReflectingCfg.IsItemValid(Index: LongInt): boolean;
Label MExit;
var
  ItemSize: integer;
begin
Result:=false;
ItemSize:=SizeOf(TItemReflectingCfg);
AccessData;
asm
   PUSH ESI
   PUSH EBX

   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   CLD
   LODSD //. get ItemsCount
@M0:
   MOV EBX,Index
   SUB EAX,EBX
   JA @M1

     POP EBX
     POP ESI
     JMP MExit


@M1:
   MOV EAX,EBX
   MUL ItemSize
   ADD ESI,EAX
   MOV AL,[ESI].TItemReflectingCfg.flValid
   MOV Result,AL

   POP EBX
   POP ESI
end;
UnAccessData;

MExit: ;
end;

procedure TObjectReflectingCfg.SetValidityItem(Index: LongInt; flValid: boolean);
Label MExit;
var
  ItemSize: integer;
begin
ItemSize:=SizeOf(TItemReflectingCfg);
AccessData;
asm
   PUSH ESI
   PUSH EBX

   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   CLD
   LODSD //. get ItemsCount
@M0:
   MOV EBX,Index
   SUB EAX,EBX
   JA @M1

     POP EBX
     POP ESI
     JMP MExit

@M1:
   MOV EAX,EBX
   MUL ItemSize
   ADD ESI,EAX
   MOV AL,flValid
   MOV [ESI].TItemReflectingCfg.flValid,AL

   POP EBX
   POP ESI
end;
UnAccessData;
Save;

MExit: ;
end;

procedure TObjectReflectingCfg.RemoveItem(Index: LongInt);
Label MExit;
var
  ItemSize: integer;
begin
ItemSize:=SizeOf(TItemReflectingCfg);
AccessData;
asm
   PUSH ESI
   PUSH EDI
   PUSH EBX

   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   CLD
   LODSD //. get ItemsCount
@M0:
   MOV EBX,Index
   SUB EAX,EBX
   JA @M1

     POP EBX
     POP EDI
     POP ESI
     JMP MExit

@M1:
   SUB EAX,1
   JBE @M2

   MUL ItemSize
   MOV ECX,EAX

   //. пропускаем Items до Items[Index] и подтягиваем оставшийся хвост
   MOV EAX,EBX
   MUL ItemSize
   ADD ESI,EAX
   MOV EDI,ESI
   ADD ESI,ItemSize
   REP MOVSB

@M2:
   MOV EAX,Self
   MOV ESI,[EAX].DataPtr
   DEC DWord Ptr [ESI] //. Dec(ItemsCount)

   POP EBX
   POP EDI
   POP ESI
end;
UnAccessData;
Dec(DataSize,ItemSize);
Save;

MExit: ;
end;

procedure TObjectReflectingCfg.AccessData;
begin
SafeArrayAccessData(Data, DataPtr);
end;

procedure TObjectReflectingCfg.UnAccessData;
begin
SafeArrayUnAccessData(Data);
DataPtr:=nil;
end;

function TObjectReflectingCfg.IsObjectHide(const pidTObj,pidObj: integer): boolean;
var
  ItemsCount: LongInt;
  I: integer;
  ptrItem: pointer;
  ItemSize: integer;
begin
Result:=false;
asm
   PUSH ESI
   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   //. Get ItemsCount
   CLD
   LODSD
@M0:
   MOV ItemsCount,EAX
   //. Get ptrItem
   MOV ptrItem,ESI
   POP ESI
end;
ItemSize:=SizeOf(TItemReflectingCfg);
for I:=0 to ItemsCount-1 do with TItemReflectingCfg(ptrItem^) do begin
  if flValid AND (idTObj = pidTObj) AND ((idObj = pidObj) OR (idObj = 0))
   then begin
    Result:=true;
    Exit;
    end
   else begin
    asm //. to next Item
    MOV EAX,ItemSize
    ADD ptrItem,EAX
    end;
    end;
  end;
end;

procedure TObjectReflectingCfg.GetItemsList(var List: TList);
var
  ItemsCount: LongInt;
  I: integer;
  ptrItem: pointer;
  ptrNewItem: pointer;
  ItemSize: integer;
begin
List:=nil;
List:=TList.Create;
AccessData;
try
asm
   PUSH ESI
   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   //. Get ItemsCount
   CLD
   LODSD
@M0:
   MOV ItemsCount,EAX
   //. Get ptrItem
   MOV ptrItem,ESI
   POP ESI
end;
ItemSize:=SizeOf(TItemReflectingCfg);
for I:=0 to ItemsCount-1 do with TItemReflectingCfg(ptrItem^) do begin
  GetMem(ptrNewItem,SizeOf(TItemReflectingCfg));
  TItemReflectingCfg(ptrNewItem^):=TItemReflectingCfg(ptrItem^);
  List.Add(ptrNewItem);
  asm //. to next Item
  MOV EAX,ItemSize
  ADD ptrItem,EAX
  end;
  end;
finally
UnAccessData;
end;
end;

procedure TObjectReflectingCfg.PartitionHidedObjects_InsertObj(const ptrObj: integer);
var
  Obj: TSpaceObj;
  ptrOwnerObj: TPtr;
  ObjLay: integer;
  OwnObj: TSpaceObj;
begin
ObjLay:=0; //. вставляем в нулевой слой, поскольку для скрытых объектов - это все равно
with Reflecting.Reflector.Space do begin
//. вставляем объект в слой контейнера
{/// ? with PartitionHidedObjects do begin
if NOT Grid.InsertObject(ptrObj, ObjLay,0)
 then SeparateContainers_InsertObj(ptrObj, ObjLay,0);
end;}
//. обрабатываем собственные детали
ReadObj(Obj,SizeOf(Obj), ptrObj);
ptrOwnerObj:=Obj.ptrListOwnerObj;
While ptrOwnerObj <> nilPtr do begin
 ReadObj(OwnObj,SizeOf(OwnObj), ptrOwnerObj);
 if OwnObj.idTObj <> 0 //. не объект ?
  then PartitionHidedObjects_InsertObj(ptrOwnerObj);
 ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
 end;
end;
end;


procedure TObjectReflectingCfg.Validate;
var
  ItemsList: TList;
  PtrVisualizationList: TList;
  I,J,K: integer;
  ptrItem: pointer;
  ComponentsList: TComponentsList;
  TypeFunctionality: TTypeFunctionality;
  ObjFunctionality: TComponentFunctionality;
  ComponentFunctionality: TComponentFunctionality;
  ptrObj: TPtr;

var
  idTBase2DVisualization: integer;
  idBase2DVisualization: integer;
  IUnk: IUnknown;
  OwnersData: PSafeArray;
  OwnersDataPtr: pointer;
  OwnersDataEnd: pointer;
  ItemSize: longint;
  DisabledTypesCount: integer;
  idTDisableType: integer;
  PtrsData: PSafeArray;
  PtrsDataPtr: pointer;
  PtrsCount: longint;
  PtrsPtr: longint;
  PercentDone: integer;
begin
(*/// + //. подготовка OwnersData
{получаем число запрещенных типов}
DisabledTypesCount:=0; for I:=0 to TypesSystem.Count-1 do if NOT TTypeSystem(TypesSystem[I]).Enabled then inc(DisabledTypesCount);

OwnersData:=TData_Create(SizeOf(LongInt)+(ItemsCount+DisabledTypesCount)*2*SizeOf(Integer));
AccessData;
SafeArrayAccessData(OwnersData, OwnersDataPtr);
try
ItemSize:=SizeOf(TItemReflectingCfg);
asm
   PUSH ESI
   PUSH EDI
   MOV EAX,Self
   MOV EAX,[EAX].DataPtr
   CMP EAX,0 //. nil
   JE @M0
   MOV ESI,EAX
   CLD
   LODSD //. skip Count: longint
@M0:
   MOV ECX,EAX
   MOV EDI,OwnersDataPtr
   XOR EAX,EAX
   STOSD
   JECXZ @M3

@M1: CMP [ESI].TItemReflectingCfg.flValid,true
     JNE @M2
       MOV EAX,[ESI].TItemReflectingCfg.idTObj
       MOV EDX,[ESI].TItemReflectingCfg.idObj
       STOSD
       MOV EAX,EDX
       STOSD
       MOV EDX,OwnersDataPtr
       INC DWord Ptr [EDX] //. Inc(ItemsCount)
@M2: ADD ESI,ItemSize
     LOOP @M1

@M3:
   MOV OwnersDataEnd,EDI
   POP EDI
   POP ESI
end;
//. добавление в OwnersData информации о типах, которые запрещены для применения в данной ProxySpace
for I:=0 to TypesSystem.Count-1 do
  if NOT TTypeSystem(TypesSystem[I]).Enabled
   then begin
    idTDisableType:=TTypeSystem(TypesSystem[I]).idType;
    asm
       PUSH ESI
       PUSH EDI
       MOV EDI,OwnersDataEnd
       MOV EAX,idTDisableType
       CLD
       STOSD
       XOR EAX,EAX
       STOSD
       MOV EDX,OwnersDataPtr
       INC DWord Ptr [EDX] //. Inc(ItemsCount)
       MOV OwnersDataEnd,EDI
       POP EDI
       POP ESI
    end;
    end;
finally
SafeArrayUnAccessData(OwnersData);
UnAccessData;
end;

Reflecting.Reflector.Space.Log.OperationStarting('getting hided objects ...');
try
Reflecting.Reflector.Space.GlobalSpaceCashDataProvider.GetOwnersVisualizationsPtrs(OwnersData, PtrsData);
finally
Reflecting.Reflector.Space.Log.OperationDone;
SafeArrayDestroy(OwnersData);
end;


PartitionHidedObjects.Empty;
SafeArrayAccessData(PtrsData, PtrsDataPtr);
Reflecting.Reflector.Space.Log.OperationStarting('indexing hided objects ...');
try
asm
   PUSH ESI
   MOV ESI,PtrsDataPtr
   CLD
   LODSD //. get PtrsCount
   MOV PtrsCount,EAX
   MOV PtrsDataPtr,ESI
   POP ESI
end;
for I:=0 to PtrsCount-1 do begin
  asm
     PUSH ESI
     MOV ESI,PtrsDataPtr
     CLD
     LODSD //. get Ptr
     MOV ptrObj,EAX
     MOV PtrsDataPtr,ESI
     POP ESI
  end;
  if ptrObj <> nilPtr then PartitionHidedObjects_InsertObj(ptrObj);
  if (I MOD 100) = 0 then Reflecting.Reflector.Space.Log.OperationProgress(I*100 DIV PtrsCount);
  end;
finally
Reflecting.Reflector.Space.Log.OperationDone;
SafeArrayUnAccessData(PtrsData);
SafeArrayDestroy(PtrsData);
end;

//. Отображаем изменения
Reflecting.RecalcReflect;
             *)
(*
//. получаем список спрятанных объектов
GetItemsList(ItemsList);
PtrVisualizationList:=TList.Create;
try
PartitionHidedObjects.Empty;
for I:=0 to ItemsList.Count-1 do begin
  ptrItem:=ItemsList[I];
  with TItemReflectingCfg(ptrItem^) do begin
  //. получаем список спрятанных объектов
  if idObj = 0
   then begin //. как тип
    TypeFunctionality:=TTypeFunctionality_Create(Reflecting.Reflector.Space, idTObj);
    if TypeFunctionality <> nil
     then with TypeFunctionality do begin
      //. выбираем все 2d визуальные свойства для типа idType
      with Reflecting.Reflector.Space.TObjPropsQuery_Create do begin
      EnterSQL('SELECT TProp,Prop_Key FROM ObjectsProps WHERE TOwner+0 = '+IntToStr(idType)+' AND (TProp = 2006)');
      Open;
      while not EOF do begin
        idTBase2DVisualization:=FieldValues['TProp'];
        idBase2DVisualization:=FieldValues['Prop_Key'];
        PropFunctionality:=SpaceTypes.TComponentFunctionality_Create(Reflecting.Reflector.Space, idTBase2DVisualization,idBase2DVisualization);
        if PropFunctionality <> nil //. PropFunctionality as TBase2DFunctionality
         then with TBase2DVisualizationFunctionality(PropFunctionality) do begin
          ptrObj:=Ptr;
          Release;
          if ptrObj <> nilPtr then InsertObj(ptrObj, -1);
          end;
        Next;
        end;
      Destroy;
      end;
      with Reflecting.Reflector.Space.TObjPropsQuery_Create do begin
      EnterSQL('SELECT TProp,Prop_Key FROM ObjectsProps WHERE TOwner+0 = '+IntToStr(idType)+' AND (TProp = 2004)');
      Open;
      while not EOF do begin
        idTBase2DVisualization:=FieldValues['TProp'];
        idBase2DVisualization:=FieldValues['Prop_Key'];
        PropFunctionality:=SpaceTypes.TComponentFunctionality_Create(Reflecting.Reflector.Space, idTBase2DVisualization,idBase2DVisualization);
        if PropFunctionality <> nil //. PropFunctionality as TBase2DFunctionality
         then with TBase2DVisualizationFunctionality(PropFunctionality) do begin
          ptrObj:=Ptr;
          Release;
          {if ptrObj <> nilPtr then InsertObj(ptrObj, -1);}
          end;
        Next;
        end;
      Destroy;
      end;
      Release;
      end;
    end
   else begin //. как объект
    ObjFunctionality:=TComponentFunctionality_Create(Reflecting.Reflector.Space, idTObj,idObj);
    if ObjFunctionality <> nil
     then with ObjFunctionality do begin
      //. получаем собственные свойства объекта
      GetPropsList(PropsList);
      Release;
      //. обрабытываем список свойств
      with PropsList do begin
      for K:=0 to Count-1 do with TItemPropsList(PropsList[K]^) do begin
        PropFunctionality:=TComponentFunctionality_Create(Reflecting.Reflector.Space, idTProp,idProp);
        if (PropFunctionality <> nil) AND (idTProp = 2004)///(PropFunctionality is TBase2DVisualizationFunctionality)
         then with TBase2DVisualizationFunctionality(PropFunctionality) do begin
          ptrObj:=Ptr;
          Release;
          {if ptrObj <> nilPtr then InsertObj(ptrObj, -1);}
          end;
        end;
      Destroy;
      end;
      end;
    end;
  end;
  FreeMem(ptrItem,SizeOf(TItemReflectingCfg));
  end;
finally
PtrVisualizationList.Destroy;
ItemsList.Destroy;
end;
*)
end;

procedure TObjectReflectingCfg.GetListHidedObjects;
begin
/// ? 
end;

function TObjectReflectingCfg.Is2DVisualizationHide(const ptrObj: TPtr): boolean;
var
  idTOwner,idOwner: integer;
  ptrVisOwner: integer;
begin
Result:=false;
{/// + if Reflecting.Reflector.Space.GlobalSpaceCashDataProvider.T2DVisualizationCash_GetItemByPtrObj(ptrObj, idTOwner,idOwner, ptrVisOwner)
 then begin
  AccessData;
  if IsObjectHide(idTOwner,idOwner)
   then Result:=true;
  UnAccessData;
  end;}
end;

function TObjectReflectingCfg.ListHidedObjects_IsObjectFound(const ptrObj: TPtr): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
ptrItem:=TLayReflect(ListHidedObjects^).Objects;
while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
  if ptrObject = ptrObj
   then begin
    Result:=true;
    Exit;
    end;
  ptrItem:=ptrNext;
  end;
end;

procedure TObjectReflectingCfg.ShowEditor;
begin
if Editor = nil then Editor:=TfmObject3DReflectingCfgEditor.Create(Self);
Editor.Update;
Editor.Show;
end;

procedure TObjectReflectingCfg.ListHidedObjects_Clear;
var
  ptrRemove: pointer;
begin
with Reflecting.DeletingDump do begin
if ListHidedObjects <> nil
 then begin
  ptrRemove:=ListHidedObjects;
  ListHidedObjects:=nil;
  TLayReflect(ptrRemove^).ptrNext:=DumpLays;
  DumpLays:=ptrRemove;
  end;
end;
end;

procedure TObjectReflectingCfg.ListHidedObjects_Create;
var
  ptrList: pointer;
begin
GetMem(ptrList,SizeOf(TLayReflect));
with TLayReflect(ptrList^) do begin
ptrNext:=nil;
Objects:=nil;
ObjectsCount:=0;
flTransfered:=false;
flCompleted:=true;
end;
ListHidedObjects:=ptrList;
end;

procedure TObjectReflectingCfg.ListHidedObjects_InsertObj(const ptrObj: TPtr);
var
  ptrNewItem: pointer;
begin
with TLayReflect(ListHidedObjects^) do begin
GetMem(ptrNewItem,SizeOf(TItemLayReflect));
with TItemLayReflect(ptrNewItem^) do begin
ptrNext:=Objects;
ptrObject:=ptrObj;
end;
Objects:=ptrNewItem;
Inc(ObjectsCount);
end;
end;

procedure TObjectReflectingCfg.ListHidedObjects_RemoveObj(const ptrObj: TPtr);
var
  ptrptrRemoveItem: pointer;
  ptrRemoveItem: pointer;
begin
with TLayReflect(ListHidedObjects^) do begin
ptrptrRemoveItem:=@Objects;
while Pointer(ptrptrRemoveItem^) <> nil do begin
  ptrRemoveItem:=Pointer(ptrptrRemoveItem^);
  if TItemLayReflect(ptrRemoveItem^).ptrObject = ptrObj
   then begin
    Pointer(ptrptrRemoveItem^):=TItemLayReflect(ptrRemoveItem^).ptrNext;
    FreeMem(ptrRemoveItem,SizeOf(TItemLayReflect));
    Dec(ObjectsCount);
    Exit;
    end
   else
    ptrptrRemoveItem:=@TItemLayReflect(ptrRemoveItem^).ptrNext;
  end;
end;
end;


{TfmObjectReflectingCfgEditor}
Constructor TfmObject3DReflectingCfgEditor.Create(pReflectingCfg: TObjectReflectingCfg);
begin
Inherited Create(nil);
ReflectingCfg:=pReflectingCfg;
lvTypes.SmallImages:=TypesImageList;
lvLays.SmallImages:=TypesImageList;
lvObjects.SmallImages:=TypesImageList;
end;

procedure TfmObject3DReflectingCfgEditor.Update;
begin
lvTypesUpdate;
lvLaysUpdate;
lvObjectsUpdate;
flCfgChanged:=false;
end;

procedure TfmObject3DReflectingCfgEditor.lvTypesClear;
begin
with lvTypes.Items do begin
Clear;
end;
end;

procedure TfmObject3DReflectingCfgEditor.lvTypesUpdate;
var
  TypesList: TList;
  I: integer;
  ptrItem: pointer;
  TypeFunctionality: TTypeFunctionality;
begin
lvTypesClear;
ReflectingCfg.GetItemsList(TypesList);
lvTypes.Items.BeginUpdate;
try
for I:=0 to TypesList.Count-1 do begin
  ptrItem:=TypesList[I];
  with TItemReflectingCfg(ptrItem^) do begin
  if idObj = 0
   then begin
    try
    TypeFunctionality:=TTypeFunctionality_Create(idTObj);
    with TypeFunctionality do begin
    with lvTypes.Items.Add do begin
    Data:=Pointer(I);
    Caption:=Name;
    ImageIndex:=TypeFunctionality.ImageList_Index;
    Checked:=flValid;
    end;
    Release;
    end;
    except
      end;
    end;
  end;
  FreeMem(ptrItem,SizeOf(TItemReflectingCfg));
  end;
finally
lvTypes.Items.EndUpdate;
TypesList.Destroy;
end;
end;

procedure TfmObject3DReflectingCfgEditor.lvTypes_InsertItemFromClipboard;
var
  idTObj,idObj: integer;
  Ind: integer;
  TypeFunctionality: TTypeFunctionality;
begin
{$IFDEF ExternalTypes}
if NOT GetClipBoardObject(idTObj,idObj) then Exit;
Ind:=ReflectingCfg.InsertItem(idTObj,0{вставляем как тип});
with lvTypes.Items.Add do begin
Data:=pointer(Ind);
TypeFunctionality:=TTypeFunctionality_Create(idTObj);
if TypeFunctionality <> nil
 then with TypeFunctionality do begin
  Caption:=Name;
  ImageIndex:=ImageList_Index;
  Release;
  end;
Checked:=true;
end;
flCfgChanged:=true;
{$ENDIF}
end;

procedure TfmObject3DReflectingCfgEditor.lvTypes_RemoveSelectedItem;
var
  RemoveItem: TListItem;
  RemoveIndex,I: integer;
begin
if lvTypes.Selected = nil then Exit;
RemoveItem:=lvTypes.Selected;
RemoveIndex:=Integer(RemoveItem.Data);
ReflectingCfg.RemoveItem(RemoveIndex);
RemoveItem.Delete;
Removing_ValidateIndexes(RemoveIndex);
flCfgChanged:=true;
end;

function TfmObject3DReflectingCfgEditor.lvTypes_ValidityChanged: boolean;
var
  I: integer;
  Ind: integer;
begin
Result:=false;
for I:=0 to lvTypes.Items.Count-1 do with lvTypes.Items[I] do begin
  Ind:=Integer(Data);
  if Checked <> ReflectingCfg.IsItemValid(Ind)
   then begin
    ReflectingCfg.SetValidityItem(Ind, Checked);
    Result:=true;
    end;
  end;
end;



procedure TfmObject3DReflectingCfgEditor.lvLaysClear;
begin
with lvLays.Items do begin
Clear;
end;
end;

procedure TfmObject3DReflectingCfgEditor.lvLaysUpdate;

  function TreateLay(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    LayFunctionality: TLay2DVisualizationFunctionality;
  begin
  Result:=false;
  with ReflectingCfg.Reflecting.Reflector.Space do begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.idTObj = idTLay2DVisualization
   then begin
    LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Obj.idObj));
    with LayFunctionality do begin
    with lvLays.Items.Insert(0) do begin
    Data:=Pointer(idObj);
    Caption:=Name;
    ImageIndex:=TypeFunctionality.ImageList_Index;
    Checked:=NOT ReflectingCfg.HidedLays.IsLayFound(idObj);
    SubItems.Add(IntToStr(Number))
    end;
    Release;
    end;
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   if TreateLay(ptrOwnerObj) then Exit;
   ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;
  end;


begin
lvLaysClear;
lvLays.Items.BeginUpdate;
try
TreateLay(ReflectingCfg.Reflecting.Reflector.Space.ptrRootObj);
finally
lvLays.Items.EndUpdate;
end;
end;

function TfmObject3DReflectingCfgEditor.lvLays_ValidityChanged: boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to lvLays.Items.Count-1 do with lvLays.Items[I] do
  if (NOT Checked) <> ReflectingCfg.HidedLays.IsLayFound(Integer(Data))
   then begin
    Result:=true;
    Exit;
    end;
end;

procedure TfmObject3DReflectingCfgEditor.lvLays_ValidateCfg;
var
  I: integer;
begin
with ReflectingCfg.HidedLays do begin
Clear;
for I:=0 to lvLays.Items.Count-1 do with lvLays.Items[I] do if NOT Checked then Add(Pointer(Integer(Data){idLay}));
Save;
end;
//. Отображаем изменения
ReflectingCfg.Reflecting.RecalcReflect;
end;

procedure TfmObject3DReflectingCfgEditor.lvLays_ExchangeItems(SrsIndex,DistIndex: integer);
begin
end;

procedure TfmObject3DReflectingCfgEditor.lvLays_CreateNew;
var
  idNewLay: integer;
  LayFunctionality: TLay2DVisualizationFunctionality;
begin
with TTypeFunctionality_Create(idTLay2DVisualization) do begin
idNewLay:=CreateInstance;
Release;
end;
LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idNewLay));
with LayFunctionality do begin
with lvLays.Items.Insert(0) do begin
Data:=Pointer(idObj);
Caption:=Name;
ImageIndex:=TypeFunctionality.ImageList_Index;
Checked:=NOT ReflectingCfg.HidedLays.IsLayFound(idObj);
SubItems.Add(IntToStr(Number));
EditCaption;
end;
Release;
end;
end;

procedure TfmObject3DReflectingCfgEditor.lvLaysDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmObject3DReflectingCfgEditor.lvLaysDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
if Sender = Source
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if Item = nil then Exit;
  lvLays_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmObject3DReflectingCfgEditor.lvLaysEdited(Sender: TObject; Item: TListItem; var S: String);
var
  ComponentFunctionality: TComponentFunctionality;
begin
if Item.Caption <> S
 then begin
  ComponentFunctionality:=TComponentFunctionality_Create(idTLay2DVisualization,Integer(Item.Data){idLay});
  with ComponentFunctionality do begin
  Name:=S;
  Release;
  end;
  end;
end;

procedure TfmObject3DReflectingCfgEditor.lvLays_DestroySelectedLay;
var
  idDestroyLay: integer;
  LayFunctionality: TLay2DVisualizationFunctionality;
begin
if lvLays.Selected = nil then Exit; //. ->
idDestroyLay:=Integer(lvLays.Selected.Data);
LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idDestroyLay));
with LayFunctionality do begin
try
if NOT isEmpty then Raise Exception.Create('can not destroy lay');
if (Number <> Space.LaysCount) then Raise Exception.Create('can notr destroy lay at top level');
TypeFunctionality.DestroyInstance(idDestroyLay);
finally
Release;
end;
end;
lvLays.Selected.Delete;
end;

procedure TfmObject3DReflectingCfgEditor.lvLaysDblClick(Sender: TObject);
begin
if lvLays.Selected <> nil
 then with TfmLay2DVisualizationObjectsList.Create(Integer(lvLays.Selected.Data){idLay}) do Show;
end;

procedure TfmObject3DReflectingCfgEditor.MenuItem1Click(Sender: TObject);
begin
if ReflectingCfg.Reflecting.Reflector.Space.UserName <> 'ROOT' then Raise Exception.Create('access is denied'); //. =>
lvLays_CreateNew;
end;

procedure TfmObject3DReflectingCfgEditor.MenuItem2Click(Sender: TObject);
begin
if ReflectingCfg.Reflecting.Reflector.Space.UserName <> 'ROOT' then Raise Exception.Create('access is denied'); //. =>
lvLays_DestroySelectedLay;
end;


procedure TfmObject3DReflectingCfgEditor.lvObjectsClear;
begin
with lvObjects.Items do begin
Clear;
end;
end;

procedure TfmObject3DReflectingCfgEditor.lvObjectsUpdate;
var
  ObjectsList: TList;
  I: integer;
  ptrItem: pointer;
  ObjFunctionality: TComponentFunctionality;
begin
lvObjectsClear;
ReflectingCfg.GetItemsList(ObjectsList);
lvObjects.Items.BeginUpdate;
try
for I:=0 to ObjectsList.Count-1 do begin
  ptrItem:=ObjectsList[I];
  with TItemReflectingCfg(ptrItem^) do begin
  if idObj <> 0
   then begin
    try
    ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
    with ObjFunctionality do begin
    with lvObjects.Items.Add do begin
    Data:=Pointer(I);
    Caption:=Name;
    ImageIndex:=TypeFunctionality.ImageList_Index;
    Checked:=flValid;
    end;
    Release;
    end;
    except
      end;
    end;
  end;
  FreeMem(ptrItem,SizeOf(TItemReflectingCfg));
  end;
finally
lvObjects.Items.EndUpdate;
ObjectsList.Destroy;
end;
flCfgChanged:=true;
end;

procedure TfmObject3DReflectingCfgEditor.lvObjects_InsertItemFromClipboard;
var
  idTObj,idObj: integer;
  Ind: integer;
  ObjFunctionality: TComponentFunctionality;
begin
{$IFDEF ExternalTypes}
if NOT GetClipBoardObject(idTObj,idObj) then Exit;
Ind:=ReflectingCfg.InsertItem(idTObj,idObj);
with lvObjects.Items.Add do begin
Data:=pointer(Ind);
ObjFunctionality:=TComponentFunctionality_Create(idTObj,idObj);
if ObjFunctionality <> nil
 then with ObjFunctionality do begin
  Caption:=Name;
  ImageIndex:=TypeFunctionality.ImageList_Index;
  Release;
  end;
Checked:=true;
end;
flCfgChanged:=true;
{$ENDIF}
end;

procedure TfmObject3DReflectingCfgEditor.lvObjects_RemoveSelectedItem;
var
  RemoveItem: TListItem;
  RemoveIndex,I: integer;
begin
if lvObjects.Selected = nil then Exit;
RemoveItem:=lvObjects.Selected;
RemoveIndex:=Integer(RemoveItem.Data);
ReflectingCfg.RemoveItem(RemoveIndex);
RemoveItem.Delete;
Removing_ValidateIndexes(RemoveIndex);
flCfgChanged:=true;
end;

function TfmObject3DReflectingCfgEditor.lvObjects_ValidityChanged: boolean;
var
  I: integer;
  Ind: integer;
begin
Result:=false;
for I:=0 to lvObjects.Items.Count-1 do with lvObjects.Items[I] do begin
  Ind:=Integer(Data);
  if Checked <> ReflectingCfg.IsItemValid(Ind)
   then begin
    ReflectingCfg.SetValidityItem(Ind, Checked);
    Result:=true;
    end;
  end;
end;


procedure TfmObject3DReflectingCfgEditor.Removing_ValidateIndexes(const RemoveIndex: integer);
var
  I: integer;
begin
with lvTypes do for I:=0 to Items.Count-1 do if Integer(Items[I].Data) > RemoveIndex then Items[I].Data:=Pointer(Integer(Items[I].Data)-1);
with lvObjects do for I:=0 to Items.Count-1 do if Integer(Items[I].Data) > RemoveIndex then Items[I].Data:=Pointer(Integer(Items[I].Data)-1);
end;

procedure TfmObject3DReflectingCfgEditor.N1Click(Sender: TObject);
begin
lvTypes_InsertItemFromClipboard;
end;

procedure TfmObject3DReflectingCfgEditor.N2Click(Sender: TObject);
begin
lvTypes_RemoveSelectedItem;
end;

procedure TfmObject3DReflectingCfgEditor.N3Click(Sender: TObject);
begin
lvObjects_InsertItemFromClipboard;
end;

procedure TfmObject3DReflectingCfgEditor.N4Click(Sender: TObject);
begin
lvObjects_RemoveSelectedItem;
end;

procedure TfmObject3DReflectingCfgEditor.rxsbAcceptClick(Sender: TObject);
begin
if flCfgChanged OR lvTypes_ValidityChanged OR lvObjects_ValidityChanged
 then begin
  ReflectingCfg.Validate;
  flCfgChanged:=false;
  end;
if lvLays_ValidityChanged then lvLays_ValidateCfg;
Close;
end;

procedure TfmObject3DReflectingCfgEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if flCfgChanged OR lvTypes_ValidityChanged OR lvObjects_ValidityChanged
 then begin
  ReflectingCfg.Validate;
  flCfgChanged:=false;
  end;
if lvLays_ValidityChanged then lvLays_ValidateCfg;
end;



end.
