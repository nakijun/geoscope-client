object CoNotificationAreaPanelProps: TCoNotificationAreaPanelProps
  Left = 312
  Top = 383
  BorderStyle = bsDialog
  Caption = 'Notification area'
  ClientHeight = 78
  ClientWidth = 480
  Color = clBtnFace
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
    Left = 8
    Top = 24
    Width = 32
    Height = 32
    AutoSize = True
    ParentShowHint = False
    Picture.Data = {
      0A544A504547496D616765B1020000FFD8FFE000104A46494600010100000100
      010000FFDB004300090607080706090807080A0A090B0D160F0D0C0C0D1B1415
      1016201D2222201D1F1F2428342C242631271F1F2D3D2D3135373A3A3A232B3F
      443F384334393A37FFDB0043010A0A0A0D0C0D1A0F0F1A37251F253737373737
      3737373737373737373737373737373737373737373737373737373737373737
      37373737373737373737373737FFC00011080020002003012200021101031101
      FFC4001800000301010000000000000000000000000506070003FFC400311000
      010304010202060B000000000000000102030400050611211213143107154151
      91B22236375354727381A1D1D2FFC40019010002030100000000000000000000
      0000000501020304FFC400211100020104010501000000000000000000010203
      0004112112052331417161FFDA000C03010002110311003F007EF585FE6DDA74
      6B7C94F4B0EA80494206921440E48AEFDACBFEFDBF837FD56C67EB35E3F3AFE7
      343320CC2FF1B299566B3408B27B294948521456ADA12A3E4A1EFA5112738F9B
      BB792347F6A2C6C64BC242B6C64F9C0C0346B17B9DC24CF990EE2E25C533C6C2
      40D10744714CB52D8974C8A2CB7E45B6D8DBF39E24C9654DA886C93B3A01408E
      78F33442D59A640323856BBE5B23C712481A4A1495807601E5478D8ADACA7ED0
      0E49D9D9FB5D569D3E69612EA41C67DEF547676211E5CC7A4094E23BAB2B29E9
      0744F26949AB7A579BBD8F17086DB47577B5C9FA015E5FBD54AA7991637920CB
      DFBDD81C6525D424254549DA7480920850D7B3F9A27B1834C13DEE8B0B3B495D
      D66C0CA9C124819D629AAC7606ECEF38EB6FA9CEB4F490A4EBDB4A795FDA8D87
      F49BF9DCADE1FD25FE318F833FE6B941C732C95945BEEB7D2D3BE19490569520
      108049D69207BCD5C2AAA08E34206699D95A4566598CA8471618077B1F2BFFD9}
    PopupMenu = PopupMenu
    ShowHint = True
  end
  object sbCoComponent: TSpeedButton
    Left = 383
    Top = 4
    Width = 90
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
  object Label1: TLabel
    Left = 48
    Top = 32
    Width = 134
    Height = 16
    Caption = 'Notification addresses'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object sbShow: TSpeedButton
    Left = 288
    Top = 4
    Width = 89
    Height = 24
    Caption = 'Show'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbShowClick
  end
  object sbEditNotificationAddresses: TSpeedButton
    Left = 382
    Top = 52
    Width = 90
    Height = 24
    Caption = 'Edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbEditNotificationAddressesClick
  end
  object edName: TEdit
    Left = 49
    Top = 4
    Width = 232
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNameKeyPress
  end
  object edNotificationAddresses: TEdit
    Left = 49
    Top = 52
    Width = 328
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    OnKeyPress = edNotificationAddressesKeyPress
  end
  object PopupMenu: TPopupMenu
    Left = 8
    Top = 65520
    object Copyvisualizationcomponenttotheclipboard1: TMenuItem
      Caption = 'Copy visualization-component to the clipboard'
      OnClick = Copyvisualizationcomponenttotheclipboard1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Addareatolocalmonitor1: TMenuItem
      Caption = 'Add area to local monitor'
      OnClick = Addareatolocalmonitor1Click
    end
    object Showarealocalmonitor1: TMenuItem
      Caption = 'Show area local monitor'
      OnClick = Showarealocalmonitor1Click
    end
  end
end
