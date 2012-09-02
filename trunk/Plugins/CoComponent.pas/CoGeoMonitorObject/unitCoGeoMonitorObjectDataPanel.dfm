object fmCoGeoMonitorObjectDataPanel: TfmCoGeoMonitorObjectDataPanel
  Left = 448
  Top = 294
  Width = 275
  Height = 289
  Caption = 'CoGeoMonitorObject Data-Panel'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 267
    Height = 262
    ActivePage = tsServer
    Align = alClient
    TabOrder = 0
    object tsServer: TTabSheet
      Caption = 'Server'
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 121
        Height = 16
        AutoSize = False
        Caption = 'Server type'
      end
      object Label2: TLabel
        Left = 24
        Top = 48
        Width = 121
        Height = 16
        AutoSize = False
        Caption = 'Server ID'
      end
      object Label3: TLabel
        Left = 24
        Top = 80
        Width = 121
        Height = 16
        AutoSize = False
        Caption = 'Server Object ID'
      end
      object Label4: TLabel
        Left = 24
        Top = 104
        Width = 121
        Height = 16
        AutoSize = False
        Caption = 'Server Object type'
      end
      object edServerType: TEdit
        Left = 150
        Top = 21
        Width = 83
        Height = 24
        TabOrder = 0
      end
      object edServerID: TEdit
        Left = 150
        Top = 45
        Width = 83
        Height = 24
        TabOrder = 1
      end
      object edServerObjectID: TEdit
        Left = 150
        Top = 77
        Width = 83
        Height = 24
        TabOrder = 2
      end
      object edServerObjectType: TEdit
        Left = 150
        Top = 101
        Width = 83
        Height = 24
        TabOrder = 3
      end
      object bbObjectControl: TBitBtn
        Left = 24
        Top = 184
        Width = 209
        Height = 25
        Caption = 'Object Control'
        TabOrder = 4
      end
      object bbSetServerParameters: TBitBtn
        Left = 24
        Top = 136
        Width = 209
        Height = 25
        Caption = 'Set parameters'
        TabOrder = 5
        OnClick = bbSetServerParametersClick
      end
    end
  end
end
