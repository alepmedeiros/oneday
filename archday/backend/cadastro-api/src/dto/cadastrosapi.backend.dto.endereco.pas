unit cadastrosapi.backend.dto.endereco;

interface

uses
  cadastrosapi.backend.dto.enumerados;

type
  TEnderecoDTO = class
  private
    FId: Integer;
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FCidade: String;
    FBairro: String;
    FEstado: String;
    FTipo: TTipoEndereco;
  public
    property Id: Integer read FId write FId;
    property Logradouro: String read FLogradouro write FLogradouro;
    property Numero: String read FNumero write FNumero;
    property Complemento: String read FComplemento write FComplemento;
    property Cidade: String read FCidade write FCidade;
    property Bairro: String read FBairro write FBairro;
    property Estado: String read FEstado write FEstado;
    property Tipo: TTipoEndereco read FTipo write FTipo;

    class function New: TEnderecoDTO;
  end;

implementation

{ TEnderecoDTO }

class function TEnderecoDTO.New: TEnderecoDTO;
begin
  Result := Self.Create;
end;

end.
