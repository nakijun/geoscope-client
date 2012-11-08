unit CoFunctionality;
Interface
Uses
  Windows,
  SysUtils,
  Classes,
  Graphics,
  Forms,
  GlobalSpaceDefines,
  FunctionalityImport;

  
Const
  //. transferred from TypesDefines.pas
  nmTCoComponent = 'CoComponent';
  idTCoComponent = 2015;

  nmTCoComponentTypeMarker = 'Co-type marker';
  idTCoComponentTypeMarker = 2017;

  nmTCoComponentType = 'Co-type';
  idTCoComponentType = 2016;
  //.


Type
  TCoComponentFunctionality = class;
  TCoComponentFunctionalityClass = class of TCoComponentFunctionality;

  TCoComponentTypesSystem = class(TThreadList)
  public
    //.
    function TCoComponentFunctionality_Create(const idCoComponent: integer): TCoComponentFunctionality; overload;
    function TCoComponentFunctionality_Create(const pidCoType: integer; const idCoComponent: integer): TCoComponentFunctionality; overload;
    //.
    function CanSupportCoType(const pidCoType: integer): boolean;
    function GetCreateCompletionObject(const pidCoType: integer): TCreateCompletionObject; 
    function CanSupportFunctionality(pCoComponentFunctionalityClass: TCoComponentFunctionalityClass; out TypesSystemList: TList): boolean;
  end;

  TCoComponentTypeSystem = class
  public
    idCoType: integer;
    CoComponentFunctionalityClass: TCoComponentFunctionalityClass;
    
    Constructor Create(const pidCoType: integer; pCoComponentFunctionalityClass: TCoComponentFunctionalityClass); virtual;
    Destructor Destroy; override;
    function GetCreateCompletionObject(): TCreateCompletionObject; virtual;
  end;

  TTCoComponentTypeFunctionality = class(TFunctionality)
  public
    procedure GetInstanceListByFileType(const FileType: shortstring; out List: TList);
  end;

  TCoComponentTypeFunctionality = class(TFunctionality)
  public
    idCoType: integer;

    Constructor Create(const pidCoType: integer);
    procedure DestroyInstance(const idCoComponent: integer); virtual;
    procedure GetInstanceList(out InstanceList: TList); virtual;
    function CoComponentPrototypeID: integer;
  end;

  EInvalidTypeForm = class(Exception);

  TCoComponentFunctionality = class(TFunctionality)
  public
    idCoComponent: integer;
    CoComponentFunctionality: FunctionalityImport.TCoComponentFunctionality;

    Constructor Create(const pidCoComponent: integer); virtual;
    Destructor Destroy; override;
    procedure UpdateDATA; override;
    function idCoType: integer;
    function IsWellformed: boolean; virtual;
    procedure CheckWellformedness;
    procedure GetTypedData(const pUserName: WideString; const pUserPassword: WideString; const DataType: Integer; out Data: TByteArray); virtual; abstract;
    procedure SetTypedData(const pUserName: WideString; const pUserPassword: WideString; const DataType: Integer; const Data: TByteArray); virtual; abstract;
    function GetInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function TStatusBar_Create(const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar; virtual;
    function Clone: integer;
    function TPropsPanel_Create: TForm; virtual; abstract;
    procedure LoadFromFile(const FileName: string); virtual;
    procedure SaveToFile(const FileName: string); virtual;
    function Visualization_ReflectV0(pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean; virtual; abstract;
  end;

var
  CoComponentTypesSystem: TCoComponentTypesSystem = nil;


Implementation



{TCoComponentTypesSystem}
function TCoComponentTypesSystem.TCoComponentFunctionality_Create(const pidCoType: integer; const idCoComponent: integer): TCoComponentFunctionality;
var
  I: integer;
begin
with LockList do
try
for I:=0 to Count-1 do with TCoComponentTypeSystem(List[I]) do
  if (idCoType = pidCoType)
   then begin
    Result:=CoComponentFunctionalityClass.Create(idCoComponent);
    Exit; //. ->
    end;
Raise Exception.Create('CoType '+IntToStr(pidCoType)+' is not found'); //. =>
finally
UnLockList;
end;
end;

function TCoComponentTypesSystem.TCoComponentFunctionality_Create(const idCoComponent: integer): TCoComponentFunctionality;
begin
with TCoComponentFunctionality.Create(idCoComponent) do
try
Result:=TCoComponentFunctionality_Create(idCoType,idCoComponent);
finally
Release;
end;
end;

function TCoComponentTypesSystem.CanSupportCoType(const pidCoType: integer): boolean;
var
  I: integer;
begin
Result:=false;
with LockList do
try
for I:=0 to Count-1 do with TCoComponentTypeSystem(List[I]) do
  if (idCoType = pidCoType)
   then begin
    Result:=true;
    Exit; //. ->
    end;
finally
UnLockList;
end;
end;

function TCoComponentTypesSystem.GetCreateCompletionObject(const pidCoType: integer): TCreateCompletionObject; 
var
  I: integer;
begin
Result:=nil;
with LockList do
try
for I:=0 to Count-1 do with TCoComponentTypeSystem(List[I]) do
  if (idCoType = pidCoType)
   then begin
    Result:=GetCreateCompletionObject();
    Exit; //. ->
    end;
finally
UnLockList;
end;
end;

function TCoComponentTypesSystem.CanSupportFunctionality(pCoComponentFunctionalityClass: TCoComponentFunctionalityClass; out TypesSystemList: TList): boolean;
var
  I: integer;
begin
Result:=false;
TypesSystemList:=nil;
try
with LockList do
try
for I:=0 to Count-1 do with TCoComponentTypeSystem(List[I]) do
  if (CoComponentFunctionalityClass = pCoComponentFunctionalityClass)
   then begin
    if TypesSystemList = nil
     then begin
      TypesSystemList:=TList.Create;
      Result:=true;
      end;
    TypesSystemList.Add(TCoComponentTypeSystem(List[I]));
    end;
finally
UnLockList;
end;
except
  TypesSystemList.Free;
  TypesSystemList:=nil;
  Raise; //. =>
  end;
end;

{TCoComponentTypeSystem}
Constructor TCoComponentTypeSystem.Create(const pidCoType: integer; pCoComponentFunctionalityClass: TCoComponentFunctionalityClass);
begin
Inherited Create;
idCoType:=pidCoType;
CoComponentFunctionalityClass:=pCoComponentFunctionalityClass;
CoComponentTypesSystem.Add(Self);
end;

Destructor TCoComponentTypeSystem.Destroy;
begin
CoComponentTypesSystem.Remove(Self);
Inherited;
end;

function TCoComponentTypeSystem.GetCreateCompletionObject(): TCreateCompletionObject;
begin
Result:=nil;
end;


{TTCoComponentTypeFunctionality}
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType(const FileType: shortstring; out List: TList);
begin
List:=nil;
try
with FunctionalityImport.TTCoComponentTypeFunctionality(TTypeFunctionality_Create(idTCoComponentType)) do
try
GetInstanceListByFileType1(FileType, List);
finally
Release;
end;
except
  FreeAndNil(List);
  Raise; //. =>
  end;
end;


{TCoComponentTypeFunctionality}
Constructor TCoComponentTypeFunctionality.Create(const pidCoType: integer);
begin
Inherited Create;
idCoType:=pidCoType;
end;

procedure TCoComponentTypeFunctionality.DestroyInstance(const idCoComponent: integer);
begin
with FunctionalityImport.TCoComponentTypeFunctionality.Create do
try
DestroyInstance(idCoComponent);
finally
Release;
end;
end;

procedure TCoComponentTypeFunctionality.GetInstanceList(out InstanceList: TList);
var
  MarkersList: TList;
  I: integer;
  idTOwner,idOwner: integer;
begin
InstanceList:=TList.Create;
try
with FunctionalityImport.TCoComponentTypeFunctionality(TComponentFunctionality_Create(idTCoComponentType,idCoType)) do
try
GetMarkersList1(MarkersList);
try
for I:=0 to MarkersList.Count-1 do with TComponentFunctionality_Create(idTCoComponentTypeMarker,Integer(MarkersList[I])) do
  try
  if GetOwner(idTOwner,idOwner) AND (idTOwner = idTCoComponent) then InstanceList.Add(Pointer(idOwner));
  finally
  Release;
  end;
finally
MarkersList.Destroy;
end;
finally
Release;
end;
except
  InstanceList.Destroy;
  Raise; //. =>
  end;
end;

function TCoComponentTypeFunctionality.CoComponentPrototypeID: integer;
begin
with FunctionalityImport.TCoComponentTypeFunctionality(TComponentFunctionality_Create(idTCoComponentType,idCoType)) do
try
Result:=CoComponentPrototypeID;
finally
Release;
end;
end;


{TCoComponentFunctionality}
Constructor TCoComponentFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create;
idCoComponent:=pidCoComponent;
CoComponentFunctionality:=FunctionalityImport.TCoComponentFunctionality(TComponentFunctionality_Create(idTCoComponent,idCoComponent));
UpdateDATA;
end;

Destructor TCoComponentFunctionality.Destroy;
begin
CoComponentFunctionality.Release;
Inherited;
end;

procedure TCoComponentFunctionality.UpdateDATA;
begin
end;

function TCoComponentFunctionality.idCoType: integer;
begin
Result:=CoComponentFunctionality.idCoType
end;

function TCoComponentFunctionality.IsWellformed: boolean;
begin
Result:=true;
end;

procedure TCoComponentFunctionality.CheckWellformedness;
begin
if NOT IsWellformed then Raise EInvalidTypeForm.Create('invalid form'); //. =>
end;

function TCoComponentFunctionality.GetInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
begin
Info:=nil;
Result:=false;
end;

function TCoComponentFunctionality.GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
begin
Info:=nil;
Result:=false;
end;

function TCoComponentFunctionality.TStatusBar_Create(const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar;
begin
Result:=nil;
end;

function TCoComponentFunctionality.Clone: integer;
begin
TComponentFunctionality(CoComponentFunctionality).ToClone(Result);
if Result = 0 then Raise Exception.Create('could not clone co-component'); //. =>
end;

procedure TCoComponentFunctionality.LoadFromFile(const FileName: string);
begin
Raise Exception.Create('method LoadFromFile not supported for this component'); //. =>
end;

procedure TCoComponentFunctionality.SaveToFile(const FileName: string);
begin
Raise Exception.Create('method SaveToFile not supported for this component'); //. =>
end;



Initialization
CoComponentTypesSystem:=TCoComponentTypesSystem.Create;

Finalization
CoComponentTypesSystem.Free;

end.
