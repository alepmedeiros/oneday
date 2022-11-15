unit cadastrosapi.backend.dto.produto;

interface

uses
  System.JSON,
  System.Generics.Collections,
  GBJSON.Interfaces,
  cadastrosapi.backend.dto.categoria;

type
  TProdutoDTO = class
  private
    FId: Integer;
    FDescricao: String;
    FPreco: Double;
    FCategoria: TCategoriaDTO;
  public
    property Id: Integer read FId write FId;
    property Descricao: String read FDescricao write FDescricao;
    property Preco: Double read FPreco write FPreco;
    property Categoria: TCategoriaDTO read FCategoria write FCategoria;

    constructor Create;
    destructor Destroy; override;
    class function New: TProdutoDTO;
  end;

implementation

{ TProdutoDTO }

constructor TProdutoDTO.Create;
begin
  FCategoria:= TCategoriaDTO.New;
end;

destructor TProdutoDTO.Destroy;
begin
  FCategoria.Free;
  inherited;
end;

class function TProdutoDTO.New: TProdutoDTO;
begin
  Result := Self.Create;
end;

end.
