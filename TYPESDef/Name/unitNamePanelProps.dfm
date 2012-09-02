object NamePanelProps: TNamePanelProps
  Left = 215
  Top = 202
  BorderStyle = bsNone
  Caption = 'object properties'
  ClientHeight = 36
  ClientWidth = 476
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 36
    Align = alClient
    BevelOuter = bvLowered
    BevelWidth = 3
    TabOrder = 0
    object Text: TMemo
      Left = 3
      Top = 3
      Width = 470
      Height = 30
      Align = alClient
      Alignment = taCenter
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Courier New Cyr'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Text')
      ParentFont = False
      TabOrder = 0
      OnKeyPress = TextKeyPress
    end
  end
end
