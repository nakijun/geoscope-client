unit unitConvertor__txt_1;
Interface
Uses
  SysUtils, Classes;

  procedure ConvertDATA__txt_1(InputStream: TStream; out OutputStream: TMemoryStream);

Implementation

procedure ConvertDATA__txt_1(InputStream: TStream; out OutputStream: TMemoryStream);
Const
  InputStreamFieldDelimiter = '#';
  OutputStreamFieldDelimiter = '|';
  LineTerminator = #$0D#$0A;

  function ReadStr(out S: string): boolean;
  var
    Ch: Char;
    SpaceCount: integer;
  begin
  Result:=false;
  SpaceCount:=0;
  S:='';
  while InputStream.Read(Ch,1) = 1 do begin
    if Ch = InputStreamFieldDelimiter
     then begin
      Result:=true;
      Exit; //. ->
      end;
    if Ch = '\' then Ch:='/' else //. avoid sql-server exception
    if Ch = '''' then Ch:='"'; //. avoid sql-server exception
    if Ch = ' ' //. avoid space-char repeating
     then Inc(SpaceCount)
     else SpaceCount:=0;
    if SpaceCount <= 1 then S:=S+Ch;
    end;
  end;

  procedure CheckEOL;
  var
    Ch: char;
  begin
  if (InputStream.Read(Ch,1) < 1) AND (Ch <> #$0D) then Raise Exception.Create('can not found 0dh char of line termination'); //. =>
  if (InputStream.Read(Ch,1) < 1) AND (Ch <> #$0A) then Raise Exception.Create('can not found 0ah char of line termination'); //. =>
  end;

  procedure OutputStream_WriteString(const Str: string);
  var
    I: integer;
  begin
  for I:=1 to Length(Str) do if OutputStream.Write(Str[I],1) < 1 then Raise Exception.Create('can not write output stream'); //. =>
  end;

var
  GoodsName: string;
  OfferGoodsAmountString: string;
  MeasureUnitName: string;
  OfferGoodsMinPriceString: string;
  OfferGoodsInfo: string;
  UnknownAmountString: string;
begin
OutputStream:=TMemoryStream.Create;
try
//. stream processing
InputStream.Position:=InputStream.Size; InputStream.Write(LineTerminator,SizeOf(LineTerminator)); //. write final line terminator
InputStream.Position:=0;
while ReadStr(GoodsName) do begin
  //. read line
  if NOT ReadStr(MeasureUnitName) then Raise Exception.Create('unexpected end of line (reading: goods measurement id)'); //. =>
  if NOT ReadStr(OfferGoodsMinPriceString) then Raise Exception.Create('unexpected end of line (reading: goods info)'); //. =>
  if NOT ReadStr(UnknownAmountString) then Raise Exception.Create('unexpected end of line (reading: goods amount)'); //. =>
  CheckEOL;
  //. assign another fields
  OfferGoodsAmountString:='1';
  OfferGoodsInfo:='';
  //. write line
  OutputStream_WriteString(GoodsName);OutputStream_WriteString(OutputStreamFieldDelimiter);
  OutputStream_WriteString(OfferGoodsAmountString);OutputStream_WriteString(OutputStreamFieldDelimiter);
  OutputStream_WriteString(MeasureUnitName);OutputStream_WriteString(OutputStreamFieldDelimiter);
  OutputStream_WriteString(OfferGoodsMinPriceString);OutputStream_WriteString(OutputStreamFieldDelimiter);
  OutputStream_WriteString(OfferGoodsInfo);OutputStream_WriteString(OutputStreamFieldDelimiter);
  OutputStream_WriteString(#$0D#$0A);
  end;
except
  OutputStream.Destroy;
  OutputStream:=nil;
  Raise; //. =>
  end;
end;

end.
