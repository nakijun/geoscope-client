unit unitFormatConvertors;
Interface
Uses
  Classes;

  procedure UnZipFileIntoStream(const pFileName: string; out UnZippedStream: TMemoryStream);

  //. offer data conversing routine
  procedure ConvertDATA(InputStream: TStream; const DATAFormat: string;  out OutputStream: TMemoryStream);

Implementation
Uses
  VCLUnZip, unitConvertor__txt_1;


procedure UnZipFileIntoStream(const pFileName: string; out UnZippedStream: TMemoryStream);
begin
UnZippedStream:=TMemoryStream.Create;
try
with TVCLUnzip.Create(nil) do
try
ZipName:=pFileName;
DoAll:=true;
UnzipToStream(UnZippedStream,'');
finally
Destroy;
end;
except
  UnZippedStream.Destroy;
  UnZippedStream:=nil;
  Raise; //. =>
  end;
end;

procedure ConvertDATA(InputStream: TStream; const DATAFormat: string;  out OutputStream: TMemoryStream);
begin
OutputStream:=TMemoryStream.Create;
try
//. txt.1 format
if DATAFormat = 'txt.1' then ConvertDATA__txt_1(InputStream, OutputStream) else ;
//.
except
  OutputStream.Destroy;
  OutputStream:=nil;
  Raise; //. =>
  end;
end;


end.
