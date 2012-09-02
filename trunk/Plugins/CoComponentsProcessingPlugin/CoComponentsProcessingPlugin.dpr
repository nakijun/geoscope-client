library CoComponentsProcessingPlugin;
Uses
  ShareMem, //. FastMM4,
  Windows,
  SysUtils,
  Classes,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality,
  unitCoPhotoFunctionality,
  unitCoMusicClip1Functionality,
  unitCoClockFunctionality,
  unitCoWordDocFunctionality,
  unitCoExcelDocFunctionality,
  unitCoPlainTextDocFunctionality,
  unitCoPDFDocFunctionality,
  unitCoXMLDocFunctionality;
                         

Type
  TPluginStatus = (psUnknown,psInitializing,psFinalizing,psEnabled,psDisabled);
var
  PluginStatus: TPluginStatus = psUnknown;
  

{TTCoClockProcessing}
Type
  TTCoClockProcessing = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;

Constructor TTCoClockProcessing.Create;
begin
Inherited Create(false);
end;

procedure TTCoClockProcessing.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  ClocksList: TList;
begin Exit; /// +
with TCoComponentTypeFunctionality.Create(idTCoClock) do
try
GetInstanceList(ClocksList);
try
I:=0;
repeat
  if (I MOD (10*5)) = 0
   then
    for J:=0 to ClocksList.Count-1 do
      try
      with TCoClockFunctionality.Create(Integer(ClocksList[J])) do
      try
      SetNowTime;
      finally
      Release;
      end;
      except
        end;
  Sleep(WaitInterval);
  Inc(I);
until Terminated;
finally
ClocksList.Destroy;
end;
finally
Release;
end;
end;







var
  TCoClockProcessing: TTCoClockProcessing = nil;






function PluginName: shortstring; stdcall;
begin
Result:='CoComponents-processing-plugin';
end;

function GetPluginStatus: TPluginStatus; stdcall;
begin
Result:=PluginStatus;
end;

procedure Initialize; stdcall;
begin
PluginStatus:=psInitializing;
try
TCoClockProcessing:=TTCoClockProcessing.Create;
/// ? CoTypesFunctionality.Initialize;
finally
PluginStatus:=psEnabled;
end;
end;

procedure Finalize; stdcall;
begin
PluginStatus:=psFinalizing;
try
TCoClockProcessing.Free;
/// ? CoTypesFunctionality.Finalize;
finally
PluginStatus:=psDisabled;
end;
end;

procedure Enable; stdcall;
begin
PluginStatus:=psEnabled;
end;

procedure Disable; stdcall;
begin
PluginStatus:=psDisabled;
end;

procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
begin
end;

function CanCreateCoComponentByFile(const FileName: WideString; out idCoPrototype: integer): boolean; stdcall;
const
  idCoPhotoPrototype = 740;
  idCoMusicClip1Prototype = 767;
var
  FE,FileExt: string;
  I: integer;
  IL: TList;
begin
Result:=false;
FE:=ANSIUpperCase(ExtractFileExt(FileName));
if Length(FE) > 0
 then begin
  SetLength(FileExt,Length(FE)-1);
  for I:=2 to Length(FE) do FileExt[I-1]:=FE[I];
  end
 else FileExt:='';
with TTCoComponentTypeFunctionality.Create do
try
GetInstanceListByFileType(FileExt, IL);  
try
if IL.Count > 0
 then begin
  if IL.Count > 1 then Raise Exception.Create('there are more than one prototype for this type of file'); //. =>
  with TCoComponentTypeFunctionality.Create(Integer(IL[0])) do
  try
  idCoPrototype:=CoComponentPrototypeID;
  Result:=true;
  finally
  Release;
  end;
  end;
finally
IL.Destroy;
end;
finally
Release;
end;
//. old version
{if FileExt = '.JPG'
 then begin
  idCoPrototype:=idCoPhotoPrototype;
  Result:=true;
  end else
if FileExt = '.MP3'
 then begin
  idCoPrototype:=idCoMusicClip1Prototype;
  Result:=true;
  end;}
end;

function CoComponent_LoadByFile(const idCoComponent: integer; const FileName: WideString): boolean; stdcall;
begin
Result:=false;
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoComponent) do
try
ProxySpace__Log_OperationStarting('file loading ...');
try
LoadFromFile(FileName);
Result:=true;
finally
ProxySpace__Log_OperationDone;
end;
finally
Release;
end;
end;


Exports
  PluginName,
  GetPluginStatus,
  Initialize,
  Finalize,
  Enable,
  Disable,
  DoOnComponentOperation,
  CanCreateCoComponentByFile,
  CoComponent_LoadByFile;

begin
end.
 