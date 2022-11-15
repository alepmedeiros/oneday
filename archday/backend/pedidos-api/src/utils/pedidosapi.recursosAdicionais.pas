unit pedidosapi.recursosAdicionais;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  pedidosapi.model.dto.pedidos,
  pedidosapi.model.entity.pedidos,
  pedidosapi.model.dto.pedidoitens,
  pedidosapi.model.entity.pedidoitens,
  cadastrosapi.backend.dto.produto,
  cadastrosapi.backend.dto.clientes;

type
  TPedidosDTOHelper = class helper for TPedidosDTO
    function Convert(var aList: TObjectList<TPedidoItens>): TPedidos;
    function ToJSON: TJSONObject;
    function JsonToObject(Value: String): TPedidosDTO;
    function ListToJsonArray(Value: TObjectList<TPedidosDTO>): TJSONArray;
  end;

  TPedidoItensDTOHelper = class helper for TPedidoItensDTO
    function Convert(Value: TPedidosDTO): TPedidoItens;
    function JsonToObject(Value: TJsonObject): TPedidoItensDTO;
    function JsonArrayToList(Value: TJSONArray): TObjectList<TPedidoItensDTO>;
  end;

  TPedidosHelper = class helper for TPedidos
    function Convert(aCliente: TClienteDTO; aItens: TObjectList<TPedidoItensDTO>): TPedidosDTO;
    function ToJSON: TJSONObject;
    function ListToJsonArray(Value: TObjectList<TPedidos>): TJSONArray;
  end;

  TPedidoItensHelper = class helper for TPedidoItens
    function Convert(aProduto: TProdutoDTO): TPedidoItensDTO;
  end;

implementation

{ TPedidosDTOHelper }

function TPedidosDTOHelper.Convert(
  var aList: TObjectList<TPedidoItens>): TPedidos;
var
  lItens: TPedidoItensDTO;
begin
  Result := TPedidos.New;
  aList := TObjectList<TPedidoItens>.Create;
  Result.Id := Self.Codigo;
  Result.Cliente := Self.Cliente.Id;
  Result.DataEmissao := Self.DataEmissao;
  Result.ValorTotal := Self.ValorTotal;
  for lItens in self.Itens do
    aList.Add(lItens.Convert(Self));
end;

function TPedidosDTOHelper.JsonToObject(Value: String): TPedidosDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TPedidosDTO>.JsonStringToObject(Value);
end;

function TPedidosDTOHelper.ListToJsonArray(
  Value: TObjectList<TPedidosDTO>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for self in value do
    Result.Add(Self.ToJSON);
end;

function TPedidosDTOHelper.ToJSON: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.DeSerializer<TPedidosDTO>.ObjectToJsonObject(Self);
end;

{ TPedidoItensDTOHelper }

function TPedidoItensDTOHelper.Convert(Value: TPedidosDTO): TPedidoItens;
begin
  Result := TPedidoItens.New;
  Result.Item := Self.Item;
  Result.IdPedido := Value.Codigo;
  Result.Produto := Self.Produto.Id;
  Result.Quantidade := Self.Quantidade;
  Result.ValorUnitario := Self.ValorUnitario;
  Result.ValorTotal := Self.ValorTotal;
end;

function TPedidoItensDTOHelper.JsonArrayToList(
  Value: TJSONArray): TObjectList<TPedidoItensDTO>;
var
  lJsonValue: TJSONValue;
  lJson: TJSONObject;
  I: Integer;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TObjectList<TPedidoItensDTO>.Create;
  for I := 0 to Pred(Value.Size) do
  begin
    lJson := (Value.Get(I) as TJSONObject);
    Result.Add(self.JsonToObject(lJson));
  end;
end;

function TPedidoItensDTOHelper.JsonToObject(
  Value: TJsonObject): TPedidoItensDTO;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.Serializer<TPedidoItensDTO>.JsonObjectToObject(Value);
end;

{ TPedidosHelper }

function TPedidosHelper.Convert(aCliente: TClienteDTO; aItens: TObjectList<TPedidoItensDTO>): TPedidosDTO;
begin
  Result := TPedidosDTO.New;
  Result.Codigo := self.Id;
  Result.Cliente := aCliente;
  Result.Itens := aItens;
  Result.DataEmissao := Self.DataEmissao;
  Result.ValorTotal := Self.ValorTotal;
end;

function TPedidosHelper.ListToJsonArray(
  Value: TObjectList<TPedidos>): TJSONArray;
begin
  Result := TJSONArray.Create;
  for Self in Value do
    Result.Add(Self.ToJSON);
end;

function TPedidosHelper.ToJSON: TJSONObject;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);
  Result := TGBJSONDefault.DeSerializer<TPedidos>.ObjectToJsonObject(Self);
end;

{ TPedidoItensHelper }

function TPedidoItensHelper.Convert(aProduto: TProdutoDTO): TPedidoItensDTO;
begin
  Result := TPedidoItensDTO.New;
  Result.Item := Self.Item;
  Result.Produto := aProduto;
  Result.Quantidade := Self.Quantidade;
  Result.ValorUnitario := Self.ValorUnitario;
  Result.ValorTotal := Self.ValorTotal;
end;

end.
