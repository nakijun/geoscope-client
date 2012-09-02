unit unitZeroInit;

interface
uses
  SysUtils;

implementation

Initialization
SetCurrentDir(ExtractFilePath(GetModuleName(HInstance)));
DecimalSeparator:='.';
Randomize();


finalization

end.
