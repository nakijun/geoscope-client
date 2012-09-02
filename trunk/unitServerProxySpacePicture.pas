unit UnitServerProxySpacePicture;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TServerProxySpacePicture = class(TForm)
  private
    { Private declarations }
    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
  public
    { Public declarations }
  end;

var
  ServerProxySpacePicture: TServerProxySpacePicture;

implementation
uses
  unitProxySpace;

{$R *.DFM}


{TServerProxySpacePicture}
procedure TServerProxySpacePicture.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
Inherited;
//.
if ((ProxySpace <> nil) AND (ProxySpace.ProxySpaceServerType <> pssClient))
 then Message.Result:=0;
end;


end.
