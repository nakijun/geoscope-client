unit unitMODELServerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines, TypesFunctionality, unitReflector, unitChanels, MODELServerUsageMonitor_TLB, unitMonitor, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Menus;

type
  TMODELServerPanelProps = class(TSpaceObjPanelProps)
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edIPAddress: TEdit;
    OnlineImage: TImage;
    lbCaption: TLabel;
    pnlCPUUsage: TPanel;
    pnlHDDUsage: TPanel;
    UsageUpdater: TTimer;
    pnlMEMUsage: TPanel;
    OfflineImage: TImage;
    Bevel1: TBevel;
    Label4: TLabel;
    Bevel2: TBevel;
    bbCrewNewUser: TBitBtn;
    bbLogoutAndConnect: TBitBtn;
    bbLogoutAndConnectAs: TBitBtn;
    Bevel3: TBevel;
    bbLogoutAndConnectAsAnonymous: TBitBtn;
    Label3: TLabel;
    memoLicense: TMemo;
    memoInfo: TMemo;
    Label5: TLabel;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edIPAddressKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UsageUpdaterTimer(Sender: TObject);
    procedure bbCrewNewUserClick(Sender: TObject);
    procedure bbLogoutAndConnectClick(Sender: TObject);
    procedure bbLogoutAndConnectAsClick(Sender: TObject);
    procedure bbLogoutAndConnectAsAnonymousClick(Sender: TObject);
  private
    { Private declarations }
    CPUUsageLineFilter: TLineFilter;
    fmCPUUsageMonitor: TfmMonitor;

    HDDUsageLineFilter: TLineFilter;
    fmHDDUsageMonitor: TfmMonitor;

    MEMUsageLineFilter: TLineFilter;
    fmMEMUsageMonitor: TfmMonitor;

    MODELServerStatistics: IMODELServerStatistics;

    flOnLine: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  ComObj,
  ComServ,
  ShellAPI,
  unitRegistrationForm;

{$R *.DFM}


Constructor TMODELServerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  IUnk: System.IUnknown;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
//.
CPUUsageLineFilter:=TLineFilter.Create(nil);
CPUUsageLineFilter.SetChanels(1);
with TChanel(CPUUsageLineFilter[0]) do begin
Name:='CPU';
ZeroLevel:=0;
Range:=100;
end;
with TProxySpaceUserProfile.Create(ObjFunctionality.Space) do
try
SetProfileFile('MODELServer.CPUUsage.cfg');
fmCPUUsageMonitor:=TfmMonitor.Create(CPUUsageLineFilter,ProfileFile);
finally
Destroy;
end;
with fmCPUUsageMonitor do begin
BorderStyle:=bsNone;
Parent:=pnlCPUUsage;
Align:=alClient;
Color:=pnlCPUUsage.Color;
Show;
end;
//.
HDDUsageLineFilter:=TLineFilter.Create(nil);
HDDUsageLineFilter.SetChanels(1);
with TChanel(HDDUsageLineFilter[0]) do begin
Name:='HDD';
ZeroLevel:=0;
Range:=100;
end;
with TProxySpaceUserProfile.Create(ObjFunctionality.Space) do
try
SetProfileFile('MODELServer.HDDUsage.cfg');
fmHDDUsageMonitor:=TfmMonitor.Create(HDDUsageLineFilter,ProfileFile);
finally
Destroy;
end;
with fmHDDUsageMonitor do begin
BorderStyle:=bsNone;
Parent:=pnlHDDUsage;
Align:=alClient;
Color:=pnlHDDUsage.Color;
Show;
end;
//.
MEMUsageLineFilter:=TLineFilter.Create(nil);
MEMUsageLineFilter.SetChanels(1);
with TChanel(MEMUsageLineFilter[0]) do begin
Name:='MEM';
ZeroLevel:=0;
Range:=100;
end;
with TProxySpaceUserProfile.Create(ObjFunctionality.Space) do
try
SetProfileFile('MODELServer.MEMUsage.cfg');
fmMEMUsageMonitor:=TfmMonitor.Create(MEMUsageLineFilter,ProfileFile);
finally
Destroy;
end;
with fmMEMUsageMonitor do begin
BorderStyle:=bsNone;
Parent:=pnlMEMUsage;
Align:=alClient;
Color:=pnlMEMUsage.Color;
Show;
end;
//.
try
IUnk:=CreateRemoteComObject(TMODELServerFunctionality(ObjFunctionality).IPAddress, CLASS_coMODELServerStatistics);
IUnk.QueryInterface(IID_IMODELServerStatistics, MODELServerStatistics);
except
  end;
//.
Update;
end;

destructor TMODELServerPanelProps.Destroy;
begin
MODELServerStatistics:=nil;
//.
fmMEMUsageMonitor.Free;
MEMUsageLineFilter.Free;
//.
fmHDDUsageMonitor.Free;
HDDUsageLineFilter.Free;
//.
fmCPUUsageMonitor.Free;
CPUUsageLineFilter.Free;
Inherited;
end;

procedure TMODELServerPanelProps._Update;

  procedure PrepareString(var S: string);
  var
    _S: String;
    I: integer;
  begin
  _S:=S; S:='';
  for I:=1 to Length(_S) do
    if _S[I] = #$0A
     then S:=S+#$0D+_S[I]
     else S:=S+_S[I];
  end;

var
  License: WideString;
  S: string;
begin
Inherited;
edName.Text:=TMODELServerFunctionality(ObjFunctionality).Name;
edIPAddress.Text:=TMODELServerFunctionality(ObjFunctionality).IPAddress;
if TMODELServerFunctionality(ObjFunctionality).IPAddress = ObjFunctionality.Space.SOAPServerURL
 then begin
  bbLogoutAndConnect.Hide;
  bbLogoutAndConnectAs.Hide;
  bbLogoutAndConnectAsAnonymous.Hide;
  end
 else begin
  bbLogoutAndConnect.Show;
  bbLogoutAndConnectAs.Show;
  bbLogoutAndConnectAsAnonymous.Show;
  end;
flOnLine:=TMODELServerFunctionality(ObjFunctionality).IsOnLine;
//.
TMODELServerFunctionality(ObjFunctionality).GetLicense(License);
S:=License;
if S <> ''
 then begin PrepareString(S); memoLicense.Text:=S; end
 else memoLicense.Text:='not found';
S:=TMODELServerFunctionality(ObjFunctionality).Info; PrepareString(S);
memoInfo.Text:=S;
end;

procedure TMODELServerPanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TMODELServerFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMODELServerPanelProps.edIPAddressKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TMODELServerFunctionality(ObjFunctionality).IPAddress:=edIPAddress.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TMODELServerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMODELServerPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edIPAddress.Text:='';
memoLicense.Clear;
memoInfo.Clear;
end;


procedure TMODELServerPanelProps.UsageUpdaterTimer(Sender: TObject);
var
  CPUUsage,HDDUsage,MEMUsage: integer;
  S: TSelections;
begin
try
if MODELServerStatistics <> nil
 then begin
  MODELServerStatistics.GetCPUUsage(CPUUsage);
  MODELServerStatistics.GetHDDUsage(HDDUsage);
  MODELServerStatistics.GetMEMUsage(MEMUsage);
  //.
  SetLength(S,1);
  S[0].Value:=CPUUsage;
  CPUUsageLineFilter.DoOnAddSelections(S);
  S[0].Value:=HDDUsage;
  HDDUsageLineFilter.DoOnAddSelections(S);
  S[0].Value:=MEMUsage;
  MEMUsageLineFilter.DoOnAddSelections(S);
  //.
  fmCPUUsageMonitor.Show;
  fmHDDUsageMonitor.Show;
  fmMEMUsageMonitor.Show;
  end
 else begin
  fmCPUUsageMonitor.Hide;
  fmHDDUsageMonitor.Hide;
  fmMEMUsageMonitor.Hide;
  end;
if flOnLine
 then begin
  OfflineImage.Hide;
  OnlineImage.Show;
  lbCaption.Caption:='Server is online'
  end
 else begin
  OnlineImage.Hide;
  OfflineImage.Show;
  lbCaption.Caption:='Server is offline'
  end;
except
  end;
end;

procedure TMODELServerPanelProps.bbCrewNewUserClick(Sender: TObject);
const
  UserName = 'Register';
  UserPassword = 'Register';
var
  Cmd,Prms: string;
begin
if TMODELServerFunctionality(ObjFunctionality).IPAddress = ObjFunctionality.Space.SOAPServerURL
 then with TfmRegistration.Create(ObjFunctionality.Space) do begin
  FormStyle:=fsStayOnTop;
  Show;
  end
 else begin
  if NOT TMODELServerFunctionality(ObjFunctionality).IsUserExist(UserName,UserPassword) then Raise Exception.Create('registration user  is unknown on this model-server'); //. =>
  Cmd:=Application.ExeName;
  Prms:=TMODELServerFunctionality(ObjFunctionality).IPAddress+' '+UserName+' '+UserPassword;
  //.
  try ObjFunctionality.Space.Destroy; except end;
  //.
  ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
  //.
  Halt; /// ? Application.Terminate;
  end;
end;

procedure TMODELServerPanelProps.bbLogoutAndConnectClick(Sender: TObject);
var
  Cmd,Prms: string;
begin
if NOT TMODELServerFunctionality(ObjFunctionality).IsUserExist(ObjFunctionality.Space.UserName,ObjFunctionality.Space.UserPassword) then Raise Exception.Create('your user '+ObjFunctionality.Space.UserName+' is unknown on this model-server'); //. =>
Cmd:=Application.ExeName;
Prms:=TMODELServerFunctionality(ObjFunctionality).IPAddress+' '+ObjFunctionality.Space.UserName+' '+ObjFunctionality.Space.UserPassword;
//.
try ObjFunctionality.Space.Destroy; except end;
//.
ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
//.
Halt; /// ? Application.Terminate;
end;

procedure TMODELServerPanelProps.bbLogoutAndConnectAsClick(Sender: TObject);
var
  Cmd,Prms: string;
begin
Cmd:=Application.ExeName;
Prms:=TMODELServerFunctionality(ObjFunctionality).IPAddress+' '+ObjFunctionality.Space.UserName+' '+ObjFunctionality.Space.UserPassword;
//.
try ObjFunctionality.Space.Destroy; except end;
//.
ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
//.
Halt; /// ? Application.Terminate;
end;

procedure TMODELServerPanelProps.bbLogoutAndConnectAsAnonymousClick(Sender: TObject);
const
  UserName = 'Anonymous';
  UserPassword = 'ra3tkq';
var
  Cmd,Prms: string;
begin
if NOT TMODELServerFunctionality(ObjFunctionality).IsUserExist(UserName,UserPassword) then Raise Exception.Create('your user '+ObjFunctionality.Space.UserName+' is unknown on this model-server'); //. =>
Cmd:=Application.ExeName;
Prms:=TMODELServerFunctionality(ObjFunctionality).IPAddress+' '+UserName+' '+UserPassword;
//.
try ObjFunctionality.Space.Destroy; except end;
//.
ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
//.
Halt; /// ? Application.Terminate;
end;

end.
