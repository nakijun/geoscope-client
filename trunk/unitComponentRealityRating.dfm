object fmComponentRealityRating: TfmComponentRealityRating
  Left = 398
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Component reality rating'
  ClientHeight = 420
  ClientWidth = 350
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
  object Splitter1: TSplitter
    Left = 0
    Top = 256
    Width = 350
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 256
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 350
      Height = 256
      Align = alClient
      Caption = ' Current rating '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lvRating: TListView
        Left = 2
        Top = 47
        Width = 346
        Height = 207
        Align = alClient
        Columns = <
          item
            Caption = 'Time'
            Width = 80
          end
          item
            Caption = 'UserID'
            Width = 1
          end
          item
            Caption = 'Rate'
            Width = 70
          end
          item
            Caption = 'Reason'
            Width = 300
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object Panel3: TPanel
        Left = 2
        Top = 18
        Width = 346
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 97
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Average rate'
        end
        object Label2: TLabel
          Left = 176
          Top = 2
          Width = 81
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Count'
        end
        object edAvarageRate: TEdit
          Left = 112
          Top = 0
          Width = 65
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4194304
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edRateCount: TEdit
          Left = 264
          Top = 0
          Width = 49
          Height = 24
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 259
    Width = 350
    Height = 161
    Align = alBottom
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 348
      Height = 159
      Align = alClient
      Caption = ' Set my rate '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        348
        159)
      object Label3: TLabel
        Left = 10
        Top = 64
        Width = 48
        Height = 16
        Caption = 'Reason'
      end
      object Label4: TLabel
        Left = 10
        Top = 24
        Width = 263
        Height = 16
        Caption = 'Rate (percentage of reality, 0 - clear old rate)'
      end
      object cbMyRate: TComboBox
        Left = 10
        Top = 40
        Width = 328
        Height = 24
        ItemHeight = 16
        TabOrder = 0
        Text = '100'
        Items.Strings = (
          '0'
          '25'
          '50'
          '75'
          '100')
      end
      object edRateReason: TEdit
        Left = 10
        Top = 80
        Width = 326
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object btnSetMyRate: TButton
        Left = 10
        Top = 120
        Width = 159
        Height = 25
        Caption = 'Set rate'
        TabOrder = 2
        OnClick = btnSetMyRateClick
      end
      object edCancel: TButton
        Left = 183
        Top = 120
        Width = 153
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Cancel'
        TabOrder = 3
        OnClick = edCancelClick
      end
    end
  end
end
