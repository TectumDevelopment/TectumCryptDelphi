object Form1: TForm1
  Left = 221
  Top = 334
  Width = 559
  Height = 398
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 136
    Width = 56
    Height = 13
    Caption = 'Current sign'
  end
  object Label2: TLabel
    Left = 16
    Top = 208
    Width = 49
    Height = 13
    Caption = 'Cript string'
  end
  object Label3: TLabel
    Left = 16
    Top = 280
    Width = 98
    Height = 13
    Caption = 'Original sign (decript)'
  end
  object Label4: TLabel
    Left = 104
    Top = 184
    Width = 152
    Height = 13
    Caption = 'Can be many keys for same sign'
  end
  object Label5: TLabel
    Left = 8
    Top = 48
    Width = 183
    Height = 13
    Caption = 'I show Only  one pass for wholl file size'
  end
  object Label6: TLabel
    Left = 8
    Top = 72
    Width = 313
    Height = 13
    Caption = 
      'U can divide file by some sectors and repeat procedure more time' +
      's'
  end
  object Label7: TLabel
    Left = 8
    Top = 96
    Width = 198
    Height = 13
    Caption = 'File size more than 100 bytes will be better'
  end
  object Edit1: TEdit
    Left = 16
    Top = 152
    Width = 305
    Height = 21
    TabOrder = 0
    Text = '1234567890 0000000000000000 444444444444'
  end
  object Edit2: TEdit
    Left = 16
    Top = 224
    Width = 457
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 181
    Width = 75
    Height = 25
    Caption = 'encript'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 250
    Width = 75
    Height = 25
    Caption = 'Decript'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit3: TEdit
    Left = 16
    Top = 296
    Width = 305
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
  end
  object Button3: TButton
    Left = 8
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Get a unique signature of any file'
    TabOrder = 5
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 296
    Top = 9
  end
end
