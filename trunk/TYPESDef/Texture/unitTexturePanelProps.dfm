object TexturePanelProps: TTexturePanelProps
  Left = 377
  Top = 224
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 234
  ClientWidth = 179
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
  object Bevel1: TBevel
    Left = 6
    Top = 62
    Width = 165
    Height = 165
    Shape = bsFrame
    Style = bsRaised
  end
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 179
    Height = 234
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object lbTexture: TLabel
    Left = 16
    Top = 16
    Width = 145
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbLoad: TSpeedButton
    Left = 8
    Top = 9
    Width = 161
    Height = 25
    Flat = True
    OnClick = sbLoadClick
  end
  object edName: TEdit
    Left = 8
    Top = 35
    Width = 161
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edNameKeyPress
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 64
    Width = 161
    Height = 161
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    TabOrder = 1
    object TextureImage: TImage
      Left = -4
      Top = -4
      Width = 161
      Height = 161
      AutoSize = True
      Center = True
    end
  end
  object OpenFileDialog: TOpenDialog
    Left = 328
    Top = 65528
  end
end
