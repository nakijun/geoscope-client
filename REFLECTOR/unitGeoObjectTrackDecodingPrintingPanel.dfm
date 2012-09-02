object fmGeoObjectTrackDecodingPrintingPanel: TfmGeoObjectTrackDecodingPrintingPanel
  Left = 292
  Top = 162
  Width = 1007
  Height = 750
  Caption = 'Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 233
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      999
      233)
    object cbStopsAndMovementsAnalysis: TCheckBox
      Left = 16
      Top = 8
      Width = 241
      Height = 17
      Caption = 'StopsAndMovements Analysis'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbFuelConsumptionAnalysis: TCheckBox
      Left = 352
      Top = 8
      Width = 241
      Height = 17
      Caption = 'Fuel Consumption Analysis'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cbBusinessModelEvents: TCheckBox
      Left = 696
      Top = 8
      Width = 241
      Height = 17
      Caption = 'Events'
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 32
      Width = 982
      Height = 193
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Fragments '
      TabOrder = 3
      object lvFragments: TListView
        Left = 2
        Top = 18
        Width = 978
        Height = 173
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            Caption = 'Description'
            Width = 2000
          end>
        ColumnClick = False
        GridLines = True
        HideSelection = False
        ParentShowHint = False
        PopupMenu = lvFragments_PopupMenu
        ShowHint = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 682
    Width = 999
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      999
      41)
    object btnPrint: TBitBtn
      Left = 713
      Top = 8
      Width = 129
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Print'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnPrintClick
    end
    object btnExit: TBitBtn
      Left = 854
      Top = 8
      Width = 129
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Exit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnExitClick
    end
    object btnCompile: TBitBtn
      Left = 8
      Top = 8
      Width = 129
      Height = 27
      Caption = 'Process'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCompileClick
    end
  end
  object lvFragments_PopupMenu: TPopupMenu
    Left = 72
    Top = 88
    object Removeselecteditem1: TMenuItem
      Caption = 'Remove selected item'
      OnClick = Removeselecteditem1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RemoveAll1: TMenuItem
      Caption = 'Remove All'
      OnClick = RemoveAll1Click
    end
  end
end
