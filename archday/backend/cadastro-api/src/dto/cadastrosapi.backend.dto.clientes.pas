unit cadastrosapi.backend.dto.clientes;

interface

uses
  System.Generics.Collections,
  cadastrosapi.backend.dto.enumerados,
  cadastrosapi.backend.dto.endereco;

type
  TClienteDTO = class
  private
    FId: Integer;
    FNome: String;
    FEmail: String;
    FTelefone: String;
    FTipo: TTipoPessoa;
    FCpfCnpj: String;
    FEndereco: TObjectList<TEnderecoDTO>;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;
    property Telefone: String read FTelefone write FTelefone;
    property Tipo: TTipoPessoa read FTipo write FTipo;
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;
    property Endereco: TObjectList<TEnderecoDTO> read FEndereco write FEndereco;

    constructor Create;
    destructor Destroy; override;
    class function New: TClienteDTO;
  end;

implementation

{ TClienteDTO }

constructor TClienteDTO.Create;
begin
  FEndereco:= TObjectList<TEnderecoDTO>.Create;
end;

destructor TClienteDTO.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

class function TClienteDTO.New: TClienteDTO;
begin
  Result := Self.Create;
end;

end.
