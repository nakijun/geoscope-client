object DemandPanelProps: TDemandPanelProps
  Left = 291
  Top = 209
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 106
  ClientWidth = 256
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
    Width = 256
    Height = 106
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 32
    Width = 241
    Height = 33
    Caption = 'goods demand'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object LabelOwner: TLabel
    Left = 8
    Top = 0
    Width = 241
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'LabelOwner'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 80
    Width = 241
    Height = 18
    Caption = 'offers search ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
end
