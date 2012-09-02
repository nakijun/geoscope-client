object fmMODELUserBillingAccountPanel: TfmMODELUserBillingAccountPanel
  Left = 325
  Top = 173
  BorderStyle = bsDialog
  Caption = 'User Account'
  ClientHeight = 481
  ClientWidth = 803
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
    803
    481)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 160
    Top = 24
    Width = 30
    Height = 16
    Caption = 'Tariff'
  end
  object Label2: TLabel
    Left = 24
    Top = 88
    Width = 78
    Height = 16
    Caption = 'Transactions'
  end
  object Label3: TLabel
    Left = 24
    Top = 24
    Width = 48
    Height = 16
    Caption = 'Account'
  end
  object lvTransactions: TListView
    Left = 24
    Top = 104
    Width = 755
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'ID'
        Width = 70
      end
      item
        Caption = 'Time'
        Width = 120
      end
      item
        Caption = 'Reason'
        Width = 150
      end
      item
        Alignment = taRightJustify
        Caption = 'Delta'
        Width = 80
      end
      item
        Alignment = taRightJustify
        Caption = 'Summary'
        Width = 100
      end
      item
        Caption = 'Comment'
        Width = 200
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object edAccount: TEdit
    Left = 24
    Top = 40
    Width = 129
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object cbTariff: TComboBox
    Left = 160
    Top = 40
    Width = 617
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    PopupMenu = cbTariff_Popup
    TabOrder = 2
    OnChange = cbTariffChange
  end
  object cbTariff_Popup: TPopupMenu
    Left = 424
    Top = 48
    object SuspendResumetariff1: TMenuItem
      Caption = 'Suspend/Resume tariff'
      OnClick = SuspendResumetariff1Click
    end
  end
end
