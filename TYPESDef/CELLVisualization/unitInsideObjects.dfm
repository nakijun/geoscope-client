object fmInsideObjects: TfmInsideObjects
  Left = 131
  Top = 81
  BorderStyle = bsDialog
  Caption = 'inside objects'
  ClientHeight = 556
  ClientWidth = 736
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
    Width = 736
    Height = 556
    Align = alClient
    BevelOuter = bvNone
    Color = 14012865
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 528
      Top = 524
      Width = 201
      Height = 25
      Caption = 'START SELECTED OBJECTS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbStartStopClick
    end
    object pnl: TGroupBox
      Left = 8
      Top = 0
      Width = 721
      Height = 113
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbStartStop: TSpeedButton
        Left = 640
        Top = 80
        Width = 73
        Height = 25
        Caption = 'FIND'
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
    end
    object PageControl1: TPageControl
      Left = 8
      Top = 123
      Width = 721
      Height = 401
      ActivePage = tsFound
      TabOrder = 1
      object tsFound: TTabSheet
        Caption = 'Objects found'
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
          Height = 373
          Align = alClient
          Checkboxes = True
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
    object lvResult_bbMarkAll: TBitBtn
      Left = 90
      Top = 124
      Width = 57
      Height = 19
      Caption = 'mark all'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = lvResult_bbMarkAllClick
    end
    object lvResult_bbClearAll: TBitBtn
      Left = 147
      Top = 124
      Width = 57
      Height = 19
      Caption = 'clear all'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = lvResult_bbClearAllClick
    end
  end
end
