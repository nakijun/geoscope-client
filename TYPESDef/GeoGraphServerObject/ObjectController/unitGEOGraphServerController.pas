unit unitGEOGraphServerController;

interface                                                               
                                                                             
Uses                                                                     
  Windows,                                                                
  Messages,                               
  SysUtils,                                               
  Variants,                                     
  Classes,                                                         
  {$IFNDEF Plugin}                                        
  Sockets,                                                     
  {$ENDIF}                                  
  GlobalSpaceDefines;


  //. ServiceOperation definitions (transferred from unitServiceOperation.cs)
Const
  MessageOrigin = 6; //. SizeOf(UserID)+SizeOf(Encryption)+SizeOf(Packing);
  MessageProtocolSize = 12; //. SizeOf(UserID)+SizeOf(Encryption)+SizeOf(Packing) + SizeOf(Session)+SizeOf(CRC);
  
Type

  TPackingMethod = (
    pmNone = 0,
    pmZIP = 1,
    pmRAR = 2
  );

  TEncryptionMethod = (
    emNone = 0,
    emSimpleByPassword = 1
  );                                                       
                                                                              
  TSuccessCode = (                                                 
    scOK = 0,                                           
    scOKWithHint = 1,
    scOKWithWarning = 2,                                       
    scOKWithNewOperation = 3                                      
  );

  TErrorCode = (                                        
    //. abstract errors
    errUnknown = -1,
    errDataIsNotFound = -2,
    errNullData = -3,
    errBadData = -4,
    errDataOutOfMemory = -5,
    //. connection errors (ErrorBase: -1000)
    errConnectionError = -1000,
    errConnectionReadWriteTimeOut = -1001,                 
    errConnectionIsClosedUnexpectedly = -1002,           
    errConnectionIsClosedGracefully = -1003,
    errConnectionIsClosedByCheckpointTimeout = -1004,
    errConnectionIsClosedByWorkerThreadTermination = -1005,
    errConnectionNodeIsOutOfMemory = -1006,
    //. message errors (ErrorBase: -2000)
    errMessageError = -2000,                             
    errMessageUserIsUnknown = -2001,
    errMessageUserIsChanged = -2002,
    errMessageEncryptionIsUnknown = -2003,                  
    errMessagePackingIsUnknown = -2004,
    errMessageDecryptionIsFailed = -2005,
    errMessageUnpackingIsFailed = -2006,
    errMessageIntegrityCheckIsFailed = -2007,
    errMessageIsOutOfMemory = -2008,
    //. service operation errors (ErrorBase: -3000)
    errOperationError = -3000,
    errOperationUnknownService = -3001,
    errOperationServiceIsNotSupported = -3002,
    errOperationUserAccessIsDenied = -3003,
    errOperationSessionIsChanged = -3004,
    errOperationPollingTimeout = -3005,
    errOperationProcessingTimeout = -3006,
    //. control service operation errors (ErrorBase: -4000)
    //.
    //. object service operation errors (ErrorBase: -5000)          
    errObjectOperationError = -5000,
    errObjectOperationUnknownObject = -5001,
    errObjectOperationObjectUserIsBad = -5002,
    errObjectOperationObjectIsChanged = -5003,
    //. device service operation errors (ErrorBase: -6000)
    //.
    //. object-device conponent service operation errors (ErrorBase: -7000)
    //.
    //. object component service operation errors (ErrorBase: -8000)
    errObjectComponentOperationError = -8000,
    errObjectComponentOperation_ComponentObjectModelIsNotExist = -8001,
    errObjectComponentOperation_AddressIsNotFound = -8002,
    errObjectComponentOperation_AddressIsDisabled = -8003,
    errObjectComponentOperation_SetValueError = -8004,
    errObjectComponentOperation_GetValueError = -8005,
    errObjectComponentOperation_SetGetValueError = -8006,
    errObjectComponentOperation_GetSetValueError = -8007
    //. device component service operation errors (ErrorBase: -9000)
    //.
  );

  TErrorCodeString = record
    Code: integer;
    Message: string;
  end;

Const
  SuccessCodeStrings: array [TSuccessCode] of string = (
    'OK',
    'OK with hint',
    'OK with warning',
    'OK with new operation'
  );

  ErrorCodeStringsCount = 43;
  ErrorCodeStrings: array[0..ErrorCodeStringsCount-1] of TErrorCodeString = (
    (Code:          -1; Message: 'Unknown'),
    (Code:          -2; Message: 'Data is not found'),
    (Code:          -3; Message: 'Null data'),
    (Code:          -4; Message: 'Bad data'),
    (Code:          -5; Message: 'Data out of memory'),
    //. connection errors (ErrorBase: -1000)
    (Code:       -1000; Message: 'Connection error'),
    (Code:       -1001; Message: 'Connection read/write timeout'),
    (Code:       -1002; Message: 'Connection is closed unexpectedly'),
    (Code:       -1003; Message: 'Connection is closed gracefully'),
    (Code:       -1004; Message: 'Connection is closed by checkpoint timeout'),
    (Code:       -1005; Message: 'Connection is closed by worker thread termination'),
    (Code:       -1006; Message: 'Connection node is out of memory'),
    //. message errors (ErrorBase: -2000)
    (Code:       -2000; Message: 'Message error'),
    (Code:       -2001; Message: 'Message user is unknown'),
    (Code:       -2002; Message: 'Message user is changed during the session'),
    (Code:       -2003; Message: 'Message encryption is unknown'),
    (Code:       -2004; Message: 'Message packing is unknown'),
    (Code:       -2005; Message: 'Message decryption is failed'),
    (Code:       -2006; Message: 'Message unpacking is failed'),
    (Code:       -2007; Message: 'Message integrity checking is failed'),
    (Code:       -2008; Message: 'Message is out of memory'),
    //. service operation errors (ErrorBase: -3000)
    (Code:       -3000; Message: 'Operation error'),
    (Code:       -3001; Message: 'Operation service is unknown'),
    (Code:       -3002; Message: 'Operation service is not supported'),
    (Code:       -3003; Message: 'Operation user access is denied'),
    (Code:       -3004; Message: 'Operation session is changed'),
    (Code:       -3005; Message: 'Operation pulling timeout'),
    (Code:       -3006; Message: 'Operation processing timeout'),
    (Code:       -3007; Message: 'Operation pool is busy'),
    //. control service operation errors (ErrorBase: -4000)
    //. object service operation errors (ErrorBase: -5000)
    (Code:       -5000; Message: 'Object operation error'),
    (Code:       -5001; Message: 'Object operation object is unknown'),
    (Code:       -5002; Message: 'Object operation object user is bad'),
    (Code:       -5003; Message: 'Object operation object is changed during the session'),
    //. object control service operation errors (ErrorBase: -6000)
    //. object component service operation errors (ErrorBase: -8000)
    (Code:       -8000; Message: 'Object component operation error'),
    (Code:       -8001; Message: 'Component object model is not exist'),
    (Code:       -8002; Message: 'Component address is not found'),
    (Code:       -8003; Message: 'Component address is disabled'),
    (Code:       -8004; Message: 'Component set value error'),
    (Code:       -8005; Message: 'Component get value error'),
    (Code:       -8006; Message: 'Component set-get value error'),
    (Code:       -8007; Message: 'Component get-set value error'),
    (Code:       -8008; Message: 'Component object model is not supported'),
    (Code:       -8009; Message: 'Component value data is invalid')
  );

  function GetErrorCodeMessage(const pCode: integer): string;

Type
  OperationException = class(Exception)
  public
    Code: integer;

    Constructor Create(const pCode: integer); overload;
    Constructor Create(const pCode: integer; const pMessage: string); overload;
  end;

  TGeographUserObjectDataV0 = record
    ID: integer;
    ObjectName: shortstring;
    LastCheckpointTime: TDateTime;
    CheckpointInterval: smallint;
    GeoDistanceThreshold: smallint;
    ObjectType: word;
    ObjectDatumID: integer;
    GeoSpaceID: integer;
    idTVisualization: integer;
    idVisualization: integer;
    idHint: integer;
  end;

  {GEOGraphServerController}
  TGEOGraphServerObjectController = class
  private
    flUserDirectConnection: boolean;
    {$IFNDEF Plugin}
    ServerSocket: TTcpClient;
    {$ENDIF}
    UserID: integer;
    UserName: string;
    UserPassword: string;
    NextOperationSession: smallint;

    {$IFNDEF Plugin}
    procedure Connection_WriteData(var Data; const DataSize: integer);
    procedure Connection_ReadData(var Data; const DataSize: integer);
    {$ENDIF}
    //.
    function GetOperationSession: smallint;
    //.
    procedure PackMessage(const Packing: byte;  var Message: TByteArray; var Origin: integer);
    procedure EncryptMessage(const Encryption: byte; const UserPassword: string;  var Message: TByteArray; var Origin: integer);
    procedure DecryptMessage(const UserPassword: string;  var Message: TByteArray; var Origin: integer);
    procedure UnPackMessage(var Message: TByteArray; var Origin: integer);
    //. abstract operation message properties routines
    procedure SetMessageSession(const Session: smallint; const Message: TByteArray);
    function GetMessageSession(const Message: TByteArray): smallint;
    procedure SetMessageIntegrity(var Message: TByteArray; var Origin: integer);
    procedure CheckMessageIntegrity(const Message: TByteArray; const Origin: integer);
    //. service message properties routines
    procedure SetMessageSID(const SID: smallint; const Message: TByteArray;  var Idx: integer);
    function GetMessageSID(const Message: TByteArray;  var Idx: integer): smallint;
    //. message coding/decoding routines
    procedure EncodeMessage(const Session: smallint; const Packing: byte; const UserID: integer; const UserPassword: string; const Encryption: byte;  var Message: TByteArray);
    procedure DecodeMessage(const pUserID: integer; const UserPassword: string; const pSession: smallint; var Message: TByteArray; var Origin: integer);
    //.
    procedure Operation_Start;
    procedure Operation_Finish;                      
    procedure Operation_Execute(const OperationSession: smallint; const MessageEncryption: byte; const MessagePacking: byte; var Data: TByteArray; var Origin: integer; var DataSize: integer);
  public
    ServerAddress: string;                                                      
    idGeoGraphServerObject: integer;                     
    ObjectID: integer;                                                     
    flKeepConnection: boolean;                                  
    flConnected: boolean;                                             
                                                   
    Constructor Create(const pidGeoGraphServerObject: integer; const pObjectID: integer; const pUserID: integer; const pUserName: string; const pUserPassword: string; const pServerAddress: string; const pServerPort: integer; const pflKeepConnection: boolean = false);
    Destructor Destroy; override;
    {$IFNDEF Plugin}
    procedure Connect;
    procedure Disconnect;
    {$ENDIF}
    //. Object Operations
    function ObjectOperation_SetComponentDataCommand(const Address: TByteArray; const Value: TByteArray): integer;
    function ObjectOperation_SetComponentDataCommand2(const Address: TByteArray; const Value: TByteArray): integer; //. with component specific user access(write) check
    function ObjectOperation_SetComponentDataCommand1(const Address: string; const Value: string): integer;
    function ObjectOperation_AddressDataSetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
    function ObjectOperation_AddressDataSetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer; //. with component specific user access(write) check
    function ObjectOperation_BatchSetComponentDataCommand1(const Address: string; const Value: string): integer;
    function ObjectOperation_GetComponentDataCommand(const Address: TByteArray; out Value: TByteArray): integer;
    function ObjectOperation_GetComponentDataCommand2(const Address: TByteArray; out Value: TByteArray): integer; //. with component specific user access(read) check
    function ObjectOperation_GetComponentDataCommand1(const Address: string; out Value: string): integer;
    function ObjectOperation_AddressDataGetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
    function ObjectOperation_AddressDataGetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer; //. with component specific user access(read) check
    //.
    function ObjectOperation_GetCheckpoint(out LastCheckpointTime: TDateTime; out CheckpointInterval: smallint): integer;
    function ObjectOperation_GetData(const Version: word; out oData: TGeographUserObjectDataV0): integer;
    function ObjectOperation_GetDayLogData(const DayDate: TDateTime; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
    function ObjectOperation_GetDaysLogData(const DaysDate: TDateTime; const DaysCount: word; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
    //. Device Operations
    function DeviceOperation_SetComponentDataCommand(const Address: TByteArray; const Value: TByteArray): integer;
    function DeviceOperation_SetComponentDataCommand2(const Address: TByteArray; const Value: TByteArray): integer; //. with component specific user access(write) check
    function DeviceOperation_SetComponentDataCommand1(const Address: string; const Value: string): integer;
    function DeviceOperation_AddressDataSetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
    function DeviceOperation_AddressDataSetComponentDataCommand2(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer; //. with component specific user access(write) check
    function DeviceOperation_GetComponentDataCommand(const Address: TByteArray; out Value: TByteArray): integer;
    function DeviceOperation_GetComponentDataCommand2(const Address: TByteArray; out Value: TByteArray): integer; //. with component specific user access(read) check
    function DeviceOperation_GetComponentDataCommand1(const Address: string; out Value: string): integer;
    function DeviceOperation_AddressDataGetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
    function DeviceOperation_AddressDataGetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer; //. with component specific user access(read) check
    //.
    function ObjectOperation_SetCheckpointInterval(const NewCheckpointInterval: smallint): integer;
    function ObjectOperation_SetGeoDistanceThreshold(const NewValue: smallint): integer;
    function ObjectOperation_ExecuteCommand(const InData: TByteArray; out OutData: TByteArray): integer;
    //. Server control operations
    function ServerOperation_GetLogData(const LogID: word; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
  end;


implementation
Uses
  {$IFNDEF Plugin}
  Functionality,
  TypesFunctionality,                       
  {$ELSE}
  FunctionalityImport,
  {$ENDIF}                                         
  TypesDefines;



function GetErrorCodeMessage(const pCode: integer): string;
var
  I: integer;
begin
for I:=0 to ErrorCodeStringsCount-1 do
  if (ErrorCodeStrings[I].Code = pCode)
   then begin
    Result:=ErrorCodeStrings[I].Message;
    Exit; //. ->
    end;
Result:='Unrecognized error with code: '+IntToStr(pCode);
end;


{OperationException}
Constructor OperationException.Create(const pCode: integer);
begin
Inherited Create('');
Code:=pCode;
end;

Constructor OperationException.Create(const pCode: integer; const pMessage: string);
begin
Inherited Create(pMessage);
Code:=pCode;
end;


{TGEOGraphServerObjectController}
Constructor TGEOGraphServerObjectController.Create(const pidGeoGraphServerObject: integer; const pObjectID: integer; const pUserID: integer; const pUserName: string; const pUserPassword: string; const pServerAddress: string; const pServerPort: integer; const pflKeepConnection: boolean);
begin
Inherited Create();
ServerAddress:=pServerAddress;
idGeoGraphServerObject:=pidGeoGraphServerObject;
ObjectID:=pObjectID;
//.
flUserDirectConnection:=false;
//.
{$IFNDEF Plugin}
ServerSocket:=TTcpClient.Create(nil);
with ServerSocket do begin
RemoteHost:=pServerAddress;
RemotePort:=IntToStr(pServerPort);
end;
{$ENDIF}
flKeepConnection:=pflKeepConnection;
flConnected:=false;
//.
UserID:=pUserID;
UserName:=pUserName;
UserPassword:=pUserPassword;
NextOperationSession:=1;
end;

Destructor TGEOGraphServerObjectController.Destroy;
begin
{$IFNDEF Plugin}
if (flUserDirectConnection AND flConnected) then Disconnect();
ServerSocket.Free;
{$ENDIF}
Inherited;
end;

{$IFNDEF Plugin}
procedure TGEOGraphServerObjectController.Connection_WriteData(var Data; const DataSize: integer);
var
  ActualSize: integer;
begin
ActualSize:=ServerSocket.SendBuf(Data,DataSize);
if (ActualSize <> DataSize) then Raise Exception.Create('could not send via connection'); //. =>
end;

procedure TGEOGraphServerObjectController.Connection_ReadData(var Data; const DataSize: integer);
var
  ActualSize: integer;
  SummarySize: integer;
begin
SummarySize:=0;
while (SummarySize < DataSize) do begin
  ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(@Data)+SummarySize)^,DataSize-SummarySize);
  if (ActualSize <= 0) then Raise Exception.Create('could not receive via connection'); //. =>
  Inc(SummarySize,ActualSize);
  end;
end;
{$ENDIF}

function TGEOGraphServerObjectController.GetOperationSession: smallint;
begin
Result:=NextOperationSession;
Inc(NextOperationSession);
if (NextOperationSession > 30000) then NextOperationSession:=1;
end;

procedure TGEOGraphServerObjectController.PackMessage(const Packing: byte;  var Message: TByteArray; var Origin: integer);
begin
//. packing message
case TPackingMethod(Packing) of
pmNone: ;//. do nothing
else
  Raise OperationException.Create(Integer(errMessagePackingIsUnknown)); //. =>
end;
//. set Packing method
Origin:=Origin-1{SizeOf(Packing)};
Message[Origin]:=Packing;
end;

procedure TGEOGraphServerObjectController.EncryptMessage(const Encryption: byte; const UserPassword: string;  var Message: TByteArray; var Origin: integer);
begin
//. encrypting message
case TEncryptionMethod(Encryption) of
emNone: ;//. do nothing
else
  Raise OperationException.CReate(Integer(errMessageEncryptionIsUnknown)); //. =>
end;
//. set Encryption method
Origin:=Origin-1{SizeOf(Encryption)};
Message[Origin]:=Encryption;
end;

procedure TGEOGraphServerObjectController.DecryptMessage(const UserPassword: string;  var Message: TByteArray; var Origin: integer);
var
  Encryption: byte;
begin
//. get Encryption method
Encryption:=Message[Origin]; Inc(Origin);
//. decrypting message
case TEncryptionMethod(Encryption) of
emNone: ; //. do nothing
else
  Raise OperationException.Create(Integer(errMessageEncryptionIsUnknown)); //. =>
end;
end;

procedure TGEOGraphServerObjectController.UnPackMessage(var Message: TByteArray; var Origin: integer);
var
  Packing: byte;
begin
//. get Packing method
Packing:=Message[Origin]; Inc(Origin);
//. un-packing message
case TPackingMethod(Packing) of
pmNone: ;//. do nothing
else
  Raise OperationException.Create(Integer(errMessagePackingIsUnknown)); //. =>
end;
end;

//. abstract operation message properties routines
procedure TGEOGraphServerObjectController.SetMessageSession(const Session: smallint; const Message: TByteArray);
var
  Idx: integer;
begin
Idx:=Length(Message)-4{SizeOf(CRC)}-2{SizeOf(Session)};
SmallInt(Pointer(Integer(@Message[0])+Idx)^):=Session;
end;

function TGEOGraphServerObjectController.GetMessageSession(const Message: TByteArray): smallint;
var
  Idx: integer;
begin
Idx:=Length(Message)-4{SizeOf(CRC)}-2{SizeOf(Session)};
Result:=SmallInt(Pointer(Integer(@Message[0])+Idx)^);
end;

procedure TGEOGraphServerObjectController.SetMessageIntegrity(var Message: TByteArray; var Origin: integer);
var
  V: dword;
  Idx: integer;
  CRC: dword;
begin
CRC:=0;
Idx:=Origin;
while (Idx < (Length(Message)-4{SizeOf(CRC)})) do begin
  V:=Message[Idx];
  CRC:=(((CRC+V) SHL 1) XOR V);
  //.
  Inc(Idx);
  end;
DWord(Pointer(Integer(@Message[0])+Idx)^):=CRC;
end;

procedure TGEOGraphServerObjectController.CheckMessageIntegrity(const Message: TByteArray; const Origin: integer);
var
  V: dword;
  Idx: integer;
  CRC: dword;
begin
CRC:=0;
Idx:=Origin;
while (Idx < (Length(Message)-4{SizeOf(CRC)})) do begin
  V:=Message[Idx];
  CRC:=(((CRC+V) SHL 1) XOR V);
  //.
  Inc(Idx);
  end;
if (DWord(Pointer(Integer(@Message[0])+Idx)^) <> CRC)
 then Raise OperationException.Create(Integer(errMessageIntegrityCheckIsFailed),'message integrity checking is failed'); //. =>
end;

//. service message properties routines
procedure TGEOGraphServerObjectController.SetMessageSID(const SID: smallint; const Message: TByteArray;  var Idx: integer);
begin
SmallInt(Pointer(Integer(@Message[0])+Idx)^):=SID; Inc(Idx,2{SizeOf(SID)});
end;

function TGEOGraphServerObjectController.GetMessageSID(const Message: TByteArray;  var Idx: integer): smallint;
begin
Result:=SmallInt(Pointer(Integer(@Message[0])+Idx)^); Inc(Idx,2{SizeOf(SID)});
end;


//. message coding/decoding routines
procedure TGEOGraphServerObjectController.EncodeMessage(const Session: smallint; const Packing: byte; const UserID: integer; const UserPassword: string; const Encryption: byte;  var Message: TByteArray);
var
  Idx: integer;
begin
//. set message operation session
SetMessageSession(Session,Message);
//. skip descriptors in message
Idx:=MessageOrigin;
//. set message integrity
SetMessageIntegrity(Message,Idx);
//. pack message
PackMessage(Packing,  Message,Idx);
//. encrypt message
EncryptMessage(Encryption,UserPassword, Message,Idx);
//. set UserID
Idx:=Idx-4{SizeOf(UserID)};
Integer(Pointer(Integer(@Message[0])+Idx)^):=UserID;
end;

procedure TGEOGraphServerObjectController.DecodeMessage(const pUserID: integer; const UserPassword: string; const pSession: smallint; var Message: TByteArray; var Origin: integer);
var
  Idx: integer;
  UserID: integer;
  Session: smallint;
begin
Idx:=0;
//. get UserID,Encryption method and fetch UserPassword
UserID:=Integer(Pointer(Integer(@Message[0])+Idx)^); Inc(Idx,4{SizeOf(UserID)});
if (UserID <> pUserID) then Raise OperationException.Create(Integer(errMessageUserIsChanged),'user is changed during connection with ID: '+IntToStr(UserID)); //. =>
//. decrypt message
DecryptMessage(UserPassword, Message,Idx);
//. unpack message
UnPackMessage(Message,Idx);
//. check message integrity
CheckMessageIntegrity(Message,Idx);
//.
Origin:=Idx;
//. get message operation session
Session:=GetMessageSession(Message);
if (Session <> pSession) then Raise OperationException.Create(Integer(errUnknown),'session is changed during connection with ID: '+IntToStr(UserID)); //. =>
end;

{$IFNDEF Plugin}
procedure TGEOGraphServerObjectController.Connect;
begin
if (NOT ServerSocket.Connect()) then Raise Exception.Create('could not connect to the server ('+ServerSocket.RemoteHost+':'+ServerSocket.RemotePort+')'); //. =>
flConnected:=true;
end;

procedure TGEOGraphServerObjectController.Disconnect;
var
  DataSize: integer;
begin
try
//. send "Bye" command
DataSize:=0;
Connection_WriteData(DataSize,SizeOf(DataSize));
except
  end;
//.
ServerSocket.Disconnect();
flConnected:=false;
end;
{$ENDIF}


procedure TGEOGraphServerObjectController.Operation_Start;
begin
{$IFNDEF Plugin}
if (flUserDirectConnection)
 then begin
  if (NOT flConnected) then Connect();
  end;
{$ENDIF}
end;

procedure TGEOGraphServerObjectController.Operation_Finish;
begin
{$IFNDEF Plugin}
if (flUserDirectConnection)
 then begin
  if (NOT flKeepConnection) then Disconnect();
  end;
{$ENDIF}
end;

procedure TGEOGraphServerObjectController.Operation_Execute(const OperationSession: smallint; const MessageEncryption: byte; const MessagePacking: byte; var Data: TByteArray; var Origin: integer; var DataSize: integer);
var
  SOF: TGeoGraphServerObjectFunctionality;
  InDataSize: integer;
  InData: TByteArray;
  Idx: integer;
  OutDataSize: integer;
  OutData: TByteArray;
begin
if (NOT flUserDirectConnection)
 then begin //. execute via TGeographServerObject gate
  SOF:=TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject));
  try
  TComponentFunctionality(SOF).SetUser(UserName,UserPassword);
  //.
  InDataSize:=DataSize-MessageProtocolSize{skip message protocol}+4;
  SetLength(InData,InDataSize);
  Idx:=0;
  Integer(Pointer(Integer(@InData[0])+Idx)^):=InDataSize; Inc(Idx,SizeOf(InDataSize)); //. prepare DataSize
  Move(Pointer(Integer(@Data[0])+MessageOrigin{skip message protocol})^,Pointer(Integer(@InData[0])+Idx)^,DataSize-MessageProtocolSize{skip message protocol});
  //.
  SOF.ExecuteOperation(InData, OutData);
  //.
  OutDataSize:=Length(OutData);
  Data:=OutData;
  Origin:=4; //. skip SizeOf(DataSize)
  DataSize:=OutDataSize-4{skip DataSize};
  finally
  SOF.Release;
  end;
  end
 else begin //. execute direct via socket
  {$IFNDEF Plugin}
  //. encode message
  EncodeMessage(OperationSession,MessagePacking,UserID,UserPassword,MessageEncryption,Data);
  DataSize:=Length(Data);
  //. send operation message
  Connection_WriteData(DataSize,SizeOf(DataSize));
  Connection_WriteData(Pointer(@Data[0])^,DataSize);
  //. waiting for and get a response message
  repeat
    Connection_ReadData(DataSize,SizeOf(DataSize));
  until (DataSize > 0); //. skip a check-connection message
  SetLength(Data,DataSize);
  Connection_ReadData(Pointer(@Data[0])^,DataSize);
  //. decode message
  DecodeMessage(UserID,UserPassword,OperationSession, Data,Origin);
  //.
  DataSize:=Length(Data)-(2{SizeOf(Session)}+4{SizeOf(CRC)});
  {$ENDIF}
  end;
end;

//. Object Operations
function TGEOGraphServerObjectController.ObjectOperation_SetComponentDataCommand(const Address: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 501; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_SetComponentDataCommand2(const Address: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 507; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_SetComponentDataCommand1(const Address: string; const Value: string): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 500; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+(2+Length(Address))+(2+Length(Value)); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Address); Inc(Idx,SizeOf(Word));
Move(Pointer(@Address[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Value); Inc(Idx,SizeOf(Word));
Move(Pointer(@Value[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_AddressDataSetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 505; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//.
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_AddressDataSetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 506; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//.
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_BatchSetComponentDataCommand1(const Address: string; const Value: string): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 503; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+(2+Length(Address))+(2+Length(Value)); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                 
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Address); Inc(Idx,SizeOf(Word));
Move(Pointer(@Address[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Value); Inc(Idx,SizeOf(Word));
Move(Pointer(@Value[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetComponentDataCommand(const Address: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5501; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetComponentDataCommand2(const Address: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5503; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetComponentDataCommand1(const Address: string; out Value: string): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5500; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Value:='';
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+(2+Length(Address)); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Address); Inc(Idx,SizeOf(Word));
Move(Pointer(@Address[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,Word(Pointer(Integer(@Data[0])+Origin)^)); Inc(Origin,SizeOf(Word));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[1])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_AddressDataGetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5502; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)

 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_AddressDataGetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5504; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)

 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetCheckpoint(out LastCheckpointTime: TDateTime; out CheckpointInterval: smallint): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5000; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode >= 0)
 then begin
  //. parsing received data
  Idx:=Origin;
  LastCheckpointTime:=Double(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(LastCheckpointTime));
  CheckpointInterval:=SmallInt(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(CheckpointInterval));
  end
 else Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetData(const Version: word; out oData: TGeographUserObjectDataV0): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5200; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
  W: word;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+2; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Version;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode >= 0)
 then begin
  //. persing received data
  Idx:=Origin;
  oData.ID:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.ID));
  W:=Word(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(W));
  SetLength(oData.ObjectName,Byte(W));
  Move(Pointer(Integer(@Data[0])+Idx)^,Pointer(@oData.ObjectName[1])^,Length(oData.ObjectName)); Inc(Idx,W);
  oData.LastCheckpointTime:=Double(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.LastCheckpointTime));
  oData.CheckpointInterval:=SmallInt(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.CheckpointInterval));
  oData.GeoDistanceThreshold:=SmallInt(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.GeoDistanceThreshold));
  oData.ObjectType:=Word(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.ObjectType));
  oData.ObjectDatumID:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.ObjectDatumID));
  oData.GeoSpaceID:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.GeoSpaceID));
  oData.idTVisualization:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.idTVisualization));
  oData.idVisualization:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.idVisualization));
  oData.idHint:=Integer(Pointer(Integer(@Data[0])+Idx)^); Inc(Idx,SizeOf(oData.idHint));
  end
 else Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally                                                             
Operation_Finish;                      
end;                                                                      
end;
                                                   
function TGEOGraphServerObjectController.ObjectOperation_GetDayLogData(const DayDate: TDateTime; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 5300; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
  LogData: TByteArray;                                                  
begin
LogDataStream:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+10; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Double(Pointer(Integer(@Data[0])+Idx)^):=Double(DayDate); Inc(Idx,SizeOf(Double));
Word(Pointer(Integer(@Data[0])+Idx)^):=DataFormat;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode >= 0)
 then begin
  SetLength(LogData,DataSize-SizeOf(ResultCode));
  Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@LogData[0])^,Length(LogData));
  LogDataStream:=TMemoryStream.Create();
  try
  LogDataStream.Write(Pointer(@LogData[0])^,Length(LogData));
  except
    FreeAndNil(LogDataStream);
    Raise; //. =>
    end;
  end
 else begin
  case ResultCode of
  -1000001: Raise OperationException.Create(ResultCode,'Data format is not supported'); //. =>
  -1000002: Raise OperationException.Create(ResultCode,'Data is not found'); //. =>
  else
    Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
  end;
  end;
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_GetDaysLogData(const DaysDate: TDateTime; const DaysCount: word; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 9901; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
  LogData: TByteArray;                                                  
begin                                         
LogDataStream:=nil;
//.                                               
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+12; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Double(Pointer(Integer(@Data[0])+Idx)^):=Double(DaysDate); Inc(Idx,SizeOf(Double));
Word(Pointer(Integer(@Data[0])+Idx)^):=DaysCount; Inc(Idx,SizeOf(Word));
Word(Pointer(Integer(@Data[0])+Idx)^):=DataFormat;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode >= 0)
 then begin
  SetLength(LogData,DataSize-SizeOf(ResultCode));
  Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@LogData[0])^,Length(LogData));
  LogDataStream:=TMemoryStream.Create();
  try
  LogDataStream.Write(Pointer(@LogData[0])^,Length(LogData));
  except
    FreeAndNil(LogDataStream);
    Raise; //. =>
    end;
  end
 else begin
  case ResultCode of
  -1000001: Raise OperationException.Create(ResultCode,'Data format is not supported'); //. =>
  -1000002: Raise OperationException.Create(ResultCode,'Data is not found'); //. =>
  -1000003: Raise OperationException.Create(ResultCode,'Date interval is too long'); //. =>
  else
    Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
  end;
  end;
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

//. Device Operations
function TGEOGraphServerObjectController.DeviceOperation_SetComponentDataCommand(const Address: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30500; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_SetComponentDataCommand2(const Address: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30503; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_SetComponentDataCommand1(const Address: string; const Value: string): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30501; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+(2+Length(Address))+(2+Length(Value)); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Address); Inc(Idx,SizeOf(Word));
Move(Pointer(@Address[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Value); Inc(Idx,SizeOf(Word));
Move(Pointer(@Value[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_AddressDataSetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30502; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//.
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_AddressDataSetComponentDataCommand2(const Address: TByteArray; const AddressData: TByteArray; const Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30506; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData)+Length(Value); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//.
Move(Pointer(@Value[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Value));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_GetComponentDataCommand(const Address: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 35100; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin 
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                             
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_GetComponentDataCommand2(const Address: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 35103; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin 
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                             
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_GetComponentDataCommand1(const Address: string; out Value: string): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 35101; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin 
Value:='';
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+(2+Length(Address)); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                             
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=Length(Address); Inc(Idx,SizeOf(Word));
Move(Pointer(@Address[1])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,Word(Pointer(Integer(@Data[0])+Origin)^)); Inc(Origin,SizeOf(Word));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[1])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_AddressDataGetComponentDataCommand(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 35102; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin 
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                             
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.DeviceOperation_AddressDataGetComponentDataCommand1(const Address: TByteArray; const AddressData: TByteArray; out Value: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 35104; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin 
Value:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(Address)+4+Length(AddressData); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;                             
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
//.
Move(Pointer(@Address[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(Address)); Inc(Idx,Length(Address));
//.
Integer(Pointer(Integer(@Data[0])+Idx)^):=Length(AddressData); Inc(Idx,SizeOf(Integer));
if (Length(AddressData) > 0) then Move(Pointer(@AddressData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(AddressData)); Inc(Idx,Length(AddressData)); 
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(Value,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@Value[0])^,Length(Value));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_SetCheckpointInterval(const NewCheckpointInterval: smallint): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30000; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
//.
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+8; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=NewCheckpointInterval;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^);
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
Result:=ResultCode;
//.
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_SetGeoDistanceThreshold(const NewValue: smallint): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30400; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
Operation_Start;
try
//.
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+8; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=NewValue;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^);
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
Result:=ResultCode;
//.
finally
Operation_Finish;
end;
end;

function TGEOGraphServerObjectController.ObjectOperation_ExecuteCommand(const InData: TByteArray; out OutData: TByteArray): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 30100; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
begin
OutData:=nil;
//.
Operation_Start;
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+Length(InData); //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message for in-data
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Move(Pointer(@InData[0])^,Pointer(Integer(@Data[0])+Idx)^,Length(InData));
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode < 0)
 then Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//. get result out-data
SetLength(OutData,DataSize-SizeOf(ResultCode));
Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@OutData[0])^,Length(OutData));
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;


function TGEOGraphServerObjectController.ServerOperation_GetLogData(const LogID: word; const DataFormat: word; out LogDataStream: TMemoryStream): integer;
const
  MessagePacking = Byte(pmNone);
  MessageEncryption = Byte(emNone);
  SID = 60000; //. this operation SID
var
  OperationSession: smallint;
  DataSize: integer;
  Data: TByteArray;
  Origin: integer;
  Idx: integer;
  ResultCode: integer;
  LogData: TByteArray;
begin
LogDataStream:=nil;
//.
Operation_Start;                                                 
try
OperationSession:=GetOperationSession();
DataSize:=MessageProtocolSize+6+4; //. this operation message size
SetLength(Data,DataSize);
Origin:=MessageOrigin;
//. fill message
Idx:=Origin;
Word(Pointer(Integer(@Data[0])+Idx)^):=SID; Inc(Idx,SizeOf(SID));
Integer(Pointer(Integer(@Data[0])+Idx)^):=ObjectID; Inc(Idx,SizeOf(ObjectID));
Word(Pointer(Integer(@Data[0])+Idx)^):=LogID; Inc(Idx,SizeOf(LogID));
Word(Pointer(Integer(@Data[0])+Idx)^):=DataFormat;
//. execute
Operation_Execute(OperationSession,MessageEncryption,MessagePacking, Data,Origin,DataSize);
//. get result code
ResultCode:=Integer(Pointer(Integer(@Data[0])+Origin)^); Inc(Origin,SizeOf(ResultCode));
if (ResultCode >= 0)
 then begin
  SetLength(LogData,DataSize-SizeOf(ResultCode));
  Move(Pointer(Integer(@Data[0])+Origin)^,Pointer(@LogData[0])^,Length(LogData));
  LogDataStream:=TMemoryStream.Create();
  try
  LogDataStream.Write(Pointer(@LogData[0])^,Length(LogData));
  except
    FreeAndNil(LogDataStream);
    Raise; //. =>                                                     
    end;
  end
 else Raise OperationException.Create(ResultCode,GetErrorCodeMessage(ResultCode)); //. =>
//.
Result:=ResultCode;
finally
Operation_Finish;
end;
end;


end.
