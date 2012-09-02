{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{         SOAP Transports                               }
{                                                       }
{       Copyright (c) 2001 Inprise Corporation          }
{                                                       }
{*******************************************************}
{$IFDEF LINUX}
{$DEFINE USE_INDY}
{$ENDIF}
{$IFDEF MSWINDOWS}
//{$DEFINE USE_INDY}
{$ENDIF}

unit SOAPHTTPTrans;

interface

uses
  SysUtils, Classes, WebNode, WSDLNode, Types, IntfInfo, WSDLIntf, SOAPAttachIntf,
{$IFDEF USE_INDY}
IdHTTP, IdIOHandlerSocket, IdSSLOpenSSL;
{$ELSE}
  WinSock, WinInet;
(*$HPPEMIT '#pragma link "wininet.lib"' *)
{$ENDIF}
type

  ESOAPHTTPException = class(Exception)
  private
    FStatusCode: Integer;
  public
    constructor Create(const Msg: string; SCode: Integer = 0);
    constructor CreateFmt(const Msg: string; const Args: array of const; SCode: Integer = 0);

    property StatusCode: Integer read FStatusCode write FStatusCode;
  end;

  SOAPInvokeOptions = (soNoValueForEmptySOAPAction,   { Send "" or absolutely no value for empty SOAPAction }
                       soIgnoreInvalidCerts,          { Handle Invalid Server Cert and ask HTTP runtime to ignore }
                       soNoSOAPActionHeader,          { Don't send SOAPAction - use very very carefully!! }
                       soAutoCheckAccessPointViaUDDI  { if we get a status code 404/405/410 - contact UDDI }
                       );
  TSOAPInvokeOptions= set of SOAPInvokeOptions;

  //. actions group exception
  EActionsGroup = class(Exception);
  
  //. actions group
  TActionsGroup = record
    ThreadID: DWord;
    flStarted: boolean;
    flFinished: boolean;
    Count: integer;
    ActionsNames: string;
    ActionsNamesIndex: integer;
    Request: TMemoryStream;
    Response: TMemoryStream;
  end;

  //. actions groups
  TActionsGroups = class(TThreadList)
  private
    function ActionsGroup_Started(const pThreadID: DWord; out ptrItem: pointer): boolean;
    function ActionsGroup_Finished(const pThreadID: DWord): boolean;
    procedure ActionsGroup_AddRequest(const ptrActionsGroup: pointer; const ActionName: string; const pRequest: TStream); overload;
    procedure ActionsGroup_SetResponse(const ptrActionsGroup: pointer; const pResponse: TStream);
    procedure ActionsGroup_GetNextActionResponse(const ptrActionsGroup: pointer; const ActionName: string; out oResponse: TStream);
    function GetGroup(const pThreadID: DWord): pointer;
  public
    function ActionsGroup_Start(const pThreadID: DWord): pointer; overload;
    function ActionsGroup_Start(const ptrActionsGroup: pointer): pointer; overload;
    procedure ActionsGroup_Finish(const ptrActionsGroup: pointer);
    procedure ActionsGroup_End(const ptrActionsGroup: pointer);
  end;

  THTTPReqResp = class;

  { Provides access to HTTPReqResp component }
  IHTTPReqResp = interface
  ['{5FA6A197-32DE-4225-BC85-216CB80D1561}']
    function GetHTTPReqResp: THTTPReqResp;
  end;
                                  
  TBeforePostEvent = procedure(const HTTPReqResp: THTTPReqResp; Data: Pointer) of object;
  TPostingDataEvent= procedure(Sent: Integer; Total: Integer) of object;
  TReceivingDataEvent= procedure(Read: Integer; Total: Integer) of object;

  THTTPReqResp = class(TComponent, IInterface, IWebNode, IHTTPReqResp)
  private
    FUserSetURL: Boolean;
    FRefCount: Integer;
    FOwnerIsComponent: Boolean;
    FConnected: Boolean;
    FURL: string;
    FAgent: string;
    FBindingType: TWebServiceBindingType;
    FMimeBoundary: string;
    FContentType: string;
    FUserName: string;
    FPassword: string;
    FURLHost: string;
    FURLSite: string;
    FURLPort: Integer;
    FURLScheme: Integer;
    FProxy: string;
    FProxyByPass: string;
{$IFNDEF USE_INDY}
    FInetRoot: HINTERNET;
    FInetConnect: HINTERNET;
{$ENDIF}
    FConnectTimeout: Integer;
    FSendTimeout: Integer;
    FReceiveTimeout: Integer;
    FWSDLView: TWSDLView;
    FSoapAction: string;
    FUseUTF8InHeader: Boolean;
    FInvokeOptions: TSOAPInvokeOptions;
    FUDDIBindingKey: WideString;
    FUDDIOperator: String;
    FOnBeforePost: TBeforePostEvent;
    FOnPostingData: TPostingDataEvent;
    FOnReceivingData: TReceivingDataEvent;
    FMaxSinglePostSize: Integer;
    ptrActionsGroup: pointer;

    procedure SetURL(const Value: string);
    function  GetSOAPAction: string;
    procedure SetSOAPAction(const SOAPAction: string);
    procedure SetWSDLView(const WSDLVIew: TWSDLView);
    function  GetSOAPActionHeader: string;
    procedure InitURL(const Value: string);
    procedure SetUsername(const NameValue: string);
    procedure SetPassword(const PasswordValue: string);
    procedure SetProxy(const ProxyValue: string);
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function GetMimeBoundary: string;
    procedure SetMimeBoundary(Value: string);
  public
    constructor Create(Owner: TComponent); override;
    class function NewInstance: TObject; override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
    function  GetHTTPReqResp: THTTPReqResp;
    procedure CheckContentType;
{$IFNDEF USE_INDY}
    procedure Check(Error: Boolean; ShowSOAPAction: Boolean = False);
    procedure Connect(Value: Boolean);
    function  Send(const ASrc: TStream): Integer; virtual;
    function  SendGet: Integer; virtual;
    procedure Receive(Context: Integer; Resp: TStream; IsGet: Boolean = False); virtual;
{$ENDIF}
{$IFDEF USE_INDY}
    procedure SetupIndy(IndyHttp: TIDHttp; Request: TStream);
{$ENDIF}
    procedure Get(Resp: TStream); virtual;
    {IWebNode}
    procedure BeforeExecute(const IntfMD: TIntfMetaData;
                            const MethMD: TIntfMethEntry;
                            MethodIndex: Integer;
                            AttachHandler: IMimeAttachmentHandler);
    procedure Execute(const DataMsg: String; Resp: TStream); overload; virtual;
    procedure Execute(const Request: TStream; Response: TStream); overload; virtual;
    function  Execute(const Request: TStream): TStream; overload; virtual;
    property  URL: string read FURL write SetURL;
    property  SoapAction: string read GetSOAPAction write SetSOAPAction;
    { Can these be exposed when using Indy too?? }
    property  ConnectTimeout: Integer read FConnectTimeout write FConnectTimeout;
    property  SendTimeout: Integer read FSendTimeout write FSendTimeout;
    property  ReceiveTimeout: Integer read FReceiveTimeout write FReceiveTimeout;
    property  MaxSinglePostSize: Integer read FMaxSinglePostSize write FMaxSinglePostSize;
  published
    property  WSDLView: TWSDLView read FWSDLView write SetWSDLView;
    property  Agent: string read FAgent write FAgent;
    property  UserName: string read FUserName write SetUserName;
    property  Password: string read FPassword write SetPassword;
    property  Proxy: string read FProxy write SetProxy;
    property  ProxyByPass: string read FProxyByPass write FProxyByPass;
    property  UseUTF8InHeader: Boolean read FUseUTF8InHeader write FUseUTF8InHeader;
    property  InvokeOptions: TSOAPInvokeOptions read FInvokeOptions write FInvokeOptions;
    property  UDDIBindingKey: WideString read FUDDIBindingKey write FUDDIBindingKey;
    property  UDDIOperator: String read FUDDIOperator write FUDDIOperator;

    { Events }
    property  OnBeforePost: TBeforePostEvent read FOnBeforePost write FOnBeforePost;
    property  OnPostingData: TPostingDataEvent read FOnPostingData write FOnPostingData;
    property  OnReceivingData: TReceivingDataEvent read FOnReceivingData write FOnReceivingData;
  end;

var
  //. actions groups by PAV
  ActionsGroups: TActionsGroups;
  
implementation


uses Variants, SOAPConst, XMLDoc, XMLIntf, InvokeRegistry, WSDLItems,
     SOAPAttach, UDDIHelper, AbZipPrc,AbUnzPrc {/// ? ZLib}, Cipher,Hash,unitProxySpace {encoding},
{$IFDEF MSWINDOWS}
Windows,
{$ENDIF}
{$IFNDEF USE_INDY}
xmldom;
{$ELSE}
IdIntercept, IdException, IdURI, IdGlobal, IdHeaderList, IdHTTPHeaderInfo;
{$ENDIF}

{$IFDEF USE_INDY}
procedure ParseURI(AURI: string; var VProtocol, VHost, VPath, VDocument,
                       VPort, VBookmark : string);
var
  URI: TIdURI;
begin
  URI := TIdURI.Create(AURI);
  try
    VProtocol := URI.Protocol;
    VHost := URI.Host;
    VPath := URI.Path;
    VDocument := URI.Document;
    VPort := URI.Port;
    VBookmark := URI.Bookmark;
  finally
    URI.Free;
  end;
end;
{$ENDIF}

constructor ESOAPHTTPException.Create(const Msg: string; SCode: Integer = 0);
begin
  inherited Create(Msg);
  FStatusCode := SCode;
end;

constructor ESOAPHTTPException.CreateFmt(const Msg: string; const Args: array of const; SCode: Integer = 0);
begin
  inherited CreateFmt(Msg, Args);
  FStatusCode := SCode;
end;


{TActionsGroups}
function TActionsGroups.ActionsGroup_Start(const ptrActionsGroup: pointer): pointer;
begin
with TActionsGroup(ptrActionsGroup^) do begin
if flStarted then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' already started'); //. =>
if NOT flFinished then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not finished'); //. =>
Count:=0;
ActionsNames:='';
flFinished:=false;
flStarted:=true;
Result:=ptrActionsGroup;
end;
end;

function TActionsGroups.ActionsGroup_Start(const pThreadID: DWord): pointer;
var
  ptrItem,ptrNewItem: pointer;
begin
ptrItem:=GetGroup(pThreadID);
if (ptrItem = nil)
 then begin
  GetMem(ptrNewItem,SizeOf(TActionsGroup));
  FillChar(ptrNewItem^,SizeOf(TActionsGroup), 0);
  with TActionsGroup(ptrNewItem^) do begin
  ThreadID:=pThreadID;
  Count:=0;
  Request:=nil;
  Response:=nil;
  flFinished:=false;
  flStarted:=true;
  end;
  Self.Add(ptrNewItem);
  Result:=ptrNewItem;
  end
 else with TActionsGroup(ptrItem^) do begin
  if flStarted then Raise Exception.Create('actions group for thread #'+IntToStr(pThreadID)+' already started'); //. =>
  if NOT flFinished then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not finished'); //. =>
  Count:=0;
  ActionsNames:='';
  FreeAndNil(Request);
  FreeAndNil(Response);
  flFinished:=false;
  flStarted:=true;
  Result:=ptrItem;
  end;
end;

procedure TActionsGroups.ActionsGroup_Finish(const ptrActionsGroup: pointer);
begin
with TActionsGroup(ptrActionsGroup^) do begin
if NOT flStarted then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not started'); //. =>
if flFinished then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' already finished'); //. =>
ActionsNamesIndex:=0;
flFinished:=true;
end;
end;

procedure TActionsGroups.ActionsGroup_End(const ptrActionsGroup: pointer);
begin
with TActionsGroup(ptrActionsGroup^) do begin
if NOT flStarted then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not started'); //. =>
/// ? if NOT flFinished then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not finished'); //. =>
FreeAndNil(Request);
FreeAndNil(Response);
flStarted:=false;
end;
end;

function TActionsGroups.ActionsGroup_Started(const pThreadID: DWord; out ptrItem: pointer): boolean;
begin
Result:=false;
ptrItem:=GetGroup(pThreadID);
if ptrItem = nil then Exit; //. ->
if TActionsGroup(ptrItem^).flStarted
 then Result:=true
 else ptrItem:=nil;
end;

function TActionsGroups.ActionsGroup_Finished(const pThreadID: DWord): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
ptrItem:=GetGroup(pThreadID);
if ptrItem = nil then Exit; //. ->
with TActionsGroup(ptrItem^) do begin
if NOT flStarted then Raise Exception.Create('actions group for thread #'+IntToStr(ThreadID)+' not started'); //. =>
Result:=TActionsGroup(ptrItem^).flFinished;
end;
end;

procedure TActionsGroups.ActionsGroup_AddRequest(const ptrActionsGroup: pointer; const ActionName: string; const pRequest: TStream);
var
  Size: integer;
begin
with TActionsGroup(ptrActionsGroup^) do begin
if Request = nil then Request:=TMemoryStream.Create;
pRequest.Position:=0;
Size:=pRequest.Size;
Request.Write(Size,SizeOf(Size));
Request.CopyFrom(pRequest,Size);
if ActionsNames <> ''
 then ActionsNames:=ActionsNames+'+'+ActionName
 else ActionsNames:=ActionName;
Inc(Count);
end;
end;

procedure TActionsGroups.ActionsGroup_SetResponse(const ptrActionsGroup: pointer; const pResponse: TStream);
begin
with TActionsGroup(ptrActionsGroup^) do begin
FreeAndNil(Response);
Response:=TMemoryStream.Create;
pResponse.Position:=0;
Response.CopyFrom(pResponse,pResponse.Size);
Response.Position:=0;
end;
end;

procedure TActionsGroups.ActionsGroup_GetNextActionResponse(const ptrActionsGroup: pointer; const ActionName: string; out oResponse: TStream);
const
  ActionMaxSize = 1024;
  ActionDelimiter = '+';
var
  Size: integer;
  NextAction: string;
  NAI: integer;
begin
with TActionsGroup(ptrActionsGroup^) do begin
repeat
  Inc(ActionsNamesIndex);
  SetLength(NextAction,ActionMaxSize); NAI:=1;
  while ActionsNamesIndex <= Length(ActionsNames) do begin
    if ActionsNames[ActionsNamesIndex] = ActionDelimiter  then Break; //. >
    NextAction[NAI]:=ActionsNames[ActionsNamesIndex];
    Inc(NAI);
    Inc(ActionsNamesIndex);
    end;
  SetLength(NextAction,NAI-1);
  Response.Read(Size,SizeOf(Size));
  //.
  if (NextAction = ActionName) then Break; //. >
  //. skip response, try next
  Response.Position:=Response.Position+Size;
  //.
  if (Response.Position >= Response.Size) then Raise Exception.Create('could not get action response'); //. =>
until (false);
//.
oResponse.Size:=0;
oResponse.CopyFrom(Response,Size);
oResponse.Position:=0;
end;
end;

function TActionsGroups.GetGroup(const pThreadID: DWord): pointer;
var
  I: integer;
begin
Result:=nil;
with LockList do
try
for I:=0 to Count-1 do with TActionsGroup(List[I]^) do
  if ThreadID = pThreadID
   then begin
    Result:=List[I];
    Exit; //. ->
    end;
finally
UnLockList;
end;
end;


{THTTPReqResp}
constructor THTTPReqResp.Create(Owner: TComponent);
begin
  inherited;
{$IFNDEF USE_INDY}
  FInetRoot := nil;
  FInetConnect := nil;
{$ENDIF}
  FUserSetURL := False;
  FInvokeOptions := [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI];
  FAgent := 'Borland SOAP 1.2'; { Do not localize }
  FMaxSinglePostSize := $8000;
  //. modified by
end;

destructor THTTPReqResp.Destroy;
begin
{$IFNDEF USE_INDY}
  if Assigned(FInetConnect) then
    InternetCloseHandle(FInetConnect);
  FInetConnect := nil;
  if Assigned(FInetRoot) then
    InternetCloseHandle(FInetRoot);
  FInetRoot := nil;
{$ENDIF}
  FConnected := False;
  inherited;
end;

class function THTTPReqResp.NewInstance: TObject;
begin
  Result := inherited NewInstance;
  THTTPReqResp(Result).FRefCount := 1;
end;

procedure THTTPReqResp.AfterConstruction;
begin
  inherited;
  FOwnerIsComponent := Assigned(Owner) and (Owner is TComponent);
  InterlockedDecrement(FRefCount);
end;

{ IInterface }

function THTTPReqResp._AddRef: Integer;
begin
  Result := InterlockedIncrement(FRefCount)
end;

function THTTPReqResp._Release: Integer;
begin
  Result := InterlockedDecrement(FRefCount);
  { If we are not being used as a TComponent, then use refcount to manage our
    lifetime as with TInterfacedObject. }
  if (Result = 0) and not FOwnerIsComponent then
    Destroy;
end;

{$IFNDEF USE_INDY}
procedure THTTPReqResp.Check(Error: Boolean; ShowSOAPAction: Boolean);
var
  ErrCode: Integer;
  S: string;
begin
  ErrCode := GetLastError;
  if Error and (ErrCode <> 0) then
  begin
    SetLength(S, 256);
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM or FORMAT_MESSAGE_FROM_HMODULE, Pointer(GetModuleHandle('wininet.dll')),
      ErrCode, 0, PChar(S), Length(S), nil);
    SetLength(S, StrLen(PChar(S)));
    while (Length(S) > 0) and (S[Length(S)] in [#10, #13]) do
      SetLength(S, Length(S) - 1);
    raise ESOAPHTTPException.CreateFmt('%s - URL:%s - SOAPAction:%s', [S, FURL, SoapAction]);      { Do not localize }
  end;
end;
{$ENDIF}

function THTTPReqResp.GetHTTPReqResp: THTTPReqResp;
begin
  Result := Self;
end;

function THTTPReqResp.GetSOAPAction: string;
begin
  if (FSoapAction = '') and not (soNoValueForEmptySOAPAction in FInvokeOptions) then
    Result := '""'
  else
    Result := FSoapAction;
end;

procedure THTTPReqResp.SetSOAPAction(const SOAPAction: string);
begin
  FSoapAction := SOAPAction;
end;

procedure THTTPReqResp.SetWSDLView(const WSDLVIew: TWSDLView);
begin
  FWSDLView := WSDLView;
end;

procedure THTTPReqResp.SetURL(const Value: string);
begin
  if Value <> '' then
    FUserSetURL := True
  else
    FUserSetURL := False;
  InitURL(Value);
{$IFNDEF USE_INDY}
  { Here we always disconnect if a new URL comes in...
    this ensures that we don't keep a connection to
    a wrong host }
  Connect(False);
{$ENDIF}  
end;

procedure THTTPReqResp.InitURL(const Value: string);
{$IFNDEF USE_INDY}
var
  URLComp: TURLComponents;
  P: PChar;
{$ELSE}
const
  http = 'http://';
var
  IndyHTTP: TIDHttp;
  URI, Protocol, Host, path, Document, Port, Bookmark: string;
{$ENDIF}
begin
  if Value <> '' then
  begin
{$IFNDEF USE_INDY}
    FillChar(URLComp, SizeOf(URLComp), 0);
    URLComp.dwStructSize := SizeOf(URLComp);
    URLComp.dwSchemeLength := 1;
    URLComp.dwHostNameLength := 1;
    URLComp.dwURLPathLength := 1;
    P := PChar(Value);
    InternetCrackUrl(P, 0, 0, URLComp);
    if not (URLComp.nScheme in [INTERNET_SCHEME_HTTP, INTERNET_SCHEME_HTTPS]) then
      raise ESOAPHTTPException.CreateFmt(SInvalidURL, [Value]);
    FURLScheme := URLComp.nScheme;
    FURLPort := URLComp.nPort;
    FURLHost := Copy(Value, URLComp.lpszHostName - P + 1, URLComp.dwHostNameLength);
    FURLSite := Copy(Value, URLComp.lpszUrlPath - P + 1, URLComp.dwUrlPathLength);
{$ELSE}
    IndyHTTP := TIDHttp.Create(Nil);
    try
      URI := Value;
      ParseURI(URI, Protocol, Host, Path, Document, Port, Bookmark);
      if Port <> '' then
        FURLPort := StrToInt(Port)
      else
        FURLPort := IndyHTTP.Port;
      if Host <> '' then
        FURLHost := Host
      else
        FURLHost := Copy(Value, Length(http)+1,
              Pos(':' + IntToStr(FURLPort), Value) - (Length(http)+1));
    finally
      IndyHTTP.Free;
    end;
{$ENDIF}
  end else
  begin
    FURLPort := 0;
    FURLHost := '';
    FURLSite := '';
    FURLScheme := 0;
  end;
  FURL := Value;
end;

procedure THTTPReqResp.SetMimeBoundary(Value: string);
begin
  FMimeBoundary := Value;
end;

function THTTPReqResp.GetMimeBoundary: string;
begin
  Result := FMimeBoundary;
end;

procedure THTTPReqResp.SetUsername(const NameValue: string);
begin
  FUserName := NameValue;
  if Assigned(WSDLView) then
    WSDLView.UserName := NameValue;
end;

procedure THTTPReqResp.SetPassword(const PasswordValue: string);
begin
  FPassword := PasswordValue;
  if Assigned(WSDLView) then
    WSDLView.Password := PasswordValue;
end;

procedure THTTPReqResp.SetProxy(const ProxyValue: string);
begin
  FProxy := ProxyValue;
  if Assigned(WSDLView) then
    WSDLView.Proxy := ProxyValue;
end;


const
  MaxStatusTest = 4096;
  MaxContentType= 256;

function THTTPReqResp.GetSOAPActionHeader: string;
begin
  if (SoapAction = '') then
    Result := SHTTPSoapAction + ':'
  else if (SoapAction = '""') then
    Result := SHTTPSoapAction + ': ""'
  else
    Result := SHTTPSoapAction + ': ' + '"' + SoapAction + '"';
end;


{$IFNDEF USE_INDY}

procedure THTTPReqResp.Connect(Value: Boolean);
var
  AccessType: Integer;
begin
  if Value then
  begin
    { Yes, but what if we're connected to a different Host/Port?? }
    { So take advantage of a cached handle, we'll assume that
      Connect(False) will be called explicitly when we're switching
      Host. To that end, SetURL always disconnects }
    if (FConnected) then
      Exit;

    { Proxy?? }
    if Length(FProxy) > 0 then
      AccessType := INTERNET_OPEN_TYPE_PROXY
    else
      AccessType := INTERNET_OPEN_TYPE_PRECONFIG;

    { Also, could switch to new API introduced in IE4/Preview2}
    if InternetAttemptConnect(0) <> ERROR_SUCCESS then
      SysUtils.Abort;

    FInetRoot := InternetOpen(PChar(FAgent), AccessType, PChar(FProxy), PChar(FProxyByPass), 0);
    Check(not Assigned(FInetRoot));
    try
      FInetConnect := InternetConnect(FInetRoot, PChar(FURLHost), FURLPort, PChar(FUserName),
        PChar(FPassword), INTERNET_SERVICE_HTTP, 0, Cardinal(Self));
      Check(not Assigned(FInetConnect));
      FConnected := True;
    except
      InternetCloseHandle(FInetRoot);
      FInetRoot := nil;
      raise;
    end;
  end
  else
  begin
    if Assigned(FInetConnect) then
      InternetCloseHandle(FInetConnect);
    FInetConnect := nil;
    if Assigned(FInetRoot) then
      InternetCloseHandle(FInetRoot);
    FInetRoot := nil;
    FConnected := False;
  end;
end;

procedure  THTTPReqResp.Receive(Context: Integer; Resp: TStream; IsGet: Boolean);
var
  Size, Downloaded, Status, Len, Index: DWord;
  TotalSize, TotalRead: dword;
  S: string;

  {/// ? using ZLib procedure DecompressStreamIfCompressed(var Stream: TStream);

    function IsXMLStream: boolean;
    var
      Buf: array[0..4] of char;
    begin
    Result:=false;
    if (Stream.Size > 5)
     then begin
      Stream.Position:=0;
      Stream.Read(Buf,5);
      Result:=((Buf[0]+Buf[1]+Buf[2]+Buf[3]+Buf[4]) = '<?xml');
      end;
    end;

  const
    Portion = 8192;
  var
    DS: TDecompressionStream;
    Buffer: array[0..Portion-1] of byte;
    RS: TMemoryStream;
    Sz: integer;
  begin
  if IsXMLStream then Exit; //. ->
  RS:=TMemoryStream.Create;
  try
  Stream.Position:=0;
  DS:=TDecompressionStream.Create(Stream);
  with DS do
  try
  RS.Size:=(Stream.Size SHL 2);
  repeat
    Sz:=DS.Read(Buffer,Portion);
    if Sz > 0 then RS.Write(Buffer,Sz);
  until Sz < Portion;
  finally
  Destroy;
  end;
  Stream.Size:=RS.Position;
  RS.Position:=0;
  Stream.Position:=0;
  Stream.CopyFrom(RS,Stream.Size);
  Stream.Position:=0;
  finally
  RS.Destroy;
  end;
  end;}

  procedure DecompressStreamIfCompressed(const UserCompression: integer; var Stream: TStream);

    procedure AbbreviaZip_DecompressStreamIfCompressed(var Stream: TStream);

      function IsXMLStream: boolean;
      const
        XMLPreamblula = '<?xml';
      var
        Buf: array[0..4] of char;
      begin
      Result:=false;
      if (Stream.Size > 9)
       then begin
        Stream.Position:=0;
        Stream.Read(Buf,5);
        Result:=((Buf[0]+Buf[1]+Buf[2]+Buf[3]+Buf[4]) = XMLPreamblula);
        if (Result) then Exit; //. ->
        //. check is actions group responses  
        Stream.Position:=SizeOf(Integer); //. skip action response size
        Stream.Read(Buf,5);
        Result:=((Buf[0]+Buf[1]+Buf[2]+Buf[3]+Buf[4]) = XMLPreamblula);
        end;
      end;

    var
      TP: TThreadPriority;
    const
      Priorities: array [TThreadPriority] of Integer =
       (THREAD_PRIORITY_IDLE, THREAD_PRIORITY_LOWEST, THREAD_PRIORITY_BELOW_NORMAL,
        THREAD_PRIORITY_NORMAL, THREAD_PRIORITY_ABOVE_NORMAL,
        THREAD_PRIORITY_HIGHEST, THREAD_PRIORITY_TIME_CRITICAL);
    var
      RS: TMemoryStream;
    begin
    if IsXMLStream then Exit; //. ->
    try
    //. ajust worker thread priority
    case Stream.Size of
    0..8196: TP:=tpHigher;
    8197..65535: TP:=tpLower;
    65536..MaxInt: TP:=tpIdle;
    else
      TP:=tpNormal;
    end;
    SetThreadPriority(GetCurrentThread, Priorities[TP]);
    //. decompressing
    RS:=TMemoryStream.Create;
    try
    Stream.Position:=0;
    InflateStream(Stream, RS);
    Stream.Size:=RS.Size;
    RS.Position:=0;
    Stream.Position:=0;
    Stream.CopyFrom(RS,Stream.Size);
    Stream.Position:=0;
    finally
    RS.Destroy;
    end;
    except
      Raise Exception.Create('Authentication failed'); //. =>
      end;
    end;

  begin
  case UserCompression of
  1: begin //. Abbrevia zipping
    AbbreviaZip_DecompressStreamIfCompressed({ref} Stream);
    end;
  end;
  end;

  procedure DecodeStream(const UserEncryption: integer; const Key: string; const Stream: TMemoryStream);

    procedure RC5_DecodeStream(const Key: string; const Stream: TMemoryStream);
    begin
    with TCipher_RC5.Create do
    try
    Mode:=cmCTS;
    InitKey(Key, nil);
    DecodeBuffer(Stream.Memory^,Stream.Memory^,Stream.Size);
    finally
    Destroy;
    end;
    end;

  begin
  case UserEncryption of
  1: begin //. RC5 chipher
    RC5_DecodeStream(Key,{ref} Stream);
    end;
  end;
  end;

begin
  Len := SizeOf(Status);
  Index := 0;

  { Handle error }
  if HttpQueryInfo(Pointer(Context), HTTP_QUERY_STATUS_CODE or HTTP_QUERY_FLAG_NUMBER,
    @Status, Len, Index) and (Status >= 300) then
  begin
    Index := 0;
    Size := MaxStatusTest;
    SetLength(S, Size);
    if HttpQueryInfo(Pointer(Context), HTTP_QUERY_STATUS_TEXT, @S[1], Size, Index) then
    begin
      SetLength(S, Size);
      raise ESOAPHTTPException.CreateFmt('%s (%d) - ''%s''', [S, Status, FURL], Status);
    end;
  end;

  { Ask for Content-Type }
  Size := MaxContentType;
  SetLength(FContentType, MaxContentType);
  HttpQueryInfo(Pointer(Context), HTTP_QUERY_CONTENT_TYPE, @FContentType[1], Size, Index);
  SetLength(FContentType, Size);

  { Extract Mime-Boundary }
  FMimeBoundary := GetMimeBoundaryFromType(FContentType);

  Index:=0; Size:=SizeOf(TotalSize); TotalSize:=0; 
  HttpQueryInfo(Pointer(Context), HTTP_QUERY_CONTENT_LENGTH OR HTTP_QUERY_FLAG_NUMBER, @TotalSize, Size, Index);

  { Read data }
  Len := 0;
  TotalRead:=0;
  repeat
    Check(not InternetQueryDataAvailable(Pointer(Context), Size, 0, 0));
    if Size > 0 then
    begin
      SetLength(S, Size);
      Check(not InternetReadFile(Pointer(Context), @S[1], Size, Downloaded));
      Resp.Write(S[1], Size);

      { Receiving Data event }
      if Assigned(FOnReceivingData) then begin
        Inc(TotalRead,Size);
        FOnReceivingData(TotalRead, TotalSize);
        end;
    end;
  until Size = 0;

  { Check that we have a valid content type}
  { Ideally, we would always check but there are several WebServers out there
    that send files with .wsdl extension with the content type 'text/plain' or
    'text/html' ?? }
  if not IsGet then
    CheckContentType;

  //. decode content-stream
  if (ProxySpace.UserEncryption > 0)
   then DecodeStream(ProxySpace.UserEncryption,ProxySpace.UserPasswordHash,{ref} Resp as TMemoryStream);
  //. decompressing content-stream if compressed
  if (ProxySpace.UserCompression > 0)
   then DecompressStreamIfCompressed(ProxySpace.UserCompression,{ref} Resp);
end;

function THTTPReqResp.Send(const ASrc: TStream): Integer;
var
  Src: TStream;
  Request: HINTERNET;
  RetVal, Flags: DWord;
  P: Pointer;
  ActionHeader: string;
  ContentHeader: string;
  BuffSize, Len: Integer;
  INBuffer: INTERNET_BUFFERS;
  Buffer: TMemoryStream;
  StrStr: TStringStream;

  {/// ? using ZLib procedure CompressStream(const Stream: TStream);
  var
    MS: TMemoryStream;
    CL: TCompressionLevel;
    RS: TMemoryStream;
  begin 
  RS:=TMemoryStream.Create;
  try
  MS:=TMemoryStream.Create;
  try
  MS.LoadFromStream(Stream);
  MS.Position:=0;
  //. choose compression level depending on compression data size
  case MS.Size of
  0..8196: CL:=clMax;
  8197..65535: CL:=clFastest;
  65536..MaxInt: CL:=clNone;
  else
    CL:=clNone;
  end;
  with TCompressionStream.Create(CL, RS) do
  try
  Write(MS.Memory^,MS.Size);
  finally
  Destroy;
  end;
  RS.Position:=0;
  Stream.Size:=RS.Size;
  Stream.Position:=0;
  Stream.CopyFrom(RS,RS.Size);
  Stream.Position:=0;
  finally
  MS.Destroy;
  end;
  finally
  RS.Destroy;
  end;
  end;}

  procedure CompressStream(const UserCompression: integer; const Stream: TStream; out RS: TStream);

    procedure AbbreviaZip_CompressStream(const Stream: TStream; out RS: TStream);
    var
      _RS: TMemoryStream;
    begin
    RS:=nil;
    _RS:=TMemoryStream.Create;
    try
    Stream.Position:=0;
    DeflateStream(Stream, _RS);
    _RS.Position:=0;
    RS:=_RS;
    except
      FreeAndNil(_RS);
      Raise; //. =>
      end;
    end;

  begin
  RS:=nil;
  case UserCompression of
  1: begin //. Abbrevia zipping
    AbbreviaZip_CompressStream(Stream,{out} RS);
    end;
  end; 
  end;

  procedure EncodeStream(const UserEncryption: integer; const Key: string; const Stream: TStream);

    procedure RC5_EncodeStream(const Key: string; const Stream: TStream);
    begin
    with TCipher_RC5.Create() do
    try
    Mode:=cmCTS;
    InitKey(Key, nil);
    EncodeBuffer(TMemoryStream(Stream).Memory^,TMemoryStream(Stream).Memory^,Stream.Size);
    finally
    Destroy();
    end;
    end;

  begin
  case UserEncryption of
  1: begin //. RC5 chipher
    RC5_EncodeStream(Key,{ref} Stream);
    end;
  end;
  end;

begin
  //. check offline mode
  if (ProxySpace.flOffline) then Raise Exception.Create('can not perform operation in Offline mode'); //. =>;
  //. compressing content-stream
  if (ProxySpace.UserCompression > 0)
   then CompressStream(ProxySpace.UserCompression, ASrc,{out} Src)
   else Src:=ASrc;
  try
  //. encode content-stream
  if (ProxySpace.UserEncryption > 0)
   then EncodeStream(ProxySpace.UserEncryption, ProxySpace.UserPasswordHash,{ref} Src);
  { Connect }
  Connect(True);

  Flags := INTERNET_FLAG_KEEP_CONNECTION or INTERNET_FLAG_NO_CACHE_WRITE;
  if FURLScheme = INTERNET_SCHEME_HTTPS then
  begin
    Flags := Flags or INTERNET_FLAG_SECURE;
    if (soIgnoreInvalidCerts in InvokeOptions) then
      Flags := Flags or (INTERNET_FLAG_IGNORE_CERT_CN_INVALID or
                         INTERNET_FLAG_IGNORE_CERT_DATE_INVALID);
  end;

  Request := nil;
  try
    Request := HttpOpenRequest(FInetConnect, 'POST', PChar(FURLSite), nil,
                               nil, nil, Flags, 0{Integer(Self)});
    Check(not Assigned(Request));

    { Timeouts }
    (* ///? if FConnectTimeout > 0 then
      Check(InternetSetOption(Request, INTERNET_OPTION_CONNECT_TIMEOUT, Pointer(@FConnectTimeout), SizeOf(FConnectTimeout)));
    if FSendTimeout > 0 then
      Check(InternetSetOption(Request, INTERNET_OPTION_SEND_TIMEOUT, Pointer(@FSendTimeout), SizeOf(FSendTimeout)));
    //. motified by PAV
    if FReceiveTimeout > 0 then
      Check(InternetSetOption(Request, INTERNET_OPTION_RECEIVE_TIMEOUT, Pointer(@FReceiveTimeout), SizeOf(FReceiveTimeout))); *)
    if (FConnectTimeout > 0) then InternetSetOption(Request, INTERNET_OPTION_CONNECT_TIMEOUT, Pointer(@FConnectTimeout), SizeOf(FConnectTimeout));
    if (FSendTimeout > 0) then InternetSetOption(Request, INTERNET_OPTION_SEND_TIMEOUT, Pointer(@FSendTimeout), SizeOf(FSendTimeout));
    if (FReceiveTimeout > 0) then InternetSetOption(Request, INTERNET_OPTION_RECEIVE_TIMEOUT, Pointer(@FReceiveTimeout), SizeOf(FReceiveTimeout));

    { Setup packet based on Content-Type/Binding }
    if FBindingType = btMIME then
    begin
      ContentHeader := Format(ContentHeaderMIME, [FMimeBoundary]);
      ContentHeader := Format(ContentTypeTemplate, [ContentHeader]);
      HttpAddRequestHeaders(Request, PChar(MIMEVersion), Length(MIMEVersion), HTTP_ADDREQ_FLAG_ADD);

      { SOAPAction header }
      { NOTE: It's not really clear whether this should be sent in the case
              of MIME Binding. Investigate interoperability ?? }
      if not (soNoSOAPActionHeader in FInvokeOptions) then
      begin
        ActionHeader:= GetSOAPActionHeader;
        HttpAddRequestHeaders(Request, PChar(ActionHeader), Length(ActionHeader), HTTP_ADDREQ_FLAG_ADD);
      end;

    end else { Assume btSOAP }
    begin
      { SOAPAction header }
      if not (soNoSOAPActionHeader in FInvokeOptions) then
      begin
        ActionHeader:= GetSOAPActionHeader;
        HttpAddRequestHeaders(Request, PChar(ActionHeader), Length(ActionHeader), HTTP_ADDREQ_FLAG_ADD);
      end;

      if UseUTF8InHeader then
        ContentHeader := Format(ContentTypeTemplate, [ContentTypeUTF8])
      else
        ContentHeader := Format(ContentTypeTemplate, [ContentTypeNoUTF8]);
    end;

    { Content-Type }
    HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);

    { User }
    ContentHeader:=Format('User: %s',[ProxySpace.UserName]);
    HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);
    ContentHeader:=Format('UserEncryption: %s',[IntToStr(ProxySpace.UserEncryption)]);
    HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);
    ContentHeader:=Format('UserCompression: %s',[IntToStr(ProxySpace.UserCompression)]);
    HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);

    { Actions group is exist }
    if ptrActionsGroup <> nil
     then begin
      ContentHeader:=Format('ActionsGroup: %s',[IntToStr(TActionsGroup(ptrActionsGroup^).Count)]);
      HttpAddRequestHeaders(Request, PChar(ContentHeader), Length(ContentHeader), HTTP_ADDREQ_FLAG_ADD);
      end;

    { Before we pump data, see if user wants to handle something - like set Basic-Auth data?? }
    if Assigned(FOnBeforePost) then
      FOnBeforePost(Self, Request);

    Src.Position := 0;
    BuffSize := Src.Size;
    if BuffSize > FMaxSinglePostSize then
    begin
      Buffer := TMemoryStream.Create;
      try
        Buffer.SetSize(FMaxSinglePostSize);

        { Init Input Buffer }
        INBuffer.dwStructSize := SizeOf(INBuffer);
        INBuffer.Next := nil;
        INBuffer.lpcszHeader := nil;
        INBuffer.dwHeadersLength := 0;
        INBuffer.dwHeadersTotal := 0;
        INBuffer.lpvBuffer := nil;
        INBuffer.dwBufferLength := 0;
        INBuffer.dwBufferTotal := BuffSize;
        INBuffer.dwOffsetLow := 0;
        INBuffer.dwOffsetHigh := 0;

        { Start POST }
        Check(not HttpSendRequestEx(Request, @INBuffer, nil,
                                    HSR_INITIATE or HSR_SYNC, 0));
        try
          while True do
          begin
            { Calc length of data to send }
            Len := BuffSize - Src.Position;
            if Len > FMaxSinglePostSize then
              Len := FMaxSinglePostSize;
            { Bail out if zip.. }
            if Len = 0 then
              break;
            { Read data in buffer and write out}
            Len := Src.Read(Buffer.Memory^, Len);
            if Len = 0 then
              raise ESOAPHTTPException.Create(SInvalidHTTPRequest);

            Check(not InternetWriteFile(Request, @Buffer.Memory^, Len, RetVal));

            RetVal := InternetErrorDlg(GetDesktopWindow(), Request, GetLastError,
              FLAGS_ERROR_UI_FILTER_FOR_ERRORS or FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS or
              FLAGS_ERROR_UI_FLAGS_GENERATE_DATA, P);
            case RetVal of
              ERROR_SUCCESS: ;
              ERROR_CANCELLED: SysUtils.Abort;
              ERROR_INTERNET_FORCE_RETRY: {Retry the operation};
            end;

            { Posting Data Event }
            if Assigned(FOnPostingData) then
              FOnPostingData(Src.Position, BuffSize);
          end;
        finally
          Check(not HttpEndRequest(Request, nil, 0, 0));
        end;
      finally
        Buffer.Free;
      end;
    end else
    begin
      StrStr := TStringStream.Create('');
      try
        StrStr.CopyFrom(Src, 0);
        while True do
        begin
          Check(not HttpSendRequest(Request, nil, 0, @StrStr.DataString[1], Length(StrStr.DataString)));
          RetVal := InternetErrorDlg(GetDesktopWindow(), Request, GetLastError,
            FLAGS_ERROR_UI_FILTER_FOR_ERRORS or FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS or
            FLAGS_ERROR_UI_FLAGS_GENERATE_DATA, P);
          case RetVal of
            ERROR_SUCCESS: break;
            ERROR_CANCELLED: SysUtils.Abort;
            ERROR_INTERNET_FORCE_RETRY: {Retry the operation};
          end;
        end;
        //. 
        if Assigned(FOnPostingData) then
          FOnPostingData(BuffSize, BuffSize);
      finally
        StrStr.Free;
      end;
    end;
  except
    if (Request <> nil) then
      InternetCloseHandle(Request);
    Connect(False);
    raise;
  end;
  Result := Integer(Request);
  finally
  if (ProxySpace.UserCompression > 0) then Src.Destroy();
  end;
end;

function THTTPReqResp.SendGet: Integer;
var
  Request: HINTERNET;
  LastError, RetVal, Flags, FlagsLen: DWord;
  P: Pointer;
  AcceptTypes: array of PChar;
begin
  { Connect }
  Connect(True);

  SetLength(AcceptTypes, 2);
  AcceptTypes[0] := PChar('*/*');  { Do not localize }
  AcceptTypes[1] := nil;
  Flags := INTERNET_FLAG_DONT_CACHE;
  if FURLScheme = INTERNET_SCHEME_HTTPS then
  begin
    Flags := Flags or INTERNET_FLAG_SECURE;
    if (soIgnoreInvalidCerts in InvokeOptions) then
      Flags := Flags or (INTERNET_FLAG_IGNORE_CERT_CN_INVALID or
                         INTERNET_FLAG_IGNORE_CERT_DATE_INVALID);
  end;

  Request := nil;
  try
    Request := HttpOpenRequest(FInetConnect, 'GET', PChar(FURLSite), nil, { Do not localize }
      nil, Pointer(AcceptTypes), Flags, Integer(Self));
    Check(not Assigned(Request), False);

    while True do
    begin
      if (not HttpSendRequest(Request, nil, 0, nil, 0)) then
      begin
        LastError := GetLastError;
        { Handle INVALID_CA discreetly }
        if (LastError = ERROR_INTERNET_INVALID_CA) then
        begin
          FlagsLen := SizeOf(Flags);
          InternetQueryOption(Request, INTERNET_OPTION_SECURITY_FLAGS, Pointer(@Flags), FlagsLen);
          Flags := Flags or SECURITY_FLAG_IGNORE_UNKNOWN_CA;
          InternetSetOption(Request, INTERNET_OPTION_SECURITY_FLAGS, Pointer(@Flags), FlagsLen);
        end
        else
        begin
          RetVal := InternetErrorDlg(GetDesktopWindow(), Request, LastError,
                                     FLAGS_ERROR_UI_FILTER_FOR_ERRORS or
                                     FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS or
                                     FLAGS_ERROR_UI_FLAGS_GENERATE_DATA, P);
          case RetVal of
            ERROR_CANCELLED: SysUtils.Abort;
            ERROR_SUCCESS: break;
            ERROR_INTERNET_FORCE_RETRY: {Retry the operation};
          end;
        end;
      end
      else
        break;
    end;
  except
    if (Request <> nil) then
      InternetCloseHandle(Request);
    Connect(False);
    raise;
  end;
  Result := Integer(Request);
end;
{$ENDIF}

{$IFDEF USE_INDY}
procedure THTTPReqResp.SetupIndy(IndyHttp: TIDHttp; Request: TStream);

  procedure GetHostAndPort(const AURL: string; var AHost, APort: string);
  var
    Index: Integer;
  begin
    Index := Pos(':', AURL);
    if Index > 0 then
    begin
      AHost := Copy(AURL, 1, Index-1);
      APort := Copy(AURL, Index+1, MaxInt);
    end;
end;

  function IsHTTPS: Boolean;
  var
    Protocol, Host, path, Document, Port, Bookmark: string;
  begin
    ParseURI(FUrl, Protocol, Host, path, Document, Port, Bookmark);
    Result := AnsiSameText(Protocol, 'HTTPS');
  end;

var
  Protocol, Host, Path, Document, Port, Bookmark: string;
begin
  if IsHttps then
    IndyHttp.IOHandler := TIdSSLIOHandlerSocket.Create(Nil);

{  if Request is TMimeAttachmentHandler then }
  if FBindingType = btMIME then
  begin
    IndyHttp.Request.ContentType := Format(ContentHeaderMIME, [FMimeBoundary]);
    IndyHttp.Request.CustomHeaders.Add(MimeVersion);
  end else { Assume btSOAP }
  begin
    IndyHttp.Request.ContentType := sTextXML;
    IndyHttp.Request.CustomHeaders.Add(GetSOAPActionHeader);
  end;

  IndyHttp.Request.Accept := '*/*';
  IndyHttp.Request.UserAgent := Self.FAgent;

  { Proxy support configuration }
  if FProxy <> '' then
  begin
    { first check for 'http://localhost:####' }
    ParseURI(FProxy, Protocol, Host, Path, Document, Port, Bookmark);
    { if fail then check for 'localhost:####' }
    if Host = '' then
      GetHostAndPort(FProxy, Host, Port);
    IndyHttp.ProxyParams.ProxyServer := Host;
    if Port <> '' then
      IndyHttp.ProxyParams.ProxyPort := StrToInt(Port);

    { If name/password is used in conjunction with proxy, it's passed
      along for proxy authentication }
    IndyHttp.ProxyParams.ProxyUsername := FUserName;
    IndyHttp.ProxyParams.ProxyPassword := FPassword;
  end else
  begin
    { no proxy with Username/Password implies basic authentication }
    IndyHttp.Request.Username := FUserName;
    IndyHttp.Request.Password := FPassword;
  end;
  IndyHttp.Host := FUrlHost;
  IndyHttp.Port := FUrlPort;
end;
{$ENDIF}

procedure THTTPReqResp.Get(Resp: TStream);
{$IFNDEF USE_INDY}
var
  Context: Integer;
{$ENDIF}
{$IFDEF USE_INDY}
  procedure LoadFromURL(URL: string; Stream: TStream);
  var
    IndyHTTP: TIDHttp;
    Protocol, Host, Path, Document, Port, Bookmark: string;
  begin
    IndyHTTP := TIDHttp.Create(Nil);
    try
      IndyHttp.Request.Accept := '*/*';
      IndyHttp.Request.UserAgent := Self.FAgent;
      IndyHttp.Request.ContentType := sTextXml;
      if FProxy <> '' then
      begin
        ParseURI(FProxy, Protocol, Host, Path, Document, Port, Bookmark);
        IndyHttp.ProxyParams.ProxyServer := Host;
        IndyHttp.ProxyParams.ProxyPort := StrToInt(Port);
        IndyHttp.ProxyParams.ProxyUsername := FUserName;
        IndyHttp.ProxyParams.ProxyPassword := FPassword;
      end else
      begin
        { no proxy with Username/Password implies basic authentication }
        IndyHttp.Request.Username := FUserName;
        IndyHttp.Request.Password := FPassword;
      end;
      { IndyHttp.Intercept := FIntercept; }
      IndyHttp.Get(URL, Stream);
    finally
      IndyHTTP.Free;
    end;
  end;
{$ENDIF}
begin
  { GETs require a URL }
  if URL = '' then
    raise ESOAPHTTPException.Create(SEmptyURL);
{$IFDEF USE_INDY}
  { GET with INDY }
  LoadFromURL(URL, Resp);
{$ELSE}
  Context := SendGet;
  try
    Receive(Context, Resp, True);
  finally
    if Context <> 0  then
      InternetCloseHandle(Pointer(Context));
    Connect(False);
  end;
{$ENDIF}
end;
{ Here the RIO can perform any transports specific setup before call - XML serialization is done }
procedure THTTPReqResp.BeforeExecute(const IntfMD: TIntfMetaData;
                                     const MethMD: TIntfMethEntry;
                                     MethodIndex: Integer;
                                     AttachHandler: IMimeAttachmentHandler);
var
  MethName: InvString;
  Binding: InvString;
  QBinding: IQualifiedName;
begin
  if FUserSetURL then
  begin
    MethName := InvRegistry.GetMethExternalName(IntfMD.Info, MethMD.Name);
    FSoapAction := InvRegistry.GetActionURIOfInfo(IntfMD.Info, MethName, MethodIndex);
  end
  else
  begin
    { User did *NOT* set a URL }
    if WSDLView <> nil then
    begin
    { Make sure WSDL is active }
      WSDLView.Activate;
      QBinding := WSDLView.WSDL.GetBindingForServicePort(WSDLView.Service, WSDLView.Port);
      if QBinding <> nil then
      begin
        Binding := QBinding.Name;
        MethName:= InvRegistry.GetMethExternalName(WSDLView.IntfInfo, WSDLView.Operation);
        { TODO: Better to Pass in QBinding here to avoid tricky confusion due to lack of namespace }
        FSoapAction := WSDLView.WSDL.GetSoapAction(Binding, MethName, 0);
      end;
      {NOTE: In case we can't get the SOAPAction - see if we have something in the registry }
      {      It can't hurt:) }
      if FSoapAction = '' then
        InvRegistry.GetActionURIOfInfo(IntfMD.Info, MethName, MethodIndex);
      { Retrieve URL }
      FURL := WSDLView.WSDL.GetSoapAddressForServicePort(WSDLView.Service, WSDLView.Port);
      if (FURL = '') then
        raise ESOAPHTTPException.CreateFmt(sCantGetURL, [WSDLView.Service, WSDLView.Port, WSDLView.WSDL.FileName]);
      InitURL(FURL);
    end
    else
      raise ESOAPHTTPException.Create(sNoWSDLURL);
  end;

  { Are we sending attachments?? }
  if AttachHandler <> nil then
  begin
    FBindingType := btMIME;
    { If yes, ask MIME handler what MIME boundary it's using to build the Multipart
      packet }
    FMimeBoundary := AttachHandler.MIMEBoundary;

    { Also customize the MIME packet for transport specific items }
    if UseUTF8InHeader then
      AttachHandler.AddSoapHeader(Format(ContentTypeTemplate, [ContentTypeUTF8]))
    else
      AttachHandler.AddSoapHeader(Format(ContentTypeTemplate, [ContentTypeNoUTF8]));
    AttachHandler.AddSoapHeader(GetSOAPActionHeader);
  end else
    FBindingType := btSOAP;
end;

procedure THTTPReqResp.Execute(const DataMsg: String; Resp: TStream);
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.SetSize(Length(DataMsg));
    Stream.Write(DataMsg[1], Length(DataMsg));
    Execute(Stream, Resp);
  finally
    Stream.Free;
  end;
end;

function THTTPReqResp.Execute(const Request: TStream): TStream;
begin
  Result := TMemoryStream.Create;
  Execute(Request, Result);
end;

procedure THTTPReqResp.CheckContentType;
begin
  { NOTE: Content-Types are case insensitive! }
  {       Here we're not validating that we
          have a valid content-type; rather
          we're checking for some common invalid
          ones }
  if SameText(FContentType, ContentTypeTextPlain) or
     SameText(FContentType, STextHtml) then
    raise ESOAPHTTPException.CreateFmt(SInvalidContentType, [FContentType]);
end;

procedure THTTPReqResp.Execute(const Request: TStream; Response: TStream);

  function IsErrorStatusCode(Code: Integer): Boolean;
  begin
    case Code of
      404, 405, 410:
        Result := True;
      else
        Result := False;
    end;
  end;

{$IFDEF USE_INDY}
  procedure PostData(const Request: TStream; Response: TStream);
  var
    IndyHTTP: TIDHttp;
  begin
    IndyHTTP := TIDHttp.Create(Nil);
    try
      SetupIndy(IndyHTTP, Request);
      IndyHttp.Post(FURL, Request, Response);
      FContentType := IndyHttp.Response.RawHeaders.Values[SContentType];
      FMimeBoundary := GetMimeBoundaryFromType(FContentType);
      if Response.Size = 0 then
        raise ESOAPHTTPException.Create(SInvalidHTTPResponse);
      CheckContentType;
    finally
      if Assigned(IndyHttp.IoHandler) then
        IndyHttp.IOHandler.Free;
      FreeAndNil(IndyHTTP);
    end;
  end;

var
{$ELSE}
var
  Context: Integer;
{$ENDIF}
  CanRetry: Boolean;
  LookUpUDDI: Boolean;
  AccessPoint: String;
  PrevError: String;
//.
const
  TryCount = 0; /// ? 4;
var
  TryIndex: integer;
  _SoapAction: string;
begin
  //. by PAV
  if ActionsGroups.ActionsGroup_Started(GetCurrentThreadID, ptrActionsGroup)
   then
    if NOT TActionsGroup(ptrActionsGroup^).flFinished
     then begin
      ActionsGroups.ActionsGroup_AddRequest(ptrActionsGroup,SOAPAction,Request);
      Raise EActionsGroup.Create(''); //. =>
      end;
  //. native code
  LookUpUDDI := False;
  CanRetry := (soAutoCheckAccessPointViaUDDI in FInvokeOptions) and
              (Length(FUDDIBindingKey) > 0) and
              (Length(FUDDIOperator) > 0);
{$IFDEF USE_INDY}
  PostData(Request, Response);
{$ELSE}
  //.
  TryIndex:=0;
  while (True) do
  begin
  try
    { Look up URL from UDDI?? }
    if LookUpUDDI and CanRetry then
    begin
      try
        CanRetry := False;
        AccessPoint := '';
        AccessPoint := GetBindingkeyAccessPoint(FUDDIOperator, FUDDIBindingKey);
      except
        { Ignore UDDI lookup error }
      end;
      { If UDDI lookup failed or we got back the same URL we used...
        raise the previous execption message }
      if (AccessPoint = '') or SameText(AccessPoint, FURL) then
        raise ESOAPHTTPException.Create(PrevError);
      SetURL(AccessPoint);
    end;
    if ptrActionsGroup = nil
     then Context:=Send(Request)
     else with TActionsGroup(ptrActionsGroup^) do
      if Response = nil
       then begin
        _SoapAction:=FSoapAction;
        try
        FSoapAction:=ActionsNames;
        Context:=Send(Request);
        finally
        FSoapAction:=_SoapAction;
        end;
        end;
    try
      try
        if ptrActionsGroup = nil
         then Receive(Context, Response)
         else begin
          if TActionsGroup(ptrActionsGroup^).Response = nil
           then begin
            Receive(Context, Response);
            ActionsGroups.ActionsGroup_SetResponse(ptrActionsGroup,Response);
            end;
          ActionsGroups.ActionsGroup_GetNextActionResponse(ptrActionsGroup, FSoapAction, Response);
          end;
        Exit;
      except
        on Ex: ESOAPHTTPException do
        begin
          Connect(False);
          if not CanRetry or not IsErrorStatusCode(Ex.StatusCode) then
            raise;
          { Trigger UDDI Lookup }
          LookUpUDDI := True;
          PrevError := Ex.Message;
        end;
        else
        begin
          Connect(False);
          raise;
        end;
      end;
    finally
      if Context <> 0  then
        InternetCloseHandle(Pointer(Context));
    end;
  except
    on E: Exception do begin
      if E is EAbort then Raise; //. =>
      if ProxySpace.UserName = 'Checker' then Raise; //. =>
      if TryCount = 0 then Raise; //. =>
      Sleep(5000); //. wait while soap server getting up
      Inc(TryIndex);
      if TryIndex = TryCount then Raise; //. =>
      end;
    end;
  end;
{$ENDIF}
end;


Initialization
ActionsGroups:=TActionsGroups.Create;

Finalization
FreeAndNil(ActionsGroups);
end.
