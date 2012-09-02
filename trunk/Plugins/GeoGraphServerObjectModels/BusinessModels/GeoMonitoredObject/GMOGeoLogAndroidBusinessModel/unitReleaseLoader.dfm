object fmReleaseLoader: TfmReleaseLoader
  Left = 448
  Top = 456
  BorderStyle = bsDialog
  Caption = 'Installer'
  ClientHeight = 62
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbStatus: TLabel
    Left = 8
    Top = 40
    Width = 257
    Height = 14
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object sbCancel: TSpeedButton
    Left = 272
    Top = 8
    Width = 56
    Height = 46
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbCancelClick
  end
  object Bevel1: TBevel
    Left = 8
    Top = 32
    Width = 257
    Height = 9
    Shape = bsTopLine
  end
  object ProgressBar: TGauge
    Left = 8
    Top = 8
    Width = 257
    Height = 22
    BackColor = clBtnFace
    Color = clBtnFace
    ForeColor = 4194304
    ParentColor = False
    Progress = 0
  end
end
