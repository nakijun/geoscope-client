unit unitCoGMONotificationAreaPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GlobalSpaceDefines, FunctionalityImport, uniTCoGMONotificationAreaFunctionality, unitCoComponentRepresentations,
  StdCtrls, ExtCtrls, Buttons, Menus, jpeg;

type
  TCoGMONotificationAreaPanelProps = class(TCoComponentPanelProps)
    Image: TImage;
    PopupMenu: TPopupMenu;
    edName: TEdit;
    sbCoComponent: TSpeedButton;
    Copyvisualizationcomponenttotheclipboard1: TMenuItem;
    sbShow: TSpeedButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbCoComponentClick(Sender: TObject);
    procedure Copyvisualizationcomponenttotheclipboard1Click(
      Sender: TObject);
    procedure sbShowClick(Sender: TObject);
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
  unitNotificationAreaNotifier;

{$R *.dfm}


Constructor TCoGMONotificationAreaPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoGMONotificationAreaPanelProps.Destroy;
begin
Inherited;
end;

procedure TCoGMONotificationAreaPanelProps._Update;
begin
with TCoGMONotificationAreaFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
finally
Release;
end;
end;


procedure TCoGMONotificationAreaPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoGMONotificationAreaFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoGMONotificationAreaPanelProps.Copyvisualizationcomponenttotheclipboard1Click(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoGMONotificationAreaFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
ProxySpace__TypesSystem_SetClipboardComponent(VisualizationType,VisualizationID);
finally
Release;
end;
end;

procedure TCoGMONotificationAreaPanelProps.sbShowClick(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoGMONotificationAreaFunctionality.Create(idCoComponent) do
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

procedure TCoGMONotificationAreaPanelProps.sbCoComponentClick(Sender: TObject);
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

end.
