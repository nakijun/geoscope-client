object fmCheckGeodesyPoints: TfmCheckGeodesyPoints
  Left = 14
  Top = 24
  Width = 633
  Height = 701
  Caption = 'Check geodesy points of a linear approximation crd system'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object pbMap: TPaintBox
    Left = 0
    Top = 89
    Width = 625
    Height = 583
    Align = alClient
    PopupMenu = pbMap_PopupMenu
    OnDblClick = pbMapDblClick
    OnMouseDown = pbMapMouseDown
    OnMouseMove = pbMapMouseMove
    OnMouseUp = pbMapMouseUp
    OnPaint = pbMapPaint
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 625
    Height = 89
    Align = alTop
    Caption = ' Parameters '
    TabOrder = 0
    object lbDeviationNearItemsCount: TLabel
      Left = 601
      Top = 23
      Width = 10
      Height = 24
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 368
      Top = 24
      Width = 100
      Height = 16
      Caption = 'Near items count'
      Visible = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 35
      Height = 16
      Caption = 'Scale'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 78
      Height = 16
      Caption = 'Map info size'
    end
    object tbMapScale: TTrackBar
      Left = 2
      Top = 64
      Width = 621
      Height = 23
      Align = alBottom
      Max = 1000
      Position = 500
      TabOrder = 0
      OnChange = tbMapScaleChange
    end
    object tbDeviationNearItems: TTrackBar
      Left = 472
      Top = 23
      Width = 129
      Height = 23
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      ThumbLength = 16
      Visible = False
      OnChange = tbDeviationNearItemsChange
    end
    object tbMapInfoSize: TTrackBar
      Left = 88
      Top = 23
      Width = 129
      Height = 23
      Max = 1000
      ParentShowHint = False
      Position = 100
      ShowHint = False
      TabOrder = 2
      ThumbLength = 16
      OnChange = tbMapInfoSizeChange
    end
  end
  object pbMap_PopupMenu: TPopupMenu
    Left = 16
    Top = 104
    object Enableselecteditem1: TMenuItem
      Caption = 'Enable selected item'
      OnClick = Enableselecteditem1Click
    end
    object Disableselecteditem1: TMenuItem
      Caption = 'Disable selected item'
      OnClick = Disableselecteditem1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Disablebaditem1: TMenuItem
      Caption = 'Disable bad item'
      OnClick = Disablebaditem1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Enableall1: TMenuItem
      Caption = 'Enable All'
      OnClick = Enableall1Click
    end
    object Disableall1: TMenuItem
      Caption = 'Disable All'
      OnClick = Disableall1Click
    end
  end
end
