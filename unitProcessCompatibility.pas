unit unitProcessCompatibility;

interface

implementation
uses
  Windows,
  SysUtils,
  ActiveX,
  SOAPClient_TLB;


const
  SetProcessCompatibilityMarkerFile = 'TempDATA\SetupCompatibility';
  NotSetProcessCompatibilityMarkerFile = 'TempDATA\NotSetupCompatibility';

  
function WinExecAndWait32(FileName: String; Visibility : integer): dword;
var
  zAppName: array[0..255] of char;
  zCurDir: array[0..255] of char;
  WorkDir: String;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
StrPCopy(zAppName,FileName);
GetDir(0,WorkDir);
StrPCopy(zCurDir,WorkDir);
FillChar(StartupInfo,Sizeof(StartupInfo),#0);
StartupInfo.cb := Sizeof(StartupInfo);
StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
StartupInfo.wShowWindow := Visibility;
if not CreateProcess(nil,
  zAppName,                      { указатель командной строки }
  nil,                           { указатель на процесс атрибутов
  безопасности }
  nil,                           { указатель на поток атрибутов безопасности
  }
  false,                         { флаг родительского обработчика }
  CREATE_NEW_CONSOLE or          { флаг создания }
  NORMAL_PRIORITY_CLASS,
  nil,                           { указатель на новую среду процесса }
  nil,                           { указатель на имя текущей директории }
  StartupInfo,                   { указатель на STARTUPINFO }
  ProcessInfo)
 then
  Result:=$FFFFFFFF
 else begin
  WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
  GetExitCodeProcess(ProcessInfo.hProcess,Result);
  end;
end;

function WinExecAndNoWait32(FileName: String; Visibility : integer): dword;
var
  zAppName: array[0..255] of char;
  zCurDir: array[0..255] of char;
  WorkDir: String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
StrPCopy(zAppName,FileName);
GetDir(0,WorkDir);
StrPCopy(zCurDir,WorkDir);
FillChar(StartupInfo,Sizeof(StartupInfo),#0);
StartupInfo.cb := Sizeof(StartupInfo);
StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
StartupInfo.wShowWindow := Visibility;
if not CreateProcess(nil,
  zAppName,                      { указатель командной строки }
  nil,                           { указатель на процесс атрибутов
  безопасности }
  nil,                           { указатель на поток атрибутов безопасности
  }
  false,                         { флаг родительского обработчика }
  CREATE_NEW_CONSOLE or          { флаг создания }
  NORMAL_PRIORITY_CLASS,
  nil,                           { указатель на новую среду процесса }
  nil,                           { указатель на имя текущей директории }
  StartupInfo,                   { указатель на STARTUPINFO }
  ProcessInfo)
 then
  Result:=$FFFFFFFF
 else begin
  end;
end;

function IsProcessFirstStart(): boolean;
var
  ProgID: POleStr;
begin
Result:=(ProgIDFromCLSID(CLASS_coSpaceFunctionalServer,ProgID) <> S_OK);
end;

function IsSetProcessCompatibility(): boolean;
var
  FN: string;
begin
Result:=false;
FN:=ExtractFilePath(GetModuleName(HInstance))+SetProcessCompatibilityMarkerFile;
if (FileExists(FN))
 then begin
  DeleteFile(FN);
  Result:=true;
  Exit; //. ->
  end;
end;

function IsNotSetProcessCompatibility(): boolean;
var
  FN: string;
begin
Result:=false;
FN:=ExtractFilePath(GetModuleName(HInstance))+NotSetProcessCompatibilityMarkerFile;
if (FileExists(FN))
 then begin
  Result:=true;
  Exit; //. ->
  end;
end;

procedure WriteIsNotSetProcessCompatibilityMarkerFile();
var
  F: TextFile;
begin
AssignFile(F,ExtractFilePath(GetModuleName(HInstance))+NotSetProcessCompatibilityMarkerFile); ReWrite(F); CloseFile(F);
end;

function SetProcessCompatibilityIsNeeded(): boolean;
begin
Result:=(IsSetProcessCompatibility() OR IsProcessFirstStart());
end;

procedure RestartProcess();
var
  ProcessStr: string;
begin
ProcessStr:=GetCommandLine();
//.
WinExecAndNoWait32(ProcessStr,1);
//.
TerminateProcess(GetCurrentProcess,0);
end;

procedure SetupCompatibility();
begin
WinExecAndWait32(ExtractFilePath(GetModuleName(HInstance))+'Lib\CMD\SetupProcessCompatibilities.cmd',0);
//.
WriteIsNotSetProcessCompatibilityMarkerFile();
end;


Initialization
if (SetProcessCompatibilityIsNeeded() AND NOT IsNotSetProcessCompatibility())
 then begin
  SetupCompatibility();
  //.
  RestartProcess();
  end;


end.
