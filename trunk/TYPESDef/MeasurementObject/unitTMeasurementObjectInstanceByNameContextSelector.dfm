object fmTMeasurementObjectInstanceByNameContextSelector: TfmTMeasurementObjectInstanceByNameContextSelector
  Left = 485
  Top = 232
  Width = 1091
  Height = 682
  Caption = 'Measurement Objects'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lvObjects: TListView
    Left = 0
    Top = 33
    Width = 1083
    Height = 622
    Align = alClient
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Name'
        Width = 450
      end
      item
        Caption = 'Domains'
        Width = 500
      end
      item
        Caption = 'GUID'
        Width = 1
      end
      item
        Caption = 'id'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lvObjectsDblClick
    OnKeyDown = lvObjectsKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1083
    Height = 33
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 97
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Name Context'
    end
    object edNameContext: TEdit
      Left = 112
      Top = 6
      Width = 153
      Height = 22
      AutoSize = False
      TabOrder = 0
      OnKeyPress = edNameContextKeyPress
    end
  end
end
