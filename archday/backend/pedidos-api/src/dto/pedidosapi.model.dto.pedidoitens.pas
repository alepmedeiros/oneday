unit pedidosapi.model.dto.pedidoitens;

interface

uses
  cadastrosapi.backend.dto.produto;

type
  TPedidoItensDTO = class
  private
    FItem: Integer;
    FProduto: TProdutoDTO;
    FQuantidade: Integer;
    FValorUnitario: Double;
    FValorTotal: Double;
    FPedido: Integer;
  public
    property Item: Integer read FItem write FItem;
    property Produto: TProdutoDTO read FProduto write FProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
    property ValorTotal: Double read FValorTotal write FValorTotal;

    constructor Create;
    destructor Destroy; override;
    class function New: TPedidoItensDTO;
  end;

implementation

{ TPedidoItensDTO }

constructor TPedidoItensDTO.Create;
begin
  FProduto:= TProdutoDTO.Create;
end;

destructor TPedidoItensDTO.Destroy;
begin
  FProduto.Free;
  inherited;
end;

class function TPedidoItensDTO.New: TPedidoItensDTO;
begin
  Result := Self.Create;
end;

end.
