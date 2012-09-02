unit unitCoNotificationAreaPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, FunctionalityImport, unitCoNotificationAreaFunctionality, unitCoComponentRepresentations,
  StdCtrls, ExtCtrls, Buttons, Menus, jpeg;

type
  TCoNotificationAreaPanelProps = class(TCoComponentPanelProps)
    Image: TImage;
    PopupMenu: TPopupMenu;
    Addareatolocalmonitor1: TMenuItem;
    edName: TEdit;
    sbCoComponent: TSpeedButton;
    Copyvisualizationcomponenttotheclipboard1: TMenuItem;
    edNotificationAddresses: TEdit;
    Label1: TLabel;
    Showarealocalmonitor1: TMenuItem;
    N1: TMenuItem;
    sbShow: TSpeedButton;
    sbEditNotificationAddresses: TSpeedButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure Addareatolocalmonitor1Click(Sender: TObject);
    procedure sbCoComponentClick(Sender: TObject);
    procedure Copyvisualizationcomponenttotheclipboard1Click(
      Sender: TObject);
    procedure edNotificationAddressesKeyPress(Sender: TObject;
      var Key: Char);
    procedure Showarealocalmonitor1Click(Sender: TObject);
    procedure sbShowClick(Sender: TObject);
    procedure sbEditNotificationAddressesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  ShellAPI,
  unitAddressesEditor,
  unitNotificationAreaNotifier;

{$R *.dfm}


Constructor TCoNotificationAreaPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoNotificationAreaPanelProps.Destroy;
begin
Inherited;
end;

procedure TCoNotificationAreaPanelProps._Update;
begin
with TCoNotificationAreaFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
edNotificationAddresses.Text:=NotificationAddresses;
finally
Release;
end;
end;


procedure TCoNotificationAreaPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoNotificationAreaFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoNotificationAreaPanelProps.Copyvisualizationcomponenttotheclipboard1Click(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoNotificationAreaFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
ProxySpace__TypesSystem_SetClipboardComponent(VisualizationType,VisualizationID);
finally
Release;
end;
end;

procedure TCoNotificationAreaPanelProps.Addareatolocalmonitor1Click(Sender: TObject);
begin
if (NotificationAreaNotifier <> nil)
 then begin
  NotificationAreaNotifier.AddItem(idCoComponent);
  ShowMessage('Area has been added to the local monitor service');
  end;
end;

procedure TCoNotificationAreaPanelProps.sbShowClick(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoNotificationAreaFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(Ptr);
finally
Release;
end;
finally
Release;
end;
end;

procedure TCoNotificationAreaPanelProps.sbCoComponentClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTCoComponent,idCoComponent) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TCoNotificationAreaPanelProps.edNotificationAddressesKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoNotificationAreaFunctionality.Create(idCoComponent) do
  try
  NotificationAddresses:=edNotificationAddresses.Text;
  finally
  Release;
  end;
end;

procedure TCoNotificationAreaPanelProps.Showarealocalmonitor1Click(Sender: TObject);
begin
if (NotificationAreaNotifierMonitor <> nil) then NotificationAreaNotifierMonitor.Show();
end;


procedure TCoNotificationAreaPanelProps.sbEditNotificationAddressesClick(Sender: TObject);
var
  SC: TCursor;
  Addresses: string;
begin
with TCoNotificationAreaFunctionality.Create(idCoComponent) do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Addresses:=NotificationAddresses;
finally
Screen.Cursor:=SC;
end;
//.
with TfmAddressesEditor.Create() do
try
if (Edit(Addresses))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  NotificationAddresses:=Addresses;
  finally
  Screen.Cursor:=SC;
  end;
  end;
finally
Destroy;
end;
finally
Release;
end;
end;

end.
