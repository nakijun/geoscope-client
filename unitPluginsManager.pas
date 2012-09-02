unit unitPluginsManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, unitProxySpace, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ImgList, Buttons;

type
  TfmPluginsManager = class(TForm)
    lvPlugins: TListView;
    Panel1: TPanel;
    lvPlugins_ImageList: TImageList;
    sbDisableSelected: TSpeedButton;
    sbEnableSelected: TSpeedButton;
    sbUnload: TSpeedButton;
    procedure sbDisableSelectedClick(Sender: TObject);
    procedure sbEnableSelectedClick(Sender: TObject);
    procedure sbUnloadClick(Sender: TObject);
  private
    { Private declarations }
    ProxySpace: TProxySpace;
  public
    { Public declarations }
    Constructor Create(pProxySpace: TProxySpace);
    procedure Update;
  end;


implementation

{$R *.dfm}


Constructor TfmPluginsManager.Create(pProxySpace: TProxySpace);
begin
Inherited Create(nil);
ProxySpace:=pProxySpace;
Update;
end;

procedure TfmPluginsManager.Update;
Type //. transferred from plugin project
  TPluginStatus = (psUnknown,psInitializing,psFinalizing,psEnabled,psDisabled);
const
  PluginStatusStrings: array[TPluginStatus] of shortstring = ('?','initializing','finalizing','enabled','disabled');

  function Plugin_Name(const PH: THandle): shortstring;
  type
    TFunc = function: shortstring; stdcall;
  var
    FuncPtr: pointer;
  begin
  FuncPtr:=GetProcAddress(PH, PChar('PluginName'));
  if FuncPtr <> nil
   then Result:=TFunc(FuncPtr)
   else Result:='<unknown>';
  end;

  function Plugin_Status(const PH: THandle): shortstring;
  type
    TFunc = function: TPluginStatus; stdcall;
  var
    FuncPtr: pointer;
    PS: TPluginStatus;
  begin
  FuncPtr:=GetProcAddress(PH, PChar('GetPluginStatus'));
  if FuncPtr <> nil
   then PS:=TFunc(FuncPtr)
   else PS:=psUnknown;
  Result:=PluginStatusStrings[PS];
  end;

var
  I: integer;
  PH: THandle;
begin
with lvPlugins do begin
Items.BeginUpdate;
try
Clear;
if ProxySpace.Plugins <> nil
 then with ProxySpace.Plugins.LockList do
  try
  for I:=0 to Count-1 do with lvPlugins.Items.Add do begin
    PH:=THandle(List[I]);
    Data:=Pointer(PH);
    Caption:=IntToStr(I);
    SubItems.Add(Plugin_Name(PH));
    SubItems.Add(Plugin_Status(PH));
    end;
  finally
  ProxySpace.Plugins.UnLockList;
  end;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmPluginsManager.sbDisableSelectedClick(Sender: TObject);

  procedure Plugin_Disable(const PH: THandle);
  type
    TProc = procedure; stdcall;
  var
    ProcPtr: pointer;
  begin
  ProcPtr:=GetProcAddress(PH, PChar('Disable'));
  if ProcPtr <> nil
   then TProc(ProcPtr)
   else Raise Exception.Create('"Disable" procedure entry not found'); //. =>
  end;

begin
if lvPlugins.Selected <> nil
 then begin
  Plugin_Disable(THandle(lvPlugins.Selected.Data));
  Update;
  end;
end;

procedure TfmPluginsManager.sbEnableSelectedClick(Sender: TObject);

  procedure Plugin_Enable(const PH: THandle);
  type
    TProc = procedure; stdcall;
  var
    ProcPtr: pointer;
  begin
  ProcPtr:=GetProcAddress(PH, PChar('Enable'));
  if ProcPtr <> nil
   then TProc(ProcPtr)
   else Raise Exception.Create('"Enable" procedure entry not found'); //. =>
  end;

begin
if lvPlugins.Selected <> nil
 then begin
  Plugin_Enable(THandle(lvPlugins.Selected.Data));
  Update;
  end;
end;


procedure TfmPluginsManager.sbUnloadClick(Sender: TObject);
begin
if lvPlugins.Selected <> nil
 then begin
  ProxySpace.Plugins_Remove(THandle(lvPlugins.Selected.Data));
  Update;
  end;
end;

end.
