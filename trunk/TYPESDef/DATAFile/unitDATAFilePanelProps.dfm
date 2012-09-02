object DATAFilePanelProps: TDATAFilePanelProps
  Left = 385
  Top = 221
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 50
  ClientWidth = 131
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
    Width = 131
    Height = 50
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object sbActivate: TSpeedButton
    Left = 8
    Top = 8
    Width = 113
    Height = 33
    Caption = 'START'
    PopupMenu = popupActivateBtn
    OnClick = sbActivateClick
  end
  object OpenFileDialog: TOpenDialog
    Left = 96
  end
  object popupActivateBtn: TPopupMenu
    Left = 32
    object NLoadFromFile: TMenuItem
      Caption = 'Load'
      OnClick = NLoadFromFileClick
    end
    object NEmpty: TMenuItem
      Caption = 'Clear'
      OnClick = NEmptyClick
    end
  end
end
