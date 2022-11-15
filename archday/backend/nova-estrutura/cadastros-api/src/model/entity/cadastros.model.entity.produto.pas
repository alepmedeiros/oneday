unit cadastros.model.entity.produto;

interface

uses
  SimpleAttributes;

type
  [Tabela('PRODUTO')]
  TProduto = class
  private
    FId: Integer;
    FIdPessoa: Integer;
    FDescricao: String;
    FPreco: Double;
    FUnitario: Double;
    FEstoque: Integer;
    FCodigo: String;
    FIdCategoria: Integer;
  public
    [Campo('ID'), Pk, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('ID_CATEGORIA'), Fk]
    property IdCategoria: Integer read FIdCategoria write FIdCategoria;
    [Campo('CODIGO')]
    property Codigo: String read FCodigo write FCodigo;
    [Campo('DESCRICAO')]
    property Descricao: String read FDescricao write FDescricao;
    [Campo('PRECO')]
    property Preco: Double read FPreco write FPreco;
    [Campo('UNITARIO')]
    property Unitario: Double read FUnitario write FUnitario;
    [Campo('ESTOQUE')]
    property Estoque: Integer read FEstoque write FEstoque;

    class function New: TProduto;
  end;

implementation

{ TProduto }

class function TProduto.New: TProduto;
begin
  Result := Self.Create;
end;

end.
