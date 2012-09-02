unit unitRegistrationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, RXCtrls, ExtCtrls,
  unitProxySpace;

type
  TfmRegistration = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    edUserName: TEdit;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    edFullName: TEdit;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    edPassword: TEdit;
    edPasswordConfirmation: TEdit;
    sbRegister: TSpeedButton;
    RxLabel6: TRxLabel;
    edContactInfo: TEdit;
    sbGeneratePassword: TSpeedButton;
    cbPasswordGenerationCharsCount: TComboBox;
    procedure sbRegisterClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbGeneratePasswordClick(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace);
    procedure RegisterUser;
  end;

implementation
Uses
  Functionality,
  TypesDefines,
  TypesFunctionality,
  unitRegistrationRejectedForm,
  unitRegistrationAcceptedForm;

{$R *.dfm}

Constructor TfmRegistration.Create(pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
end;

procedure TfmRegistration.RegisterUser;

  procedure CheckInfo;
  begin
  if edUserName.Text = '' then Raise Exception.Create('user name is empty'); //. =>
  if edFullName.Text = '' then Raise Exception.Create('full name is empty'); //. =>
  if edPassword.Text = '' then Raise Exception.Create('password is empty'); //. =>
  if (edPassword.Text <> edPasswordConfirmation.Text) then Raise Exception.Create('password and confirmation are differ'); //. =>
  end;

var
  UserID: integer;
  SC: TCursor;
begin
try
//. check register info which is entered
CheckInfo;
//. registration
with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
try
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
CreateNewUserByDefaultPrototype(edUserName.Text,edPassword.Text,edFullName.Text,edContactInfo.Text, UserID);
finally
Screen.Cursor:=SC;
end;
finally
Release;
end;
//. close registration form
Close;
//. disable next registartion until reinstall
DeleteFile(Space.WorkLocale+'\'+PathLib+'\TLB\retsiger.tlb');
//. showmodal registrationaccepted
with TfmRegistrationAccepted.Create(nil) do
try
UserName:=edUserName.Text;
UserPassword:=edPassword.Text;
lbNewUser.Caption:='your new user - '+edUserName.Text+' ('+edFullName.Text+')';
ShowModal;
finally
Destroy;
end;
//.
except
  on E: Exception do with TfmRegistrationRejected.Create(nil) do
    try
    memoRejectionReason.Lines.Clear;
    memoRejectionReason.Lines.Add(E.Message);
    ShowModal;
    finally
    Destroy;
    end;
  end;
end;

procedure TfmRegistration.sbRegisterClick(Sender: TObject);
begin
RegisterUser;
end;

procedure TfmRegistration.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmRegistration.sbGeneratePasswordClick(Sender: TObject);
const
  S = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
var
  NumChars: integer;
  Password: string;
  I: integer;
begin
Randomize();
NumChars:=StrToInt(cbPasswordGenerationCharsCount.Items[cbPasswordGenerationCharsCount.ItemIndex]);
SetLength(Password,NumChars);
for I:=1 to NumChars do Password[I]:=S[Random(Length(S))+1];
edPassword.Text:=Password;
edPasswordConfirmation.Text:=Password;
end;


end.
