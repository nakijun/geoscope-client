object fmObjectTrackDownload: TfmObjectTrackDownload
  Left = 424
  Top = 158
  Width = 217
  Height = 351
  Caption = 'Download object track'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 16
    Caption = 'Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 184
    Width = 95
    Height = 16
    Caption = 'Download to file'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MonthCalendar: TMonthCalendar
    Left = 8
    Top = 24
    Width = 191
    Height = 154
    Date = 39218.853946388890000000
    TabOrder = 0
    OnClick = MonthCalendarClick
  end
  object edUserPassword: TEdit
    Left = 8
    Top = 256
    Width = 193
    Height = 24
    AutoSize = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 3
  end
  object edDownloadFile: TEdit
    Left = 8
    Top = 200
    Width = 193
    Height = 24
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object bbDownloadTrack: TBitBtn
    Left = 8
    Top = 288
    Width = 193
    Height = 25
    Caption = 'Download'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = bbDownloadTrackClick
  end
  object cbUserObjectOwnerPassword: TCheckBox
    Left = 8
    Top = 232
    Width = 193
    Height = 17
    Caption = 'Use object owner password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = cbUserObjectOwnerPasswordClick
  end
end
