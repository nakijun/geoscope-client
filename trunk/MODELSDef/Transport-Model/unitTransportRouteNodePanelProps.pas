unit unitTransportRouteNodePanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, UnitProxySpace, Functionality, TypesFunctionality, DB, DBClient,
  RXCtrls, ExtCtrls, RxGrdCpt;

type
  TfmTransportRouteNodePanelProps = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    edDistanceBefore: TEdit;
    RxLabel3: TRxLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    reDepartTimetable: TMemo;
    TabSheet2: TTabSheet;
    reArrivalTimetable: TMemo;
    RxLabel4: TRxLabel;
    edOrderPrice: TEdit;
    RxLabel5: TRxLabel;
    procedure edDistanceBeforeKeyPress(Sender: TObject; var Key: Char);
    procedure reDepartTimetableChange(Sender: TObject);
    procedure reArrivalTimetableMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure reDepartTimetableMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure reArrivalTimetableChange(Sender: TObject);
    procedure edOrderPriceKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    RouteFunctionality: TTransportRouteFunctionality;
    idRouteNode: integer;
    DepartTimeTable_flChanged: boolean;
    ArrivalTimeTable_flChanged: boolean;
  public
    { Public declarations }
    Constructor Create(pRouteFunctionality: TTransportRouteFunctionality; const pidRouteNode: integer);
    Destructor Destroy; override;
    procedure Update;
    procedure Save;
  end;


implementation
Uses
  unitTransportTimetableKeywords;
{$R *.DFM}


{TfmTransportRouteNodeTimetable}
Constructor TfmTransportRouteNodePanelProps.Create(pRouteFunctionality: TTransportRouteFunctionality; const pidRouteNode: integer);
begin
Inherited Create(nil);
RouteFunctionality:=pRouteFunctionality;
idRouteNode:=pidRouteNode;
Update;
end;

Destructor TfmTransportRouteNodePanelProps.Destroy;
begin
Save;
Inherited;
end;

procedure TfmTransportRouteNodePanelProps.Update;
begin
//. получаем расстояние до маршрута
edDistanceBefore.Text:=IntToStr(RouteFunctionality.Nodes__Node_DistanceBefore(idRouteNode));
//. получаем стоимость проезда от начала маршрута
edOrderPrice.Text:=RouteFunctionality.Nodes__Node_OrderPrice(idRouteNode);
//. получаем расписание отправления
DepartTimeTable_flChanged:=false;
//. получаем расписание прибытия
ArrivalTimeTable_flChanged:=false;
end;

procedure TfmTransportRouteNodePanelProps.Save;
begin
if DepartTimeTable_flChanged
 then begin //. сохраняем расписание отправления
  DepartTimeTable_flChanged:=false;
  end;
if ArrivalTimeTable_flChanged
 then begin //. сохраняем расписание прибытия
  ArrivalTimeTable_flChanged:=false;
  end;
end;

procedure TfmTransportRouteNodePanelProps.edDistanceBeforeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then RouteFunctionality.Nodes__Node_SetDistanceBefore(idRouteNode, StrToInt(edDistanceBefore.Text));
end;

procedure TfmTransportRouteNodePanelProps.reDepartTimetableChange(Sender: TObject);
begin
DepartTimeTable_flChanged:=true;
end;

procedure TfmTransportRouteNodePanelProps.reDepartTimetableMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
var
  KeyWord: shortstring;
  Res: boolean;
  SaveAttr: TTextAttributes;
begin
if Button = mbRIGHT
 then begin
  with TfmTransportTimetableKeywords.Create do begin
  Res:=Select(KeyWord);
  Destroy;
  end;
  if Res
   then begin
    reDepartTimetable.SelText:=KeyWord;
    DepartTimeTable_flChanged:=true;
    end;
  end;
end;

procedure TfmTransportRouteNodePanelProps.reArrivalTimetableChange(Sender: TObject);
begin
ArrivalTimeTable_flChanged:=true;
end;

procedure TfmTransportRouteNodePanelProps.reArrivalTimetableMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
var
  KeyWord: shortstring;
  Res: boolean;
  SaveAttr: TTextAttributes;
begin
if Button = mbRIGHT
 then begin
  with TfmTransportTimetableKeywords.Create do begin
  Res:=Select(KeyWord);
  Destroy;
  end;
  if Res
   then begin
    reArrivalTimetable.SelText:=KeyWord;
    ArrivalTimeTable_flChanged:=true;
    end;
  end;
end;

procedure TfmTransportRouteNodePanelProps.edOrderPriceKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then RouteFunctionality.Nodes__Node_SetOrderPrice(idRouteNode, edOrderPrice.Text);
end;

end.
