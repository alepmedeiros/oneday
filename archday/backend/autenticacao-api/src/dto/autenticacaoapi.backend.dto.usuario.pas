unit autenticacaoapi.backend.dto.usuario;

interface

uses
  System.SysUtils,
  system.DateUtils;

type
  TUserDTO = class
  private
    FNome: String;
    FCpf: String;
    FEndereco: String;
    FEmail: String;
    FTelefone: String;
    FDataCadastro: TDateTime;
    FId: Integer;
    FSenha: String;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Cpf: String read FCpf write FCpf;
    property Endereco: String read FEndereco write FEndereco;
    property Email: String read FEmail write FEmail;
    property Telefone: String read FTelefone write FTelefone;
    property Senha: String read FSenha write FSenha;
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;

    class function New: TUserDTO;
  end;

implementation

{ TUserDTO }

class function TUserDTO.New: TUserDTO;
begin
  Result := Self.Create;
end;

end.
