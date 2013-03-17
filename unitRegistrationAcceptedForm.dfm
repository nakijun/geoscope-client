object fmRegistrationAccepted: TfmRegistrationAccepted
  Left = 238
  Top = 204
  BorderStyle = bsDialog
  ClientHeight = 232
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001004020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000888888800000000000000000000008888888888888000000000000
    0000088800000008888888000000000000008000222222200088888000000000
    0000022222222222220088880000000000022222222222222222088880000000
    0022222222222222222220888800000002222222222222222222220888000000
    2222222222222222222222208880000022222222227F72222222222088800002
    2222222227FFF2222222222208800002222222227FFFF7222222222208880002
    22222227FFFFFF2222222222088800222222227FFF7FFF722222222220880022
    222227FFF72FFFF2222222222088002222222FFF7227FFF72222222220880022
    222222222222FFFF22222222208800222222222222227FFF7222222220880022
    2222222222222FFFF22222222080002222222222222227FFF722222220800002
    22222222222222FFFF22222208800002222222222222227FFF72222208000002
    222222222222222FFFF222220800000022222222222222222222222080000000
    2222222222222222222222200000000002222222222222222222220000000000
    0022222222222222222220000000000000022222222222222222000000000000
    0000022222222222220000000000000000000000222222200000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFC
    07FFFFE000FFFF80003FFF00001FFE00000FFC000007F8000003F0000003E000
    0001E0000001C0000001C0000000C00000008000000080000000800000008000
    0000800000008000000180000001C0000001C0000003C0000003E0000007E000
    000FF000001FF800003FFC00007FFE0000FFFF8003FFFFF01FFFFFFFFFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 230
    Top = 8
    Width = 64
    Height = 32
    Picture.Data = {
      055449636F6E0000010001004020100000000000E80200001600000028000000
      2000000040000000010004000000000000020000000000000000000000000000
      0000000000000000000080000080000000808000800000008000800080800000
      C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
      FFFFFF0000000000000000888888800000000000000000000008888888888888
      0000000000000000088800000008888888000000000000008000222222200088
      8880000000000000022222222222220088880000000000022222222222222222
      0888800000000022222222222222222220888800000002222222222222222222
      2208880000002222222222222222222222208880000022222222227F72222222
      2220888000022222222227FFF2222222222208800002222222227FFFF7222222
      22220888000222222227FFFFFF2222222222088800222222227FFF7FFF722222
      222220880022222227FFF72FFFF2222222222088002222222FFF7227FFF72222
      222220880022222222222222FFFF22222222208800222222222222227FFF7222
      2222208800222222222222222FFFF22222222080002222222222222227FFF722
      22222080000222222222222222FFFF22222208800002222222222222227FFF72
      222208000002222222222222222FFFF222220800000022222222222222222222
      2220800000002222222222222222222222200000000002222222222222222222
      2200000000000022222222222222222220000000000000022222222222222222
      0000000000000000022222222222220000000000000000000000222222200000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FFFC07FFFFE000FFFF80003FFF00001FFE00000FFC000007F8000003
      F0000003E0000001E0000001C0000001C0000000C00000008000000080000000
      8000000080000000800000008000000180000001C0000001C0000003C0000003
      E0000007E000000FF000001FF800003FFC00007FFE0000FFFF8003FFFFF01FFF
      FFFFFFFF}
    Proportional = True
    Stretch = True
  end
  object RxLabel3: TRxLabel
    Left = 176
    Top = 48
    Width = 174
    Height = 24
    Caption = 'registration success'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = 15658734
    ShadowSize = 0
    ShadowPos = spRightBottom
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 16
    Top = 104
    Width = 497
    Height = 9
    Shape = bsTopLine
    Style = bsRaised
  end
  object lbNewUser: TLabel
    Left = 16
    Top = 72
    Width = 497
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object memoInfo: TMemo
    Left = 16
    Top = 112
    Width = 497
    Height = 81
    Alignment = taCenter
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Your user has been registered in project ! '
      'After leaving this session you can enter again using your '
      '"UserName" and "Password"')
    ParentFont = False
    TabOrder = 0
  end
  object bbExit: TBitBtn
    Left = 440
    Top = 200
    Width = 73
    Height = 25
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bbExitClick
  end
  object bbOK: TBitBtn
    Left = 176
    Top = 200
    Width = 153
    Height = 25
    Caption = 'Continue'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bbOKClick
  end
  object bbReconnect: TBitBtn
    Left = 16
    Top = 200
    Width = 153
    Height = 25
    Caption = 're-login new user'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = bbReconnectClick
  end
end