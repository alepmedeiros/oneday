unit pedidosapi.backend.dto.pedidoitens;

interface

uses
  pedidosapi.backend.dto.produto;

type
  TPedidoItensDTO = class
  private
    FId: Integer;
    FItem: Integer;
    FProduto: TProdutoDTO;
    FQuantidade: Double;
    FUnitario: Currency;
    FTotal: Currency;
    function GetTotal: Currency;
  public
    property Id: Integer read FId write FId;
    property Item: Integer read FItem write FItem;
    property Produto: TProdutoDTO read FProduto write FProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property Unitario: Currency read FUnitario write FUnitario;
    property Total: Currency read GetTotal;

    constructor Create;
    destructor Destroy; override;
    class function New: TPedidoItensDTO;
  end;

implementation

{ TPedidoItensDTO }

constructor TPedidoItensDTO.Create;
begin
  FProduto:= TProdutoDTO.New;
end;

destructor TPedidoItensDTO.Destroy;
begin
  FProduto.DisposeOf;
  inherited;
end;

function TPedidoItensDTO.GetTotal: Currency;
begin
  Result := (FUnitario * FQuantidade);
end;

class function TPedidoItensDTO.New: TPedidoItensDTO;
begin

end;

end.
