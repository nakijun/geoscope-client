object IconPanelProps: TIconPanelProps
  Left = 418
  Top = 325
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 47
  ClientWidth = 104
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 104
    Height = 47
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Image: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    PopupMenu = Image_Popup
    Transparent = True
  end
  object Image_Popup: TPopupMenu
    Left = 88
    Top = 65528
    object LoadFromFileItem: TMenuItem
      Caption = 'load from file'
      OnClick = LoadFromFileItemClick
    end
    object SaveInFileItem: TMenuItem
      Caption = 'save to file'
      OnClick = SaveInFileItemClick
    end
    object ReloadItem: TMenuItem
      Caption = 'Reload'
      OnClick = ReloadItemClick
    end
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 200
    Top = 65528
  end
  object SavePictureDialog: TSavePictureDialog
    Filter = '*.bmp'
    Left = 144
    Top = 65528
  end
end
