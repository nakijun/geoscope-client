object HREFPanelProps: THREFPanelProps
  Left = 244
  Top = 175
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 79
  ClientWidth = 167
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
    Width = 167
    Height = 79
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 8
    Top = 2
    Width = 52
    Height = 16
    Caption = 'HyperRef'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object sbOpen: TSpeedButton
    Left = 8
    Top = 48
    Width = 73
    Height = 25
    Caption = 'Open'
    OnClick = sbOpenClick
  end
  object sbDownload: TSpeedButton
    Left = 88
    Top = 48
    Width = 73
    Height = 25
    Caption = 'Download'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbDownloadClick
  end
  object edURL: TEdit
    Left = 8
    Top = 21
    Width = 153
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edURLKeyPress
  end
  object cbAutostart: TCheckBox
    Left = 80
    Top = 3
    Width = 81
    Height = 17
    Caption = 'Auto start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object OpenFileDialog: TOpenDialog
    Left = 328
    Top = 65528
  end
end
