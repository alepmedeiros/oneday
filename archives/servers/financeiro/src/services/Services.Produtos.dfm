object ServicesProdutos: TServicesProdutos
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
  object qryProdutos: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from produtos')
    Left = 48
    Top = 88
    object qryProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryProdutospreco: TLargeintField
      FieldName = 'preco'
      Origin = 'preco'
    end
    object qryProdutosgrupo: TStringField
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 100
    end
  end
end
