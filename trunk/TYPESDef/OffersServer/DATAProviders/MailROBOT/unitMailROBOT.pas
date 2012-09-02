unit unitMailROBOT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Psock, NMpop3,
  unitProxySpace, TypesDefines, TypesFunctionality;


const
  AttachmentTempFolder = PathTempDATA;
type
  TfmMailROBOT = class(TForm)
    edMailServer: TLabeledEdit;
    edMailServerUserName: TLabeledEdit;
    edMailServerUserPassword: TLabeledEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    sbStartROBOT: TSpeedButton;
    reROBOTLog: TRichEdit;
    timerROBOTWakeUps: TTimer;
    POP3Client: TNMPOP3;
    cbLogCheckPoints: TCheckBox;
    procedure sbStartROBOTClick(Sender: TObject);
    procedure POP3ClientDecodeStart(var FileName: String);
    procedure timerROBOTWakeUpsTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMailServerKeyPress(Sender: TObject; var Key: Char);
    procedure edMailServerUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure edMailServerUserPasswordKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
    OffersServerFunctionality: TOffersServerFunctionality;
    AttachmentFileName: string;
    flProcessingMessages: boolean;
    procedure Log_Write(const Message: string; const MessageColor: TColor);
  public
    { Public declarations }
    Constructor Create(pOffersServerFunctionality: TOffersServerFunctionality);
    procedure Update;
    procedure ProcessMessages;
  end;

var
  fmMailROBOT: TfmMailROBOT;

implementation
Uses
  unitFormatConvertors;

{$R *.dfm}


Constructor TfmMailROBOT.Create(pOffersServerFunctionality: TOffersServerFunctionality);
begin
Inherited Create(nil);
OffersServerFunctionality:=pOffersServerFunctionality;
flProcessingMessages:=false;
Update;
end;

procedure TfmMailROBOT.Update;
begin
edMailServer.Text:=OffersServerFunctionality.MailROBOT_Inbox;
edMailServerUserName.Text:=OffersServerFunctionality.MailROBOT_User;
edMailServerUserPassword.Text:=OffersServerFunctionality.MailROBOT_Password;
end;

procedure TfmMailROBOT.Log_Write(const Message: string; const MessageColor: TColor);
begin
with reROBOTLog do begin
SelStart:=1000000;
SelAttributes.Color:=MessageColor;
Lines.Add(Message);
end;
end;

procedure TfmMailROBOT.ProcessMessages;
const
  idTMODELUserOffers = 1111116;

  procedure ProcessMessage(const ixMessage: integer);

    procedure ParseMessageBody(out UserName: string; out UserPassword: string; out OfferID: integer; out DATAFormat: string);

      procedure Param_GetValue(MessageBody: TStringList; Param: string;  out Value: string);
      var
        I,J,ixI,ixJ: integer;
        SP: string;
        flFound: boolean;
      begin
      //. ParamName searching
      flFound:=false;
      I:=0;
      while I < MessageBody.Count do begin
        SP:='';
        J:=1;
        while (J <= Length(MessageBody[I])) AND (MessageBody[I][J] <> ':') do begin
          if MessageBody[I][J] <> ' ' then SP:=SP+MessageBody[I][J];
          Inc(J);
          end;
        if (J <= Length(MessageBody[I])) AND (UPPERCase(SP) = ANSIUpperCase(Param))
         then begin
          ixI:=I;
          ixJ:=J;
          flFound:=true;
          end;
        Inc(I);
        end;
      if NOT flFound then Raise Exception.Create(Param+' not found'); //. =>
      Inc(ixJ);
      //. Value getting
      Value:='';
      J:=ixJ;
      while (J <= Length(MessageBody[ixI])) do begin
        if MessageBody[ixI][J] <> ' ' then Value:=Value+MessageBody[ixI][J];
        Inc(J);
        end;
      end;

    var
      I: integer;
      OfferIDString: string;
    begin
    try
    with POP3Client.MailMessage do begin
    if Body.Count < 4 then Raise Exception.Create('lines count not equal 4');
    Param_GetValue(Body, 'UserName',  UserName);
    Param_GetValue(Body, 'Password',  UserPassword);
    Param_GetValue(Body, 'OfferID',  OfferIDString);
    try
    OfferID:=StrToInt(OfferIDString);
    except
      Raise Exception.Create('wrong OfferID number');
      end;
    Param_GetValue(Body, 'DATAFormat',  DATAFormat);
    end;
    except
      On E: Exception do Raise Exception.Create('Message body parsing error - '+E.Message);
      end;
    end;

  var
    sTime: string;
    UserName: string;
    UserPassword: string;
    OfferID: integer;
    DATAFormat: string;
    idUser: integer;
    idTMODELUserOffersComponent,idMODELUserOffersComponent: integer;
    idTOffersCollection,idOffersCollection: integer;
    AttachmentStream: TMemoryStream;
    NativeDATAStream: TMemoryStream;
  begin
  with POP3Client do begin
  DateTimeToString(sTime,'YYYYMMDDHHNNSS',Now);
  AttachmentFileName:=AttachmentTempFolder+'\DATA'+sTime+'.zip';
  //. message getting process
  GetMailMessage(ixMessage);
  //. message body parsing
  Log_Write(FormatDateTime('YYYY.MM.DD HH:NN',Now)+' - message processing: sender: '+POP3Client.MailMessage.From+', subject: '+POP3Client.MailMessage.Subject+' ...',clGreen);
  ParseMessageBody(UserName,UserPassword,OfferID,DATAFormat);
  Log_Write('UserName: '+UserName,clGray);
  //. user data verifying
  with TTMODELUSerFunctionality.Create do
  try
  if IsUserExist(UserName, idUser)
   then with TMODELUSerFunctionality(TComponentFunctionality_Create(idUser)) do
    try
    if Password = UserPassword
     then begin
      //. query own offers
      if NOT QueryComponent(idTMODELUserOffers, idTMODELUserOffersComponent,idMODELUserOffersComponent) then Exception.Create('there is no one offer for user - '+UserName); //. =>
      with TypesFunctionality.TComponentFunctionality_Create(idTMODELUserOffersComponent,idMODELUserOffersComponent) do
      try
      if NOT QueryComponent(idTCollection, idTOffersCollection,idOffersCollection) then Exception.Create('there is no TCollection object for offers of user - '+UserName); //. =>
      with TCollectionFunctionality(TypesFunctionality.TComponentFunctionality_Create(idTOffersCollection,idOffersCollection)) do
      try
      if NOT IsItemExist(idTOffer,OfferID) then Exception.Create('there is no offer having id = '+IntToStr(OfferID)+' for user - '+UserName); //. =>
      finally
      Release;
      end;
      finally
      Release;
      end;
      //. convert message attachment file offer-data into native TOffer-component format
      try
      UnZipFileIntoStream(AttachmentFileName, AttachmentStream);
      except
        On E: Exception do Raise Exception.Create('unzipping failed - '+E.Message); //. =>
        end;
      try
      try
      ConvertDATA(AttachmentStream,DATAFormat, NativeDATAStream);
      except
        On E: Exception do Raise Exception.Create('attachment file ('+AttachmentFileName+') data converting error - '+E.Message); //. =>
        end;
      finally
      AttachmentStream.Destroy;
      end;
      try
      //. load data into the Offer object
      with TOfferFunctionality(TypesFunctionality.TComponentFunctionality_Create(idTOffer,OfferID)) do
      try
      Check;
      try
      LoadDATAFromStream(NativeDATAStream);
      except
        On E: Exception do Raise Exception.Create('Offer.LoadingDATA error - '+E.Message); //. =>
        end;
      finally
      Release;
      end;
      finally
      NativeDATAStream.Destroy;
      end;
      end
     else
      Raise Exception.Create('wrong password - '+UserPassword+' for user: '+UserName); //. =>
    finally
    Release;
    end
   else
    Raise Exception.Create('unknown user - '+UserName); //. =>
  finally
  Release;
  end;
  //.
  Log_Write('processed.',clGray);
  end;
  end;

begin
flProcessingMessages:=true;
try
try
with POP3Client do begin
if Connected then Disconnect;
Host:=edMailServer.Text;
UserID:=edMailServerUserName.Text;
Password:=edMailServerUserPassword.Text;
Connect;
try
if MailCount > 0 then ProcessMessage(1);
finally
Disconnect;
end;
end;
except
  On E: Exception do Log_Write('! EXCEPTION at '+FormatDateTime('YYYY.MM.DD HH:NN',Now)+': '+E.Message,clRed);
  end;
finally
flProcessingMessages:=false;
end;
end;

procedure TfmMailROBOT.sbStartROBOTClick(Sender: TObject);
begin
if NOT timerROBOTWakeUps.Enabled
  then begin
   timerROBOTWakeUps.Enabled:=true;
   sbStartROBOT.Caption:='Stop ROBOT';
   Log_Write('. ROBOT started at '+FormatDateTime('YYYY.MM.DD HH:NN',Now),clBlack);
   end
  else begin
   timerROBOTWakeUps.Enabled:=false;
   sbStartROBOT.Caption:='Start ROBOT';
   Log_Write('. ROBOT stopped at '+FormatDateTime('YYYY.MM.DD HH:NN',Now),clBlack);
   end;
end;

procedure TfmMailROBOT.POP3ClientDecodeStart(var FileName: String);
begin
FileName:=AttachmentFileName;
end;

procedure TfmMailROBOT.timerROBOTWakeUpsTimer(Sender: TObject);
begin
if NOT flProcessingMessages
 then begin
  if cbLogCheckPoints.Checked then Log_Write(FormatDateTime('YYYY.MM.DD HH:NN',Now)+': checkPoint.',clGray);
  ProcessMessages;
  end;
end;

procedure TfmMailROBOT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmMailROBOT.edMailServerKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  OffersServerFunctionality.MailROBOT_Inbox:=edMailServer.Text;
  end;
end;

procedure TfmMailROBOT.edMailServerUserNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  OffersServerFunctionality.MailROBOT_User:=edMailServerUserName.Text;
  end;
end;

procedure TfmMailROBOT.edMailServerUserPasswordKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  OffersServerFunctionality.MailROBOT_Password:=edMailServerUserPassword.Text;
  end;
end;

end.
