object fmGeoObjectTrackPanel: TfmGeoObjectTrackPanel
  Left = 254
  Top = 330
  AutoScroll = False
  Caption = 'Track properties'
  ClientHeight = 55
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 37
    Height = 16
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 264
    Top = 0
    Width = 32
    Height = 16
    Caption = 'Color'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbColor: TLabel
    Left = 264
    Top = 16
    Width = 33
    Height = 25
    AutoSize = False
  end
  object sbChangeColor: TSpeedButton
    Left = 263
    Top = 15
    Width = 35
    Height = 27
    Flat = True
    OnClick = sbChangeColorClick
  end
  object edTrackName: TEdit
    Left = 8
    Top = 16
    Width = 249
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edTrackNameKeyPress
  end
  object bbOk: TBitBtn
    Left = 312
    Top = 16
    Width = 41
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = bbOkClick
  end
  object ColorDialog: TColorDialog
    Left = 176
  end
end
