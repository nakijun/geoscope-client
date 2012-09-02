unit unitTransportServicePanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, Db, DBTables,
  unitTransportTimetable{исходные находятся в Model ...}, unitSolution,
  Functionality, SpaceObjInterpretation;

type
  TTransportServicePanelProps = class(TSpaceObjPanelProps)
    pnlConditions: TPanel;
    Bevel1: TBevel;
    edDepartNode: TEdit;
    edArrivalNode: TEdit;
    Bevel2: TBevel;
    pnlDateChoice: TPanel;
    rbDateToday: TRadioButton;
    rbDateTomorrow: TRadioButton;
    rbDateDayAfterTomorrow: TRadioButton;
    rbDateSpecific: TRadioButton;
    Bevel3: TBevel;
    Panel1: TPanel;
    rbTimeNear: TRadioButton;
    rbTimeSpecific: TRadioButton;
    dtpDateSpecific: TDateTimePicker;
    dtpTimeSpecific: TDateTimePicker;
    Database: TDatabase;
    timerDateSpecificUpdater: TTimer;
    timerTimeSpecificUpdater: TTimer;
    sbResolve: TSpeedButton;
    rbTimeFrom0: TRadioButton;
    bbProcessStart: TBitBtn;
    rbAnyDay: TRadioButton;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    pcSolutions: TPageControl;
    procedure rbDateSpecificClick(Sender: TObject);
    procedure rbDateTodayClick(Sender: TObject);
    procedure rbDateTomorrowClick(Sender: TObject);
    procedure rbTimeSpecificClick(Sender: TObject);
    procedure rbTimeNearClick(Sender: TObject);
    procedure timerDateSpecificUpdaterTimer(Sender: TObject);
    procedure timerTimeSpecificUpdaterTimer(Sender: TObject);
    procedure edDepartNodeKeyPress(Sender: TObject; var Key: Char);
    procedure edArrivalNodeKeyPress(Sender: TObject; var Key: Char);
    procedure rbDateTodayKeyPress(Sender: TObject; var Key: Char);
    procedure rbDateTomorrowKeyPress(Sender: TObject; var Key: Char);
    procedure rbDateDayAfterTomorrowKeyPress(Sender: TObject;
      var Key: Char);
    procedure rbDateSpecificKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDateSpecificKeyPress(Sender: TObject; var Key: Char);
    procedure rbTimeNearKeyPress(Sender: TObject; var Key: Char);
    procedure rbTimeSpecificKeyPress(Sender: TObject; var Key: Char);
    procedure dtpTimeSpecificKeyPress(Sender: TObject; var Key: Char);
    procedure bbResolveKeyPress(Sender: TObject; var Key: Char);
    procedure edDepartNodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edArrivalNodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbDateTodayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbDateTomorrowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbDateDayAfterTomorrowKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbDateSpecificKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpDateSpecificKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbTimeNearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbTimeSpecificKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpTimeSpecificKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbResolveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbResolveClick(Sender: TObject);
    procedure pcSolutionsEnter(Sender: TObject);
    procedure rbDateDayAfterTomorrowClick(Sender: TObject);
    procedure rbTimeFrom0Click(Sender: TObject);
    procedure rbTimeFrom0KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbTimeFrom0KeyPress(Sender: TObject; var Key: Char);
    procedure bbProcessStartEnter(Sender: TObject);
    procedure bbProcessStartKeyPress(Sender: TObject; var Key: Char);
    procedure bbProcessStartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Resolve(const nmDepartNode,nmArrivalNode: string; const Resolve_flAnyDay: boolean; const Resolve_Time: TDateTime; const Resolve_flAboveAndEqual: boolean);
    procedure _Resolve;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    procedure CommonKeyPress(Sender: TObject; var Key: Char);
    procedure CommonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pcSolutions_Clear;
    procedure pcSolutions_AddSolution(S: TfmSolution);
    procedure pcSolutions_Show;
  end;


implementation

{$R *.DFM}

Constructor TTransportServicePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
dtpDateSpecific.DateTime:=Now;
dtpTimeSpecific.Time:=Time;
Update;
end;

procedure TTransportServicePanelProps.Resolve(const nmDepartNode,nmArrivalNode: string; const Resolve_flAnyDay: boolean; const Resolve_Time: TDateTime; const Resolve_flAboveAndEqual: boolean);
var
  realnmArrivalNode: string;
  OrderPrice: string;
  SolutionCount: integer;

  procedure TreateRouteArrivalNode(const idRouteArrivalNode: integer; const idRoute: integer; const idArrivalNode: integer; const nmArrivalNode: string; const ArrivalNodeOrder: integer; const ArrivalNodeOrderPrice: string);

    procedure Route_GetInfo(const idRoute: integer; var nmTRouteTransport,nmRoute,Remarks: string);
    begin
    with TQuery.Create(nil) do begin
    DatabaseName:='DBS';
    SQL.Clear;
    SQL.Add('SELECT Transport_Routes.Name,Transport_Types.Name nmTTransport,Transport_Routes.Remarks FROM Transport_Routes,Transport_Types WHERE Transport_Routes.id = '+IntToStr(idRoute)+' AND Transport_Routes.idTTransport = Transport_Types.id');
    Open;
    if FieldValues['Name'] <> null then nmRoute:=FieldValues['Name'] else nmRoute:='';
    if FieldValues['nmTTransport'] <> null then nmTRouteTransport:=FieldValues['nmTTransport'] else nmTRouteTransport:='';
    if FieldValues['Remarks'] <> null then Remarks:=FieldValues['Remarks'] else Remarks:='';
    Destroy;
    end;
    end;

    function RouteNode_DistanceBeforeRoute(const idRouteNode: integer): integer;
    begin
    with TQuery.Create(nil) do begin
    DatabaseName:='DBS';
    SQL.Clear;
    SQL.Add('SELECT Transport_RtNodes.DistBeforeRoute FROM Transport_RtNodes WHERE id = '+IntToStr(idRouteNode));
    Open;
    if FieldValues['DistBeforeRoute'] <> null then Result:=FieldValues['DistBeforeRoute'] else Result:=0;
    Destroy;
    end;
    end;

  var
    nmTRouteTransport,nmRoute,realnmDepartNode,RouteRemarks: string;
    idRouteNode: integer;
    Qr: TQuery;
    TxtField: TMemoField;
    TimetableStream: TBlobStream;
    ResultList: TStringList;
    I: integer;
    D: integer;
    S,S1,S2: string;
    Solution: TfmSolution;
  begin
  with TQuery.Create(nil) do begin
  DatabaseName:='DBS';
  SQL.Clear;
  SQL.Add(
  'SELECT Transport_RtNodes.id,Transport_RtNodes.idNode,Transport_Nodes.Name,Transport_RtNodes.NodeOrder '+
  'FROM Transport_RtNodes,Transport_Nodes,Transport_Routes '+
  'WHERE '+
  '  ((Transport_RtNodes.idRoute = Transport_Routes.id) AND Transport_Routes.Valid > 0) AND '+
  '  (Transport_RtNodes.idRoute = '+IntToStr(idRoute)+' AND Transport_RtNodes.NodeOrder < '+IntToStr(ArrivalNodeOrder)+') AND '+
  '  Transport_Nodes.Name LIKE "'+nmDepartNode+'%" AND '+
  '  Transport_RtNodes.idNode = Transport_Nodes.id '+
  'ORDER BY '+
  '  Transport_RtNodes.NodeOrder DESC'
  );
  Open;
  try
  if NOT EOF
   then begin
    Route_GetInfo(idRoute, nmTRouteTransport,nmRoute,RouteRemarks);
    repeat
      //. получаем маршрутный узел отправления
      idRouteNode:=FieldValues['id'];
      if FieldValues['Name'] <> null then realnmDepartNode:=FieldValues['Name'] else realnmDepartNode:='';
      //. извлекаем расписание-отправления узла отправления
      Qr:=TQuery.Create(nil);
      with Qr do begin
      DatabaseName:='DBS';
      SQL.Clear;
      SQL.Add('SELECT * FROM Transport_RtNodes WHERE id = '+IntToStr(idRouteNode));
      TxtField:=TMemoField.Create(nil);
      with TxtField do begin
      FieldName:='DepartTimeTable';
      DataSet:=Qr;
      end;
      try
      Open;
      TimetableStream:=TBlobStream.Create(TxtField,bmRead);
      with TTransportTimetable.Create(TimetableStream) do begin
      Parser(Resolve_flAnyDay,Resolve_Time,Resolve_flAboveAndEqual, ResultList); //. получаем инфо о расписании
      Destroy;
      end;
      finally
      TxtField.Destroy;
      Destroy;
      end;
      end;

      if ResultList.Count > 0
       then begin
        //. выводим маршрутную информацию
        Solution:=TfmSolution.Create(nil);
        with Solution do begin
        TransportServicePanelProps:=Self;
        D:=RouteNode_DistanceBeforeRoute(idRouteNode{idDepartNode});
        if D > 0
         then S1:='/ '+IntToStr(D)+' m'
         else S1:='';
        D:=RouteNode_DistanceBeforeRoute(idRouteArrivalNode);
        if D > 0
         then S2:='/ '+IntToStr(D)+' m'
         else S2:='';
        lbRouteName.Caption:=nmRoute;
        lbRouteType.Caption:=nmTRouteTransport;
        edDepartNodeName.Text:=realnmDepartNode+' '+S1;
        edArrivalNodeName.Text:=realnmArrivalNode+' '+S2;
        lbRouteRemarks.Caption:=RouteRemarks;
        lbOrderPrice.Caption:=ArrivalNodeOrderPrice;
        //. выводим информацию о расписании
        with memoDepartNodeTimetable.Lines do begin
        BeginUpdate;
        Clear;
        for I:=0 to ResultList.Count-1 do Add(ResultList[I]);
        EndUpdate;
        end;
        end;
        pcSolutions_AddSolution(Solution);
        Inc(SolutionCount);
        end;
      ResultList.Destroy;

    Next;
    until EOF;
    end
   {else
    ShowMessage('! not found');}
  finally
  Destroy;
  end;
  end;
  end;

begin
if (nmDepartNode = '') OR (nmArrivalNode = '') then Exit;
with TQuery.Create(nil) do begin
DatabaseName:='DBS';
SQL.Clear;
SQL.Add(
'SELECT Transport_RtNodes.id,Transport_RtNodes.idRoute,Transport_RtNodes.idNode,Transport_Nodes.Name,Transport_RtNodes.NodeOrder,Transport_RtNodes.OrderPrice,Transport_RtNodes.ArrivalTimeTable '+
'FROM Transport_RtNodes,Transport_Nodes,Transport_Routes '+
'WHERE '+
'  ((Transport_RtNodes.idRoute = Transport_Routes.id) AND Transport_Routes.Valid > 0) AND '+
'  Transport_Nodes.Name LIKE "'+nmArrivalNode+'%" AND '+
'  Transport_RtNodes.idNode = Transport_Nodes.id '+
'ORDER BY '+
'  Transport_Nodes.Name,Transport_RtNodes.NodeOrder'
);
Open;
pcSolutions_Clear;
SolutionCount:=1;
try
if NOT EOF
 then
  begin
  repeat
    if FieldValues['Name'] <> null then realnmArrivalNode:=FieldValues['Name'] else realnmArrivalNode:='';
    if FieldValues['OrderPrice'] <> null then OrderPrice:=FieldValues['OrderPrice'] else OrderPrice:='';
    //. обрабатываем маршрутный узел прибытия
    TreateRouteArrivalNode(FieldValues['id'],FieldValues['idRoute'],FieldValues['idNode'],realnmArrivalNode,FieldValues['NodeOrder'],OrderPrice);

    Next;
  until EOF;
  end
 {else
  ShowMessage('! not found');}
finally
Destroy;
pcSolutions_Show;
end
end;
end;

procedure TTransportServicePanelProps._Resolve;
var
  ExecDate,ExecTime: TDateTime;
begin
if rbDateToday.Checked
 then ExecDate:=Now else
if rbDateTomorrow.Checked
 then ExecDate:=Now+1 else
if rbDateDayAfterTomorrow.Checked
 then ExecDate:=Now+2 else
if rbDateSpecific.Checked
 then ExecDate:=dtpDateSpecific.Date;
ExecDate:=Trunc(ExecDate);

if rbTimeFrom0.Checked
 then ExecTime:=0 else
if rbTimeNear.Checked
 then ExecTime:=Now else
if rbTimeSpecific.Checked
 then ExecTime:=dtpTimeSpecific.Time;
ExecTime:=Frac(ExecTime);

Resolve(edDepartNode.Text,edArrivalNode.Text, rbAnyDay.Checked, ExecDate+ExecTime,true);
end;

procedure TTransportServicePanelProps.pcSolutions_Clear;
begin
pcSolutions.DestroyComponents;
pcSolutions.Hide;
end;

procedure TTransportServicePanelProps.pcSolutions_AddSolution(S: TfmSolution);
var
  TS: TTabSheet;
  SB: TScrollBox;
begin
TS:=TTabSheet.Create(pcSolutions);
SB:=TScrollBox.Create(TS);
with SB do begin
Align:=alClient;
Color:=clSilver;
Parent:=TS;
end;
with S do begin
Left:=20;
Top:=10;
Parent:=SB;
SB.InsertComponent(S);
end;
TS.PageControl:=pcSolutions;
TS.Caption:='no solution '+IntToStr(TS.TabIndex+1);
S.Show;
end;

procedure TTransportServicePanelProps.pcSolutions_Show;
begin
if pcSolutions.PageCount <> 0
 then begin
  Color:=clSilver;
  pcSolutions.Show;
  end
 else
  ShowMessage('no solution !');
end;

procedure TTransportServicePanelProps.rbDateSpecificClick(Sender: TObject);
begin
with Sender as TRadioButton do if Checked then dtpDateSpecific.Enabled:=true;
end;

procedure TTransportServicePanelProps.rbDateTodayClick(Sender: TObject);
begin
dtpDateSpecific.Enabled:=false;
end;

procedure TTransportServicePanelProps.rbDateTomorrowClick(Sender: TObject);
begin
dtpDateSpecific.Enabled:=false;
end;

procedure TTransportServicePanelProps.rbTimeSpecificClick(Sender: TObject);
begin
with Sender as TRadioButton do if Checked then dtpTimeSpecific.Enabled:=true;
end;

procedure TTransportServicePanelProps.rbTimeNearClick(Sender: TObject);
begin
dtpTimeSpecific.Enabled:=false;
end;

procedure TTransportServicePanelProps.timerDateSpecificUpdaterTimer(Sender: TObject);
begin
if NOT dtpDateSpecific.Enabled then dtpDateSpecific.Date:=Date;
end;

procedure TTransportServicePanelProps.timerTimeSpecificUpdaterTimer(Sender: TObject);
begin
if NOT dtpTimeSpecific.Enabled then dtpTimeSpecific.Time:=Time;
end;

procedure TTransportServicePanelProps.edDepartNodeKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.edArrivalNodeKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbDateTodayKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbDateTomorrowKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbDateDayAfterTomorrowKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbDateSpecificKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.dtpDateSpecificKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbTimeNearKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.rbTimeSpecificKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.dtpTimeSpecificKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.bbResolveKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.FormKeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.edDepartNodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.edArrivalNodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbDateTodayKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbDateTomorrowKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbDateDayAfterTomorrowKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbDateSpecificKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.dtpDateSpecificKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbTimeNearKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbTimeSpecificKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.dtpTimeSpecificKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.bbResolveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.CommonKeyPress(Sender: TObject; var Key: Char);
begin
case Ord(Key) of
$0D: Key:=#0;
end;
end;

procedure TTransportServicePanelProps.CommonKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
end;


procedure TTransportServicePanelProps.sbResolveClick(Sender: TObject);
begin
_Resolve;
end;

procedure TTransportServicePanelProps.pcSolutionsEnter(Sender: TObject);
begin
// - _Resolve;
end;

procedure TTransportServicePanelProps.rbDateDayAfterTomorrowClick(Sender: TObject);
begin
dtpDateSpecific.Enabled:=false;
end;

procedure TTransportServicePanelProps.rbTimeFrom0Click(Sender: TObject);
begin
dtpTimeSpecific.Enabled:=false;
end;

procedure TTransportServicePanelProps.rbTimeFrom0KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.rbTimeFrom0KeyPress(Sender: TObject; var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.bbProcessStartEnter(Sender: TObject);
begin
_Resolve;
end;

procedure TTransportServicePanelProps.bbProcessStartKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
CommonKeyDown(Sender,Key,Shift);
end;

procedure TTransportServicePanelProps.bbProcessStartKeyPress(Sender: TObject;
  var Key: Char);
begin
CommonKeyPress(Sender,Key);
end;

procedure TTransportServicePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TTransportServicePanelProps.Controls_ClearPropData;
begin
end;


end.
