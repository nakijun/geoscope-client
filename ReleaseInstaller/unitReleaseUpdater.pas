//. Система обновления программы. Базируется на релизах(Releases) и обновлениях(Updates). Релиз/обновление имеет
//. номер, по другому называемый - уровнем. Уровень - это время выпуска релиза/обновления в формате DDMMYY[HHNN]. Узнать
//. текущий уровень программы можно в файле ReleaseInfo. Все обновления (Updates) кумулятивны, т.е. содержат в себе все
//. предыдущие обновления вплоть до релиза. Информация о вышедших релизах находится на сервере и извлекается методом
//. ClientProgram_GetReleases()

unit unitReleaseUpdater;
interface

uses
  Windows, SyncObjs, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines, StdCtrls;

const
  ReleaseInstallerModule = 'ReleaseInstaller\ReleaseInstaller.exe';
  InstallReleaseSeverityFile = 'InstallReleaseSeverity';
  InstallUpdateSeverityFile = 'InstallUpdateSeverity';
type
  TReleaseUpdater = class
  private
    Lock: TCriticalSection;
    ReleasesData: TByteArray;

    procedure LoadInstallSeverities;
    procedure LoadReleasesData();
    function NewReleaseIsAvailable(out NewReleaseLevel: string; out NewReleaseDescription: string; out NewReleaseURL: string): boolean;
    function NewUpdateIsAvailable(out NewUpdateLevel: string; out NewUpdateDescription: string; out NewUpdateURL: string): boolean;
  public
    InstallReleaseSeverity: integer;
    InstallUpdateSeverity: integer;
    //.
    flDisabled: boolean;
    flChecked: boolean;
    //.
    NewReleaseLevel: string;
    NewReleaseDescription: string;
    NewReleaseURL: string;
    NewUpdateLevel: string;
    NewUpdateDescription: string;
    NewUpdateURL: string;

    Constructor Create;
    Destructor Destroy; override;
    procedure Check();
    procedure SaveInstallSeverities;
    function ReleaseToInstallIsAvailable(): boolean;
    function UpdateToInstallIsAvailable(): boolean;
    class procedure StartReleaseInstaller(const URL: string);
    function InstallReleaseDialog(out oNewReleaseLevel: string; out oNewReleaseURL: string): boolean;
    function InstallUpdateDialog(out oNewUpdateLevel: string; out oNewUpdateURL: string): boolean;
  end;

  TfmReleaseUpdater = class(TForm)
    stInfo: TStaticText;
    btnInstall: TButton;
    btnCancel: TButton;
    cbSupressNewReleases: TCheckBox;
    cbSupressNewUpdates: TCheckBox;
    memoDescription: TMemo;
    procedure btnInstallClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbSupressNewReleasesClick(Sender: TObject);
    procedure cbSupressNewUpdatesClick(Sender: TObject);
  private
    { Private declarations }
    ReleaseUpdater: TReleaseUpdater;
    flInstall: boolean;
  public
    { Public declarations }
    Constructor Create(const pReleaseUpdater: TReleaseUpdater);
    function InstallReleaseDialog(): boolean;
    function InstallUpdateDialog(): boolean;
  end;


implementation
uses
  ShellAPI,
  ActiveX,
  MSXML,
  DateUtils,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality;

{$R *.dfm}


{TReleaseUpdater}
Constructor TReleaseUpdater.Create;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
flDisabled:=false;
flChecked:=false;
NewReleaseLevel:='';
NewReleaseURL:='';
NewUpdateLevel:='';
NewUpdateURL:='';
InstallReleaseSeverity:=0;
InstallUpdateSeverity:=0;
LoadInstallSeverities;
end;

Destructor TReleaseUpdater.Destroy;
begin
Lock.Free;
Inherited;
end;

procedure TReleaseUpdater.LoadInstallSeverities;
var
  FN: string;
begin
with TProxySpaceUserProfile.Create(ProxySpace) do
try
FN:=ProfileFolder+'\'+InstallReleaseSeverityFile;
if (FileExists(FN))
 then
  try
  with TMemoryStream.Create() do
  try
  LoadFromFile(FN);
  Position:=0;
  Read(InstallReleaseSeverity,SizeOf(InstallReleaseSeverity));
  finally
  Destroy;
  end;
  except
    end;
FN:=ProfileFolder+'\'+InstallUpdateSeverityFile;
if (FileExists(FN))
 then
  try
  with TMemoryStream.Create() do
  try
  LoadFromFile(FN);
  Position:=0;
  Read(InstallUpdateSeverity,SizeOf(InstallUpdateSeverity));
  finally
  Destroy;
  end;
  except
    end;
finally
Destroy;
end;
end;

procedure TReleaseUpdater.SaveInstallSeverities;
var
  FN: string;
begin
with TProxySpaceUserProfile.Create(ProxySpace) do
try
FN:=ProfileFolder+'\'+InstallReleaseSeverityFile;
if (InstallReleaseSeverity > 0)
 then
  try
  with TMemoryStream.Create() do
  try
  Write(InstallReleaseSeverity,SizeOf(InstallReleaseSeverity));
  SaveToFile(FN);
  finally
  Destroy;
  end;
  except
    end
 else DeleteFile(FN);
FN:=ProfileFolder+'\'+InstallUpdateSeverityFile;
if (InstallUpdateSeverity > 0)
 then
  try
  with TMemoryStream.Create() do
  try
  Write(InstallUpdateSeverity,SizeOf(InstallUpdateSeverity));
  SaveToFile(FN);
  finally
  Destroy;
  end;
  except
    end
 else DeleteFile(FN);
finally
Destroy;
end;
end;

function ConvertReleaseLevelToDateTime(const S: string): TDateTime;
var
  Days,Months,Years,Hours,Mins: integer;
begin
if (Length(S) < 6) then Raise Exception.Create('wrong ReleaseLevel string'); //. =>
Days:=StrToInt(S[1]+S[2]);
Months:=StrToInt(S[3]+S[4]);
Years:=2000+StrToInt(S[5]+S[6]);
Hours:=0;
Mins:=0;
if (Length(S) >= 8)
 then Hours:=StrToInt(S[7]+S[8])
 else
  if (Length(S) >= 10)
   then Mins:=StrToInt(S[9]+S[10]);
Result:=EncodeDateTime(Years,Months,Days,Hours,Mins,0,0);
end;

procedure TReleaseUpdater.LoadReleasesData;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,ProxySpace.UserID)) do
try
ClientProgram_GetReleases(Integer(mucpSOAPClient),Localization,{out} ReleasesData);
finally
Release;
end;
end;

function TReleaseUpdater.NewReleaseIsAvailable(out NewReleaseLevel: string; out NewReleaseDescription: string; out NewReleaseURL: string): boolean;
var
  MS: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ReleasesNode,ReleaseNode,ReleaseSeverityNode,ReleaseDescriptionNode,ReleaseURLsNode,ReleaseURLNode: IXMLDOMNode;
  I: integer;
  ReleaseLevelString: string;
  ReleaseLevel: double;
  ReleaseSeverity: integer;
  ReleaseDescriptionString: string;
begin
Result:=false;
NewReleaseLevel:='';
NewReleaseDescription:='';
NewReleaseURL:='';
//.
if (Length(ReleasesData) = 0) then Exit; //. ->
//.
MS:=TMemoryStream.Create;
try
MS.Write(Pointer(@ReleasesData[0])^,Length(ReleasesData));
MS.Position:=0;
OLEStream:=TStreamAdapter.Create(MS);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version < 1) then Raise Exception.Create('unsupported releases data version'); //. =>
ReleasesNode:=RootNode.selectSingleNode('Releases');
for I:=0 to ReleasesNode.childNodes.length-1 do begin
  ReleaseNode:=ReleasesNode.childNodes[I];
  //.
  ReleaseLevelString:=ReleaseNode.nodeName;
  ReleaseLevelString:=Copy(ReleaseLevelString,2,Length(ReleaseLevelString)-1);
  ReleaseLevel:=ConvertReleaseLevelToDateTime(ReleaseLevelString);
  //.
  ReleaseSeverityNode:=ReleaseNode.selectSingleNode('Severity');
  ReleaseSeverity:=ReleaseSeverityNode.nodeTypedValue;
  //.
  if ((ReleaseLevel > ProxySpace.ReleaseLevel) AND (ReleaseSeverity >= InstallReleaseSeverity))
   then begin
    ReleaseDescriptionNode:=ReleaseNode.selectSingleNode('Description');
    ReleaseDescriptionString:=ReleaseDescriptionNode.nodeTypedValue;
    //.
    ReleaseURLsNode:=ReleaseNode.selectSingleNode('URLs');
    if (ReleaseURLsNode.childNodes.length > 0)
     then begin
      NewReleaseLevel:=ReleaseLevelString;
      NewReleaseDescription:=ReleaseDescriptionString;
      NewReleaseURL:=ReleaseURLsNode.childNodes[Random(ReleaseURLsNode.childNodes.length)].nodeTypedValue;
      Result:=true;
      Exit; //. ->
      end;
    end;
  end;
finally
MS.Destroy;
end;
end;

function TReleaseUpdater.NewUpdateIsAvailable(out NewUpdateLevel: string; out NewUpdateDescription: string; out NewUpdateURL: string): boolean;
var
  MS: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ReleasesNode,ReleaseNode,ReleaseUpdatesNode,UpdateNode,UpdateSeverityNode,UpdateDescriptionNode,UpdateURLsNode,UpdateURLNode: IXMLDOMNode;
  I,J: integer;
  ReleaseLevelString: string;
  ReleaseLevel: double;
  UpdateLevelString: string;
  UpdateLevel: double;
  UpdateSeverity: integer;
  UpdateDescriptionString: string;
begin
Result:=false;
NewUpdateLevel:='';
NewUpdateDescription:='';
NewUpdateURL:='';
//.
if (Length(ReleasesData) = 0) then Exit; //. ->
//.
MS:=TMemoryStream.Create;
try
MS.Write(Pointer(@ReleasesData[0])^,Length(ReleasesData));
MS.Position:=0;
OLEStream:=TStreamAdapter.Create(MS);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
VersionNode:=RootNode.selectSingleNode('Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version < 1) then Raise Exception.Create('unsupported releases data version'); //. =>
ReleasesNode:=RootNode.selectSingleNode('Releases');
for I:=0 to ReleasesNode.childNodes.length-1 do begin
  ReleaseNode:=ReleasesNode.childNodes[I];
  //.
  ReleaseLevelString:=ReleaseNode.nodeName;
  ReleaseLevelString:=Copy(ReleaseLevelString,2,Length(ReleaseLevelString)-1);
  ReleaseLevel:=ConvertReleaseLevelToDateTime(ReleaseLevelString);
  //.
  if (ReleaseLevel = ProxySpace.ReleaseLevel)
   then begin
    ReleaseUpdatesNode:=ReleaseNode.selectSingleNode('Updates');
    //.
    if (ReleaseUpdatesNode <> nil)
     then
      for J:=0 to ReleaseUpdatesNode.childNodes.length-1 do begin
        UpdateNode:=ReleaseUpdatesNode.childNodes[J];
        //.
        UpdateLevelString:=UpdateNode.nodeName;
        UpdateLevelString:=Copy(UpdateLevelString,2,Length(UpdateLevelString)-1);
        UpdateLevel:=ConvertReleaseLevelToDateTime(UpdateLevelString);
        //.
        UpdateSeverityNode:=UpdateNode.selectSingleNode('Severity');
        UpdateSeverity:=UpdateSeverityNode.nodeTypedValue;
        //.
        if ((UpdateLevel > ProxySpace.ReleaseLevel) AND (UpdateSeverity >= InstallUpdateSeverity))
         then begin
          UpdateDescriptionNode:=UpdateNode.selectSingleNode('Description');
          UpdateDescriptionString:=UpdateDescriptionNode.nodeTypedValue;
          //.
          UpdateURLsNode:=UpdateNode.selectSingleNode('URLs');
          if (UpdateURLsNode.childNodes.length > 0)
           then begin
            NewUpdateLevel:=UpdateLevelString;
            NewUpdateDescription:=UpdateDescriptionString;
            NewUpdateURL:=UpdateURLsNode.childNodes[Random(UpdateURLsNode.childNodes.length)].nodeTypedValue;
            Result:=true;
            Exit; //. ->
            end;
          end;
        end;
    end;
  end;
finally
MS.Destroy;
end;
end;

procedure TReleaseUpdater.Check();
var
  _NewReleaseLevel,_NewReleaseDescription,_NewReleaseURL,_NewUpdateLevel,_NewUpdateDescription,_NewUpdateURL: string;
begin
if (flChecked) then Exit; //. ->
//.
LoadReleasesData();
NewReleaseIsAvailable({out} _NewReleaseLevel,_NewReleaseDescription,_NewReleaseURL);
NewUpdateIsAvailable({out} _NewUpdateLevel,_NewUpdateDescription,_NewUpdateURL);
//.
Lock.Enter;
try
NewReleaseLevel:=_NewReleaseLevel;
NewReleaseDescription:=_NewReleaseDescription;
NewReleaseURL:=_NewReleaseURL;
NewUpdateLevel:=_NewUpdateLevel;
NewUpdateDescription:=_NewUpdateDescription;
NewUpdateURL:=_NewUpdateURL;
flChecked:=true;
finally
Lock.Leave;
end;
end;

function TReleaseUpdater.ReleaseToInstallIsAvailable(): boolean;
begin
Lock.Enter;
try
Result:=(NewReleaseLevel <> '');
finally
Lock.Leave;
end;
end;

function TReleaseUpdater.UpdateToInstallIsAvailable(): boolean;
begin
Lock.Enter;
try
Result:=(NewUpdateLevel <> '');
finally
Lock.Leave;
end;
end;

class procedure TReleaseUpdater.StartReleaseInstaller(const URL: string);
begin
if (URL = '') then Exit; //. ->
ShellExecute(0,nil,PChar(ReleaseInstallerModule),PChar(URL),nil, SW_SHOW);
end;

function TReleaseUpdater.InstallReleaseDialog(out oNewReleaseLevel: string; out oNewReleaseURL: string): boolean;
begin
Result:=false;
oNewReleaseLevel:='';
oNewReleaseURL:='';
//.
with TfmReleaseUpdater.Create(Self) do
try
if (InstallReleaseDialog())
 then begin
  oNewReleaseLevel:=NewReleaseLevel;
  oNewReleaseURL:=NewReleaseURL;
  Result:=true;
  Exit; //. ->
  end;
finally
Destroy;
end;
end;

function TReleaseUpdater.InstallUpdateDialog(out oNewUpdateLevel: string; out oNewUpdateURL: string): boolean;
begin
Result:=false;
oNewUpdateLevel:='';
oNewUpdateURL:='';
//.
with TfmReleaseUpdater.Create(Self) do
try
if (InstallUpdateDialog())
 then begin
  oNewUpdateLevel:=NewUpdateLevel;
  oNewUpdateURL:=NewUpdateURL;
  Result:=true;
  Exit; //. ->
  end;
finally
Destroy;
end;
end;


{TfmReleaseUpdater}
Constructor TfmReleaseUpdater.Create(const pReleaseUpdater: TReleaseUpdater);
begin
Inherited Create(nil);
ReleaseUpdater:=pReleaseUpdater;
cbSupressNewReleases.Checked:=(ReleaseUpdater.InstallReleaseSeverity = 3);
cbSupressNewUpdates.Checked:=(ReleaseUpdater.InstallUpdateSeverity = 3);
end;

function TfmReleaseUpdater.InstallReleaseDialog(): boolean;
begin
stInfo.Caption:='A new release (v'+ReleaseUpdater.NewReleaseLevel+') is available for installing. Install it ?';
memoDescription.Text:=ReleaseUpdater.NewReleaseDescription;
flInstall:=false;
ShowModal();
Result:=flInstall;
end;

function TfmReleaseUpdater.InstallUpdateDialog(): boolean;
begin
stInfo.Caption:='A new update pack (v'+ReleaseUpdater.NewUpdateLevel+') is available for installing. Install it ?';
memoDescription.Text:=ReleaseUpdater.NewUpdateDescription;
flInstall:=false;
ShowModal();
Result:=flInstall;
end;

procedure TfmReleaseUpdater.btnInstallClick(Sender: TObject);
begin
flInstall:=true;
Close();
end;

procedure TfmReleaseUpdater.btnCancelClick(Sender: TObject);
begin
Close();
end;

procedure TfmReleaseUpdater.cbSupressNewReleasesClick(Sender: TObject);
begin
if (cbSupressNewReleases.Checked)
 then ReleaseUpdater.InstallReleaseSeverity:=3
 else ReleaseUpdater.InstallReleaseSeverity:=0;
ReleaseUpdater.SaveInstallSeverities()
end;

procedure TfmReleaseUpdater.cbSupressNewUpdatesClick(Sender: TObject);
begin
if (cbSupressNewUpdates.Checked)
 then ReleaseUpdater.InstallUpdateSeverity:=3
 else ReleaseUpdater.InstallUpdateSeverity:=0;
ReleaseUpdater.SaveInstallSeverities()
end;


end.
