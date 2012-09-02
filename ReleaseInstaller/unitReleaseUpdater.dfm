object fmReleaseUpdater: TfmReleaseUpdater
  Left = 350
  Top = 259
  BorderStyle = bsDialog
  Caption = 'Release update panel'
  ClientHeight = 167
  ClientWidth = 550
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    550
    167)
  PixelsPerInch = 96
  TextHeight = 16
  object stInfo: TStaticText
    Left = 0
    Top = 0
    Width = 550
    Height = 41
    Align = alTop
    AutoSize = False
    BorderStyle = sbsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btnInstall: TButton
    Left = 8
    Top = 128
    Width = 105
    Height = 33
    Caption = 'Install'
    TabOrder = 1
    OnClick = btnInstallClick
  end
  object btnCancel: TButton
    Left = 120
    Top = 128
    Width = 105
    Height = 33
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object cbSupressNewReleases: TCheckBox
    Left = 232
    Top = 128
    Width = 311
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'supress new release notifications'
    TabOrder = 3
    OnClick = cbSupressNewReleasesClick
  end
  object cbSupressNewUpdates: TCheckBox
    Left = 232
    Top = 144
    Width = 311
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'supress new update notifications'
    TabOrder = 4
    OnClick = cbSupressNewUpdatesClick
  end
  object memoDescription: TMemo
    Left = 0
    Top = 41
    Width = 550
    Height = 80
    Align = alTop
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 5
  end
end
