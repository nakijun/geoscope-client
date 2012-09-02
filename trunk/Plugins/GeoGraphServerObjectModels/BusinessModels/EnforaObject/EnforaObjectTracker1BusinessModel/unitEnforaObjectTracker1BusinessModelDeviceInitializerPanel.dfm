object fmEnforaObjectTracker1BusinessModelDeviceInitializerPanel: TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel
  Left = 724
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Device initializer'
  ClientHeight = 299
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 290
    Height = 161
    Align = alTop
    Caption = ' Parameters '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      290
      161)
    object Label7: TLabel
      Left = 14
      Top = 24
      Width = 257
      Height = 16
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'ModemID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object memoEnforaModemID: TMemo
      Left = 16
      Top = 40
      Width = 255
      Height = 81
      Anchors = [akLeft, akTop, akRight]
      HideSelection = False
      ReadOnly = True
      TabOrder = 0
    end
    object btnCopyEnforaModemIDToClipboard: TBitBtn
      Left = 16
      Top = 128
      Width = 255
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Copy to clipboard'
      TabOrder = 1
      OnClick = btnCopyEnforaModemIDToClipboardClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 161
    Width = 290
    Height = 138
    Align = alClient
    Caption = ' Initialization '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 2
      Top = 18
      Width = 286
      Height = 118
      ActivePage = TabSheet5
      Align = alClient
      TabOrder = 0
      object TabSheet5: TTabSheet
        Caption = ' by COM '
        object Label10: TLabel
          Left = -2
          Top = 11
          Width = 69
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'COM port'
        end
        object Label11: TLabel
          Left = 148
          Top = 11
          Width = 65
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Speed'
        end
        object bbEnforaWriteDeviceConfiguration: TBitBtn
          Left = 24
          Top = 49
          Width = 225
          Height = 25
          Caption = 'Initialize Enfora device'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = bbEnforaWriteDeviceConfigurationClick
        end
        object EnforaCOMInitialization_edPortSpeed: TEdit
          Left = 216
          Top = 8
          Width = 48
          Height = 24
          TabOrder = 1
          Text = '115200'
        end
        object EnforaCOMInitialization_cbPort: TComboBox
          Left = 70
          Top = 8
          Width = 75
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 2
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 32
    Top = 72
  end
end
