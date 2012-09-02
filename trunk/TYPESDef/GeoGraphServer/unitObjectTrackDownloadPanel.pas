unit unitObjectTrackDownloadPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,
  unitProxySpace;

type
  TfmObjectTrackDownload = class(TForm)
    Label1: TLabel;
    MonthCalendar: TMonthCalendar;
    edUserPassword: TEdit;
    Label3: TLabel;
    edDownloadFile: TEdit;
    bbDownloadTrack: TBitBtn;
    cbUserObjectOwnerPassword: TCheckBox;
    procedure bbDownloadTrackClick(Sender: TObject);
    procedure MonthCalendarClick(Sender: TObject);
    procedure cbUserObjectOwnerPasswordClick(Sender: TObject);
  private
    { Private declarations }
    flAccept: boolean;
  public
    { Public declarations }
    ObjectID: integer;

    Constructor Create(const pObjectID: integer);
    function Accept(out flUserOwnerPassword: boolean): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmObjectTrackDownload.Create(const pObjectID: integer);
begin
Inherited Create(nil);
ObjectID:=pObjectID;
MonthCalendar.Date:=Now;
edDownloadFile.Text:=PathTempDATA+'\'+IntToStr(ObjectID)+'_Track'+FormatDateTime('DDMMYY',MonthCalendar.Date)+'.log';
end;

function TfmObjectTrackDownload.Accept(out flUserOwnerPassword: boolean): boolean;
begin
flAccept:=false;
ShowModal();
Result:=flAccept;
if (Result) then flUserOwnerPassword:=cbUserObjectOwnerPassword.Checked;
end;

procedure TfmObjectTrackDownload.bbDownloadTrackClick(Sender: TObject);
begin
flAccept:=true;
Close();
end;

procedure TfmObjectTrackDownload.cbUserObjectOwnerPasswordClick(Sender: TObject);
begin
edUserPassword.Enabled:=cbUserObjectOwnerPassword.Checked;
end;

procedure TfmObjectTrackDownload.MonthCalendarClick(Sender: TObject);
begin
edDownloadFile.Text:=PathTempDATA+'\'+IntToStr(ObjectID)+'_Track'+FormatDateTime('DDMMYY',MonthCalendar.Date)+'.log';
end;

end.
