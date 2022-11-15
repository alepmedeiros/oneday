unit pedidosapi.controller.pedidosnovo;

interface

uses
  Horse,
  pedidosapi.model.dto.pedidos;

implementation

procedure Novo(Req: THorseRequest; Res: THorseResponse);
var
  lPedidos: TPedidosDTO;
begin
  lPedidos := TPedidosDTO.New;
end;

end.
