object CasePanelProps: TCasePanelProps
  Left = 244
  Top = 253
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 106
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 0
    Top = 0
    Width = 272
    Height = 106
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object RxLabel5: TRxLabel
    Left = 4
    Top = 30
    Width = 69
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'Case'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ShadowColor = clBtnShadow
    ShadowPos = spRightBottom
  end
  object DBEditName: TDBEdit
    Left = 72
    Top = 22
    Width = 57
    Height = 28
    DataField = 'name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEditDescr: TDBEdit
    Left = 8
    Top = 54
    Width = 121
    Height = 28
    DataField = 'descr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object BitBtnDistrLines: TBitBtn
    Left = 144
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Distr-lines ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnDistrLinesClick
  end
  object BitBtnResource: TBitBtn
    Left = 144
    Top = 40
    Width = 121
    Height = 25
    Caption = 'Resources ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtnResourceClick
  end
  object bbStatistics: TBitBtn
    Left = 143
    Top = 72
    Width = 121
    Height = 25
    Caption = 'Statistics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = bbStatisticsClick
  end
end
