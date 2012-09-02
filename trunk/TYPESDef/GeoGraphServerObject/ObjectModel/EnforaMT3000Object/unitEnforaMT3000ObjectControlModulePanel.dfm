object EnforaMT3000ObjectControlModulePanel: TEnforaMT3000ObjectControlModulePanel
  Left = 569
  Top = 311
  Width = 385
  Height = 187
  Caption = 'Control module panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 377
    Height = 65
    Align = alTop
    Caption = ' command '
    TabOrder = 0
    DesignSize = (
      377
      65)
    object edCommand: TEdit
      Left = 16
      Top = 24
      Width = 345
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyPress = edCommandKeyPress
    end
  end
  object memoLog: TMemo
    Left = 0
    Top = 65
    Width = 377
    Height = 95
    Align = alClient
    TabOrder = 1
    WordWrap = False
  end
end
