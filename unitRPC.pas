unit unitRPC; {RPC calls stub}
Interface
Uses
  Windows,
  SysUtils;

const
  RPCRT4 = 'rpcrt4.dll';

Const
  RPC_S_OK = 0;

  RPC_C_PROTSEQS_MAX_REQS_DEFAULT = 10;

  RPC_C_BIND_TO_ALL_NICS = $1;
  RPC_C_USE_INTERNET_PORT = $1;
  RPC_C_USE_INTRANET_PORT = $2;
  RPC_C_DONT_FAIL = $4;

  RPC_C_AUTHN_NONE = $0;

  RPC_C_AUTHZ_NONE = $0;

  RPC_C_AUTHN_LEVEL_NONE = $1;

  RPC_C_IMP_LEVEL_IDENTIFY = $2;
  RPC_C_IMP_LEVEL_ANONYMOUS = $1;

  EOAC_NONE = $0;


Type
  TRPCPolicy = packed record
    Length: UINT;
    EndpointFlags: ULONG;
    NICFlags: ULONG;
  end;

  TDCOMPlatform = (dpUnknown,dpWin,dpWin95,dpWinNT);

  function DCOMPlatform: TDCOMPlatform;
  procedure DCOM_SetForInternetPorts;
  function RpcServerUseProtseqEx(ProtSeq: PChar; MaxCalls: UINT; ptrSecurityDescriptor: pointer; ptrRPCPolicy: pointer): longint; stdcall;
  function RpcServerUseAllProtseqsEx(MaxCalls: UINT; ptrSecurityDescriptor: pointer; ptrRPCPolicy: pointer): longint; stdcall;
  function TakeoffInterfaceSecurity(IUnk: IUnknown): HResult;

  
Implementation
Uses
  ActiveX;
  

function DCOMPlatform: TDCOMPlatform;
var
  os:TOsVersionInfo;
begin
os.dwOsVersionInfoSize:=SizeOf(os);
GetVersionEx(os);
case os.dwPlatformId of
VER_PLATFORM_WIN32S: Result:=dpWin;
VER_PLATFORM_WIN32_WINDOWS: Result:=dpWin95;
VER_PLATFORM_WIN32_NT: Result:=dpWinNT;
else
 Result:=dpUnknown;
end;
end;

procedure DCOM_SetForInternetPorts;
var
  RPCPolicy: TRPCPolicy;
begin
with RPCPolicy do begin
Length:=SizeOf(RPCPolicy);
EndpointFlags:=RPC_C_USE_INTERNET_PORT;
NICFlags:=RPC_C_BIND_TO_ALL_NICS;
end;
if RpcServerUseProtseqEx(PChar('ncacn_ip_tcp'),RPC_C_PROTSEQS_MAX_REQS_DEFAULT, nil, @RPCPolicy) <> RPC_S_OK then Raise Exception.Create('DCOM_SetForInternetPorts: call RpcServerUseAllProtseqEx failed'); //. =>
end;

function RpcServerUseProtseqEx; external RPCRT4 name 'RpcServerUseProtseqExA';
function RpcServerUseAllProtseqsEx; external RPCRT4 name 'RpcServerUseAllProtseqsEx';

function TakeoffInterfaceSecurity(IUnk: IUnknown): HResult;
begin
CoSetProxyBlanket(
  IUnk,

  RPC_C_AUTHN_NONE,
  RPC_C_AUTHZ_NONE,
  nil,
  RPC_C_AUTHN_LEVEL_NONE,
  RPC_C_IMP_LEVEL_IDENTIFY, /// ? RPC_C_IMP_LEVEL_ANONYMOUS
  nil,
  EOAC_NONE
  );
end;


end.
