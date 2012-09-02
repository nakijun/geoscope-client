object fmTileServerVisualizationWrapper: TfmTileServerVisualizationWrapper
  Left = 193
  Top = 103
  BorderStyle = bsToolWindow
  Caption = 'Picture wrapper'
  ClientHeight = 208
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 16
    Caption = 'My points'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 224
    Top = 8
    Width = 76
    Height = 16
    Caption = 'Target points'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 200
    Top = 88
    Width = 18
    Height = 16
    Caption = '=>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object sbProcess: TSpeedButton
    Left = 144
    Top = 176
    Width = 129
    Height = 25
    Caption = 'Process'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sbProcessClick
  end
  object sbPrepareFromContainer: TSpeedButton
    Left = 8
    Top = 167
    Width = 25
    Height = 25
    Hint = 'Prepare points from container'
    Caption = '[..]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbPrepareFromContainerClick
  end
  object sbPreparefromClipboardVisualizationContainer: TSpeedButton
    Left = 384
    Top = 167
    Width = 25
    Height = 25
    Hint = 'Prepare from clipboard visualization container'
    Caption = '[..]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = sbPreparefromClipboardVisualizationContainerClick
  end
  object memoMyPoints: TMemo
    Left = 8
    Top = 24
    Width = 185
    Height = 145
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    WordWrap = False
  end
  object memoTargetPoints: TMemo
    Left = 224
    Top = 24
    Width = 185
    Height = 145
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WordWrap = False
  end
end
