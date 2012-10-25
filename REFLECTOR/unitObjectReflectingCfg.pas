unit unitObjectReflectingCfg;

interface

uses
  SysUtils,
  SyncObjs,
  GlobalSpaceDefines, 
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface, 
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitProxySpace, Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, Windows, ActiveX, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, RXCtrls, RXSplit, ExtCtrls, Menus, StdCtrls, ImgList;

const
  ObjectReflectingCfgFile = 'Reflecting.cfg';
  HidedLaysCfgFile = 'HidedLays.Reflecting.cfg';
type
  TItemReflectingCfg = packed record
    flValid: boolean;
    idTObj: integer;
    idObj: integer; //. если = 0, то спрятан весь тип
  end;

  TfmObjectReflectingCfgEditor = class;
  TObjectReflectingCfg = class;

  THidedLays = class(TList)
  private
    Cfg: TObjectReflectingCfg;
    LayNumbersArrayLock: TCriticalSection;
    LayNumbersArray: TByteArray;

    function LayAccessCheck(const ptrObj: TPtr): boolean;
  public

    Constructor Create(pCfg: TObjectReflectingCfg);
    Destructor Destroy;
    procedure Validate;
    procedure Load;
    procedure Save;
    function Add(Item: Pointer): Integer; reintroduce;
    function Remove(Item: Pointer): Integer; reintroduce;
    function GetLayNumbersArray(): TByteArray;
    function IsLayFound(const idLay: integer): boolean;
    function IsLayFoundByOrder(const orderLay: integer): boolean;
  end;

  TObjectReflectingCfg = class
  private
    Reflecting: TReflecting;
    Editor: TfmObjectReflectingCfgEditor;

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
    /// ? PartitionHidedObjects: TSpacePartition;
    ListHidedObjects: pointer; //. поскольку все равно в каком порядке расположены спрятанные объекты
                               //. их список сделан в виде слоя TLayReflect, чтобы эффективно удалять через TDeleting
    {
    Формат Data:
      ItemsCount: LongInt;
      Item[0]: TItemReflectingCfg,Item[1]: TItemReflectingCfg,...Item[ItemsCount-1]: TItemReflectingCfg
    }
    HidedLays: THidedLays;
    ReflectorSuperLays: TObject;

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

  TpopupObjectCreate = class(TPopupMenu)
  private
    Editor: TfmObjectReflectingCfgEditor;
    ObjectsTypes: TList;
    procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
  public
    Constructor Create(pEditor: TfmObjectReflectingCfgEditor);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure ItemClick(Sender: TObject);
  end;

  TfmObjectReflectingCfgEditor = class(TForm)
    lvTypesPopup: TPopupMenu;
    lvObjectsPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    lvLaysPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel3: TPanel;
    rxsbAccept: TRxSpeedButton;
    propertiesofselectedlay1: TMenuItem;
    createobjectonselectedlay1: TMenuItem;
    lvLays_ImageList: TImageList;
    Panel5: TPanel;
    Panel1: TPanel;
    RxLabel5: TRxLabel;
    lvTypes: TListView;
    Panel4: TPanel;
    lvLays: TListView;
    Panel2: TPanel;
    RxLabel1: TRxLabel;
    lvObjects: TListView;
    Panel6: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pnlBRT__TimeLimited: TPanel;
    rbBRT__TimeLimited: TRadioButton;
    rbBRT__PartialWithLastReflection: TRadioButton;
    pnlBRT__PartialWithLastReflection: TPanel;
    Label2: TLabel;
    edBRT__PartialWithLastReflection_MaxReflectingLay: TEdit;
    Label1: TLabel;
    edBRT__TimeLimited_maxReflectingTime: TEdit;
    Label3: TLabel;
    contentofselectedlay1: TMenuItem;
    N5: TMenuItem;
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
    procedure MenuItem2Click(Sender: TObject);
    procedure propertiesofselectedlay1Click(Sender: TObject);
    procedure createobjectonselectedlay1Click(Sender: TObject);
    procedure rbBRT__TimeLimitedClick(Sender: TObject);
    procedure rbBRT__PartialWithLastReflectionClick(Sender: TObject);
    procedure contentofselectedlay1Click(Sender: TObject);
    procedure lvLaysDblClick(Sender: TObject);
  private
    { Private declarations }
    Reflecting: TReflecting;
    ReflectingCfg: TObjectReflectingCfg;
    flCfgChanged: boolean;
    popupObjectCreate: TPopupMenu;


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
    Constructor Create(const pReflecting: TReflecting; const pReflectingCfg: TObjectReflectingCfg);
    procedure Update;
  end;

implementation
Uses
  unitLay2DVisualizationObjectsList,
  unitReflectorSuperLays;

{$R *.DFM}



{THidedLays}
Constructor THidedLays.Create(pCfg: TObjectReflectingCfg);
begin
Inherited Create;
Cfg:=pCfg;
//.
LayNumbersArrayLock:=TCriticalSection.Create();
SetLength(LayNumbersArray,0);
//.
Load();
//.
Validate();
end;

Destructor THidedLays.Destroy;
begin
Clear;
LayNumbersArrayLock.Free;
Inherited;
end;

procedure THidedLays.Validate;
var
  p: pointer;
  Cnt: Word;
  I: integer;
  LN: integer;
  LayNumber: Word;
begin
LayNumbersArrayLock.Enter;
try
SetLength(LayNumbersArray,SizeOf(Word){items count}+Count*SizeOf(Word){item size});
p:=Pointer(@LayNumbersArray[0]);
Cnt:=Word(Count);
Word(p^):=Cnt; Inc(Integer(p),SizeOf(Word));
for I:=0 to Count-1 do begin
  Cfg.Reflecting.Reflector.Space.Lay_GetNumberByID(Integer(List[I]),{out} LN);
  LayNumber:=Word(LN);
  Word(p^):=LayNumber; Inc(Integer(p),SizeOf(Word));
  end;
finally
LayNumbersArrayLock.Leave;
end;
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
  if (Read(ptrBuff^,Size) <> Size) then Raise Exception.Create('Can not read HidedLays config'); //. =>
  ptrItem:=ptrBuff;
  while (Integer(ptrItem) < (Integer(ptrBuff)+Size)) do begin
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
    Inherited Add(Pointer(idLay));
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
if (NOT Cfg.Reflecting.Reflector.Space.flOffline)
 then //. read user-defined config
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
//. add to list the denied lays
LayAccessCheck(Cfg.Reflecting.Reflector.Space.ptrRootObj);
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
    if Write(idLay,SizeOf(idLay)) <> SizeOf(idLay) then Raise Exception.Create('can not write in '+HidedLaysCfgFile);
    end;
  end;
  end;

var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create();
try
WriteIntoStream(MemoryStream);
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserReflector(Cfg.Reflecting.Reflector.Space.SOAPServerURL).Set_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,BA);
{$ELSE}
SpaceUserReflector_Set_ReflectingHidedLays(Cfg.Reflecting.Reflector.Space.UserName,Cfg.Reflecting.Reflector.Space.UserPassword,Cfg.Reflecting.Reflector.id,BA);
{$ENDIF}
finally
MemoryStream.Destroy();
end;
end;

function THidedLays.LayAccessCheck(const ptrObj: TPtr): boolean;
var
  Obj: TSpaceObj;
  ptrOwnerObj: TPtr;
begin
(*/// + Result:=false;
with Cfg.Reflecting.Reflector.Space do begin
ReadObj(Obj,SizeOf(Obj), ptrObj);
if Obj.idTObj = idTLay2DVisualization
 then begin
  Result:=true;
  with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
  try
  try
  CheckUserOperation(idReadOperation);
  except
    Inherited Add(Pointer(Obj.idObj)); //. insert lay as hidden
    end;
  finally
  Release;
  end;
  end;
ptrOwnerObj:=Obj.ptrListOwnerObj;
while ptrOwnerObj <> nilPtr do begin
 if LayAccessCheck(ptrOwnerObj)
  then begin
   Result:=true;
   Exit; //. -->
   end;
 ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
 end;
end;*)
end;

function THidedLays.Add(Item: Pointer): Integer;
begin
Result:=Inherited Add(Item);
Validate();
end;

function THidedLays.Remove(Item: Pointer): Integer;
begin
Result:=Inherited Remove(Item);
Validate();
end;

function THidedLays.GetLayNumbersArray(): TByteArray;
begin
LayNumbersArrayLock.Enter;
try
Result:=LayNumbersArray;
finally
LayNumbersArrayLock.Leave;
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
if (ptrLay = nilPtr) then Exit; //. ->
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
/// ? PartitionHidedObjects:=TSpacePartition.Create(Reflecting.Reflector.Space);
HidedLays:=THidedLays.Create(Self);
ReflectorSuperLays:=TReflectorSuperLays.Create(Reflecting.Reflector,HidedLays);
//.
ListHidedObjects:=TList.Create;
Load;
Validate;
end;

Destructor TObjectReflectingCfg.Destroy;
begin
Editor.Free;
ListHidedObjects_Clear;
ReflectorSuperLays.Free;
HidedLays.Free;
/// ? PartitionHidedObjects.Free;
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
if (NOT Reflecting.Reflector.Space.flOffline)
 then //. read user-defined config
  {$IFNDEF EmbeddedServer}
  if (GetISpaceUserReflector(Reflecting.Reflector.Space.SOAPServerURL).Get_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,{out} BA))
  {$ELSE}
  if (SpaceUserReflector_Get_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,{out} BA))
  {$ENDIF}
   then begin
    MemoryStream:=TMemoryStream.Create();
    try
    ByteArray_PrepareStream(BA,TStream(MemoryStream));
    if (MemoryStream.Size > 0) then ReadFromStream(MemoryStream);
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
MemoryStream:=TMemoryStream.Create();
try
WriteIntoStream(MemoryStream);
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserReflector(Reflecting.Reflector.Space.SOAPServerURL).Set_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,BA);
{$ELSE}
SpaceUserReflector_Set_ReflectingCfg(Reflecting.Reflector.Space.UserName,Reflecting.Reflector.Space.UserPassword,Reflecting.Reflector.id,BA);
{$ENDIF}
finally
MemoryStream.Destroy();
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
//. подготовка OwnersData
{получаем число запрещенных типов}
(*/// + DisabledTypesCount:=0; for I:=0 to TypesSystem.Count-1 do if NOT TTypeSystem(TypesSystem[I]).Enabled then inc(DisabledTypesCount);

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

try
Reflecting.Reflector.Space.GlobalSpaceCashDataProvider.GetOwnersVisualizationsPtrs(OwnersData, PtrsData);
finally
SafeArrayDestroy(OwnersData);
end;

PartitionHidedObjects.Empty;
SafeArrayAccessData(PtrsData, PtrsDataPtr);
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
if PtrsCount > 0
 then begin
  Reflecting.Reflector.Space.Log.OperationStarting('indexing hided objects ...');
  try
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
  end;
  end;
finally
SafeArrayUnAccessData(PtrsData);
SafeArrayDestroy(PtrsData);
end;

//. Отображаем изменения
Reflecting.RecalcReflect;*)

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
//.
TReflectorSuperLays(ReflectorSuperLays).Validate();
end;

procedure TObjectReflectingCfg.GetListHidedObjects;
var
  /// ? VisibleContainersList: TContainersList;
  I: integer;
  ptrLay: pointer;
  ptrItem: pointer;
begin
{/// ? ListHidedObjects_Clear;
ListHidedObjects_Create;
with Reflecting.Reflector.ReflectionWindow.ContainerCoord do PartitionHidedObjects.GetListVisibleContainers(Xmin,Ymin,Xmax,Ymax, VisibleContainersList);
//. удаляем контейнеры, размер которых слишком мал
I:=0;
while I < VisibleContainersList.Count do with TContainer(VisibleContainersList[I]) do begin
  if NOT (((Coords.Xmax-Coords.Xmin)*(Coords.Ymax-Coords.Ymin))*Sqr(Reflecting.Reflector.ReflectionWindow.Scale) > Reflection_VisibleFactor) //. критерий видимости
   then VisibleContainersList.Delete(I)
   else Inc(I);
  end;
try
for I:=0 to VisibleContainersList.Count-1 do with TContainer(VisibleContainersList[I]) do begin
  ptrLay:=Lays;
  while ptrLay <> nil do with TLayContainer(ptrLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do with TItemLayContainer(ptrItem^) do begin
      if Reflecting.Reflector.ReflectionWindow.IsObjectVisible(Container_Square,Container_Coord,ptrObject)
       then ListHidedObjects_InsertObj(ptrObject);
      ptrItem:=ptrNext;
      end;
    ptrLay:=ptrNext;
    end;
  end;
finally
VisibleContainersList.Free;
end;}
end;

function TObjectReflectingCfg.Is2DVisualizationHide(const ptrObj: TPtr): boolean;
var
  idTOwner,idOwner: integer;
  ptrVisOwner: integer;
begin
{/// + Result:=false; Exit; //. -> /// ???
if Reflecting.Reflector.Space.GlobalSpaceCashDataProvider.T2DVisualizationCash_GetItemByPtrObj(ptrObj, idTOwner,idOwner, ptrVisOwner)
 then begin
  AccessData;
  if IsObjectHide(idTOwner,idOwner)
   then Result:=true;
  UnAccessData;
  end; }
end;

function TObjectReflectingCfg.ListHidedObjects_IsObjectFound(const ptrObj: TPtr): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
///?
{ptrItem:=TLayReflect(ListHidedObjects^).Objects;
while ptrItem <> nil do with TItemLayReflect(ptrItem^) do begin
  if ptrObject = ptrObj
   then begin
    Result:=true;
    Exit;
    end;
  ptrItem:=ptrNext;
  end;}
end;

procedure TObjectReflectingCfg.ShowEditor;
begin
if (Editor = nil) then Editor:=TfmObjectReflectingCfgEditor.Create(Reflecting,Self);
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


{TpopupObjectCreate}
Constructor TpopupObjectCreate.Create(pEditor: TfmObjectReflectingCfgEditor);
begin
Editor:=pEditor;
Inherited Create(Editor);
TypesSystem.QueryTypes(TTBase2DVisualizationFunctionality, ObjectsTypes);
OnPopup:=Popup;
AutoHotKeys:=maManual;
Images:=TypesImageList;
end;

Destructor TpopupObjectCreate.Destroy;
begin
Clear;
ObjectsTypes.Free;
Inherited;
end;

procedure TpopupObjectCreate.Update;
var
  I: integer;
  idTObject: integer;
  ObjectTypeFunctionality: TTypeFunctionality;
  newMenuItem: TMenuItem;
begin
Clear;
for I:=0 to ObjectsTypes.Count-1 do begin
  idTObject:=Integer(ObjectsTypes[I]);
  if idTObject <> idTLay2DVisualization
   then
    try
    ObjectTypeFunctionality:=TTypeFunctionality_Create(idTObject);
    try
    with ObjectTypeFunctionality do begin
    newMenuItem:=TMenuItem.Create(Self);
    with newMenuItem do begin
    Tag:=idTObject;
    Caption:=ObjectTypeFunctionality.Name;
    ImageIndex:=ImageList_Index;
    OnClick:=ItemClick;
    OnMeasureItem:=MeasureItem;
    end;
    end;
    finally
    ObjectTypeFunctionality.Release;
    end;
    Items.Add(newMenuItem);
    except
      end;
  end;
end;

procedure TpopupObjectCreate.Clear;
begin
Items.Clear;
end;

procedure TpopupObjectCreate.Popup(Sender: TObject);
begin
Update;
end;

procedure TpopupObjectCreate.ItemClick(Sender: TObject);
var
  ObjectTypeFunctionality: TTBase2DVisualizationFunctionality;
  ptrOwner: TPtr;
  Owner: TSpaceObj;
  ObjectVisualization: TObjectVisualization;
  idObject: integer;
begin
with Editor do begin
if lvLays.Selected = nil then Exit; //. ->
with TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Integer(lvLays.Selected.Data))) do
try
ptrOwner:=Ptr;
ObjectTypeFunctionality:=TTBase2DVisualizationFunctionality(TTypeFunctionality_Create((Sender as TMenuItem).Tag));
with ObjectTypeFunctionality do
try
Reflector:=Editor.ReflectingCfg.Reflecting.Reflector;
idObject:=CreateInstanceEx(ObjectVisualization, ptrOwner);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(idObject)) do
try
//. show new Object props panel
if Reflector <> nil
 then with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Reflector.SelectObj(Ptr);
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  OnKeyDown:=Reflector.OnKeyDown;
  OnKeyUp:=Reflector.OnKeyUp;
  Show;
  end;
finally
Release;
end;
//.
finally
Release;
end;
finally
Release;
end;
end;
end;

procedure TpopupObjectCreate.MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
begin
ACanvas.Font.Size:=14;
Height:=Images.Height+3;
end;


{TfmObjectReflectingCfgEditor}
Constructor TfmObjectReflectingCfgEditor.Create(const pReflecting: TReflecting; const pReflectingCfg: TObjectReflectingCfg);
begin
Inherited Create(nil);
Reflecting:=pReflecting;
ReflectingCfg:=pReflectingCfg;
lvTypes.SmallImages:=TypesImageList;
lvObjects.SmallImages:=TypesImageList;
popupObjectCreate:=TpopupObjectCreate.Create(Self);
end;

procedure TfmObjectReflectingCfgEditor.Update;
begin
//. general configuration
case Reflecting.Configuration.BriefReflectingType of
brtTimeLimited: begin
  rbBRT__TimeLimited.Checked:=true;
  pnlBRT__PartialWithLastReflection.Hide();
  pnlBRT__TimeLimited.Show();
  end;
brtPartialWithLastReflection: begin
  rbBRT__PartialWithLastReflection.Checked:=true;
  pnlBRT__TimeLimited.Hide();
  pnlBRT__PartialWithLastReflection.Show();
  end;
end;
edBRT__TimeLimited_maxReflectingTime.Text:=IntToStr(Reflecting.Configuration.BriefReflectingType__TimeLimited_MaxReflectingTime);
edBRT__PartialWithLastReflection_MaxReflectingLay.Text:=IntToStr(Reflecting.Configuration.BriefReflectingType__PartialWithLastReflection_MaxReflectingLay);
//.
lvLaysUpdate;
lvTypesUpdate;
lvObjectsUpdate;
flCfgChanged:=false;
end;

procedure TfmObjectReflectingCfgEditor.lvTypesClear;
begin
with lvTypes.Items do begin
Clear;
end;
end;

procedure TfmObjectReflectingCfgEditor.lvTypesUpdate;
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

procedure TfmObjectReflectingCfgEditor.lvTypes_InsertItemFromClipboard;
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

procedure TfmObjectReflectingCfgEditor.lvTypes_RemoveSelectedItem;
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

function TfmObjectReflectingCfgEditor.lvTypes_ValidityChanged: boolean;
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



procedure TfmObjectReflectingCfgEditor.lvLaysClear;
begin
with lvLays.Items do begin
Clear;
end;
end;

procedure TfmObjectReflectingCfgEditor.lvLaysUpdate;

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
    try
    LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,Obj.idObj));
    with LayFunctionality do
    try
    with lvLays.Items.Insert(0) do begin
    Data:=Pointer(idObj);
    Checked:=NOT ReflectingCfg.HidedLays.IsLayFound(idObj);
    try
    Caption:=Name;
    except
      on E: Exception do Caption:='ERROR: '+E.Message;
      end;
    ImageIndex:=0; //. TypeFunctionality.ImageList_Index;
    SubItems.Add(IntToStr(Number));
    end;
    finally
    Release;
    end;
    except
      end;
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
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

function TfmObjectReflectingCfgEditor.lvLays_ValidityChanged: boolean;
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

procedure TfmObjectReflectingCfgEditor.lvLays_ValidateCfg;
var
  I: integer;
begin
with ReflectingCfg.HidedLays do begin
Clear;
for I:=0 to lvLays.Items.Count-1 do with lvLays.Items[I] do if NOT Checked then Add(Pointer(Integer(Data){idLay}));
Save;
//. add to list the denied lays
LayAccessCheck(Cfg.Reflecting.Reflector.Space.ptrRootObj);
end;
//. Отображаем изменения
ReflectingCfg.Reflecting.RecalcReflect;
end;

procedure TfmObjectReflectingCfgEditor.lvLays_ExchangeItems(SrsIndex,DistIndex: integer);
var
  idLay: integer;
  P: pointer;
  S: string;
  B: boolean;
  I,Index: integer;
  NewLevel: integer;
  Params: WideString;

  procedure UpdateItem(const Index: integer);
  var
    idLay: integer;
    LayFunctionality: TLay2DVisualizationFunctionality;
  begin
  idLay:=Integer(lvLays.Items[Index].Data);
  LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idLay));
  with LayFunctionality do begin
  with lvLays.Items[Index] do begin
  Caption:=Name;
  ImageIndex:=0; //. TypeFunctionality.ImageList_Index;
  Checked:=NOT ReflectingCfg.HidedLays.IsLayFound(idObj);
  SubItems[0]:=IntToStr(Number);
  end;
  Release;
  end;
  end;

begin
(* /// + with lvLays do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit;

idLay:=Integer(Items[SrsIndex].Data);
NewLevel:=Items.Count-DistIndex;
with ReflectingCfg.Reflecting do begin
with Reflector.Space do GlobalSpaceSecurity.CheckUserComponentOperation(UserName,UserPassword,idTLay2DVisualization,idLay, idWriteOperation);
Reflector.Space.Lay_ChangeLevel(idLay, NewLevel);
RecalcReflect;
TReflectorsList(Reflector.Space.ReflectorsList).RecalcReflect(Reflector.ID);
with Reflector.Space do begin
GetSecurityParams(Params);
GlobalSpaceProxySpacesManager.Reflectors_ReflectSpace(Reflector.Space.ID, Params);
end;
end;

Items.BeginUpdate;
P:=Items[SrsIndex].Data;
S:=Items[SrsIndex].Caption;
Index:=Items[SrsIndex].ImageIndex;
B:=Items[SrsIndex].Checked;
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    Items[I].Data:=Items[I-1].Data;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Items[I].Checked:=Items[I-1].Checked;
    UpdateItem(I);
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    Items[I].Data:=Items[I+1].Data;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Items[I].Checked:=Items[I+1].Checked;
    UpdateItem(I);
    Inc(I);
    end;
  end;
Items[DistIndex].Data:=P;
Items[DistIndex].Caption:=S;
Items[DistIndex].ImageIndex:=Index;
Items[DistIndex].Checked:=B;
UpdateItem(DistIndex);
Items.EndUpdate;
end;*)
end;

procedure TfmObjectReflectingCfgEditor.lvLays_CreateNew;
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
ImageIndex:=0; //. TypeFunctionality.ImageList_Index;
Checked:=NOT ReflectingCfg.HidedLays.IsLayFound(idObj);
SubItems.Add(IntToStr(Number));
EditCaption;
end;
Release;
end;
end;

procedure TfmObjectReflectingCfgEditor.lvLaysDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmObjectReflectingCfgEditor.lvLaysDragDrop(Sender, Source: TObject; X, Y: Integer);
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

procedure TfmObjectReflectingCfgEditor.lvLaysEdited(Sender: TObject; Item: TListItem; var S: String);
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

procedure TfmObjectReflectingCfgEditor.lvLays_DestroySelectedLay;
var
  idDestroyLay: integer;
  LayFunctionality: TLay2DVisualizationFunctionality;
begin
if lvLays.Selected = nil then Exit; //. ->
idDestroyLay:=Integer(lvLays.Selected.Data);
LayFunctionality:=TLay2DVisualizationFunctionality(TComponentFunctionality_Create(idTLay2DVisualization,idDestroyLay));
with LayFunctionality do begin
try
if NOT isEmpty then Raise Exception.Create('can not desroy lay: has a owner objects');
if (Number <> Space.LaysCount) then Raise Exception.Create('can not destroy the lay at top level');
TypeFunctionality.DestroyInstance(idDestroyLay);
finally
Release;
end;
end;
lvLays.Selected.Delete;
end;

procedure TfmObjectReflectingCfgEditor.MenuItem1Click(Sender: TObject);
begin
if ReflectingCfg.Reflecting.Reflector.Space.UserName <> 'ROOT' then Raise Exception.Create('access is denied'); //. =>
lvLays_CreateNew;
end;

procedure TfmObjectReflectingCfgEditor.MenuItem2Click(Sender: TObject);
begin
if ReflectingCfg.Reflecting.Reflector.Space.UserName <> 'ROOT' then Raise Exception.Create('access is denied'); //. =>
lvLays_DestroySelectedLay;
end;


procedure TfmObjectReflectingCfgEditor.lvObjectsClear;
begin
with lvObjects.Items do begin
Clear;
end;
end;

procedure TfmObjectReflectingCfgEditor.lvObjectsUpdate;
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

procedure TfmObjectReflectingCfgEditor.lvObjects_InsertItemFromClipboard;
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

procedure TfmObjectReflectingCfgEditor.lvObjects_RemoveSelectedItem;
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

function TfmObjectReflectingCfgEditor.lvObjects_ValidityChanged: boolean;
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


procedure TfmObjectReflectingCfgEditor.Removing_ValidateIndexes(const RemoveIndex: integer);
var
  I: integer;
begin
with lvTypes do for I:=0 to Items.Count-1 do if Integer(Items[I].Data) > RemoveIndex then Items[I].Data:=Pointer(Integer(Items[I].Data)-1);
with lvObjects do for I:=0 to Items.Count-1 do if Integer(Items[I].Data) > RemoveIndex then Items[I].Data:=Pointer(Integer(Items[I].Data)-1);
end;

procedure TfmObjectReflectingCfgEditor.N1Click(Sender: TObject);
begin
lvTypes_InsertItemFromClipboard;
end;

procedure TfmObjectReflectingCfgEditor.N2Click(Sender: TObject);
begin
lvTypes_RemoveSelectedItem;
end;

procedure TfmObjectReflectingCfgEditor.N3Click(Sender: TObject);
begin
lvObjects_InsertItemFromClipboard;
end;

procedure TfmObjectReflectingCfgEditor.N4Click(Sender: TObject);
begin
lvObjects_RemoveSelectedItem;
end;

procedure TfmObjectReflectingCfgEditor.rxsbAcceptClick(Sender: TObject);
begin
if (rbBRT__TimeLimited.Checked) then Reflecting.Configuration.BriefReflectingType:=brtTimeLimited else
if (rbBRT__PartialWithLastReflection.Checked) then Reflecting.Configuration.BriefReflectingType:=brtPartialWithLastReflection;
Reflecting.Configuration.BriefReflectingType__TimeLimited_MaxReflectingTime:=StrToInt(edBRT__TimeLimited_maxReflectingTime.Text);
Reflecting.Configuration.BriefReflectingType__PartialWithLastReflection_MaxReflectingLay:=StrToInt(edBRT__PartialWithLastReflection_MaxReflectingLay.Text);
Reflecting.Configuration.Save();
//.
if (flCfgChanged OR lvTypes_ValidityChanged OR lvObjects_ValidityChanged)
 then begin
  ReflectingCfg.Validate;
  flCfgChanged:=false;
  end;
if (lvLays_ValidityChanged) then lvLays_ValidateCfg;
Close;
end;

procedure TfmObjectReflectingCfgEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
///-
{if flCfgChanged OR lvTypes_ValidityChanged OR lvObjects_ValidityChanged
 then begin
  ReflectingCfg.Validate;
  flCfgChanged:=false;
  end;
if lvLays_ValidityChanged then lvLays_ValidateCfg;}
end;



procedure TfmObjectReflectingCfgEditor.propertiesofselectedlay1Click(Sender: TObject);
begin
if (lvLays.Selected = nil) then Exit; //. ->
with TComponentFunctionality_Create(idTLay2DVisualization,Integer(lvLays.Selected.Data)) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show;
end;
finally
Release;
end;
end;

procedure TfmObjectReflectingCfgEditor.contentofselectedlay1Click(Sender: TObject);
begin
if (lvLays.Selected <> nil)
 then begin
  //. check access
  with TComponentFunctionality_Create(idTLay2DVisualization,Integer(lvLays.Selected.Data){idLay}) do
  try
  CheckUserOperation(idReadOperation);
  finally
  Release;
  end;
  //.
  with TfmLay2DVisualizationObjectsList.Create(Integer(lvLays.Selected.Data){idLay}) do Show;
  end;
end;

procedure TfmObjectReflectingCfgEditor.createobjectonselectedlay1Click(Sender: TObject);
begin
popupObjectCreate.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfmObjectReflectingCfgEditor.lvLaysDblClick(Sender: TObject);
begin
propertiesofselectedlay1Click(nil);
end;

procedure TfmObjectReflectingCfgEditor.rbBRT__TimeLimitedClick(Sender: TObject);
begin
if (rbBRT__TimeLimited.Checked)
 then begin
  pnlBRT__PartialWithLastReflection.Hide();
  pnlBRT__TimeLimited.Show();
  end;
end;

procedure TfmObjectReflectingCfgEditor.rbBRT__PartialWithLastReflectionClick(Sender: TObject);
begin
if (rbBRT__PartialWithLastReflection.Checked)
 then begin
  pnlBRT__TimeLimited.Hide();
  pnlBRT__PartialWithLastReflection.Show();
  end;
end;


end.
