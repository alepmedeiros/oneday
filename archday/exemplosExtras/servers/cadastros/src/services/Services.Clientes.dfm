object ServicesClientes: TServicesClientes
  OldCreateOrder = False
  Height = 150
  Width = 127
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projetos\Git\mateus-vicente\private\jwt-samples\data' +
        'base\database.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object qryClientes: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from clientes')
    Left = 48
    Top = 88
    object qryClientesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryClientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryClientessobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object qryClientesemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object qryClientestelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object qryClienteslocalidade: TStringField
      FieldName = 'localidade'
      Origin = 'localidade'
      Size = 100
    end
  end
end
