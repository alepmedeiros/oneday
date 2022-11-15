unit autenticacaoapi.backend.model.usuario;

interface

uses
  SimpleAttributes;

type
  [Tabela('USUARIOS')]
  TUser = class
  private
    FId: Integer;
    FNome: String;
    FCpf: String;
    FEndereco: String;
    FEmail: String;
    FTelefone: String;
    FDataCadastro: TDateTime;
    FSenha: String;
  public
    [Campo('ID'), PK, AutoInc]
    property Id: Integer read FId write FId;
    [Campo('NOME')]
    property Nome: String read FNome write FNome;
    [Campo('CPF')]
    property Cpf: String read FCpf write FCpf;
    [Campo('ENDERECO')]
    property Endereco: String read FEndereco write FEndereco;
    [Campo('EMAIL')]
    property Email: String read FEmail write FEmail;
    [Campo('TELEFONE')]
    property Telefone: String read FTelefone write FTelefone;
    [Campo('DATACADASTRO')]
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;
    [Campo('Senha')]
    property Senha: String read FSenha write FSenha;

    class function New: TUser;
  end;

implementation

{ TUser }

class function TUser.New: TUser;
begin
  Result := Self.Create;
end;

end.
