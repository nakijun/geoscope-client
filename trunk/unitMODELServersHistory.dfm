object fmMODELServersHistory: TfmMODELServersHistory
  Left = 173
  Top = 230
  BorderStyle = bsDialog
  Caption = 'Servers history'
  ClientHeight = 232
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lvHistory: TListView
    Left = 16
    Top = 24
    Width = 665
    Height = 150
    Color = clWhite
    Columns = <
      item
        Caption = 'Type'
        Width = 80
      end
      item
        Caption = 'URL'
        Width = 250
      end
      item
        Caption = 'Info'
        Width = 100
      end
      item
        Caption = 'User'
        Width = 90
      end
      item
        Caption = 'Time'
        Width = 120
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LargeImages = lvHistory_ImageList
    ReadOnly = True
    ParentFont = False
    SmallImages = lvHistory_ImageList
    StateImages = lvHistory_ImageList
    TabOrder = 0
    ViewStyle = vsReport
  end
  object bbConnectToSelectedServer: TBitBtn
    Left = 16
    Top = 184
    Width = 217
    Height = 25
    Caption = 'Connect to selected server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bbConnectToSelectedServerClick
  end
  object bbDeleteSelectedServer: TBitBtn
    Left = 240
    Top = 184
    Width = 217
    Height = 25
    Caption = 'Delete selected server'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bbDeleteSelectedServerClick
  end
  object bbClearHistory: TBitBtn
    Left = 464
    Top = 184
    Width = 217
    Height = 25
    Caption = 'Clear history'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = bbClearHistoryClick
  end
  object lvHistory_ImageList: TImageList
    Left = 56
    Top = 72
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B606900B493
      9400BB9D9D00BB9D9D00986C7300795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0DEDE00E0DEDE00DFDA
      DA00DDD5D500C49EA000B38C8C00D5B3B300B183830000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0DEDE00EDEDED00EDEDED00E5E4
      E400DFDADA00DACCCC00AB939300AB939300D3ABAB00986C7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E4E400F4F4F400FBFBFB00EDED
      ED00DDD5D500E2CBCB00BA848400BA848400D3ABAB00A17F850097727900CDAA
      AA00A18588007952610000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4D3D300C47B7B00E2CB
      CB00CDAAAA00CD9B9B00C47B7B00CA7A7A00C69B9B00DBC4C400DBBCBC00D9B5
      B500B3AAAA00B3AAAA0097727900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBBCBC00FFAA1A00FBC9
      7E00DDAFAF00CC727200CD6D6D00CC727200E2CBCB00DBC4C400D3ABAB00D1A2
      A200A2727200BB9D9D0073F9A000795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3ABAB00FFB02800FFB5
      3300FFB73900FFBC4400E1B69500CA7A7A00D39C9C00D9B5B500DBBCBC00D5B3
      B300AC7C7C00B38C8C00A2727200795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5B3B300FFBC4400FFBF
      4B00FFC35300FFC35300FFC35300FFBF4B00F2B36100CC727200DBBCBC00D5B3
      B300C3929200D1A2A200AC7C7C00795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8A4A100FFC65B00FFCA
      6200FFCE6A00FFCE6A00FFCE6A00FFCA6200FFC35300CE858500DBBCBC00D3AB
      AB00AC7C7C00BC8D8D00BA848400795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4D3D300D7B07D00FFD37400FFD5
      7B00FFDA8300FFDA8300FFD87F00FFD37400FFCE6A00D2929200DBBCBC00D3AB
      AB00BC8D8D00AC7C7C00B1838300795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CDBDBD00EEBE7B00FFDA8300FFE2
      9300FFE59B00FFE59B00FFE29300FFDE8B00FFD57B00D1A2A200DBBCBC00D39C
      9C00AC7C7C00CD9B9B00BA848400795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4D3D300FFDA8300FFE29300FFEA
      A400FFEEAD00FFF1B400FFEEAD00FFE59B00FFDE8B00D9B5B500DBBCBC00D39C
      9C00CA7A7A00CA7A7A00BB757500795261000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4EBEB00EBCA9000FFEAA400FFF1
      B400FFF9C500FFFDCD00FFF6BC00FFEEAD00EBCA9000F4EBEB00F4EBEB00F4EB
      EB00F4EBEB00EDDCDC00D68F8F009C7E88000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E4E400E5E4E400CDBDBD00AB93
      9300AB939300CCB9A300EDDBB800FFEEAD00E1B69500E0C1C100E0C1C100CDAA
      AA00D4B9B9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DBC4C400DBC4
      C400DBC4C400CDB5B500E2CBCB00D5B3B300BC8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000C0FF000000000000
      807F000000000000003F00000000000000030000000000008001000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0007000000000000C07F00000000000000000000000000000000000000000000
      000000000000}
  end
end