unit unitEnforaMiniMTObjectControlModulePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitEnforaMiniMTObjectModel, ComCtrls, Menus, StdCtrls, Buttons;

type
  TEnforaMiniMTObjectControlModulePanel = class(TForm)
    GroupBox1: TGroupBox;
    edCommand: TEdit;
    memoLog: TMemo;
    procedure edCommandKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Model: TEnforaMiniMTObjectModel;

  public
    { Public declarations }
    Constructor Create(const pModel: TEnforaMiniMTObjectModel);
    Destructor Destroy(); override; 
    procedure Update; reintroduce;
  end;


implementation
uses
  GlobalSpaceDefines,
  unitObjectModel;

{$R *.dfm}


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TEnforaMiniMTObjectControlModulePanel.Create(const pModel: TEnforaMiniMTObjectModel);
begin
Inherited Create(nil);
Model:=pModel;
//.
Update();
end;

Destructor TEnforaMiniMTObjectControlModulePanel.Destroy();
begin
Inherited;
end;

procedure TEnforaMiniMTObjectControlModulePanel.Update();
begin
end;

procedure TEnforaMiniMTObjectControlModulePanel.edCommandKeyPress(Sender: TObject; var Key: Char);
var
  Command,Response: string;
begin
if (Key = #$0D)
 then begin
  Command:=edCommand.Text;
  memoLog.Lines.Add('CMD: '+Command);
  try
  Response:=Model.ControlModule_ExecuteCommand(Command);
  memoLog.Lines.Add('RES: '+Response);
  except
    on E: Exception do memoLog.Lines.Add('ERR: '+E.Message);
    end;
  end;
end;


end.
