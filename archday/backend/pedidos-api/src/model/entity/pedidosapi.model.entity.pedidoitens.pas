unit pedidosapi.model.entity.pedidoitens;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOITENS')]
  TPedidoItens = class
  private
    FItem: Integer;
    FIdPedido: Integer;
    FProduto: Integer;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
  public
    [Campo('ITEM')]
    property Item: Integer read FItem write FItem;
    [Campo('ID_PEDIDO')]
    property IdPedido: Integer read FIdPedido write FIdPedido;
    [Campo('PRODUTO')]
    property Produto: Integer read FProduto write FProduto;
    [Campo('QUANTIDADE')]
    property Quantidade: Integer read FQuantidade write FQuantidade;
    [Campo('VALORUNITARIO')]
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
    [Campo('VALORTOTAL')]
    property ValorTotal: Double read FValorTotal write FValorTotal;

    class function New: TPedidoItens;
  end;

implementation

{ TPedidoItens }

class function TPedidoItens.New: TPedidoItens;
begin
  Result := Self.Create;
end;

end.
