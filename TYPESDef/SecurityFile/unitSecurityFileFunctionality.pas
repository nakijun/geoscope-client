unit unitSecurityFileFunctionality;
Interface
Uses
  SysUtils, Classes;

Type
  TSecurityFile = class(TMemoryStream)
  private
    procedure CheckPosition;
  public
    Constructor Create; overload;
    Constructor Create(SrsStream: TMemoryStream); overload;

    function GetOperationKeys(const pidOperation: integer; out Keys: TList): boolean;    

    procedure Reset;
    function EOF: boolean;

    procedure ReadOperationID(out idOperation: integer);
    procedure WriteOperationID(const idOperation: integer);
    procedure ReadKeysCount(out KeysCount: integer);
    procedure WriteKeysCount(const KeysCount: integer);
    procedure ReadKeyID(out idKey: integer);
    procedure WriteKeyID(const idKey: integer);
  end;


Implementation


{TSecurityFile}
Constructor TSecurityFile.Create;
begin
Inherited Create;
Reset;
end;

Constructor TSecurityFile.Create(SrsStream: TMemoryStream);
begin
Create;
LoadFromStream(SrsStream);
Reset;
end;

function TSecurityFile.GetOperationKeys(const pidOperation: integer; out Keys: TList): boolean;
var
  idOperation: integer;
  KeysCount: integer; 
  I: integer;
  idKey: integer;
begin
Result:=false;
Reset;
while NOT EOF do begin
  ReadOperationID(idOperation);
  if idOperation = pidOperation
   then begin //. keys fetching
    Keys:=TList.Create;
    try
    ReadKeysCount(KeysCount);
    Keys.Capacity:=KeysCount;
    for I:=0 to KeysCount-1 do begin
      ReadKeyID(idKey);
      Keys.Add(Pointer(idKey));
      end;
    except
      Keys.Destroy;
      Raise;
      end;
    Result:=true;
    Exit; //. ->
    end
   else begin //. keys skipping
    ReadKeysCount(KeysCount);
    for I:=0 to KeysCount-1 do ReadKeyID(idKey);
    end;
  end;
end;

procedure TSecurityFile.Reset;
begin
Position:=0;
end;

function TSecurityFile.EOF: boolean;
begin
Result:=(Position = Size);
end;


procedure TSecurityFile.CheckPosition;
begin
if Position+SizeOf(Integer){SizeOf(ID)} > Size then Raise Exception.Create('unexpected end of file'); //. =>
end;

procedure TSecurityFile.ReadOperationID(out idOperation: integer);
begin
CheckPosition;
Read(idOperation,SizeOf(idOperation));
end;

procedure TSecurityFile.WriteOperationID(const idOperation: integer);
begin
Write(idOperation,SizeOf(idOperation));
end;

procedure TSecurityFile.ReadKeysCount(out KeysCount: integer);
begin
CheckPosition;
Read(KeysCount,SizeOf(KeysCount));
end;

procedure TSecurityFile.WriteKeysCount(const KeysCount: integer);
begin
Write(KeysCount,SizeOf(KeysCount));
end;

procedure TSecurityFile.ReadKeyID(out idKey: integer);
begin
CheckPosition;
Read(idKey,SizeOf(idKey));
end;

procedure TSecurityFile.WriteKeyID(const idKey: integer);
begin
Write(idKey,SizeOf(idKey));
end;


end.