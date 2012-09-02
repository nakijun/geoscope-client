object fmUserHintPanel: TfmUserHintPanel
  Left = 254
  Top = 330
  AutoScroll = False
  Caption = 'User hint properties (use context menu)'
  ClientHeight = 114
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object imgInfoImage: TImage
    Left = 8
    Top = 32
    Width = 32
    Height = 32
    PopupMenu = PopupMenu
    Transparent = True
  end
  object edInfoText: TEdit
    Left = 48
    Top = 35
    Width = 353
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
  end
  object bbOk: TBitBtn
    Left = 408
    Top = 35
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
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 457
    Height = 25
    Align = alBottom
    TabOrder = 2
    object cbTracking: TCheckBox
      Left = 8
      Top = 4
      Width = 217
      Height = 17
      Caption = 'Show and save track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbAlwaysCheckVisibility: TCheckBox
      Left = 232
      Top = 4
      Width = 217
      Height = 17
      Caption = 'Always check visibility'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 176
    Top = 8
  end
  object ColorDialog: TColorDialog
    Left = 216
    Top = 8
  end
  object PopupMenu: TPopupMenu
    Left = 88
    Top = 8
    object ChangeImage1: TMenuItem
      Caption = 'Change Image'
      OnClick = ChangeImage1Click
    end
    object ClearImage1: TMenuItem
      Caption = 'Clear Image'
      OnClick = ClearImage1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Changetextfont1: TMenuItem
      Caption = 'Change text font'
      OnClick = Changetextfont1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Changetextfontcolor1: TMenuItem
      Caption = 'Change background color'
      OnClick = Changetextfontcolor1Click
    end
    object Clearbackgroundcolor1: TMenuItem
      Caption = 'Clear background color'
      OnClick = Clearbackgroundcolor1Click
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 136
    Top = 8
  end
end
