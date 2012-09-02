{QuickHTML unit
 --------------

HTML text viewer with hyperlink capability. Uses the two units HTMLFile and HTMLString for
HTML processing.

Comments:
- Many tags are not implemented or are not fully supported
- Color and background properties do nothing yet

Bugs:
- The control is often not updated after loading data.
	Workaround: Resize the component at runtime
- "Ghost" hyperlinks are sometimes visible

Version 0.2 (Release 09.10.97)

UNIT UNDER DEVELOPMENT. DO NOT DISTRIBUTE THIS SOURCE NOR COPY ANYTHING OUT OF THIS UNIT.
THE DATA STRUCTURES ARE SUBJECT TO CHANGES.

(C) 1997 by Arsène von Wyss}

unit QuickHTML;

interface

uses
	Windows, Messages, SysUtils, Classes, MyGraphics, Controls, Forms, Dialogs, Extctrls,
	HTMLString, HTMLFile;

type
	THyperlinkRec=packed record
		Size: TRect;
		Tag: THTMLTag;
	end;
	PHyperlinkArray=^THyperlinkArray;
	THyperlinkArray=array[0..High(Integer) div SizeOf(THyperlinkRec)-1] of THyperlinkRec;
	THyperlinkManager=class
	private
		Allocated,Used: Integer;
		Data: PHyperlinkArray;
		Registered: TList;
		AllowAdd: Boolean;
	public
		constructor Create;
		destructor Destroy; override;
		procedure OpenParagraph(ID: Pointer);
		procedure Open(X,Y: Integer; ATag: THTMLTag);
		procedure Close(X,Y: Integer);
		procedure ReOpen(X,Y: Integer);
		function Search(X,Y: Integer): THTMLTag;
		procedure Clear;
	end;
	TQuickHTML=class;
	THTMLParagraph=class
	protected
		Height,Width: Integer;
		Mark: THTMLMarker;
		Next: THTMLParagraph;
		procedure CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML); virtual; abstract;
		procedure Draw(Owner: TQuickHTML; Offset: TPoint); virtual; abstract;
	end;
	THyperlinkEvent=procedure(Sender: TQuickHTML; Link: string) of object;
	TQuickHTML=class(TObject)
	private
		FData: THTMLFile;
		FLines: TStrings;
		FParagraph: THTMLParagraph;
		FHyperlinkManager: THyperlinkManager;
		FBorderStyle: TBorderStyle;
		FOnResize: TNotifyEvent;
		FImageBack: TBitmap;
		FColorBack: TColor;
		FColorLink: TColor;
		FFontDefault: TFont;
		FFontFixed: TFont;
		FFontHeading1: TFont;
		FFontHeading2: TFont;
		FFontHeading3: TFont;
		FFontHeading4: TFont;
		FFontHeading5: TFont;
		FFontHeading6: TFont;
		FOldFont: TFont;
		FBlockQuote: Integer;
		FOnHyperlinkClick: THyperlinkEvent;
{		FReadonly: Boolean;}
		function CalcParagraph(var Start: THTMLMarker; var ParaWidth: Integer): THTMLParagraph;
		procedure SetLines(Value: TStrings);
		procedure SetImageBack(ImageBack: TBitmap);
		procedure SetColorBack(ColorBack: TColor);
		procedure SetColorLink(ColorLink: TColor);
		procedure SetFontDefault(FontDefault: TFont);
		procedure SetFontFixed(FontFixed: TFont);
		procedure SetFontHeading1(FontHeading1: TFont);
		procedure SetFontHeading2(FontHeading2: TFont);
		procedure SetFontHeading3(FontHeading3: TFont);
		procedure SetFontHeading4(FontHeading4: TFont);
		procedure SetFontHeading5(FontHeading5: TFont);
		procedure SetFontHeading6(FontHeading6: TFont);
	protected
		procedure ClearParagraphs;
		procedure InitParagraphs;
		procedure ProcessTagOnFont(Font: TFont; Tag: Integer; TagPtr: THTMLTag);
	public
                Width: integer;
                PaintCanvas: TObject;
                dX: Extended;
                dY: Extended;
                Scale: Extended;
                Angle: Extended;

		constructor Create;
		destructor Destroy; override;
                function Height: integer;
		procedure Paint;
	published
		property ImageBack: TBitmap read FImageBack write SetImageBack;
		property ColorBack: TColor read FColorBack write SetColorBack;
		property ColorLink: TColor read FColorLink write SetColorLink;
		property FontDefault: TFont read FFontDefault write SetFontDefault;
		property FontFixed: TFont read FFontFixed write SetFontFixed;
		property FontHeading1: TFont read FFontHeading1 write SetFontHeading1;
		property FontHeading2: TFont read FFontHeading2 write SetFontHeading2;
		property FontHeading3: TFont read FFontHeading3 write SetFontHeading3;
		property FontHeading4: TFont read FFontHeading4 write SetFontHeading4;
		property FontHeading5: TFont read FFontHeading5 write SetFontHeading5;
		property FontHeading6: TFont read FFontHeading6 write SetFontHeading6;
		property Lines: TStrings read FLines write SetLines;
		property OnHyperlinkClick: THyperlinkEvent read FOnHyperlinkClick write FOnHyperlinkClick;
{		property Readonly: Boolean read FReadonly;}
	end;


implementation


const
	BorderWidthX=8;
	BorderWidthY=4;
	BlockquoteWidth=64;
	tsNone=0;
	tsA=1;
	tsIMG=2;
	tsFONT=3;
	tsBASEFONT=4;
	tsBR=5;
	tsMAP=6;
	tsTT=7;
	tsI=8;
	tsB=9;
	tsU=10;
	tsSTRIKE=11;
	tsBIG=12;
	tsSMALL=13;
	tsSUB=14;
	tsSUP=15;
	tsEM=16;
	tsSTRONG=17;
	tsDFN=18;
	tsCODE=19;
	tsSAMP=20;
	tsKBD=21;
	tsVAR=22;
	tsCITE=23;
	tsPRE=24;
	TextTags: array[1..24] of PChar=('A','IMG','FONT','BASEFONT','BR','MAP',
			'TT','I','B','U','STRIKE','BIG','SMALL','SUB','SUP',
			'EM','STRONG','DFN','CODE','SAMP','KBD','VAR','CITE','PRE');
{HTML tags in the text
 ---------------------
A Hyperlink
IMG Image
FONT redefine font size and or color
BASEFONT set base font size
BR break line
MAP imagemap

TT teletype or monospaced text
I italic text style
B bold text style
U underlined text style
STRIKE strike-through text style
BIG places text in a large font
SMALL places text in a small font
SUB places text in subscript style
SUP places text in superscript style

EM basic emphasis typically rendered in an italic font
STRONG strong emphasis typically rendered in a bold font
DFN defining instance of the enclosed term
CODE used for extracts from program code
SAMP used for sample output from programs, and scripts etc.
KBD used for text to be typed by the user
VAR used for variables or arguments to commands
CITE used for citations or references to other sources}

type
	THTMLStrings=class(TStrings) //Attention: Not the same as THTMLString !!!
	private
		FData: THTMLString;
		FLines: THTMLMarkerHolder;
		procedure OnLengthChange(Sender: THTMLString; Start,Count: Integer);
		function Get(Index: Integer): string; override;
		procedure Put(Index: Integer; const S: string); override;
		function GetCount: Integer; override;
		function GetCapacity: Integer; override;
		function GetTextStr: string; override;
		procedure SetTextStr(const Value: string); override;
		function CalcRange(Index: Integer; IncludeBreak: Boolean; var B,E: Integer): Boolean;
		procedure ReadData(Reader: TReader);
		procedure WriteData(Writer: TWriter);
	protected
		Owner: TQuickHTML;
	public
		constructor Create(AData: THTMLString);
		destructor Destroy; override;
		procedure Clear; override;
		procedure Delete(Index: Integer); override;
		procedure Insert(Index: Integer; const S: string); override;
		procedure DefineProperties(Filer: TFiler); override;
	end;
	PLineInfoRec=^TLineInfoRec;
	TLineInfoRec=packed record
		Height,Width,TextY,DataTag: Integer;
		Data: string;
	end;
	PLineInfoRecArray=^TLineInfoRecArray;
	TLineInfoRecArray=array[0..High(Integer) div SizeOf(TLineInfoRec)-1] of TLineInfoRec;
	TLineInfo=class
	private
		Allocated,Used: Integer;
		Data: PLineInfoRecArray;
	public
		function Insert: PLineInfoRec;
		procedure Clear;
		destructor Destroy; override;
	end;
	PImgInfoRec=^TImgInfoRec;
	TImgInfoRec=packed record
		Height,Width,Start: Integer;
	end;
	PImgInfoRecArray=^TImgInfoRecArray;
	TImgInfoRecArray=array[0..High(Integer) div SizeOf(TImgInfoRec)-1] of TImgInfoRec;
	TImgInfo=class
	private
		Allocated,Used: Integer;
		Data: PImgInfoRecArray;
	Public
		function Insert: PLineInfoRec;
		procedure Clear;
		destructor Destroy; override;
	end;
	THTMLTextParagraph=class(THTMLParagraph)
	private
		Text: TLineInfo;
		Img: TImgInfo;
		ParaType: Integer;
	public
		procedure CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML); override;
		procedure Draw(Owner: TQuickHTML; Offset: TPoint); override;
		constructor Create;
		destructor Destroy; override;
	end;
	THTMLTableParagraph=class(THTMLParagraph)
	public
		constructor Create;
		procedure CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML); override;
		procedure Draw(Owner: TQuickHTML; Offset: TPoint); override;
		destructor Destroy; override;
	end;
	THTMLLineParagraph=class(THTMLParagraph)
	private
		Size: Integer;
	public
		procedure CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML); override;
		procedure Draw(Owner: TQuickHTML; Offset: TPoint); override;
	end;
	THTMLBlockquoteParagraph=class(THTMLParagraph)
	private
		Add: Integer;
	public
		constructor Create(AAdd: Integer);
		procedure CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML); override;
		procedure Draw(Owner: TQuickHTML; Offset: TPoint); override;
	end;

procedure THTMLStrings.OnLengthChange(Sender: THTMLString; Start,Count: Integer);
var
	I: Integer;
	S: string;
begin
	if Count>0 then begin
		S:=FData.Data;
		for I:=Start to Start+Count-1 do
			if S[I]=#13 then
				FLines.Insert(I);
	end;
	if Assigned(Owner) then
		Owner.InitParagraphs;
end;

function THTMLStrings.Get(Index: Integer): string;
var
	B,E: Integer;
begin
	if CalcRange(Index,False,B,E) then
		Result:=FData.Copy(B,E-B+1)
	else
		Result:='';
end;

procedure THTMLStrings.Put(Index: Integer; const S: string);
var
	B,E: Integer;
begin
	if CalcRange(Index,True,B,E) then begin
		FData.Delete(B,E-B+1);
		FData.Insert(S,B);
	end;
end;

function THTMLStrings.GetCount: Integer;
begin
	Result:=FLines.Count;
end;

function THTMLStrings.GetCapacity: Integer;
begin
	Result:=FData.Length;
end;

function THTMLStrings.GetTextStr: string;
begin
	Result:=FData.HTML;
end;

procedure THTMLStrings.SetTextStr(const Value: string);
begin
	FData.HTML:=Value;
end;

function THTMLStrings.CalcRange(Index: Integer; IncludeBreak: Boolean; var B,E: Integer): Boolean;
var
	Act: THTMLMarker;
	S: string;
begin
	S:=FData.Data;
	Result:=(Index>=0) and (Index<Count) and (S<>'');
	if Result then begin
		Act:=FLines.Marker[Index];
		B:=Act.Position+1;
		if S[B]=#10 then
			Inc(B);
		E:=Act.Next.Position;
		if IncludeBreak then begin
			if (Length(S)>E) and (S[E+1]=#10) then
				Inc(E);
		end else
			Dec(E);
	end;
end;

constructor THTMLStrings.Create(AData: THTMLString);
begin
	inherited Create;
	FData:=AData;
	FData.OnLengthChange:=OnLengthChange;
	FLines:=THTMLMarkerHolder.Create(FData);
	OnLengthChange(FData,1,FData.Length);
end;

destructor THTMLStrings.Destroy;
begin
	FLines.Free;
	inherited;
end;

procedure THTMLStrings.Clear;
begin
	FData.Clear;
end;

procedure THTMLStrings.Delete(Index: Integer);
var
	B,E: Integer;
begin
	if CalcRange(Index,True,B,E) then
		FData.Delete(B,E-B+1);
end;

procedure THTMLStrings.Insert(Index: Integer; const S: string);
var
	Act: THTMLMarker;
	T: string;
	B: Integer;
begin
	T:=FData.Data;
	if T='' then
		B:=1
	else begin
		Act:=FLines.Marker[Index];
		if Assigned(Act) then begin
			B:=Act.Position+1;
			if (Length(T)>=B) and (T[B]=#10) then
				Inc(B);
		end else
			B:=FData.Length+1;
	end;
	FData.Insert(S+#13#10,B);
end;

procedure THTMLStrings.ReadData(Reader: TReader);
begin
	Reader.ReadListBegin;
	Clear;
	Text:=Reader.ReadString;
	Reader.ReadListEnd;
end;

procedure THTMLStrings.WriteData(Writer: TWriter);
begin
	Writer.WriteListBegin;
	Writer.WriteString(Text);
	Writer.WriteListEnd;
end;

procedure THTMLStrings.DefineProperties(Filer: TFiler);
begin
	Filer.DefineProperty('Strings',ReadData,WriteData,True);
end;

constructor THyperlinkManager.Create;
begin
	inherited Create;
	Registered:=TList.Create;
end;

procedure THyperlinkManager.OpenParagraph(ID: Pointer);
begin
	AllowAdd:=Registered.IndexOf(ID)<0;
	if AllowAdd then
		Registered.Add(ID);
end;

procedure THyperlinkManager.Open(X,Y: Integer; ATag: THTMLTag);
begin
	if not AllowAdd then
		Exit;
	if Used=Allocated then begin
		Inc(Allocated,10);
		ReallocMem(Data,Allocated*SizeOf(THyperlinkRec));
		FillChar(Data[Used],(Allocated-Used)*SizeOf(THyperlinkRec),0);
	end;
	with Data[Used] do begin
		Size.Left:=X;
		Size.Top:=Y;
		Tag:=ATag;
	end;
	Inc(Used);
end;

procedure THyperlinkManager.Close(X,Y: Integer);
begin
	if not AllowAdd then
		Exit;
	with Data[Used-1] do begin
		Size.Right:=X;
		Size.Bottom:=Y;
	end;
end;

procedure THyperlinkManager.ReOpen(X,Y: Integer);
begin
	if not AllowAdd then
		Exit;
	Open(X,Y,Data[Used-1].Tag);
end;

function THyperlinkManager.Search(X,Y: Integer): THTMLTag;
var
	I: Integer;
begin
	for I:=0 to Used-1 do
		with Data[I],Size do
			if (X>=Left) and (X<=Right) and (Y>=Top) and (Y<=Bottom) then begin
				Result:=Tag;
				Exit;
			end;
	Result:=nil;
end;

procedure THyperlinkManager.Clear;
begin
	ReallocMem(Data,0);
	Allocated:=0;
	Used:=0;
	Registered.Clear;
end;

destructor THyperlinkManager.Destroy;
begin
	Clear;
	Registered.Free;
	inherited;
end;

function FindTextTag(S: string): Integer;
var
	Negative: Boolean;
	I: Integer;
begin
	Negative:=(S<>'') and (S[1]='/');
	if Negative then
		Delete(S,1,1);
	if S='' then begin
		Result:=0;
		Exit;
	end;
	for I:=Low(TextTags) to High(TextTags) do
		if S=TextTags[I] then begin
			Result:=I*(1-Ord(Negative)*2);
			Exit;
		end;
	Result:=0;
end;

function SwapColor(Col: Integer): Integer; register; assembler;
asm
	xchg al,ah
	ror eax,8
	xchg al,ah
	rol eax,8
	xchg al,ah
end;

function GetColorNumber(S: string): Integer;
begin
	if S='black' then
		Result:=0
	else if S='maroon' then
		Result:=128
	else if S='green' then
		Result:=32768
	else if S='olive' then
		Result:=32896
	else if S='navy' then
		Result:=8388608
	else if S='purple' then
		Result:=8388736
	else if S='teal' then
		Result:=8421376
	else if S='gray' then
		Result:=8421504
	else if S='silver' then
		Result:=12632256
	else if S='red' then
		Result:=255
	else if S='lime' then
		Result:=65280
	else if S='yellow' then
		Result:=65535
	else if S='blue' then
		Result:=16711680
	else if S='fuchsia' then
		Result:=16711935
	else if S='aqua' then
		Result:=16776960
	else if S='white' then
		Result:=16777215
	else if (Length(S)<>7) or (S[1]<>'#') then begin
		Result:=clBtnFace;
		Exit;
	end else
		try
			S[1]:='$';
			Result:=SwapColor(StrToInt(S));
		except
			Result:=clBtnFace;
		end;
end;

function TLineInfo.Insert: PLineInfoRec;
begin
	if Used=Allocated then begin
		Inc(Allocated,10);
		ReallocMem(Data,Allocated*SizeOf(TLineInfoRec));
		FillChar(Data[Used],(Allocated-Used)*SizeOf(TLineInfoRec),0);
	end;
	Result:=@Data[Used];
	Inc(Used);
end;

procedure TLineInfo.Clear;
var
	I: Integer;
begin
	for I:=0 to Used-1 do
		Data[I].Data:=''; //Clear string memory!!!
	ReallocMem(Data,0);
	Allocated:=0;
	Used:=0;
end;

destructor TLineInfo.Destroy;
begin
	Clear;
	inherited;
end;

function TImgInfo.Insert: PLineInfoRec;
begin
	if Used=Allocated then begin
		Inc(Allocated,10);
		ReallocMem(Data,Allocated*SizeOf(TImgInfoRec));
		FillChar(Data[Used],(Allocated-Used)*SizeOf(TImgInfoRec),0);
	end;
	Result:=@Data[Used];
	Inc(Used);
end;

procedure TImgInfo.Clear;
begin
	ReallocMem(Data,0);
	Allocated:=0;
	Used:=0;
end;

destructor TImgInfo.Destroy;
begin
	Clear;
	inherited;
end;

constructor THTMLTextParagraph.Create;
begin
	inherited Create;
	Text:=TLineInfo.Create;
	Img:=TImgInfo.Create;
end;

procedure THTMLTextParagraph.CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML);
var
	TagStart,I,J,B,E: Integer;
	S,W,Current: string;
	AllowBreak,WasSpace: Boolean;
	Canvas: TCanvas;
	Line: PLineInfoRec;

	procedure FlushLine;
	begin
		Line.Data:=Current;
                if Line.TextY > Line.Height then Line.Height:=Line.TextY;
		Inc(Height,Line.Height);
	end;
	procedure NextLine;
	begin
		if Line<>nil then
			FlushLine;
		Line:=Text.Insert;
		Line.TextY:=Canvas.TextHeight(' ');
		Line.DataTag:=TagStart;
		Current:='';
		WasSpace:=True;
	end;
	procedure Flush;
	begin
		J:=Canvas.TextWidth(W);
		if Line.Width+J>=Width then
			if AllowBreak then begin
				NextLine;
				Line.Width:=J;
				Current:=W;
			end else begin
				Inc(Line.Width,J);
                                if Line.Width > Width then Width:=Line.Width;
				Current:=Current+W;
			end
		else begin
			Current:=Current+W;
			Inc(Line.Width,J);
		end;
		W:='';
	end;
begin
        Canvas:=TCanvas(Owner.PaintCanvas);
	with Owner,self do begin
		S:=FData.Data;
		B:=AMark.Position;
		AMark:=AMark.Next;
		if Assigned(AMark) then
			E:=AMark.Position-1
		else begin
			E:=FData.FindTag('/BODY');
			if E=0 then
				E:=Length(S);
		end;
		AllowBreak:=True;
		case ParaType of
		stH1: Canvas.Font:=FontHeading1;
		stH2: Canvas.Font:=FontHeading2;
		stH3: Canvas.Font:=FontHeading3;
		stH4: Canvas.Font:=FontHeading4;
		stH5: Canvas.Font:=FontHeading5;
		stH6: Canvas.Font:=FontHeading6;
		stPre: begin
				Canvas.Font:=FontFixed;
				AllowBreak:=False;
			end;
		else begin
				Canvas.Font:=FontDefault;
				if ParaType=stAddress then
					Canvas.Font.Style:=Canvas.Font.Style+[fsItalic];
			end;
		end;
		FOldFont.Assign(Canvas.Font);
		W:='';
		Text.Clear;
		Img.Clear;
		Line:=nil;
		TagStart:=CountZeroChar(S[1],B-1);
		NextLine;
		Line.TextY:=10;
		NextLine;
		WasSpace:=True;
		for I:=B to E do begin
			case S[I] of
			#0: begin //Tag
					Flush;
					J:=FindTextTag(FData.DirectTag[TagStart].Tag);
					WasSpace:=False;
					Inc(TagStart);
					case J of
					tsBR: NextLine;
					-tsPRE: Break;
					else begin
							Current:=Current+#0;
							if J<>0 then
								ProcessTagOnFont(Canvas.Font,J,FData.DirectTag[TagStart]);
                                                        if Canvas.TextHeight(' ') > Line.TextY then Line.TextY:=Canvas.TextHeight(' ');
						end;
					end;
				end;
			#10: if not AllowBreak then begin
						Flush;
						NextLine;
					end else if not WasSpace then begin
						WasSpace:=True;
						W:=W+' ';
					end;
			#32: if (not WasSpace) or (not AllowBreak) then begin
					W:=W+' ';
					Flush;
					WasSpace:=True;
				end;
			#33..#255: begin
					W:=W+S[I];
					WasSpace:=False;
				end;
			end;
		end;
		Flush;
		FlushLine;
	end;
end;

procedure THTMLTextParagraph.Draw(Owner: TQuickHTML; Offset: TPoint);
var
	TagStart,I,J,Line,X,Y,TY,StartFlush,FH: Integer;
	FData: THTMLFile;
	S: string;
	Canvas: TCanvas;
	HyperlinkOpen: Boolean;
        
	procedure Flush;
	var
		Txt: string;
	begin
		while (S[StartFlush]=#0) and (StartFlush<=I) do
			Inc(StartFlush);
		if StartFlush>I then
			Exit;
		Txt:=System.Copy(S,StartFlush,I-StartFlush);
		if Txt<>'' then begin
                        if X+Canvas.TextWidth(Txt) <= Width
                         then begin //. 
                          Canvas.TextOut(X,TY-FH,Txt);
                          Inc(X,Canvas.TextWidth(Txt));
                          end;
		end;
		StartFlush:=I+1;
	end;
begin
	Canvas:=TCanvas(Owner.PaintCanvas);
	FData:=Owner.FData;
	SetBkMode(Canvas.Handle,TRANSPARENT);
	with Owner do
		case ParaType of
		stH1: Canvas.Font:=FontHeading1;
		stH2: Canvas.Font:=FontHeading2;
		stH3: Canvas.Font:=FontHeading3;
		stH4: Canvas.Font:=FontHeading4;
		stH5: Canvas.Font:=FontHeading5;
		stH6: Canvas.Font:=FontHeading6;
		stPre:Canvas.Font:=FontFixed;
		else begin
				Canvas.Font:=FontDefault;
				if ParaType=stAddress then
					Canvas.Font.Style:=Canvas.Font.Style+[fsItalic];
			end;
		end;
	Owner.FOldFont.Assign(Canvas.Font);
	Y:=Offset.Y;
	FH:=Canvas.TextHeight(' ');
	HyperlinkOpen:=False;
	Owner.FHyperlinkManager.OpenParagraph(self);
	for Line:=0 to Text.Used-1 do
		with Text.Data[Line] do begin
			X:=Offset.X;
			if HyperlinkOpen then
				Owner.FHyperlinkManager.ReOpen(X,Y);
			TY:=Y+TextY;
			S:=Data;
			StartFlush:=1;
			TagStart:=DataTag;
			if S<>'' then begin
				for I:=1 to Length(S) do
					if S[I]=#0 then begin
						J:=FindTextTag(FData.DirectTag[TagStart].Tag);
						if I=StartFlush then //Repeated #0 => ignore
							Inc(StartFlush)
						else
							Flush;
						if J<>0 then begin
							Owner.ProcessTagOnFont(Canvas.Font,J,FData.DirectTag[TagStart]);
							FH:=Canvas.TextHeight(' ');
							case J of
							tsA: begin
									if HyperlinkOpen then
										Owner.FHyperlinkManager.Close(X-1,TY);
									Owner.FHyperlinkManager.Open(X,Y,FData.DirectTag[TagStart]);
									HyperlinkOpen:=True;
								end;
							-tsA: if HyperlinkOpen then begin
									Owner.FHyperlinkManager.Close(X-1,TY);
									HyperlinkOpen:=False;
								end;
							end;
						end;
						Inc(TagStart);
					end;
				I:=Length(Data)+1;
				Flush;
				if HyperlinkOpen then
					Owner.FHyperlinkManager.Close(X-1,TY);
			end;
			Inc(Y,Height);
		end;
end;

destructor THTMLTextParagraph.Destroy;
begin
	Text.Free;
	Img.Free;
	inherited;
end;

constructor THTMLTableParagraph.Create;
begin
	inherited Create;
end;

procedure THTMLTableParagraph.CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML);
begin
	Height:=32;
	Mark:=AMark;
	AMark:=Owner.FData.Paragraphs.FindNextToPos(Owner.FData.FindTagEx('/TABLE',Mark.Position,0));
end;

procedure THTMLTableParagraph.Draw(Owner: TQuickHTML; Offset: TPoint);
const
	Text='TABLES NOT SUPPORTED YET';
var
	Frame: TRect;
begin
	{/// - Frame:=Rect(Offset.X,Offset.Y,Offset.X+Width-1,Offset.Y+Height-1);
	Frame3D(Owner.PaintCanvas,Frame,clWhite,clGray,1);
	Owner.PaintCanvas.TextOut(Offset.X+Width  div 2-Owner.PaintCanvas.TextWidth(Text)  div 2-1,
																Offset.Y+Height div 2-Owner.PaintCanvas.TextHeight(Text) div 2-1,Text);}
end;

destructor THTMLTableParagraph.Destroy;
begin
	inherited;
end;

procedure THTMLLineParagraph.CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML);
begin
	try
		Size:=StrToInt(Owner.FData.Tag[AMark.Position].Value['SIZE']);
	except
		Size:=2;
	end;
	Height:=12+Size;
	AMark:=AMark.Next;
end;

procedure THTMLLineParagraph.Draw(Owner: TQuickHTML; Offset: TPoint);
var
	R: TRect;
begin
	R:=Rect(Offset.X,Offset.Y+6,Offset.X+Width-1,Offset.Y+6+Size);
	/// ? Frame3D(Owner.PaintCanvas,R,clGray,clWhite,1);
end;

constructor THTMLBlockquoteParagraph.Create(AAdd: Integer);
begin
	inherited Create;
	Add:=AAdd;
end;

procedure THTMLBlockquoteParagraph.CalcDimensions(var AMark: THTMLMarker; Owner: TQuickHTML);
begin
        if Owner.FBlockquote+Add > 0 then Owner.FBlockquote:=Owner.FBlockquote+Add else Owner.FBlockquote:=0;
	AMark:=AMark.Next;
end;

procedure THTMLBlockquoteParagraph.Draw(Owner: TQuickHTML; Offset: TPoint);
begin
        if Owner.FBlockquote+Add > 0 then Owner.FBlockquote:=Owner.FBlockquote+Add else Owner.FBlockquote:=0;
end;

//TQuickHTML
constructor TQuickHTML.Create;

	function CreateFont(var Font: TFont): TFont;
	begin
		Font:=TFont.Create;
		Result:=Font;
	end;
begin
	inherited;
	Width:=800;
	FBorderStyle:=bsSingle;
	FData:=THTMLFile.Create;
	FLines:=THTMLStrings.Create(FData);
	THTMLStrings(FLines).Owner:=self;
	FHyperlinkManager:=THyperlinkManager.Create;
	FImageBack:=TBitmap.Create;
	with CreateFont(FFontDefault) do begin
		Name:='Times New Roman';
		Size:=12;
		Style:=[];
	end;
	with CreateFont(FFontFixed) do begin
		Name:='Courier New';
		Size:=11;
		Style:=[];
	end;
	with CreateFont(FFontHeading1) do begin
		Name:='Times New Roman';
		Size:=24;
		Style:=[fsBold];
	end;
	with CreateFont(FFontHeading2) do begin
		Name:='Times New Roman';
		Size:=20;
		Style:=[fsBold];
	end;
	with CreateFont(FFontHeading3) do begin
		Name:='Times New Roman';
		Size:=16;
		Style:=[fsBold];
	end;
	with CreateFont(FFontHeading4) do begin
		Name:='Times New Roman';
		Size:=12;
		Style:=[fsBold];
	end;
	with CreateFont(FFontHeading5) do begin
		Name:='Times New Roman';
		Size:=10;
		Style:=[fsBold];
	end;
	with CreateFont(FFontHeading6) do begin
		Name:='Times New Roman';
		Size:=8;
		Style:=[fsBold];
	end;
	FColorBack:=clGray;
	FColorLink:=clBlue;
	CreateFont(FOldFont);
end;

procedure TQuickHTML.ClearParagraphs;
var
	Act,Buf: THTMLParagraph;
begin
	Act:=FParagraph;
	while Act<>nil do begin
		Buf:=Act;
		Act:=Act.Next;
		Buf.Free;
	end;
	FParagraph:=nil;
end;

function TQuickHTML.CalcParagraph(var Start: THTMLMarker; var ParaWidth: Integer): THTMLParagraph;
var
	I: Integer;
begin
	if FData.Data[Start.Position]=#0 then
		I:=FindSeparatorTag(FData.Tag[Start.Position].Tag)
	else
		I:=stP; //No tag => paragraph start
	case I of
	stBLOCKQUOTE:  Result:=THTMLBlockquoteParagraph.Create(1);
	st_BLOCKQUOTE: Result:=THTMLBlockquoteParagraph.Create(-1);
	stTABLE:       Result:=THTMLTableParagraph.Create;
	stHR:          Result:=THTMLLineParagraph.Create;
	else begin     Result:=THTMLTextParagraph.Create;
			THTMLTextParagraph(Result).ParaType:=I;
		end;
	end;
	Result.Width:=ParaWidth;
	Result.CalcDimensions(Start,self);
	ParaWidth:=Result.Width;
end;

procedure TQuickHTML.InitParagraphs;
var
	Mark: THTMLMarker;
	Act,Created: THTMLParagraph;
	ParaHeight,ParaWidth,NormWidth,MaxWidth: Integer;
begin
	ClearParagraphs;
	ParaHeight:=0;
	FBlockQuote:=0;
	Mark:=FData.Paragraphs.Next;
	Act:=nil;
	MaxWidth:=0;
	NormWidth:=Width-2*BorderWidthX;
	while Assigned(Mark) do begin
		ParaWidth:=NormWidth-FBlockquote*BlockquoteWidth;
		Created:=CalcParagraph(Mark,ParaWidth);
		if ParaWidth>MaxWidth then
			MaxWidth:=ParaWidth;
		Inc(ParaHeight,Created.Height);
		if not Assigned(Act) then begin
			FParagraph:=Created;
			Act:=FParagraph;
		end else begin
			Act.Next:=Created;
			Act:=Act.Next;
		end;
	end;
	FHyperlinkManager.Clear;
end;

procedure TQuickHTML.Paint;
var
	Act: THTMLParagraph;
	Offset: TPoint;
	Clip: TRect;
        XF: XFORM;
begin
	if not Assigned(FParagraph) then
		InitParagraphs;

        try
        with TCanvas(PaintCanvas) do begin
        SetGraphicsMode(Handle,GM_ADVANCED);
        ModifyWorldTransForm(Handle,XF,MWT_IDENTITY);
        XF.eDx:=dX;
        XF.eDy:=dY;
        XF.eM11:=Cos(Angle);
        XF.eM12:=Sin(Angle);
        XF.eM21:=-Sin(Angle);
        XF.eM22:=Cos(Angle);
        SetWorldTransForm(Handle,XF);
        XF.eDx:=0;
        XF.eDy:=0;
        XF.eM11:=Scale;
        XF.eM12:=0;
        XF.eM21:=0;
        XF.eM22:=Scale;
        ModifyWorldTransForm(Handle,XF,MWT_LEFTMULTIPLY);
        end;

	Clip:=TCanvas(PaintCanvas).ClipRect;

	Act:=FParagraph;
	Offset.Y:=0;
	FBlockquote:=0;
	while Assigned(Act) do begin
		if (Act is THTMLBlockquoteParagraph) or (Offset.Y>=Clip.Top-Act.Height) then begin
			Offset.X:=FBlockquote*BlockquoteWidth;

			Act.Draw(self,Offset);
		end;
		Inc(Offset.Y,Act.Height);
		if Offset.Y>=Clip.Bottom then
			Exit;
		Act:=Act.Next;
	end;

        finally
        ModifyWorldTransForm(TCanvas(PaintCanvas).Handle,XF,MWT_IDENTITY);
        end;
end;

function TQuickHTML.Height: integer;
var
  Act: THTMLParagraph;
begin
Result:=0;
Act:=FParagraph;
FBlockquote:=0;
while Assigned(Act) do begin
  Inc(Result,Act.Height);
  Act:=Act.Next;
  end;
end;

procedure TQuickHTML.ProcessTagOnFont(Font: TFont; Tag: Integer; TagPtr: THTMLTag);
const
	Sizes: array[1..7] of Integer=(6,8,10,12,14,18,22);
var
	S: string;
	I: Integer;
begin
	case Abs(Tag) of
	tsA: if Tag>0 then begin
			Font.Color:=ColorLink;
			Font.Style:=Font.Style+[fsUnderline];
		end else begin
			Font.Color:=FOldFont.Color;
			if not (fsUnderline in FOldFont.Style) then
				Font.Style:=Font.Style-[fsUnderline];
		end;
	tsFONT: if Tag>0 then begin
			S:=TagPtr['COLOR'];
			if S<>'' then
				Font.Color:=GetColorNumber(S);
			S:=TagPtr['SIZE'];
			if S<>'' then begin
				I:=StrToInt(S);
				if S[1] in ['-','+'] then
					Inc(I,4);
				if I in [1..7] then
					Font.Size:=Sizes[I];
			end;
		end else
			Font.Assign(FOldFont);
	tsBASEFONT: begin
		end;
	tsTT,tsKBD,tsCODE,tsSAMP,tsVAR: if Tag>0 then
			Font.Name:=FFontFixed.Name
		else
			Font.Name:=FOldFont.Name;
	tsI,tsEM,tsDFN,tsCITE: if Tag>0 then
			Font.Style:=Font.Style+[fsItalic]
		else if not (fsItalic in FOldFont.Style) then
			Font.Style:=Font.Style-[fsItalic];
	tsB,tsSTRONG: if Tag>0 then
			Font.Style:=Font.Style+[fsBold]
		else if not (fsBold in FOldFont.Style) then
			Font.Style:=Font.Style-[fsBold];
	tsU: if Tag>0 then
			Font.Style:=Font.Style+[fsUnderline]
		else if not (fsUnderline in FOldFont.Style) then
			Font.Style:=Font.Style-[fsUnderline];
	tsSTRIKE: if Tag>0 then
			Font.Style:=Font.Style+[fsStrikeout]
		else if not (fsStrikeout in FOldFont.Style) then
			Font.Style:=Font.Style-[fsStrikeout];
	tsBIG: if Tag>0 then
			Font.Size:=Font.Size*3 div 2
		else
			Font.Size:=FOldFont.Size;
	tsSMALL: if Tag>0 then
			Font.Size:=Font.Size*2 div 3
		else
			Font.Size:=FOldFont.Size;
	tsSUB: begin
		end;
	tsSUP: begin
		end;
	end;
end;

procedure TQuickHTML.SetLines(Value: TStrings);
begin
	FData.HTML:=Value.Text; //Assign doesn't work right because it copies line by line (=> Tag errors)
	InitParagraphs;
end;

procedure TQuickHTML.SetImageBack(ImageBack: TBitmap);
begin
	FImageBack.Assign(ImageBack);
end;

procedure TQuickHTML.SetColorBack(ColorBack: TColor);
begin
	FColorBack:=ColorBack;
end;

procedure TQuickHTML.SetColorLink(ColorLink: TColor);
begin
	FColorLink:=ColorLink;
end;

procedure TQuickHTML.SetFontDefault(FontDefault: TFont);
begin
	FFontDefault.Assign(FontDefault);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontFixed(FontFixed: TFont);
begin
	FFontFixed.Assign(FontFixed);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading1(FontHeading1: TFont);
begin
	FFontHeading1.Assign(FontHeading1);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading2(FontHeading2: TFont);
begin
	FFontHeading2.Assign(FontHeading2);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading3(FontHeading3: TFont);
begin
	FFontHeading3.Assign(FontHeading3);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading4(FontHeading4: TFont);
begin
	FFontHeading4.Assign(FontHeading4);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading5(FontHeading5: TFont);
begin
	FFontHeading5.Assign(FontHeading5);
	InitParagraphs;
end;

procedure TQuickHTML.SetFontHeading6(FontHeading6: TFont);
begin
	FFontHeading6.Assign(FontHeading6);
	InitParagraphs;
end;

destructor TQuickHTML.Destroy;
begin
	FData.Free;
	FLines.Free;
	FHyperlinkManager.Free;
	FFontDefault.Free;
	FFontFixed.Free;
	FFontHeading1.Free;
	FFontHeading2.Free;
	FFontHeading3.Free;
	FFontHeading4.Free;
	FFontHeading5.Free;
	FFontHeading6.Free;
	FOldFont.Free;
	FImageBack.Free;
	ClearParagraphs;
	inherited;
end;

end.
