unit unitPolishMapFormatDefines;
Interface
Uses
  SysUtils,
  Classes,
  StrUtils;

type
  TPMFObjectKind = (
    pmfokUnknown = 0,
    pmfokPolyline = 1,
    pmfokPolygon = 2,
    pmfokPOI = 3
  );

  TPFMObjectTypeDescriptor = record
    TypeID: integer;
    TypeName: string;
  end;

const
  PMFObjectKindStrings: array[TPMFObjectKind] of string = (
    'Unknown',
    'POLYLINE',
    'POLYGON',
    'POI (Point Of Interest)'
  );

const
  PMFHeaderDescriptor = '[IMG ID]';
  PMFHeaderEndDescriptor = '[END-IMG ID]';
  //.
  PMFPointDescriptor = '[POI]';
  PMFPointDescriptor1 = '[RGN10]';
  PMFPointEndDescriptor = '[END';
  PMFPointSection = 'POI';
  //.
  PMFPolylineDescriptor = '[POLYLINE]';
  PMFPolylineDescriptor1 = '[RGN40]';
  PMFPolylineEndDescriptor = '[END';
  PMFPolylineSection = 'POLYLINE';
  //.
  PMFPolygonDescriptor = '[POLYGON]';
  PMFPolygonDescriptor1 = '[RGN80]';
  PMFPolygonEndDescriptor = '[END';
  PMFPolygonSection = 'POLYGON';

const
  POLYLINE_TYPES: array[0..39] of TPFMObjectTypeDescriptor = (
    (TypeID: $0;  TypeName: '������'),
    (TypeID: $01; TypeName: '��������������'),
    (TypeID: $02; TypeName: '����� ��������'),
    (TypeID: $03; TypeName: '������ ���������� ������'),
    (TypeID: $04; TypeName: '��������� ����������'),
    (TypeID: $05; TypeName: '����� �������'),
    (TypeID: $06; TypeName: '����� �����'),
    (TypeID: $07; TypeName: '��������, ����������������� ������'),
    (TypeID: $08; TypeName: '��������� ����� � �����������'),
    (TypeID: $09; TypeName: '��������� ����� � ����������� ����������'),
    (TypeID: $0a; TypeName: '����������� ������'),
    (TypeID: $0b; TypeName: '�������� �����'),
    (TypeID: $0c; TypeName: '�������� ��������'),
    (TypeID: $14; TypeName: '�������� ������'),
    (TypeID: $15; TypeName: '��������� �����'),
    (TypeID: $16; TypeName: '�����, �����'),
    (TypeID: $18; TypeName: '�����'),
    (TypeID: $19; TypeName: '������� �������� �����'),
    (TypeID: $1a; TypeName: '�����'),
    (TypeID: $1b; TypeName: '�����'),
    (TypeID: $1c; TypeName: '������� �������'),
    (TypeID: $1d; TypeName: '������� ������, ������'),
    (TypeID: $1e; TypeName: '������������� �������'),
    (TypeID: $1f; TypeName: '����'),
    (TypeID: $20; TypeName: '����������� ���������������'),
    (TypeID: $21; TypeName: '����������� ��������'),
    (TypeID: $22; TypeName: '����������� ����������'),
    (TypeID: $23; TypeName: '������� ���������������'),
    (TypeID: $24; TypeName: '������� ��������'),
    (TypeID: $25; TypeName: '������� ����������'),
    (TypeID: $26; TypeName: '������������ ����, �����'),
    (TypeID: $27; TypeName: '�������-���������� ������'),
    (TypeID: $28; TypeName: '�����������'),
    (TypeID: $29; TypeName: '����� ���������������'),
    (TypeID: $2a; TypeName: '������� �������'),
    (TypeID: $2b; TypeName: '������� ���������'),
    (TypeID: $41; TypeName: '������������� �������'),
    (TypeID: $42; TypeName: '��������� ������'),
    (TypeID: $44; TypeName: '������� ����'),
    (TypeID: $45; TypeName: '������� ���. ������')
  );

  function POLYLINE_TYPES_GetNameByID(const TypeID: integer): string;

const
  POLYGON_TYPES: array[0..59] of TPFMObjectTypeDescriptor = (
    (TypeID: $01; TypeName: '��������� ��������� (>200�.�.) (������� ���������)'),
    (TypeID: $02; TypeName: '��������� ��������� (<200�.�.) (������� ���������)'),
    (TypeID: $03; TypeName: '��������� ��������� ���� (������� ���������)'),
    (TypeID: $4a; TypeName: '������� ����������� ����� (������� ���������)'),
    (TypeID: $4b; TypeName: '��� ����� (������� ���������)'),
    (TypeID: $04; TypeName: '������� ����'),
    (TypeID: $05; TypeName: '�����������'),
    (TypeID: $06; TypeName: '������'),
    (TypeID: $07; TypeName: '��������'),
    (TypeID: $08; TypeName: '����� ��� ��������'),
    (TypeID: $09; TypeName: '��������'),
    (TypeID: $0a; TypeName: '���������� ������������ ��� ��������'),
    (TypeID: $0b; TypeName: '��������'),
    (TypeID: $0c; TypeName: '������������ ����'),
    (TypeID: $0d; TypeName: '����������, ����������'),
    (TypeID: $0e; TypeName: '�������-���������� ������'),
    (TypeID: $13; TypeName: '������, ������������� ����������'),
    (TypeID: $53; TypeName: '������'),
    (TypeID: $52; TypeName: '������'),
    (TypeID: $4c; TypeName: '������������ ���� ��� �����'),
    (TypeID: $14; TypeName: '������������ ����'),
    (TypeID: $15; TypeName: '������������ ����'),
    (TypeID: $16; TypeName: '������������ ����'),
    (TypeID: $17; TypeName: '��������� ����'),
    (TypeID: $18; TypeName: '���� ��� ������'),
    (TypeID: $19; TypeName: '���������� ��������'),
    (TypeID: $1a; TypeName: '��������'),
    (TypeID: $1e; TypeName: '��������������� ����'),
    (TypeID: $1f; TypeName: '��������������� ����'),
    (TypeID: $20; TypeName: '��������������� ����'),
    (TypeID: $4d; TypeName: '������'),
    (TypeID: $28; TypeName: '����, �����'),
    (TypeID: $29; TypeName: '������'),
    (TypeID: $32; TypeName: '����'),
    (TypeID: $3b; TypeName: '������'),
    (TypeID: $3c; TypeName: '����� ������� (250-600��.��.)'),
    (TypeID: $3d; TypeName: '����� ������� (77-250��.��.)'),
    (TypeID: $3e; TypeName: '����� ������� (25-77��.��.)'),
    (TypeID: $3f; TypeName: '����� ������� (11-25��.��.)'),
    (TypeID: $40; TypeName: '����� ����� (0,25-11��.��.)'),
    (TypeID: $41; TypeName: '����� ����� (<0,25��.��.)'),
    (TypeID: $42; TypeName: '����� ������� (>3300��.��.)'),
    (TypeID: $43; TypeName: '����� ������� (1100-3300��.��.)'),
    (TypeID: $44; TypeName: '����� ������� (600-1100��.��.)'),
    (TypeID: $45; TypeName: '������'),
    (TypeID: $46; TypeName: '���� ������� (>1000�)'),
    (TypeID: $47; TypeName: '���� ������� (200-1000�)'),
    (TypeID: $48; TypeName: '���� ������� (40-200�)'),
    (TypeID: $49; TypeName: '���� ����� (<40�)'),
    (TypeID: $4e; TypeName: '��������� ��� ��� ������'),
    (TypeID: $50; TypeName: '���'),
    (TypeID: $4f; TypeName: '���������'),
    (TypeID: $51; TypeName: '������'),
    (TypeID: $6a; TypeName: '�������'),
    (TypeID: $6c; TypeName: '���'),
    (TypeID: $80; TypeName: '���� ������'),
    (TypeID: $82; TypeName: '����������� ���'),
    (TypeID: $83; TypeName: '������ ���'),
    (TypeID: $85; TypeName: '����������� ���/������'),
    (TypeID: $8b; TypeName: '���������� �����/������� ������')
  );

  function POLYGON_TYPES_GetNameByID(const TypeID: integer): string;

const
  POI_TYPES: array[0..270] of TPFMObjectTypeDescriptor = (
    (TypeID: $100;  TypeName: '��������� (����� 10 ���.)'),
    (TypeID: $200;  TypeName: '��������� (5-10 ���.)'),
    (TypeID: $300;  TypeName: '������� ����� (2-5 ���.)'),
    (TypeID: $400;  TypeName: '������� ����� (1-2 ���.)'),
    (TypeID: $500;  TypeName: '������� ����� (0.5-1 ���.)'),
    (TypeID: $600;  TypeName: '����� (200-500 ���.)'),
    (TypeID: $700;  TypeName: '����� (100-200 ���.)'),
    (TypeID: $800;  TypeName: '����� (50-100 ���.)'),
    (TypeID: $900;  TypeName: '����� (20-50 ���.)'),
    (TypeID: $a00;  TypeName: '���������� ����� (10-20 ���.)'),
    (TypeID: $b00;  TypeName: '���������� ����� (4-10 ���.)'),
    (TypeID: $c00;  TypeName: '���������� ����� (2-4 ���.)'),
    (TypeID: $d00;  TypeName: '���������� ����� (1-2 ���.)'),
    (TypeID: $e00;  TypeName: '������� (500-1000)'),
    (TypeID: $f00;  TypeName: '������� (200-500)'),
    (TypeID: $1000; TypeName: '������� (100-200)'),
    (TypeID: $1100; TypeName: '������� (����� 100)'),
    (TypeID: $1400; TypeName: '�������� �������� �����������'),
    (TypeID: $1500; TypeName: '�������� ������ �����������'),
    (TypeID: $1e00; TypeName: '�������� �������, ���������, �����'),
    (TypeID: $1f00; TypeName: '�������� ������, ������'),
    (TypeID: $2800; TypeName: '�������'),
    (TypeID: $1600; TypeName: '����'),
    (TypeID: $1601; TypeName: '�������� �����'),
    (TypeID: $1602; TypeName: '���������'),
    (TypeID: $1603; TypeName: '��������'),
    (TypeID: $1604; TypeName: '������� ���� (������� �����������)'),
    (TypeID: $1605; TypeName: '������� ���� (������� �������)'),
    (TypeID: $1606; TypeName: '������� ���� (����� ����)'),
    (TypeID: $1607; TypeName: '������������ ���� �����'),
    (TypeID: $1608; TypeName: '������������ ���� �������'),
    (TypeID: $1609; TypeName: '������������ ���� �������'),
    (TypeID: $160a; TypeName: '������������ ���� ������'),
    (TypeID: $160b; TypeName: '������������ ���� ������'),
    (TypeID: $160c; TypeName: '������������ ���� ���������'),
    (TypeID: $160d; TypeName: '������������ ���� ������������'),
    (TypeID: $160e; TypeName: '���������� ����'),
    (TypeID: $160f; TypeName: '���������� ���� �����'),
    (TypeID: $1610; TypeName: '���������� ���� �������'),
    (TypeID: $1611; TypeName: '���������� ���� �������'),
    (TypeID: $1612; TypeName: '���������� ���� ������'),
    (TypeID: $1613; TypeName: '���������� ���� ���������'),
    (TypeID: $1614; TypeName: '���������� ���� ����������'),
    (TypeID: $1615; TypeName: '���������� ���� �����'),
    (TypeID: $1616; TypeName: '���������� ���� ������������'),
    (TypeID: $1c00; TypeName: '������ ��������'),
    (TypeID: $1c01; TypeName: '������� ���������������'),
    (TypeID: $1c02; TypeName: '����������� �������, �������'),
    (TypeID: $1c03; TypeName: '����������� �������, �� �������'),
    (TypeID: $1c04; TypeName: '�������, ��������� ������'),
    (TypeID: $1c05; TypeName: '��������, ������� ��� ������� ����'),
    (TypeID: $1c06; TypeName: '�������� �� ������ ����'),
    (TypeID: $1c07; TypeName: '�������� ���� ������ ����'),
    (TypeID: $1c08; TypeName: '��������, ��������� ������'),
    (TypeID: $1c09; TypeName: '���� �� ������ ����'),
    (TypeID: $1c0a; TypeName: '��������� ����'),
    (TypeID: $1c0b; TypeName: '������� �������'),
    (TypeID: $1d00; TypeName: '���������� ��������'),
    (TypeID: $2000; TypeName: '����� � �����'),
    (TypeID: $2100; TypeName: '����� � ����� � ���������������'),
    (TypeID: $210F; TypeName: '����� � �������'),
    (TypeID: $2110; TypeName: '����� � ���������������'),
    (TypeID: $2200; TypeName: '����� � �������'),
    (TypeID: $2300; TypeName: '����� � ��������'),
    (TypeID: $2400; TypeName: '����� � ������� �������'),
    (TypeID: $2500; TypeName: '����� �������'),
    (TypeID: $2600; TypeName: '����� � ����������'),
    (TypeID: $2700; TypeName: '����� � �����'),
    (TypeID: $2a00; TypeName: '����������� �������'),
    (TypeID: $2a01; TypeName: '�������� (������������ �����)'),
    (TypeID: $2a02; TypeName: '�������� (��������� �����)'),
    (TypeID: $2a03; TypeName: '�������� (������)'),
    (TypeID: $2a04; TypeName: '�������� (��������� �����)'),
    (TypeID: $2a05; TypeName: '�������� (����������, �����, ��������)'),
    (TypeID: $2a06; TypeName: '�������� (����������������� �����)'),
    (TypeID: $2a07; TypeName: '�������� �������� �������'),
    (TypeID: $2a08; TypeName: '�������� (����������� �����)'),
    (TypeID: $2a09; TypeName: '�������� (������������ �����)'),
    (TypeID: $2a0a; TypeName: '��������'),
    (TypeID: $2a0b; TypeName: '�������� (������������)'),
    (TypeID: $2a0c; TypeName: '�������� (�����)'),
    (TypeID: $2a0d; TypeName: '������� (������������ �������)'),
    (TypeID: $2a0e; TypeName: '����'),
    (TypeID: $2a0f; TypeName: '�������� (����������� �����)'),
    (TypeID: $2a10; TypeName: '�������� (�������� �����)'),
    (TypeID: $2a11; TypeName: '�������� (���������� ��������� �����)'),
    (TypeID: $2a11; TypeName: '�������� (���������� ��������� �����)'),
    (TypeID: $2a12; TypeName: '����������� ������� ��������'),
    (TypeID: $2900; TypeName: '������ ������'),
    (TypeID: $2b00; TypeName: '���������'),
    (TypeID: $2b01; TypeName: '����� ��� ������'),
    (TypeID: $2b02; TypeName: '����� � ���������'),
    (TypeID: $2b03; TypeName: '�������'),
    (TypeID: $2b04; TypeName: '��������� �����'),
    (TypeID: $2c00; TypeName: '������ ��������, ������'),
    (TypeID: $2c01; TypeName: '����'),
    (TypeID: $2c02; TypeName: '�����'),
    (TypeID: $2c03; TypeName: '����������'),
    (TypeID: $2c04; TypeName: '���������������������'),
    (TypeID: $2c05; TypeName: '�����'),
    (TypeID: $2c06; TypeName: '����/���'),
    (TypeID: $2c07; TypeName: '�������/��������'),
    (TypeID: $2c08; TypeName: '�������'),
    (TypeID: $2c09; TypeName: '���'),
    (TypeID: $2c0a; TypeName: '������ ��������'),
    (TypeID: $2c0b; TypeName: '����/������/��������'),
    (TypeID: $2d00; TypeName: '��������������� ���������'),
    (TypeID: $2d01; TypeName: '�����'),
    (TypeID: $2d02; TypeName: '���/������ ����'),
    (TypeID: $2d03; TypeName: '���������'),
    (TypeID: $2d04; TypeName: '������'),
    (TypeID: $2d05; TypeName: '�����-����'),
    (TypeID: $2d06; TypeName: '������ �����/������'),
    (TypeID: $2d07; TypeName: '�������-�����'),
    (TypeID: $2d08; TypeName: '�����'),
    (TypeID: $2d09; TypeName: '�������'),
    (TypeID: $2d0a; TypeName: '��������/������-�����'),
    (TypeID: $2d0b; TypeName: '���������� ��������'),
    (TypeID: $2e00; TypeName: '�������� ������'),
    (TypeID: $2e01; TypeName: '���������'),
    (TypeID: $2e02; TypeName: '�������'),
    (TypeID: $2e03; TypeName: '�������� �����'),
    (TypeID: $2e04; TypeName: '�������� �����'),
    (TypeID: $2e05; TypeName: '������'),
    (TypeID: $2e06; TypeName: '������ ������������� ������'),
    (TypeID: $2e07; TypeName: '������'),
    (TypeID: $2e08; TypeName: '������ ��� ���� � ����'),
    (TypeID: $2e09; TypeName: '������'),
    (TypeID: $2e0a; TypeName: '������������������ �������'),
    (TypeID: $2e0b; TypeName: '����������/��'),
    (TypeID: $2f00; TypeName: '������'),
    (TypeID: $2f01; TypeName: '���'),
    (TypeID: $2f02; TypeName: '������ �����������'),
    (TypeID: $2f03; TypeName: '����������'),
    (TypeID: $2f04; TypeName: '����������'),
    (TypeID: $2f05; TypeName: '�������� ���������'),
    (TypeID: $2f06; TypeName: '����'),
    (TypeID: $2f07; TypeName: '�����������'),
    (TypeID: $2f08; TypeName: '�������/��������� ��������� ����������'),
    (TypeID: $2f09; TypeName: '������ �����, �������, ���'),
    (TypeID: $2f0a; TypeName: '��������� ������, ���������'),
    (TypeID: $2f0b; TypeName: '�����������'),
    (TypeID: $2f0c; TypeName: '����� ������, ���������� ��� ��������'),
    (TypeID: $2f0d; TypeName: '��������'),
    (TypeID: $2f0e; TypeName: '���������'),
    (TypeID: $2f0f; TypeName: '����� ����� Garmin'),
    (TypeID: $2f10; TypeName: '������ ���� (���������, ���������)'),
    (TypeID: $2f11; TypeName: '������-������'),
    (TypeID: $2f12; TypeName: '����� �����'),
    (TypeID: $2f13; TypeName: '���� �������'),
    (TypeID: $2f14; TypeName: '�����'),
    (TypeID: $2f15; TypeName: '������������ ������'),
    (TypeID: $2f16; TypeName: '������� ����������'),
    (TypeID: $2f17; TypeName: '��������� ������������� ����������'),
    (TypeID: $3000; TypeName: '��������������� ��� ���������� ������'),
    (TypeID: $3001; TypeName: '��������� �������'),
    (TypeID: $3002; TypeName: '��������'),
    (TypeID: $3003; TypeName: '�����'),
    (TypeID: $3004; TypeName: '���'),
    (TypeID: $3005; TypeName: '��������� ��� ���������� ������������ �����������'),
    (TypeID: $3006; TypeName: '����������� �����'),
    (TypeID: $3007; TypeName: '��������������� ����������'),
    (TypeID: $3008; TypeName: '�������� �����'),
    (TypeID: $5900; TypeName: '��������'),
    (TypeID: $5901; TypeName: '������� ��������'),
    (TypeID: $5902; TypeName: '������� ��������'),
    (TypeID: $5903; TypeName: '����� ��������'),
    (TypeID: $5904; TypeName: '����������� ��������'),
    (TypeID: $5905; TypeName: '��������'),
    (TypeID: $6400; TypeName: '������������� ����������'),
    (TypeID: $6401; TypeName: '����'),
    (TypeID: $6402; TypeName: '������'),
    (TypeID: $6403; TypeName: '��������'),
    (TypeID: $6404; TypeName: '����/������/��������'),
    (TypeID: $6405; TypeName: '������������ ������'),
    (TypeID: $6406; TypeName: '�����������, ���������, �������'),
    (TypeID: $6407; TypeName: '�������'),
    (TypeID: $6408; TypeName: '��������'),
    (TypeID: $6409; TypeName: '�������, ����������'),
    (TypeID: $640a; TypeName: '���������'),
    (TypeID: $640b; TypeName: '������� ������'),
    (TypeID: $640c; TypeName: '�����, ������'),
    (TypeID: $640d; TypeName: '������������� �����'),
    (TypeID: $640e; TypeName: '����'),
    (TypeID: $640f; TypeName: '�����'),
    (TypeID: $6410; TypeName: '�����'),
    (TypeID: $6411; TypeName: '�����, �����'),
    (TypeID: $6412; TypeName: '�����'),
    (TypeID: $6413; TypeName: '�������'),
    (TypeID: $6414; TypeName: '�������� ����, ������, �������'),
    (TypeID: $6415; TypeName: '����������� �����'),
    (TypeID: $6416; TypeName: '����������'),
    (TypeID: $6500; TypeName: '������ �����������'),
    (TypeID: $6501; TypeName: '������, �������� �����'),
    (TypeID: $6502; TypeName: '������'),
    (TypeID: $6503; TypeName: '�����'),
    (TypeID: $6504; TypeName: '�������� ����'),
    (TypeID: $6505; TypeName: '������������� �����'),
    (TypeID: $6506; TypeName: '������'),
    (TypeID: $6507; TypeName: '�����'),
    (TypeID: $6508; TypeName: '�������'),
    (TypeID: $6509; TypeName: '������'),
    (TypeID: $650a; TypeName: '������'),
    (TypeID: $650b; TypeName: '������'),
    (TypeID: $650c; TypeName: '������'),
    (TypeID: $650d; TypeName: '�����'),
    (TypeID: $650e; TypeName: '������'),
    (TypeID: $650f; TypeName: '�������������'),
    (TypeID: $6510; TypeName: '����'),
    (TypeID: $6511; TypeName: '������'),
    (TypeID: $6512; TypeName: '�����'),
    (TypeID: $6513; TypeName: '������'),
    (TypeID: $6600; TypeName: '��������� �������� ������'),
    (TypeID: $6601; TypeName: '����'),
    (TypeID: $6602; TypeName: '�����, �������'),
    (TypeID: $6603; TypeName: '���������'),
    (TypeID: $6604; TypeName: '�����'),
    (TypeID: $6605; TypeName: '������, �����'),
    (TypeID: $6606; TypeName: '���'),
    (TypeID: $6607; TypeName: '����'),
    (TypeID: $6608; TypeName: '������'),
    (TypeID: $6609; TypeName: '�����'),
    (TypeID: $660a; TypeName: '���'),
    (TypeID: $660b; TypeName: '������, ��������'),
    (TypeID: $660c; TypeName: '����� ������'),
    (TypeID: $660d; TypeName: '��������'),
    (TypeID: $660e; TypeName: '����'),
    (TypeID: $660f; TypeName: '�����, �������'),
    (TypeID: $6610; TypeName: '�������'),
    (TypeID: $6611; TypeName: '�������'),
    (TypeID: $6612; TypeName: '����������'),
    (TypeID: $6613; TypeName: '������'),
    (TypeID: $6614; TypeName: '�����'),
    (TypeID: $6615; TypeName: '�����'),
    (TypeID: $6616; TypeName: '������� ����� ��� ����'),
    (TypeID: $6617; TypeName: '������'),
    (TypeID: $6618; TypeName: '���'),
    (TypeID: $5a00; TypeName: '������������ �����'),
    (TypeID: $5b00; TypeName: '�������'),
    (TypeID: $5c00; TypeName: '����� ��� ��������'),
    (TypeID: $5d00; TypeName: '������� ���� (������� �������)'),
    (TypeID: $5e00; TypeName: '������� ���� (������� �����������)'),
    (TypeID: $6000; TypeName: '����������������'),
    (TypeID: $6100; TypeName: '���'),
    (TypeID: $6200; TypeName: '������� �������'),
    (TypeID: $6300; TypeName: '������� ������'),
    (TypeID: $4000; TypeName: '�����-����'),
    (TypeID: $4100; TypeName: '����� ��� �������'),
    (TypeID: $4200; TypeName: '�������, ���������'),
    (TypeID: $4300; TypeName: '��������'),
    (TypeID: $4400; TypeName: '���'),
    (TypeID: $4500; TypeName: '��������'),
    (TypeID: $4600; TypeName: '���'),
    (TypeID: $4700; TypeName: '�������� ������'),
    (TypeID: $4800; TypeName: '�������'),
    (TypeID: $4900; TypeName: '����'),
    (TypeID: $4a00; TypeName: '����� ��� �������'),
    (TypeID: $4b00; TypeName: '��������'),
    (TypeID: $4c00; TypeName: '����������'),
    (TypeID: $4d00; TypeName: '�����������'),
    (TypeID: $4e00; TypeName: '������'),
    (TypeID: $4f00; TypeName: '���'),
    (TypeID: $5000; TypeName: '�������� ����'),
    (TypeID: $5100; TypeName: '�������'),
    (TypeID: $5200; TypeName: '�������� ���'),
    (TypeID: $5300; TypeName: '������ ����'),
    (TypeID: $5400; TypeName: '����� ��� �������'),
    (TypeID: $5500; TypeName: '�����, �������'),
    (TypeID: $5600; TypeName: '��������� ����'),
    (TypeID: $5700; TypeName: '������� ����'),
    (TypeID: $5800; TypeName: '������������ ������')
  );

  function POI_TYPES_GetNameByID(const TypeID: integer): string;

  function KIND_TYPES_GetNameByID(const Kind: TPMFObjectKind; const TypeID: integer): string;

type
  TGeoCoordinate = record
    Lat: Extended;
    Long: Extended;
  end;

  TGeoCoordinatesArray = array of TGeoCoordinate;
  
  TPMFFileSectionParser = class
  public
    TypeID: Word;
    LabelName: ANSIString;
    Data0: TGeoCoordinatesArray; 

    class procedure ParseStringToData0(const S: ANSIString; out Data0: TGeoCoordinatesArray);
    class function Data0ToString(const Data0: TGeoCoordinatesArray): ANSIString;
    
    Constructor Create();
    Destructor Destroy; override;
    procedure LoadFromStr(const S: ANSIString);
    procedure SaveToStr(out S: ANSIString);
  end;



Implementation


function FormatFloat(const Format: string; Value: Extended): string;
begin
DecimalSeparator:='.';
Result:=SysUtils.FormatFloat(Format,Value);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


function POLYLINE_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POLYLINE_TYPES)-1 do
  if (POLYLINE_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POLYLINE_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;

function POLYGON_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POLYGON_TYPES)-1 do
  if (POLYGON_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POLYGON_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;

function POI_TYPES_GetNameByID(const TypeID: integer): string;
var
  I: integer;
begin
for I:=0 to Length(POI_TYPES)-1 do
  if (POI_TYPES[I].TypeID = TypeID)
   then begin
    Result:=POI_TYPES[I].TypeName;
    Exit; //. ->
    end;
Result:='?';
end;


function KIND_TYPES_GetNameByID(const Kind: TPMFObjectKind; const TypeID: integer): string;
begin
case Kind of
pmfokPolyline: Result:=POLYLINE_TYPES_GetNameByID(TypeID);
pmfokPolygon: Result:=POLYGON_TYPES_GetNameByID(TypeID);
pmfokPOI: Result:=POI_TYPES_GetNameByID(TypeID);
else
  Result:='';
end;
end;


{TPMFFileSectionParser}
class procedure TPMFFileSectionParser.ParseStringToData0(const S: ANSIString; out Data0: TGeoCoordinatesArray);

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] = ',')
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

var
  ValueStr: ANSIString;
  SL: TStringList;
  L,I: integer;
begin
SetLength(Data0,0);
ValueStr:=S;
ValueStr:=ANSIReplaceStr(ValueStr,'(',' ');
ValueStr:=ANSIReplaceStr(ValueStr,')',' ');
SplitStrings(ValueStr, {out} SL);
try
if ((SL.Count MOD 2) = 0)
 then begin
  L:=(SL.Count DIV 2);
  SetLength(Data0,L);
  for I:=0 to L-1 do begin
    Data0[I].Lat:=StrToFloat(SL[(I SHL 1)]);
    Data0[I].Long:=StrToFloat(SL[(I SHL 1)+1]);
    end;
  end
 else Raise Exception.Create('wrong coordinate string'); //. =>
finally
SL.Destroy;
end;
end;

class function TPMFFileSectionParser.Data0ToString(const Data0: TGeoCoordinatesArray): ANSIString;
var
  I: integer;
begin
Result:='';
if (Length(Data0) = 0) then Exit; //. ->
for I:=0 to Length(Data0)-1 do Result:=Result+'('+FormatFloat('0.####################',Data0[I].Lat)+','+FormatFloat('0.####################',Data0[I].Long)+')'+',';
SetLength(Result,Length(Result)-1);
end;

Constructor TPMFFileSectionParser.Create();
begin
Inherited;
end;

Destructor TPMFFileSectionParser.Destroy;
begin
Inherited;
end;

procedure TPMFFileSectionParser.LoadFromStr(const S: ANSIString);

  procedure GetNodeList(const S: ANSIString; out NL: TStringList);
  begin
  NL:=TStringList.Create;
  try
  NL.Text:=S;
  except
    FreeAndNil(NL);
    Raise; //. =>
    end;
  end;

  function GetNodeValue(const NodeList: TStringList; const NodeName: ANSIString; out Value: ANSIString): boolean;
  var
    S: ANSIString;
    LI,I: integer;
  begin
  Result:=false;
  for LI:=0 to NodeList.Count-1 do begin
    S:=NodeList[LI];
    I:=Pos(NodeName,S);
    if (I > 0)
     then begin
      I:=Pos('=',S);
      if ((I = 0) OR (I >= Length(S))) then Exit; //. ->
      Inc(I);
      Value:=Copy(S,I,Length(S)-I+1);
      Result:=true;
      Exit; //. ->
      end;
    end;
  end;

var
  NodeList: TStringList;
  TypeIDStr: ANSIString;
  ValueStr: ANSIString;
begin
GetNodeList(S,{out} NodeList);
try
if (GetNodeValue(NodeList,'Type',{out} TypeIDStr))
 then TypeID:=StrToInt(TypeIDStr)
 else TypeID:=Word(-1);
if (NOT GetNodeValue(NodeList,'Label',{out} LabelName)) then LabelName:='';
if (GetNodeValue(NodeList,'Data0', {out} ValueStr))
 then ParseStringToData0(ValueStr,{out} Data0)
 else SetLength(Data0,0);
finally
NodeList.Destroy;
end;
end;

procedure TPMFFileSectionParser.SaveToStr(out S: ANSIString);
begin
S:='Type='+'0x'+ANSILowerCase(IntToHex(TypeID,1));
if (LabelName <> '') then S:=S+#$0D#$0A+'Label='+LabelName;
if (Length(Data0) > 0)
 then begin
  S:=S+#$0D#$0A+'Data0='+Data0ToString(Data0);
  end;
end;


end.
