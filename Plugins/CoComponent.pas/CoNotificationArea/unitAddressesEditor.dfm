object fmAddressesEditor: TfmAddressesEditor
  Left = 9
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Addresses editor'
  ClientHeight = 247
  ClientWidth = 994
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
  object Panel2: TPanel
    Left = 0
    Top = 215
    Width = 994
    Height = 32
    Align = alBottom
    TabOrder = 0
    object sbSave: TSpeedButton
      Left = 808
      Top = 2
      Width = 89
      Height = 28
      Caption = 'Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbSaveClick
    end
    object sbCancel: TSpeedButton
      Left = 903
      Top = 2
      Width = 89
      Height = 28
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = sbCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 215
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 329
      Top = 1
      Width = 1
      Height = 213
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 328
      Height = 213
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 326
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          326
          32)
        object Label1: TLabel
          Left = 8
          Top = 5
          Width = 37
          Height = 23
          Caption = 'SMS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object sbAddSMSAddress: TSpeedButton
          Left = 230
          Top = 2
          Width = 31
          Height = 28
          Hint = 'Add new address'
          Anchors = [akTop, akRight]
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbAddSMSAddressClick
        end
        object sbRemoveSMSAddress: TSpeedButton
          Left = 263
          Top = 2
          Width = 29
          Height = 28
          Hint = 'Remove selected address'
          Anchors = [akTop, akRight]
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbRemoveSMSAddressClick
        end
        object sbEditSMSAddress: TSpeedButton
          Left = 294
          Top = 2
          Width = 29
          Height = 28
          Hint = 'Edit selected address'
          Anchors = [akTop, akRight]
          Caption = '*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = sbEditSMSAddressClick
        end
      end
      object lvSMSAddresses: TListView
        Left = 1
        Top = 33
        Width = 326
        Height = 179
        Align = alClient
        Columns = <
          item
            Caption = 'Address'
            Width = 180
          end
          item
            Caption = 'Message format'
            Width = 120
          end>
        ColumnClick = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = sbEditSMSAddressClick
      end
    end
    object Panel5: TPanel
      Left = 330
      Top = 1
      Width = 663
      Height = 213
      Align = alClient
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 329
        Top = 1
        Width = 1
        Height = 211
      end
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 328
        Height = 211
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 326
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            326
            32)
          object Label2: TLabel
            Left = 8
            Top = 5
            Width = 51
            Height = 23
            Caption = 'E-Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sbAddEMAILAddress: TSpeedButton
            Left = 230
            Top = 2
            Width = 31
            Height = 28
            Hint = 'Add new address'
            Anchors = [akTop, akRight]
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbAddEMAILAddressClick
          end
          object sbRemoveEMAILAddress: TSpeedButton
            Left = 263
            Top = 2
            Width = 29
            Height = 28
            Hint = 'Remove selected address'
            Anchors = [akTop, akRight]
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbRemoveEMAILAddressClick
          end
          object sbEditEMAILAddress: TSpeedButton
            Left = 294
            Top = 2
            Width = 29
            Height = 28
            Hint = 'Edit selected address'
            Anchors = [akTop, akRight]
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbEditEMAILAddressClick
          end
        end
        object lvEMAILAddresses: TListView
          Left = 1
          Top = 33
          Width = 326
          Height = 177
          Align = alClient
          Columns = <
            item
              Caption = 'Address'
              Width = 180
            end
            item
              Caption = 'Message format'
              Width = 120
            end>
          ColumnClick = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = sbEditEMAILAddressClick
        end
      end
      object Panel8: TPanel
        Left = 330
        Top = 1
        Width = 332
        Height = 211
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 330
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            330
            32)
          object Label3: TLabel
            Left = 8
            Top = 5
            Width = 63
            Height = 23
            Caption = 'MailBox'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sbAddMBMAddress: TSpeedButton
            Left = 234
            Top = 2
            Width = 31
            Height = 28
            Hint = 'Add new address'
            Anchors = [akTop, akRight]
            Caption = '+'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbAddMBMAddressClick
          end
          object sbRemoveMBMAddress: TSpeedButton
            Left = 267
            Top = 2
            Width = 29
            Height = 28
            Hint = 'Remove selected address'
            Anchors = [akTop, akRight]
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbRemoveMBMAddressClick
          end
          object sbEditMBMAddress: TSpeedButton
            Left = 298
            Top = 2
            Width = 29
            Height = 28
            Hint = 'Edit selected address'
            Anchors = [akTop, akRight]
            Caption = '*'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = sbEditMBMAddressClick
          end
        end
        object lvMBMAddresses: TListView
          Left = 1
          Top = 33
          Width = 330
          Height = 177
          Align = alClient
          Columns = <
            item
              Caption = 'Address'
              Width = 180
            end
            item
              Caption = 'Message format'
              Width = 120
            end>
          ColumnClick = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
          OnDblClick = sbEditMBMAddressClick
        end
      end
    end
  end
end
