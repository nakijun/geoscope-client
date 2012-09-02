unit unitGEOGraphServerControlClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls, ComCtrls, GlobalSpaceDefines, unitGEOGraphServerController;

Type
  {TfmGEOGraphServerControlClient}
  TfmGEOGraphServerControlClient = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edUserID: TEdit;
    Label2: TLabel;
    edUserPassword: TEdit;
    Label3: TLabel;
    edObjectID: TEdit;
    cbKeepConnection: TCheckBox;
    bbConnectDisconnect: TButton;
    GroupBox2: TGroupBox;
    edCommandToExecute: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    cbOperations: TComboBox;
    Label6: TLabel;
    edServerAddress: TEdit;
    Label7: TLabel;
    edServerPort: TEdit;
    reConsole: TRichEdit;
    procedure cbOperationsChange(Sender: TObject);
    procedure bbConnectDisconnectClick(Sender: TObject);
    procedure edCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    ServerController: TGEOGraphServerController;
    procedure Initialize;
    procedure Finalize;

    procedure reConsole_WriteInfoMessage(const S: string);
    procedure reConsole_WriteCommandPrompt(const S: string);
    procedure reConsole_WriteSuccessResult(const S: string);
    procedure reConsole_WriteErrorResult(const S: string);
    procedure ExecuteObjectCommand(const InStr: string; out OutStr: string);
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy(); override;
  end;

var
  fmGEOGraphServerControlClient: TfmGEOGraphServerControlClient;

implementation
Uses
  ShellAPI,
  unitProxySpace,
  unitSetCheckpointIntervalPanel;

{$R *.dfm}


{TfmGEOGraphServerControlClient}
Constructor TfmGEOGraphServerControlClient.Create(AOwner: TComponent);
begin
Inherited Create(AOwner);
ServerController:=nil;
end;

Destructor TfmGEOGraphServerControlClient.Destroy();
begin
Finalize();
Inherited;
end;

procedure TfmGEOGraphServerControlClient.Initialize;
begin
if (ServerController <> nil) then Exit; //. =>
Finalize();
ServerController:=TGEOGraphServerController.Create(4,StrToInt(edObjectID.Text),StrToInt(edUserID.Text),edUserPassword.Text,edServerAddress.Text,StrToInt(edServerPort.Text),cbKeepConnection.Checked);
edServerAddress.Enabled:=false;
edServerPort.Enabled:=false;
edUserID.Enabled:=false;
edUserPassword.Enabled:=false;
edObjectID.Enabled:=false;
cbKeepConnection.Enabled:=false;
edCommandToExecute.Enabled:=true;
cbOperations.Enabled:=true;
bbConnectDisconnect.Caption:='Finalize';
reConsole_WriteInfoMessage('server controller is initialized');
edCommandToExecute.SetFocus();
end;

procedure TfmGEOGraphServerControlClient.Finalize;
begin
if (ServerController = nil) then Exit; //. =>
FreeAndNil(ServerController);
edServerAddress.Enabled:=true;
edServerPort.Enabled:=true;
edUserID.Enabled:=true;
edUserPassword.Enabled:=true;
edObjectID.Enabled:=true;
cbKeepConnection.Enabled:=true;
edCommandToExecute.Enabled:=false;
cbOperations.Enabled:=false;
bbConnectDisconnect.Caption:='Initialize';
reConsole_WriteInfoMessage('server controller is finalized');
end;

procedure TfmGEOGraphServerControlClient.reConsole_WriteInfoMessage(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clSilver;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TfmGEOGraphServerControlClient.reConsole_WriteCommandPrompt(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clYellow;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TfmGEOGraphServerControlClient.reConsole_WriteSuccessResult(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clLime;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TfmGEOGraphServerControlClient.reConsole_WriteErrorResult(const S: string);
begin
reConsole.SelStart:=reConsole.GetTextLen();
reConsole.SelAttributes.Color:=clRed;
reConsole.Lines.Add(S);
reConsole.Perform(EM_SCROLL,SB_LINEDOWN,0);
reConsole.Update;
end;

procedure TfmGEOGraphServerControlClient.ExecuteObjectCommand(const InStr: string; out OutStr: string);
var
  ObjectID: integer;
  InData,OutData: TByteArray;
begin
ObjectID:=StrToInt(edObjectID.Text);
SetLength(InData,Length(InStr));
Move(Pointer(@InStr[1])^,Pointer(@InData[0])^,Length(InData));
ServerController.ObjectOperation_ExecuteCommand(InData, OutData);
SetLength(OutStr,Length(OutData));
Move(Pointer(@OutData[0])^,Pointer(@OutStr[1])^,Length(OutData));
end;

procedure TfmGEOGraphServerControlClient.edCommandToExecuteKeyPress(Sender: TObject; var Key: Char);
var
  ObjectID: integer;
  InStr: string;
  OutStr: string;
begin
if (Key = #$0D)
 then
  try
  ObjectID:=StrToInt(edObjectID.Text);
  //.
  InStr:=edCommandToExecute.Text;
  reConsole_WriteCommandPrompt('> '+InStr);
  try
  ExecuteObjectCommand(InStr, OutStr);
  reConsole_WriteSuccessResult('> '+OutStr);
  except
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  finally
  edCommandToExecute.SelectAll;
  end;
end;

procedure TfmGEOGraphServerControlClient.cbOperationsChange(Sender: TObject);
const
  LogFileName = 'Log.txt';
var
  R: boolean;
  NewCheckpointInterval: smallint;
  ObjectID: integer;
  RC: integer;
  LastCheckpointTime: TDateTime;
  CheckpointInterval: smallint;
  LF: string;
  MS: TMemoryStream;
  ObjectData: TGeographUserObjectDataV0;
begin
try
case cbOperations.ItemIndex of
0: begin //. Object operation: set checkpoint interval
  with TfmSetCheckpointIntervalPanel.Create() do
  try
  R:=Accept(NewCheckpointInterval);
  finally
  Destroy;
  end;
  if (R)
   then begin
    ObjectID:=StrToInt(edObjectID.Text);
    try
    reConsole_WriteCommandPrompt('> [OID: '+IntToStr(ObjectID)+']  SetCheckpointInterval (NewCheckpointInterval = '+IntToStr(NewCheckpointInterval)+')');
    //.
    RC:=ServerController.ObjectOperation_SetCheckpointInterval(NewCheckpointInterval);
    //.
    reConsole_WriteSuccessResult('> OK');
    except
      on E: OperationException do begin
        reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
        end;
      on E: Exception do begin
        reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
        end;
      end;
    end;
  end;
1: begin //. Object operation: get checkpoint
  ObjectID:=StrToInt(edObjectID.Text);
  try
  reConsole_WriteCommandPrompt('> [OID: '+IntToStr(ObjectID)+'] GetCheckpoint()');
  //.
  RC:=ServerController.ObjectOperation_GetCheckpoint(LastCheckpointTime,CheckpointInterval);
  reConsole_WriteSuccessResult('> LastCheckpointTime: '+FormatDateTime('DD/MM/YY HH:NN:SS',LastCheckpointTime));
  reConsole_WriteSuccessResult('> CheckpointInterval: '+IntToStr(CheckpointInterval));
  if (LastCheckpointTime <> 0.0)
   then
    if ((Now-LastCheckpointTime) <= (CheckpointInterval/(3600.0*24.0)))
     then reConsole_WriteSuccessResult('> Object is online')
     else reConsole_WriteSuccessResult('> Object is offline')
   else reConsole_WriteSuccessResult('> Server is started recently');
  //.
  reConsole_WriteSuccessResult('> OK');
  except
    on E: OperationException do begin
      reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
      end;
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  end;
2: begin //. Object operation: GetData
  ObjectID:=StrToInt(edObjectID.Text);
  try
  reConsole_WriteCommandPrompt('> [OID: '+IntToStr(ObjectID)+'] GetData()');
  //.
  RC:=ServerController.ObjectOperation_GetData(0{Version}, ObjectData);
  reConsole_WriteSuccessResult('> ID: '+IntToStr(ObjectData.ID));
  reConsole_WriteSuccessResult('> Name: '+ObjectData.ObjectName);
  reConsole_WriteSuccessResult('> ObjectType: '+IntToStr(ObjectData.ObjectType));
  reConsole_WriteSuccessResult('> ObjectDatumID: '+IntToStr(ObjectData.ObjectDatumID));
  reConsole_WriteSuccessResult('> ObjectGeoSpaceID: '+IntToStr(ObjectData.GeoSpaceID));
  reConsole_WriteSuccessResult('> VisualizationType: '+IntToStr(ObjectData.idTVisualization));
  reConsole_WriteSuccessResult('> VisualizationID: '+IntToStr(ObjectData.idVisualization));
  reConsole_WriteSuccessResult('> HintID: '+IntToStr(ObjectData.idHint));
  reConsole_WriteSuccessResult('> CheckpointInterval: '+IntToStr(ObjectData.CheckpointInterval));
  reConsole_WriteSuccessResult('> LastCheckpointTime: '+FormatDateTime('DD/MM/YY HH:NN:SS',ObjectData.LastCheckpointTime));
  //.
  reConsole_WriteSuccessResult('> OK');
  except
    on E: OperationException do begin
      reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
      end;
    on E: Exception do begin
      reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
      end;
    end;
  end;
3: begin //. Object operation: GetDatLog
  {with TfmSetCheckpointIntervalPanel.Create() do
  try
  R:=Accept(NewCheckpointInterval);
  finally
  Destroy;
  end;}
  if (true)////(R)
   then begin
    ObjectID:=StrToInt(edObjectID.Text);
    try
    reConsole_WriteCommandPrompt('> [OID: '+IntToStr(ObjectID)+'] GetDayLogData()');
    //.
    RC:=ServerController.ObjectOperation_GetDayLogData(Now,3{PlainTextRU format}, MS);
    try
    LF:=ExtractFileDir(Application.ExeName)+'\'+PathTempData+'\DATA'+FormatDateTime('DDMMYYYYHHNNSSZZZ',Now)+'.log';
    MS.SaveToFile(LF);
    ShellExecute(0,nil,PChar(LF),nil,nil, 1);
    finally
    MS.Destroy;
    end;
    //.
    reConsole_WriteSuccessResult('> OK');
    except
      on E: OperationException do begin
        reConsole_WriteErrorResult('> ERROR'+IntToStr(E.Code)+': '+E.Message);
        end;
      on E: Exception do begin
        reConsole_WriteErrorResult('CONNECTION ERROR: '+E.Message);
        end;
      end;
    end;
  end;
end;
finally
cbOperations.ItemIndex:=-1;
end;
end;

procedure TfmGEOGraphServerControlClient.bbConnectDisconnectClick(Sender: TObject);
begin
if (ServerController = nil)
 then Initialize()
 else Finalize();
end;


end.
