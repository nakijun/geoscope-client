unit unitProxySpaceCallBackAccount;
interface


  procedure EnableGuestAccount;
  procedure DisableGuestAccount;
  
  procedure CreatePSCallBackAccount;
  procedure DestroyPSCallBackAccount;


implementation
uses
  Windows, Messages, SysUtils;
  
const
  PSCallBackAccountName  = 'PSCallBackAccount';
  
  USER_PRIV_USER = 1;

  STANDARD_RIGHTS_REQUIRED = $F0000;
  POLICY_CREATE_PRIVILEGE  = $40;
  POLICY_CREATE_ACCOUNT    = $10;
  POLICY_LOOKUP_NAMES      = $800;
  POLICY_ALL_ACCESS        = STANDARD_RIGHTS_REQUIRED OR POLICY_LOOKUP_NAMES OR POLICY_CREATE_PRIVILEGE OR POLICY_CREATE_ACCOUNT;

  UF_SCRIPT                          = $0001;
  UF_ACCOUNTDISABLE                  = $0002;
  UF_HOMEDIR_REQUIRED                = $0008;
  UF_LOCKOUT                         = $0010;
  UF_PASSWD_NOTREQD                  = $0020;
  UF_PASSWD_CANT_CHANGE              = $0040;
  UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = $0080;
  UF_NORMAL_ACCOUNT                  = $0200;
  UF_DONT_EXPIRE_PASSWD              = $10000;

  NERR_BASE = 2100;
  NERR_UserExists          = (NERR_BASE+124);
  NERR_GroupNotFound       = (NERR_BASE+120);
type
  PNtStatus = ^TNtStatus;
  NTSTATUS = LongInt;
  TNtStatus = NTSTATUS;

  NET_API_STATUS = DWORD;

  LSA_OBJECT_ATTRIBUTES = packed record
    Length: integer;
    RootDirectory: integer;
    ObjectName: WideString;
    Attributes: integer;
    SecurityDescriptor: pointer;        // Points to type SECURITY_DESCRIPTOR
    SecurityQualityOfService: pointer;  // Points to type SECURITY_QUALITY_OF_SERVICE
  end;

  PLSA_UNICODE_STRING = ^LSA_UNICODE_STRING;
  _LSA_UNICODE_STRING = record
    Length: word;
    MaximumLength: word;
    Buffer: pointer;
  end;
  LSA_UNICODE_STRING = _LSA_UNICODE_STRING;
  TLsaUnicodeString = LSA_UNICODE_STRING;
  PLsaUnicodeString = PLSA_UNICODE_STRING;

  _USER_INFO_1 = record
    usri1_name: PWideChar;
    usri1_password: PWideChar;
    usri1_password_age: cardinal;
    usri1_priv: cardinal;
    usri1_home_dir: PWIdeChar;
    usri1_comment: PWIdeChar;
    usri1_flags: cardinal;
    usri1_script_path: PWIdeChar;
  end;
  TUserInfo1 = _USER_INFO_1;
  PUserInfo1 = ^TUserInfo1;

  PUserInfo2 = ^TUserInfo2;
  {$EXTERNALSYM _USER_INFO_2}
  _USER_INFO_2 = record
    usri2_name: LPWSTR;
    usri2_password: LPWSTR;
    usri2_password_age: DWORD;
    usri2_priv: DWORD;
    usri2_home_dir: LPWSTR;
    usri2_comment: LPWSTR;
    usri2_flags: DWORD;
    usri2_script_path: LPWSTR;
    usri2_auth_flags: DWORD;
    usri2_full_name: LPWSTR;
    usri2_usr_comment: LPWSTR;
    usri2_parms: LPWSTR;
    usri2_workstations: LPWSTR;
    usri2_last_logon: DWORD;
    usri2_last_logoff: DWORD;
    usri2_acct_expires: DWORD;
    usri2_max_storage: DWORD;
    usri2_units_per_week: DWORD;
    usri2_logon_hours: PBYTE;
    usri2_bad_pw_count: DWORD;
    usri2_num_logons: DWORD;
    usri2_logon_server: LPWSTR;
    usri2_country_code: DWORD;
    usri2_code_page: DWORD;
  end;
  TUserInfo2 = _USER_INFO_2;
  {$EXTERNALSYM USER_INFO_2}
  USER_INFO_2 = _USER_INFO_2;


function NetUserAdd(servername: LPCWSTR; level: DWORD; buf: Pointer; parm_err: PDWORD): NET_API_STATUS; stdcall; external 'netapi32.dll' name 'NetUserAdd';
function NetUserDel(servername: LPCWSTR; username: LPCWSTR): NET_API_STATUS; stdcall; external 'netapi32.dll' name 'NetUserDel';
function NetLocalGroupAddMember(servername: LPCWSTR; groupname: LPCWSTR; membersid: PSID): NET_API_STATUS; stdcall; external 'netapi32.dll' name 'NetLocalGroupAddMember';
function LsaOpenPolicy(SystemName: pointer; ObjectAttributes: pointer; DesiredAccess: dword; ptrPolicyHandle: pointer): NTSTATUS; stdcall; external 'Advapi32.dll'  name 'LsaOpenPolicy';
procedure ClosePolicy(PolicyHandle: integer); stdcall; external 'Advapi32.dll'  name 'LsaClose';
function LsaAddAccountRights(const PolicyHandle: integer; const AccountSid: PSID; ptrUserRights: pointer; const CountOfRights: integer): NTSTATUS; stdcall; external 'Advapi32.dll' name 'LsaAddAccountRights';
function LsaRemoveAccountRights(const PolicyHandle: integer; const AccountSid: PSID; const AllRights: BOOL; ptrUserRights: pointer; const CountOfRights: integer): NTSTATUS; stdcall; external 'Advapi32.dll' name 'LsaRemoveAccountRights';

function OpenPolicy(DesiredAccess: dword; out PolicyHandle: integer): NTSTATUS; stdcall;
var
    ObjectAttributes: LSA_OBJECT_ATTRIBUTES;
begin
//. Always initialize the object attributes to all zeroes.
ZeroMemory(@ObjectAttributes,sizeof(ObjectAttributes));
//. Attempt to open the policy.
PolicyHandle:=0;
Result:=LsaOpenPolicy(
          nil,
          @ObjectAttributes,
          DesiredAccess,
          @PolicyHandle
          );
end;

function GetAccountSid(AccountName: PWideChar; var SID: PSID): boolean; stdcall;
var
  ReferencedDomain: pointer;
  cbSid: dword;
  cchReferencedDomain: dword; // initial allocation size
  peUse: SID_NAME_USE;
  bSuccess: BOOL; // assume this function will fail
begin
Result:=FALSE;
bSuccess:=FALSE;
SID:=nil;
ReferencedDomain:=nil;
cbSid:=128;
cchReferencedDomain:=16;
try
//. initial memory allocations
SID:=HeapAlloc(GetProcessHeap(),0,cbSid);
if SID = nil then Exit; //. ->
ReferencedDomain:=HeapAlloc(GetProcessHeap(),0,cchReferencedDomain*2);
if ReferencedDomain = nil then Exit; //. ->
//. Obtain the SID of the specified account on the specified system.
while NOT LookupAccountNameW(
        nil, // machine to lookup account on
        AccountName,        // account to lookup
        Sid,                // SID of interest
        cbSid,              // size of SID
        ReferencedDomain,   // domain account was found on
        cchReferencedDomain,
        peUse
        ) do begin

  if GetLastError() = ERROR_INSUFFICIENT_BUFFER
   then begin
    //. reallocate memory
    Sid:=HeapReAlloc(GetProcessHeap(),0,Sid,cbSid);
    if SID = nil then Exit; //. ->;
    ReferencedDomain:=HeapReAlloc(GetProcessHeap(),0,ReferencedDomain,cchReferencedDomain*2);
    if ReferencedDomain = nil then Exit; //. ->
    end
   else
    Exit; //. ->
  end;
//. Indicate success.
bSuccess:=TRUE;
finally
//. Cleanup and indicate failure, if appropriate.
HeapFree(GetProcessHeap(), 0, ReferencedDomain);
end;
if NOT bSuccess AND (SID <> nil)
 then begin
  HeapFree(GetProcessHeap(), 0, Sid);
  SID:=nil;
  end;
Result:=bSuccess;
end;


function SetPrivilegeOnAccount(PolicyHandle: integer; AccountSid: PSID; PrivilegeName: WideString; bEnable: BOOL): NTSTATUS; stdcall;
var
  Privilege: TLsaUnicodeString;
  I: integer;
begin
with Privilege do begin
Length:=System.Length(PrivilegeName)*2;
MaximumLength:=Length;
GetMem(Buffer,Length);
for I:=1 to System.Length(PrivilegeName) do WideChar(Pointer(Integer(Buffer)+(I-1)*2)^):=PrivilegeName[I];
end;
try
//. grant or revoke the privilege, accordingly
if bEnable
 then
  Result:=LsaAddAccountRights(
    PolicyHandle,       // open policy handle
    AccountSid,         // target SID
    @Privilege,     // privileges
    1                   // privilege count
  )
else
 Result:=LsaRemoveAccountRights(
   PolicyHandle,       // open policy handle
   AccountSid,         // target SID
   FALSE,              // do not disable all rights
   @Privilege,     // privileges
   1                   // privilege count
 );
finally
with Privilege do GetMem(Buffer,Length);
end;
end;



procedure CreatePSCallBackAccount;
label
  TryAgainToCreate;
var
  ui: TUSERINFO1;
  nStatus: integer;
  PolicyHandle: integer;
  SID: PSID;
  WS: WideString;
begin
//. creating new user
TryAgainToCreate: ;
ui.usri1_name:=PSCallBackAccountName;
ui.usri1_password:='';
ui.usri1_priv:=USER_PRIV_USER;
ui.usri1_home_dir:=nil;
ui.usri1_comment:='ProxySpace callback account';
ui.usri1_flags:=UF_SCRIPT OR UF_PASSWD_CANT_CHANGE OR UF_DONT_EXPIRE_PASSWD OR UF_NORMAL_ACCOUNT;
ui.usri1_script_path:=nil;
nStatus:=NetUserAdd('', 1, @ui, 0);
case nStatus of
0: ;
NERR_UserExists: begin
  DestroyPSCallBackAccount;
  GoTo TryAgainToCreate;
  end;
else
  Raise Exception.Create('could not create Proxy-Space callback account (error code: '+IntToStr(nStatus)+')'); //. =>
end;
if NOT GetAccountSid(PSCallBackAccountName,SID) then Raise Exception.Create('could not get Proxy-Space callback account SID'); //. =>
nStatus:=NERR_GroupNotFound; /// ? NetLocalGroupAddMember(0,Гости,SID);
case nStatus of
0: ;
NERR_GroupNotFound: begin
  nStatus:=NetLocalGroupAddMember(0,'Guests',SID);
  if nStatus <> 0 then Raise Exception.Create('could not add Proxy-Space callback account to the Guests group'); //. =>
  end;
else
  Raise Exception.Create('could not add Proxy-Space callback account to the Guests group (error code: '+IntToStr(nStatus)+')'); //. =>
end;
//. rights assigments
if OpenPolicy(POLICY_ALL_ACCESS,PolicyHandle) <> 0 then Raise Exception.Create('could not open policy'); //. =>
try
//.
WS:='SeNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    TRUE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>
//.
WS:='SeDenyNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    FALSE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>}
//.
WS:='SeDenyInteractiveLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    TRUE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>}
//.
finally
ClosePolicy(PolicyHandle);
end;
end;

procedure DestroyPSCallBackAccount;
var
  PolicyHandle: integer;
  SID: PSID;
  WS: WideString;
begin
//. removing policy
if NOT GetAccountSid(PSCallBackAccountName,SID) then Exit; //. ->
if OpenPolicy(POLICY_ALL_ACCESS,PolicyHandle) <> 0 then Raise Exception.Create('could not open policy'); //. =>
try
//.
WS:='SeDenyInteractiveLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    FALSE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>}
//.
WS:='SeNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    FALSE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>
finally
ClosePolicy(PolicyHandle);
end;
//. removing user
if NetUserDel('',PSCallBackAccountName) <> 0 then Raise Exception.Create('could not destroy Proxy-Space callback account'); //. =>
end;


procedure EnableGuestAccount;
var
  nStatus: integer;
  PolicyHandle: integer;
  SID: PSID;        z
  WS: WideString;
begin
{/// ? if NOT GetAccountSid(Гость,SID)
 then}
  if NOT GetAccountSid('Guest',SID) then Raise Exception.Create('could not enable guest account (UserName = "Guest")'); //. =>
//. rights assigments
if OpenPolicy(POLICY_ALL_ACCESS,PolicyHandle) <> 0 then Raise Exception.Create('could not open policy'); //. =>
try
//.
WS:='SeNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    TRUE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>
//.
WS:='SeDenyNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    FALSE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>}
//.
finally
ClosePolicy(PolicyHandle);
end;
end;

procedure DisableGuestAccount;
var
  PolicyHandle: integer;
  SID: PSID;
  WS: WideString;
begin
//. removing policy
{/// ? if NOT GetAccountSid(Гость,SID)
 then}
  if NOT GetAccountSid('Guest',SID) then Raise Exception.Create('could not enable guest account (UserName = "Guest")'); //. =>
if OpenPolicy(POLICY_ALL_ACCESS,PolicyHandle) <> 0 then Raise Exception.Create('could not open policy'); //. =>
try
//.
WS:='SeNetworkLogonRight';
if SetPrivilegeOnAccount(
                    PolicyHandle,
                    SID,
                    WS,
                    FALSE
                    ) <> 0 then Raise Exception.Create('could not SetPrivilegeOnAccount'); //. =>
finally
ClosePolicy(PolicyHandle);
end;
//. removing user
if NetUserDel('',PSCallBackAccountName) <> 0 then Raise Exception.Create('could not destroy Proxy-Space callback account'); //. =>
end;




end.
