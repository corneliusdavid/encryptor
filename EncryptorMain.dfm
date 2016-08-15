object frmEncryptor: TfrmEncryptor
  Left = 307
  Top = 245
  Caption = 'The Encryptor!'
  ClientHeight = 467
  ClientWidth = 519
  Color = clBtnFace
  Constraints.MinHeight = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  DesignSize = (
    519
    467)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 32
    Top = 392
    Width = 40
    Height = 13
    Caption = '&Result:'
    FocusControl = edtLBSymmetricResult
  end
  object Label8: TLabel
    Left = 32
    Top = 167
    Width = 39
    Height = 13
    Caption = '&String:'
    FocusControl = edtSymmetricString
  end
  object Label2: TLabel
    Left = 33
    Top = 16
    Width = 445
    Height = 59
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      'These use TurboPower'#39's LockBox components version 2.08 to encryp' +
      't and decrypt strings.  You can then copy these strings to the c' +
      'lipboard and paste them in your application, ready for use.  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblKey: TLabel
    Left = 32
    Top = 320
    Width = 446
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Color = clGrayText
    ParentColor = False
  end
  object edtSymmetricString: TEdit
    Left = 32
    Top = 184
    Width = 445
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object btnLBSymmetricDecrypt: TButton
    Left = 340
    Top = 344
    Width = 117
    Height = 33
    Anchors = [akTop, akRight]
    Caption = '&Decrypt'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnLBSymmetricDecryptClick
  end
  object edtLBSymmetricResult: TEdit
    Left = 32
    Top = 408
    Width = 445
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object btnCopyLBSymmetricResult: TButton
    Left = 360
    Top = 432
    Width = 117
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Copy to Clipboard'
    TabOrder = 8
    OnClick = btnCopyLBSymmetricResultClick
  end
  object btnLBSymmetricEncrypt: TButton
    Left = 46
    Top = 344
    Width = 117
    Height = 33
    Anchors = [akTop, akRight]
    Caption = '&Encrypt'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnLBSymmetricEncryptClick
  end
  object radAlgorithm: TRadioGroup
    Left = 33
    Top = 81
    Width = 129
    Height = 80
    Caption = 'Encryption &Type'
    ItemIndex = 0
    Items.Strings = (
      'Blowfish'
      'Triple-DES'
      'Rijndael (AES)')
    TabOrder = 0
  end
  object pnlKeys: TPanel
    Left = 32
    Top = 211
    Width = 445
    Height = 102
    BevelOuter = bvLowered
    TabOrder = 4
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 443
      Height = 13
      Align = alTop
      Caption = 'Key:'
      ExplicitWidth = 27
    end
    object Label3: TLabel
      Left = 13
      Top = 21
      Width = 70
      Height = 13
      Caption = '&Passphrase:'
      FocusControl = edtSymmetricPassphrase
    end
    object edtSymmetricPassphrase: TEdit
      Left = 13
      Top = 40
      Width = 411
      Height = 21
      TabOrder = 0
    end
    object btnGeneratePassphraseKey: TButton
      Left = 47
      Top = 69
      Width = 162
      Height = 25
      Caption = '&Generate Passphrase Key'
      TabOrder = 1
      OnClick = btnGeneratePassphraseKeyClick
    end
    object btnGenerateRandomKey: TButton
      Left = 235
      Top = 69
      Width = 162
      Height = 25
      Caption = 'Generate &Random Key'
      TabOrder = 2
      OnClick = btnGenerateRandomKeyClick
    end
  end
  object radCipherMode: TRadioGroup
    Left = 168
    Top = 81
    Width = 211
    Height = 80
    Caption = 'Cipher &Mode'
    ItemIndex = 1
    Items.Strings = (
      'ECB - Electronic Code Book'
      'CBC - Cipher Block Chaining')
    TabOrder = 1
  end
  object radAESKeySize: TRadioGroup
    Left = 385
    Top = 81
    Width = 91
    Height = 80
    Caption = 'AES Key Size'
    ItemIndex = 2
    Items.Strings = (
      '128'
      '192'
      '256')
    TabOrder = 2
  end
  object btnAbout: TButton
    Left = 32
    Top = 434
    Width = 83
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&About ...'
    TabOrder = 9
    OnClick = btnAboutClick
  end
  object LbBlowfish: TLbBlowfish
    CipherMode = cmECB
    Left = 184
    Top = 352
  end
  object Lb3DES: TLb3DES
    CipherMode = cmECB
    Left = 240
    Top = 352
  end
  object LbRijndael: TLbRijndael
    CipherMode = cmECB
    KeySize = ks256
    Left = 296
    Top = 352
  end
  object dlgAbout: TTaskDialog
    Buttons = <>
    Caption = 'About this Program'
    ExpandButtonCaption = 'GitHub'
    ExpandedText = 
      'https://github.com/corneliusdavid/encryptor  https://github.com/' +
      'corneliusdavid/LockBox-2.08'
    RadioButtons = <>
    Text = 
      'This program was written in Delphi many years ago. I forget whic' +
      'h version it started in, but now compiles in Delphi 10 Seattle. ' +
      'It uses an open source library called LockBox (version 2.08).'
    Left = 216
    Top = 416
  end
end
