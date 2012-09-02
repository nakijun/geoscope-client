unit unitGeoGraphServerRegisterObjectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, unitProxySpace, Functionality;

type
  TfmRegisterObject = class(TForm)
    Label1: TLabel;
    edGeoSpaceID: TEdit;
    Label2: TLabel;
    edidTVisualization: TEdit;
    Label3: TLabel;
    edidVisualization: TEdit;
    Label4: TLabel;
    edHintID: TEdit;
    sbCopyVisualizationFromClipboard: TSpeedButton;
    sbAccept: TSpeedButton;
    sbCancel: TSpeedButton;
    Label5: TLabel;
    edObjectName: TEdit;
    Label6: TLabel;
    edObjectType: TEdit;
    Label7: TLabel;
    cbObjectDatumID: TComboBox;
    procedure sbCancelClick(Sender: TObject);
    procedure sbAcceptClick(Sender: TObject);
    procedure sbCopyVisualizationFromClipboardClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    flAccepted: boolean;
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    function Accept(out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out GeoSpaceID: integer; out idTVisualization: integer; out idVisualization: integer; out idHint: integer): boolean;
  end;

implementation
Uses
  GeoTransformations;

{$R *.dfm}

Constructor TfmRegisterObject.Create(const pSpace: TProxySpace);
var
  I: integer;
begin
Inherited Create(nil);
Space:=pSpace;
//.
cbObjectDatumID.Items.Clear;
for I:=0 to DatumsCount-1 do cbObjectDatumID.Items.Add(Datums[I].DatumName);
cbObjectDatumID.ItemIndex:=23; //. default: WGS-84
end;

function TfmRegisterObject.Accept(out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out GeoSpaceID: integer; out idTVisualization: integer; out idVisualization: integer; out idHint: integer): boolean;
begin
flAccepted:=false;
ShowModal();
if (flAccepted)
 then begin
  ObjectName:=edObjectName.Text;
  ObjectType:=StrToInt(edObjectType.Text);
  ObjectDatumID:=cbObjectDatumID.ItemIndex;
  GeoSpaceID:=StrToInt(edGeoSpaceID.Text);
  idTVisualization:=StrToInt(edidTVisualization.Text);
  idVisualization:=StrToInt(edidVisualization.Text);
  idHint:=StrToInt(edHintID.Text);
  //.
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmRegisterObject.sbCancelClick(Sender: TObject);
begin
Close;
end;

procedure TfmRegisterObject.sbAcceptClick(Sender: TObject);
begin
flAccepted:=true;
Close;
end;

procedure TfmRegisterObject.sbCopyVisualizationFromClipboardClick(Sender: TObject);
var
  F: TComponentFunctionality;
begin
with TTypesSystem(Space.TypesSystem) do begin
if (NOT ClipBoard_flExist) then Exit; //. ->
F:=TComponentFunctionality_Create(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
try
if (NOT (F is TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has no visualization component'); //. =>
finally
F.Release;
end;
edidTVisualization.Text:=IntToStr(Clipboard_Instance_idTObj);
edidVisualization.Text:=IntToStr(Clipboard_Instance_idObj);
end;
end;

end.
