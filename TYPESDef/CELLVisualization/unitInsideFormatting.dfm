object fmInsideFormatting: TfmInsideFormatting
  Left = 195
  Top = 159
  BorderStyle = bsDialog
  Caption = 'objects formatting'
  ClientHeight = 450
  ClientWidth = 737
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
    Width = 737
    Height = 450
    Align = alClient
    BevelOuter = bvNone
    Color = 11711154
    TabOrder = 0
    object pnl: TGroupBox
      Left = 8
      Top = 8
      Width = 721
      Height = 121
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 97
        Width = 74
        Height = 16
        Caption = 'space factor'
      end
      object sbStartStop: TSpeedButton
        Left = 616
        Top = 80
        Width = 97
        Height = 33
        Caption = 'START'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbStartStopClick
      end
      object cbTypes: TComboBoxEx
        Left = 8
        Top = 40
        Width = 345
        Height = 25
        ItemsEx = <
          item
          end>
        Style = csExDropDownList
        StyleEx = [csExNoEditImage, csExNoEditImageIndent, csExPathWordBreak]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 0
        DropDownCount = 20
      end
      object rbByType: TRadioButton
        Left = 8
        Top = 24
        Width = 185
        Height = 17
        Caption = 'Built-In types'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = rbByTypeClick
      end
      object rbByCoType: TRadioButton
        Left = 368
        Top = 24
        Width = 201
        Height = 17
        Caption = 'Co-Component types'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = rbByCoTypeClick
      end
      object cbCoTypes: TComboBoxEx
        Left = 368
        Top = 40
        Width = 345
        Height = 25
        ItemsEx = <
          item
          end>
        Style = csExDropDownList
        StyleEx = [csExNoEditImage, csExNoEditImageIndent, csExPathWordBreak]
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 3
        DropDownCount = 20
      end
      object cbScaling: TCheckBox
        Left = 8
        Top = 80
        Width = 65
        Height = 17
        Caption = 'Scaling'
        TabOrder = 4
        OnClick = cbScalingClick
      end
      object edScalingAlignFactor: TEdit
        Left = 104
        Top = 96
        Width = 65
        Height = 19
        AutoSize = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 136
      Width = 721
      Height = 305
      ActivePage = tsProcessing
      TabOrder = 1
      object tsProcessing: TTabSheet
        Caption = 'Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object lvResult: TListView
          Left = 0
          Top = 0
          Width = 713
          Height = 277
          Align = alClient
          Columns = <
            item
              Caption = 'object name'
              Width = 350
            end
            item
              Caption = 'Column'
              Width = 90
            end
            item
              Caption = 'Row'
            end
            item
              Caption = 'Result'
              Width = 150
            end>
          DragMode = dmAutomatic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = lvResultDblClick
        end
      end
    end
  end
end
