object fmGeoObjectTracksReportPanel: TfmGeoObjectTracksReportPanel
  Left = 292
  Top = 162
  Width = 1007
  Height = 686
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 999
    Height = 33
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
      Left = 752
      Top = 8
      Width = 241
      Height = 17
      Caption = 'Fuel Consumption Analysis'
      TabOrder = 1
      Visible = False
    end
    object cbBusinessModelEvents: TCheckBox
      Left = 256
      Top = 8
      Width = 241
      Height = 17
      Caption = 'Events'
      TabOrder = 2
    end
    object cbResolvePositionToLocation: TCheckBox
      Left = 496
      Top = 8
      Width = 241
      Height = 17
      Caption = 'Resolve position to name'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 618
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
end
