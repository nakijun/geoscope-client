object CommNodePanelProps: TCommNodePanelProps
  Left = 144
  Top = 251
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 227
  ClientWidth = 411
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 411
    Height = 227
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object LabelType: TLabel
    Left = 152
    Top = 8
    Width = 98
    Height = 20
    Caption = #1059#1079#1077#1083' '#1057#1074#1103#1079#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEditName: TDBEdit
    Left = 56
    Top = 30
    Width = 297
    Height = 28
    DataField = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBEditDescr: TDBEdit
    Left = 16
    Top = 62
    Width = 377
    Height = 28
    DataField = 'Descr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object BitBtnMonitorDamages: TBitBtn
    Left = 8
    Top = 96
    Width = 129
    Height = 57
    Caption = #1052#1086#1085#1080#1090#1086#1088' '#1087#1086#1074#1088#1077#1078#1076#1077#1085#1080#1081
    TabOrder = 2
    OnClick = BitBtnMonitorDamagesClick
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00130707070707
      0707070707070707070707070707070707070707070707070707070707070707
      0707070707070C07070707070707070707070C0C070707070707070707070707
      0707070707070F070707070707070707070C00000C0707070707070707070C07
      0707070707070F070C07070C070707070C000000000C0C070707070707070F0C
      070C07070C070F0710070C0F0707070C0001000D01000007070707070707100F
      0C100C070F0C0F070D070F0C07070C00010100000D01000C0707070707070707
      0F07100C0F0F0C0710070C10070C00010D0D0D00010D01000707070707070707
      1007070D070F0F0C0C0C100F0C00010D0D0D0D000D010D000707070707070C0C
      0C1007070D070D0F100F0F0700010D0D0D0D0D0D0000010007070707070C0000
      000F07070710070F0F070700010D0D0D0D0D0D0D0D0000000707070707000001
      0100000F0F070D070F0F00010D0D0D0D0D0D0D0D0D0D0007070707070C00010D
      0D0D0100000F10100F00010D0D0D0D0D0D0D0D0D0D00070707070707000D0D0D
      0D0D0D0D0100000F0F0000000D0D0D0D0D0D0D0D0007070707070707000D0D0D
      0D0D0D0D0D0D0D100D0F0F000D0D0D0D0D0D0D000707070707070707000D0D0D
      0D0D0D0D0D00000F100D000D0D0D0D0D0D0D00070707070707070707000D0D0D
      0D0D0D0D0D000F0D0F10000000000D0D0D000707070707070707070700000D0D
      0D0D0D0D0D0D000F0D0F0D0F0F000D0D0007070C070707070707070707070000
      0D0D0D0D0D0D0D000F0F0D1010000D000707070F070707070707070707070707
      00000D0D0D00000F0F10100F0F00000C0707070707070707070707070707070C
      070700000D0007100F070D10071007100C0707070C0707070707070707070C0F
      07070C0C000D100D07100F070D0C070710070C07100707070707070707070F07
      0C0C10100F0F070F0D100F07070D0C07070710070C070707070707070707070C
      0D0F0F0F0F070F0710070F0707100D0C0C0707070F070C070707070707070710
      070F07070F0F10071007100707070F0F100C0707070C0F070707070707070C0F
      0707070C100F0707070C100707070C070F0F0C07070F07070707070707070F0F
      07070C0D070707070710070707070F0707070D0C0C0707070707070707070707
      070C0D070707070707070C0707070F07070707100D0C07070707070707070707
      0710070C070707070C070F070707070C07070707101007070707070707070707
      07070C0F0707070C0F0707070707071007070707070707070707070707070707
      07070F070707071007070707070707070C070707070707070707070707070707
      070707070707070707070707070707070F070707070707070707070707070707
      0707070707070707070707070707070707070707070707070707}
    Layout = blGlyphTop
  end
  object BitBtnClients: TBitBtn
    Left = 8
    Top = 160
    Width = 129
    Height = 57
    Caption = #1050#1051#1048#1045#1053#1058#1067
    TabOrder = 3
    OnClick = BitBtnClientsClick
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00130707070707
      0707000707070707070707070707000707070700070707070707070707070707
      0707070007070707070000000007070007070007070707070707070707070707
      0707070700070707000707070700070700000707070707070707070707070707
      0707070707000000000707070700000000070707070707070707070707070707
      0707070707070707000707070007070707070707070707070707070707070707
      0707070707070700070707070000070707070707070707070707070707070707
      0707000000000007070707070707000007070707070707070707070707070707
      0000070707070707070707070707070700000007070707070707070707070700
      0707070707070707070707070707070707070700000707070707070707070007
      0707070707070707070707070707070707070707070007070707070707000707
      0707000000000000070707070707070707000000000700070707070707000707
      0700070707070707000707070707070700070707000007000707070700070707
      0007070707070707070007070707070707070707070007000707070700070707
      0707070707070707070707070707070707000707070007000707070700070707
      0707070707070707070707070707070707000000000707000707070700070707
      0707070707070707070707070707070707070000070000000000070700070707
      0700000707070707070707070707070700000F0F000F0F000F00070700070707
      00070707070707070707070707070000000F0F0F000F0F0F0F00070700070707
      00070707070000000007070707000F0F000F0F0F0F0F0F0F0007070700070707
      00000000000007070700070707000F0F0F000F0F0F0F00000707070707000700
      0007070700000707070007070700000F0F0F0F000F0002000707070707000700
      000707070007070707000707070700000F000F00020202000007070707070000
      07070707000000000007070707070202020002020202000F0F00070707070700
      00000000070707070700070702020202020202000F0F0F0F0F00070707070707
      00070707000700000002020200020202000F0F0F000F0F0F0F00070707070707
      070000000202020202020202000F0F0F0F000F0F0F0F0F0F0007070707070707
      0700020202020202000F0F0F0F000F0F0F0F0F0F000000000007070707070707
      00000002000F000F0F000F0F0F0F0F00000F0F0F0F0007070707070707070700
      0F0F0F0F000F0F0F0F0F0F000F0F0F000000000000000707070707070707000F
      0F0F0F0F0F0F000F0F0F0F00000F0F0F0F00070707070707070707070707000F
      0F0F000F0F000000000F0F000700000000070707070707070707070707070700
      0000070000000707070000070707070707070707070707070707}
  end
  object BitBtnReports: TBitBtn
    Left = 144
    Top = 96
    Width = 137
    Height = 57
    Caption = #1054#1090#1095#1105#1090#1099
    TabOrder = 4
    OnClick = BitBtnReportsClick
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00130707070707
      0000000000000000000000000000000000000000000707070707070707070707
      0007070707070707070707070707070707070707000707070707070707070707
      0007070707070707070707070707070707070707000000070707070707070707
      0007070000000700000000000700000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000000000700000000000700000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000700000000000700000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000000070000000000070000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000000070000070000000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000700000000000007000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000000007000000070000000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070000070000000700000700000000000707000700070707070707070707
      0007070707070707070707070707070707070707000700070707070707070707
      0007070007070000070000000000000700000707000700070707070707070707
      0007070700000707000707070707070707070707000700070707070707070707
      0007000007070707000700000700000000000707000700070707070707070707
      0000070707070700070707070707070707070707000700070707070707070000
      0707070707000007070707070707070707070707000700070707070000000707
      0707070700000000000000000000000000000000000700070707070707070707
      0707070007070707070707070707070707070707070700070707070707070707
      0707070700000000000000000000000000000000000000070707070707070707
      0707070707000707070007070707070707070707070707070707070707070707
      0707070707070707000707070707070707070707070707070707070707070707
      0707070707070700070707070707070707070707070707070707070000000007
      0707070707000007070707070707070707070707070707070707070707070700
      0000000000070707070707070707070707070707070707070707}
  end
  object BitBtnStatistics: TBitBtn
    Left = 288
    Top = 160
    Width = 113
    Height = 57
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
    TabOrder = 5
    OnClick = BitBtnStatisticsClick
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00130707070707
      0707070707070707070707070707070707070707070707070707070707070707
      0707070707070707070707070707070707070707070707070707070707070707
      0700070707070707000707070707070007070707070700070707070707070707
      0707070707070707070707070707070707070707070707070707070700000000
      0000000000000000000000000000000000000000000000000000070700070707
      0707070707070707070707070707070707070707070707070707070700070707
      0C000C0C0C07070C000C0C0C07070C000C0C0C07070C000C0C0C000700070700
      000000000C0700000000000C0700000000000C0700000000000C070700070000
      050105000C0700050105000C0700050105000C0700050105000C070700070F00
      0D0501000C07000D0501000C07000D0501000C07000D0501000C070700070F0F
      000105000C0700050105000C0700050105000C0700050105000C07070007070F
      0F0001000C00000D0501000C07000D0501000C07000D0501000C070700070700
      0F0F0000000F00050105000C0700050105000C0700050105000C070700070700
      0D0F0F000F0F0F000501000C07000D0501000C07000D0501000C000700070700
      05010F0F0F070F0F0005000C0700050105000C0700050105000C070700070700
      0D05010F0C07000F0F00000C07000D0501000C00000D0501000C070700070700
      050105000C0700050F0F000C070005010500000F00050105000C070700070700
      0D0501000C07000D050F0F0007000D0501000F0F0F000501000C070700070700
      050105000C07000501050F0F00000501000F0F070F0F0005000C070700070700
      0D0501000C07000D0501000F0F000D000F0F0C07000F0F00000C070700070700
      050105000C0700050105000C0F0F000F0F000C07000D0F0F000C000700070700
      0D0501000C07000D0501000C070F0F0F01000C070500000F0F07070700070700
      050105000C0700110D11000C07000F0105000C07070707070707070700070700
      0D0501000C0705000000000707000D0501000C07070707070707070700070700
      050105000C070707070707070700050105000C07070707070707070700070700
      0D0501000C0707070707070707000D110D000C07070707070707070700070700
      110D11000C070707070707070705000000000707070707070707070700070705
      0000000007070707070707070707070707070707070707070707000700070707
      0707070707070707070707070707070707070707070707070707070700070707
      0707070707070707070707070707070707070707070707070707070707070707
      0707070707070707070707070707070707070707070707070707070707070707
      0707070707070707070707070707070707070707070707070707}
  end
  object BitBtnCommLines: TBitBtn
    Left = 288
    Top = 96
    Width = 113
    Height = 57
    Caption = #1057#1051
    TabOrder = 6
    OnClick = BitBtnCommLinesClick
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C000000000000000000000000000000000000C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
      C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6800000804000C6C3C6C6
      C3C6C6C3C6C6C3C6C6C3C6800000800000C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0800000800000800000800000C6
      C3C6C6C3C6C6C3C6800000800000800000800000C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000008000008000008000008000
      00800000800000800000C0C0C0C0C0C0C0C0C0C0C0C0FF004080000080000080
      0000800000800000800000800000000000C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08000008000008000008000008000008000
      00800000800000800000000000C0C0C0C0C0C0C0C0C0C0C0C0FF004080000080
      0000800000800000800000000000C0C0C0C6C3C6C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000800000000000C0C0C0C0C0C0C0C0
      C0C0C0C0800000800000800000800000C0C0C0C0C0C0C0C0C0C0C0C0FF004080
      0000800000800000000000C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000800000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C6C3C6C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0C0C0FF0040800000800000800000000000C0C0C0C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000800000000000C0C0C0C0C0C0C0C0C0C0C0C0FF
      0040800000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      C0C0C0FF0040FF0040804000800000800000800000800000000000C0C0C0C0C0
      C0C0C0C0C0C0C0FF0040800000800000800000000000C6C3C6C0C0C080400080
      0000800000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      FF0040804000800000804000800000800000800000800000800000000000C0C0
      C0C0C0C0C0C0C0C0C0C0FF004080400080000080000080000080000080000080
      0000800000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
      800000800000800000800000C0C0C0C0C0C0C0C0C08000008000008040008040
      00C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6FF004080000080000080000080000080
      0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C0C0C0
      C0C0C0800000804000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0800000804000C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6FF0040800000800000000000C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6
      C6C3C6C0C0C0C0C0C0C6C3C6C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3
      C6C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
      C3C6C0C0C0C0C0C0C6C3C6C6C3C6C0C0C0C0C0C0C0C0C0C0C0C0}
  end
  object BitBtnClientsStatistics: TBitBtn
    Left = 144
    Top = 160
    Width = 137
    Height = 57
    Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1072#1084
    TabOrder = 7
    OnClick = BitBtnClientsStatisticsClick
    Glyph.Data = {
      36080000424D3608000000000000360400002800000020000000200000000100
      0800000000000004000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
      FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
      800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00130C00000000
      07070700000000000000000C0C0C0C0C0C0C0C0C0C0C0C070707070707070707
      00070007070707070707070707070707070707070707070707070C0C0C000007
      070007070C0C0C0C0C0C0C0C0C0C0C0C0C0C0707070707070707070707070700
      0700070007070707070707070707070707070707070707070707070707070700
      0000000007070707070707070707070707070707070707070707070707070700
      0707070007070707070707070707070707070707070707070707070707070700
      0707070007070707070707070707070707070707070707070707000000000000
      0707070000000000000000000000000000000000000000000007000707070707
      00070C0707070707070707070707070707070707070707070007000707070707
      00070C0707070700000000000000000707070707070707070007000707070707
      0C070C0707070003030303030303030007070707070707070007000707070707
      0707070707070003030303030300000007070707070707070007000707070707
      0707000000000000000003030003030007070707070707070007000707070707
      0700070707070707070700030303030007070707070707070007000707070707
      0700070707070707000000030303000000070707070707070007000707070707
      0700070707070700070700030303030300070707070707070007000707070707
      0700070707070707070700030303030300070707070707070007000707070707
      0700070707070707070000000303030300070707070707070007000707070707
      0700070707070707070707000300030300070707070707070007000707070707
      0700070707070707070707000300030300070707070707070007000707070707
      0700070707070707070707000303030300070707070707070007000707070707
      0700070707070707000707000000000007070707070707070007000707070707
      0700070707070707000707000707070707070707070707070007000707070707
      0700070707070707070707000707070707070707070707070007000707070707
      0707000000000000000000070707070707070707070707070007000707070707
      0707070707070707070707070707070707070707070707070007000707070707
      0707070707070707070707070707070707070707070707070007070007070707
      0707070707070707070000000000000000000000000000000007070700070707
      0707070707070707000707070707070707070707070707070707070707000707
      0707070707070700070707070707070707070707070707070707070707070007
      0707070707070007070707070707070707070707070707070707070707070700
      0000000000000707070707070707070707070707070707070707}
    Layout = blGlyphTop
  end
end