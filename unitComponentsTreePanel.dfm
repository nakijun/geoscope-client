object fmComponentsTreePanel: TfmComponentsTreePanel
  Left = 455
  Top = 303
  Width = 368
  Height = 373
  BorderStyle = bsSizeToolWin
  Caption = 'COMPONENTS Tree'
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
  object tvComponents: TTreeView
    Left = 0
    Top = 0
    Width = 360
    Height = 339
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Courier New'
    Font.Style = [fsItalic]
    Indent = 19
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    OnDblClick = tvComponentsDblClick
  end
end
