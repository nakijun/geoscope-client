unit unitCoClockFunctionality;
Interface
Uses
  Classes,
  FunctionalityImport,
  CoFunctionality;



Const
  idTCoClock = 1111123;
Type
  TCoClockFunctionality = class(TCoComponentFunctionality)
  private
    IndicatorFunctionality: TTTFVisualizationFunctionality;
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure SetNowTime;
  end;

  TTCoClockFunctioning = class(TThread)
  public
    Constructor Create;
    procedure Execute; override;
  end;


  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


Implementation
Uses
  SysUtils,
  TypesDefines;



{TCoClockFunctionality}
Constructor TCoClockFunctionality.Create(const pidCoComponent: integer);
var
  idTComponent,idComponent: integer;
begin
Inherited Create(pidCoComponent);
if TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTTTFVisualization, idTComponent,idComponent)
 then IndicatorFunctionality:=TTTFVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent))
 else IndicatorFunctionality:=nil;
end;

Destructor TCoClockFunctionality.Destroy;
begin
IndicatorFunctionality.Release;
Inherited;
end;

procedure TCoClockFunctionality.SetNowTime;
begin
IndicatorFunctionality.SetStr(FormatDateTime('HH:NN',Now)+' '+IntToStr(Random(100)));
end;





{TTCoClockFunctioning}
Constructor TTCoClockFunctioning.Create;
begin
Inherited Create(false);
end;

procedure TTCoClockFunctioning.Execute;
const
  WaitInterval = 100;
var
  I,J: integer;
  ClocksList: TList;
begin 
{with TCoComponentTypeFunctionality_Create(idTCoClock) do
try
GetInstanceList(ClocksList);
try
I:=1;
repeat
  if (I MOD (10*59)) = 0
   then
    for J:=0 to ClocksList.Count-1 do with TCoClockFunctionality.Create(Integer(ClocksList[J])) do
      try
      SetNowTime;
      finally
      Release;
      end;
  Sleep(WaitInterval);
  Inc(I);
until Terminated;
finally
ClocksList.Destroy;
end;
finally
Release;
end;}
end;



var
  TCoClockFunctioning: TTCoClockFunctioning = nil;

procedure Initialize;
begin
TCoClockFunctioning:=TCoClockFunctioning.Create;
end;

procedure Finalize;
begin
TCoClockFunctioning.Free;
end;


end.
