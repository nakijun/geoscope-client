object GMOHeatMeterBusinessModelAnalysisPanel: TGMOHeatMeterBusinessModelAnalysisPanel
  Left = 368
  Top = 199
  Width = 728
  Height = 564
  Caption = 'Analysis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 712
    Height = 480
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnMouseMove = PaintBoxMouseMove
    OnPaint = PaintBoxPaint
  end
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 712
    Height = 46
    Align = alBottom
    TabOrder = 0
    object btnCreateHourXLSReport: TBitBtn
      Left = 8
      Top = 8
      Width = 169
      Height = 33
      Caption = 'Create hour report'
      TabOrder = 1
      OnClick = btnCreateHourXLSReportClick
    end
    object btnCreateDayXLSReport: TBitBtn
      Left = 184
      Top = 8
      Width = 169
      Height = 33
      Caption = 'Create day report'
      TabOrder = 0
      OnClick = btnCreateDayXLSReportClick
    end
  end
end
