object ObjectDestroying: TObjectDestroying
  Left = 454
  Top = 58
  Width = 302
  Height = 155
  Caption = 'Destroying object'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButtonDestroy: TSpeedButton
    Left = 40
    Top = 81
    Width = 89
    Height = 33
    Caption = 'Yes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButtonDestroyClick
  end
  object SpeedButton1: TSpeedButton
    Left = 152
    Top = 81
    Width = 89
    Height = 33
    Caption = 'cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Animate1: TAnimate
    Left = 0
    Top = 0
    Width = 294
    Height = 60
    Align = alTop
    Active = True
    Color = clBtnFace
    CommonAVI = aviDeleteFile
    ParentColor = False
    StopFrame = 24
    Timers = True
  end
  object Panel1: TPanel
    Left = 56
    Top = 32
    Width = 169
    Height = 49
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 169
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'Destroying'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Courier New Cyr'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 0
      Top = 24
      Width = 169
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'object'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
