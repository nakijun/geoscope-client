object HyperTextPanelProps: THyperTextPanelProps
  Left = 215
  Top = 203
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 247
  ClientWidth = 432
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
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object bbLoadFromFile: TBitBtn
      Left = 16
      Top = 16
      Width = 97
      Height = 25
      Caption = 'Load from file'
      TabOrder = 0
      OnClick = bbLoadFromFileClick
    end
    object bbSaveToFile: TBitBtn
      Left = 120
      Top = 16
      Width = 97
      Height = 25
      Caption = 'Save to file'
      TabOrder = 1
      OnClick = bbSaveToFileClick
    end
    object bbReload: TBitBtn
      Left = 224
      Top = 16
      Width = 97
      Height = 25
      Caption = 'Reload'
      TabOrder = 2
      OnClick = bbReloadClick
    end
  end
  object Popup: TPopupMenu
    Left = 24
    Top = 80
    object Loadfromfile1: TMenuItem
      Caption = 'Load from file'
      OnClick = Loadfromfile1Click
    end
    object Saveintothefile1: TMenuItem
      Caption = 'Save into the file'
      OnClick = Saveintothefile1Click
    end
    object Reload1: TMenuItem
      Caption = 'Reload'
      OnClick = Reload1Click
    end
  end
  object OpenDialog: TOpenDialog
    Left = 88
    Top = 80
  end
  object SaveDialog: TSaveDialog
    Left = 152
    Top = 80
  end
end
