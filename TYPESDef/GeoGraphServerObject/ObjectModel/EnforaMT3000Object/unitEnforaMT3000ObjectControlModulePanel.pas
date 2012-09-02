unit unitEnforaMT3000ObjectControlModulePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitEnforaMT3000ObjectModel, ComCtrls, Menus, StdCtrls, Buttons;

type
  TEnforaMT3000ObjectControlModulePanel = class(TForm)
    GroupBox1: TGroupBox;
    edCommand: TEdit;
    memoLog: TMemo;
    procedure edCommandKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Model: TEnforaMT3000ObjectModel;

  public
    { Public declarations }
    Constructor Create(const pModel: TEnforaMT3000ObjectModel);
    Destructor Destroy(); override; 
    procedure Update; reintroduce;
  end;


implementation
uses
  GlobalSpaceDefines,
  unitObjectModel;

{$R *.dfm}


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TEnforaMT3000ObjectControlModulePanel.Create(const pModel: TEnforaMT3000ObjectModel);
begin
Inherited Create(nil);
Model:=pModel;
//.
Update();
end;

Destructor TEnforaMT3000ObjectControlModulePanel.Destroy();
begin
Inherited;
end;

procedure TEnforaMT3000ObjectControlModulePanel.Update();
begin
end;

procedure TEnforaMT3000ObjectControlModulePanel.edCommandKeyPress(Sender: TObject; var Key: Char);
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
