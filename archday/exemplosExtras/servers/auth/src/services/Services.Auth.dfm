object ServicesAuth: TServicesAuth
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 214
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projetos\Git\mateus-vicente\private\jwt-samples\data' +
        'base\database.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object qryUsuarios: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * '
      'from usuario'
      'where login = :login and senha = :senha')
    Left = 48
    Top = 88
    ParamData = <
      item
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        Name = 'SENHA'
        ParamType = ptInput
      end>
    object qryUsuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryUsuarioslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 100
    end
    object qryUsuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 100
    end
    object qryUsuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
  end
  object qryKeys: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * '
      'from usuario_key'
      'where public_key = :public_key')
    Left = 128
    Top = 88
    ParamData = <
      item
        Name = 'PUBLIC_KEY'
        ParamType = ptInput
      end>
    object qryKeysid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryKeyspublic_key: TStringField
      FieldName = 'public_key'
      Origin = 'public_key'
      Size = 500
    end
    object qryKeysprivate_key: TStringField
      FieldName = 'private_key'
      Origin = 'private_key'
      Size = 500
    end
  end
end
