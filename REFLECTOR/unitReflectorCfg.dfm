object fmReflectorCfg: TfmReflectorCfg
  Left = 141
  Top = 227
  BorderStyle = bsDialog
  Caption = 'Reflector configuration'
  ClientHeight = 321
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 56
    Top = 280
    Width = 625
    Height = 33
    Caption = 'Accept Changes'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    AutoSize = True
    Picture.Data = {
      055449636F6E0000010001002020100000000000E80200001600000028000000
      2000000040000000010004000000000080020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000008870000000000000000088
      7000000000887000000000000000008870000000008870000000000000000088
      7000000000887000000000000000008870000000000000000000000000000000
      0000000000000000000000000000000000000000008800000000000000088000
      0000000000880700000000000008807000000000008807000000080000088070
      0000000000880700000008000008807000000000008807000000080000088070
      0000000000880700000008000008807000000000000007000000000000000070
      0000000000000700000000000000007000000000000000000000000000000000
      0000000000000088870000000088870000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000007700000000007700000000000000000077000000000077000
      0000000000000007700000000007700000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF803FF803803FF803803FF803
      803FF803803FF803800380038003800380038003800000038000000380000003
      8000000380000003C0000007C0000007C0000007F803803FF803803FF803803F
      F803803FFC07C07FFC07C07FFC07C07FFC07C07FFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF}
  end
  object Bevel2: TBevel
    Left = 8
    Top = 48
    Width = 81
    Height = 9
    Shape = bsTopLine
    Style = bsRaised
  end
  object Bevel3: TBevel
    Left = 48
    Top = 16
    Width = 9
    Height = 65
    Shape = bsLeftLine
    Style = bsRaised
  end
  object GroupBox1: TGroupBox
    Left = 56
    Top = 56
    Width = 625
    Height = 217
    Caption = ' Reflector Flags'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 225
      Top = 16
      Width = 7
      Height = 193
      Shape = bsLeftLine
    end
    object cbDisableObjectChanging: TCheckBox
      Left = 16
      Top = 24
      Width = 201
      Height = 17
      Caption = 'Disable objects changing'
      TabOrder = 0
    end
    object cbHideControlBars: TCheckBox
      Left = 16
      Top = 48
      Width = 201
      Height = 17
      Caption = 'Hide control bars'
      TabOrder = 1
    end
    object cbHideControlPage: TCheckBox
      Left = 16
      Top = 72
      Width = 201
      Height = 17
      Caption = 'Hide "Control" page'
      TabOrder = 2
    end
    object cbHideBookmarksPage: TCheckBox
      Left = 16
      Top = 96
      Width = 201
      Height = 17
      Caption = 'Hide "Bookmarks" Page'
      TabOrder = 3
    end
    object cbHideEditPage: TCheckBox
      Left = 16
      Top = 144
      Width = 201
      Height = 17
      Caption = 'Hide "Edit" Page'
      TabOrder = 4
    end
    object cbHideViewPage: TCheckBox
      Left = 16
      Top = 120
      Width = 201
      Height = 17
      Caption = 'Hide "View" Page'
      TabOrder = 5
    end
    object cbHideOtherPage: TCheckBox
      Left = 16
      Top = 192
      Width = 201
      Height = 17
      Caption = 'Hide "Other" Page'
      TabOrder = 6
    end
    object cbHideCreateButton: TCheckBox
      Left = 240
      Top = 24
      Width = 377
      Height = 17
      Caption = 'Hide "Create" Button'
      TabOrder = 7
    end
    object cbDisableNavigate: TCheckBox
      Left = 240
      Top = 48
      Width = 377
      Height = 17
      Caption = 'Disable Navigate'
      TabOrder = 8
    end
    object cbDisableMoveNavigate: TCheckBox
      Left = 240
      Top = 72
      Width = 377
      Height = 17
      Caption = 'Disable "Move" Navigate'
      TabOrder = 9
    end
    object cbHideCoordinateMeshPage: TCheckBox
      Left = 16
      Top = 168
      Width = 201
      Height = 17
      Caption = 'Hide "Coordinate Mesh" Page'
      TabOrder = 10
    end
  end
end
