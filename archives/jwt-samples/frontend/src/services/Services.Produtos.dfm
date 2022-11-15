object ServiceProdutos: TServiceProdutos
  OldCreateOrder = False
  Height = 150
  Width = 215
  object mtProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 96
    Top = 56
    object mtProdutosid: TIntegerField
      FieldName = 'id'
    end
    object mtProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object mtProdutospreco: TLargeintField
      FieldName = 'preco'
      Origin = 'preco'
    end
    object mtProdutosgrupo: TStringField
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 100
    end
  end
end
