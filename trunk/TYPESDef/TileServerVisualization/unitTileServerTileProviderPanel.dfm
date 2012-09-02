object fmTileServerTileProviderPanel: TfmTileServerTileProviderPanel
  Left = 525
  Top = 251
  BorderStyle = bsDialog
  Caption = 'Provider properties'
  ClientHeight = 355
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    329
    355)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 13
    Height = 16
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 16
    Top = 120
    Width = 37
    Height = 16
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 16
    Top = 168
    Width = 27
    Height = 16
    Caption = 'URL'
  end
  object Label4: TLabel
    Left = 16
    Top = 216
    Width = 42
    Height = 16
    Caption = 'Format'
  end
  object Label5: TLabel
    Left = 16
    Top = 16
    Width = 32
    Height = 16
    Caption = 'Type'
  end
  object edID: TEdit
    Left = 16
    Top = 80
    Width = 297
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 1
  end
  object edName: TEdit
    Left = 16
    Top = 136
    Width = 297
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object edURL: TEdit
    Left = 16
    Top = 184
    Width = 297
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object edFormat: TEdit
    Left = 16
    Top = 232
    Width = 297
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object btnSave: TBitBtn
    Left = 16
    Top = 304
    Width = 137
    Height = 25
    Caption = 'Save'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 176
    Top = 304
    Width = 137
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Cancel'
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object cbIndependentLevels: TCheckBox
    Left = 16
    Top = 272
    Width = 297
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Independent levels'
    TabOrder = 5
  end
  object edType: TEdit
    Left = 16
    Top = 32
    Width = 297
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
end
