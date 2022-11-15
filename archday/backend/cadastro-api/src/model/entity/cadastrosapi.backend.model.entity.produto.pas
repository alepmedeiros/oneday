unit cadastrosapi.backend.model.entity.produto;

interface

uses
  SimpleAttributes;

type
  [Tabela('produtos')]
  TProduto = class
  private
    FId: Integer;
    FDescricao: String;
    FPreco: Double;
    FCategoria: Integer;
    FIdCategoria: Integer;
  public
    [Campo('id'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('descricao')]
    property Descricao: String read FDescricao write FDescricao;
    [Campo('preco')]
    property Preco: Double read FPreco write FPreco;
    [Campo('idcategoria')]
    property IdCategoria: Integer read FIdCategoria write FIdCategoria;

    class function New: TProduto;
  end;

implementation

{ TProduto }

class function TProduto.New: TProduto;
begin
  Result := Self.Create;
end;

end.
