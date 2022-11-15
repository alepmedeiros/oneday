object ServiceClientes: TServiceClientes
  OldCreateOrder = False
  Height = 150
  Width = 160
  object mtClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 56
    object mtClientesid: TIntegerField
      FieldName = 'id'
    end
    object mtClientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object mtClientessobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object mtClientesemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object mtClientestelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 14
    end
    object mtClienteslocalidade: TStringField
      FieldName = 'localidade'
      Origin = 'localidade'
      Size = 100
    end
  end
end
