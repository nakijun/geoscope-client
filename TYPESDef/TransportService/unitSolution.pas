unit unitSolution;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls;

type
  TfmSolution = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    edDepartNodeName: TEdit;
    memoDepartNodeTimetable: TMemo;
    edArrivalNodeName: TEdit;
    memoArrivalNodeTimetable: TMemo;
    Bevel8: TBevel;
    Label1: TLabel;
    lbRouteName: TLabel;
    lbOrderPrice: TLabel;
    lbRouteType: TLabel;
    lbRouteRemarks: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure edDepartNodeNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDepartNodeNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    TransportServicePanelProps: TForm;
  end;


implementation
Uses
  unitTransportServicePanelProps;

{$R *.DFM}

procedure TfmSolution.edDepartNodeNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
TTransportServicePanelProps(TransportServicePanelProps).CommonKeyDown(Sender,Key,Shift);
end;

procedure TfmSolution.edDepartNodeNameKeyPress(Sender: TObject; var Key: Char);
begin
TTransportServicePanelProps(TransportServicePanelProps).CommonKeyPress(Sender,Key);
end;

end.
