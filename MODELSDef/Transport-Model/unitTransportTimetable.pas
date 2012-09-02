unit unitTransportTimetable;

interface
Uses
  SysUtils,
  Classes,
  unitTransportTimetableKeywords; //. ключевые слова расписани€

Type
  TTransportTimetable = class(TMemoryStream)
  private
    function ReadWord(var Word: shortstring): boolean;
  public
    Constructor Create(SrsData: TStream);
    procedure Parser(const flAnyDay: boolean; const ParserTime: TDateTime; const flAboveAndEqual: boolean; var ResultList: TStringList);
  end;

Implementation

{TTransportTimetable}
Constructor TTransportTimetable.Create(SrsData: TStream);
begin
Inherited Create;
LoadFromStream(SrsData);
end;

function TTransportTimetable.ReadWord(var Word: shortstring): boolean;
var
  FetchedChar: Char;
  cntMissSym: integer;
  flSymPassed: boolean;
begin
Result:=false;
Word:='';
while Position < Size do begin
  Read(FetchedChar,1);
  //. символ - пропускаемый ?
  flSymPassed:=true;
  for cntMissSym:=1 to Length(TimetableMissSymbols) do
    if TimetableMissSymbols[cntMissSym] = FetchedChar
     then begin
      flSymPassed:=false;
      Break;
      end;

  if flSymPassed
   then begin
    Word:=Word+FetchedChar;
    Result:=true;
    end
   else
    if Result then Exit; //. -->
  end;
end;

procedure TTransportTimetable.Parser(const flAnyDay: boolean; const ParserTime: TDateTime; const flAboveAndEqual: boolean; var ResultList: TStringList);
var
  ParserYear,ParserMonth,ParserDay,ParserWeekDay: word;
  ParserDayTime: TDateTime;


  //. ежедневна€ секци€
  function IsEveryDaySection(const Word: shortstring): boolean;
  begin
  Result:=(Word = kwEveryDay);
  end;

  procedure EveryDaySection_Skip(var NextWord: shortstring);
  begin
  ReadWord(NextWord);
  end;

  function EveryDaySection_Passed(var NextWord: shortstring): boolean;
  begin
  Result:=true;
  end;

  //. секци€ мес€ца
  function IsMonthSection(const Word: shortstring): boolean;
  begin
  Result:=IsMonthKeyWord(Word);
  end;

  procedure MonthSection_Skip(var NextWord: shortstring);
  begin
  while ReadWord(NextWord) do
    if NOT IsMonthKeyWord(NextWord) then Exit;
  end;

  function MonthSection_MonthPassed(var NextWord: shortstring): boolean;

    function MonthNumber(const MonthName: shortstring): integer;
    var
      I: integer;
    begin
    Result:=-1;
    for I:=1 to MonthKeywordsCount do
      if MonthKeywordsList[I] = MonthName
       then begin
        Result:=I;
        Exit;
        end;
    end;

  begin
  while IsMonthKeyWord(NextWord) do begin
    if MonthNumber(NextWord) = ParserMonth
     then begin
      Result:=true;
      MonthSection_Skip(NextWord);
      Exit;
      end;
    ReadWord(NextWord);
    end;
  Result:=false;
  end;

  //. секци€ дн€ недели
  function IsWeekDaySection(const NextWord: shortstring): boolean;
  begin
  Result:=IsWeekKeyWord(NextWord);
  end;

  procedure WeekDaySection_Skip(var NextWord: shortstring);
  begin
  while ReadWord(NextWord) do
    if NOT IsWeekKeyWord(NextWord) then Exit;
  end;

  function WeekDaySection_WeekDayPassed(var NextWord: shortstring): boolean;

    function WeekDayNumber(const WeekDayName: shortstring): integer;
    var
      I: integer;
    begin
    Result:=-1;
    for I:=1 to WeekKeywordsCount do
      if WeekKeywordsList[I] = WeekDayName
       then begin
        Result:=I;
        Exit;
        end;
    end;

  begin
  while IsWeekKeyWord(NextWord) do begin
    if WeekDayNumber(NextWord) = ParserWeekDay
     then begin
      Result:=true;
      WeekDaySection_Skip(NextWord);
      Exit;
      end;
    ReadWord(NextWord);
    end;
  Result:=false;
  end;


  //. секци€ времени дн€
  function IsDayTimeSection(const Word: shortstring): boolean;
  var
    Time: TDateTime;
  begin
  Result:=IsTimeWord(Word, Time) OR (Word = kwFrom);
  end;

  procedure DayTimeSection_Skip(var NextWord: shortstring);
  var
    curDayTime: shortstring;
    FetchedTime: TDateTime;
    FetchedTimeBegin,FetchedTimeEnd: TDateTime;
    Interval: TDateTime;
    curTime: TDateTime;
  begin
  if NextWord = kwFrom
   then begin //. интервально временной разбор
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, FetchedTimeBegin) then Raise Exception.Create('no interval start');
    ReadWord(NextWord);
    if NextWord <> kwInterval then Raise Exception.Create('no keyword '+kwInterval);
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, Interval) then Raise Exception.Create('no keyword interval');
    ReadWord(NextWord);
    if NextWord <> kwTo then Raise Exception.Create('no keyword '+kwTo);
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, FetchedTimeEnd) then Raise Exception.Create('no keyword end');
    ReadWord(NextWord);
    end
   else
    while IsTimeWord(NextWord, FetchedTime) do begin
      ReadWord(NextWord);
      end;
  end;

  function IsComment(const Word: shortstring): boolean;
  begin
  Result:=NOT IsEveryDaySection(Word) AND
          NOT IsMonthSection(Word) AND
          NOT IsWeekDaySection(Word) AND
          NOT IsDayTimeSection(Word);
  end;

  procedure DayTimeSection_GetTimePassedList(var NextWord: shortstring; ResultsList: TStringList);
  var
    curDayTime: shortstring;
    DayTime: TDateTime;
    FetchedTime: TDateTime;
    FetchedTimeBegin,FetchedTimeEnd: TDateTime;
    Interval: TDateTime;
    curTime: TDateTime;
    LastIndex: integer;
  begin
  LastIndex:=-1;
  if NextWord = kwFrom
   then begin //. интервально временной разбор
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, FetchedTimeBegin) then Raise Exception.Create('no interval begin');
    ReadWord(NextWord);
    if NextWord <> kwInterval then Raise Exception.Create('no keyword '+kwInterval);
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, Interval) then Raise Exception.Create('no interval value');
    ReadWord(NextWord);
    if NextWord <> kwTo then Raise Exception.Create('no keyword '+kwTo);
    ReadWord(NextWord);
    if NOT IsTimeWord(NextWord, FetchedTimeEnd) then Raise Exception.Create('no keyword');

    curTime:=FetchedTimeBegin;
    while curTime < FetchedTimeEnd do begin
      //. временной разбор
      if flAboveAndEqual
       then begin
        if CurTime >= ParserDayTime
         then ResultList.Add(FormatDateTime('HH:MM',CurTime));
        end;
      curTime:=curTime+Interval;
      end;
    if flAboveAndEqual
     then begin
      if FetchedTimeEnd >= ParserDayTime
       then ResultList.Add(FormatDateTime('HH:MM',FetchedTimeEnd));
      end;
    ReadWord(NextWord);
    end
   else
    while (NextWord <> '') AND IsTimeWord(NextWord, FetchedTime) do begin
      //. временной разбор
      if flAboveAndEqual
       then begin
        if FetchedTime >= ParserDayTime
         then LastIndex:=ResultList.Add(NextWord);
        end;
      ReadWord(NextWord);
      while (NextWord <> '') AND IsComment(NextWord) do begin
        if LastIndex <> -1 then ResultList[LastIndex]:=ResultList[LastIndex]+' '+NextWord;
        ReadWord(NextWord);
        end;
      end;
  end;


  procedure JustDoIt;
  var
    NextWord: shortstring;
  begin
  ResultList:=TStringList.Create;
  if NOT flAnyDay
   then begin
    ReadWord(NextWord);
    while NextWord <> '' do begin
      if IsEveryDaySection(NextWord)
       then begin//. ежедневный разбор
        EveryDaySection_Skip(NextWord);
        DayTimeSection_GetTimePassedList(NextWord, ResultList);
        end
       else
        if IsMonthSection(NextWord)
         then begin //. разбор по мес€цам
          if MonthSection_MonthPassed(NextWord)
           then
            if IsWeekDaySection(NextWord)
             then
              if WeekDaySection_WeekDayPassed(NextWord)
               then
                if IsDayTimeSection(NextWord)
                 then DayTimeSection_GetTimePassedList(NextWord, ResultList)
                 else Raise Exception.Create('')
               else
                if IsDayTimeSection(NextWord)
                 then DayTimeSection_Skip(NextWord)
                 else Raise Exception.Create('')
             else
              if IsDayTimeSection(NextWord)
               then DayTimeSection_GetTimePassedList(NextWord, ResultList)
               else Raise Exception.Create('')
           else begin
            if IsWeekDaySection(NextWord) then WeekDaySection_Skip(NextWord);
            if IsDayTimeSection(NextWord)
             then DayTimeSection_Skip(NextWord)
             else Raise Exception.Create('');
            end;
          end
         else
          if IsWeekDaySection(NextWord)
           then begin //. разбор по недел€м
            if WeekDaySection_WeekDayPassed(NextWord)
             then
              if IsDayTimeSection(NextWord)
               then DayTimeSection_GetTimePassedList(NextWord, ResultList)
               else Raise Exception.Create('')
             else
              if IsDayTimeSection(NextWord)
               then DayTimeSection_Skip(NextWord)
               else Raise Exception.Create('')
            end
           else
            ReadWord(NextWord);
      end;
    end
   else //. выводим всЄ расписание
    while ReadWord(NextWord) do ResultList.Add(NextWord);
  end;

begin
DecodeDate(ParserTime, ParserYear,ParserMonth,ParserDay);
ParserWeekDay:=DayOfWeek(ParserTime);
ParserDayTime:=Frac(ParserTime);
JustDoIt;
end;

end.
