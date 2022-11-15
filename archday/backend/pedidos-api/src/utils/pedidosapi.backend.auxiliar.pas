unit pedidosapi.backend.auxiliar;

interface

uses
  System.JSON,
  System.SysUtils,
  System.Generics.Collections,
  GBJSON.Interfaces,
  pedidosapi.model.dto.pedidos,
  pedidosapi.model.dto.pedidoitens,
  pedidosapi.model.entity.pedidos,
  pedidosapi.model.entity.pedidoitens,
  cadastrosapi.backend.dto.produto;

implementation

type
  TPedidosDTOHelper = class helper for TPedidosDTO
    function Convert(var aList: TObjectList<TPedidoItens>): TPedidos;
    function ToJSON: TJSONObject;
    function JsonToObject(Value: String): TPedidosDTO;
  end;

  TPedidoItensDTOHelper = class helper for TPedidoItensDTO
    function Convert(Value: TPedidos): TPedidoItens;
  end;

{ TPedidosDTOHelper }

function TPedidosDTOHelper.Convert(
  var aList: TObjectList<TPedidoItens>): TPedidos;
var
  lItens: TPedidoItensDTO;
begin
  aList := TObjectList<TPedidoItens>.Create;
  Result := TPedidos.New;
  Result.Id := Self.Id;
  Result.Cliente := Self.Cliente.Id;
  Result.ValorTotal := Self.ValorTotal;
  for lItens in Self.Itens do
    aList.Add(lItens.Convert(Result));
end;

function TPedidosDTOHelper.JsonToObject(Value: String): TPedidosDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TPedidosDTO>.JsonStringToObject(Value);
end;

function TPedidosDTOHelper.ToJSON: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Deserializer<TPedidosDTO>.ObjectToJsonObject(Self);
end;

{ TPedidoItensDTOHelper }

function TPedidoItensDTOHelper.Convert(Value: TPedidos): TPedidoItens;
var
  lProduto: TProdutoDTO;
begin
  Result := TPedidoItens.New;
  for lProduto in Self.Produto do
  begin
    Result.Item := Self.Item;
    Result.IdPedido := Value.Id;
    Result.Produto := lProduto.Id;
    Result.Quantidade := self.Quantidade;
    Result.ValorUnitario := Self.ValorUnitario;
    Result.ValorTotal := Self.ValorTotal;
  end;
end;

{ TPedidosDTOHelper }

end.
