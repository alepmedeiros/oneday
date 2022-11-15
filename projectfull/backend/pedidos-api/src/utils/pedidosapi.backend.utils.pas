unit pedidosapi.backend.utils;

interface

uses
  System.Json,
  System.SysUtils,
  System.TypInfo,
  GBJSON.Interfaces,
  System.Generics.Collections,
  pedidosapi.backend.model.entity.pedido,
  pedidosapi.backend.model.entity.pedidoitens,
  pedidosapi.backend.dto.pedido,
  pedidosapi.backend.dto.pedidoitens,
  pedidosapi.backend.dto.produto;

type
  TBaseURL = (AUTENTICACAO, CADASTRO);

  TBaseURLHelper = record helper for TBaseURL
    function ToBase: String;
  end;

  TPedidosHelper = class helper for TPedidos
    function Convert(Value: TObjectList<TPedidoItens>): TPedidosDTO;
  end;

  TPedidosDTOHelper = class helper for TPedidosDTO
    function ToJson: TJSONObject;
  end;

  TPedidoItensHelper = class helper for TPedidoItens
    function Convert: TPedidoItensDTO;
  end;

implementation

{ TBaseURLHelper }

function TBaseURLHelper.ToBase: String;
var
  lBase: TBaseURL;
begin
  case lbase of
    AUTENTICACAO:
    {$IFDEF MSWINDOWS}
      Result := 'http://localhost:9000';
    {$ELSE}
      Result := GetEnvironmentVariable('AUTENTICATION_HOST');
    {$ENDIF}
    CADASTRO:
      {$IFDEF MSWINDOWS}
        Result := 'http://localhost:9001';
      {$ELSE}
        Result := GetEnvironmentVariable('CADASTRO_HOST');
      {$ENDIF}
  end;
end;

{ TPedidosHelper }

function TPedidosHelper.Convert(Value: TObjectList<TPedidoItens>): TPedidosDTO;
var
  lItem: TPedidoItens;
begin
  Result := TPedidosDTO.New;
  Result.Id := Self.Id;
  Result.Cliente := Self.Cliente;
  for lItem in Value do
    Result.Produto.Add(lItem.Convert);
  Result.Total := Self.Total;
end;

{ TPedidoItensHelper }

function TPedidoItensHelper.Convert: TPedidoItensDTO;
begin
  Result := TPedidoItensDTO.New;
  Result.Id := Self.Id;
  Result.Item := Self.Item;
  Result.Produto.Id := Self.Produto;
  Result.Quantidade := Self.Quantidade;
  Result.Unitario := Self.ValorUnitario;
end;

{ TPedidosDTOHelper }

function TPedidosDTOHelper.ToJson: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TPedidosDTO>.ObjectToJsonObject(Self);
end;

end.
