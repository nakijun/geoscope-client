object fmGMO1VRMControlPanelOperationPanel: TfmGMO1VRMControlPanelOperationPanel
  Left = 546
  Top = 288
  BorderStyle = bsDialog
  Caption = 'Operation in progress'
  ClientHeight = 86
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 364
    Top = 0
    Width = 101
    Height = 86
    Align = alRight
    TabOrder = 0
    object btnCancel: TBitBtn
      Left = 14
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 86
    Align = alClient
    TabOrder = 1
    object Animate: TAnimate
      Left = 1
      Top = 1
      Width = 362
      Height = 64
      Align = alClient
      StopFrame = 75
    end
    object stStatus: TStaticText
      Left = 1
      Top = 65
      Width = 362
      Height = 20
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object Starter: TTimer
    Enabled = False
    Interval = 333
    OnTimer = StarterTimer
  end
end
