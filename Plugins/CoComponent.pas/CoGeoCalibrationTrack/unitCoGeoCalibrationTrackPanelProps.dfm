object CoGeoCalibrationTrackPanelProps: TCoGeoCalibrationTrackPanelProps
  Left = 404
  Top = 300
  BorderStyle = bsDialog
  Caption = 'Geo calibration track'
  ClientHeight = 315
  ClientWidth = 536
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 0
    Top = 0
    Width = 32
    Height = 32
    Hint = 'Drop data here'
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      0A544A504547496D616765F8030000FFD8FFE000104A46494600010101006000
      600000FFE1001645786966000049492A0008000000000000000000FFDB004300
      080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A
      1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432
      FFDB0043010909090C0B0C180D0D1832211C2132323232323232323232323232
      3232323232323232323232323232323232323232323232323232323232323232
      3232323232FFC00011080020002003012200021101031101FFC4001F00000105
      01010101010100000000000000000102030405060708090A0BFFC400B5100002
      010303020403050504040000017D010203000411051221314106135161072271
      14328191A1082342B1C11552D1F02433627282090A161718191A25262728292A
      3435363738393A434445464748494A535455565758595A636465666768696A73
      7475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9
      AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4
      E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101
      0000000000000102030405060708090A0BFFC400B51100020102040403040705
      040400010277000102031104052131061241510761711322328108144291A1B1
      C109233352F0156272D10A162434E125F11718191A262728292A35363738393A
      434445464748494A535455565758595A636465666768696A737475767778797A
      82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
      B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2
      F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA28CD721F10FC537B
      E15F0DB5E58D93CF2BB6CF3F6EE8ED87F7DC7F2ED9EA7B1718B9349015BC7DF1
      021F0ADB1B3B3D93EAF2AE5233CAC2A7F8DFFA0EFF004ABDE08F18C7E2AD1E29
      678C5B5F80DBE2E8240A4032479E4A64E0FA1CAE4E327C391A1980BCD75FCDBE
      9B124425720CC0F469C8E42F4C74623D1704757E06F056BFAB6B96FE22BEB99B
      4F8A06531BA80B24A00C0545C6D58F1C74DA4700639AEE9E1A10A7ABD7BFF919
      A936CEDFC73E3B8F4153A669B2472EB322F0A791083D09EC58F653D783E81B8D
      935BF11DDE96B61717F30D560B6936DBC8A11E762C14290462420751D79AEFBC
      4BE00D375D696F2DB1A7EACEB817B12649FF00797B9EDB861B1DF1C565C3F0AE
      D20D0E0B45BF95AF5082F74E0E3DB6A820AE0FDDC36464E49AE772A7EC928EFD
      4AB3BEA4D63F0CF42FEDB6D66E21795A4C486CE43BA2594F25B9E587A02481CF
      5E31DD000543676C6D6D21B769E59CC6813CD98E5DF031963DCFA9A9EB294E52
      F89DCA4AC7FFD9}
    ShowHint = True
  end
  object sbCoComponent: TSpeedButton
    Left = 40
    Top = 4
    Width = 81
    Height = 24
    Caption = 'Component'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbCoComponentClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 536
    Height = 282
    Align = alBottom
    TabOrder = 0
    object sbLoadTrackFromFile: TSpeedButton
      Left = 320
      Top = 64
      Width = 201
      Height = 25
      Caption = 'Load track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbLoadTrackFromFileClick
    end
    object sbSetVisualizationByTrack: TSpeedButton
      Left = 320
      Top = 112
      Width = 201
      Height = 25
      Caption = 'Set visualization by track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbSetVisualizationByTrackClick
    end
    object sbDoCalibrate: TSpeedButton
      Left = 320
      Top = 248
      Width = 201
      Height = 25
      Hint = 
        'Calibrate point by a selected handle of editing object in curren' +
        't reflector (editing mode is embedded editing)'
      Caption = 'Calibrate selected point'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbDoCalibrateClick
    end
    object Label3: TLabel
      Left = 320
      Top = 8
      Width = 52
      Height = 16
      Caption = 'Ellipsoid'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object memoCalibrationLog: TMemo
      Left = 1
      Top = 1
      Width = 304
      Height = 280
      Align = alLeft
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 320
      Top = 160
      Width = 201
      Height = 81
      Caption = ' Calibration points properties '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 74
        Height = 16
        Caption = 'Prototype ID'
      end
      object sbSetGeodesyPointPrototypeIDFromClipboard: TSpeedButton
        Left = 152
        Top = 21
        Width = 41
        Height = 25
        Hint = 'Set calibration (GeodesyPoint) prototype from clipboard'
        Caption = 'Set'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbSetGeodesyPointPrototypeIDFromClipboardClick
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 97
        Height = 16
        AutoSize = False
        Caption = 'CRD System ID'
      end
      object edGeodesyPointPrototypeID: TEdit
        Left = 85
        Top = 21
        Width = 60
        Height = 24
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edCalibrationCrdSystemID: TEdit
        Left = 112
        Top = 53
        Width = 81
        Height = 24
        TabOrder = 1
      end
    end
    object cbGeodesyEllipsoide: TComboBox
      Left = 320
      Top = 24
      Width = 201
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
      OnChange = cbGeodesyEllipsoideChange
    end
  end
  object OpenDialog: TOpenDialog
    Left = 168
    Top = 65528
  end
end
