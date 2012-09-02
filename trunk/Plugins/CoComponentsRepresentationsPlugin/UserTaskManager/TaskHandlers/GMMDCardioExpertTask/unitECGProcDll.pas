unit unitECGProcDll;

interface

  function Open(MeasurementFolder: PChar; Parent: integer): integer; stdcall;
  function Close(Index: integer): PChar; stdcall;

implementation
const
  DllName = 'ECGProc.dll';

function Open(MeasurementFolder: PChar; Parent: integer): integer; stdcall; external DllName; //. ���������� ������ ��������� ���� (����� ����� ������� ���� � ������ Close())
function Close(Index: integer): PChar; stdcall; external DllName;  


end.
