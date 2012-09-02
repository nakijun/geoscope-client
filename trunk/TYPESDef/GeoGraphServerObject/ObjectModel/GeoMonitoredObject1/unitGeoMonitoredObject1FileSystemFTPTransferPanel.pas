unit unitGeoMonitoredObject1FileSystemFTPTransferPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model, StdCtrls, Buttons, ExtCtrls;

type
  TTGeoMonitoredObject1FileSystemFTPTransferPanel = class(TForm)
    bgFTPServer: TGroupBox;
    Label1: TLabel;
    edServerAddress: TEdit;
    Label2: TLabel;
    edServerUserName: TEdit;
    Label3: TLabel;
    edServerUserPassword: TEdit;
    Label4: TLabel;
    edServerBaseDirectory: TEdit;
    Panel1: TPanel;
    btnStartTransfer: TBitBtn;
    edFileName: TEdit;
    Label5: TLabel;
    stState: TStaticText;
    StatusUpdater: TTimer;
    procedure StatusUpdaterTimer(Sender: TObject);
    procedure btnStartTransferClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    FileName: string;
    TransferID: string;

    procedure StartTransfer();
    procedure UpdateTransferState();
  public
    { Public declarations }
    Constructor Create(const pModel: TGeoMonitoredObject1Model; const pFileName: string);
    Destructor Destroy(); override; 
  end;

implementation

{$R *.dfm}


Constructor TTGeoMonitoredObject1FileSystemFTPTransferPanel.Create(const pModel: TGeoMonitoredObject1Model; const pFileName: string);
begin
Inherited Create(nil);
Model:=pModel;
FileName:=pFileName;
TransferID:='';
//.
edFileName.Text:=FileName;
end;

Destructor TTGeoMonitoredObject1FileSystemFTPTransferPanel.Destroy();
begin
if (TransferID <> '') then Model.FileSystem_CancelFTPFileTransfer(TransferID);
Inherited;
end;

procedure TTGeoMonitoredObject1FileSystemFTPTransferPanel.StartTransfer();
begin
Model.FileSystem_CancelFTPFileTransfer(''); //. cancel any last transfer
TransferID:=Model.FileSystem_StartFTPFileTransfer(edServerAddress.Text,edServerUserName.Text,edServerUserPassword.Text,edServerBaseDirectory.Text,FileName);
//.
UpdateTransferState();
end;

procedure TTGeoMonitoredObject1FileSystemFTPTransferPanel.UpdateTransferState();
const
  CODE_ERROR 			= -1;
  //.
  CODE_UNKNOWN 			= 0;
  CODE_STARTING 		= 1;
  CODE_DIRECTORYCREATING        = 2;
  CODE_FILETRANSMITTING	        = 3;
  CODE_COMPLETED 		= 4;
var
  Code: integer;
  Message: string;
begin
if (TransferID = '') then Exit; //. ->
Model.FileSystem_GetFTPFileTransferState(TransferID,{out} Code,{out} Message);
case Code of
CODE_STARTING:          stState.Caption:='starting transfer';
CODE_DIRECTORYCREATING: stState.Caption:='creating directory: '+Message;
CODE_FILETRANSMITTING:  stState.Caption:='transmitting file: '+Message;
CODE_COMPLETED:         begin
  stState.Caption:='transfer completed, '+FileName;
  TransferID:='';
  end;
CODE_ERROR:             begin
  stState.Caption:='! ERROR: '+Message;
  TransferID:='';
  end;
else
  stState.Caption:='unknown state code: '+IntToStr(Code)+', message: '+Message;
end;
end;

procedure TTGeoMonitoredObject1FileSystemFTPTransferPanel.StatusUpdaterTimer(Sender: TObject);
begin
UpdateTransferState();
end;

procedure TTGeoMonitoredObject1FileSystemFTPTransferPanel.btnStartTransferClick(Sender: TObject);
begin
StartTransfer();
end;


end.
