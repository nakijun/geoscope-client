unit unitTypesFunctionalityExporter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, StrUtils;

const
  SrsName = '..\Functionality.pas';
  SrsName1 = '..\TYPESDef\TypesFunctionalityInterface.inc';

  FunctionalityExportFileName = '..\TYPESDef\FunctionalityExport.inc';
  FunctionalityExportInterfaceFileName = '..\FunctionalityExportInterface.inc';
  FunctionalityExportImplementationFileName = '..\FunctionalityExportImplementation.inc';
  FunctionalityImportInterfaceFileName = 'Out\FunctionalityImportInterface.inc';
  FunctionalityImportImplementationFileName = 'Out\FunctionalityImportImplementation.inc';

  TypesFunctionalityExportFileName = '..\TYPESDef\TypesFunctionalityExport.inc';
  TypesFunctionalityExportInterfaceFileName = '..\TYPESDef\TypesFunctionalityExportInterface.inc';
  TypesFunctionalityExportImplementationFileName = '..\TYPESDef\TypesFunctionalityExportImplementation.inc';
  TypesFunctionalityImportInterfaceFileName = 'Out\TypesFunctionalityImportInterface.inc';
  TypesFunctionalityImportImplementationFileName = 'Out\TypesFunctionalityImportImplementation.inc';

type
  TfmTypesFunctionalityExporter = class(TForm)
    sbExport: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    memoTypesFunctionalityExport: TMemo;
    memoTypesFunctionalityExportImplementation: TMemo;
    TabSheet4: TTabSheet;
    memoTypesFunctionalityExportInterface: TMemo;
    TabSheet3: TTabSheet;
    memoTypesFunctionalityImportInterface: TMemo;
    TabSheet5: TTabSheet;
    memoTypesFunctionalityImportImplementation: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure sbExportClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoExport;
    procedure TypesFunctionalityFilesUpdate;
  public
    { Public declarations }
  end;

var
  fmTypesFunctionalityExporter: TfmTypesFunctionalityExporter;

implementation

{$R *.dfm}



procedure TfmTypesFunctionalityExporter.DoExport;
var
  SrsStream: TMemoryStream;

  procedure ShowBlock(const StartPos: integer);
  var
    S: WideString;
    C: Char;
    Sz: integer;
    I: integer;
  begin
  with SrsStream do begin
  S:='';
  Sz:=Position-StartPos;
  Position:=StartPos;
  for I:=0 to Sz-1 do begin
    Read(C,SizeOf(Char));
    S:=S+C;
    end;
  end;
  ShowMessage(S);
  end;

  procedure CheckToken(TokenName: string);
  var
    C: Char;
    I: integer;
  begin
  if TokenName = '' then Exit; //. ->
  TokenName:=ANSIUpperCase(TokenName);
  I:=1;
  with SrsStream do
  repeat
    if Position >= Size then Raise Exception.Create('token '+TokenName+' is not found'); //. =>
    Read(C,SizeOf(C));
    C:=ANSIUpperCase(C)[1];
    if C = TokenName[I]
     then begin
      Inc(I);
      if I > Length(TokenName) then Exit; //. ->
      end
     else
      I:=1;
  until false;
  end;

  function FindContext(Context: string): boolean;
  var
    C: Char;
    I: integer;
  begin
  Result:=false;
  Context:=ANSIUpperCase(Context);
  I:=1;
  with SrsStream do
  repeat
    if Position >= Size then Exit; //. ->
    Read(C,SizeOf(C));
    C:=ANSIUpperCase(C)[1];
    if C = Context[I]
     then begin
      Inc(I);
      if I > Length(Context)
       then begin
        Result:=true;
        Exit; //. ->
        end;
      end
     else
      I:=1;
  until false;
  end;

  procedure ReturtnToStringBegin;
  var
    C: Char;
  begin
  with SrsStream do
  repeat
    if Position = 0 then Exit; //. ->
    Position:=Position-1;
    Read(C,SizeOf(C));
    Position:=Position-1;
    if (C = #$0D) OR (C = #$0A)
     then begin
      Position:=Position+1;
      Exit; //. ->
      end;
  until false;
  end;

  function FindWord(Word: string): boolean;
  var
    C: Char;
    I: integer;
  begin
  Result:=false;
  Word:=ANSIUpperCase(Word);
  I:=1;
  with SrsStream do
  repeat
    if Position >= Size then Exit; //. ->
    Read(C,SizeOf(C));
    C:=ANSIUpperCase(C)[1];
    if C = Word[I]
     then begin
      Inc(I);
      if I > Length(Word)
       then begin
        Result:=true;
        if Position >= Size then Exit; //. ->
        Read(C,SizeOf(C));
        repeat
          case C of
          '0'..'9','a'..'z','A'..'Z','_','.': begin
            Result:=false;
            if Position >= Size then Break; //. >
            Read(C,SizeOf(C));
            end;
          else begin
            Position:=Position-1;
            Break; //. >
            end;
          end;
        until false;
        if Result then Exit; //. ->
        I:=1;
        end;
      end
     else begin
      repeat
        case C of
        '0'..'9','a'..'z','A'..'Z','_','.': begin
          if Position >= Size then Exit; //. ->
          Read(C,SizeOf(C));
          end;
        else
          Break; //. >
        end;
      until false;
      I:=1;
      end;
  until false;
  end;

  function FindWordInString(Word: string): boolean;
  var
    C: Char;
    I: integer;
  begin
  Result:=false;
  Word:=ANSIUpperCase(Word);
  I:=1;
  with SrsStream do
  repeat
    if Position >= Size then Exit; //. ->
    Read(C,SizeOf(C));
    if (C = #$0D) OR (C = #$0A) then Exit; //. ->
    C:=ANSIUpperCase(C)[1];
    if C = Word[I]
     then begin
      Inc(I);
      if I > Length(Word)
       then begin
        Result:=true;
        if Position >= Size then Exit; //. ->
        Read(C,SizeOf(C));
        repeat
          case C of
          '0'..'9','a'..'z','A'..'Z','_','.': begin
            Result:=false;
            if Position >= Size then Break; //. >
            Read(C,SizeOf(C));
            if (C = #$0D) OR (C = #$0A) then Break; //. ->
            end;
          else begin
            Position:=Position-1;
            Break; //. >
            end;
          end;
        until false;
        if Result then Exit; //. ->
        I:=1;
        end;
      end
     else begin
      repeat
        case C of
        '0'..'9','a'..'z','A'..'Z','_','.': begin
          if Position >= Size then Exit; //. ->
          Read(C,SizeOf(C));
          if (C = #$0D) OR (C = #$0A) then Exit; //. ->
          end;
        else
          Break; //. >
        end;
      until false;
      I:=1;
      end;
  until false;
  end;

  procedure SkipBlanks;
  var
    C: Char;
  begin
  with SrsStream do
  repeat
    if Position >= Size then Exit; //. ->
    Read(C,SizeOf(C));
    if C <> ' '
     then begin
      Position:=Position-1;
      Exit; //. ->
      end;
  until false;
  end;

  procedure SkipBlanksBack;
  var
    C: Char;
  begin
  with SrsStream do
  repeat
    if Position = 0 then Exit; //. ->
    Position:=Position-1;
    Read(C,SizeOf(C));
    if C <> ' ' then Exit; //. ->
    Position:=Position-1;
  until false;
  end;

  function NextChar: Char;
  begin
  with SrsStream do begin
  if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
  Read(Result,SizeOf(Result));
  end;
  end;

  function NextWord: string;
  var
    C: Char;
  begin
  Result:='';
  with SrsStream do begin
  //. skip symbols
  repeat
    if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
    Read(C,SizeOf(C));
    case C of
    '0'..'9','a'..'z','A'..'Z','_','.': begin
      Position:=Position-1;
      Break; //. >
      end;
    end;
  until false;
  //. prepare word
  repeat
    Read(C,SizeOf(C));
    case C of
    '0'..'9','a'..'z','A'..'Z','_','.': Result:=Result+C;
    else begin
      Position:=Position-1;
      Break; //. >
      end;
    end;
    if Position >= Size then Break; //. >
  until false;
  end;
  end;

  function PriorWord: string;
  var
    C: Char;
  begin
  Result:='';
  with SrsStream do begin
  //. prepare word
  repeat
    Position:=Position-1;
    if Position = 0 then Exit; //. ->
    Read(C,SizeOf(C));
    Position:=Position-1;
    case C of
    '0'..'9','a'..'z','A'..'Z','_','.': Result:=C+Result;
    else begin
      Position:=Position+1;
      Break; //. >
      end;
    end;
  until false;
  end;
  end;

  procedure GetRoutineParams(out Params: string);
  var
    C: Char;
  begin
  Params:='';
  with SrsStream do begin
  //. search the "("
  repeat
    if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
    Read(C,SizeOf(C));
    if C = '(' then Break; //. >
    if (C = ';') OR (C = ':')
     then begin
      Position:=Position-1;
      Exit; //. ->
      end;
  until false;
  //. prepare params
  repeat
    if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
    Read(C,SizeOf(C));
    if C = ')' then Break; //. >
    Params:=Params+C;
  until false;
  end;
  end;

  procedure ExtractParamsNames(const Params: string; out Names: string);
  var
    I,J: integer;
    R,R1: string;
  begin
  Names:='';
  R:='';
  I:=1;
  while I <= Length(Params) do begin
    if Params[I] <> ':'
     then
      R:=R+Params[I]
     else begin
      Inc(I);
      while I <= Length(Params) do begin
        if (Params[I] = ';') then Break; //. >
        Inc(I);
        end;
      R1:='';
      for J:=1 to Length(R) do if R[J] <> ' ' then R1:=R1+R[J];
      if ANSIUpperCase(R1[1]+R1[2]+R1[3]+R1[4]+R1[5]) = 'CONST' then R:=ANSIRightStr(R1,Length(R1)-5) else
      if ANSIUpperCase(R1[1]+R1[2]+R1[3]) = 'VAR' then R:=ANSIRightStr(R1,Length(R1)-3) else
      if ANSIUpperCase(R1[1]+R1[2]) = 'IN' then R:=ANSIRightStr(R1,Length(R1)-2) else
      if ANSIUpperCase(R1[1]+R1[2]+R1[3]) = 'OUT' then R:=ANSIRightStr(R1,Length(R1)-3) else
      R:=R1;
      Names:=Names+R;
      if I > Length(Params) then Exit; //. ->
      Names:=Names+',';
      R:='';
      end;
    Inc(I);
    end;
  end;

  procedure GetFunctionReturn(out Value: string);
  var
    C: Char;
  begin
  Value:='';
  with SrsStream do begin
  //. search the ":"
  repeat
    if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
    Read(C,SizeOf(C));
    if C = ':' then Break; //. >
  until false;
  //. prepare params
  SkipBlanks;
  repeat
    if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
    Read(C,SizeOf(C));
    if C = ';' then Break; //. >
    Value:=Value+C;
  until false;
  end;
  end;

  procedure GetNextStringTo(EndMark: shortstring; out S: WideString);
  var
    C: Char;
    SavePos: integer;
    flFound: boolean;
    I: integer;
  begin
  S:='';
  EndMark:=ANSIUpperCase(EndMark);
  with SrsStream do
  repeat
    SavePos:=Position;
    flFound:=true;
    for I:=1 to Length(EndMark) do begin
      if Position >= Size then Raise Exception.Create('eof of file found'); //. =>
      C:=NextChar;
      S:=S+C;
      if EndMark[I] <> ANSIUpperCase(C)
       then begin
        flFound:=false;
        Break; //. >
        end;
      end;
    if flFound then Exit; //. ->
  until false;
  end;

  procedure CopyString(BegPos,EndPos: integer; out S: WideString);
  var
    C: Char;
    SP: integer;
  begin
  S:='';
  with SrsStream do begin
  SP:=Position;
  try
  Position:=BegPos;
  repeat
    C:=NextChar;
    S:=S+C;
    if Position >= EndPos then Break; //. >
  until false;
  finally
  Position:=SP;
  end;
  end;
  end;

  function CharFoundIn(const FC: Char; BegPos,EndPos: integer): boolean;
  var
    C: Char;
    SP: integer;
  begin
  Result:=false;
  with SrsStream do begin
  SP:=Position;
  try
  Position:=BegPos;
  repeat
    C:=NextChar;
    if C = FC
     then begin
      Result:=true;
      Exit; //. ->
      end;
  until false;
  finally
  Position:=SP;
  end;
  end;
  end;

  procedure WriteConstsAndSubTypes(var TF: TextFile; BegPos,EndPos: integer; const flWriteTypeClause: boolean);
  var
    SP: integer;
    Pos: integer;
    C,C1: Char;
    Word: string;
    ConstPos: integer;
    ConstBody: WideString;
    TypeName: string;
    TypeBody: WideString;
  begin
  with SrsStream do begin
  //. get sub-types
  SP:=Position;
  try
  Position:=BegPos;
  repeat
    if (NOT FindContext('=')) OR (Position >= EndPos) then Break; //. >
    Pos:=Position-1;
    SkipBlanks;
    C:=NextChar;
    if C = '('
     then begin //. enum type
      Position:=Pos;
      SkipBlanksBack;
      TypeName:=PriorWord;
      SkipBlanksBack;
      if ANSIUpperCase(PriorWord) <> 'OF'
       then begin
        GetNextStringTo(';', TypeBody);
        if (flWriteTypeClause)
         then TypeBody:='Type'#$0D#$0A+TypeBody
         else TypeBody:=#$0D#$0A+TypeBody;
        WriteLn(TF,TypeBody);
        WriteLn(TF,'');
        end
       else
        Position:=Pos+1;
      end
     else begin
      Position:=Position-1;
      Word:=ANSIUpperCase(NextWord);
      if Word <> 'CLASS'
       then begin //. simple type
        if (Word = 'PACKED') OR (Word = 'RECORD')
         then begin
          {/// ? not included yet Position:=Pos;
          SkipBlanksBack;
          TypeName:=PriorWord;
          Pos:=Position;
          repeat
            if (Position >= EndPos) then Break; //. >
            Word:=ANSIUpperCase(NextWord);
            if (Word = 'END')
             then begin
              CopyString(Pos,Position, TypeBody);
              TypeBody:='Type'#$0D#$0A+'  '+TypeBody+';';
              WriteLn(TF,TypeBody);
              WriteLn(TF,'');
              Break; //. >
              end;
          until false;}
          end
         else begin
          {/// * error if NOT ((Word[1] = '''') OR (($30 <= Ord(Word[1])) AND (Ord(Word[1]) <= $39)))
           then begin
            Position:=Pos;
            SkipBlanksBack;
            TypeName:=PriorWord;
            GetNextStringTo(';', TypeBody);
            TypeBody:='Type'#$0D#$0A+'  '+TypeBody;
            WriteLn(TF,TypeBody);
            WriteLn(TF,'');
            end;}
          end;
        end;
      end;
  until false;
  finally
  Position:=SP;
  end;
  //. consts
  SP:=Position;
  try
  Position:=BegPos;
  repeat
    Word:=NextWord;
    if (Position >= EndPos) then Break; //. >
    if ANSIUpperCase(Word) = 'CONST'
     then begin
      ConstPos:=Position;
      Word:=NextWord;
      SkipBlanks;
      C:=NextChar;
      Pos:=Position;
      NextWord; NextWord;
      Word:=ANSIUpperCase(NextWord);
      if(Word = 'OF')
       then begin
        Word:=NextWord;
        SkipBlanks;
        C1:=NextChar;
        end
       else begin
        Word:=ANSIUpperCase(NextWord);
        if(Word = 'OF')
         then begin
          NextWord;
          SkipBlanks;
          C1:=NextChar;
          end
         else
          C1:=#0;
        end;
      Position:=Pos;
      if (C = '=') OR (C1 = '=')
       then
        repeat
          if (Position >= EndPos) then Break; //. >
          Word:=ANSIUpperCase(NextWord);
          if (Word = 'TYPE') OR (Word = 'VAR')
           then begin
            PriorWord;
            CopyString(ConstPos,Position, ConstBody);
            ConstBody:='Const'#$0D#$0A+'  '+ConstBody;
            WriteLn(TF,ConstBody);
            WriteLn(TF,'');
            Break; //. >
            end;
        until false;
      end
  until false;
  finally
  Position:=SP;
  end;
  end;
  end;


var
  CF: integer;
  SP: integer;
  SubTypesBegPos: integer;
  EndPos: integer;
  //.
  FunctionalityExportFile: TextFile;
  FunctionalityExportInterfaceFile: TextFile;
  FunctionalityExportImplementationFile: TextFile;
  FunctionalityImportInterfaceFile: TextFile;
  FunctionalityImportImplementationFile: TextFile;
  //.
  TypesFunctionalityExportFile: TextFile;
  TypesFunctionalityExportInterfaceFile: TextFile;
  TypesFunctionalityExportImplementationFile: TextFile;
  TypesFunctionalityImportInterfaceFile: TextFile;
  TypesFunctionalityImportImplementationFile: TextFile;
  //.
  FunctionalityBlockPos: integer;
  FunctionalityStrPos: integer;
  FunctionalityName: string;
  LastRoutineName,OrgRoutineName,RoutineName: string;
  OverloadedCount: integer;
  RoutineTypeName: string;
  RoutineFullName: string;
  RoutineParams: string;
  FunctionReturn: string;
  ParamsNames: string;
  Word: string;
  R: string;
  WS: WideString;
  flTypeFunctionality: boolean;
begin
//. Basis Functionality exporting
SrsStream:=TMemoryStream.Create;
with SrsStream do
try
LoadFromFile(SrsName);
Position:=0;
//. check "Functionalities"
CheckToken('Basis_Funtionalities');
SP:=Position;
CheckToken('Implementation');
EndPos:=Position;
Position:=SP;
//. export functionalities
CF:=0;
SubTypesBegPos:=Position;
AssignFile(FunctionalityExportInterfaceFile,FunctionalityExportInterfaceFileName); ReWrite(FunctionalityExportInterfaceFile);
try
WriteLn(FunctionalityExportInterfaceFile, '//. the export routines defines');
WriteLn(FunctionalityExportInterfaceFile, '');
AssignFile(FunctionalityExportImplementationFile,FunctionalityExportImplementationFileName); ReWrite(FunctionalityExportImplementationFile);
try
WriteLn(FunctionalityExportImplementationFile, '//. the export routines');
WriteLn(FunctionalityExportImplementationFile, '');
AssignFile(FunctionalityExportFile,FunctionalityExportFileName); ReWrite(FunctionalityExportFile);
try
WriteLn(FunctionalityExportFile, '//. export  functionality routines');
WriteLn(FunctionalityExportFile, '');
AssignFile(FunctionalityImportInterfaceFile,FunctionalityImportInterfaceFileName); ReWrite(FunctionalityImportInterfaceFile);
try
WriteLn(FunctionalityImportInterfaceFile, '//. import  functionality routines');
WriteLn(FunctionalityImportInterfaceFile, '');
WriteLn(FunctionalityImportInterfaceFile, 'const FunctionalityDLL = ''SOAPClient.exe'';');
WriteLn(FunctionalityImportInterfaceFile, '');
AssignFile(FunctionalityImportImplementationFile,FunctionalityImportImplementationFileName); ReWrite(FunctionalityImportImplementationFile);
try
WriteLn(FunctionalityImportImplementationFile, '//. import  functionality routines implementations');
WriteLn(FunctionalityImportImplementationFile, '');
LastRoutineName:='';
OverloadedCount:=0;
flTypeFunctionality:=false;
repeat
  if (NOT FindContext('Functionality')) OR (Position >= EndPos) then Break; //. >
  FunctionalityStrPos:=Position;
  if FindWordInString('class')
   then begin
    SkipBlanks;
    if NextChar <> ';'
     then begin //. functionality found
      Position:=FunctionalityStrPos;
      WriteConstsAndSubTypes(FunctionalityImportInterfaceFile,SubTypesBegPos,Position,(NOT flTypeFunctionality));
      FunctionalityName:=PriorWord;
      WriteLn(FunctionalityExportInterfaceFile, '{'+FunctionalityName+'}');
      WriteLn(FunctionalityExportImplementationFile, '{'+FunctionalityName+'}');
      WriteLn(FunctionalityExportFile, '{'+FunctionalityName+'}');
      if (ANSIUppercase(FunctionalityName) = 'TTYPEFUNCTIONALITY')
       then begin
        WriteLn(FunctionalityImportInterfaceFile, '//. '+FunctionalityName);
        WriteLn(FunctionalityImportInterfaceFile, 'Type');
        WriteLn(FunctionalityImportInterfaceFile, '');
        WriteLn(FunctionalityImportInterfaceFile, '  TComponentFunctionality = class;');
        WriteLn(FunctionalityImportInterfaceFile, '');
        WriteLn(FunctionalityImportInterfaceFile, '  '+FunctionalityName+' = class(TFunctionality)');
        WriteLn(FunctionalityImportInterfaceFile, '  public');
        flTypeFunctionality:=true;
        end
       else begin
        WriteLn(FunctionalityImportInterfaceFile, '//. '+FunctionalityName);
        if (NOT flTypeFunctionality) then WriteLn(FunctionalityImportInterfaceFile, 'Type');
        WriteLn(FunctionalityImportInterfaceFile, '  '+FunctionalityName+' = class(TFunctionality)');
        WriteLn(FunctionalityImportInterfaceFile, '  public');
        flTypeFunctionality:=false;
        end;
      WriteLn(FunctionalityImportImplementationFile, '{'+FunctionalityName+'}');
      {ReturtnToStringBegin;
      FunctionalityBlockPos:=Position;}
      repeat
        Word:=ANSIUppercase(NextWord);
        if Word = 'END' then Break; //. >
        if (Word = 'PROCEDURE') OR (Word = 'FUNCTION')
         then begin
          SkipBlanks;
          OrgRoutineName:=NextWord;
          RoutineName:=OrgRoutineName;
          if LastRoutineName = RoutineName
           then
            Inc(OverloadedCount)
           else begin
            OverloadedCount:=0;
            LastRoutineName:=RoutineName;
            end;
          if OverloadedCount > 0 then RoutineName:=RoutineName+IntToStr(OverloadedCount);
          RoutineTypeName:=ANSILowerCase(Word);
          RoutineFullName:=FunctionalityName+'__'+RoutineName;
          SkipBlanks;
          GetRoutineParams(RoutineParams);
          if (Word = 'FUNCTION')
           then GetFunctionReturn(FunctionReturn)
           else FunctionReturn:='';
          //. write export and import files
          {FunctionalityExportInterfaceFile,FunctionalityExportImplementationFile}
          R:=ANSILowerCase(RoutineTypeName)+' '+RoutineFullName;
          if RoutineParams <> ''
           then R:=R+'(_Functionality_: TFunctionality;   '+RoutineParams+')'
           else R:=R+'(_Functionality_: TFunctionality)';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+'; stdcall;';
          WriteLn(FunctionalityExportInterfaceFile, R);
          WriteLn(FunctionalityExportInterfaceFile, '');
          WriteLn(FunctionalityExportImplementationFile, R);
          WriteLn(FunctionalityExportImplementationFile, 'begin');
          R:=FunctionalityName+'(_Functionality_).'+OrgRoutineName;
          if FunctionReturn <> '' then R:='Result:='+R;
          if RoutineParams <> ''
           then ExtractParamsNames(RoutineParams,ParamsNames)
           else ParamsNames:='';
          if ParamsNames <> '' then R:=R+'('+ParamsNames+')';
          R:=R+';';
          WriteLn(FunctionalityExportImplementationFile, R);
          WriteLn(FunctionalityExportImplementationFile, 'end;');
          WriteLn(FunctionalityExportImplementationFile, '');
          {FunctionalityExportFile}
          WriteLn(FunctionalityExportFile, '  '+RoutineFullName+',');
          {FunctionalityImportInterfaceFile}
          R:='    '+RoutineTypeName+' '+RoutineName;
          if RoutineParams <> '' then R:=R+'('+RoutineParams+')';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+';';
          WriteLn(FunctionalityImportInterfaceFile, R);
          {FunctionalityImportImplementationFile}
          R:=RoutineTypeName+' '+RoutineFullName;
          if RoutineParams <> ''
           then R:=R+'(_Functionality_: TFunctionality;   '+RoutineParams+')'
           else R:=R+'(_Functionality_: TFunctionality)';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+'; stdcall; external FunctionalityDLL;';
          WriteLn(FunctionalityImportImplementationFile, R);
          R:=RoutineTypeName+' '+FunctionalityName+'.'+RoutineName;
          if RoutineParams <> '' then R:=R+'('+RoutineParams+')';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+';';
          WriteLn(FunctionalityImportImplementationFile, R);
          WriteLn(FunctionalityImportImplementationFile, 'begin');
          if FunctionReturn = ''
           then R:=''
           else R:='Result:=';
          R:=R+RoutineFullName;
          if ParamsNames <> ''
           then R:=R+'(Self,   '+ParamsNames+');'
           else R:=R+'(Self);';
          WriteLn(FunctionalityImportImplementationFile, R);
          WriteLn(FunctionalityImportImplementationFile, 'end;');
          WriteLn(FunctionalityImportImplementationFile, '');
          end
         else
          if (Word = 'PROPERTY')
           then begin
            GetNextStringTo(String(#$0D),WS); Setlength(WS,Length(WS)-1);
            WriteLn(FunctionalityImportInterfaceFile, '    property '+WS);
            end;
      until false;
      SubTypesBegPos:=Position;
      WriteLn(FunctionalityExportInterfaceFile, '');
      WriteLn(FunctionalityExportImplementationFile, '');
      WriteLn(FunctionalityExportFile, '');
      WriteLn(FunctionalityImportInterfaceFile, '  end;');
      WriteLn(FunctionalityImportInterfaceFile, '');
      WriteLn(FunctionalityImportImplementationFile, '');
      //.
      Inc(CF);
      /// ? ShowBlock(FunctionalityBlockPos);
      end;
    end;
until false;
finally
CloseFile(FunctionalityImportImplementationFile);
end;
finally
CloseFile(FunctionalityImportInterfaceFile);
end;
finally
CloseFile(FunctionalityExportFile);
end;
finally
CloseFile(FunctionalityExportImplementationFile);
end;
finally
CloseFile(FunctionalityExportInterfaceFile);
end;
finally
Destroy;
end;
//. Types Functionalies exporting
SrsStream:=TMemoryStream.Create;
with SrsStream do
try
LoadFromFile(SrsName1);
Position:=0;
//. check "TypesFunctionalities"
CheckToken('TypesFunctionalities');
//. export functionalities
CF:=0;
SubTypesBegPos:=Position;
AssignFile(TypesFunctionalityExportInterfaceFile,TypesFunctionalityExportInterfaceFileName); ReWrite(TypesFunctionalityExportInterfaceFile);
try
WriteLn(TypesFunctionalityExportInterfaceFile, '//. the export routines defines');
WriteLn(TypesFunctionalityExportInterfaceFile, '');
AssignFile(TypesFunctionalityExportImplementationFile,TypesFunctionalityExportImplementationFileName); ReWrite(TypesFunctionalityExportImplementationFile);
try
WriteLn(TypesFunctionalityExportImplementationFile, '//. the export routines');
WriteLn(TypesFunctionalityExportImplementationFile, '');
AssignFile(TypesFunctionalityExportFile,TypesFunctionalityExportFileName); ReWrite(TypesFunctionalityExportFile);
try
WriteLn(TypesFunctionalityExportFile, '//. export types functionality routines');
WriteLn(TypesFunctionalityExportFile, '');
AssignFile(TypesFunctionalityImportInterfaceFile,TypesFunctionalityImportInterfaceFileName); ReWrite(TypesFunctionalityImportInterfaceFile);
try
WriteLn(TypesFunctionalityImportInterfaceFile, '//. import types functionality routines');
WriteLn(TypesFunctionalityImportInterfaceFile, '');
WriteLn(TypesFunctionalityImportInterfaceFile, 'const TypesDLL = ''SOAPClient.exe'';');
WriteLn(TypesFunctionalityImportInterfaceFile, '');
AssignFile(TypesFunctionalityImportImplementationFile,TypesFunctionalityImportImplementationFileName); ReWrite(TypesFunctionalityImportImplementationFile);
try
WriteLn(TypesFunctionalityImportImplementationFile, '//. import types functionality routines implementations');
WriteLn(TypesFunctionalityImportImplementationFile, '');
repeat
  if NOT FindContext('Functionality') then Break; //. >
  FunctionalityStrPos:=Position;
  if FindWordInString('class')
   then begin
    SkipBlanks;
    if NextChar <> ';'
     then begin //. functionality found
      Position:=FunctionalityStrPos;
      WriteConstsAndSubTypes(TypesFunctionalityImportInterfaceFile,SubTypesBegPos,Position,true);
      FunctionalityName:=PriorWord;
      WriteLn(TypesFunctionalityExportInterfaceFile, '{'+FunctionalityName+'}');
      WriteLn(TypesFunctionalityExportImplementationFile, '{'+FunctionalityName+'}');
      WriteLn(TypesFunctionalityExportFile, '{'+FunctionalityName+'}');
      WriteLn(TypesFunctionalityImportInterfaceFile, '//. '+FunctionalityName);
      WriteLn(TypesFunctionalityImportInterfaceFile, 'Type');
      WriteLn(TypesFunctionalityImportInterfaceFile, '  '+FunctionalityName+' = class(TFunctionality)');
      WriteLn(TypesFunctionalityImportInterfaceFile, '  public');
      WriteLn(TypesFunctionalityImportImplementationFile, '{'+FunctionalityName+'}');
      {ReturtnToStringBegin;
      FunctionalityBlockPos:=Position;}
      repeat
        Word:=ANSIUppercase(NextWord);
        if Word = 'END' then Break; //. >
        if (Word = 'PROCEDURE') OR (Word = 'FUNCTION')
         then begin
          SkipBlanks;
          OrgRoutineName:=NextWord;
          RoutineName:=OrgRoutineName;
          if LastRoutineName = RoutineName
           then
            Inc(OverloadedCount)
           else begin
            OverloadedCount:=0;
            LastRoutineName:=RoutineName;
            end;
          if OverloadedCount > 0 then RoutineName:=RoutineName+IntToStr(OverloadedCount);
          RoutineTypeName:=ANSILowerCase(Word);
          RoutineFullName:=FunctionalityName+'__'+RoutineName;
          SkipBlanks;
          GetRoutineParams(RoutineParams);
          if (Word = 'FUNCTION')
           then GetFunctionReturn(FunctionReturn)
           else FunctionReturn:='';
          //. write export and import files
          {TypesFunctionalityExportInterfaceFile,TypesFunctionalityExportImplementationFile}
          R:=ANSILowerCase(RoutineTypeName)+' '+RoutineFullName;
          if RoutineParams <> ''
           then R:=R+'(Functionality: TFunctionality;   '+RoutineParams+')'
           else R:=R+'(Functionality: TFunctionality)';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+'; stdcall;';
          WriteLn(TypesFunctionalityExportInterfaceFile, R);
          WriteLn(TypesFunctionalityExportInterfaceFile, '');
          WriteLn(TypesFunctionalityExportImplementationFile, R);
          WriteLn(TypesFunctionalityExportImplementationFile, 'begin');
          R:=FunctionalityName+'(Functionality).'+OrgRoutineName;
          if FunctionReturn <> '' then R:='Result:='+R;
          if RoutineParams <> ''
           then ExtractParamsNames(RoutineParams,ParamsNames)
           else ParamsNames:='';
          if ParamsNames <> '' then R:=R+'('+ParamsNames+')';
          R:=R+';';
          WriteLn(TypesFunctionalityExportImplementationFile, R);
          WriteLn(TypesFunctionalityExportImplementationFile, 'end;');
          WriteLn(TypesFunctionalityExportImplementationFile, '');
          {TypesFunctionalityExportFile}
          WriteLn(TypesFunctionalityExportFile, '  '+RoutineFullName+',');
          {TypesFunctionalityImportInterfaceFile}
          R:='    '+RoutineTypeName+' '+RoutineName;
          if RoutineParams <> '' then R:=R+'('+RoutineParams+')';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+';';
          WriteLn(TypesFunctionalityImportInterfaceFile, R);
          {TypesFunctionalityImportImplementationFile}
          R:=RoutineTypeName+' '+RoutineFullName;
          if RoutineParams <> ''
           then R:=R+'(Functionality: TFunctionality;   '+RoutineParams+')'
           else R:=R+'(Functionality: TFunctionality)';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+'; stdcall; external TypesDLL;';
          WriteLn(TypesFunctionalityImportImplementationFile, R);
          R:=RoutineTypeName+' '+FunctionalityName+'.'+RoutineName;
          if RoutineParams <> '' then R:=R+'('+RoutineParams+')';
          if FunctionReturn <> '' then R:=R+': '+FunctionReturn;
          R:=R+';';
          WriteLn(TypesFunctionalityImportImplementationFile, R);
          WriteLn(TypesFunctionalityImportImplementationFile, 'begin');
          if FunctionReturn = ''
           then R:=''
           else R:='Result:=';
          R:=R+RoutineFullName;
          if ParamsNames <> ''
           then R:=R+'(Self,   '+ParamsNames+');'
           else R:=R+'(Self);';
          WriteLn(TypesFunctionalityImportImplementationFile, R);
          WriteLn(TypesFunctionalityImportImplementationFile, 'end;');
          WriteLn(TypesFunctionalityImportImplementationFile, '');
          end
         else
          if (Word = 'PROPERTY')
           then begin
            GetNextStringTo(String(#$0D),WS); Setlength(WS,Length(WS)-1);
            WriteLn(TypesFunctionalityImportInterfaceFile, '    property '+WS);
            end;
      until false;
      SubTypesBegPos:=Position;
      WriteLn(TypesFunctionalityExportInterfaceFile, '');
      WriteLn(TypesFunctionalityExportImplementationFile, '');
      WriteLn(TypesFunctionalityExportFile, '');
      WriteLn(TypesFunctionalityImportInterfaceFile, '  end;');
      WriteLn(TypesFunctionalityImportInterfaceFile, '');
      WriteLn(TypesFunctionalityImportImplementationFile, '');
      //.
      Inc(CF);
      /// ? ShowBlock(FunctionalityBlockPos);
      end;
    end;
until false;
finally
CloseFile(TypesFunctionalityImportImplementationFile);
end;
finally
CloseFile(TypesFunctionalityImportInterfaceFile);
end;
finally
CloseFile(TypesFunctionalityExportFile);
end;
finally
CloseFile(TypesFunctionalityExportImplementationFile);
end;
finally
CloseFile(TypesFunctionalityExportInterfaceFile);
end;
finally
Destroy;
end;
//.
end;



procedure TfmTypesFunctionalityExporter.TypesFunctionalityFilesUpdate;
begin
memoTypesFunctionalityExport.Lines.LoadFromFile(TypesFunctionalityExportFileName);
memoTypesFunctionalityExportInterface.Lines.LoadFromFile(TypesFunctionalityExportInterfaceFileName);
memoTypesFunctionalityExportImplementation.Lines.LoadFromFile(TypesFunctionalityExportImplementationFileName);
memoTypesFunctionalityImportInterface.Lines.LoadFromFile(TypesFunctionalityImportInterfaceFileName);
memoTypesFunctionalityImportImplementation.Lines.LoadFromFile(TypesFunctionalityImportImplementationFileName);
end;


procedure TfmTypesFunctionalityExporter.FormCreate(Sender: TObject);
begin
TypesFunctionalityFilesUpdate;
end;

procedure TfmTypesFunctionalityExporter.sbExportClick(Sender: TObject);
begin
DoExport;
TypesFunctionalityFilesUpdate;
end;


end.
