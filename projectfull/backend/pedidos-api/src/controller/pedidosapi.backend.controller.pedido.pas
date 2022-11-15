unit pedidosapi.backend.controller.pedido;

interface

uses
  Horse,
  System.SysUtils,
  System.JSON,
  System.Generics.Collections,
  commons.backend.services,
  pedidosapi.backend.utils,
  pedidosapi.backend.dto.pedido,
  pedidosapi.backend.dto.produto,
  pedidosapi.backend.dto.pedidoitens,
  pedidosapi.backend.model.entity.pedido,
  pedidosapi.backend.model.entity.pedidoitens,
  pedidosapi.bachend.auth.impl.httpclient;

procedure Registery(App: THorse);

implementation

procedure ListarTodos(Req: THorseRequest; Res: THorseResponse);
var
  lToken:String;
begin
  lToken := Req.Headers[LowerCase('Authorization')].Replace('bearer ', '', [rfIgnoreCase]);
end;

procedure ListarPor(Req: THorseRequest; Res: THorseResponse);
begin

end;

procedure Novo(Req: THorseRequest; Res: THorseResponse);
begin

end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse);
begin

end;

procedure Registery(App: THorse);
begin
  App.Get('/pedidos', ListarTodos);
  App.Get('/pedidos/:id', ListarPor);
  App.Post('/pedidos', Novo);
  App.Delete('/pedidos/:id/excluir', Excluir);
end;

end.
