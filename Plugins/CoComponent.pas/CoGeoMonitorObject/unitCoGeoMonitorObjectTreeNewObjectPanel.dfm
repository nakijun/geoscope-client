object fmCoGeoMonitorObjectTreeNewObjectPanel: TfmCoGeoMonitorObjectTreeNewObjectPanel
  Left = 407
  Top = 293
  BorderStyle = bsDialog
  Caption = 'New object of tree'
  ClientHeight = 200
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 6
    Top = 16
    Width = 49
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 350
    Top = 16
    Width = 41
    Height = 17
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Type'
  end
  object Label3: TLabel
    Left = 6
    Top = 48
    Width = 49
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Domain'
  end
  object Label4: TLabel
    Left = 6
    Top = 80
    Width = 49
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Info'
  end
  object edName: TEdit
    Left = 56
    Top = 14
    Width = 289
    Height = 24
    TabOrder = 0
  end
  object cbKind: TComboBox
    Left = 392
    Top = 14
    Width = 153
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 1
  end
  object edDomain: TEdit
    Left = 56
    Top = 46
    Width = 489
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object memoInfo: TMemo
    Left = 56
    Top = 80
    Width = 489
    Height = 73
    TabOrder = 3
  end
  object btnOK: TBitBtn
    Left = 320
    Top = 160
    Width = 105
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 440
    Top = 159
    Width = 105
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
end
