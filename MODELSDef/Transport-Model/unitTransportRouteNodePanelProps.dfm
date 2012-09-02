object fmTransportRouteNodePanelProps: TfmTransportRouteNodePanelProps
  Left = 194
  Top = 106
  BorderStyle = bsDialog
  Caption = #1089#1074#1086#1081#1089#1090#1074#1072' '#1086#1073#1098#1077#1082#1090#1072
  ClientHeight = 404
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 80
    Align = alClient
    TabOrder = 0
    object RxLabel1: TRxLabel
      Left = 192
      Top = 2
      Width = 157
      Height = 16
      Caption = #1052#1040#1056#1064#1056#1059#1058#1053#1067#1049' '#1059#1047#1045#1051
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGrayText
      ShadowPos = spRightBottom
    end
    object RxLabel2: TRxLabel
      Left = 8
      Top = 26
      Width = 434
      Height = 16
      Caption = 
        #1056#1040#1057#1057#1058#1054#1071#1053#1048#1045' '#1044#1054' '#1052#1040#1056#1064#1056#1059#1058#1040' .........................................' +
        '...........'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGrayText
      ShadowPos = spRightBottom
      OnClick = reArrivalTimetableChange
    end
    object RxLabel3: TRxLabel
      Left = 489
      Top = 26
      Width = 13
      Height = 16
      Caption = #1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGrayText
      ShadowPos = spRightBottom
    end
    object RxLabel4: TRxLabel
      Left = 8
      Top = 50
      Width = 192
      Height = 16
      Caption = #1057#1058#1054#1048#1052#1054#1057#1058#1068' '#1055#1056#1054#1045#1047#1044#1040' ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGrayText
      ShadowPos = spRightBottom
    end
    object RxLabel5: TRxLabel
      Left = 489
      Top = 50
      Width = 30
      Height = 16
      Caption = #1088#1091#1073
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShadowColor = clGrayText
      ShadowPos = spRightBottom
    end
    object edDistanceBefore: TEdit
      Left = 440
      Top = 24
      Width = 49
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edDistanceBeforeKeyPress
    end
    object edOrderPrice: TEdit
      Left = 200
      Top = 48
      Width = 289
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edOrderPriceKeyPress
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 80
    Width = 525
    Height = 324
    ActivePage = TabSheet1
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1090#1087#1088#1072#1074#1083#1077#1085#1080#1077
      object reDepartTimetable: TMemo
        Left = 0
        Top = 0
        Width = 517
        Height = 293
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnChange = reDepartTimetableChange
        OnMouseDown = reDepartTimetableMouseDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1080#1073#1099#1090#1080#1077
      ImageIndex = 1
      object reArrivalTimetable: TMemo
        Left = 0
        Top = 0
        Width = 528
        Height = 277
        Align = alClient
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnChange = reArrivalTimetableChange
        OnMouseDown = reArrivalTimetableMouseDown
      end
    end
  end
  object RxGradientCaption: TRxGradientCaption
    Captions = <>
    FormCaption = #1089#1074#1086#1081#1089#1090#1074#1072' '#1086#1073#1098#1077#1082#1090#1072
    Left = 160
    Top = 65528
  end
end
