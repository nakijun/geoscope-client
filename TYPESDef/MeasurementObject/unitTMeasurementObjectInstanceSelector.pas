unit unitTMeasurementObjectInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  unitProxySpace, Functionality, TypesFunctionality;

type
  TfmMeasurementObjectInstanceSelector = class(TForm)
    lvObjects: TListView;
    Panel1: TPanel;
    Label1: TLabel;
    edNameContext: TEdit;
  private
    { Private declarations }
    Space: TProxySpace;
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy(); override;
  end;


implementation

{$R *.dfm}


Constructor TfmMeasurementObjectInstanceSelector.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
end;

Destructor TfmMeasurementObjectInstanceSelector.Destroy();
begin
Inherited;
end;


end.
