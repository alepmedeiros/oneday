unit pedido.model.entity.pedidoItens;

interface

uses
  SimpleAttributes;

type
  [Tabela('PedidoItens')]
  TPedidoItens = class
  private
    FIdPedido: Integer;
    FIdProduto: Integer;
    FItem: Integer;
    FQuantidade: Integer;
    FUnitatio: Double;
    FTotal: Double;
  public
    [Campo('ID_PEDIDO')]
    property IdPedido: Integer read FIdPedido write FIdPedido;
    [Campo('ID_PRODUTO')]
    property IdProduto: Integer read FIdProduto write FIdProduto;
    [Campo('ITEM')]
    property Item: Integer read FItem write FItem;
    [Campo('QUANTIDADE')]
    property Quantidade: Integer read FQuantidade write FQuantidade;
    [Campo('UNITARIO')]
    property Unitatio: Double read FUnitatio write FUnitatio;
    [Campo('TOTAL')]
    property Total: Double read FTotal write FTotal;

    class function New: TPedidoItens;
  end;

implementation

{ TPedidoItens }

class function TPedidoItens.New: TPedidoItens;
begin
  Result := Self.Create;
end;

end.
