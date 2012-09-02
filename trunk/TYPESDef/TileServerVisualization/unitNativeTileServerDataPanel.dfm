object NativeTileServerDataPanel: TNativeTileServerDataPanel
  Left = 535
  Top = 362
  BorderStyle = bsDialog
  Caption = 'Native tile server data panel'
  ClientHeight = 177
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    374
    177)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 345
    Height = 16
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'No server data'
  end
  object btnSave: TBitBtn
    Left = 16
    Top = 144
    Width = 161
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 208
    Top = 144
    Width = 153
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
