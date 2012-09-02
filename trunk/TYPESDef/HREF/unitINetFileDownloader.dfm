object fmINetFileDownloader: TfmINetFileDownloader
  Left = 384
  Top = 313
  BorderStyle = bsDialog
  Caption = 'Downloading'
  ClientHeight = 97
  ClientWidth = 229
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbProgress: TLabel
    Left = 32
    Top = 0
    Width = 73
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Progress'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbStatus: TLabel
    Left = 3
    Top = 83
    Width = 222
    Height = 14
    AutoSize = False
    Caption = '0 / 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object sbOpen: TSpeedButton
    Left = 112
    Top = 1
    Width = 113
    Height = 25
    Caption = 'Open'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbOpenClick
  end
  object sbSaveAs: TSpeedButton
    Left = 112
    Top = 26
    Width = 113
    Height = 25
    Caption = 'Save As'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbSaveAsClick
  end
  object sbCancel: TSpeedButton
    Left = 169
    Top = 51
    Width = 56
    Height = 25
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
    Left = 2
    Top = 79
    Width = 223
    Height = 9
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 104
    Top = 0
    Width = 9
    Height = 79
    Shape = bsLeftLine
  end
  object ProgressBar: TGauge
    Left = 44
    Top = 19
    Width = 49
    Height = 49
    BackColor = clBtnFace
    BorderStyle = bsNone
    Color = clBtnFace
    ForeColor = 4194304
    Kind = gkPie
    ParentColor = False
    Progress = 0
  end
  object sbStartStop: TSpeedButton
    Left = 112
    Top = 51
    Width = 56
    Height = 25
    Caption = 'Stop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = sbStartStopClick
  end
  object tbPriority: TTrackBar
    Left = 4
    Top = 16
    Width = 33
    Height = 57
    Hint = 'download priority'
    Orientation = trVertical
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    ThumbLength = 16
    TickMarks = tmBoth
    OnChange = tbPriorityChange
  end
  object SaveDialog: TSaveDialog
    Left = 120
    Top = 24
  end
end
