unit pedidosapi.controller.pedidos;

interface

uses
  Horse,
  System.SysUtils,
  System.Generics.Collections,
  System.JSON,
  pedidosapi.model.dto.pedidos,
  pedidosapi.model.dto.pedidoitens,
  pedidosapi.model.entity.pedidos,
  pedidosapi.model.entity.pedidoitens,
  pedidosapi.backend.services.persistences,
  pedidosapi.recursosAdicionais,
  pedidosapi.bachend.auth.httpclient,
  cadastrosapi.backend.dto.clientes,
  cadastrosapi.backend.utils,
  cadastrosapi.backend.dto.produto,
  cadastrosapi.backend.model.entity.categoria,
  cadastrosapi.backend.dto.categoria;

procedure Registery(App: THorse);

implementation

function CarregaPedidos: TObjectList<TPedidos>;
begin
  Result := TServices<TPedidos>.New.FindAll;
end;

function CarregaPedidoItens: TObjectList<TPedidoItens>;
begin
  Result := TServices<TPedidoItens>.New.FindAll;
end;

function CarregaCliente(aPedido: TPedidos; aClientes: TObjectList<TClienteDTO>)
  : TClienteDTO;
begin
  for Result in aClientes do
    if aPedido.Cliente = Result.Id then
      Exit;
end;

function CarregaListaItens(aPedido: TPedidos; aItens: TObjectList<TPedidoItens>;
  aProdutos: TObjectList<TProdutoDTO>): TObjectList<TPedidoItensDTO>;
var
  lItem: TPedidoItens;
  lProduto: TProdutoDTO;
begin
  Result := TObjectList<TPedidoItensDTO>.Create;
  for lItem in aItens do
    for lProduto in aProdutos do
      if ((lItem.IdPedido = aPedido.Id) and (lItem.Produto = lProduto.Id)) then
        Result.Add(lItem.Convert(lProduto));
end;

function CarregaListPedidosDTO(aHeader: String;aPedidos: TObjectList<TPedidos>;
    aItens: TObjectList<TPedidoItens>): TObjectList<TPedidosDTO>;
var
  lClientes: TObjectList<TClienteDTO>;
  lProdutos : TObjectList<TProdutoDTO>;
  lContent: String;
  lPedido: TPedidos;
  lItem: TPedidoItens;
  lDto: TPedidosDTO;
begin
  Result := TObjectList<TPedidosDTO>.Create;
  lDto:= TPedidosDTO.New;

  {$IFDEF MSWINDOWS}
  THttpClient.New('http://localhost:9001')
  .Headers('servidor','http://localhost:9000')
  .Token(aHeader)
  .GetAll('clientes').Content(lContent);
  lClientes := TClienteDTO.New.JsonArrayToList(lContent);

  THttpClient.New('http://localhost:9001')
  .Token(aHeader)
  .Headers('servidor','http://localhost:9000')
  .GetAll('produtos').Content(lContent);
  lProdutos := TProdutoDTO.New.JsonArrayToList(lContent);
  {$ELSE}
   THttpClient.New(GetEnvironmentVariable('CADASTRO_HOST'))
  .Token(aHeader)
  .Headers('servidor',GetEnvironmentVariable('AUTENTICATION_HOST'))
  .GetAll('clientes').Content(lContent);
  lClientes := TClienteDTO.New.JsonArrayToList(lContent);

  THttpClient.New(GetEnvironmentVariable('CADASTRO_HOST'))
  .Token(aHeader)
  .Headers('servidor',GetEnvironmentVariable('AUTENTICATION_HOST'))
  .GetAll('produtos').Content(lContent);
  lProdutos := TProdutoDTO.New.JsonArrayToList(lContent);
  {$ENDIF}

  for lPedido in aPedidos do
  begin
    lDTO := lPedido.Convert(CarregaCliente(lPedido,lClientes),
        CarregaListaItens(lPedido, CarregaPedidoItens ,lProdutos));
    Result.Add(lDto);
  end;
end;

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lPedidos: TObjectList<TPedidosDTO>;
  lToken:String;
begin
  lToken := Req.Headers[LowerCase('Authorization')].Replace('bearer ', '', [rfIgnoreCase]);
  lPedidos := CarregaListPedidosDTO(lToken,CarregaPedidos, CarregaPedidoItens);
  Res.Send<TJSONArray>(TPedidosDTO.New.ListToJsonArray(lPedidos));
end;

procedure ListarPor(Req: THorseRequest; Res: THorseResponse);
var
  lPedidos: TObjectList<TPedidosDTO>;
  lPedido: TPedidosDTO;
begin
  lPedidos := CarregaListPedidosDTO(
  Req.Headers[LowerCase('Authorization')].Replace('bearer ', '', [rfIgnoreCase]),CarregaPedidos, CarregaPedidoItens);
  for lPedido in lPedidos do
    if lPedido.Codigo = Req.Params['id'].ToInteger then
    begin
      Res.Send<TJSONObject>(lPedido.ToJSON);
      Exit;
    end;
  Res.Status(404);
end;

procedure Novo(Req: THorseRequest; Res: THorseResponse);
var
  lPedidos: TPedidosDTO;
  lItens: TObjectList<TPedidoItens>;
  lItem: TPedidoItens;
begin
  lPedidos := TPedidosDTO.New.JsonToObject(Req.Body);
  lItens := TObjectList<TPedidoItens>.Create;
  try
    lPedidos.Codigo := TServices<TPedidos>.New.Insert(lPedidos.Convert(lItens)).Id;
    for lItem in lItens do
    begin
      lItem.IdPedido := lPedidos.Codigo;
      TServices<TPedidoItens>.New.Insert(lItem);
    end;
    Res.Send<TJSONObject>(lPedidos.ToJSON);
  finally
    lPedidos.Free;
    lItens.Free;
  end;
end;

procedure Apagar(Req: THorseRequest; Res: THorseResponse);
begin
  try
    TServices<TPedidos>.New.Delete(Req.Params['id']);
    Res.Status(204);
  except
    Res.Status(400);
  end;
end;

procedure Registery(App: THorse);
begin
  App.Get('/pedidos', ListarTodos);
  App.Get('/pedidos/:id', ListarPor);
  App.Post('/pedidos', Novo);
  App.Delete('/pedidos/apagar/:id', Apagar);
end;

end.
