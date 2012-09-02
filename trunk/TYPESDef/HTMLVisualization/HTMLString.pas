{HTMLString unit
 ---------------

Unit to parse HTML strings. Strings are easier to handle for further operation because
they will only have a #0 character indicating a HTML tag, and the tag data will be
stored in a separated object. The Tag data is also parsed into a Tag name, Keys and
their Values. In addition to the Tag separation, the special characters in the HTML
code are converted to normal characters (e.g. "&copy;" or "#169" becomes "©").

Version 0.2 (Release 02.10.97)

(C) 1997 by Arsène von Wyss}

unit HTMLString;

interface

uses
	SysUtils,Classes;

type
	{HTML String error class}
	EHTMLStrings=class(Exception);
	{HTML Tag}
	THTMLTag=class
	private
		FTag: string;
		FKey: TStringList;
		FValue: TStringList;
		function GetValue(Key: string): string;
		procedure SetValue(Key: string; AValue: string);
		function GetIndexValue(Index: Integer): string;
		procedure SetIndexValue(Index: Integer; AValue: string);
		function GetIndexKey(Index: Integer): string;
		procedure SetIndexKey(Index: Integer; AKey: string);
		function GetCount: Integer;
		function GetHTML: string;
		procedure SetHTML(AHTML: string);
	protected
		constructor CreateCopy(Source: THTMLTag);
	public
		constructor Create;
		constructor CreateFromHTML(AHTML: string);
		destructor Destroy; override;
		procedure Assign(ATag: THTMLTag);
		procedure Clear;
		procedure Add(AKey,AValue: string);
		procedure Delete(AKey: string);
		property Value[Key: string]: string read GetValue write SetValue; default;
		property IndexValue[Index: Integer]: string read GetIndexValue write SetIndexValue;
		property IndexKey[Index: Integer]: string read GetIndexKey write SetIndexKey;
		property Count: Integer read GetCount;
		property HTML: string read GetHTML write SetHTML;
		property Tag: string read FTag write FTag;
	end;
	{HTML String forward definition}
	THTMLString=class;
	{HTML String length change notification}
	THTMLStringLengthChange=procedure(Sender: THTMLString; Start,Count: Integer) of object;
	{HTML String}
	THTMLString=class
	private
		FOnLengthChange: THTMLStringLengthChange;
		function GetLength: Integer;
		function GetTag(Index: Integer): THTMLTag;
		procedure SetTag(Index: Integer; ATag: THTMLTag);
	protected
		FTag: TList;
		FData: string;
		function GetHTML: string; virtual;
		procedure SetHTML(AHTML: string); virtual;
		procedure DirectMoveTo(SrcStart,Length: Integer; Dst: THTMLString; DstStart: Integer);
		procedure DirectCopyTo(SrcStart,Length: Integer; Dst: THTMLString; DstStart: Integer);
		procedure LengthChange(Start,Count: Integer); virtual;
	public
		constructor Create;
		destructor Destroy; override;
		procedure Clear;
		function Copy(Start,Length: Integer): string;
		procedure Delete(Start,Length: Integer);
		function Insert(AData: string; Start: Integer): Integer;
		constructor CreateMove(Source: THTMLString; Start,Length: Integer);
		constructor CreateCopy(Source: THTMLString; Start,Length: Integer);
		procedure DirectMove(Src: THTMLString; SrcStart,Length,DstStart: Integer);
		procedure DirectCopy(Src: THTMLString; SrcStart,Length,DstStart: Integer);
		function FindTag(ATag: string): Integer;
		function FindTagEx(ATag: string; Start,Range: Integer): Integer;
		function FindTagBackwards(ATag: string): Integer;
		property Length: Integer read GetLength;
		property Data: string read FData;
		property Tag[Index: Integer]: THTMLTag read GetTag write SetTag;
		property OnLengthChange: THTMLStringLengthChange read FOnLengthChange write FOnLengthChange;
	published
		property HTML: string read GetHTML write SetHTML;
	end;

function CountZeroChar(const Data; Cnt: Integer): Integer;
function CharToHTML(Ch: Char): string;
function HTMLToChar(HTML: string): Char;

implementation

{*********************************************************************************}
{* Char to HTML / HTML to Char conversion routines                               *}
{*********************************************************************************}

type
	//Type definition for special char list
	TCharDesc=packed record
		Draw: Char;
		Number: Byte;
		Reserved: Word;
		Desc: PChar;
	end;

const
	//Characters allowed for conversion
	UsedChars: set of Char=[#9,#10,#13,#32..#126,#160..#255];
	//Table of special characters
	SpecialCharTable: array[0..39] of TCharDesc=(
		(Draw: '"'; Number: 034; Desc: 'quot'),
		(Draw: '&'; Number: 038; Desc: '&'),
		(Draw: '<'; Number: 060; Desc: 'lt'),
		(Draw: '>'; Number: 062; Desc: 'gt'),
		(Draw: ' '; Number: 160; Desc: 'nbsp'),
		(Draw: '¡'; Number: 161; Desc: 'iexcl'),
		(Draw: '¢'; Number: 162; Desc: 'cent'),
		(Draw: '£'; Number: 163; Desc: 'pound'),
		(Draw: '¤'; Number: 164; Desc: 'curren'),
		(Draw: '¥'; Number: 165; Desc: 'yen'),
		(Draw: '¦'; Number: 166; Desc: 'brvbar'),
		(Draw: '§'; Number: 167; Desc: 'sect'),
		(Draw: '¨'; Number: 168; Desc: 'um'),
		(Draw: '©'; Number: 169; Desc: 'copy'),
		(Draw: 'ª'; Number: 170; Desc: 'ordf'),
		(Draw: '«'; Number: 171; Desc: 'laquo'),
		(Draw: '¬'; Number: 172; Desc: 'not'),
		(Draw: '­'; Number: 173; Desc: 'shy'),
		(Draw: '®'; Number: 174; Desc: 'reg'),
		(Draw: '¯'; Number: 175; Desc: 'macr'),
		(Draw: '°'; Number: 176; Desc: 'deg'),
		(Draw: '±'; Number: 177; Desc: 'plusmn'),
		(Draw: '²'; Number: 178; Desc: 'sup2'),
		(Draw: '³'; Number: 179; Desc: 'sup3'),
		(Draw: '´'; Number: 180; Desc: 'acute'),
		(Draw: 'µ'; Number: 181; Desc: 'micro'),
		(Draw: '¶'; Number: 182; Desc: 'para'),
		(Draw: '·'; Number: 183; Desc: 'middot'),
		(Draw: '¸'; Number: 184; Desc: 'cedil'),
		(Draw: '¹'; Number: 185; Desc: 'sup1'),
		(Draw: 'º'; Number: 186; Desc: 'ordm'),
		(Draw: '»'; Number: 187; Desc: 'raquo'),
		(Draw: '¼'; Number: 188; Desc: 'frac14'),
		(Draw: '½'; Number: 189; Desc: 'frac12'),
		(Draw: '¾'; Number: 190; Desc: 'frac34'),
		(Draw: '¿'; Number: 191; Desc: 'iquest'),
		(Draw: '&'; Number: 038; Desc: 'amp'), //Double definitions start here
		(Draw: '¦'; Number: 166; Desc: 'brkbar'),
		(Draw: '¨'; Number: 168; Desc: 'die'),
		(Draw: '¯'; Number: 175; Desc: 'hibar'));

var
	//Set of special characters for quicker checking
	SpecialChars: set of Char;

//Initialize the SpecialChars set
procedure InitChars;
var
	I: Integer;
begin
	for I:=Low(SpecialCharTable) to High(SpecialCharTable) do
		Include(SpecialChars,SpecialCharTable[I].Draw);
end;

//Convert Char to HTML
function CharToHTML(Ch: Char): string;
var
	I: Integer;
begin
	if not (Ch in UsedChars) then
		raise EConvertError.Create('Char is not valid for HTML usage');
	if Ch in SpecialChars then begin
		for I:=Low(SpecialCharTable) to High(SpecialCharTable) do
			with SpecialCharTable[I] do
				if Ch=Draw then begin
					Result:='&'+Desc+';';
					Exit;
				end
	end else
		Result:=Ch;
end;

//Convert HTML to Char
function HTMLToChar(HTML: string): Char;
var
	I,J: Integer;
begin
	if (Length(HTML)=1) then begin
		Result:=HTML[1];
		Exit;
	end else if (Length(HTML)>1) and (HTML[1]='&') then begin
		Delete(HTML,1,1);
		if HTML[1]='#' then begin
			Delete(HTML,1,1);
			J:=StrToInt(HTML);
			for I:=Low(SpecialCharTable) to High(SpecialCharTable) do
				with SpecialCharTable[I] do
					if Number=J then begin
						Result:=Draw;
						Exit;
					end;
			Result:=Char(J);
			Exit;
		end else
			for I:=Low(SpecialCharTable) to High(SpecialCharTable) do
				with SpecialCharTable[I] do
					if Desc=HTML then begin
						Result:=Draw;
						Exit;
					end;
		Result:=#32;
		Exit;
	end;
	raise EConvertError.Create('HTML char description is not valid');
end;

{*********************************************************************************}
{* HTML Tag class methods                                                        *}
{*********************************************************************************}

//Value property get handler
function THTMLTag.GetValue(Key: string): string;
begin
	Result:=GetIndexValue(FKey.IndexOf(UpperCase(Key)));
end;

//Value property set handler
procedure THTMLTag.SetValue(Key: string; AValue: string);
var
	I: Integer;
begin
	Key:=UpperCase(Key);
	I:=FKey.IndexOf(Key);
	if I<0 then begin
		FKey.Add(Key);
		FValue.Add(AValue);
	end else
		SetIndexValue(I,AValue);
end;

//IndexValue property get handler
function THTMLTag.GetIndexValue(Index: Integer): string;
begin
	if Index>=0 then
		Result:=FValue[Index]
	else
		Result:='';
end;

//IndexValue property set handler
procedure THTMLTag.SetIndexValue(Index: Integer; AValue: string);
begin
	FValue[Index]:=AValue;
end;

//IndexKey property get handler
function THTMLTag.GetIndexKey(Index: Integer): string;
begin
	Result:=FKey[Index];
end;

//IndexKey property set handler
procedure THTMLTag.SetIndexKey(Index: Integer; AKey: string);
begin
	AKey:=UpperCase(Trim(AKey));
	if Pos(' ',AKey)>0 then
		raise EHTMLStrings.Create('Tag name/key cannot contain spaces');
	FKey[Index]:=AKey;
end;

//Count property get handler
function THTMLTag.GetCount: Integer;
begin
	Result:=FKey.Count;
end;

//Create new instance and copy content from Source
constructor THTMLTag.CreateCopy(Source: THTMLTag);
begin
	Create;
	Assign(Source);
end;

//Create new instance and set data using HTML code given
constructor THTMLTag.CreateFromHTML(AHTML: string);
begin
	Create;
	HTML:=AHTML;
end;

//Create new empty instance
constructor THTMLTag.Create;
begin
	inherited Create;
	FKey:=TStringList.Create;
	FValue:=TStringList.Create;
end;

//Destroy instance
destructor THTMLTag.Destroy;
begin
	FValue.Free;
	FKey.Free;
	inherited;
end;

//Make the instance be a copy of ATag
procedure THTMLTag.Assign(ATag: THTMLTag);
begin
	FTag:=ATag.FTag;
	FValue.Text:=ATag.FValue.Text;
	FKey.Text:=ATag.FKey.Text;
end;

//Clear all data
procedure THTMLTag.Clear;
begin
	FValue.Clear;
	FKey.Clear;
end;

//Add new Key=Value statment
procedure THTMLTag.Add(AKey,AValue: string);
begin
	self[AKey]:=AValue;
end;

//Delete key
procedure THTMLTag.Delete(AKey: string);
var
	I: Integer;
begin
	I:=FKey.IndexOf(UpperCase(AKey));
	FKey.Delete(I);
	FValue.Delete(I);
end;

//Convert data to HTML
function THTMLTag.GetHTML: string;
var
	I: Integer;
	S: string;
begin
	Result:='<'+FTag;
	for I:=0 to Count-1 do begin
		Result:=Result+' '+IndexKey[I];
		S:=IndexValue[I];
		if S<>'' then
			Result:=Result+'="'+S+'"';
	end;
	Result:=Result+'>';
end;

//Convert HTML to data
procedure THTMLTag.SetHTML(AHTML: string);
	procedure Error;
	begin
		raise EHTMLStrings.Create('Invalid HTML tag string');
	end;
	procedure Cut(Cnt: Integer); //Cut CNT chars and trim left
	begin
		if Cnt<1 then
			Exit;
		while (Cnt<Length(AHTML)) and (AHTML[Cnt+1]=' ') do
			Inc(Cnt);
		System.Delete(AHTML,1,Cnt);
	end;
var
	I: Integer;
begin
	Clear;
	AHTML:=Trim(AHTML);
	if (Length(AHTML)<3) or (AHTML[1]<>'<') then
		Error;
	Cut(1);
	I:=Pos(' ',AHTML);
	if (I=0) or (AHTML[1]='!') then
		I:=Length(AHTML);
	Dec(I);
	FTag:=UpperCase(Copy(AHTML,1,I));
	if FTag='' then
		Error;
	Cut(I);
	while Length(AHTML)>1 do begin
		I:=Pos('=',AHTML);
		if I=0 then begin
			I:=Pos(' ',AHTML);
			if I=0 then
				I:=Length(AHTML);
			Value[Copy(AHTML,1,I-1)]:='';
			Cut(I);
		end else begin
			Value[Copy(AHTML,1,I-1)]:='';
			Cut(I);
			if AHTML[1]='"' then begin
				Cut(1);
				I:=Pos('"',AHTML);
				if I=0 then
					I:=Length(AHTML);
			end else begin
				I:=Pos(' ',AHTML);
				if I=0 then
					I:=Length(AHTML);
			end;
			IndexValue[Count-1]:=Trim(Copy(AHTML,1,I-1));
			Cut(I);
		end;
	end;
{	if AHTML<>'>' then //Can be used to check Tag correctness
		Error;}
end;

{*********************************************************************************}
{* HTML String class methods                                                     *}
{*********************************************************************************}

//Count all the 0 characters in a string/memory range
function CountZeroChar(const Data; Cnt: Integer): Integer;
var
	I: Integer;
	C: array[0..0] of Char absolute Data;
begin
	Result:=0;
	for I:=0 to Cnt-1 do begin
		if C[I]=#0 then
			Inc(Result);
	end;
end;

//Raise exception: Index out of range
procedure IndexErr;
begin
	raise EHTMLStrings.Create('Index out of range');
end;

//Raise exception: Tag Index invalid
procedure TagIndexErr;
begin
	raise EHTMLStrings.Create('Index does not point to a Tag');
end;

//Convert all #0..#31 characters to ' ' (space)
function NoLineChangeString(S: string): string;
var
	I: Integer;
begin
	Result:=S;
	for I:=1 to Length(Result) do
		if Result[I] in [#0..#31] then
			Result[I]:=' ';
end;

//Length property get method
function THTMLString.GetLength: Integer;
begin
	Result:=System.Length(FData);
end;

//HTML property get method
function THTMLString.GetHTML: string;
begin
	Result:=Copy(1,Length);
end;

//HTML property set method
procedure THTMLString.SetHTML(AHTML: string);
begin
	Clear;
	Insert(AHTML,1);
end;

//Tag[Index] property get method
function THTMLString.GetTag(Index: Integer): THTMLTag;
begin
	if (Index<=0) or (Index>Length) then
		IndexErr;
	if FData[Index]<>#0 then
		Result:=nil
	else
		Result:=THTMLTag(FTag[CountZeroChar(FData[1],Index-1)]);
end;

//Tag[Index] property set method
procedure THTMLString.SetTag(Index: Integer; ATag: THTMLTag);
begin
	if (Index<=0) or (Index>Length) then
		IndexErr;
	if FData[Index]<>#0 then
		TagIndexErr;
	THTMLTag(FTag[CountZeroChar(FData[1],Index-1)]).Assign(ATag);
end;

//Create new instance and move selected data from Source
constructor THTMLString.CreateMove(Source: THTMLString; Start,Length: Integer);
begin
	Create;
	Source.DirectMoveTo(Start,Length,self,1);
end;

//Create new instance and copy selected data from Source
constructor THTMLString.CreateCopy(Source: THTMLString; Start,Length: Integer);
begin
	Create;
	Source.DirectCopyTo(Start,Length,self,1);
end;

//Move selected data from Source without HTML conversion
procedure THTMLString.DirectMove(Src: THTMLString; SrcStart,Length,DstStart: Integer);
begin
	Src.DirectMoveTo(SrcStart,Length,self,DstStart);
end;

//Copy selected data from Source without HTML conversion
procedure THTMLString.DirectCopy(Src: THTMLString; SrcStart,Length,DstStart: Integer);
begin
	Src.DirectCopyTo(SrcStart,Length,self,DstStart);
end;

//Move selected data to Destination without HTML conversion
procedure THTMLString.DirectMoveTo(SrcStart,Length: Integer; Dst: THTMLString; DstStart: Integer);
var
	TagSrcStart,TagDstStart,I: Integer;
begin
	Dec(Length);
	if (Length<0) or (SrcStart<1) or (SrcStart>System.Length(FData)) or (DstStart<1) then
		Exit;
	if DstStart>System.Length(Dst.FData) then
		DstStart:=System.Length(Dst.FData);
	if SrcStart+Length>System.Length(FData) then
		Length:=System.Length(FData)-SrcStart;
	TagSrcStart:=CountZeroChar(FData[1],SrcStart-1);
	TagDstStart:=CountZeroChar(Dst.FData[1],DstStart-1);
	for I:=SrcStart to SrcStart+Length do
		if FData[I]=#0 then begin
			Dst.FTag.Insert(TagDstStart,FTag[TagSrcStart]);
			FTag.Delete(TagSrcStart);
			Inc(TagDstStart);
		end;
	Inc(Length);
	System.Insert(System.Copy(FData,SrcStart,Length),Dst.FData,DstStart);
	Dst.LengthChange(DstStart,Length);
	System.Delete(FData,SrcStart,Length);
	LengthChange(SrcStart,-Length);
end;

//Copy selected data to Destination without HTML conversion
procedure THTMLString.DirectCopyTo(SrcStart,Length: Integer; Dst: THTMLString; DstStart: Integer);
var
	TagSrcStart,TagDstStart,I: Integer;
begin
	Dec(Length);
	if (Length<0) or (SrcStart<1) or (SrcStart>System.Length(FData)) or (DstStart<1) then
		Exit;
	if DstStart>System.Length(Dst.FData) then
		DstStart:=System.Length(Dst.FData);
	if SrcStart+Length>System.Length(FData) then
		Length:=System.Length(FData)-SrcStart;
	TagSrcStart:=CountZeroChar(FData[1],SrcStart-1);
	TagDstStart:=CountZeroChar(Dst.FData[1],DstStart-1);
	for I:=SrcStart to SrcStart+Length do
		if FData[I]=#0 then begin
			Dst.FTag.Insert(TagDstStart,THTMLTag.CreateCopy(THTMLTag(FTag[TagSrcStart])));
			Inc(TagSrcStart);
			Inc(TagDstStart);
		end;
	Inc(Length);
	System.Insert(System.Copy(FData,SrcStart,Length),Dst.FData,DstStart);
	Dst.LengthChange(DstStart,Length);
end;

//OnLengthChange notify method
procedure THTMLString.LengthChange(Start,Count: Integer);
begin
	if Assigned(FOnLengthChange) then
		FOnLengthChange(self,Start,Count);
end;

//Creane new instance
constructor THTMLString.Create;
begin
	inherited Create;
	FTag:=TList.Create;
end;

//Destroy instance
destructor THTMLString.Destroy;
begin
	Clear;
	FTag.Free;
	inherited;
end;

//Clear all Data (and Tags)
procedure THTMLString.Clear;
var
	I,Len: Integer;
begin
	Len:=System.Length(FData);
	FData:='';
	for I:=0 to FTag.Count-1 do
		THTMLTag(FTag[I]).Free;
	FTag.Clear;
	if Len<>0 then
		LengthChange(1,-Len);
end;

//Copy selection to string as HTML
function THTMLString.Copy(Start,Length: Integer): string;
var
	TagStart,I: Integer;
begin
	Result:='';
	Dec(Length);
	if (Length<0) or (Start<1) or (Start>System.Length(FData)) then
		Exit;
	if Start+Length>System.Length(FData) then
		Length:=System.Length(FData)-Start;
	TagStart:=CountZeroChar(FData[1],Start-1);
	for I:=Start to Start+Length do
		if FData[I]=#0 then begin
			Result:=Result+THTMLTag(FTag[TagStart]).HTML;
			Inc(TagStart);
		end else
			Result:=Result+CharToHTML(FData[I]);
end;

//Delete selection
procedure THTMLString.Delete(Start,Length: Integer);
var
	TagStart,I: Integer;
begin
	Dec(Length);
	if (Length<0) or (Start<1) or (Start>System.Length(FData)) then
		Exit;
	if Start+Length>System.Length(FData) then
		Length:=System.Length(FData)-Start;
	TagStart:=CountZeroChar(FData[1],Start-1);
	for I:=Start to Start+Length do
		if FData[I]=#0 then begin
			THTMLTag(FTag[TagStart]).Free;
			FTag[TagStart]:=nil;
			Inc(TagStart);
		end;
	FTag.Pack; //Faster that deleting every single one
	Inc(Length);
	System.Delete(FData,Start,Length);
	LengthChange(Start,-Length);
end;

//Insert HTML string
function THTMLString.Insert(AData: string; Start: Integer): Integer;
var
	TagStart,I,J,Len: Integer;
	Temp: string;
	BufTag: THTMLTag;
begin
	if (Start<1) or (Start>System.Length(FData)+1) then begin
		Result:=0;
		Exit;
	end;
	TagStart:=CountZeroChar(FData[1],Start-1);
	Temp:='';
	I:=1;
	Len:=System.Length(AData);
	while I<=Len do begin
		case AData[I] of
		'<': begin
				J:=I+1;
				while (J<=Len) and (AData[J]<>'>') do
					Inc(J);
				if (AData[J]='>') and (J>I+1) then begin
					Temp:=Temp+#0;
					BufTag:=THTMLTag.Create;
					try
						BufTag.HTML:=NoLineChangeString(System.Copy(AData,I,J-I+1));
						FTag.Insert(TagStart,BufTag);
						Inc(TagStart);
					except
						BufTag.Free;
						raise;
					end;
					I:=J;
				end else
					Temp:=Temp+'<';
			end;
		'&': begin
				J:=I+1;
				while (J<=Len) and (AData[J] in ['a'..'z','A'..'Z']) do
					Inc(J);
				Temp:=Temp+HTMLToChar(System.Copy(AData,I,J-I));
				I:=J;
			end;
		else
			Temp:=Temp+HTMLToChar(AData[I]);
		end;
		Inc(I);
	end;
	System.Insert(Temp,FData,Start);
	Result:=System.Length(Temp);
	LengthChange(Start,Result);
end;

//Search Tag symbol from start
function THTMLString.FindTag(ATag: string): Integer;
var
	I,TagNr: Integer;
begin
	ATag:=UpperCase(ATag);
	TagNr:=0;
	for I:=1 to System.Length(FData) do
		if FData[I]=#0 then begin
			if THTMLTag(FTag[TagNr]).Tag=ATag then begin
				Result:=I;
				Exit;
			end;
			Inc(TagNr);
		end;
	Result:=0;
end;

//Search Tag symbol from end
function THTMLString.FindTagBackwards(ATag: string): Integer;
var
	I,TagNr: Integer;
begin
	ATag:=UpperCase(ATag);
	TagNr:=FTag.Count;
	for I:=System.Length(FData) downto 1 do
		if FData[I]=#0 then begin
			Dec(TagNr);
			if THTMLTag(FTag[TagNr]).Tag=ATag then begin
				Result:=I;
				Exit;
			end;
		end;
	Result:=0;
end;

function THTMLString.FindTagEx(ATag: string; Start,Range: Integer): Integer;
var
	Dir,TagStart: Integer;
	Tag: THTMLTag;
begin
	ATag:=UpperCase(ATag);
	if (Start=0) or (Range<0) then begin
		Result:=0;
		Exit;
	end;
	if Range=0 then
		Range:=Length;
	if Start<0 then begin
		Start:=-Start;
		Dir:=-1;
                if Start-Range > 0 then	Range:=Start-Range else Range:=0;
	end else begin
		Dir:=1;
                if Start+Range < Length+1 then	Range:=Start+Range else Range:=Length+1;
	end;
	TagStart:=CountZeroChar(FData[1],Start-1);
	while Start<>Range do begin
		if FData[Start]=#0 then begin
			Tag:=THTMLTag(FTag[TagStart]);
			if Tag.Tag=ATag then begin
				Result:=Start;
				Exit;
			end;
			Inc(TagStart,Dir);
		end;
		Inc(Start,Dir);
	end;
	Result:=0;
end;

initialization
	InitChars;

end.

(*
{*******************************}
{* OLD FUNCTIONS               *}
{*******************************}

{HTML Section-Holder provides a wrapper for the HTML strings which allows the string to
be virtually split up into multiple HTML String like HTML Sections. The original string
is not splitted, while the section only shows and modifies a selected part of the HTML
string. Overlapping sections are also allowed.}


	{HTML Section-Holder forward definition}
	THTMLSectionHolder=class;
	{HTML Section}
	THTMLSection=class
	private
		FOffset,FLength: Integer;
		FOnSectionEmpty: TNotifyEvent;
		function GetData: string;
		function GetHTML: string;
		procedure SetHTML(AHTML: string);
		function GetTag(Index: Integer): THTMLTag;
		procedure SetTag(Index: Integer; ATag: THTMLTag);
	protected
		Holder: THTMLSectionHolder;
		function Rel(I: Integer): Integer;
	public
		constructor Create(AHolder: THTMLSectionHolder; Start,Length: Integer);
		destructor Destroy; override;
		procedure SetRange(Start,Length: Integer);
		procedure Clear;
		function Copy(Start,Length: Integer): string;
		procedure Delete(Start,Length: Integer);
		procedure Insert(AData: string; Start: Integer);
{		function FindTag(ATag: string): Integer;}
		property Length: Integer read FLength;
		property HTML: string read GetHTML write SetHTML;
		property Data: string read GetData;
		property Offset: Integer read FOffset;
		property Tag[Index: Integer]: THTMLTag read GetTag write SetTag;
		property OnSectionEmpty: TNotifyEvent read FOnSectionEmpty write FOnSectionEmpty;
	end;
	{HTML Section-Holder}
	THTMLSectionHolder=class(THTMLString)
	private
		FSections: TList;
	protected
		constructor Create;
		destructor Destroy; override;
		procedure RegisterSection(ASection: THTMLSection);
		procedure UnregisterSection(ASection: THTMLSection);
		procedure LengthChange(Start,Count: Integer); override;
	public
	end;

{*********************}


{*********************************************************************************}
{* HTML String Section class methods                                             *}
{*********************************************************************************}

//Data property get method
function THTMLSection.GetData: string;
begin
	Result:=System.Copy(Holder.FData,FOffset,FLength);
end;

//HTML property get method
function THTMLSection.GetHTML: string;
begin
	Result:=Holder.Copy(FOffset,FLength);
end;

//HTML property set method
procedure THTMLSection.SetHTML(AHTML: string);
begin
	Holder.Delete(FOffset,FLength);
	FLength:=Holder.Insert(HTML,FOffset);
end;

//Tag[Index] property get method
function THTMLSection.GetTag(Index: Integer): THTMLTag;
begin
	Result:=Holder.GetTag(FOffset+Index-1);
end;

//Tag[Index] property set method
procedure THTMLSection.SetTag(Index: Integer; ATag: THTMLTag);
begin
	Holder.SetTag(FOffset+Index-1,ATag);
end;

//Create new instance and register for automatic update
constructor THTMLSection.Create(AHolder: THTMLSectionHolder; Start,Length: Integer);
begin
	inherited Create;
	AHolder.RegisterSection(self);
	SetRange(Start,Length);
end;

destructor THTMLSection.Destroy;
begin
	Holder.UnregisterSection(self);
	inherited;
end;

procedure THTMLSection.SetRange(Start,Length: Integer);
begin
	FOffset:=Minimum(System.Length(Holder.FData),Start);
	FLength:=Minimum(System.Length(Holder.FData)-FOffset,Length);
	if (FLength=0) and Assigned(FOnSectionEmpty) then
		FOnSectionEmpty(self);
end;

//Clear section content
procedure THTMLSection.Clear;
begin
	Holder.Delete(FOffset,FLength);
end;

//Copy section selection to string as HTML
function THTMLSection.Copy(Start,Length: Integer): string;
begin
	Result:=Copy(FOffset+Start-1,Minimum(Length,FLength));
end;

//Delete section selection
procedure THTMLSection.Delete(Start,Length: Integer);
begin
	Delete(FOffset+Start-1,Minimum(Length,FLength));
end;

//Insert HTML string into selection
procedure THTMLSection.Insert(AData: string; Start: Integer);
begin
	Insert(AData,FOffset+Minimum(Start,FLength)-1);
end;

//Calculate relative index
function THTMLSection.Rel(I: Integer): Integer;
begin
	if I<1 then
		IndexErr;
	Result:=FOffset+Minimum(I,FLength)-1;
end;

//Find Tag in election
{function THTMLSection.FindTag(ATag: string): Integer;
begin
end;}

{*********************************************************************************}
{* HTML String Section-Holder class methods                                      *}
{*********************************************************************************}

constructor THTMLSectionHolder.Create;
begin
	inherited Create;
	FSections:=TList.Create;
end;

destructor THTMLSectionHolder.Destroy;
var
	I: Integer;
begin
	with FSections do
		for I:=0 to Count-1 do
			UnregisterSection(THTMLSection(Items[I]));
	FSections.Free;
	inherited;
end;

procedure THTMLSectionHolder.RegisterSection(ASection: THTMLSection);
begin
	FSections.Add(ASection);
	with ASection do begin
		Holder:=self;
		FOffset:=0;
		FLength:=System.Length(FData);
	end;
end;

procedure THTMLSectionHolder.UnregisterSection(ASection: THTMLSection);
begin
	FSections.Remove(ASection);
	with ASection do begin
		Holder:=nil;
		FOffset:=0;
		FLength:=0;
	end;
end;

procedure THTMLSectionHolder.LengthChange(Start,Count: Integer);
var
	I: Integer;
begin
	with FSections do
		for I:=0 to Count-1 do
			with THTMLSection(Items[I]) do
				if FOffset>Start then
					if Start-FOffset<Count then begin //Cutted start away
						Inc(FLength,Start-FOffset); //Decrease (!) length
						FOffset:=Start;
					end else
						Inc(FOffset,Count)
				else if FOffset+FLength>Start then begin
					Inc(FLength,Count);
					if FLength<=0 then begin
						FLength:=0;
						if Assigned(FOnSectionEmpty) then
							FOnSectionEmpty(THTMLSection(Items[I]));
					end;
				end;
	inherited;
end;*)

