object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 545
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 24
    Top = 128
    Width = 617
    Height = 393
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=dados'
      'User_Name=root'
      'Password=1'
      'Server=localhost'
      'MetaDefSchema=users'
      'MetaCurSchema=users'
      'DriverID=PG')
    LoginPrompt = False
    Left = 656
    Top = 168
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\MyRepository\oneday\archives\pgsql\libpq.dll'
    Left = 728
    Top = 224
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 824
    Top = 192
  end
end
