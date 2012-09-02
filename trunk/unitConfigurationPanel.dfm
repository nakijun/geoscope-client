object fmProgramConfigurationPanel: TfmProgramConfigurationPanel
  Left = 557
  Top = 341
  BorderStyle = bsDialog
  Caption = 'Program configuration'
  ClientHeight = 88
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    420
    88)
  PixelsPerInch = 96
  TextHeight = 16
  object ProxySpace_cbflSynchronizeUserProfileWithServer: TCheckBox
    Left = 16
    Top = 24
    Width = 393
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Save user settings on the server side'
    TabOrder = 0
    OnClick = ProxySpace_cbflSynchronizeUserProfileWithServerClick
  end
end
