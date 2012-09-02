object TransportNodePanelProps: TTransportNodePanelProps
  Left = 124
  Top = 100
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 243
  ClientWidth = 548
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
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 548
    Height = 243
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 8
    Top = 11
    Width = 175
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1056#1040#1053#1057#1055#1054#1056#1058#1053#1067#1049' '#1059#1047#1045#1051
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object RxLabel1: TRxLabel
    Left = 8
    Top = 43
    Width = 201
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1077#1084#1099#1077' '#1084#1072#1088#1096#1088#1091#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object List: TListView
    Left = 8
    Top = 64
    Width = 529
    Height = 169
    Columns = <
      item
        Caption = #1048#1084#1103
        Width = 250
      end>
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Cyr'
    Font.Style = [fsBold]
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
  end
  object edName: TEdit
    Left = 192
    Top = 8
    Width = 345
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyPress = edNameKeyPress
  end
end
