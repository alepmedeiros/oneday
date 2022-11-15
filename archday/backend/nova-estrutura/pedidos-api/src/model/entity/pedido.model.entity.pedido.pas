unit pedido.model.entity.pedido;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDO')]
  TPedido = class
  private
    FId: Integer;
    FIdCliente: Integer;
    FTotal: Double;
    FQuantidade: Integer;
  public
    [Campo('ID'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_CLIENTE')]
    property IdCliente: Integer read FIdCliente write FIdCliente;
    [Campo('QUANTIDADE')]
    property Quantidade: Integer read FQuantidade write FQuantidade;
    [Campo('TOTAL')]
    property Total: Double read FTotal write FTotal;

    class function New: TPedido;
  end;

implementation

{ TPedido }

class function TPedido.New: TPedido;
begin
  Result := Self.Create;
end;

end.
