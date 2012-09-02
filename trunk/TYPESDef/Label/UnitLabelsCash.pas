// сделать RemoveLabel
unit UnitLabelsCash;
interface
Uses
  SysUtils, UnitProxySpace, TypesDefines, Graphics;

type
  TItemLabelsCash = record
    ptrNext: pointer;

    idObj: integer;
    Text: shortstring;
    Font_Width: Extended;
    Font_Height: Extended;
    Font_Name: shortstring;
  end;

  TLabelsCash = class
  private
    FItems: pointer;
  public
    Space: TProxySpace;
    
    Constructor Create(pSpace: TProxySpace);
    destructor Destroy; override;
    procedure Empty;
    procedure Update;
    function GetPtrItem(pidObj: integer): pointer;
    procedure InsertLabel(pidObj: integer);
    procedure UpdateItem(idObj: integer);
  end;

implementation
Uses
  unitReflector;

{TLabelsCash.}
Constructor TLabelsCash.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
FItems:=nil;
if Space <> nil then Update;
end;

destructor TLabelsCash.Destroy;
begin
Empty;
Inherited;
end;

procedure TLabelsCash.Empty;
var
  ptrDelItem: pointer;
begin
while FItems <> nil do begin
  ptrDelItem:=FItems;
  FItems:=TItemLabelsCash(ptrDelItem^).ptrNext;
  FreeMem(ptrDelItem,SizeOf(TItemLabelsCash));
  end;
end;

procedure TLabelsCash.Update;
var
  ptrNewItem: pointer;
begin
{/// - with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT * FROM '+tnTLabel+' ORDER BY Key_');
Open;
while NOT EOF do begin
  GetMem(ptrNewItem,SizeOf(TItemLabelsCash));
  with TItemLabelsCash(ptrNewItem^) do begin
  ptrNext:=FItems;

  try idObj:=FieldValues['Key_'] except idObj:=0 end;
  try Text:=FieldValues['Text'] except Text:='' end;
  try Font_Width:=FieldValues['Font_Width'] except Font_Width:=0 end;
  try Font_Height:=FieldValues['Font_Height'] except Font_Height:=0 end;
  try Font_Name:=FieldValues['Font_Name'] except Font_Name:='' end;
  end;
  FItems:=ptrNewItem;
  Next;
  end;
Destroy;
end;}
end;

function TLabelsCash.GetPtrItem(pidObj: integer): pointer;
begin
Result:=FItems;
while Result <> nil do with TItemLabelsCash(Result^) do begin
  if idObj = pidObj then Exit;
  Result:=ptrNext;
  end;
end;

procedure TLabelsCash.InsertLabel(pidObj: integer);
var
  ptrNewItem: pointer;
begin
{/// - GetMem(ptrNewItem,SizeOf(TItemLabelsCash));
with TItemLabelsCash(ptrNewItem^) do begin
ptrNext:=FItems;


idObj:=pidObj;
Text:='';
Font_Width:=0;
Font_Height:=0;
Font_Name:='';

with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT * FROM '+tnTLabel+' WHERE Key_+0 = '+IntToStr(idObj));
Open;
with TItemLabelsCash(ptrNewItem^) do begin
try idObj:=FieldValues['Key_'] except idObj:=0 end;
try Text:=FieldValues['Text'] except Text:='' end;
try Font_Width:=FieldValues['Font_Width'] except Font_Width:=0 end;
try Font_Height:=FieldValues['Font_Height'] except Font_Height:=0 end;
try Font_Name:=FieldValues['Font_Name'] except Font_Name:='' end;
end;
Destroy;
end;
end;
FItems:=ptrNewItem;}
end;

procedure TLabelsCash.UpdateItem(idObj: integer);
var
  ptrItem: pointer;
begin
{/// - ptrItem:=GetPtrItem(idObj);
if ptrItem = nil then Exit;
with Space.TObjPropsQuery_Create do begin
EnterSQL('SELECT * FROM '+tnTLabel+' WHERE Key_+0 = '+IntToStr(idObj));
Open;
with TItemLabelsCash(ptrItem^) do begin
try idObj:=FieldValues['Key_'] except idObj:=0 end;
try Text:=FieldValues['Text'] except Text:='' end;
try Font_Width:=FieldValues['Font_Width'] except Font_Width:=0 end;
try Font_Height:=FieldValues['Font_Height'] except Font_Height:=0 end;
try Font_Name:=FieldValues['Font_Name'] except Font_Name:='' end;
end;
Destroy;
end;}
end;

end.
