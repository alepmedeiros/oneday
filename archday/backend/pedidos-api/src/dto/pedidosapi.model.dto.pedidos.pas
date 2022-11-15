unit pedidosapi.model.dto.pedidos;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  pedidosapi.model.dto.pedidoitens,
  cadastrosapi.backend.dto.clientes;

type
  TPedidosDTO = class
  private
    FId: Integer;
    FCliente: TClienteDTO;
    FDataEmissao: TDateTime;
    FValorTotal: Double;
    FItens: TObjectList<TPedidoItensDTO>;
  public
    property Codigo: Integer read FId write FId;
    property Cliente: TClienteDTO read FCliente write FCliente;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property Itens: TObjectList<TPedidoItensDTO> read FItens write FItens;

    constructor Create;
    destructor Destroy; override;
    class function New: TPedidosDTO;
  end;

implementation

{ TPedidosDTO }

constructor TPedidosDTO.Create;
begin
  FCliente:= TClienteDTO.New;
  FItens:= TObjectList<TPedidoItensDTO>.Create;
  FDataEmissao := Now;
end;

destructor TPedidosDTO.Destroy;
begin
  FCliente.Free;
  FItens.Free;
  inherited;
end;

class function TPedidosDTO.New: TPedidosDTO;
begin
  Result := Self.Create;
end;

end.
