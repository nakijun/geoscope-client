object Int32VarPanelProps: TInt32VarPanelProps
  Left = 238
  Top = 162
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 50
  ClientWidth = 178
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
    Width = 178
    Height = 50
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lbSetTimeStamp: TLabel
    Left = 8
    Top = 32
    Width = 161
    Height = 16
    Alignment = taCenter
    AutoSize = False
    Caption = 'Value'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edValue: TEdit
    Left = 80
    Top = 5
    Width = 89
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edValueKeyPress
  end
end
