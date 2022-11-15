unit pedidosapi.model.entity.pedidos;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDOS')]
  TPedidos = class
  private
    FId: Integer;
    FCliente: Integer;
    FDataEmissao: TDateTime;
    FValorTotal: Double;
  public
    [Campo('ID'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('CLIENTE')]
    property Cliente: Integer read FCliente write FCliente;
    [Campo('DATAEMISSAO')]
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    [Campo('VALORTOTAL')]
    property ValorTotal: Double read FValorTotal write FValorTotal;

    class function New: TPedidos;
  end;

implementation

{ TPedidos }

class function TPedidos.New: TPedidos;
begin
  Result := Self.Create;
end;

end.
