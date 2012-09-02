unit unitDetailedPictureLevelsActionProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmLevelsActionProgress = class(TForm)
    Panel1: TPanel;
    sbCancel: TSpeedButton;
    memoLog: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    flCancel: boolean;

    procedure _ProcessMessages;
  end;

implementation

{$R *.dfm}


procedure TfmLevelsActionProgress._ProcessMessages;

  function ProcessMessage(var Msg: TMsg): Boolean;
  begin
  with Application do begin
    Result := False;
    if PeekMessage(Msg, Self.Handle, WM_MOUSEFIRST, WM_MOUSELAST, PM_REMOVE) then
    begin
      Result := True;        
      if Msg.message = WM_LBUTTONDOWN then flCancel:=true else
      if Msg.Message <> WM_QUIT then
      begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end
      else
        Application.Terminate;
    end;
  end;
  end;

var
  Msg: TMsg;
begin
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  ReleaseCapture;
  while ProcessMessage(Msg) do {loop};
  Update;
end;


end.
