{HTMLFile unit
 -------------

Extended HTML parsing facility. It automatically updates lists of Paragraph, Image and Link
tags inserted or removed. These lists can also notify on a Insert or Delete event, providing
easy support for memory managment or link number offset.

And of course the THTMLFile unit is also able to load or save itself to a stream or file.

Version 0.2 (Release 07.10.97)

(C) 1997 by Arsène von Wyss}

unit HTMLFile;

interface

uses
	Classes, SysUtils, HTMLString;

type
	THTMLMarker=class
	private
		FPrev,FNext: THTMLMarker;
		FData: THTMLString;
		FPosition: Integer;
	public
		destructor Destroy; override;
		function FindTag(ATag: string): THTMLMarker;
		property Next: THTMLMarker read FNext;
		property Prev: THTMLMarker read FPrev;
		property Position: Integer read FPosition;
	end;
	THTMLMarkerHolder=class(THTMLMarker)
	private
		FOnInsert,FOnDelete: TNotifyEvent;
		FCount: Integer;
		function GetMarker(Index: Integer): THTMLMarker;
	protected
		procedure Shift(Position,Count: Integer);
		procedure Clear;
	public
		constructor Create(AData: THTMLString);
		destructor Destroy; override;
		function Insert(APosition: Integer): THTMLMarker;
		function FindNextToPos(APosition: Integer): THTMLMarker;
		function FindPrevToPos(APosition: Integer): THTMLMarker;
		property OnInsert: TNotifyEvent read FOnInsert write FOnInsert;
		property OnDelete: TNotifyEvent read FOnDelete write FOnDelete;
		property Count: Integer read FCount;
		property Marker[Index: Integer]: THTMLMarker read GetMarker;
	end;
	THTMLFile=class(THTMLString)
	private
		FParagraphs,FImages,FLinks: THTMLMarkerHolder;
		InService: Boolean;
		function GetDirectTag(Index: Integer): THTMLTag;
	protected
		function GetTitle: string;
		procedure SetTitle(Atitle: string);
		procedure LengthChange(Start,Count: Integer); override;
	public
		constructor Create;
		destructor Destroy; override;
		procedure LoadFromStream(Stream: TStream);
		procedure SaveToStream(Stream: TStream);
		procedure LoadFromFile(FName: string);
		procedure SaveToFile(FName: string);
		property Links: THTMLMarkerHolder read FLinks;
		property Images: THTMLMarkerHolder read FImages;
		property Paragraphs: THTMLMarkerHolder read FParagraphs;
		property Title: string read GetTitle write SetTitle;
		property DirectTag[Index: Integer]: THTMLTag read GetDirectTag;
	end;

const
	LinkTag='A';
	ImageTag='IMG';
	SeparateTags: array[0..17] of PChar=('P','H1','H2','H3','H4','H5','H6','ADDRESS','DL','UL','PRE','MENU','OL','DIR','TABLE','HR','BLOCKQUOTE','/BLOCKQUOTE');
	stP=0;
	stH1=1;
	stH2=2;
	stH3=3;
	stH4=4;
	stH5=5;
	stH6=6;
	stAddress=7;
	stDL=8;
	stUL=9;
	stPRE=10;
	stMenu=11;
	stOL=12;
	stDir=13;
	stTable=14;
	stHR=15;
	stBLOCKQUOTE=16;
	st_BLOCKQUOTE=17;

function FindSeparatorTag(S: string): Integer;

implementation
{<p>Standard</p>
<h1>Überschrift 1</h1>
<h2>Überschrift 2</h2>
<h3>Überschrift 3</h3>
<h4>Überschrift 4</h4>
<h5>Überschrift 5</h5>
<h6>Überschrift 6</h6>
<address>Addresse</address>
<dl><dt>Definierter Begriff</dt><dd>Definition</dd></dl>
<ul><li>Aufzählung</li><li>Nr 2</li></ul>
<pre>Formatiert</pre>
<menu><li>Menüliste</li><li>Nr 2</li></menu>
<ol><li>Numerierung</li><li>Nr 2</li></ol>
<dir><li>Verzeichnisliste</li><li>Nr 2</li></dir>}

function FindSeparatorTag(S: string): Integer;
begin
	for Result:=Low(SeparateTags) to High(SeparateTags) do
		if S=SeparateTags[Result] then
			Exit;
	Result:=-1;
end;

destructor THTMLMarker.Destroy;
begin
	if Assigned(FPrev) then
		FPrev.FNext:=FNext;
	if Assigned(FNext) then
		FNext.FPrev:=FPrev;
	inherited;
end;

function THTMLMarker.FindTag(ATag: string): THTMLMarker;
var
	Tag: THTMLTag;
begin
	Result:=self.FNext;
	ATag:=UpperCase(ATag);
	while Assigned(Result) do
		with Result do begin
			Tag:=FData.Tag[FPosition];
			if Assigned(Tag) and (Tag.Tag=ATag) then
				Break;
			Result:=Result.FNext;
		end;
end;

function THTMLMarkerHolder.GetMarker(Index: Integer): THTMLMarker;
begin
	Result:=self;
	while (Index>0) and Assigned(Result) do begin
		Dec(Index);
		Result:=Result.FNext;
	end;
end;

procedure THTMLMarkerHolder.Shift(Position,Count: Integer);
var
	Act,Buf: THTMLMarker;
begin
	if Count=0 then
		Exit;
	Act:=self;
	while Assigned(Act) and (Act.FPosition<Position) do
		Act:=Act.Next;
	if Count<0 then
		while Assigned(Act) and (Act.FPosition-Position<=-Count) do begin
			Buf:=Act;
			Act:=Act.Next;
			if Assigned(FOnDelete) then
				FOnDelete(Buf);
			Dec(FCount);
			Buf.Free;
		end;
	while Assigned(Act) and (Act.FPosition>Position) do begin
		Inc(Act.FPosition,Count);
		Act:=Act.Next;
	end;
end;

constructor THTMLMarkerHolder.Create(AData: THTMLString);
begin
	inherited Create;
	FData:=AData;
end;

function THTMLMarkerHolder.FindNextToPos(APosition: Integer): THTMLMarker;
var
	Act: THTMLMarker;
begin
	if APosition<=0 then begin
		Result:=nil;
		Exit;
	end;
	Act:=self;
	while Assigned(Act) and (Act.FPosition<APosition) do
		Act:=Act.FNext;
	Result:=Act;
end;

function THTMLMarkerHolder.FindPrevToPos(APosition: Integer): THTMLMarker;
var
	Act: THTMLMarker;
begin
	if APosition<=0 then begin
		Result:=nil;
		Exit;
	end;
	Act:=self;
	while Assigned(Act.FNext) and (Act.FNext.FPosition<APosition) do
		Act:=Act.FNext;
	Result:=Act;
end;

procedure THTMLMarkerHolder.Clear;
begin
	while Assigned(FNext) do begin
		if Assigned(FOnDelete) then
			FOnDelete(FNext);
		FNext.Free;
	end;
	FCount:=0;
end;

destructor THTMLMarkerHolder.Destroy;
begin
	Clear;
	inherited;
end;

function THTMLMarkerHolder.Insert(APosition: Integer): THTMLMarker;
var
	Act: THTMLMarker;
begin
	if APosition<=0 then begin //InsertAtTag with invlid tag
		Result:=nil;
		Exit;
	end;
	Act:=self;
	while Assigned(Act.FNext) and (Act.FNext.FPosition<APosition) do
		Act:=Act.FNext;
	Result:=THTMLMarker.Create;
	Result.FNext:=Act.FNext;
	Result.FPrev:=Act;
	Act.FNext:=Result;
	Result.FData:=FData;
	Result.FPosition:=APosition;
	Inc(FCount);
	if Assigned(Result.FNext) then
		Result.FNext.FPrev:=Result;
	if Assigned(FOnInsert) then
		FOnInsert(Result);
end;

function THTMLFile.GetDirectTag(Index: Integer): THTMLTag;
begin
	Result:=THTMLTag(FTag[Index]);
end;

constructor THTMLFile.Create;
begin
	inherited;
	FParagraphs:=THTMLMarkerHolder.Create(self);
	FImages:=THTMLMarkerHolder.Create(self);
	FLinks:=THTMLMarkerHolder.Create(self);
	InService:=True;
end;

procedure THTMLFile.LengthChange(Start,Count: Integer);
var
	I,J: Integer;
	StartParagraph: Boolean;
	Act: THTMLMarker;
	S: string;
begin
	if InService then begin
		FParagraphs.Shift(Start,Count);
		FImages.Shift(Start,Count);
		FLinks.Shift(Start,Count);
		Act:=FParagraphs;
		StartParagraph:=False;
		for I:=Start to Start+Count-1 do
			case FData[I] of
			#0:	with Tag[I] do begin
					S:=Tag;
					if (S<>'') then begin
						if S=LinkTag then
							FLinks.Insert(I)
						else if S=ImageTag then
							FImages.Insert(I)
						else
							if S[1]='/' then begin
								System.Delete(S,1,1);
								J:=FindSeparatorTag(S);
								if J>=0 then
									StartParagraph:=True;
							end else begin
								J:=FindSeparatorTag(S);
								if J>=0 then
									Act:=FParagraphs.Insert(I);
								StartParagraph:=J=stHR;
							end;
					end;
				end;
			#32..#255: if StartParagraph then begin
					Act:=FParagraphs.Insert(I);
					StartParagraph:=False;
				end;
			end;
		if Assigned(Act) then
			Act:=Act.Next;
		if Assigned(Act) then
			J:=Act.Position-1
		else
			J:=Length;
		I:=Start+Count-1;
		while StartParagraph and (I<J) do begin
			if FData[I] in [#32..#255] then begin
				FParagraphs.Insert(I);
				Break;
			end;
			Inc(I);
		end;
	end;
	inherited;
end;

destructor THTMLFile.Destroy;
begin
	InService:=False;
	FParagraphs.Free;
	FLinks.Free;
	FImages.Free;
	inherited;
end;

function THTMLFile.GetTitle: string;
var
	I,J: Integer;
begin
	I:=FindTag('TITLE');
	J:=FindTag('/TITLE');
	if (I=0) or (J=0) then
		Result:=''
	else
		Result:=Copy(I+1,J-I-1);
end;

procedure THTMLFile.SetTitle(Atitle: string);
var
	I,J: Integer;
begin
	I:=FindTag('TITLE');
	J:=FindTag('/TITLE')-I+1;
	if (I=0) then begin
		I:=FindTag('HEAD');
		if I=0 then
			Exit;
		ATitle:='<TITLE>'+ATitle;
	end;
	Inc(I);
	if (J=0) then
		ATitle:=ATitle+'</TITLE>'
	else
		Delete(I,J-I);
	Insert(ATitle,I);
end;

procedure THTMLFile.LoadFromStream(Stream: TStream);
var
	Buf: string;
	Len: Integer;
begin
Len:=Stream.Size-Stream.Position;
SetLength(Buf,Len);
Stream.Read(Buf[1],Len);
HTML:=Buf;
end;

procedure THTMLFile.SaveToStream(Stream: TStream);
var
	Buf: string;
begin
	Buf:=HTML;
	Stream.Write(Buf[1],System.Length(Buf));
end;

procedure THTMLFile.LoadFromFile(FName: string);
var
	Stream: TFileStream;
begin
	Stream:=TFileStream.Create(FName,fmOpenRead or fmShareDenyNone);
	LoadFromStream(Stream);
	Stream.Free;
end;

procedure THTMLFile.SaveToFile(FName: string);
var
	Stream: TFileStream;
begin
	Stream:=TFileStream.Create(FName,fmCreate or fmShareDenyNone);
	SaveToStream(Stream);
	Stream.Free;
end;

end.
