unit unitTransportTimetableKeywords;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const //.  Ћё„≈¬џ≈ —Ћќ¬ј (! добавив слово (об€з. в верхнем регистре), не забудь добавить его в список)
  //. основные ключевые слова
  kwEveryDay   = '';
  kwEveryMonth = '';
  kwFrom       = '';
  kwTo         = '';
  kwInterval   = '';

  //. слова мес€цев
  kwJanuary   = '';
  kwFebruary  = '';
  kwMarch     = '';
  kwApril     = '';
  kwMay       = '';
  kwJune      = '';
  kwJuly      = '';
  kwAugust    = '';
  kwSeptember = '';
  kwOctober   = '';
  kwNovember  = '';
  kwDecember  = '';
  //. ключевые слова дней недели
  kwMonday    = '';
  kwTuesday   = '';
  kwWednesday = '';
  kwThursday  = '';
  kwFriday    = '';
  kwSaturday  = '';
  kwSunday = '';

  GeneralKeywordsCount = 5;
  GeneralKeywordsList: Array[0..GeneralKeywordsCount-1] of shortstring = (
    kwEveryDay,
    kwEveryMonth,
    kwFrom,
    kwTo,
    kwInterval
  );
  MonthKeywordsCount = 12;
  MonthKeywordsList: Array[1..MonthKeywordsCount] of shortstring = (
    //. слова мес€цев
    kwJanuary,
    kwFebruary,
    kwMarch,
    kwApril,
    kwMay,
    kwJune,
    kwJuly,
    kwAugust,
    kwSeptember,
    kwOctober,
    kwNovember,
    kwDecember
  );
  WeekKeywordsCount = 7;
  WeekKeywordsList: Array[1..WeekKeywordsCount] of shortstring = (
    //. ключевые слова дней недели
    kwSunday,
    kwMonday,
    kwTuesday,
    kwWednesday,
    kwThursday,
    kwFriday,
    kwSaturday
  );

  TimetableMissSymbols = #$0D#$0A#$20',';

  function IsGeneralKeyWord(Word: shortstring): boolean;
  function IsMonthKeyWord(Word: shortstring): boolean;
  function IsWeekKeyWord(Word: shortstring): boolean;
  function IsKeyWord(Word: shortstring): boolean;
  function IsTimeWord(Word: shortstring; var Time: TDateTime): boolean;
  function IsNumberWord(Word: shortstring; var Value: integer): boolean;
  /// + function IsMonthWord(Word: shortstring): boolean;

type
  TfmTransportTimetableKeywords = class(TForm)
    lvKeyWords: TListBox;
    procedure lvKeyWordsDblClick(Sender: TObject);
  private
    { Private declarations }
    flSelected: boolean;
    SelectedKeyWord: shortstring;
  public
    { Public declarations }
    Constructor Create;
    function Select(var KeyWord: shortstring): boolean;
    procedure Update;
  end;

implementation

{$R *.DFM}

function IsGeneralKeyWord(Word: shortstring): boolean;
var
  I: integer;
begin
Word:=AnsiUpperCase(Word);
Result:=false;
for I:=0 to GeneralKeywordsCount-1 do
  if GeneralKeywordsList[I] = Word
   then begin
    Result:=true;
    Exit;
    end;
end;

function IsMonthKeyWord(Word: shortstring): boolean;
var
  I: integer;
begin
Word:=AnsiUpperCase(Word);
Result:=false;
for I:=1 to MonthKeywordsCount do
  if MonthKeywordsList[I] = Word
   then begin
    Result:=true;
    Exit;
    end;
end;

function IsWeekKeyWord(Word: shortstring): boolean;
var
  I: integer;
begin
Word:=AnsiUpperCase(Word);
Result:=false;
for I:=1 to WeekKeywordsCount do
  if WeekKeywordsList[I] = Word
   then begin
    Result:=true;
    Exit;
    end;
end;

function IsKeyWord(Word: shortstring): boolean;
var
  I: integer;
begin
Word:=AnsiUpperCase(Word);
Result:=IsGeneralKeyWord(Word) OR IsMonthKeyWord(Word) OR IsWeekKeyWord(Word);
end;

function IsTimeWord(Word: shortstring; var Time: TDateTime): boolean;
begin
Result:=false;
try
Time:=StrToTime(Word);
Result:=true;
except
  end;
end;

function IsNumberWord(Word: shortstring; var Value: integer): boolean;
begin
Result:=false;
try
Value:=StrToInt(Word);
Result:=true;
except
  end;
end;


{TfmTransportTimetableKeywords}
Constructor TfmTransportTimetableKeywords.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TfmTransportTimetableKeywords.Update;
begin
with lvKeyWords do begin
Clear;
Items.BeginUpdate;
with Items do begin
//. основные ключевые слова
Add(kwEveryDay);
Add(kwEveryMonth);
Add(kwFrom);
Add(kwInterval);
Add(kwTo);
//. слова мес€цев
Add(kwJanuary);
Add(kwFebruary);
Add(kwMarch);
Add(kwApril);
Add(kwMay);
Add(kwJune);
Add(kwJuly);
Add(kwAugust);
Add(kwSeptember);
Add(kwOctober);
Add(kwNovember);
Add(kwDecember);
//. ключевые слова дней недели
Add(kwMonday);
Add(kwTuesday);
Add(kwWednesday);
Add(kwThursday);
Add(kwFriday);
Add(kwSaturday);
Add(kwSunday);
end;
Items.EndUpdate;
end;
end;

function TfmTransportTimetableKeywords.Select(var KeyWord: shortstring): boolean;
begin
flSelected:=false;
ShowModal;
Result:=false;
if flSelected
 then begin
  KeyWord:=SelectedKeyWord;
  Result:=true;
  end;
end;


procedure TfmTransportTimetableKeywords.lvKeyWordsDblClick(Sender: TObject);
begin
if (lvKeyWords.ItemIndex <> -1) AND (lvKeyWords.Items[lvKeyWords.ItemIndex] <> '')
 then begin
  SelectedKeyWord:=lvKeyWords.Items[lvKeyWords.ItemIndex];
  flSelected:=true;
  Close;
  end;
end;

end.
