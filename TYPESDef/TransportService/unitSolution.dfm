object fmSolution: TfmSolution
  Left = 144
  Top = 267
  VertScrollBar.Visible = False
  BorderStyle = bsNone
  ClientHeight = 217
  ClientWidth = 721
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 217
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 721
      Height = 217
      Align = alTop
      Shape = bsFrame
      Style = bsRaised
    end
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 714
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = #1084#1072#1088#1096#1088#1091#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel8: TBevel
      Left = 360
      Top = 64
      Width = 9
      Height = 89
      Shape = bsLeftLine
      Style = bsRaised
    end
    object lbRouteName: TLabel
      Left = 8
      Top = 21
      Width = 705
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = #1053#1048#1046#1053#1048#1049' '#1053#1054#1042#1043#1054#1056#1054#1044' '#1057#1040#1056#1040#1053#1057#1050
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbOrderPrice: TLabel
      Left = 165
      Top = 180
      Width = 196
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRouteType: TLabel
      Left = 122
      Top = 195
      Width = 239
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbRouteRemarks: TLabel
      Left = 504
      Top = 194
      Width = 209
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 178
      Width = 153
      Height = 16
      Caption = #1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1088#1086#1077#1079#1076#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 194
      Width = 110
      Height = 16
      Caption = #1090#1080#1087' '#1084#1072#1088#1096#1088#1091#1090#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 410
      Top = 194
      Width = 95
      Height = 16
      Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDepartNodeName: TEdit
      Left = 8
      Top = 48
      Width = 305
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edDepartNodeNameKeyDown
      OnKeyPress = edDepartNodeNameKeyPress
    end
    object memoDepartNodeTimetable: TMemo
      Left = 8
      Top = 72
      Width = 305
      Height = 105
      Color = 15263976
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = edDepartNodeNameKeyDown
      OnKeyPress = edDepartNodeNameKeyPress
    end
    object edArrivalNodeName: TEdit
      Left = 408
      Top = 48
      Width = 305
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyDown = edDepartNodeNameKeyDown
      OnKeyPress = edDepartNodeNameKeyPress
    end
    object memoArrivalNodeTimetable: TMemo
      Left = 408
      Top = 72
      Width = 305
      Height = 105
      Color = clSilver
      Enabled = False
      Lines.Strings = (
        #1085#1077#1090' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103)
      ScrollBars = ssVertical
      TabOrder = 3
      OnKeyDown = edDepartNodeNameKeyDown
      OnKeyPress = edDepartNodeNameKeyPress
    end
  end
end
