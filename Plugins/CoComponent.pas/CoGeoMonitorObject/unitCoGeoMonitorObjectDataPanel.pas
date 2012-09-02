unit unitCoGeoMonitorObjectDataPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfmCoGeoMonitorObjectDataPanel = class(TForm)
    PageControl1: TPageControl;
    tsServer: TTabSheet;
    Label1: TLabel;
    edServerType: TEdit;
    edServerID: TEdit;
    Label2: TLabel;
    edServerObjectID: TEdit;
    Label3: TLabel;
    edServerObjectType: TEdit;
    Label4: TLabel;
    bbObjectControl: TBitBtn;
    bbSetServerParameters: TBitBtn;
    procedure bbSetServerParametersClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    idCoGeoMonitorObject: integer;
    _ServerType: integer;
    _ServerID: integer;
    _ServerObjectID: integer;
    _ServerObjectType: integer;

    procedure SetServerParameters;
  public
    { Public declarations }

    Constructor Create(const pidCoGeoMonitorObject: integer);
    procedure Update; reintroduce;
  end;

implementation
uses
  unitCoGeoMonitorObjectFunctionality;

{$R *.dfm}

{TfmCoGeoMonitorObjectDataPanel}
Constructor TfmCoGeoMonitorObjectDataPanel.Create(const pidCoGeoMonitorObject: integer);
begin
Inherited Create(nil);
idCoGeoMonitorObject:=pidCoGeoMonitorObject;
Update();
end;

procedure TfmCoGeoMonitorObjectDataPanel.Update;
var
  DATA: TMemoryStream;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoGeoMonitorObject) do
try
if (GetDATA(DATA))
 then begin
  try
  try
  with TCoGeoMonitorObjectDATA.Create(DATA) do
  try
  _ServerType:=ServerType;
  _ServerID:=ServerID;
  _ServerObjectID:=ServerObjectID;
  _ServerObjectType:=ServerObjectType;
  finally
  Destroy;
  end;
  edServerType.Text:=IntToStr(_ServerType);
  edServerID.Text:=IntToStr(_ServerID);
  edServerObjectID.Text:=IntToStr(_ServerObjectID);
  edServerObjectType.Text:=IntToStr(_ServerObjectType);
  except
    edServerType.Text:='?';
    edServerID.Text:='?';
    edServerObjectID.Text:='?';
    edServerObjectType.Text:='?';
    end;
  finally
  DATA.Destroy;
  end;
  end
 else begin
  edServerType.Text:='?';
  edServerID.Text:='?';
  edServerObjectID.Text:='?';
  edServerObjectType.Text:='?';
  end;
finally
Release;
end;
end;

procedure TfmCoGeoMonitorObjectDataPanel.SetServerParameters;
var
  CoGeoMonitorObjectDATA: TCoGeoMonitorObjectDATA;
begin
_ServerType:=StrToInt(edServerType.Text);
_ServerID:=StrToInt(edServerID.Text);
_ServerObjectID:=StrToInt(edServerObjectID.Text);
_ServerObjectType:=StrToInt(edServerObjectType.Text);
CoGeoMonitorObjectDATA:=TCoGeoMonitorObjectDATA.Create(nil);
with CoGeoMonitorObjectDATA do
try
ServerType:=_ServerType;
ServerID:=_ServerID;
ServerObjectID:=_ServerObjectID;
ServerObjectType:=_ServerObjectType;
SetProperties();
//. set parameters
with TCoGeoMonitorObjectFunctionality.Create(idCoGeoMonitorObject) do
try
CoGeoMonitorObjectDATA.Position:=0;
SetDATA(CoGeoMonitorObjectDATA);
finally
Release;
end;
finally
Destroy;
end;
end;

procedure TfmCoGeoMonitorObjectDataPanel.bbSetServerParametersClick(Sender: TObject);
begin
SetServerParameters();
end;

procedure TfmCoGeoMonitorObjectDataPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


end.
