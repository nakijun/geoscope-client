object ForumMessagePanelProps: TForumMessagePanelProps
  Left = -1
  Top = 240
  Width = 1019
  Height = 51
  Caption = 'Object properties'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1011
    Height = 24
    Align = alTop
    Color = 16774593
    TabOrder = 1
    DesignSize = (
      1011
      24)
    object Label2: TLabel
      Left = 144
      Top = 4
      Width = 25
      Height = 16
      AutoSize = False
      Caption = '---->'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbRecipient: TSpeedButton
      Left = 168
      Top = 3
      Width = 137
      Height = 18
      Hint = 'show partner message'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbRecipientClick
    end
    object sbSender: TSpeedButton
      Left = 3
      Top = 3
      Width = 137
      Height = 18
      Hint = 'show message sender'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSenderClick
    end
    object sbEdit: TSpeedButton
      Left = 897
      Top = 3
      Width = 22
      Height = 19
      Hint = 'Edit this message'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        66030000424D6603000000000000360000002800000010000000110000000100
        1800000000003003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A
        6DFC3E64FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF4B6BEE486CFF3B62FF2F59FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A6DD16382FF43
        68FF375FFF2B56FF204CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF5A6DD18EA4FF4E71FF4066FF345DFF2853FF1C49FF0F3FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E64D5A4B7FF6A88FF486DFF3C
        63FF305AFF2550FF1846FF0C3DFF0134FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        3A53DC96AAFC8BA2FF5174FF456AFF3961FF2D57FF214DFF1443FF083AFF0134
        FF0537FFFFFFFFFFFFFFFFFFFF1E33DC6886FCA2B5FF6D8AFF4B6FFF4268FF36
        5EFF2A55FF1E4BFF1140FF0537FF0537FF2C57FF1135ECFFFFFFFFFFFF314CE9
        9EB2FFA2B4FF6080FF4A6EFF3F65FF335CFF2651FF1A47FF0D3DFF0234FF0739
        FF3A61FF0233FCFFFFFFFFFFFF304CEA9BAFFFA9BAFF6281FF466BFF3B62FF2F
        59FF2549F11644FF093AFF0133FF1846FF3F65FF0735F8FFFFFFFFFFFF1828D3
        6E84F191A7FF5D7DFF4469FF3860FF3F5DED1E2CB81440F80638FF0537FF2954
        FF305AFF0000FFFFFFFFFFFFFFFFFFFF2F47E05E72E64765F14461EF2442EF25
        2D9EFFFFFF152BD70924F70833F10F39F14059E70000FFFFFFFFFFFFFFFFFFFF
        FFFFFF1828D31828D31828D3FFFFFFFFFFFFFFFFFFFFFFFF1828D31828D31828
        D31828D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEditClick
    end
    object Label3: TLabel
      Left = 313
      Top = 4
      Width = 57
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Sent'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbSentTime: TLabel
      Left = 372
      Top = 4
      Width = 101
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '10:14 27/06/04'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 481
      Top = 4
      Width = 72
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Modified'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbLastModified: TLabel
      Left = 556
      Top = 4
      Width = 101
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = '10:14 27/06/04'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194304
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbSend: TSpeedButton
      Left = 920
      Top = 3
      Width = 89
      Height = 19
      Hint = 'Send or update this message'
      Anchors = [akTop, akRight]
      Caption = 'Send'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        6E040000424D6E040000000000003600000028000000180000000F0000000100
        1800000000003804000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF626262626262626262626262626262626262
        626262626262626262626262626262626262626262626262868686FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7AA4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        966200565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6929292929292C0C0
        C0D4FFFFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4
        F0FFD4F0FFD4FFFFE6E6E6966200868686FFFFFFFFFFFFFFFFFFFFFFFFCECECE
        CECECECECECEA4A0A0D4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0
        FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFAAAAAA565656FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A7AE6E6E6D4F0FFE6E6E6F2F2F2F2F2F2
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6F2F2F2D4F0FFDADADA734A
        00FFFFFFFFFFFFFFFFFFFFFFFFB6B6B6929292929292929292CECECED4F0FFAA
        AAAAB6B6B6CECECEF2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2E6E6E6
        F2F2F2D4F0FF6E6E6E808080FFFFFFFFFFFFFFFFFFCECECEB6B6B6CECECECECE
        CE929292F0FBFFC0C0C0A4A0A0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF2F2F2E6E6E6D4F0FFA4A0A0565656FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF808080F2F2F2E6E6E69E9E9EB6B6B6E6E6E6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFFE6E6E6F2F2F2DADADA734A00868686FF
        FFFFFFFFFFB6B6B6929292929292929292929292CECECED4F0FFAAAAAA929292
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A09E9E9EB6B6B6F2F2F2D4F0
        FF6E6E6E808080FFFFFFFFFFFFCECECEC0C0C0B6B6B6CECECECECECE929292D4
        F0FFE6E6E6CECECECECECECECECECECECECECECECECECECECECECECECECECECE
        CECECEE6E6E6D4F0FFAAAAAA565656868686FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A7A7AD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4
        F0FFD4F0FFD4F0FFD4F0FFD4F0FFD4F0FFDADADA734A00868686FFFFFFB6B6B6
        A4A0A0929292929292929292929292FFB848FFC66BFFC66BFFC66BFFC66BFFC6
        6BFFC66BFFC66BFFC66BFFC66BFFC66BFFC66BFFC66BFFC66BFFC66B96620086
        8686FFFFFFCECECEB6B6B6B6B6B6B6B6B6C2C2C2FFFFFFB97A00DC4900DC4900
        DC9200DC9200DC9200DC9200DC9200DC9200DC9200FFAA25FFAA25FFAA256E6E
        6E6E6E6EB93D00868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA4A0A0FFAB8EFFAB8EFFAB8EFFAB8EFFAB8EFFAB8EFFAB8EFFAB8EFFAB8E
        FFAB8EFFAB8EFFAB8EFFAB8EFFAB8EFFFFFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSendClick
    end
    object sbReply: TSpeedButton
      Left = 682
      Top = 3
      Width = 68
      Height = 19
      Hint = 'Reply for this message'
      Caption = 'Reply'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbReplyClick
    end
    object sbCite: TSpeedButton
      Left = 754
      Top = 3
      Width = 79
      Height = 19
      Hint = 'Cite for this message'
      Caption = 'Cite'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCiteClick
    end
    object sbDelete: TSpeedButton
      Left = 835
      Top = 3
      Width = 60
      Height = 19
      Hint = 'Delete for this message'
      Caption = 'Delete'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbDeleteClick
    end
  end
  object reMessage: TRichEdit
    Left = 0
    Top = 24
    Width = 1011
    Height = 0
    Align = alTop
    BorderStyle = bsNone
    Color = 16646111
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 4194304
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = reMessageKeyPress
    OnMouseMove = reMessageMouseMove
  end
end
