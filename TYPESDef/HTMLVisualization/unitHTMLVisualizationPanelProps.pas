unit unitHTMLVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  THTMLVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    FileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    Width: TLabel;
    edWidth: TEdit;
    Edit1: TMenuItem;
    Savetofile1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure edWidthKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Savetofile1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
    procedure SaveToFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor THTMLVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor THTMLVisualizationPanelProps.Destroy;
begin
Inherited;                     
end;

procedure THTMLVisualizationPanelProps._Update;
begin
Inherited;
//.
with THTMLVisualizationFunctionality(ObjFunctionality) do begin
edWidth.Text:=IntToStr(Width);
end;
end;

procedure THTMLVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if THTMLVisualizationFunctionality(ObjFunctionality).Reflector <> nil then THTMLVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure THTMLVisualizationPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=FileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with THTMLVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(FileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure THTMLVisualizationPanelProps.SaveToFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=FileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with THTMLVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('Exporting  ...');
  try
  SaveToFile(FileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure THTMLVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure THTMLVisualizationPanelProps.Controls_ClearPropData;
begin
edWidth.Text:='';
end;



procedure THTMLVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

procedure THTMLVisualizationPanelProps.edWidthKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then THTMLVisualizationFunctionality(ObjFunctionality).Width:=StrToInt(edWidth.Text);
end;

procedure THTMLVisualizationPanelProps.Edit1Click(Sender: TObject);
begin
THTMLVisualizationFunctionality(ObjFunctionality).EditDATA;
end;

procedure THTMLVisualizationPanelProps.Savetofile1Click(Sender: TObject);
begin
SaveToFile;
end;

end.
