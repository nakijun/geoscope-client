unit unitSpaceDesigner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, RXCtrls, ExtDlgs, unitReflector;

type
  TfmSpaceDesigner = class(TForm)
    sbFix: TSpeedButton;
    sbFree: TSpeedButton;
    lbFix: TRxLabel;
    lbFree: TRxLabel;
    sbLoad: TSpeedButton;
    sbExit: TSpeedButton;
    procedure sbFixClick(Sender: TObject);
    procedure sbFreeClick(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
    Reflector: TReflector;
  public
    { Public declarations }
    Constructor Create(pReflector: TReflector);
  end;

implementation

{$R *.DFM}

Constructor TfmSpaceDesigner.Create(pReflector: TReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
end;

procedure TfmSpaceDesigner.sbFixClick(Sender: TObject);
begin
Reflector.PrimMap_Fix;

lbFree.Enabled:=true;
sbFree.Enabled:=true;
lbFix.Enabled:=false;
sbFix.Enabled:=false;
end;

procedure TfmSpaceDesigner.sbFreeClick(Sender: TObject);
begin
Reflector.PrimMap_Free;

lbFix.Enabled:=true;
sbFix.Enabled:=true;
lbFree.Enabled:=false;
sbFree.Enabled:=false;
end;

procedure TfmSpaceDesigner.sbLoadClick(Sender: TObject);
begin
if Reflector.PrimMap_Exist then Exit;
if Reflector.PrimMap_Init
 then begin
  sbExit.Enabled:=true;
  sbLoad.Enabled:=false;
  lbFix.Enabled:=true;
  sbFix.Enabled:=true;
  sbFix.Click;
  end;
end;

procedure TfmSpaceDesigner.sbExitClick(Sender: TObject);
begin
if NOT Reflector.PrimMap_Exist then Exit;
Reflector.PrimMap_Destroy;
sbLoad.Enabled:=true;
sbExit.Enabled:=false;
lbFix.Enabled:=false;
sbFix.Enabled:=false;
lbFree.Enabled:=false;
sbFree.Enabled:=false;
end;

end.
